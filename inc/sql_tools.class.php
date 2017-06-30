<?php
	class sql_tools_class
	{
		private $host="localhost";
		private $database="messagefk";
		private $usr="rao";
		private $password="raoyg980";
		private $conn;
		
		public function __construct()
		{
			$this->conn=mysql_connect($this->host,$this->usr,$this->password);
			if(!$this->conn)
			{
				die(mysql_error());
			}
			if(!mysql_select_db($this->database,$this->conn))
			{
				die(mysql_error());
			}
			mysql_query("SET NAMES utf8") or die(mysql_error());
		}

		/**
		 * 将资源存到数组arr中再返回
		 * 是为了即时释放资源
		 * 
		 * @param unknown $sql
		 * @return arr
		 */
		public function execute_dql($sql)
		{
			$res=mysql_query($sql);
			if(!$res)
			{
				die(mysql_error());
			}		

			$arr=array();
			while($row=mysql_fetch_assoc($res))
			{
				$arr[]=$row;
			}
			$this->free_resource($res);
			return $arr;
		}
		
		/*
		 * 以下标数组返回
		 */
		public function execute_dql2($sql)
		{
			$res=mysql_query($sql);
			if(!$res)
			{
				die(mysql_error());
			}
		
			$arr=array();
			while($row=mysql_fetch_row($res))
			{
				$arr[]=$row;
			}
			$this->free_resource($res);
			return $arr;
		}
		
		/**
		 *考虑分页的查询
		 *$sql1 类似 "select count(id) from goods".
		 *$sql2 类似 "select * from goods limit ……" 
		 */
		public function execute_dql_page_division($sql1,$sql2,$page)
		{
			$res=$this->execute_dql2($sql1);
			$row=$res[0];
			$page->setRow_count($row[0]);
			
			$res=$this->execute_dql($sql2);
			$page->setRes_array($res);
			$row_count=$page->getRow_count();
			
			$page_size=$page->getPage_size();
			$page->setPage_count(ceil($row_count/$page_size));
			
		}
		
		
		public function execute_dml($sql)
		{
			$res=mysql_query($sql);
			if(!$res)
			{
				die(mysql_error());
			}
			return $res;
		}
		
		public function free_resource($res)
		{
			mysql_free_result($res) or die(mysql_error());
		}
		
		public function __destruct()
		{
			if(!empty($this->conn))
			{
				mysql_close($this->conn);
			}
		}
		
		
		
		
		
		
		
	}
	
?>





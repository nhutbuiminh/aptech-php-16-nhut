<?php
include('database.php');
class M_tintuc extends database{
    function getSlide(){
    $sql = "SELECT * FROM slide";
    $this -> setQuery($sql);
    return $this->loadAllRows();
    }

    function getMenu(){
        $sql="SELECT theloai.*, GROUP_CONCAT(loaitin.id,':',loaitin.Ten,':',loaitin.TenKhongDau)as LoaiTin FROM theloai JOIN loaitin on  theloai.id = loaitin.idTheLoai GROUP BY theloai.id
        ";
        $this->setQuery($sql);
        return $this->loadAllRows();
    }
};
?>
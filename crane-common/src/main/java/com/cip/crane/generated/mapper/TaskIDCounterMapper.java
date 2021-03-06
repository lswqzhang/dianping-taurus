package com.cip.crane.generated.mapper;

import com.cip.crane.generated.module.TaskIDCounter;
import com.cip.crane.generated.module.TaskIDCounterExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TaskIDCounterMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int countByExample(TaskIDCounterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int deleteByExample(TaskIDCounterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int deleteByPrimaryKey(String taskid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int insert(TaskIDCounter record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int insertSelective(TaskIDCounter record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    List<TaskIDCounter> selectByExample(TaskIDCounterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    TaskIDCounter selectByPrimaryKey(String taskid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int updateByExampleSelective(@Param("record") TaskIDCounter record, @Param("example") TaskIDCounterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int updateByExample(@Param("record") TaskIDCounter record, @Param("example") TaskIDCounterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int updateByPrimaryKeySelective(TaskIDCounter record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskIDCounter
     *
     * @mbggenerated Thu May 15 16:53:11 HKT 2014
     */
    int updateByPrimaryKey(TaskIDCounter record);
}
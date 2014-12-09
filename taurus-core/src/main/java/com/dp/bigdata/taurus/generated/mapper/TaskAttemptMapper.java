package com.dp.bigdata.taurus.generated.mapper;

import com.dp.bigdata.taurus.generated.module.GroupTaskExample;
import com.dp.bigdata.taurus.generated.module.Task;
import com.dp.bigdata.taurus.generated.module.TaskAttempt;
import com.dp.bigdata.taurus.generated.module.TaskAttemptExample;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TaskAttemptMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int countByExample(TaskAttemptExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int deleteByExample(TaskAttemptExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int deleteByPrimaryKey(String attemptid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int insert(TaskAttempt record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int insertSelective(TaskAttempt record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    List<TaskAttempt> selectByExample(TaskAttemptExample example);
    
    List<TaskAttempt> selectByGroupAndStatus();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    TaskAttempt selectByPrimaryKey(String attemptid);
    
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int updateByExampleSelective(@Param("record") TaskAttempt record, @Param("example") TaskAttemptExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int updateByExample(@Param("record") TaskAttempt record, @Param("example") TaskAttemptExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int updateByPrimaryKeySelective(TaskAttempt record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TaurusTaskAttempt
     *
     * @mbggenerated Mon Apr 28 17:39:50 HKT 2014
     */
    int updateByPrimaryKey(TaskAttempt record);


    public TaskAttempt getAttemptById(@Param("attemptId")String attemptId);

    public ArrayList<TaskAttempt> getAttempts(@Param("now")String now);
    public ArrayList<TaskAttempt> getAttemptsByStatus(@Param("now")String now,@Param("status")String status);
    public ArrayList  getTaskLoadHost(@Param("start")String start,@Param("end")String end);
    public ArrayList getRunningTaskLoadHost();
    public ArrayList getFailedTaskLoadHost(@Param("start")String start,@Param("end")String end);
    public ArrayList getUserTasks(@Param("user")String user,@Param("start")String start,@Param("end")String end ,@Param("status")int[] ids);
    public ArrayList<GroupTaskExample>  getGroupTasks(@Param("user")String user,@Param("start")String start,@Param("end")String end ,@Param("status")int[] ids );
    public HashMap<String, String> isExitTaskId(@Param("taskId")String taskId);
    public TaskAttempt isExitRunningTask(@Param("taskId")String taskId);

    public int deleteDependencyPassTask(@Param("taskId")String taskId,@Param("status")int status);
}
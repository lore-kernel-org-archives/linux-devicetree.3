Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BB33710F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726733; cv=none; b=lbkb8MdE2ZT0sAEoagq6o1vjV4o9Sc2BL/Y/lAwMNexpjPpUJe9EIlo3IKXsvJxX3Di2+k9s+BfHQNvr0i/zLk5hsOaTBmu7J1NBzbf0NjMxbmF1I/aAPUr3fEeuMSxsMliI0EhZF++6AGoiRpl4EJ6dQXmIebk8D46wVqxlpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726733; c=relaxed/simple;
	bh=4IieXXms1p1gfOioTqtDOKOk3guJJDfKS5sMIoBJoB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcDtYF+Hc3ekISxt6nTIgodu0rVus2WqFJhyK59UFDXxZlJzfr4Nk+/z7sMVqiboSULeMRA8At4HAPXltvKTH7W4FofPEz/uUK1HXQDwjheC7ymBEDISirfhPPAu1FxM5NE5RGzvrHPFKmc7E18uRE1xtTihvYyQyl7U9O4uUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+mOUJDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXmFaMeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+mOUJDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXmFaMeb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDGs0o855683
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t92sHQ3r2Zo5yUGZYA616k96KB+vYRtuXV7WBIaLpwo=; b=m+mOUJDPjg2dm3No
	U/Kcv238LaxbZ3BRewptP/tvl5gaXLWg3EKWtj46QU8sLyhn4m5ehoqJjA74MGgb
	obKaISoQUsfE5Nm1PPOOUMvqs2MLPAXLS+8wg7wyT09oix3xBBNHWbfea0SPK9X0
	wnz6s9Pr1hR/sXJe57qz2V+OZQWR7ryebY+/c3l5xm62nSIQ9aiXeNzEl8tcFOa5
	FemrJUW441HlCn7JY97ss6qq9miZNCBnM5u3ZYxD4ZYjE35RUeprC1/gd2t0yg7B
	ri4GgjmMjmv4hKn8LaqMIOcdr23vjtEAuFwLBSfW4oXAL1Qg1V5+Eof3cBUuhrJj
	ywKgnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm1010c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:25:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso3378015a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726728; x=1785331528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t92sHQ3r2Zo5yUGZYA616k96KB+vYRtuXV7WBIaLpwo=;
        b=IXmFaMeb284ePVTQroTBf5+1hZWJvs14Y7izV93elyth/eqM5rPL0lkkxfwbbk8Xgi
         jKk+hw7ZHOhoAHDEqI2BvU5kj5EYJ/CEVWteqJxPTVlc2KK3ELD25Di7NcZ2cWBNXyYA
         ccuHhf3SmX+W5MKzb8xokyzIp8iWZNc10uvFOHsRRi4WrhWwCHzMbMKd0gjToDxkrOWs
         OqpQYkuaeFKHv5A1RISJDsKLqbJCDf611DJ1z6vp+o6n8OF8klbEcStgqNDKJLWDVRMh
         L7Mhe6cVHgdZ0R7e6QiasizIO2RZQTSso10ejPh5PxVld1Gz8KQORngl+WHXB8M+eExQ
         LDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726728; x=1785331528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t92sHQ3r2Zo5yUGZYA616k96KB+vYRtuXV7WBIaLpwo=;
        b=JcLHHOditwK2YTy2yvPCCAbE4iE6Ux7jHhUhKDrjWXHbvtQZjrtOjd52A6D7gooiVK
         3rz12qyIA06EsWigj0NGHevK55PpATfWkemNdViG7bd5Jy23akAkle0TM2B6L8Ir0XyJ
         CJQuzhohim9xn2e1h8pRQRp1P9glPwtsjmW0Wr9vPogogLqOIOVkYfWltJvbhdzJl6Qo
         wzFcJ+0wEE5uYu/Tl08XrEtRmIgrjuOJ7JJEGR55JjLWGunK5f8ScyPK/57n/EenyAVo
         QGSLTqMUGRlHggBMhWFYiAmBNKVvGre4zZW3V6aDTalkZ4SgXZNV1VzVkcTTLqjniy8T
         uwlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6tfVqp4ouVsrqkTan2PWY52iMV5nJBhEcFwpL0fGYsDV2to2Hm76EmiiXRvXoRe8NYtx06h9Hz70P@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrSlfaLZe74z963yawZaBxS/PTLWDG3mtJqbaJEduSKFF8+5d
	e196ziHpiLgE0BGHDaLqo9pKLjss47aVavt/OlgnzWZJfkz90p1uSRQ3cnKsVWgsOF/wcJzD3f6
	3xr/hBZncdqvX1QQ3qcx0tJxRmhdVktiK2cWbIv7PuEpAW3/inmUNHX+0zAWX/NZ/
X-Gm-Gg: AR+sD12xtXYZ4G6sbRjyAa/OraIeAIgLYjXyD8CV8aCzSH5+noBY5dg+tXIYEVrQVZu
	GCcJdagv9YykmUOaD74mNWDagFaHJbVjPkZP5k0eC4XVye8h5kJazUaF+PCd3re0gTk8lZ3ldqI
	+i+CIiSImJEFdKEctDC2j/tvaBzfC5idmaNIP+ScTpnm0eevInVkgtADdHqPkMwr47B/0VrtkXX
	xuXJxJlcJa4gUvMZZw3JYkCbcc8lKl+peCJVbfZRPebhCsz9jpjfQS04qISRQTvj1JJgyOwkDaX
	ewByFb7WiktRq7NxzSVWasemr7tCrF03o2ASSVJjITMq1oD+2ijSxty0TBRf/jekg6meBg8SGWj
	G3gEKbUcWGzroxHHZu17DVG21or6E9Txx
X-Received: by 2002:a05:6a21:1f81:b0:3c3:7fff:ba72 with SMTP id adf61e73a8af0-3c3adb11581mr26037673637.70.1784726728198;
        Wed, 22 Jul 2026 06:25:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:3c3:7fff:ba72 with SMTP id adf61e73a8af0-3c3adb11581mr26037628637.70.1784726727582;
        Wed, 22 Jul 2026 06:25:27 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.235.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm9354845eec.6.2026.07.22.06.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:25:27 -0700 (PDT)
Message-ID: <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:55:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
 <20260721064826.903A91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260721064826.903A91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX5s4HEA0pjfEL
 6NiOStG5vaKC+mNogcBZ+cJ2u0SEKB4v/p83xzc79aqGeNfokS+IoHFG97gDPZLlDe7Bd98Ff1b
 Vc/RUYPueggAMs50E84mQHjRSBU0KG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX5WX4/SaoMYV0
 ICqEfK1488jshvrzcXMe4+apzREMqqr0yBXMwb+nN0HH5HcL5ErjN4d3QsaGqBY7Ztx9tmPVnyV
 BLVf2SwT0U8xryL9IbK9LY3zMoDxGdlstyFRFOG4YWE6eUNJefpaguSJp/ruUjxysfISLsmajir
 lR6cX/YfzkKWiEeCfuiWUIJc0CO4U3GPgFhrILXISN062KoGl7YrpV/hdL6yBJz8jfMXBoR2ky+
 6WMIZn30BtVLtxEfKeVbXUIIMPm93ZYS6R+tMfHaWtqJ7i2Cxug1Jwr3xtfD1leB8uqTahdSBzB
 ZUK7ZyFHPiXdo+ae+RXS9hvk7C3mKHPZ6x1N2XEEIG3vJXKhgq3ZlYv8/MM/IsF3ZWXvTcDbf84
 +zHXAJUtdKgsZYuqymgwTkxdkWk0AeB+95SaO6V9Rs2K6S+WJl6ASjFqa1/8V1aKm5T1MXdcc2F
 xRIQP3htOeD659L8kXA==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60c4c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/HV6WY1oXUpe+KOgORLkYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Fc8GeCVxlpIC49RtE6sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TnLy7mxeGrhfHZObR9WgaYBdashuh3pG
X-Proofpoint-ORIG-GUID: TnLy7mxeGrhfHZObR9WgaYBdashuh3pG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130



On 7/21/2026 12:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Data race on `tmd->cur_state` between `qmi_tmd_register()` and `qmi_tmd_set_cur_state()` causes thermal mitigation state desynchronization.

this looks false positive, as the QMI request path is serialized by
qmi_tmd_cli->mutex in qmi_tmd_send_state_request().
> - [High] The `mitigation_device_list_len` field in `struct tmd_get_dev_list_resp` is defined as a `u8`, causing a 3-byte out-of-bounds write when decoded by the QMI framework.

will fix this.

> - [Medium] Current state is not capped to the new maximum state during firmware restart synchronization.

This is a false positive for this firmware interface. 
max_mitigation_level is stable for a given TMD endpoint across service 
restarts.

> - [Medium] Improper dependencies prevent COMPILE_TEST coverage and force dependencies to become built-in.

The COMPILE_TEST concern is not relevant here. This driver is 
Qualcomm-specific and depends on ARCH_QCOM.

> - [Low] Building with CONFIG_THERMAL=m and CONFIG_QCOM_QMI_TMD=y causes a linker error.

This configuration is not possible in this tree. THERMAL is a bool 
symbol in drivers/thermal/Kconfig, not a tristate.

> --
> 
> --- Patch [2]: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 977e2b6f2dd6931cec0ac743a4bead6a6e561872
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> This commit adds support for QMI-based Thermal Mitigation Device (TMD)
> cooling devices provided by remote subsystems. It introduces a driver
> that discovers the TMD service via QMI, registers cooling devices for
> available mitigation endpoints, and forwards state updates.
> 
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index fd4d4ecd2df0f..5c38d598e4864 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -319,6 +319,17 @@ config QCOM_QMI_HELPERS
>>   	tristate
>>   	depends on NET
>>   
>> +config QCOM_QMI_TMD
>> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
>> +	depends on ARCH_QCOM && NET
>> +	select QRTR
>> +	select QCOM_QMI_HELPERS
> 
> [Severity: Medium]
> Does defining this as a boolean rather than a tristate force the selected
> tristate dependencies (QRTR and QCOM_QMI_HELPERS) to become built-in when
> enabled?
> 
> Also, since the depends line strictly requires ARCH_QCOM, does this prevent
> the COMPILE_TEST coverage from working on other architectures?
> 
> [Severity: Low]
> If the kernel is configured with THERMAL=m and QCOM_QMI_TMD=y, will this
> cause a linker error due to the missing THERMAL dependency?
> 
>> +	help
>> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> 
> [ ... ]
> 
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 0000000000000..b31046241af8b
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
> 
> [ ... ]
> 
>> +struct tmd_get_dev_list_resp {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 mitigation_device_list_valid;
>> +	u8 mitigation_device_list_len;
>> +	struct tmd_dev_list
>> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
>> +};
> 
> [Severity: High]
> Since the QMI framework decodes QMI_DATA_LEN elements by writing 4 bytes
> (sizeof(u32)), does defining this length field as a u8 cause a 3-byte
> out-of-bounds write?
> 
> Could this memory corruption overwrite the first few bytes of the
> mitigation_device_list array during decoding?
> 
> [ ... ]
> 
>> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +	int ret;
>> +
>> +	if (state > tmd->max_state)
>> +		return -EINVAL;
>> +
>> +	/* cur_state is protected by thermal core's cdev->lock */
>> +	if (tmd->cur_state == state)
>> +		return 0;
>> +
>> +	ret = qmi_tmd_send_state_request(tmd, state);
>> +	if (!ret)
>> +		tmd->cur_state = state;
>> +
>> +	return ret;
>> +}
> 
> [ ... ]
> 
>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>> +			    const char *label, u8 max_state)
>> +{
>> +	struct device *dev = qmi_tmd_cli->dev;
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!strncasecmp(tmd->name, label,
>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>> +			goto found;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev)
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> 
> [Severity: Medium]
> If the remote QMI service restarts and advertises a lower maximum mitigation
> level than before, will this send the old uncapped state to the firmware?
> 
> Should we clamp the current state to the new maximum state before sending
> the request?
> 
> [Severity: High]
> Can a concurrent thermal state update cause a race condition here?
> 
> If qmi_tmd_register() runs in the workqueue context and reads the state without
> a lock:
> 
> qmi_tmd_svc_arrive()->qmi_tmd_register()
>      return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>      
> And qmi_tmd_set_cur_state() concurrently updates the state:
> 
> qmi_tmd_set_cur_state()
>      ret = qmi_tmd_send_state_request(tmd, state);
>      if (!ret)
>          tmd->cur_state = state;
>          
> Could qmi_tmd_register() end up sending a stale state to the firmware, causing
> the remote mitigation state to become permanently desynchronized?
> 
>> +
>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>> +						       label, tmd, &qmi_tmd_cooling_ops);
>> +	if (IS_ERR(tmd->cdev)) {
>> +		int ret = PTR_ERR(tmd->cdev);
>> +
>> +		tmd->cdev = NULL;
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
> 


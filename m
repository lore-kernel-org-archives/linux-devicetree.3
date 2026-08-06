Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887E385515
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031340; cv=none; b=tiYeL6rulyv4Ljo4ms9+WtTPkhdJXHOYMWYN2lApbTfPFcogKDXGGMoPVFCYrP1KC0pH4qTUwSMYqKUeX0In981VLGliqE/t86lsTXHS1Zf7rUH5TZJoJu31bYh6uk2+F3QnCvyCaKttUBgakGLH6KG4r2gw2OojGEmfStF8tpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031340; c=relaxed/simple;
	bh=v5TDmuQpqA82E3dy438qJQ0HCn9njcWZXH83JntM5Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWMbdSjyKNe51FxMpfpjqWuaYvQ7fRh1MfUr5vcuFrMFizqqEnf2FBcZxP9WmG5M2wB27BW3iBgFmzDB/CaWGE4maXLv6OzwwoSJRbX2NOuq4XtCCjH1aPJyDagSdKOz6szI170ZWUiYbjqeNBhD7+Our302BGIIojdJ7BqfG5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9rP6uxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNHboq9z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9rP6uxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNHboq9z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EnUKI2320467
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 15:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZXBp15b585BWkwKGjEqMmNg+nscR5MNbxgZpGEOoco=; b=Y9rP6uxZ6jARpBXU
	smu8lSXunEjdNphRzEeAMayE3zW53ucXz2fdkQtZP3wJSjiFsKBhukXdQbmnUtIh
	Q02vCqSwBmh+0uAk1jxauEa9h8fJeHojNQ8dm0RGAYwmOWRlbtCb4rcDFggYzy6H
	qswN8fjZ5eeAjDye88DJ+4kAdEfHJR1A3AMlKm67FgUMCxITGkNo+HcCzXtj1jC/
	TFFmMnWNzzf07ef5w6aeT27ww/lvJVkke8Wcjcl4uUqESCc1OxyJYHzsW3KhWT+4
	qpKFKWLDod/mpE6KejN5xy/1e2v0ERbkNE2B4eyRsin7aB1mZM+Trt7TWfwkiIw2
	v9Uh3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntnjbvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 15:48:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930dda91cbdso394662985a.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786031337; x=1786636137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZXBp15b585BWkwKGjEqMmNg+nscR5MNbxgZpGEOoco=;
        b=MNHboq9zJATk7wg0GOS9Xh5mnKV/bOi9WeC1Tw52o9o9l/v1nAs56OAyKeqRlNHdkM
         BKiIYxhD6YSf2PSuQSJpOnN9LAh7xNP1qjLw/tDzF8DzbK0JVP5FLNWJFd7J5ROGbXGf
         6dTvQyz8k7O6ELERf4yYeGLRA/HuMwhYI4FCtgcQFQjQ7JUzsL816UytgqwGXRk8vs+U
         flRVf3d6ZQE5+t2jc8YuwKAbz+7hUwxoC9e6zgcsFqt2X27IRiFtFekUsZ+x6uebF+g1
         igbz4dNJEXGG+ZVOZ2NtVl3IvtYDcMY5WWpyGRugwstR4tUbeojca5tBJ5krJ2T+C+vb
         p6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031337; x=1786636137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZXBp15b585BWkwKGjEqMmNg+nscR5MNbxgZpGEOoco=;
        b=Wrmmom3t5gytIc/Qzd51CGRzNkhc68+JDKjNjYT9Zv3B6FQgS4EJCirc90hcsoIWgY
         1Rj0zRuMbg7B9VYem+PIAkQ8BOfWZJW/vQe6M4rUnyxM4xdcPNi8xUPUyg8gBifeFgiC
         77Ns6fuDrVFVHhfyhWtxOo4CSr3xxREEOz6aOCsHUcmHkjW7rNxik5Hjh0U6NvfNJ1ws
         NzDFiBE1+x2fLG/3Pb3xHIhbJGAJCduJjQS/ClndaIhQP3Iyc6W7xWe+fi1jR52+k+WE
         Iasj6dlfvEfiPnmhuKnJQq3lWCugXZBPp4/GKwE5zvvZv/u15Pe53E/liqDbaNcTvq5y
         8pAQ==
X-Gm-Message-State: AOJu0YxxmDUbisnEcl6TUbwAfCn0XKtzlFnAcwfA/36TD7jT787/ChVR
	UlsYRS2KqZXpZrvA7H+4FUDk5QHl0/ttnmtOepisHbO2+GzAaKKjlAy0fxdXloe4g9pIklR5I9G
	rZhbqCqb+/EiOdVSH1otgnyzMZRoR2T32Q9O4pEqCn7hE3ZrsikVq3lHKSRbKVyey
X-Gm-Gg: AR+sD1146jIutNwnrsi5X50Nn9A5eIVNU6eS5KlD96Xl7ker7ecpjXevcQ3fuZnO1e6
	D7PVuGSSMrN29s0qY5ncymVdQtHfnuKSzE99CHGzOeLuIjhr7irFggUuUSX7lDReYlVXcXTKjWG
	y5IOw5H8A5KtsvFYxnHAw/KWG+e5H1o1bvID9IG6x8nW9nziOs0D5m4Md/TmtYJY7VeEHWQnCIV
	kOAyIG/hs4zVOC/SOAgBBGQmDrr7Bm9V1I5b8MkOXnG+7BLCOSrfdKAsMgbzc7P6kz+qfpo3Hkv
	NPHbJUYI9jqWTfZko135z72tkbIVbLUMuXDSR0xLZKxQByn4viUHCAhuqFkvFaC1ApHpJHNwUwO
	PN/W/k8KLUQZrYp/pW24IuDRxHH16gwU=
X-Received: by 2002:a05:620a:a10f:b0:92e:bd39:9993 with SMTP id af79cd13be357-936491af165mr1370752585a.31.1786031337198;
        Thu, 06 Aug 2026 08:48:57 -0700 (PDT)
X-Received: by 2002:a05:620a:a10f:b0:92e:bd39:9993 with SMTP id af79cd13be357-936491af165mr1370747385a.31.1786031336714;
        Thu, 06 Aug 2026 08:48:56 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936583cdd32sm274043585a.7.2026.08.06.08.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:48:56 -0700 (PDT)
Message-ID: <67fd2a5d-fef4-4292-b981-c930b55aafb4@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 21:18:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-2-3befd44403d5@oss.qualcomm.com>
 <20260731105316.BDBA51F000E9@smtp.kernel.org>
 <7ptv24tcqk6ym3pkiuo5y5klhv52nycwhg2zl5usxme47cmflw@pg3lays6zpas>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <7ptv24tcqk6ym3pkiuo5y5klhv52nycwhg2zl5usxme47cmflw@pg3lays6zpas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyMiBTYWx0ZWRfX0zaPC3MqZOa8
 /ACyT8ZHIPRD/qEB4imBqI0BRiTjbYFMjXJR956W8mtt7C9DDk+HTdzNhYJ7TS/qTDzUUvFEuXG
 +dIkoY0myc4Zr/Ua2t5WTvkYqBZFh2DAqy7I/an6BTnZEf6wRSkZAw0qtSG8D7uS5+dKC/lE5zU
 NcxbBFSpVvvXfi7ndWdJ79qLDeR9GjLrP8DMxbhgs8KXXE87xxAGLX8OHOEf8ysMVEWhqlxXtBE
 j5sSaP1cgZ1ZDJm88zI91Q6UbGsBaGIAskGesBGdWcM1b0Q24CrS1LPAfuX4U+TB0bvBtKaFtaI
 jJoB6y7GVYrKqrylafs7S5cjpas9zRYf67ex+oo353XlGo2CPPTW6dl24DGVTZU1pcB0qLfTlf/
 9QkUANlj89DixRruNrpl2L/hcKkZipx3KDLeebVwm81dRgId+9KND1SnfdrSq4GvD81uM1vwvDj
 NpkDH1VseEfgQkTtewg==
X-Proofpoint-ORIG-GUID: yK5RiFIBg10_NfjyP4o2gc34s9_Zspa4
X-Proofpoint-GUID: yK5RiFIBg10_NfjyP4o2gc34s9_Zspa4
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a74acea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=PaKyr2AS0Ek1y2y1GKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyMiBTYWx0ZWRfX8HmFUhl7AodJ
 TKD8hYJs2Zvb4tuR6NTIegR0W8QOBHMgP0ha7vuPsXengCqmSRxlfsK6swOYSxbbKm9EpHTRxfA
 o7/YsNzJEcYwbQyH9QPO+DRKaqbn3M0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060122



On 8/6/2026 3:10 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 10:53:16AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Returning success without saving the requested mitigation state when QMI is disconnected permanently loses thermal mitigation updates.
>> - [Medium] TOCTOU race condition when reading `tmd->cur_state` during service reconnection causes permanent thermal state desynchronization.
>> --
>>
>> --- Patch [2]: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
>> commit 02c2244c0a2cebd6be4e1bf4e41d51362be19b5f
>> Author: Casey Connolly <casey.connolly@linaro.org>
>>
>> soc: qcom: Add QMI TMD support for remote thermal mitigation
>>
>> This commit adds support for Qualcomm Messaging Interface (QMI) based
>> Thermal Mitigation Device (TMD) cooling devices provided by remote subsystems.
>> It allows client drivers to discover the service and forward cooling state
>> updates to remote processors.
>>
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 0000000000000..37e6ef19a0b34
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
>> [ ... ]
>> @@ -236,25 +236,54 @@
>>> +/* Notify the remote subsystem of the requested cooling state */
>>> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
>>> +{
>>> +	struct tmd_set_level_resp resp = { 0 };
>>> +	struct tmd_set_level_req req = { 0 };
>>> +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
>>> +	struct qmi_txn txn;
>>> +	int ret = 0;
>>> +
>>> +	guard(mutex)(&qmi_tmd_cli->mutex);
>>> +
>>> +	if (!qmi_tmd_cli->connection_active)
>>> +		return 0;
>>
>> [Severity: High]
>> Will returning 0 here without saving the new state to tmd->cur_state cause
>> thermal mitigation updates to be permanently lost?
>>
>> If the thermal core requests a new state while the remote QMI service is
>> down, this returns success but drops the state update. When the service
>> reconnects, qmi_tmd_register() will re-send the old tmd->cur_state to the
>> hardware.
>>
>> Could this leave the hardware running unmitigated while the thermal framework
>> believes it is actively mitigating?
> 
> Please address at these comments.
> 

thanks, checking these comments. will update on this.

>>
>> [ ... ]
>> @@ -298,34 +327,33 @@
>>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>>> +			    const char *label, u8 max_state)
>>> +{
>>> +	struct device *dev = qmi_tmd_cli->dev;
>>> +	struct qmi_tmd *tmd;
>>> +	int index;
>>> +
>>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>>> +		tmd = &qmi_tmd_cli->tmds[index];
>>> +
>>> +		if (!strncasecmp(tmd->name, label,
>>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>>> +			goto found;
>>> +	}
>>> +
>>> +	dev_dbg(qmi_tmd_cli->dev,
>>> +		"TMD '%s' available in firmware but not specified in DT\n",
>>> +		label);
>>> +	return 0;
>>> +
>>> +found:
>>> +	tmd->max_state = max_state;
>>> +
>>> +	/*
>>> +	 * If the cooling device already exists then the QMI service went away and
>>> +	 * came back. So just make sure the current cooling device state is
>>> +	 * reflected on the remote side and then return.
>>> +	 */
>>> +	if (tmd->cdev)
>>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>>
>> [Severity: Medium]
>> Is there a race condition between reading tmd->cur_state here and concurrent
>> updates from the thermal core?
>>
>> When the QMI service reconnects, tmd->cur_state is read outside of the
>> qmi_tmd_cli->mutex. If a thermal trip point is crossed concurrently, could
>> the following sequence occur:
>>
>> CPU1: qmi_tmd_register()
>>    reads tmd->cur_state (e.g., state A) locklessly
>>    
>> CPU2: qmi_tmd_set_cur_state()
>>    acquires qmi_tmd_cli->mutex inside qmi_tmd_send_state_request()
>>    sends state B to hardware
>>    updates tmd->cur_state = B
>>    releases mutex
>>    
>> CPU1: qmi_tmd_send_state_request(tmd, state A)
>>    acquires qmi_tmd_cli->mutex
>>    sends stale state A to hardware
>>    reverts tmd->cur_state = A
>>
>> Will this overwrite the new state on the hardware and cause the thermal
>> framework's view of the mitigation state to become desynchronized?
>>
>>> +
>>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>>> +						       label, tmd, &qmi_tmd_cooling_ops);
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com?part=2
> 


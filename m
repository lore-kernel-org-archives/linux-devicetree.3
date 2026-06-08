Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC836F8EF
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897190; cv=none; b=s1xWQPJH9bIDGiX3Dz4+gt1WW8YTgm2+PTTGz3Vx9daLLSrrM4lcu8WVQzBKJXZ+4+SGWq1rug8P39rUkW2SeidRd4ObW2EKENYSa+GOz5f7Irpu8yAGbVPP0fZHD/BmWEf02z+1JtrhguLt55R8ErytrxZzE/KGKI/J6usSLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897190; c=relaxed/simple;
	bh=JpoZHFk7B+FNKCUvCv8J0gju7j04clYLRSjUZtit+yk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pI+3eBbhitclUkRomI42pU8zAUFOgHqzQ8j4yC3ajJpro0zpzSeZRAIGcaQTpfiKTOrfjTIw2NuQEhqytcWFZ984UB2OPNRtHtFFJZp4+jaxUVbbRcwUsqe86FLhJH9NvJK3Ho4Iavyg6s4z3Jk7uk+MCCRHly/lfdbZgWd/vPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW08KphT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sd1MZgG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZW08KphT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sd1MZgG6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580II7G1937129
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=; b=ZW08KphTphXnC36N
	GUzk0MrtCx+iw/2JCZfN8FeZf0/NRqINvL6ngXFroi7t+Un5TeQiztt/Ec/wUHX5
	0yoSUJSPjHuJf/8M1nl9nP1gPUnJpFGHnZsHEO4zPA5P6bmP6oAN8LHpitWK8b7w
	rI3XvkKgLtyeLzoj2MWCuNCpxp+cWud0aO/UbNqwXc9jPjClzRSpTlbhqu3Pvos5
	WiifpslfGwVriPt9ZRIAvt/n8t1ZKvdaXEWY/wwVGc92CLmWfD4i4H9c16v9ko+a
	un8MXP1KdZbi8LZ24S6gKudBhZI0Ter3IEPkCpQl2j6oX9PTfNs5jt7sU0ghKbvs
	+KN9lQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf64x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:39:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a366b61fso2277946a12.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897186; x=1781501986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=;
        b=Sd1MZgG62E5FFWfxasDf/jWMNxYDE/1HZwx13I2SfMT4IqXCvpxWDj4W8yOKzIhOHf
         S7vxJ1mylylJPjEG03uPkrTo+U1lDxMuYmidweNuLZzLgkTraqG20JCk2b6gxQeVm5Yo
         7qFUkHPQ9eAcE/91u2QzFcmkWnM6M7YlzxkzP7GTVRmym81qP2qDPRHbMwoyjgB9q2q4
         I4BBir/Ei9CpsCexeLB1HbfnLA2109/fm0HgMo/61FtobCpGsHJrYXy7XlWDE72kB3Fd
         rqvGlU0ml4GztmX2rDpwc8t6UydWKUFnRcKIdk7eIB3BWmzn1oLJbEXQmNxVIm6wFwE6
         NqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897186; x=1781501986;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=;
        b=MT3gmlhFv9IlOO1k9tmbuO1gRarw1KTldxvkUR6mkNYfj5fVYxfj2TqV5AXskvU/Ka
         RPBQ0TC1FtLvLoSCVpNAWuvzT1bgLkQMbctE4H0cmSrTS+kmvTPTi3E0iDO2bzUPs6cp
         oYR8/4acirBbqjr8x/ynSvz8CJRZ6sqh40R+ddRPzrAKLOz6SHiBhBHWti+bWKVwdAX4
         Zo+JjHuBziP+EfbU8+0qnruYqfZl7N8BgPuuBKL0DxHinTV+5bndvYqqszT2q0e3wzuZ
         AyPFJFX4QpJ5IhHVlrzTWOTzp3n2ZMg76qegDXWU0JGFqgKsXvzG74X3h3MOAH0emBGs
         lMkg==
X-Forwarded-Encrypted: i=1; AFNElJ96AlCOMvSfQZOLyWnOFHxPtLY2hMwilM+FtEq0k4wNCyVgwOG9ZJnppHQImdpnAtHYSBCeP1Sd+dsY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bOXNQmvKwnJsSHENeW7t5zYppZkimPhJGZc7nOIRYlCrb/22
	tUD6K9OnhmPn06WTOW//xCujOAgtRWRhINaZkp1ANev7ljusCcA+pFne42BRyIourbCYB/iztJH
	CxfZC4sAMfmFMNhbR+W22gnrp+aWGkE1NmpkyaLcgmK6pl8oN1Vce/g/rbFL0tZwI
X-Gm-Gg: Acq92OH2pdg6gDXJNEfjeQGtOyLrhyrI0Cln0isYu204wdg3DVE2K0tZj2cDa7lM9Ze
	2Zmamt6wqGHMl7mwNxY6hCquuXNLq/eSqcChulZHTwkMtUMPX64HCJ4fCcyNGqUyImvjRMD+iBi
	gKkGYlsNilMy46MXd/NBKktG4yHXIRcoe3jK2zXTPr67ofEVttRhyHQXdSLXezSwIML1n2240+8
	2POI+HxiP7cN+Qz+qPmbo1G9NGQ1vOIahiQ9Efw9vz4RGsYZYQfeLPUwO5XXs/D86jsdqrVH4KM
	iBAsvZLk3ZUMgIVsKnTRps70tY8rtzP7kx6DI31v0Fb2ye+etwGmNeyQ7JGQ+SIglaGVM66mDj8
	KkxzUDWyjvFWrTn+g/RN+ut6i9Q8KMhA6Xd8smx9hVueTZP/vbhsFN4IuhFTjl3Up
X-Received: by 2002:a05:6a21:6e04:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3b4ccd1b49cmr16495571637.4.1780897186474;
        Sun, 07 Jun 2026 22:39:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e04:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3b4ccd1b49cmr16495533637.4.1780897185956;
        Sun, 07 Jun 2026 22:39:45 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a505fsm14522572a12.20.2026.06.07.22.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:39:45 -0700 (PDT)
Message-ID: <6fb0c372-d77c-da95-5cad-c620b68c2bd3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:09:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for dual
 core platforms
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
 <20260603144434.928EF1F00898@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144434.928EF1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2655a3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8D1nwKgvKgv7XXS0Yz0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: yMbv4UBk2ITxllhcv1Pw8jby7V6beKoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX8lkIvwD7AdCV
 AD4FaG2qtmm8PD+nEaUfnsOZQpbGZQPzomigek2gMp4L/qDwH5pf8zvbSuAFPsKTUSBLCzqDB27
 6ZrjQYjFv3wwvfdGIxYM+fnochNNfFhRz+lH1+KPrT5FjRK9viGNwJA/XWnrwe37jd4Mbsu0BOg
 vbLgeCVpQb23jmy/6DeTc04shzKLK3F7nHqhRVQnArrnxmFVTWLdlMzk1DECejqt1PF6PFd2Bew
 1LjNr3AAGs9D+P8IzfFmPKFJf8liWGfCPtGtyl0VACOxy4O/xwoffhkS5mu/CVJCXm6NHnstWR/
 L9Ar8HeeyEI4kPjouaHQ3YQBRFqUuoWiqvpvgWAW4N8gtV4ZsBqyMSHh6XFi1XQWSQqf5GaWHKR
 LJHK5dYj68xtykTaVNoxWpLzrrhtoxQllpst4Uu1bf1kEf0VQMUVmNAYs7FvpPPvGlQhCWATXCr
 TKv2LHcBhttEHR0mdWg==
X-Proofpoint-GUID: yMbv4UBk2ITxllhcv1Pw8jby7V6beKoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/3/2026 8:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamic core assignment logic mutates `inst->core_id` during streaming without firmware notification and without holding `inst->lock`.
> - [Medium] Initial core assignment bypasses MBPS constraints.
> --
>
> commit 2b81abf719d22ec30cd3764b2bba16be2af15168
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add support to select core for dual core platforms
>
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index a2ea2d67f60d0..dbb89396e6514 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>>  	if (ret)
>>  		goto error;
>>  
>> +	ret = iris_set_core_id(inst);
> [Severity: Medium]
> Since this initial core assignment is driven by iris_check_session_supported()
> called just before this, does that function need to check both MBPF and MBPS
> limits?
>
> Currently, iris_check_session_supported() only calls iris_check_core_mbpf() to
> verify Macroblocks Per Frame limits. The complementary MBPS constraint check
> via iris_check_core_mbps() appears to be entirely omitted.
>
> Could this allow a session to be successfully assigned to a core that meets
> the MBPF limit but vastly exceeds its maximum processing capability (MBPS)?

Decoder doesn't know the FPS at this stage to validate MBPS.

>> +	if (ret)
>> +		goto error;
>> +
>>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>>  		if (inst->domain == DECODER)
>>  			ret = iris_vdec_streamon_input(inst);
> [ ... ]
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 65896d0c1f16b..9f8dacfa768d8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -318,6 +318,67 @@ static void iris_vpu36_program_bootup_registers(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
>>  }
>>  
>> +static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
>> +{
>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
>> +	u32 max_session_cnt = platform_data->max_session_count;
>> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
>> +	u32 core0_load = 0, core1_load = 0;
>> +	bool select_core0, select_core1;
>> +	struct iris_inst *instance;
>> +	u32 load, new_load;
>> +
>> +	inst->core_id = 0;
> [Severity: High]
> Is it safe to mutate inst->core_id here during active streaming without
> holding inst->lock?

core->lock is already acquired before control reaching here, so additional
inst->lock not required.

> This function can be reached mid-stream if a concurrent s_parm call triggers
> iris_venc_s_param() -> iris_check_core_mbpf(). Since iris_venc_s_param()
> executes without holding inst->lock, a concurrent call can clear
> inst->core_id to 0 right before iris_set_core_id() reads it during
> iris_vb2_start_streaming().
>
> Additionally, altering inst->core_id mid-stream without notifying the
> firmware (which only receives HFI_PROP_CORE_ID at stream-on) permanently
> desynchronizes the driver from the firmware.
>
> This could cause iris_vpu36_get_required_freq() to incorrectly shift the
> session's power votes to the new core while the firmware continues executing
> on the old core, potentially leading to hardware underclocking and system hangs.
>
>> +
>> +	list_for_each_entry(instance, &inst->core->instances, list) {
>> +		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);

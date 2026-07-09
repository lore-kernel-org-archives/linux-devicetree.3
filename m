Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C08199D8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601910; cv=none; b=N4inZ8FK++76IMSa9BDhViRHtdU8zjX8nxLJcS+EHdpOlZgobudfyBe5DsVlWxdc3SlzRhsIag5gzEXnu21ZS4kg9s/dNEKHI/atwCc8P81U6Bfp1qrFM4DtibgYYhGeZgzT24WaHWnC6FsunSnR0MPMmEA87plTyqQwnJWC2+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601910; c=relaxed/simple;
	bh=2ncECmYmGOQWfSlXNAejUij+wOyeq+XTZ9+N+2uYujk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AK6qUB9Cl3OoGoaQGL4MW7ICZTbX6Rss9OSrLxCliqtzwUMgtFtFpzukVEi7I+aW6dWy1V7vhh/FzVGg4iZo3gpBFEinOIjXo3yOwwdyqZkDpfdrTue3SK4sl18pYZOxI4i/GHcoEoghhPpcZGPf1BglZGr7AJIrqX8zLZK74to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRO6rqNL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxUsbcDC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRO6rqNL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxUsbcDC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDbi1575388
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6M8ToX+cI6vvxtv01dKbu6llFvdM/QyNtn4NMUQwymw=; b=QRO6rqNL7ngIgGWG
	nH0n7MpLDek89Qgyo3Blz1K2m2/sUbLwWsEDUjFyy42oMSg00tQDMo537C2FhCOG
	T1UaM9f+Rm+QYF5F2nci63FIqFkzmcslRqWQVHvD/Shq8b/zH+1aBY8rIMqN7Dua
	ciYb+EojJCnMQfrVeOvpknX3R1iqigaK1dL4bvOLT9x1XZNae5+8H3+Oip0ugasZ
	66SPN4RNPHMrANPv/vrvelv2i8kDBWYRknEq2tKVsE80jCh4FeOTmtqLydTGilLF
	n03R8CeU45slUU74D3Zfvmceuc6xrFcF3i/pACZuXc82NnN3r37S9Id9sCtPFSDY
	qUHTEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwc9jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:58:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so63310285a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601907; x=1784206707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6M8ToX+cI6vvxtv01dKbu6llFvdM/QyNtn4NMUQwymw=;
        b=BxUsbcDCnJQLLqoA2roj3EU/g2G3pTHN3uleSaqzCsEMxxLU6tgF6pWGdNiqhU3E5X
         qY+0uDvJAw+GqI8frETg+e0RO6KCe7vxqf2GT+H+xMDg+P7asMkto65RNEQsRCP7RvxQ
         i34nGsLY304IA+PM7hNFvWVWs+eCUg3UaRy74o2WJh+fBFNFJCCL5bgGW3YvkhbaUjIY
         TAQdEzgK+m1f37GAfSFXMIljoDXYA5VdrRwt0y1I3Jz3SNEyjqPxVtvsTvI6ASftysdy
         ETGiNgBDKPBO73DYUf3r55QnpG5v9Tj2zoMptLYqrjm7WPJTF2OlScHfsKxAav6T6Tzr
         xhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601907; x=1784206707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6M8ToX+cI6vvxtv01dKbu6llFvdM/QyNtn4NMUQwymw=;
        b=pDRjgFzBCNYhigZhMAjuBX8qCDrd7ql4msEQMtrLfjmmJzUw7TKHqqsuA3gzduzQNO
         xKq8NE2mWEGtPlwmaGjx8QqwOsay64pvwzavJ29ED0AeyWN++9ZOg+a0hZQpkwB71eWv
         hHvJ454/8FeZViKUoi+XELCUz1eDs6u/1toB46H5BfphA+KUlLcz2pCckjuf+WE3kISC
         DZdzI6/aYQQE0VOH4sE/gqaTgoLeLyfR4rnq/up40RyN8j5WDgyA/zGbNa59eIhfaFhD
         tOptUt3G3WEZguOJoksluz7BDHewOWrv5szckwED550kPTVvboPlNAb+nLx5eMNLODSj
         n/ug==
X-Forwarded-Encrypted: i=1; AHgh+RqzBRnCixhwXz/E9gSn4Y4sSSh2OD07LTkGmT55Th7brP5ZONYBJeOJ1DHkDMqsGZvn/KTi3gQ4d5x8@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ77/Ym1F1ZgGoKZlr30GeO9wzTtKnQRJiEneogeUNz1/h+6Y9
	6LJwX/OZ7pqhKbpgV1exXlBM+0pHkDDwPvit3ScujAbvOcwaX4Za/3+9BQwNhAyD6R8XJ0fWbCV
	qa6aKIvwJ+c72h8k/y36vpug6UsLtTq+QJQbTeZtsyICGzGC4Eoyyj6M2B0A6xwYU
X-Gm-Gg: AfdE7cmIUv0OgNpblCMyUE2Xo7m59ls1ZAmyhhsqovg33+4dt2lme768bmtxR3NRbE4
	HyrHR6DjeWiBr3AkwayexeFhglJkci5fQNSaJ1/lNi8hpp5iqqtJLW4kfws8LAQGvnWs25etL9d
	jb2XzNSveoJadpQ8uXr4/U19Q3dIdVjeDmXv9SutX0wisQvYzmSyFgo7VcQuHaRRmjxuEfGeRfR
	QMgJVvlP4Hz059rntkXk5vuRR8Uo96olnoFRcAkbI/lrfBfcWiVtc+vzkJ+tp+WcxmvPKSC9KL1
	bx2KagO0Zmw9CzO/hjDBBtlebTQbBwl19Lp6bSfUu7i/1X3/TZfI1F30uJGQ07L6jlssG6IaEJG
	LOSZ3qLp2WjOpGYpEwuqgsO5tdJDzgo4aPq0=
X-Received: by 2002:a05:620a:178f:b0:92e:7436:5284 with SMTP id af79cd13be357-92ed7a1c5cemr287075885a.5.1783601907673;
        Thu, 09 Jul 2026 05:58:27 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:92e:7436:5284 with SMTP id af79cd13be357-92ed7a1c5cemr287073385a.5.1783601907084;
        Thu, 09 Jul 2026 05:58:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c6bd0d72sm296238466b.7.2026.07.09.05.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:58:26 -0700 (PDT)
Message-ID: <f5d0a902-5ff0-4591-bcc7-3cddb9f4d27d@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:58:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
 <21f13da7-94ee-4eb2-b2bd-6200d70f38f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21f13da7-94ee-4eb2-b2bd-6200d70f38f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX3n/JLPzv4gGm
 2HkMCkwPulXHKp9CtC2Qul5Y8XosPhka0K3A2erSgJwzoGO5lopyuWXqzLale5MyTRtI9//e3Vx
 GKhm7hfM066x2pvEeuPZgceZvwTPja9dWpFqY2d0OheqSOkr09KJVBBVkUi0jKKPG9gkKFfdtdJ
 pzou8zimb7IcrDiX+fMQKLe4zRi+wDDMe80ZhTXf456IsjCsizD5FRr2xCsBDwAP/mfZRieTOO7
 eXC8YaE0kJhz0TjVZ0NcwMbVV9GOqCwRTWgAsnxy080ko8ncDlEH4qOW1Ep+ToPikfMgQJXul3c
 LTTOD2W0oIfEMYJL/XabO3LequabuJgBnORo4AYaKLjtoF2VAivbwax2XCwR8qf4ou48UHloEDI
 8ejTt/K7oReaUrG3gHQSMTTRyWIFQZ7sxJCRFhTlqi/0vT4Is4ZKWBNnkWs2McSYRjwQrFnufKV
 JKCkgPxTD00Q/iMoyGA==
X-Proofpoint-GUID: OhgnLlk4eXGi9VcGGAOIhijHiZMnEWTZ
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f9af4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fz3elM8aSJ4FunxCNjAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OhgnLlk4eXGi9VcGGAOIhijHiZMnEWTZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX+I13sHEjDfl6
 BFy6VCI2oCOH5dZYP+swRpZgBVLA9v4H4m/X5583wcaM+lKQ1rl6LsyzdflajkeQdlcjg/DZ69y
 UecJiTrOj0IV2oP2dmWDNwzZpW/q/l4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090127

On 7/6/26 1:57 PM, Konrad Dybcio wrote:
> On 7/2/26 7:22 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
>> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)
>> +#define TIME_WINDOW_MAX			((FIELD_MAX(TIME_WINDOW_MASK_H) << 15) | \
>> +					 FIELD_MAX(TIME_WINDOW_MASK_L))
> 
> I am having difficulty correlating this mask to the register
> description I have available. Are you sure what you call
> TIME_WINDOW_MASK_L actually exists?
> 
> [...]
> 
>> +/* Constraint configuration */
>> +static const struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SoC domain constraints */
>> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
>> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
>> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
>> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
> 
> Similarly, these offsets are difficult for me to correlate with the
> register names in the constraints/0x0ef3_d000 space

They are apparently correct, I had outdated information at hand

Konrad

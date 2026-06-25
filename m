Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE173E120C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390191; cv=none; b=bSOOObT4RMtuvt3X/cG+j076lNqrWLIiqkqsiU0PhO7x00jghjwF7U5X5ewTOk7JVCBu0k2vRDbABHP5Qb9fMQWGow4vTXMN9UvA9d8I1vT+ixLMAvOdYCz52LhiPsr7Qq8NvHKIc0L9AV7zIDPstGE0/TDr3EXEUbCeIXKR8WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390191; c=relaxed/simple;
	bh=+vdm6HagNa19O/q4aTSBaU7F2pnXiENgmOZxVvccHF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faxSpzU75rzLo8qO7Lb3NFSZ/vR0UsILMvROIaLLd8rBrcsTTs4aHTvU3oHVxgMbIwZ4DMqf4x4xsyVMWyvQYiCf1JUPgLr9R4SnK3kVtQfIh5/Q38dyJzofggcsk10ekBk0MTqLs1Czc9+00h65sxhJvBD3d5FES/63qyhKCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHI/YKAv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgVHF3t4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHI/YKAv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgVHF3t4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jrH91454286
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUF5oZ4bJk9n1lNWggR+VAUllTdDgrVBFBqrq4XJb04=; b=YHI/YKAvtKrzAxrf
	roArWL82AbjPqtaoCRfukEff4t5HnDFy2rQxTN3vDe1rVfAHDCeYfFjIEo/H+Tzf
	7FJy9ICV+YoxVCSseh5q+1tscEHe6O+tLBzIkeFHrfusbh0nd2vGjDZZh9gtltBl
	WbB+KdP1y6QStfHGHdnZHBdB17jrhbjFPvIH3/DXsFfJbwl2DmK8QghvKKnlo5a+
	EeKBl+p8wyHfDeqbjaH55/vVJR8LZgQYA2bKBdKCPb1rk/SZTXbi34N2TrvM1CvB
	IgVKBAUs3zTUgCr4glSGqzYBIjJAhaEe+0oX7zMa9GsB0u5sup09PkfFPxdi3HIE
	nAO8qA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbuk66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:23:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a15cef334so2506241cf.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782390188; x=1782994988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUF5oZ4bJk9n1lNWggR+VAUllTdDgrVBFBqrq4XJb04=;
        b=bgVHF3t4OJVzGKJyBriUYkdyUjhmj7h9AFikzL53mNGjhvBzhJz9FaK0ddRrYfKIqm
         o3e/uuYcU9OS+ABGUrtYSOAFrta/tYvk2yZZvd/8KOs3cPp/BImdG6oGmq77PAECVkky
         bsQcYZNUz83LB/gUb8SojwJCbFcLiVdXjKrZpxBj9sYAzfaPnNfs2+pDZytTlaaDNl0Z
         7qpYfbe3OrLCj6UNc26f63TFuFopSHhPj9nsmweGzK87BaIXEA3OKpS5ZL6eznVE+Hsv
         fsIjM6p4eTf1NbpDNfTsB7xd5pl+4saRC4SVpRYLaD6+fFmPZuBEznxLpenCDk7yext5
         ALWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390188; x=1782994988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUF5oZ4bJk9n1lNWggR+VAUllTdDgrVBFBqrq4XJb04=;
        b=lcwhr9Wew7SuAra3OKmY+X0BwFSIuwh6dVsIlnBglijXXNnQBSdzTu9dUI8r7dwHN9
         WE8pXLz6o59LUlm8vy7Igy9rsIjO30H0iIvYdFrbQBfBt4Ki1yMbSWXKnSg28Lja7bPh
         GZmkYrZ0QB3ZRZTTt4YYHzPi/i8xOXaWbmcN+zdvBgVs/2Rw96Xojb1tn11p0xrYJXwi
         CwUjbVSCjI658/IfCQ46XuFovbqvadpOjBPuJCxrVfCtK0mJLL7lnOcUQrvWIWHFUgJv
         6h3SEIyRYJFyj+duUMuOmijbpCSKzl+qb97t21NxGmqMiwCyAVb+a0JCNpUnQ5C+oavJ
         F2Qw==
X-Forwarded-Encrypted: i=1; AFNElJ+/mPVsr/W/NcZrb0BHQ3oRjMne0EG0jkCwXNJqpsN3UiFPnZR1PNHhlPP0Ofx4LhxNOo8a8LpO+6U0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2reZk1CglzUSb0Z42nHhufgIrrTXwn4W/dhRVaA1KNjPnvfv
	smw1LYshyREaqdmLvt1Sk1V0+MjZaaAPSm+Rea/+duAKH3YD/6SJt3JR0Si5YH7Uow4uyilK35l
	xWlSjLNcHZb5z7XlfLkTategMZIJOCNnFRwtoBrHucB0M9yz0bRbRdIP3e+B5vY7Q
X-Gm-Gg: AfdE7cnsDPzvUiN9Xv1EZiIaagO3NgwF43AV++nMtH6EdjWPZIc/7bzimOtRh6BK2J8
	yp3HMpz3zVBt/STd8LkjzWQDwwDF9goMUdQUrhiS5rjp3CVaFIHZk+q4Uc3J66V1STPDFTpsAnB
	dz4jWyaYUuW9ZBIsDo8que4CaTgqERhIKyxMRgNbcjiDiOhimEJ5OFvmjToHdYdhXSZLqbawuCV
	FjrS3KT+OUYuFfMffeBWrFl7AaykmNcf3sm5kH299lbR+kzUeujjteySHgc8XRpGazo3ZI5RRVy
	s1IcGPZ3BedSebV5ZvRwSeqnMa3SE6QoLQV9QwDBwqSV3BbT1e786nwYsD7RiKRZj2bVyGJCcAb
	qf1j2Ix0N+yGsM/zBAgmjCUPdW/zhE3MdM8oDMD1zmMVBuQ==
X-Received: by 2002:a05:622a:1355:b0:519:9efb:56f6 with SMTP id d75a77b69052e-51a727f437emr17335691cf.7.1782390187474;
        Thu, 25 Jun 2026 05:23:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1355:b0:519:9efb:56f6 with SMTP id d75a77b69052e-51a727f437emr17335321cf.7.1782390187024;
        Thu, 25 Jun 2026 05:23:07 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbc2c6a9sm169899366b.28.2026.06.25.05.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:23:06 -0700 (PDT)
Message-ID: <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:23:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
 <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
 <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX2qidzfwNcVql
 QYTMzb8VutxDutTrXKqifKoOh9w67Q8ixsSxm1eoA1mzLpIoq6LHTgaIjl3TOtAvzMYSZXfj/2T
 /xpdlAsVxxdB0vDuKl566vQkiRegXA8=
X-Proofpoint-ORIG-GUID: eKm1q0QsU0d5J7MyzD5-LpV-6fxWc5vE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX8qk1t8SMWUXT
 FMXuNajKEh2cHWVw2QstOvRcbEmwukY5p8xx19W0rjHGuXx3egJjxniV8tzDFyRwLW8fMJKnFxq
 Q4NNcPiWSWF1WZxyVtOQKNt/40YuBbFS3dOQn4sDxYvljh7YdZK92aVdDvoVTc/lPaxkXVmiQZ7
 +mQJkwgoPC2bmd+8y/IbmZ8bM5Jf+l5L8k4aA5oj3iCzs+e7kBIlEfA/hxHQSbJMNRjg2eR7JNZ
 GWDYc9rII6gTRjdLjiV6IumuxCKBLDZk4TKOg8kV9BVwJwV6i5os28Nq947K9SjkYW9v45M5ZaF
 Kmm8R38aoP36kq5XX4MDu6CXdUlMHNKgynZB0Np6lNXCk1Ud1Kg2ABRpsHGB2b0GV6FANuqlPTw
 ZEJKGj6YcYrhoqZj++ePQlgjTXYYAHcAPZe4H1+1JAf79sQUjd6lo8lMG1eUJ0f1w5jSPD6Zy6e
 DOo8UjayJloVEqjyeUw==
X-Proofpoint-GUID: eKm1q0QsU0d5J7MyzD5-LpV-6fxWc5vE
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d1dac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=XGsMiajvR5-pPuaPleUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250106



On 18-Jun-26 06:37, Aaron Kling wrote:
> On Wed, Jun 17, 2026 at 5:41 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
>>> permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
>>> by aggregating bandwidth requests of all CPU core with reference to the
>>> current OPP they are configured in by the hardware.
>>>
>>> The effect is proper caches & DDR frequency scaling when CPU cores
>>> change frequency.
>>>
>>> The OPP tables were built using the downstream memlat ddr & llcc tables
>>> for each cluster types with the actual cpufreq LUT tables from running a
>>> CQ8725S device.
>>>
>>> Also add the interconnect entry for each cpu, with 2 different paths:
>>> - CPU to Last Level Cache Controller (LLCC)
>>> - Last Level Cache Controller (LLCC) to DDR
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidths
>>> ---
>>
>> [...]
>>
>>> +     cpu6_opp_table: opp-table-cpu6 {
>>> +             compatible = "operating-points-v2";
>>> +             opp-shared;
>>> +
>>> +             opp-1017600000 {
>>> +                     opp-hz = /bits/ 64 <1017600000>;
>>> +                     opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
>>
>> I think this should be * 4 in both cases since the interconnect driver
>> ignores the channel count for a node in peak voting. We may have a bug
>> in all other DTs here.
> 
> If this is confirmed, I can update this patch. I based the
> calculations on my sm8550 copy of this change, which in turn was based
> on the sm8650 change. If this is wrong, that means one piece is
> scaling 4x too quickly? Making it a power consumption issue, not a
> performance issue.
> 
>> BTW, are there no lower OPPs for the fast cores?
> 
> Not on cq8725s at least. These lists came from an AYN Odin 3 with that
> soc. I don't have any sm8750 proper devices to see if that's any
> different.

Mobile SM8750:

root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu6/cpufreq/scaling_available_frequencies
1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600 3072000 3283200 3513600 3840000 4089600

root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu0/cpufreq/scaling_available_frequencies
384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 2227200 2400000 2745600 2918400 3072000 3321600 3532800

root@qcom-armv8a:~# grep ^ /sys/bus/soc/devices/soc0/*
/sys/bus/soc/devices/soc0/family:Snapdragon
/sys/bus/soc/devices/soc0/machine:SM8750
/sys/bus/soc/devices/soc0/revision:2.0
/sys/bus/soc/devices/soc0/serial_number:<snip>
/sys/bus/soc/devices/soc0/soc_id:618

Konrad

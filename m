Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850F39732F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442009; cv=none; b=biaqKvxZKvdkVfNydP9biKH9zI0jROVqMGeC4dEjofP0J/1C5agaGooBTdxvdibXNcA3ERgBhahZjJSpR7AJ6ZPsCRYaBmEIRXmhV5Xyex/gGoi1IC+0oxi4EKOrQDllaWGw/Re7uJflc1YKXSPmtmNbBg26s96jonAtGLtz63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442009; c=relaxed/simple;
	bh=WPs1CELaB8cKKo/eZJDS1l+4Vrtrd7a0U+MH2Wyx1kg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=icY3Jo634p0oVzfQ1nHRMpGzqnuzBPnq/ACvyysKC/J6DUFEs6whTASrU36H98IANBv1ZPwfJa3AGSqt9N9TMVALKzH07PKhm53guzUFlEqa/66lXwX5A2NY/lnRKXcD/WC1s+upVn89Pw5s7hsUgsKEZ1CdWxDoWjKF2y3t1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWRlE47f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hl8IrstL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWRlE47f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hl8IrstL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8t3oF2765337
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkohdRv0hYpwmivlUhyctq3yN1gqK2kdhsTeAB33BNA=; b=GWRlE47f/yFOx3Cc
	JqhrPiKmAWZcmKD6MriMpRW8YJdUhtLMRhPN1zFHiy5eMzG4xkuPbrsLIKyVb+8H
	tmFx25Efp+l2zBgqKfx2SSXfWW/Osvo5ZM+tInBxLG9ivOkXoCGeh/M88PCeEiQJ
	HEJ4o7uaflGekxSvSstffuo1if3R4c15Y4AQ3389+8UJu+CqVIbOR2DppC1txZb8
	YAhDHDdhJntf4SUs1VL4KBIW81hkW7wMG8YhSD3twacmtmQ7JXzCsBKVU8QU9llr
	1djhELjVsACmXgzdZyF/F17d5FLCEqnkPIbGj6YJkmuO2Q7A6XSkBpasXdJbnIOW
	NtQ+vw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7v9xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:26:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662668b825so14081432a91.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442006; x=1780046806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkohdRv0hYpwmivlUhyctq3yN1gqK2kdhsTeAB33BNA=;
        b=Hl8IrstLmB1RfU9L36sGr/KdFx2svc8UXLvsMRhQvgHz8JeAf6j+WKG3nrIMc73Loi
         olejv2cCoG1t7CgLVK2s2ojhmwk8nRxACsVnNa6GogSiw/MXiP6tokcOykG3jxTOmodV
         ZDjU6KxOqX97UnJpYxvD6aZyzVKHLMlPx+W3vjbpydtnPYnDv76BgMzmeBl1U4CCQpl5
         Ml7iQJbFy7Vk5Je3ElmNCniEMnlLfNOb3BBM1Rdvve2wA7MIelKuPWXKmwmk6tRzUo/y
         P66AxxqN6q8wRDIdCfJUgmOJie93rdieXOmv1Zz1cBULJUpflKMISCGJJCq04YGUcJfg
         NQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442006; x=1780046806;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkohdRv0hYpwmivlUhyctq3yN1gqK2kdhsTeAB33BNA=;
        b=qzAzlveSJJGNjcyTCAicvGzTN9kH33Td2YUCGXZifgoPN0IzQX2PecDqDG5HW05PIp
         p3qnBCfRmG8vwG3ih1t7/1FuaGWgZdJgm6Rmm3w7PXatZsHDS4GLOfUIhCoxY135g5W9
         5S6wmZlGwN0n7+7TxcqCH5Az/kolCzfTwOy/4dSc/VcGnlDEWncopN+QQrmH/kuLn0Zo
         wB35EmMiFJ1+7SIqsSsINsV7AEzNxyEgbhDSBOz34pS8Y7FhY8nOPWpFDWdnN1l6P2QK
         hIheOumrhBJ9GfWkHasflDQ3DnWjr/0h7aLYBbjNxzzL6HNBcDB4Kt+0Lbt23ezQpf7l
         AHMg==
X-Forwarded-Encrypted: i=1; AFNElJ8AAMSS78DZQT7bl1YbdpaFWXyFSgf6NMOH2fnlPzvnoYW7o55p5UHmvxrzq7Z+OJ29zsz+U3W0daCz@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxlb2xXKSjE8xYe7UdCWHP8mS7RdYWrv0Gaavit16zLd2C8/v
	3gmbtpGq0NRdmDd1dq1gc3OSOSvkV2ewxf6BTPgaGiOrwbtJ47lL7FZ9Vj0FlfTMQBaLezBjfWr
	F8ldn82cejecbDxC0fdqLY+Z+qETN7qUPB3Z+QcSUlwn5VvYEsNYJmhueA5vvjLt/
X-Gm-Gg: Acq92OGFF4UDQ/4TDOF/9p1IhNpDuyt+X6vNivhCeGzRMEA03qRVyb2yTogv0/vON8U
	4Yoz09d7kCiJ61tMQ9jgwblTgw7VHlFj3tgrbiHP+dip5XP+HNGSS1wwyrTB8NTssKT83e3tW17
	iJrO9JxJB4scw1nq+7yJiwkJnJhBtsu+uj6YERwWsl75Cnne3ZMK1aTez4OH6x5Ah4XzWJ84CyO
	WfMNJylM/hAYkl1eEF2PI2QabX4K3mDcCgsrHcy0KH15u1XloHomEg05zA0P1R1anoh2xlXQQ7j
	uamZNhybp4/BIPbiYxMweVnGT0bW4dJZk/p16W7s5/ipOavUmNZ7RpU/34tU6KSF3m4dbXDLiLG
	xf+8PApakauzXhjuzKLMLhhkHFQ6KcXPGFHwVbKmag+MoSMGpvoc=
X-Received: by 2002:a17:90b:3cd0:b0:369:a962:8cca with SMTP id 98e67ed59e1d1-36a6771bd1cmr2945524a91.11.1779442005641;
        Fri, 22 May 2026 02:26:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:369:a962:8cca with SMTP id 98e67ed59e1d1-36a6771bd1cmr2945492a91.11.1779442005072;
        Fri, 22 May 2026 02:26:45 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cd92sm1305044a91.10.2026.05.22.02.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:26:44 -0700 (PDT)
Message-ID: <4f436ec5-28c8-4044-9427-90a893e0e9c8@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:56:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
 <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
 <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a102156 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=lMnvkBTLgxR_eHXLjrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: oPOJ36y82yO7MG6AEPO6pW_Ud5QZtDL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX8a0JDrGm+G1E
 rJWQi0dblH0ugYEyqkOkqj8c4o34qv9/ePffGSzMSV+c2jpaOyZq2F+8aPJ7eHto2ozPhVce6+l
 33GeQH4+e/YZAH6BiSuYbHFVf+VEgKQnvVGIinv4FNaVcAg8joq/XT8LHquQh+jlCQFskfskWCW
 d+09KY7OSRidJJmVRACr9TIVtZ2BoHhZ5RWZruGolvIgSi8RqEmcIXZSHdGoPn6aNAIZctmltgU
 AzbuYCBkyqbPsEs3SVCZH14Z215/d2H2y1Tlv3vxir95PeOn8j9ORCj3U7qmnLsZm/JnhR6fqgg
 11StC26gXTrb1a4eManAgUlwcINHs81DJdFypE26BfrTEGImXDVyqy76c5v57kZgoZ7TnSva2IR
 HExiGV4rS303zYibOY4fsQETCj6rThi8tPO6Z7otqUyisa1whFYtiq8dKW3fB8OqD55XECcqgsZ
 Ppc4W8WJYEFG1u55AqA==
X-Proofpoint-ORIG-GUID: oPOJ36y82yO7MG6AEPO6pW_Ud5QZtDL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220093



On 3/13/2026 5:19 PM, Konrad Dybcio wrote:
> On 3/13/26 7:40 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 3/13/2026 7:52 AM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
> 
> [...]
> 
>>>> All the SoCs so far default uses pass through mode with the exception of
>>>
>>> Is it something that must be configured by the bootloaders?
>>
>> yes, currently changing the the mode can be done from secure world either at boot
>> or after boot via scm write.
> 
> ..which won't work on almost any X1E devices, except CRD and IOT..

The series "works" for all x1e devices with added SS3 low power mode and GPIO
interrupts also continue to work for all.

> 
>>>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>>>> boards whereas it may be set to pass through mode for IoT-EVK.
>>>>
>>>> There is no way to read which current mode it is set to and make PDC work
>>>> in respective mode as the read access is not opened up for non secure
>>>> world. There is though write access opened up via SCM write API to set the
>>>> mode.
>>>
>>> What are going to loose? The ability to latch the wakeup sources on the
>>> CRD?
>>
>> CXPC (SoC level low power mode) would be lost if the device can not wake up from GPIO wakeup sources.
> 
> To the best of my understanding, that's only because your approach chooses
> to ignore supporting the secondary controller mode and force-reconfigure,
> since GPIO wakeup functionality is otherwise available regardless of the
> mode.
> 

Yes, secondary controller mode was of no practical use in Linux and
hence the v1 series chosen to ignore it. This part is captured in the HDD
(hardware design document) too, 

"Some of SW platforms can’t detect all type of interrupts [..]
the ask is for the PDC to act as secondary interrupt controller [..]
Please note that not all SW platforms might enable and use this feature"

Linux did not have any problem working with all types of interrupts and
hence did not want to enable and carry this feature in Linux PDC irqchip.
This was added for specific windows SW platform requirement and was never
intended for Linux SW use.

Saying this, In v2 series adding the secondary mode support and with that
PDC irqchip driver will have capability to work in the secondary mode.

>>>> Configure PDC mode to pass through mode for all x1e based boards via SCM
>>>> write.
>>>
>>> Would it make sense to always use the secondary mode instead?
>>
>> No, it would not make sense to support the secondary mode in Linux.
> 
> Why?

Above reply covers same.

> 
> [...]
> 
>>>> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
>>>> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
>>>> +		 *	  monitoring GPIO IRQs which may be needed to wake
>>>> +		 *	  the SoC from low power mode.
>>>
>>> This doesn't quite match the description of "latches the GPIO IRQs".
>>
>> It does, PDC would continue to still latch the GPIO IRQs (as the mode change failed)
>> but PDC won't forward them to parent GIC as they are masked at PDC with __pdc_mask_intr().
> 
> Can you not refrain from masking them then, and clear them upon reception,
> with a write to IRQ_i_CFG[IRQ_STATUS]?

This needs other changes too apart from clearing them upon reception.
They are part of v2 (to be sent).

> 
> The HPG states that this mechanism is only engaged for GPIO IRQs and that
> the forwarded interrupt will be of LEVEL_HIGH type (which is what TLMM
> accepts anyway)

TLMM isn't much used for IRQs which are routed via PDC.

Thanks,
Maulik

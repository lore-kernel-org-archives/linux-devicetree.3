Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F31388E6E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538574; cv=none; b=iLuj6jC1Mqosw4vbJLvCgvzij2TDOj/9bk1O1SMDk38QjzF45Au/e0QHhL4qnv5RthhwME+bny/UQqFRJPSOS5zJ9RWsDkaAzE2dqLxVEJD+4g4nN51XUpKPO3qC/1CKe8lpJHBO/Eo10k5Rq9mwglhC5NyJBWwRGXfQ5y0rB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538574; c=relaxed/simple;
	bh=ydKZYR+Y656Yw/RzkG9VPOvC0WJNSVkB9Fl1bWPPzlI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hvZsAk7C4Ur66Y3xoAnDb+gLGMSKF+TkyxzGJKuPmqE0SnkRnzFMTh4V5H9TJxSR3U/PviJ5W7ovB6yY86lIYlWpQ3CbKQALLZuZNhubOEjirGRlUTRrBk70/NoWoH8n9ByJjp7IO6QqzTKG8woXA33iV14+EHqOhxUQnxtOOA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSpSDJ1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2jweFwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSpSDJ1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2jweFwD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65402oBn1476732
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 02:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q85xjLd3JmVGen8gRY9Dym5jEmwnZApOCk0ggYyeWL0=; b=PSpSDJ1t5OoimHBA
	jvqZnpMh9pg9bCxwbtMYRfGU8QplH4XRwr3xEefRECnriMhKUD1z0mW9NnQw11ij
	9du+os2xYW4MCj+4wg8v+4CUNTgQlAeFYuWcZLWe/fS2Km5sskX3cn3kF9tQpXr2
	NsK9n8g1wOkxF3txSaNynqzzPAM/bRhqDL8qohqdaESN3qWMmdyakzhS2PhGpMF1
	2RlQHdxih8G6JhQPLIU+wrioI9CRUDtb8hNgPzDKND36Xg+5Q9yg77o234XAR4rS
	CCmYOP4hk7QMvZf4IC1zSaXyeLuDoNmzK2cqTB61m8ZVTeNJmZdKEpU7sDJjLx9x
	/yT7jA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6ntha2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:02:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so117387a12.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 19:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780538571; x=1781143371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q85xjLd3JmVGen8gRY9Dym5jEmwnZApOCk0ggYyeWL0=;
        b=Q2jweFwDYYD0yYhabW+nqFrJR96b+9j8uVeT0BjAyI568HqJumLSxJWQ0f9H3838LE
         0SQY1iA0+Ldn9KJhJbdvNnntld1QdO3Df++hnHIorftnJTFtVf+tQz2ho8mujtEPTiB3
         +fbPkHeE9cdrbJmpvowlmINaw4eHEQugEF7QmoSKw1I+rjuiSzvTCwyFK3JcdpLciqCG
         iRIuR6Vo7YaiqDrEmPtLdxuI6rDzHWyjZ6C9R79fpeAoZypbiYWXE/QsmZIjQbA7W769
         M3PGUgnktTM0L3NicbQ+RdNR4v/JQ//YEqpeqfrdx8I7Pfsvbmy/an6VTLeaZpRvE3h5
         f3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780538571; x=1781143371;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q85xjLd3JmVGen8gRY9Dym5jEmwnZApOCk0ggYyeWL0=;
        b=SXFcl7xOfuP7d+bI9TBXN1zb3SIufR/VX1FqfnAIljpAoqSe+MsHR0+yVjXpRS1tST
         ALykOYpN8iY6SiUU9j3yt8Lxd4XFOn74YpBLgH++UkJz/hOcnLGWZ522cSDVLx2v99+k
         UvDD2r2PXN4EY7pI0eDxvc2+8ors4CUlqbiyVpQMvliIDRyzqBoVYAx/2aBnfzsVdKr/
         Apg7H8WnJzOsF4TNeaWqdydOZsG2cj/ejZ3SeIx6rRI2k/7sGKUdwahIZl0mde4ehX+1
         hgDf//+NwCJlLzfYVym04e44fdAYLIonTtjx5lMcRLBGDXGbuouQqEIFrMWTy81atpOC
         NXVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nViLGLCBN3c6NSrmfGxRxCI4dPRpwSQP9gaEDAJSH5XyGOhrLmeBOXDSFKfLO8epgUFKrBuCZUHoc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ueCvAXnKLHjEuOVMBNgFbEk4Pq+Sg2F+PtGxpRoksExxZeRY
	DnkWGZqARJHcg1Qj2od+mExrC2amiUoyipBKdBBNjzdfK8nXLI+eQ3q62mANhaPYBVC/FgciTqy
	xCi8ARSQOGXZXjQb9TKcpMbmX3Hw+ZEaoLpgKjQ5HnsX7uijEbZgCH7zK2P5OPYW+
X-Gm-Gg: Acq92OGecLs06owSEGMK6i7IsErCCY8Si1UVi/Ni4ZVM4sfi79eNQ3/Mn1w5DXtbplM
	1fiMFzSlfayT+EJzYTjPGtWBqfeKpf413Epp33yc5k4n2up0iYAev+RMl4LGFWDlqnhKvReSaf2
	Af60y48Qhmy4v0FTSjCiusYU/8snOqQp+aJsziABB/tyML3aFsU0uZChdYDLgGvW19owTzrsFVO
	Qqo/8cgxYDjnvWEtQ16rjlWkaj6xzWX0IiSPspO5E63Q+4OoU+JhIitfoYcRMzUwPL81PCaDTHM
	qhcDIYqtlEnbN4SBFirnwSwG0NGv2GgRH1fFAw1jAa9qhNcVhoTj4u1loIiN/jskWMVX9oWTYOy
	Jha8XDVNBi3Mcuncm3YZXzcWQW79d3CLBMXm0ogLCk8tbdDYxqHwsblvfLA==
X-Received: by 2002:a05:6a20:728d:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b49766b7f2mr6538683637.37.1780538571140;
        Wed, 03 Jun 2026 19:02:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:728d:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b49766b7f2mr6538631637.37.1780538570626;
        Wed, 03 Jun 2026 19:02:50 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm3413401a12.0.2026.06.03.19.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 19:02:50 -0700 (PDT)
Message-ID: <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 10:02:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EGyUsHczmnwqz_qjn67CxV4i4_RGmIHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxNyBTYWx0ZWRfXx2y/NoodV1Cq
 TiBzepUThAbIkHWNRaFHgNSBy6zqClcY/ENe4VWJcfIFzV6O7MxhB4/9FB+HppJk5201/RGCeIY
 abylSueWvDR7DTrN2bM0mga8QbuP1ZfxjET6WGPZSl57dt7iCB6MMdExxyu6Ixw8wFbuVAbB4wp
 2blLcrnvQjRnkI17VRquKBjbwpqkQT5IL23SEcT15xy5ZvDzFPVl32LH2271mT7Giwh5W6RRGzD
 HGNwsEdVadCVqzh9g+T0GqqWVYF/ig3HyOKqjmbl8QI/GgEFvtQof97qIqHscug10YfAjRAuOhF
 f+ZbNRrxgr3Lv1WrIH8aFtG6RKgqRupfHSTj0ynr2lSTT+buMmKl9pPFMBlEmR4OJuOMnTWH0O3
 PWKhrX7VxNQlDMtXDCgWwvw9Yad++nNpOCXLTrs8Uz8O9UMypCaHzsN9DnIew25RGf3rz01J0RP
 FLStFkY9D/wTOqr981Q==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20dccb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m7le24t4bVehakb2-XAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: EGyUsHczmnwqz_qjn67CxV4i4_RGmIHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040017


On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>
> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>> Currently, the RPMH driver only allows child devices of the RPMH
>>> controller to issue commands, as it assumes dev->parent points to the
>>> RSC device.
>>>
>>> There is a possibility that certain devices which are not children of
>>> the RPMH controller want to send commands for special control at the
>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>> GPIOs. The control of the LS, which is combined with the GPIO
>>> configuration, is handled by RPMH firmware for sharing the resource
>>> between different subsystems. From a hardware point of view, the LS
>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>> child device of the SPMI controller, not the RPMH controller.
>> This replicates the story of the PMIC regulators. There are two drivers,
>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>> driver targeting only those paired GPIOs (and we don't even need to
>> represent them as a pair, it might be just one pin).
>
> Thanks for the suggestion.
>
> I agree that adding a separate, RPMh-based GPIO driver would be more 
> straightforward from RPMh control perspective. It makes the new device 
> as a child of the RSC device then it can naturally use the APIs for 
> RPMh commands. The main challenge here is, we need to make the 
> level-shifter mutually exclusive with other GPIO functions when the 
> GPIO pairs are used in level-shifter function, which means we need to 
> write SPMI commands to disable the associated GPIO modules. I am not 
> sure if AOP already handles this; as far as I know, AOP only manages 
> the BIDIR_LVL_SHIFTER module registers. Let me double check on this 
> internally, if the GPIO modules could be controlled along 
> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>
I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module 
registers, it doesn't disable the associated GPIO modules. Also, I still 
have no idea how could we make the "level-shifter" function to be 
mutually exclusive with other GPIO functions after moved it into a 
separate driver. Do you have further suggestions?

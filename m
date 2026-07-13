Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377F3A7F75
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930887; cv=none; b=P8CTZMPbqqP3yKVnRPG+Ku/9djS6Vy6vzpArhVlUvGQpAG+Dl1UiNyd2h7/gfr6GfalYomn3oyQhh3zNkiGP4ef7iMWlNQTNWpV6w4Zu0crdhR2IIRRUwFiWVAtveWP0LrO8fV3ByvR4vtLURQNAusv0fYx1yf0Y73AmaeRzg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930887; c=relaxed/simple;
	bh=TnQKSM8MZA26ziuAwsidIQP/IBfrhCtujf4X8iIuakY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mddIFLk74yvC/l29UAs+aFsxzE32raAKbe9xXso9ubCsMowmrv5FfvpTlQ9W+a8Vm1+4/LRYtuSi8HOH4Gnknqe8pjTkjx3SleKT27AUbdV3IxQ0FGTgaxID2XkZWXe3Ws1RYnBYGnccbWwY5yVxwGZKodIInwZDpaK5t4voHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1uWktGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbJXNsJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1uWktGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbJXNsJp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nqj5648581
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=; b=A1uWktGdfKXCBprB
	02A8Ld+CVwDevHMURyhGwIg9bzLWDJGu8njDO+R473ofuo01WbSF077GLOwXOBRl
	gjFEgYSLnGYUWAzXPaDX/WE7pbAitefMGiihtihfnWrXS83bjKJJ7rfXxq0d2izc
	hWETrNqFGtCz4Fd2dH/09umjwLtNkb6ZxYUEkHhG8mY0U3HoMwwEFX+MhfwwaTB8
	5MylOl1qFXBWNiibKUcnZktLHI+0gOaiLf9KJGaNcnwr8dabc07LpUkYmZDwPtuc
	HQpNNhlo6tnU/Dsa3iMWeE+CIWCdEPfHlqn89N5lMwVAI+7PGINx6M9Nu4NqOeJn
	jJPCJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr526u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:21:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso29221271cf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930882; x=1784535682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=;
        b=QbJXNsJpyhOLuM9m7eWRgYQTAi1xFFDHbMQFNMjPZP9FXiBsTjbPtsprvSHDkL3C32
         W3faEy3bfRdPxq1/critJ/iz5aPzeMUerx6EFjVFGeIymKuiQIKGiFW31JqOuxWItgcp
         FWqvH4nDz/v45geDsQq0x1mJesqZCmfs3MwX8QWnZeJzPI0F8rw90zlEVW8Hv2mHuRzl
         8sjKXKCNEpNpma+O8+rla/RiSCNW7P4vnGGlJjyO+3IxWR+MCDHgfsrNY7Gsi58ugM/e
         1zB9gXw3TDhWvRkGDaTu6O+Rkt72iHGhGwfbZH9VMBBGzUQg40ESk+82RPrZ2TB49qMO
         VT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930882; x=1784535682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=;
        b=nK59ohg0OtaIJdm4UkPwc8aDWKQA8WebOpigBn6gxyqbrSJW9Obc/jLHwLLzAocGLK
         gEeuxO4cI3hYEzpsScDY1cBSEG3HYIZqdk7vjM3/UNTNUsJu/4LW38jOVVM5MD9tHBN2
         fcCD9NTvbOfS27SXGhX3XLhPdTx6ns/caYFlBMB+1yrLnFlEPsrP4mTUq1HFqXKqKIB5
         VvNhskCxCvzXiOL3ZGtdNGyvl1yFIl54Mb8u5SSikDTT9yzWhXxF1R/LNrS6AXIv3v1r
         4OzIOquxOD/xOgC+aYXa/hEu4C3W5cwkIhBAxFrsoj/BwwQCYg2TniXlr7ngVP5zQCZC
         9d/A==
X-Forwarded-Encrypted: i=1; AHgh+RosvyDGmMWWhvcIuqaqUpe+H4g/oYBsk2zPeqaZtAXrvctwP3KSpzw5qQT1XuwBPTbdhazhqi6ZTd7M@vger.kernel.org
X-Gm-Message-State: AOJu0YwUp/WDwUe05N1xZhKEPHZN3adYnaVlvfHZdbV+GrU3FhMM9tUQ
	ESf7vYu8gYbGYb7uQ4hCLeNZL/sl2KqyUAtTSfL+WUeCX/nyqSAgs/zswgYGQfAthzlQyZ7pkg3
	t7Q+8c2yF3bN6+Lc87P0Gl0GvWbcHKP9TGO7M/kNcemsYogguN81KOAL0eROODwUW
X-Gm-Gg: AfdE7cnDT3kJve3cUZKMPpcDrV88Ngtq0Vho0DcQAbpUzHsaYIbtgnR3fXUS6L47FaD
	OMozl077AlLtfg6HdXr7J++r3MRhIFpht0C8gfl+xwITOlWuPW00+HUZsZKll4FNAMf+r8rAZkj
	b7HlYXcIl95ckStoZe24hYO/HaoAHFlTqun5S0coAYZpa2YXMHtzXp7pYkeVEBf38TyDuZ+TTQW
	8zdfaTyA41yDckB4/pV21/Jfna4B9DmsBSHkbCR5C0sX1QxCAiuZzqGTU0Y1ATFsSig96wdt2tr
	oquv1HOX4SRbBOIbRdxxhB/EvHLyBt//AZLsfQhqrHplin15c/+HimFX7paVIQpee8oz6p6S5Wj
	jXFa9FfytM0FyC8U+yWtD2DdqJ/RaS4hQ82wneEyd8SA=
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51cbf0be5d9mr84321411cf.19.1783930882402;
        Mon, 13 Jul 2026 01:21:22 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51cbf0be5d9mr84321051cf.19.1783930881843;
        Mon, 13 Jul 2026 01:21:21 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm7586462a12.23.2026.07.13.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:21:21 -0700 (PDT)
Message-ID: <6de0a8e6-591f-4526-b5c2-431711dde1db@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:21:19 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX8LEvsUdIaTGS
 u5bGkFoLBDo0P7JbDiF1/2qfeHBZrvlotqW0wHqMtrgrTlmCkwLBOYb+VriQ9DIZxWEGdoO9LPR
 tYhTOH3+NFp6Tx72pcgnaU4iAUUyTvY=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a54a003 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=ka1dcg31Si149idUFP4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QTrB_pyQLzxvlR-jICfPBHxFuHZsCl1T
X-Proofpoint-ORIG-GUID: QTrB_pyQLzxvlR-jICfPBHxFuHZsCl1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX+1uwnQtQDljX
 JaPYcs4BTicyqdavtcwr82T1ZfXLrE3Sed1EspmR0Togg5MqMkdOiT/tk1U/F/ZHJ05EwfhWfkG
 NmzylKvHhR85OYp8moN2XSzoHmVCOjOL/WkaVSUSrH5fZyr9i7/FrsUxbavh2Za8vZSRc1jsJrS
 MeclhLybVh3cbpluVqGNhemMjKyW2KIRJNwDpaS07lwNPqWJNUwgaoEZ422G6Wm1BhmHEiGZVVV
 e2oYWuVbgytirQT7CebuI7rq3tTfHPrM7uCOBgiC0c59dfsowdoNDq2vG3iA2oKuk1BsESCND8+
 kQQyidPYyzMMuP05bUHFH+yJlCwflAGxUryln+2EBt6cWKebYNjcYxuuPCK6leMPppqWjZPzOsk
 MIXBBtGaUW0JbZfUHQ4NjF1t64xX79Knuli2oLJruLcyeY2NI1SrRzlpLziQZgOkA4Y+bhEXF46
 DvZlwdIn5V2nBWCK2Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130086

On 7/6/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> I do not understand this rationale. How is this required now? Are
> existing DTS broken and do not work? Then this needs to be explained.
> 
> Best regards,
> Krzysztof

You are correct. Existing DTS are not broken. This patch is dropped
in v5. JPEG is modelled as a standalone peer node, not a child of
camss.

Best regards,
Atanas


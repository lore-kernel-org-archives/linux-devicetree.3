Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716037269F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843465; cv=none; b=WU2d1t2qD3YpMiH50cFcdnakUXsKxtpe7Fd3v4/KO7RG3tyES2cnAM/lGKo90p+wmTSi87PPUhIwQFUpHNVy6DBSGvbWvcLcqivzz3JBpPOnDd54GxSJe1BdFsuv46wzwSdcSve5PIQvT5TN0vhuL3/aKiOdv27mTZ+BCoQthIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843465; c=relaxed/simple;
	bh=yC9ooREPFoPevEeFC7MzV3MUhKTTHk8Dwuly7lWrnGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jum/zqdrhcDY1jUbCLIS0G5xqr/Jz8poLhf9y3UPbuUITUyPXZ7Cf50LxzLoJ2S/0AUrxhdo7ZMyrzzIu7I0kjf6T3YRqN1jOPe1oLXgoSLD0JkghGpdC6wm6YRDnAgnqR83yBG2WlijndsNWeUFHCEG1B33ZkioYnCiZIWMtc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ft4JlUQc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es3QMxKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ft4JlUQc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es3QMxKc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M51gmW976178
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g710tN5HVbxOu4aj5AjgHTCieRGwwYofyR2aDtM7hfs=; b=Ft4JlUQcj8//lmDb
	NFgPRyBG7tuG4sEwV+3ofOBpu5eo1UOpO4mhhvW5tu93Oi115wWu2io/ytfiGxGF
	k9WCXGSfZJsqSE7tAg6ZVUibMf5MmlIU01cajoLQj2zSU3zIsvMUyh52HD2Lr/Jf
	J2PrdD5NFDG6mKghjj6Whgxu3KTRuEibX6dLBWTZyxsJVMCIj0ehjnhWYdhosOrb
	5iIO1Vh8GSecZa9wz//zFsKhSIc1aqy3QTza2yg0tislg68jP8abx4FKgVN+kdZG
	0wVe+SNOEZn/FElHMI6PLNelIYDyArN7XjrBAXI6lBDY4m4JUHdZ+9SPeNMivQ6+
	P4TOUg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneab16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:37:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2536593a12.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776843462; x=1777448262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g710tN5HVbxOu4aj5AjgHTCieRGwwYofyR2aDtM7hfs=;
        b=Es3QMxKcBpFixC4mG2ALaFegcQZw7ghus2LVroZBiH8FZwiMQR1N0gMGdxLmDdOxPP
         8K/TlvEGfHixRrMSm6Net41fQ7wcso9ORJOTgBUlauxHlq7SeZFwL1Km/jyg+oT4PJ+b
         5Zfoh8Slyrw4QZXgfX3+w+LCvUjC3PylUKf75vL5sR8k03EIrghXsxoG9kJZ+fQtzKjD
         TxKldwmhmuEB2FcA84g0BjyJ8/vqRB5K/CgOKgUCwKuExtBP12HzbEyksiyubVwaMdY+
         5kqkxO79X/L14u6bnbcZEyJ2c1tJtknEIExqNfrP8e+qTHAwtwU8e8s01EaR5/8M3x94
         O4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776843462; x=1777448262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g710tN5HVbxOu4aj5AjgHTCieRGwwYofyR2aDtM7hfs=;
        b=FPhIe6WdryQy0QkBhXnvnDkIo55cmEVkyzy0MylUAEF4CP6lyocea++TY61nKBIF3s
         3XOPPixIDWRqy/s4q3SFPxsuuDkN3EKJ4YLqD2U7UwUde/Qwnv6GboIffRWbcP+sKBEC
         zEWnELUUPf7B1d3VQC7N5kc02Y4u8sUwYZcwaIz65kM6lzWBRrc0HrJIxxn1vgPaVDY6
         Hlu/OIW7QAEeSd2uIVUKcxCEZzerQ10Jkisghv5AancTaB29OMaRiRzEbCTkZ2TC9zcn
         n6wyVISHKooO0dncKZ6vAAFZt+ZScjgkKTigMp3sKcS4JgDagtYVW+ltpYgLPogbSGYW
         aTHg==
X-Forwarded-Encrypted: i=1; AFNElJ9i7oatBj28aFT5sbhRiyGUcmzvbjcRuECJNyIgKL+gcsjAfEjpORnkD3IwdkZ/xzCqBP8XoEOVIhFC@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPDQHaJHwitWESbObLA7cmB05xcJBzWl5NeHfXV4VH5ydJ1Ot
	ADniCoaCbWR7RHFD/lkRBuq/mS8PuefnH68+HXca/0B0HN2duIb8WFNmX0h14/hOSLXljlcV9Ue
	DH5Smv8qvdLlJkJq/AJbjDqMgeKwLS3mxX+1hQUZCrpZTbZ2SQbOftM38+M8gwYRK
X-Gm-Gg: AeBDies3QMEKkWIAXoAUdHdTdlEdIXGiUcrxLxq2L9PZRoDlAUEOY/IHpjXlXrVDBMG
	TANHciZQW8w9pR5HHd0tZ2H8M4rRbzf6y4EZc19EVLX8vIXQnyQoeLP27ECbxzRo0KNm3K10z0E
	GxsgSroZpuae9F9qpenNKbPZNxKv2SMmnAb92VxEEFlLSC9nC8BR+WXqkCDHt+FMaCjsQYQY3Aw
	pOzsVy8S4zJIl5Bsyjx0nxooW4TTjFPAUTaik7iAaYN1hcW+2Kwq/NzEYxhfEyy0OQX83OTKzi1
	B7e8gJt105L/3GLt1PMJqFLmpwRusW7m03JS4bu7Cj/LEfsVNw+F7ALfI7SI+O4CNfRXeoWtR5C
	+DiH0GTu8Dp/p+J6V30x4Qt2GYGqAkp+J8kqrsQ98OmpU/sQxknzvhEdr+GbVDfVy
X-Received: by 2002:a05:6a20:2590:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3a0bc6165damr16766847637.44.1776843461655;
        Wed, 22 Apr 2026 00:37:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:2590:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3a0bc6165damr16766815637.44.1776843461143;
        Wed, 22 Apr 2026 00:37:41 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm12391799a12.31.2026.04.22.00.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:37:40 -0700 (PDT)
Message-ID: <88b38699-aa1a-42b9-8d2e-6139c1ced4fb@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:07:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA3MSBTYWx0ZWRfXzTmc7lvX3HUY
 VCAoQtsc4NmAcxB6PHdz9HpipGwN6wUEQjM3jeBc2beMMy2JIzGEyHcPxEwh/orMgDUiqJAQClX
 Z7VxswMg2fB4Y5iqB23xQL8ZHXU4vwbxhQp7wMtd7vKDrmyKAZrWy0WtNWoPZmRJMBzPsr41yLO
 Va7XaEo5VK9gZqWAHcZw/xNbKh9LPObT/pUavqctMFD9DQmHtmIHQHy26Nthd1NOPewW8gayI/0
 JvmNd3MQC2LMKif06YoAszEPfXAvsYeARxWJd+UQcl7/b1F5gJdOZdwdfQRgqv158NntHDiGpHl
 HviNnfifLKSnqcHNiFr07SMEUl0YWqvIcGYvzw3EtMuuUpRrX+qHIamu0p6vwJe+KUVelT/3qZM
 mVzedcUkab6tEgVs0wE+OZK2XheursX2j3mbjgobDMbqq3hQDEcDzhBS3ZLUMShQUIAwi6r+j3v
 Q3LtNHC7dPSUlLNcb4A==
X-Proofpoint-GUID: UdP3DAXemNxT7UiNc9y2sb_qUoDGufja
X-Proofpoint-ORIG-GUID: UdP3DAXemNxT7UiNc9y2sb_qUoDGufja
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e87ac6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UlvO0n_oXqfwqGaIblEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220071


On 4/14/2026 10:30 AM, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

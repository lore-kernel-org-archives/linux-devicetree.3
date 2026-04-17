Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108539C006
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436543; cv=none; b=Nk0orcqCl22ReWslMV5Ky4uKNwuOUl6+7jXR82kph9hGDynimHSJW6t08IVgjxhQ+e5RwIbnLTXpHWmJw9+uq9orFYLjG73lszM8AQwDa6bc2hBR5JpGewVWSiQ7drR1rQziKDKoaMSmqePUtGLY3838uvioTmxSrRD5WVzi+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436543; c=relaxed/simple;
	bh=SF113oFF1sMZms+X7nrIwBSd1ktumh6AlyZkr3mVNC0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YOnxeQHNdVUISyoprOy2m4/vkqBfwiZcq5uUJCmW6iXKZvstXamYNH4Xs3mQJgvFDpgi+46hOc8k15ZWIseM1PFyvaknIeG8yZCIa5cnpdhH7x1EP0xOo14D202/jCIIPhbrFXD/3L+OOivouYV3My/taDF8M6Oy2PYUu+H2RIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h20xq2ZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3Q8Pvje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h20xq2ZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3Q8Pvje"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8HZFn1872660
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=; b=h20xq2ZFJH7N7PSw
	QLzUhL7N+mcQaqrb2YuOHWZZRdCbAo/e3PkZHs2ijcVhfHFzhO/swObIVQMuIVR6
	gTZI9NkP6twpH4WAxrQLw+0w/jeXKDJL5ZCTQMPmO+ky/PHWpBXAYcvMAUyvocSK
	vgoA4glWUyJLS6jIdP4ZarszTZfCL+MrKl+z5uyv6onRxyiMxHhfhZ4QxNRBbda/
	b2xbnsPiURXxSlkvgK/CaBJwSSLCSugjOfvwdrAG9h0yprlvcNQHiNMglhBC5pEL
	aFR/oZOi3IuI2YrB2gbkFvGb0MS3aitBes9mHywxzs2wUNVQXRn+NcN7/4zeo57y
	FI1n+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk2kncdbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:35:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3595485abbbso889397a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776436540; x=1777041340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=;
        b=B3Q8PvjeSFUw33mR0+w193jMk7YP2p6VYbHclgMArO354s6g7kDu9NSPfmFeDhXfoE
         glSdEGlNGP0vlvQlTLhRsnNYfavw7ifiHpbAi4HuYpfvoWvPCFBPJXCyoDOuoupWLJ41
         yr+dqfTU19bIqsm7yqTbfUlFKi6GowAUtq7Hnb5etZ7P9AKG+eNSdgGN/q/hl64RtJVD
         ftV+XpsyFKGkx9uW5Y0mI5ccXx/Ijo1ZODV0FG0DatRhP8RSgS1NB1INKDwD+rXVrTMA
         3fZHKNeJkYvU/dPVa9Sr/bwqOXg/2tOfn2wsl+62UDSpQZKgKowogkNirHyzA40Ykdm1
         xJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436540; x=1777041340;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=;
        b=cjmUiTIZuUigobROPSnEx0iS/MHxCdrYPr+/7QQbjZSVrinkvgQgSYHUgbvgQFsHI5
         hKypx6aS7ijiUsP3lWrtFNRrS/pQiJw9UPz+Oyz9s/d8ABTw6tsUhqy6B/jScNi1Q1FU
         MrtcDnPm/yyFNFjxm7juR/wTFsNk+BTHcG0EQCxJHxOCR7IaI1aeyXnOsicUTfnrcNQY
         gfmKVsrmaTNVjI8U50Aj8egMoJ18jX78DrXUVQK+fAYfqzXSX1WhgAEKIAJqopMpbdEb
         xkD+7Zrqbk3PjzjR/WYLov/du2FsOYZz4a+P8ZHUT/qWNwRm3Qj/8G55vMkRMEnSM82f
         Y25w==
X-Forwarded-Encrypted: i=1; AFNElJ9m53D5K6fyVQa46TDUXT5kPKA6Smuplz7r7RajWa4/XkeO7xPLXNR4QEAYbU2HqQkZnLTeRz4/T/uy@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaxuvQg70Rn8kygr6ownA51F4WPM66+cnrof30wCckh2JSMON
	mcvwjQb9WP4aJ8G2pDBmE+dzjE8riTRTseXYa4Y3NRhwBjlLn1joIqt0Gm7Ss99NmLzwBgzpXrz
	Xx0vsRl2kgOOozvijpj9Vn956Oa4BU0W9MoNhlCDDlbPn6jvpr/CZC7Qh1peT0EAh
X-Gm-Gg: AeBDievedS3kqEI68TvbLvFY5DxhHq51jo8yqUGOydAWfcblLTy2Q8PhzZKL2kbfoFC
	NpynxwCEnHqNhrUDsSxQYWS+beOWX6Fg9qjkFy6xeEu+ul+0LRnCnoEcLJBF0byfjrivfENiUOB
	5TuPY+R4S7NKsWYf+l3+KtHkU+/trs7Q75G1+z14l1J83b25pH4ele3CUNuCDhm9bTCBDPD2YGS
	ga++PWCnebAPPh60c2hxsZwgyw13yNmZu5BsLmppIVSJn3tyrZIccyj9m2aLavkZkO6SonG6ZWl
	Zn8vHNc1lt6l8Kl3aHGEE6O28Kga9sAK6TVFOfuI5ucy/Igc8kZ4GlqkYQ6EMwKM5JGEAopsFRO
	LDtOvmbI27kfd2ZXqR2MlUWvaUHVy57i5XcmqyUrZs+tj8SO4Pw9yJcJkiQeDjqwv
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr3379893a91.6.1776436540217;
        Fri, 17 Apr 2026 07:35:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr3379859a91.6.1776436539609;
        Fri, 17 Apr 2026 07:35:39 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361419739dfsm2325369a91.13.2026.04.17.07.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 07:35:38 -0700 (PDT)
Message-ID: <5c04e57a-efc0-f5f9-f53c-04b9bcaa1c8d@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:05:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
 <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uBGjrBVUJPR7Na7U4TUDrFZ-133H2dvo
X-Authority-Analysis: v=2.4 cv=XNoAjwhE c=1 sm=1 tr=0 ts=69e2453d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=y21pM0OG2rRs8fqayMkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: uBGjrBVUJPR7Na7U4TUDrFZ-133H2dvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0NiBTYWx0ZWRfX69bfevzDGA7D
 4gES91lTePDkXCK1RWHJx+XwmEeZBXd5ldkxskmnMtSOwZr76ECot2OO7bFLB9O4DBGhSFxyhMw
 F+7m8oDUCIguHv1+l0W0XM1h8/D9O9tfEUxYEeRkWUp5k7nrEi1RqR8tkw3rqF9m4PyHVoxnmx4
 XHyByIuBtzv8pM3Iiwbk6mbdTQ+HVygcAHt165WfBB+02RqOwxpytF59YC4WmJ9v/jfwiSXPcHh
 svvgYEsMJdSt9a1fh/pLDmtZkSTNOWrsgLlMpzcbcKcPbnzKE8kVaZALVSFuhaV0xCxWNsNEEbx
 QJNwUwyx2xmu95RzGXB9OR7AfIW2OFdY735UwBbG72/2tWKt+KBgssKoYjepD7y458ThWuf6vIb
 R2C2Q3O+TAtv9wTzx7gE7j4ykzfRy0v/2bC2zNVc+FkXiWUWbCBtHPq2/MPIdmRNKKiVTF12fDT
 7oPSlz026VhIzaIQcpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170146


On 4/14/2026 2:59 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
> Should we write a zero there, then?

zero being the reset value for that register, I would prefer avoiding to 
write unless needed.

Thanks,
Vishnu Reddy.

> Konrad

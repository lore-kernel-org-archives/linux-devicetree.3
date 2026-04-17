Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0922F12AE
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776440230; cv=none; b=pftVN6cdbarYlbNvG2tiTVjEN+gz8prqKSerklxObdmvFMiVA3jacMYtuw3I3xewM/SwvF4Fz4dKLViyawUNxVCj3ydLaLU+eQKXE79h49Rt9M5f/D1c3tGkpaVnlIkaTouLvEo/05vb0zmW1aqFRJ20Lk4wKQVqfSV7Ryt1Q/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776440230; c=relaxed/simple;
	bh=qJ6XgO+Z4q2nOaiJ/NRiGVTsW6eC14GjcLX2jUr7Ygo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nz+qcor7/6oGbHPwf8WcgG7FL9r4wjKSSlucSaBduAbWKInPvIMHOsfleuWfkbWrxISiPmd/1fYg/GbL5IRZuSr0bxHjxQWfyKDfNommdL2ew6pW/EPmDP4iOtYUR8zfDt6v8I+yaA6NC80ptbjx5NdpPqKKf6cPQEh6DINg1jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYcNLUAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5jkDefS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYcNLUAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5jkDefS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEY7wS1981949
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/kp6DxhkJC40rZeKpLXVuU3JvhzGifeqaHkyOv4r28=; b=PYcNLUAL58xTzjmZ
	6dq8x6LcZH+1TF+hilB3lsT8//NZYMLo7Kw11FWkGB/B2RLZvbhHQT+uw3y8FKlO
	UgSAbJJYQKld7kKAIbYwbZHd7AQmCJWXWDMMmZDQ1Y6G6L0ByDA9K0d2bzU4QclT
	PgcsiVpNukuEBLx5Rlr0sxNodY92yocCM7rxoDCP/WT8SdCRbVHoICh+YvXbKIB0
	lP86jCKc20Bf8LN1FX8yzfrQgN3R2l41JiLsoS6o64mnPZ+1BRDHR529gp/bmngI
	75zdxxmCurkua8Fh7NVNpeRZq0qnRmdilA4NmnTTQEKnn+3FrCSPki8tmbbM6apr
	2yK1uQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jkynj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:37:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so15489665ad.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776440228; x=1777045028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/kp6DxhkJC40rZeKpLXVuU3JvhzGifeqaHkyOv4r28=;
        b=d5jkDefSiL4t5K3oc91WRBI3e1fxNzEj1HVMg50jM0xelWnVxXRX4kiYo9kd0E+SVk
         iqpb2jip5hJ+uNkaTneNvlXroefzNbX41OXe3SZPYK5VIq3Wmz7DWAFHD7ra/NdR2gQ8
         y+nORwsFv/tHUxvSm2DyBnHaBpydT1vH0KCePjr0AAwjYh/y3APYtc0aYQJUyWrJNYMr
         OXLx++povc0EqQRLiLMlKTGcYuuz+IQEWJxmuC530I+9L0cDX9ExyODhCyipdrhTJ/6q
         rhheJVuFtFPPhbavenD1vpyy/hUHqrsOv4gZt+nMEwkwJT+RkPmwDjOkLpZcFiTt+kR8
         7S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776440228; x=1777045028;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/kp6DxhkJC40rZeKpLXVuU3JvhzGifeqaHkyOv4r28=;
        b=V0roltdOPlHF7/5NlNtOakKw8qkjmBB5BShdg2ytCPcPxHldoknREfBZQdefz7b66X
         Jr2zHlKcyDbXMmbkdTd/yslnmUtxX3KiOWnAnGKKrlYqNVSdlNfavopVAasLXqJpwmEZ
         kVJsQkIyIkd4CVlDn/JJYm0BnHm9qeIppK6a6/i8SP85/FBYD0wqqMG/1Cfgfheub9qt
         fUMra+pu/P+8u8W1viSRi3oSJhQmlywt6oOKLhvSXmGHzU6uhQKiZRw6Vnl2sh6IH7ba
         sRezJ9kdMLavpHwxYaqgN50CfbR66L/VTeh8PjSDxgV1ARX66Hlf4LGyHBULS/bXS3Xq
         ijug==
X-Forwarded-Encrypted: i=1; AFNElJ9KHsAL0iH8oHuYLeoFEW0HaDzxAe8uYCzFVGXyaaCnpe6jepRrDVE/QMKNGMF7NTxID7NjaIIMEl5a@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGMMAJRGc6NqY40HCjMgcbyVmPhG/U22VrKY7tlJpWRbl8c5Y
	78juQtIQ6Cbf2EJa48AQDX27COI/SGY2YRPJa5a71fiBBli4GN9p04jM7bw8g+5QjXurxtAf34e
	BAzQ5NZ8n/YGAQe3deJLwAa7a7p55ifqXt4bR9VtYiKA3CU+NGsf1JoEHvxf5lFEe
X-Gm-Gg: AeBDieuR2aG4RIIJ/TpTDzhimtYLC+PbA1t6joN0i2v7LecaFqASvdoQUKoWabdQtjQ
	jMNupTW60YD/1duXFQjJ7SrTi6dIv5AIZRYJ0zhv1LqaboHKC/yd0Fa0FhYr9kDCtYfeb+R26Ze
	OwDV7kAR25M+4dlQGVrJcraN0e2LATZwNbF4iACbYoQFsUmL/d41gWD030YLH+TkVPNUDdES0eR
	GpBUbixXAb+lvKqlnn/MmwpjezfuJdrBt6kkLfqrMeAOzOO2/yet9tY27K6p4d2MUBHDgGZ9O9N
	xXOnTjYHBmi0ucs00zD5YakagIxeoCxWWIaz2RSS8VgimkMy51mOSIa+6BruWwYRJ99nHxGeWVY
	iBe75kre7nhMlOq60gW54kY7AMmLOxtdEFzDB9DxVGgrnfffs1OV5YUD16DmBtWgu
X-Received: by 2002:a17:902:f788:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b5f9eaea76mr40171285ad.11.1776440227749;
        Fri, 17 Apr 2026 08:37:07 -0700 (PDT)
X-Received: by 2002:a17:902:f788:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b5f9eaea76mr40170805ad.11.1776440227220;
        Fri, 17 Apr 2026 08:37:07 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm23819975ad.9.2026.04.17.08.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:37:06 -0700 (PDT)
Message-ID: <f811d6fc-bee5-bcf2-bbbc-408b777536d9@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 21:06:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
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
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
 <d1834575-768e-4805-9e21-50a796690bda@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d1834575-768e-4805-9e21-50a796690bda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e253a4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=039WMPxP2uN8QpXWscsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: rlwJpHE8uVB-boERCrcZXh5Q1vCpdItm
X-Proofpoint-ORIG-GUID: rlwJpHE8uVB-boERCrcZXh5Q1vCpdItm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NiBTYWx0ZWRfX0l8V8mivDXpk
 M/OGzcBjzjUqAlJ+wv6+8axIsso2F0sS+kBpEz64L5nzVLJncTeVWOUCNLvq1eEHCcsqq4tdOn5
 g4LTHPIeLyYuCUBqtUQ5qdzNxKdwCIFVYUIbq17ofmsKeWc/B+yj5VdqNp7K8emwxnzolJM42Ec
 kH6eruJ19GHPNBJwhraH9xSPlSiS6toMv7iLpBh6Lpv3Smmca5rhemijVKOOvrGkZuM+i4VOyi2
 z41WkXGphTDVd1CWrSbm0gi+81MMLP6B2t5tkOQGwlbH60OTO9p7/WJl7KnYdg1BQ/lrv/j1jbh
 VUfHPogLJSz+rCYhNens/17UY1Hy1E9RSmGTonu/97Fy2jNGMJJU1mPVYtFq7G0orTWngubLZMs
 wQa9GnaYOFBgpDeXrVI5gYBv73vKi8PNt3mX6EKeARo29r8T/vUKCo5ySYBNzzERkmobWRF73YN
 jP7A2ug4ggJnKjzbnkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170156


On 4/14/2026 3:21 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> Select the hardware core (vcodec) for a session, based on load when the
>> platform supports dual vcodec cores. Assign the session to vcodec if its
>> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
>> the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.
>>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
> [...]
>
>> +	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
>> +		inst->core_id = BIT(0);
>> +	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
>> +		inst->core_id = BIT(1);
> Let's store the core ID as an index and only wrap it in BIT() where
> necessary to pass into the firmware

For the current instance, I'm marking the inst->core_id = 0 at initial 
to skip that current inst
for the calculation of current load. If we store index in core_id, then 
need to pass the current
inst to iris_get_core_load() and additional check required in that 
function for proper core load.

Thanks,
Vishnu Reddy.

> Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090B26A0A7
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342728; cv=none; b=Cw/MCLUbcpWfx1/qelrci8bM6BGct8zoAtJaFcNDuCuVKf7yEvJt2RbuoVcBo9QPpdOScrGVhckY0/yqcsBY2R9Lr9wXlT1DDM85iF6roYWkd82U6WKpP89z9RfGtW6d2TElcOHpT/Fwm3txnRGrE3hqAQnUEyDbgLlnauCuqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342728; c=relaxed/simple;
	bh=Pzdv/DlhQ6MWl5qmD6joKZY28whf96QZcfVfp4GIB40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+WN71O9JmsTO0q1bCEoR+FSdMbEun1u+G5P0ilYeuFbDLBsPc50OiTOGoz8dnKABGEHyacChTzGZDWmbwzKD9xOz9VivRwktDqei75ITq6Z1CoNWhbzQ1WqlHsvdjQK4GV+yg4W8l1CIWkKoiEee1OnDp216j4ADDMddXoXS5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv27kMSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3kTfOjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv27kMSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3kTfOjW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KLej6E3680289
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvEhCAAaEHxiipGpPIpBeuL/EdYORNpcby/vL/G07iE=; b=bv27kMSmqFjn9kkw
	krb5oAq6LRGF27cCtGPhcXz9sQ7nfOyvQQAQd/gSIwQNYZwpoNrHXZmk27h8qJYY
	a6K6v93M8PTS2h2x81ob3+fqFDr1SdD+cjJ4aIgGZV1C08AAR64kPA4kbyDoWzvS
	hq+b8uJtQDzdCsPMcXogrcOHDaZFH5n/hQNmNb7irCTL9V3+nY8NoviZusSwIxpy
	MFnml6KyM9Jt4EiZ+qC/xntYNoqEmtddpKmN9zwBECUqXqBt0pMi34UplpXSJQ1b
	Ki2ffKQ5K2QiwrNH/2p9L28qwMfJb2mGAcubcZ7CLHJXRir4yd3OU6WZcPcySbap
	PoVEvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j3ax1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:52:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso57017125ad.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342726; x=1779947526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvEhCAAaEHxiipGpPIpBeuL/EdYORNpcby/vL/G07iE=;
        b=V3kTfOjWhGKV6DYlavBhBWPDykjjuUuBRP2ddV8oChPy53FYRk1tqEo2pa6V7MJW/O
         4cC9lWJFZWAd0cSLh+qKP2kSMCqfMEAEsjt5dnm6g7rl09kLNdujHE5EboNmIFRpGUvA
         ZQbkW8UzCGUAGct3FS/6HOecMN9+hCrzga9xc1zna0SmUsMeHUFvCfqKPoSjYNVf2m9/
         hHkiO4DF4oAfAF1lLHM+d85omYKNy0KOdghs+WSqKWSixPNhZ41YSjZ6nctfZSBAnYr9
         4vggjdR7fncP0Agvhts39Nq+4SYKYD41G1OQzCIh4utB+aLHoPHaqFyFhr2PdB6vdJqd
         A61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342726; x=1779947526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvEhCAAaEHxiipGpPIpBeuL/EdYORNpcby/vL/G07iE=;
        b=sfOyiDu7LzgXXIW/rpfJIrQd+5ELpEQkb0iqrNAnQ9zUgCKb7SsXm8VLpd3CXUii4H
         fYNt+lWys+hxWlLd7uWHHFn1Rs1BuEbVcDasm3G+qNqMDGje5tgpbwhqiu/Zkh3IY54J
         YxNq9LZxGYBY58KE3z2vNZqpq8D/TmDUMTAtrt2TW+AYAWpStZLlkygRNUe7s8WAtOoc
         oCpC9oLU+Xa+nmNltAINzSCSql5Q7tPwvmTY0vZ2gPb2xoY3XEvXiOI3D8AVuCew9ijl
         B3Yhj4UIU3b8UMANsplaI2ivkOyF0pkTZFD6G5Jlz2YNLq2ovw/rhPbObIZPjFd633Lo
         pUFw==
X-Forwarded-Encrypted: i=1; AFNElJ9vvg/IrfFAJNjE99a1mWnJiINkZKoSh3qaCFnGfptZcIeVZd/XRp+DdjX2eW0TBT3PB2RHnO1vcz1c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4WH7wngKU2wZXM8JDEc4AWDwSA+zRDyDKhkHA0xLR69Uj+SQO
	4X0ANeFBttNykECFKkylm/ngyVRk90/NOdU2/JInnsO44KqDpJZeXfWQRKJ7EHRW0wPz6skdCAT
	3VakpoA0+7PYwE4XocwwlX5BSWEXG2rAxUUs9DVMRW8rfEXqCHQfFdqXVW0foHqaB
X-Gm-Gg: Acq92OGJGXgkGZbZqX/48NwX+K9BvWuX4pv+DBDLG2xMxZw1Zw2TdEfQi73l4Jzg5Su
	ooIgiKo+kWdmgDxVjc9sjl0cA1DshW7KbToIdHpnVq0wlxv2GEbdCVyVSHBXSfZLT5d1lEVRzw1
	/nzxSWv4o81793gtViEgSpFaGygkB8mGLNwsbN62fQlRfJ73tyTeEt8c020p/t3TwvGxnXCMqOd
	8zjRykXnaUl57OlKNju542VR87l7crALJ+daAzCCIaeD4b8o/eYO9OQaYNDcwn1TviOmCPQyiWF
	OZiPfkqpQ3PHVvz0LSQwICniwkTnDTc1ulxzEhw3IDHcYPS2LfTCsoEPiB/sRWkCb8tAntfCyQU
	dLe3NXMLmZWS60a3W5eX4glyCCBL68cJPWsAzWkxTJIppUzhbTaI=
X-Received: by 2002:a17:903:110d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bea304ce75mr14982065ad.24.1779342725618;
        Wed, 20 May 2026 22:52:05 -0700 (PDT)
X-Received: by 2002:a17:903:110d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bea304ce75mr14981655ad.24.1779342725141;
        Wed, 20 May 2026 22:52:05 -0700 (PDT)
Received: from [10.92.163.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm235890855ad.25.2026.05.20.22.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:52:04 -0700 (PDT)
Message-ID: <4d46b38c-35b1-42fd-8bae-239449978402@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:21:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0e9d86 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M_1ArNHsO3nQ0OE0WJIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FyEmJiOdBlmYeClwbMCPRt-FBUwfP5RQ
X-Proofpoint-ORIG-GUID: FyEmJiOdBlmYeClwbMCPRt-FBUwfP5RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1NCBTYWx0ZWRfX8/TI532Qb50b
 AN66MmpTKh4dPY3hnBX2T7HnmdFwStpNnYguIkxKNeWM2yL/DUeozOsOLWvZSMq9Ubaupm/nbHA
 uvFum5xMgUBOGEaHLWIpAValtChZYN0qibfhcxMkEHwdDgP9NQEomiC/vLC9B1aS7ZiE7tSyN/W
 tsHJUr8tmjr3tSfqX+H+4qFIuIIV+gxBziXSu57I3p1ebAWp+1z5n4oJuL9+z70gOjLSXOK95lR
 9HOm0BN+sfBapogkWGvsXE9x/zD3ogWWjrhBiVcgf5Fq6Tc3Ja9gBloe3N8pgO1+Kj0OgF8H1d8
 C8Kwm5wVKD+VKWSzVKpvQYiqrs6uyuY6XPkAaugHBZJQShksrqYx1o275hTG1zF6ODaCBK+CHhh
 FLBR4xPOXUNhqKMX8sOQAxwyMrIjZ0RMaEfVIsh2h0undlB7PPeUkh54ZDm+Ro1iwZdCr91I7sp
 qPTOiWro7xQ+yX4DxWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210054

On 29-04-2026 15:05, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
> 
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
> 
> Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Bjorn, kind reminder to review and pick the fix patch.
This is required for ufs-ice to work for standard/wrapped keys which
isn't in working stage right now.

-- 
Regards
Kuldeep


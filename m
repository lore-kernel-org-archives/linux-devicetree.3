Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6D5437C4
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956257; cv=none; b=OLMFbqwRrVj+sGr/JxWMdLVTtvhdF2Yt3xV2bgLqzV316KLHjkz/sWCUPP5eGjcZbQtNY8gLMvIaFPMDpasGLUtuWM5qr6db+UqPK9PGrV1K2eUZZx9q0/Ow/yDY9IMnbGfN/ptxesGhLXdjj3VvnvXMvWwzM/VNImk1zHSMskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956257; c=relaxed/simple;
	bh=bXAgZEEwtA/jkRMEdLGdUvl1pzruPAiUjgoVTV0DKWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4UVv77+x6k7dYFyf/KRm6o6WACiEQOCL19SeReyMzF/jHc4nesGNoyrzKfWPwQZ0EMruajzVjKzB3ovYSdh9Efz7jwSlq5DLDWcP57v2IGmZpIfXuEoFxCwirhjZbDFjX1UQk32kbxmP4tJPDeQijW6j1Wugn4HjIKTM8B6/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfS9ydQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJn1yWzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfS9ydQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJn1yWzw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFfn2171930
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=; b=nfS9ydQ1+Y5bFxe7
	/qpgH6ob9X7llIkWofVSYZ/zLPn8907T6gClj9B4OEFaXZnr8GJUXaK0pHLhug4+
	+Zv1GzrgdQ2PdwsDqvsVrfydmv2USvmjGvQcWGYtzTYTl+JEdsP3ULcgDbLfkoMz
	uHC//EJUDyvTpcSJ5DTSGLoEvLWZq7poFk6Q4ljN0JHx3kR8jhv8ZNbrGsMhTRBp
	hfnPE205Ku0IBDdrrNAMv8gDT1TSj6b/ZMxzma5K/X4i2ScPCQKEIQgvWnpm+SbJ
	UDnP6wnFNcqTtbkaXcvE7Hg888vrC7ZSKYnaDVDT+e+5aD7mcvxKTPDnU2zJ3QXF
	jxPvOg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rggcgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:17:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso171041137.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956254; x=1789561054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=;
        b=bJn1yWzwiuRTvFzNvZRdS0zE0bgD2ZqXq3Tu45SkPQeytFW39Zf451a+mFMBKWEBvB
         Nr+SW01dEI8u/vV5p7trvX9w42Fn9svCXy9BXb2Otx8F3kAbotuq7pYuLPU8DW8ZhB71
         ybsRcw9QeUnXo3GMeBEvMuvqnIYnXgTdyZE//M+fA4AicIYHh5pPR98nW6DgoTcSIxM3
         aI/TQPx3MsH2LBB7hzKFC9xEaKxrVF/y7n6Xs/OF14YrOPJzu+SkxNVQm0fArjnUJSKz
         +zHQLHd6KO1uhpKUvAxt09c4s6qEeKauRzdQFRPi6/QZ/feeehA7KjirtD0iJ1EsMFA0
         2nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956254; x=1789561054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=;
        b=XaxdJ9xSTvElcS/m/YITyX1MmbDEqG1L0RvDZhhCYiiZr67hVZ/UXcnjGNFR2HL/Wy
         Ek6C4Mq6szJP4HFI5Bf7/ukVYOqVE7k7NtJjx/utnO0xPwnb9lAAqa+uSvUV4loPJ+Cg
         uFp3XbyfnD2HIWokSuboCb0IBKqsfoR4rQxpBe1QBhzIcrsXYhR/FhsRweNOhUsoDpMu
         YNr6YR8mT67xs4rUM4OAAYMneSpekjBJqPlsHnv8BSEIpczxW29igtkKzVpMjZkpYBLo
         1qCRBNFvJMsJ582+Kh3/D3lSaRyr4nfZKNstEFkdGidy22oBtnKpen+REIVZQk1rFJAw
         Hh2g==
X-Forwarded-Encrypted: i=1; AKwUvBxxN3d4pbScMLmbiHNWzMZZzNdCNSNWE4zVuCQaJHX1USbp44Nsg8H1sCptzGJYp3s0hJElsxJSNHMm@vger.kernel.org
X-Gm-Message-State: AFuF++m2CNjeuhtzIY3gpbR25nCQCk3y+NPtnC9wA306YpBn1cPo42Nx
	KQMFBzII43DIGMreXrANux9KMuV/Z46v2Z/9j/juXSQdDLq0b9jnmkB7Yw8zSnwgtYOSyljfC5k
	9bkgQQzDspmQVKnlD3ch1/6NEHhghp65KcvgoKEDUibRVGzmS8fWKVYXrsrV5kIf2
X-Gm-Gg: AYBFou3P0qj9EyYC+NX1qQ2sa0FlPZENMwRGnbaquNi//X3Er238Qk5rE+aFHDMEc1v
	Edygla5fLMVdzg5l4eL3YFXiA2ToL/rkY2o0bwu2MuUOvKQhf1N6n393ddaIXACdthoWePD7Nd/
	2fE4FTl8WUps95VO73EFuYbfXziDFSIp51OiYLCudahp+jKt5Baw8XgTcmEcn0H9ZNBU7271PrV
	6thFjoLQ26LeZCujhgtycfm4pbkinhzL7bjrVxmwv3kEBJdMJboNlXb3sb1Q/dARQqVkMrD8vwC
	8fGQyiAAbF33l4NX6HR8iPCbobPy95XNexACMaDfd7RFTZcKbRKha9JyMWjQKUtNQBDFcxwfV11
	XDQk2xS3H2P3kODBC80HyHA==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2553367137.1.1788956254520;
        Wed, 09 Sep 2026 05:17:34 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2553349137.1.1788956254004;
        Wed, 09 Sep 2026 05:17:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293ac38ddcsm49873166b.41.2026.09.09.05.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:17:32 -0700 (PDT)
Message-ID: <e382fb22-0f95-40ef-8a36-afb22b3d79c6@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:17:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: Add initial support for Nord
 Ride Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX1zYrHkAwZr0+
 xmVHNJ6A+R3Dwi7J57tlczj6L7NX4fogzP2k49ogPaxvZ5ashdKZoW+4S0yjdWI0sqsRbkmTIQv
 VSbp3Anm0XsPu/lTZRYc13w3e3zhCho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX7eus54SEiatC
 1z2p7JIuWN06ME9Oq/w8GxAotAqbJ5VbONG0tkPQn6GOkacpuCdJ1nWyz1kZHsxGUXj3URF64C1
 Wam3AIauZCR1xbVHid+aTDAMtTluAPVaLWcDLayWQhrZUmVNHJULUc7CyHf+YLs5ipS9TlRgH4B
 7sKMUHzE4G5d3I1yEoqkH7jHC2dEm5dekPVHLa6feKqcddn9vaksxaXhQemM9L34/xzEy8y3o72
 cchBi4/BxVbYN8k1b7KqtIuBPfy/c+/jfAgxnCXAfointj6bWwI5ja5Rvv8j8fjnLsVnbpBrjAo
 Lrp/UZ6eaePjZwlfxZXAhq0ZCmMMA3VvYLcQSlBC+YwLkAIFkAgzNXZSh8EHOZ2GHDixOAnafDo
 T39aCqN8HBsvkURJZ82rOGvTX0/hDsa1lZfWCT0p0UnfU1qxB+RCRMZJF8LQVrrlxjuyI6Qaj/G
 MxViqHdP2+mYw1MSPFQ==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa14e5f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GJqCLuEFmrbm5pLexBUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Jnpojh-p9G0raSMG_bDPerAX1xcPitkc
X-Proofpoint-ORIG-GUID: Jnpojh-p9G0raSMG_bDPerAX1xcPitkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 9/4/26 10:16 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.
> 
> Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
> and describe the board regulators supplied by the on-board PMICs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

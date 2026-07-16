Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8998E435AB7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221267; cv=none; b=JD8Y+M8zMQ4h36+NGXq9DmhnId+/y/G+mC2PzwLObhQBUmfT/AacOA2eUJrDP3aQ8wWN6S0+yDZmtBXvxhzYfFbwbcLdei9NK53k0xK3M3Uv50no18ZwNW9pfwO2M1SSoyiKOR4rJmYc6uYlFwFd742O3ZDgo3meyiOmCUXyaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221267; c=relaxed/simple;
	bh=7khya+JmkdbvAZW/BjR0XrmZTc8RUlPWx5VB4LgQKvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j75J555ZIFeRLOIFhAwPEzbzdbDQ+FqW4x3o0mmy6grmFp6zoAiP6I+4GoHpiSd52AqvdWJQzqBZHXcoz/X7e1EXYYK7HWxQ4zIqKUMk+W21rtmdjMw5iHH/r8I+xYvJQcpZfet039lzxWFUxB24ws1fQCE1h0niKW79H3l4tuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYrv0YaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACRzedo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYrv0YaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACRzedo+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSuR73337071
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xE2n21XGGPNscn1wFn7RjZ1dRi3w18S9apohZyiCsRQ=; b=FYrv0YaKOVYcALYO
	3oQCHLNMTPZ1Ce3MMKuu9Z/pfs+O4hSE0TEtliKodGgHpKpmbb5//UuTl45b/V2l
	unrlcHbvVueVuei7NjPsISKU8sLIGVzJVI10Mkw3hwIUFzW3k4PmP4u45IJYjuPU
	jkoW0xFmKXLQJlswtf8R7RvVY/vMxhpiIrP4jT2W3/W0hSmMah0NtLuapl9vraNj
	D64KuLoRJ+oJ852aN8whmSQ+oRY8RciGQRxH6CuuyOx664t47puFFdoA++hqMLAy
	hYFYwfOFN8NEewDL4v/bnPgCgenIT7Sx7YuiGrqFihENdfrUTRXnUboF395m7Ixb
	zFt/mw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1t5rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73761f92dd1so80617137.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784221265; x=1784826065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE2n21XGGPNscn1wFn7RjZ1dRi3w18S9apohZyiCsRQ=;
        b=ACRzedo+NlHLUMAhAX/vjUlhcNZGeJqWPEnQvMgwK0B8Pw3NKm92bVvPnOU4nLVaCk
         J1zR7/tfIDPfeLRle/fM/bFc50QUyF7wa7KrDdedyuNeZV6wxKGkrvhrV+zvpBP2tj4J
         YhjaqEJ5DZeUP0BZnTgsDwAN/q7OWfyKPPP+fo8dkuLB5GJW3Q+uOdPkwYTJfREdV3HN
         S9ifpeWn6+dSC6UeO/4cJxjsNSwkkpH6+kloxMCi2t0OVfjZQncy8aplKG0MrYRCRLD3
         7UyYoIXHzGdCAgkzh+lABvhHoJ6v5z34HNOkzoU2q6655MvXSNojk8DUfu/OTRTyQhDV
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221265; x=1784826065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE2n21XGGPNscn1wFn7RjZ1dRi3w18S9apohZyiCsRQ=;
        b=cMvrSWjHEXhLSyt+u2HK1E3ERkRMFdkV8AIf6Mmlj0hDv/VT0KKq4f0srh/BM1IyRB
         IuBbA7w5qeCQN1QyVu9dX/rvUh8Jdxtj8WzsLuvg+w/Dog6+z/LuFdMVOKnRHoaRUeTD
         REsA4QUFldV0xlMwqsitQ2OkTFPuf+C2REZM6T1JTNMsocrTPViR3B5y9xHQwSZ8lqK/
         cvn3E4GEIigxebP9xano9iCdyOSCR4908DI3p8E+wWBgMLFeyvMtWP3b35koktq1VCjr
         I9ScS6YXC2lh7uvELFvrl6AXFpXGWHEP3MuxW96laZBwu6jqWIUEuqttGMYeOQY21SFP
         I4Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqS4PA47yPUscPSh2zHQEAg3e6tfwKFJ8XGezBDyTNZ7LTsXneYNfnQVD/zehV9cJh0jDPeykM5i7LN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr7gGix+6B4iuqa/+TVU2SX3sLll4jpJjVJQURdQf3ReNZkx9l
	REZvpbGDtMOMwrfakZwTnr58djrCZ/F8o8wucYb8gMvMylBz4A/axFPP+LEAoWwbY9ViodOPT78
	KsT5qN3iGkvq4LJLjltEPJLN8ZoItIjs0Mjgwqyu6I/XQRTt6eHPmtc5QL8PBzTrg
X-Gm-Gg: AfdE7cnYUAnY7UiI5GgljrCFMzRf5wwyKbzB8N9fCoXwih62s3QqD2Z3becOtVTn+As
	rdUIw3FUzynVVcaRQAtI7JHo4NKcFN5FcwmFzyoSJVtULG0e94giRPKZauM3g6QPLP6p3cP1Dzd
	VIwvoZUROYXesTgOUWOEVIT1SiEl3M+xzXhixIn0r4kF24Ym0Jv+NTKuDJ0O9MQoGrJITlyl41f
	Ub0KukSt/vr5DezOjGfTE7XA+L+ge/iYC65RsRwPeDsEbtPp8ZdfOQpwEmD4x+Nj9CIl1ngpG5D
	r76gB7ltpOJKistvfysMYMVBE9VxcgvYayyuPCVuelRT85/9rOK08XX2YvcabI55JYQbk9sXqf9
	NF0z9oBHe+OgklcmFrt1lOb/j
X-Received: by 2002:a05:6102:5a95:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-74533ee2e53mr4993949137.7.1784221264593;
        Thu, 16 Jul 2026 10:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5a95:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-74533ee2e53mr4993905137.7.1784221263968;
        Thu, 16 Jul 2026 10:01:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e183sm250900566b.51.2026.07.16.10.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:01:03 -0700 (PDT)
Message-ID: <916e2f7d-6f9e-44db-aec8-95532d265dbf@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:01:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Add device tree for Nord GearVM
 variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfXxVuzEUe1LBtB
 mXBoSzlkyPxhnMpedZU1bmEykpJ+FCAUN45GHvI/bIgieV//XOQMIvSSrY5Zo0ODDmzsZOlO0S0
 8e6p1uBhHiRWAmO5bXJGWJ5OCkbfFDymn0a96nfXO6g2sPG5IvN/uYdmIG2g7brnhs1cPuzYGem
 NrafS+AArG8ammaaVBGDEt3dJH8KSoqsheD9PipbbySHb1iz+MiY9Ckwk8wZZi7FkpEQY5uHf2C
 cqLXC/Q6gWgpnKnard7gWDlaSKQisYfvv1xP5U9au55ILd+QHmxCKMesbXgsz2xQlpNpkiFQ8E6
 FT58a5CDsxjUrXxtLsuOJEbpG/7gdCvgC/OCUUGJ3kzINn8Xw4S0avuPcB+w6bctgftUwmoFXJR
 ct3JrEwJqExsg4qLJ+rY05Kzh7sstV1dlxe7eOehjiJHkiTMR+4vck3gC9n90OWyrMO3rSQZW5d
 XhZA6LLn5GgxI3JlOmQ==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a590e51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ARTuZpYo9qy-_ZSH7p4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: ojsNQ9_K-Qx6qdR5Jh2WTHJt2W8YHR5C
X-Proofpoint-ORIG-GUID: ojsNQ9_K-Qx6qdR5Jh2WTHJt2W8YHR5C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX8dvhhVJhvTSL
 xquKILYvTZHvEGdHktqwk+8wOAzj3wcGaiLn+FlErO/JoqqgFlJBzYQhngVN2ques/k6eEx1MgO
 4h7t8g4EN58IS6zSNyT8cRcmHDk+gGw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160173

On 7/16/26 4:25 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add SoC-level device tree include for Nord GearVM variant, where a VM
> controls platform resources (clocks, regulators, powerdomains, etc.)
> as SCMI server. It currently covers:
> 
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
>    controllers using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-gearvm.dtsi | 2911 +++++++++++++++++++++
>  1 file changed, 2911 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> index 000000000000..8db93c361c2d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> @@ -0,0 +1,2911 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "nord.dtsi"
> +
> +&firmware {
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +		/* We expect the bootloader to update the IRQ number */

/* I expect this not to be pasted over each of the 64 instances */

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C87F3C4B98
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042345; cv=none; b=EpGEaKSfLJodD64lRk6T3L1w079YxyvvH/8fB2C5bvdWRd8ojZ3GBfI406rmWEgQN1WjtCm+KlnW4hdBPGpvOZyjCfzrBZph4apy8K/1gyU2b0YpYxkv20YAEBvh675l9kE5SW8jR7ONCHhtrU+sHt0iMbM/XrkaJPRM0XXMlEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042345; c=relaxed/simple;
	bh=C5/4AuL6dHCuR+PvSd4Li62LFYfLWCvoVixDNatHrQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpRTXgbZP4kBQY6gKiGe2XY7JTyeSuOM5Wf9w8VVPUMzOcK2UOOc4dIqic9phdSgzKmuO9L2SdJZRrWl5C9slpAkJRUKr0tWInClRr/ig8rjACTS0i9CMc0+b4L6k7G320ROqgbuCbIsE+6q8UkJH8Om7sMlvFwYhL2d07oj8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAmwSLz8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbVIfd7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAmwSLz8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbVIfd7U"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HD0g333595369
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hIgd5emPImxsCYoDNvc3nRtQaDZundm1lfilHY8CfE=; b=mAmwSLz8eHCshU3L
	eVkVOLIP4k8QCd64PSX3UV2BqIP/+5RGoRu4VpWbR4zqiZFT4utbPSj31iqzKLDG
	rQOYJkV9fv3zZSOz6DLJcG67gLeulTtC4TegOYSv06GcGxTAmyxkqSYnySHzNbO0
	np5Dcu5glYGjMQCeiWoWdQt1JSp44ZPmqnEMQq7a2IEDlMv55M8UH2t+IMKVSUkF
	58M+j9wtnu/8fpsHUvOauNw68pNLVGZwgcjl5OMkM0LU1c+HETUZwGZ99nNo2wD4
	0hyT6fFxAn5gBagZ1npAsWXPeGzg5k0tije10qv21chQXHYn6MszILHrIrHV5Q1d
	FPobaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw3bwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:25:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso102642a91.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042338; x=1779647138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hIgd5emPImxsCYoDNvc3nRtQaDZundm1lfilHY8CfE=;
        b=GbVIfd7URe/MPK2mdspM8c2XzfNfS3esaSilyc9rbYmR4+MBBXU83d3ulo2qSIygPN
         0GoPJv93ILZh9uyE0DNpn5zbcWxoXKquVakZnGF2u5b5srHHvb2rS8WWjnmIRt10LfVE
         tn3FlyMHWNbpi8QtbKeMKMojX/oDP95jr0HAf6NORYKMiBhm8SrJP/oaUf3xfEHN24ZK
         fht6JZn5I4DlkdMbkKv+srRkxmdZgX25jHkOUA5tEZZZ3EDGb1bUGCZ20zI2rKxCSq1s
         BqgIOQCYewAMVyVbG+2Ht2m+WMutO1+ddggl09vHxLwRdiccmcqNubHoxLCySqAlc8qj
         Su3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042338; x=1779647138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hIgd5emPImxsCYoDNvc3nRtQaDZundm1lfilHY8CfE=;
        b=HuLKpDgLo+O5rcQwlRIkLUNlqR/Fe85/F3TTCGzds9b1ClTy3ziLxtdP5XQcmahXJB
         Jcv5ZA5k4IeP/AvSrIdeTH6KSywwq0a+Snc0SV4hRtvho4vEF+yPZbHXx0luRO66W6pu
         qVJo5SyfWcgCVWYvaAIaHTN8t5AdWBvPRKQ4ht5N70lkZQlf57rFQY8IeYP2drLlGH8y
         xmEjDKMFNEcDVRRgVekxfR/B4O3o1zmJ+FxJ5yOhkdYa7k8b52FKooJWRUDkZAcP05C7
         DgOlW9jKjAiVpsjw3mq8YlYSYdSnvnYQzTTerDYNQvHMseXv8HL/iNdsbBvthyccetdq
         xw3g==
X-Forwarded-Encrypted: i=1; AFNElJ+oHyvOq6PEY89u0wTWpuzvZovonHSmy3Z/UKKHaCeB2Ay35JiXs3sJvJa1sz6NI86zD0akUGKq8sGY@vger.kernel.org
X-Gm-Message-State: AOJu0YyspcJ6ofmx4Qwc7A2IiVEd2XxkYq/jHUxdxp65FLmli6Oq9v6K
	cN80gV0WYvoNowdgueSvwve6doiyp3GN7OU/z3wmJdMI40CFv79Z9urUloBH8T2xb4lteH/xVCZ
	vWH6nYQGFXg+1P8ES1Bqzpa0LWVQ9taXZ0jzfI3pxRJI6TbnIrm0vkkaiLvXeQldp
X-Gm-Gg: Acq92OHuQo3kcAa2GxKsPHGd3oT2GiQwEmhEB2r1j/HphMnydepuXXfIe/B/L90gLUk
	r5Psuk4TjgbYDDpYwGlLIxFMhOAZdrTk3Qh3l1H7jxRKdUBui0makMuVnSRHsoTQ0v6slKfizPK
	2N4sVBwKFFYwCTCUEmI0031YOWlYKxOrZ/oKHvnS3bWqOWphEj7OwHvFCK0HScWoUT91e8yd9Rw
	sLBRFgmnO6XoG8bMR9SA5CSci/XDvuflU8YY2S26G+E5zd6izDHDvwYNUptCqpBv4FadQQQ1u5s
	RMJ3UGmzx5tjy+i/dqD1z8OD3RhMAHFGADowJ0UPwxR3ChcZtnL420AtV45JoZmJhcfonPsRsTC
	MdxZHJFEw15RyuDy+aFSXSx3ENK6iiSOAuwCu+do0eyru/FLiW5E=
X-Received: by 2002:a17:90b:57c7:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-369519cdb59mr11841971a91.1.1779042338044;
        Sun, 17 May 2026 11:25:38 -0700 (PDT)
X-Received: by 2002:a17:90b:57c7:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-369519cdb59mr11841940a91.1.1779042337545;
        Sun, 17 May 2026 11:25:37 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.235.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951278e7fsm8478759a91.8.2026.05.17.11.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 11:25:36 -0700 (PDT)
Message-ID: <68dc84ac-794d-49e5-a834-e7a582753b07@oss.qualcomm.com>
Date: Sun, 17 May 2026 23:55:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
 <ced00124-9ba2-49ca-9200-62abd6ac3340@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ced00124-9ba2-49ca-9200-62abd6ac3340@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfX4mEoSVZgATiH
 kW5xYF48YEkbxkVLrbb5B6KTEkSCNuufq94YkeRQlOWgyh3SFbznMxlyZj9kMT5Y7BiOv2OgGRp
 oo66sa4NTKk3E0BEXZR75uA3CT/GL49goQDYqofwyZlg/3ABzs5/QbvyInzgKfROQCX3/qbQdxT
 AT+KmE/f5r35VKxausRXgJP0jBhyHqJM+cAq1BKQDCoxsfAG7u2GzChrF8574DfInxgKIr5qW5p
 yTAJy31s9w3ix4EiswC/u9D9pqw6w9SRDomKIdTYk1M74UQ7VbTi3vFMwBvBtNVpjfvXTZ4SwGr
 4B5si/cGD0VpJIM0WO2Kp7SPcGw+KmB7AKghwO+EWVMhY7zTS2doZ2fa7IFMIjP22hW5Yoj8fAr
 pLX+bOqMsD45IQRIhIT8ScAYbBTMFFqpGubMJ29SBhy/RBnKKQxu8WLqf5+Ii1RvuPH/NMlixy3
 iTTja/XamssepGQBirA==
X-Proofpoint-GUID: uSOQahVEJ7Z60MaQ6Ix19ajtcng5Vxxv
X-Proofpoint-ORIG-GUID: uSOQahVEJ7Z60MaQ6Ix19ajtcng5Vxxv
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0a0823 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=g4/7f0GlZvY0MGcqtTB0Sw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=91D59dQ6MEgKE8FQPpwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170198

On 5/15/2026 4:07 PM, Konrad Dybcio wrote:
> On 5/12/26 6:08 AM, Komal Bajaj wrote:
>> Add initial device tree support for the Qualcomm Shikra SoC,
>> an IoT-focused platform built around a heterogeneous CPU cluster
>> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
> [...]
>
>> +	pmu {
>> +		compatible = "arm,armv8-pmuv3";
>> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> Considering there's 2 core types, you may need something like:
>
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

Thanks for the pointer. I’ll update this to add the required PPI 
partitions, following the SM8650 approach.

>
>> +	};
>> +
>> +	psci: psci {
> Unused label, please drop

Sure, will drop it in next instance.

Thanks
Komal

>
> otherwise:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


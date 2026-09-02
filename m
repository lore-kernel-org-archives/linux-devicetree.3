Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA874AA1F7
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366638; cv=none; b=UqmgmF84qDLhffT8Icj8uw2dmQsCQvbcksHf4RnQgLCbEUiFVH1yafAcJ3z2ee772Ep9HhZRlVViluoj3FxMEU+mVwL2fXO21/WJStKwbfEK/JqY6PKI9La4VGEuqrDgQwc9eQP4RyzTHiXsqax449FB+pHOMe5OkF9Tg6JgvlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366638; c=relaxed/simple;
	bh=Jm/GCgG3w1Rtf7Ytx9MV+IJejXDtp+gAXOMb3VKAutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQTYq8iOXVnuyex3gXSKZJR0Oc6eP8gKsa1ZclebriN/G5U5VCbpvZ9ddmVsGjpfakHP7B/4dLD3/0NVeAplk88g3pBGKm9M2VKNCkldNznXNyjXkMLQ+MVzurQVJEmXmloo8ObWtrjpW6BOZscJZuCu0lWex/jlgly1pClsa1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4+Vtoub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y64X2xN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4+Vtoub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y64X2xN1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZUh12067485
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 16:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=; b=K4+VtoubPjiIXRnh
	aai/86kVsfUaBNvo4dc75Qt6FnOXokWJGQqicgCX4EpUbDw1b/OTguGDjuplV+Ts
	pr7VTupcyr5pVaKDf9bJHgmOGSpLZiA1URafPwGjO+VC7tAwJSnSEiLPaBPp6TV8
	Cb12U4EaNxIt/+cKXcM/H94VX+hCuNg5VRRQ27uqikwM/xoqoU5x68H/cMp4vH5/
	gGy00yyNOzYtEpYIwrq6z+t91AlUG4PRnEyQiMyHZjh/XrGG8wtsE3Ey0jVjE0VJ
	3/vjEZFj4I5QX0TjLGMnwCix8s58aWv0L/EuLHmJ1jje1VTex+pX/0KEWaCfPo/t
	fUj7Qg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv897sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:30:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c6645a6ab1so62573e0c.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366635; x=1788971435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=;
        b=Y64X2xN15BDxTRxKpaFdWUjMQcySFov5DCXmiVyrnQV0ZnJgPYsu4AVk2i+pKbl4+X
         2kKEtuoIkt3AWc6yIGxETsQ6TeYtuqbshW1X8kvYkuyI2PK1tYBNjZR8TAmhkuXi1/L5
         YiVAdPQc7C+YD3C3H8dEcY1qzih/PyTZwN2iz0ta/VqndNwqFl7Rtz/9WpU4vS7Gh3Pj
         pRaLAKf8H5G3hEamVk5PtHFQ7Fd9nZxQ4anAU6VTKTIjDUwKLYUnung7WjOFS/dNZDGy
         EAO6KzrWQUrDyJi+CXOijs5lJXLg4CEzTWBSQUg8da/CZn8nP2/n4LVs2JgVjU7fReP8
         5G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366635; x=1788971435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=;
        b=CefFAN+hz70dyI3dCDE0+6aT42DSSRgD4MJGRK7qMCEzpt+vXi9f3l0kpx6XzcNbtT
         1JK+pP9KPjjWaebXL6nh9o+H/evQn9bY4rkWV/EGp2joJHUy9AfPy+hZRCYLrZZp/JUU
         leqyQEXcVmLpPZWauzyFqgnhcS6VatfsO5kiP8lsX/GLZvb1fpRhxuXnFGXQfrjFaZbX
         fti4sulyZycmJf6JFnEKCXqdXs1A1d7D1QCHN3kWDU0d9ot2BZYrTrEV/5V5BeFd9ZOt
         dOGcBXLiGn1OEVqXyVg5KqRAZFE4TC92Ei0nNf9zsSDZ4SBOIMskX6LoUL1TzuX7ph7w
         GbRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG8tpdmpIBfvPLZh0RWYo//Fls1P6luLI551r4Ujn1hEZZSfEX0tYf7sajJmcJYkjZ7et6p5Z2kUBP@vger.kernel.org
X-Gm-Message-State: AFuF++n79ygaU81jhfvbrqRR3KYduOYojUN03pCjAEsAJStKFcHV6vdA
	kRNHol+HPHrwzArInSk93j3WlvoRNMuKcmEaD8impTCAPakm6+cSx93DOw/kB4GpHANtyTTdhsB
	r50AAeozEywF6xf7kkCQeW/l1u0N5eAy8pTUKRXdeZhTObpVKYfzwCjtlga4XcYBK
X-Gm-Gg: AYBFou2pcgt1q9qj+e0lS/qeBbud7MD2n1i9VoK3M+DfLtyNUayNHFxhFU00kJvxOkP
	V4Dtom9jRw0VULA8OPlyqn3kCisSBZ147gypokQLVEmks4suzGaTk+9dHyA835zeWIAM9VB9DuZ
	90rPPTZg3anQ0ShcINv6v8eUDWbQTC9sarcNcn+NdH1TbYgQ8FH65zQpE44Wg+q2DSSSrrBEHY5
	HkA2g8NwINqr1GPtoNXaO80JqYtMj7XqlRi5xTqj3WD4c0sqIZJ3Q+7XSDY9gbb2eH588Xhxqd7
	vwIXDFq0GuOKX3fA65fQOJc7dsZ8XEp7ByHDBLVsCYV3EmXX1cDRJ882bSmBN1lc3RInjAAm2aQ
	bNkNI/K2CeDc1LG/OfmJ7lA==
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr994095137.1.1788366634503;
        Wed, 02 Sep 2026 09:30:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr994053137.1.1788366633931;
        Wed, 02 Sep 2026 09:30:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm168293066b.32.2026.09.02.09.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:30:32 -0700 (PDT)
Message-ID: <6d4b8ced-97e9-4926-8678-39339c5303af@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:30:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI
 support for eMMC via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
 <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gWREQGk__SLaPCQBAWXpgCfkl3j30G0c
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a984f2b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sGhwJIB4vkB8Sb3_GrEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX2Xz5upKz7dne
 rQi4v0NiZqIqkeb9CAOl4C8uljKQ1nDkUZdG784ecENlOJqv1/0qadLxtT0JgmleIbgX/LT5Zri
 WDfvG/ggPT8GgWDmgMOBbPFYl6eCEK6CgbQBmhBbEMsxUiFfqC8hxNKqgrqS9/F1BH0Gkbp+5eI
 n9xFifdiNi8rDCGviefswchKlq404/Bg+esaUmQM7djQs99xtgffDiA0Ln34/C3SH6T09mbIKUM
 ayLElaj9U5GQ1PqMAsta0qQeTEV5xwwNIQRKuIhkvYqQ8rQ1ZBZgH2ZYHp9drRXU/OZal79mETI
 JMNbBFvFL+FL2L8GLTaKhpkr8N0dLTMG5iU8wTpS4qHnY0GhxKW1D82MJZWMibZMgstmvC6H7yv
 RmW9V/DmNcMct3C8R5eA+WXLmcSqG1YNRUSd9BA+jryCo6cdngBKeklU5ayobyTDd/UQIS65xwR
 DFmQ9erGohQWQGBtQPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXyQsqAv/qkzLD
 JDzmSRqgolhb9ITusduLI0BE/EF2KHyEJtAAxxspEVJnuY7oqA6uOhrHWYwg3IZB/ALyV97NOsM
 7Op/bc5ENRPUv//UazmUOewqLscFQSs=
X-Proofpoint-ORIG-GUID: gWREQGk__SLaPCQBAWXpgCfkl3j30G0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:32 PM, Monish Chunara wrote:
> Enable the SDHCI controller for eMMC functionality on the lemans EVK
> using a device tree overlay. Configure the corresponding addresse space
> and resources for eMMC.

These are two separate changes that must be two separate patches

[...]

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 695eae1b7256..99d21e3d7ab8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4300,7 +4300,9 @@ apss_tpdm2_out: endpoint {
>  
>  		sdhc: mmc@87c4000 {
>  			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> -			reg = <0x0 0x087c4000 0x0 0x1000>;
> +			reg = <0x0 0x87C4000 0x0 0x1000>,
> +			      <0x0 0x87C5000 0x0 0x1000>;

Please don't deviate from the existing style (8 lowercase hex digits,
zero-padded in the front if necessary)

Konrad

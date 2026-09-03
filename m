Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4733B4399EF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433634; cv=none; b=u4EK1/ZveOyE6laG27nMZpjm38ewXUiHqSyQpChYPkTfNP4klT+JowiHoz8If+uEeFF3XY/NsGnWyqIO1FB9QR4QA4WQlQkxdJoJWOBlnGM5NvTtbuOfyg2fyQ0mBQ/qGaqQS7n5wsAIpXRuvQEag7YtsrLXGyjxdTlIOVjhOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433634; c=relaxed/simple;
	bh=NafIAQ81wpuFc5oV6yH6QTWWdlTU+hZVW0S+P7GkiA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbxG7kTL2qN29uxNGgpfkeh7GYiiLheCdRsfODm8OYHO3mIrRljC5yJs+u9/nwcGRQZFgE3gFH1mW3I+wr5rzUx+4Pyk58W/+oKvzwpK703apuDieu96teeF2o5YkMBa7d3SA1ysxjOex6xy9CTlFkmSNHVbbX26e+4lqMV+8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EidnkHMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOVRWH3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EidnkHMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOVRWH3Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHEeT440315
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=; b=EidnkHMAPsdB4QP7
	FkR0lQ64bL/aHq3EYituSzKiEPWAmOhFkgiwYR2MY+6IEx8VYQ1UunvOTFH5IfCn
	Oin+LTAQ3rzTUBqbSWIXgyMLDW0x/zCyCNtntkncfPNy1YFpiJmMcQoudkjz1sNk
	eO21JBxbfgsbgXyKnBYdMz8xcn8xPqmvwOQqkR8S7pO9ygyTRCp6udW+Tq8WaJ7D
	vQd+qwW5sIqaOqsq+YoMWhxrhA1I5X1PasntOLh7zCPxz3eS0HRcE8oFRwk7Xz3Y
	uvaVCLmWKgO2ODYHYz7dUGR3To3qcE3W9UsdvyRfuHDfRhhpeP/e/wsf3sY/Y3qx
	rYi48Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70919-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:07:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so98059137.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433630; x=1789038430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=UOVRWH3QXToA0I3msNHOePp9aVE6JSlOL53oBYKrIKCkE4uBJ9buT2W92Vd63ZKFxi
         jbu67OSchRKXOUpXwRM9qc8KyRAgKDthKE3MIhRpQaMz4Z8Fn31mzTh9ZK8dMqwfYZPM
         q/qUuqLMYQfBF/1G3l3lC4I+mIPkG2P0kt9yPpoSENQuBQCnQ/1jWi8GiuwLNB35hxb9
         GAGiRcLR6Pm1sW3KkbZ5nIOpdLnKsiuhTAEVsK4Afhc7bmzZhEU+tG9ujakO+iKgWzsf
         eWyz3JSnOf9RayKlrWzb3kGI8cKM6Kihc3eo3+VxVxcRXdBMgPa1Qr15I1jJo/d4BU95
         i9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433630; x=1789038430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=UMmzTx+F6u8UdXC8LBi9hYkMsY2Vk4dMuNLkTpuFl1MaLVwgV3rCqpWODWpOUGQPZE
         eVoHYYQd5FN/6TJAtfDi2ECIoqZ6Hy0fD3u2aYDuFsDVuFYdy8BEMHIaJ2P/JN2lycYD
         PwyJ88I44iUYvO9mBqJXes0RZZal2aZNXEdkdMxXWGaLDCFeg8uJ3OFYuPZ+WWLPGSoT
         KU3+aO4LVqTnkMadOhA9VED+vhEcxGBR2R0c+WoTgt/zgWQ0aVVcyLJ+iXHcuhNzT16w
         yHUJMaev+sCneUONmmQWwMD3SXLHpcLTaWfd8/5RhBKZttrWGy/Gu+pVLh6rSa3OeXnQ
         mc8A==
X-Forwarded-Encrypted: i=1; AKwUvBxWnAZh6HxatcMwk6XevU2KMS86gjgnZXXg8fF0D4Qv6YG+eV/RZqbO4OOO0MtcoMR0+W0olExpgBCg@vger.kernel.org
X-Gm-Message-State: AFuF++naXl4wVMVqZSJv/0hyPB9mMmBccHQN3BwRjawmImkN0++vL0tN
	SzQCY/vNpjxwu/BDbe6BMAwrrlzrjgFgZOuw/UziHm/hjA20Sn3QzmS7nWxxl82sHKwLKwkaYa2
	f8aBsg/3tP8mbG1veROJDbWv+s7LjG2L15GCmpF3yHEMXCS1mQxg6OhaIB/oMkh+e
X-Gm-Gg: AYBFou21vHZSdbmAyCinXkD3Gakc5oWSZnCTjt4tEVbH3EBG4MHxD6LL/0Sv1TktJeG
	PT+YK5VgGH7WrewkBTFIg+BlxIWAPFdIe/O0E6d8L76VYnh77pU+GUkIxcWEG3oO9yxu/UnaAoO
	GaQ2qW5X42ngVFh51xA/EWvlboh/UMqMlZ3JSizB9uDBNykWTCGVB3SGVwkaM5I5YcDmqD1AsY0
	Tqq/Jsp33FUnH02hCjTZfkX7VeodgSbrRycIt2Jb6wTes/74SrQfUqT4YXLl1Kq7MME0ul25jjg
	IGJudkC2HHAAxO7P1YKmVvkinh7Uck/oiCtgvnRSIU19vUhHIsGpe98zJP4qHzmfBDrY87dFabn
	L+12jiLT093T1LH+oCm14bg==
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639212137.0.1788433630306;
        Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639203137.0.1788433629819;
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm83877466b.25.2026.09.03.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Message-ID: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:07:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iNXquP7BwgCbnNpPxR-IAzTzZs3YqpZ_
X-Proofpoint-ORIG-GUID: iNXquP7BwgCbnNpPxR-IAzTzZs3YqpZ_
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9954df cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX2hrkKcS79IOX
 OKPmhfxKxfY5LNRbrIB4qUQFm07cBGx0NMjie4adajJDV0UzxhByaTVQwYgG2cnKdGBsKaxC++W
 TQLAW8YLO9/tXF1foIuLtcXMx5Qkklw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX1Dyx6EUayRsA
 ADHn0GlN903+sqwIDrbLwB7QmzxRAVIGnxXQDIwnENrJqV4KaJWSh6ZmtN2U4KNmiocP5gYc5+s
 pjQRMGPq3eEl1IPJkCCYjk/daupSdv83GYrgUQNlx46LOdEv5DxSC4wENFF2MDww/5Hr2XOee4S
 h0y0Z2E/uyweooc8IKxMfyvX8ori1BuM0q8BAwSqRZFINphXF0OQgeHukS2IZusQBqOy78ER5Ux
 vAthRUKfXp3H7oeuSGjtvbA1GM7TD6rf2w0bkgiy4R8zM+UP6ok4nbbjOkatGZ7Mu9bG3F3/lm0
 LM/uAwVfCdknhwacwzhzffzRyWNiCC4l/pvq984Sn/PasoiFzCpCh8zFjp5nhPMOCtI5S0EpaeT
 ZwxoJRy++KAFffHSCgWTdfN+vh+hK/ASh7crZ4Jha3vFra9Z3Jj1XqpMmOeJZvfzT8Hc5dlA2Su
 oX7TcA/EE9YxGNt/ybg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

GPT found the following:

> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;

This needs wakeup-parent = <&pdc>;

Konrad

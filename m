Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202041;
	b=DCsMUUn99rT5j4iy4F8RJfOkNZ0cXQNarQ8Z6gnluAz4IPjJTjRVhW4zmzaDrJe97Ktf
	 HaIPSsoj0ynrCZVTMDXh1A3yTBiSxrnQsPl183Bsh4YbGuSy+S5yHhQe8ytWHJ4w1BD+F
	 lz9+rQYccC5SFzSIRjgvCEbwU87hSMpeDwlB3+6cAq/spXLo3uskUvXApro8NHYTuT/y/
	 LH3MMOQkCzc4tdskpb5cRHP2wQF2y9pkjUxQIWyTVaM6yV0zwO+TG5yXt17r5/Kes06kh
	 iL8BhMQm+S1ivDTWVKTBjcxzs92UL7qnCRWGTQX1QFdk58CNjWESEORqRZ+Bm6PghAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
	b=ZDD/zClOWgzaXr69W24lq66FW1HGxTMxh97d4CmANuK4Zbm4iUJ7yynas3ug+0psi8iK
	 KLLULugAhzTLG2kQWDNxdDJeitnn5gfHZC7GANaKEIqOzuNBs6sDSlUgSyw5UPRM0EI/t
	 U6gJDClRk7rEs5B8yPxMkyL10hMzxFIrgdb9OuEABYjj8b2eodLmQhjwEG3L5K+H5k6IE
	 qunvvDhzDrRF0dgBbbaiQ+jOFjpcSCQzAk/nszozK9y20AawAnY7KURzIOlNaQveFX+JR
	 T+iJXUuWwf6xxcdu5vIor37n9LBUjgbfvA96mq4ZJhOTm1c1wO1tJTY1aw5EOCltMcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgeVx0VL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+ddBu1M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56939606A323
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56939606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgeVx0VL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+ddBu1M
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAkeu1517128
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=; b=PgeVx0VLO8vCzUwF
	tMyB3jGpL9zIaslqt9um98HscVyltNYVrwW0dilEmNtKsTnJt62+cABWgcPbPmJo
	AL3MyXGHXLp6wMPZ8tyldAQ1hr0sCI0EXMdYc45CxmoQRN4XZN2zpmU42V3F9+bN
	320HdnEW6CZTKekbDavuLpIRS5OZPdA23aesX5ZmtRnzgB1PsSa7gpkerev7PZL4
	xF1MBg5YzqAic3+6elLEGqqatEMNOk2Mm4HIz/TKqnW9yfV4jNYx8qk8My3PnSM9
	WTAWEzs4hDR+lxgab09+qMpXVDQjdPHauknYK36WJQHTumyuDnvlwA6tQALKvx58
	I6O4Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwa6g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:40:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so215946685a.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202038; x=1793806838; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
        b=a+ddBu1MXZQ0eIed2kPyglRdXFMyk1XRdjz5WpbC1TOBrEvkF797E0SuyJxKyoytw1
         jpR7D4X/1NETv41nLSYzuYBRVSyroejKWdQp4i+ZKwbAWyLDfIGgqSFK/NXvQmKDpDtK
         qshrakXiMCQ/jbZY0d0ZaWuYY82HTKsS25ZBguoAZwd0PpcWtFcNKV7d0AScbWZsDn3H
         fRNGr3O9FVC76EABQ0dxxoIqHGU2HpkZKcfTE7AnhjzrGWVh854HdD8UMFJxgt3qE/qk
         t9dZIJsI+J8j8R7aNBSrNkGqSD+sj3FDerXTNi8ouD73IwiKlC9SDpCiNRhyLgFwHcmH
         LcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202038; x=1793806838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
        b=FKOw1C1qPrwDzd0FBxKeNwgAwkSuPXgeQCr3oopEXo7KPnOJVUIGJU48OoM+3bROkz
         iC1Rx7jMzrd8rocUIn2eqBHiJ6Nss0ElAwus0iPQxv+q78Sur8bvKdrpvTGaBZWJoavM
         55fIxxwmpp0fIdPOonq2Mku+OE+04EGLQE0eRNZimO16zM2/jS/RDUCt+hQpmhqBwlHB
         B39YCxBuyYQhli0/YkHwmdIBf/CyISCYAHCNJq5w4vAtT7KHNazGjX37RkoUW0jY1keD
         O7v22aiKxIa4RStcF86guD72OzPLzCKrRkoPWtLwjfnUWwlZtvHZV92iCcZ0PbE+raLn
         Zojw==
X-Forwarded-Encrypted: i=1; AKwUvBxuuMBK0IJ7ztqKIiv56p5E+e01efoj4uDd9V6GQZPuQuoUmg8pdBudfA6rvrj0ZAljbCCHln0ApmsG@vger.kernel.org
X-Gm-Message-State: AFq9FYKjx6jEeWqIG+wcv5i7Nn6SFxkIka69jhuwOSkaFqR3MTFrWY4t
	BYTO5EIreDIAetIEteBhGei7w1z61esjax/YPvwqnbc1BUbiLxR7yWat8REGA5R6jO7Drjrqv43
	kgNKuPr42nnVaIPiUoypLHKNE2S+xmLDenF7aNJDIYlKNqithLkEsYBQcS+Cx44yo
X-Gm-Gg: AYBFou0R+ku0wXdFwQEkcxdyT5ba918TRqtMg+8lNmcltqBI1d/VuxzbnWhHXzc5sul
	PafPfb+yCeW/D7Ng67zqBu1YqJo0TfePoD2OFd5Kt630GABTWY0LYaQ7Xr0Yu51b1TsxBQh0pKg
	dPIM9kzArmUIF/Fct+d4LHUz5tZkYvbsijLhveuJ5/6vkAxyf95/qSn4+yfRCWm8jH4hMqHk5KF
	MMFopJoMx/6WuYmZ/EiThL8Dje19qvgVE4aeQQNhQtLrLf2yth8K6hfi8RcJ5fN88jhxApa/0xy
	3mE74vbgLo4AMDL6nfsxcK7JZz42rJGlsgLSbOX6Iv7R5KSOR4NfWQHkJwK+IYixme8YJV0izN9
	Hq4dw8qbHVyQKe11NNFCdI1zF60bLRgRgxsVp4Rzz+nBtD8Ib60GMOQYxSfZoddbVpw==
X-Received: by 2002:a05:620a:4723:b0:943:eb21:cf25 with SMTP id af79cd13be357-944089436bcmr392008085a.12.1793202038355;
        Wed, 28 Oct 2026 08:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4723:b0:943:eb21:cf25 with SMTP id af79cd13be357-944089436bcmr392002285a.12.1793202037535;
        Wed, 28 Oct 2026 08:40:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm674315e9.5.2026.10.28.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:40:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:40:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?S=C3=A9rgio?= Ferreira <ferreira@se-rg.io>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
Message-ID: <wb3fxm5mb6jcmf3cr2djmp7wkjuowhcdjjb5safy7xymq36wkw@qsrlcebvxf5p>
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-Proofpoint-GUID: fUZyv3e3-1pe__wmx_lJZ7XzYQ_rQQXx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX9E3CcBhh+Us1
 AfHWJ1bRexBDpsGjGRFixTJ9j1SD9luJhDvEUwDHY5qwfGOhyXW6A+MAmjNmWoMx35UO5ZF/Ipt
 nAFS45xZZ6T8fmUZz9NulspaAmGiNTg=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae21777 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6K7-PZ8FUrUA4GMtlBgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fUZyv3e3-1pe__wmx_lJZ7XzYQ_rQQXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX8aJIObisL9ra
 BReSIOyHhsXAbaL6h4dW/FeZQ3+9vDy3dudPUOEDXyTeHGOfTF6rZ8mVKm1gCPiA5G8bNwHvXFt
 GYJQJFOFZFSJ+ipaVv7/iMcsI7gnoWpiUjL5n5DFPuLatdRTIRNMoKmeQyjN9xdpHPctkEQwqrW
 P6OTym8S31Ok/Pq/qGLg3kjeHqjNcO+AiuJWVQbGRTczUhcyd1+VzoNO4VucLGrH1v3r3vGcazK
 ZUIVj544IdYcckb0CDPzZQcUjFcVB5FAhvFU0RKGIqWW2j0cWblDUueKuPhKVrFwxroqsdm938t
 GQ9Mz5QrHzHAbxhey/ku/MSYVskb0dssNa7PBiNN34DsphyHWmdhSXevPYZ4K/pOoXT+OAXy7qV
 wpB16t3+hq0kz5vgr3khyObPpSvi291q60tCACezGq7sAhe5EACsfj+ZLP32TRfYAiJCiMHDqAz
 kjo1y89S3k8hUN3kh+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-25 08:51:26, Sérgio Ferreira wrote:
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
> 
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
> 
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
> 
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
> 
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
> 
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
> 
> Assisted-by: LLM
> Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

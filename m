Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90647226863
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776195721; cv=none; b=Df7SQnRKC/TzB/0PJr5Gkg9m6TJLAZa2Guj0VgNuQW4tT/iZTskqOlNzFQ7cHDIqRI7oDhE/x7az4Dsava6VVAzS2QGxJiLk3g8p6I40zlf+98FeRuC3BaHPLpxHmtrftXE8lzSaMNnDBywpvsoXDxY/RYeXsn7pJrMLFbv/kLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776195721; c=relaxed/simple;
	bh=QkzrnqDcPKFiAQSECbFb5lrm9W3CV2cWM5eswTkD3UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8Wy4hIxhHDYhLXI4/MPIUWs8pvDlJMa384k/ClCISy71OhUy0tOd1yXm82o7Ez8h3MhVCFtUZ9KqBj/47p4dYjQbu+GK4hHH3Fhq30nlJiaCkZF6KFsHmewAzU9kq8YUueUYRRlhLfM4i92lH1N63bVcILUPfzAgFSv7pFp3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnOkbEs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eik+dwUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnOkbEs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eik+dwUq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHvsg53059073
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YWxJ6DZnVNr2AnafJDd/N4S
	yzLD9qWkQCrNOl8YuHc=; b=CnOkbEs+REsdGXlz3hX4Z9mXKrw5OPk5F1vFLIp1
	am+jXuphWpVea2hZMKrCJ/Zphe9GMas5PVxgvVsADX7GpHNUVUZCWvHcnpI9r6tt
	a5IdmJ67oqtl9ESQiIolD96zkeidDBIKfKhQayNTGiRJSFxV6pfNUA8EgEcRI5Sp
	FkslApbjv2Tn9CA6xnWzhpyPL4qdIlcnmoHUFiJcBkqC45/PI5rwwE90/O00DiCR
	nqllCMHGRTySPb1ZG/FFB0nNE4agl0NG5hOaJdXf+BmWMu6K/yg4hXvpMWiaFkNP
	2sH+6Xzzk3utQy76O+TlQTRof7rY4pvcfqc9uad+5a5Uqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhteprb22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:41:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso110062871cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776195719; x=1776800519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YWxJ6DZnVNr2AnafJDd/N4SyzLD9qWkQCrNOl8YuHc=;
        b=Eik+dwUq4WmUZBtpbyhdcTEterZ+P0irjB9S5rh3kJUiysxFBF2oa2KaPJQ7tNv5LS
         eOpQBu1h99Hy/wQgR0GJLc14W0n9XafCaEELyP7Y0YtFdrDva5Hvv8SJQB109R9qSYqC
         j3ndh+3M/gt7J5X47M5Y8If+RtFfUDaDnpX0roVWZ4XOGu7cTsyXPCyLf480Wk++wjyy
         tem275ZNKLbwTUIRjOFsNGv512yOhoA4rUqaG3KHws4t+XlmD7AV5Uol3eNe6OBogdYT
         ijRO2vI9iOxJe//sn6dqMvdfTFcz4hQUhEvElk4tcT7cPiNGiIMT5xb0fbF8e4x6vkXU
         w82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776195719; x=1776800519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YWxJ6DZnVNr2AnafJDd/N4SyzLD9qWkQCrNOl8YuHc=;
        b=fHw6ooePlRopRPqobPfyjClIPWbRZZGfmAp5mMvVCsojOBPQszZD2ZniKuUEQhpRIR
         EI+P5AMzHuF9JnsZh2Ea7GNW9DaP9CgOUf4Ncr9uAe4vXqwebpbuVFLihG6DxBCgWfMj
         Ng/TPQwNo6o+dvVlZ0QlPbVgUhYCcUe4tb/ckBD5tFlMQI/XrbIKRvjXNiK2WYDSnkDF
         rlMNGmBHTdBaDBhTL3RdC2rwamC85LHrsiT5vDSsjX6hs9ywsmNKse+qcubvs9OoZvub
         hfc3UkDhZFkibV5IZkh9MU1WnXp0824CctzyBR5VQ1vR8rVcwZq5UaXfVp69iMiLuiHZ
         Nupg==
X-Forwarded-Encrypted: i=1; AFNElJ8a55umjGt79qUbRNP/gu2/fI0JcPS+m4krqNtnPGy4JO+z5vq5SijA34FG30r/SKTvuWovZyoP9rA1@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWa/Iz0UCC3KfR6+JX2XsBUlyQu1+g6z2EmoRmRSEJUhZ+pCI
	JF6tq4arBiJEmZNjhZCPBQNvXHxuSyXHmUfHm2UQQC4g6qveTar5nzQV/Mj8RK7V5U7NY0SsgvZ
	ueXkEQNY14+p9uP1Tu+RwCRugx9KJlbI9MjP6xgvqaIq2TxGbG4diUuJ4l6tm7z/pKDdFUi5B
X-Gm-Gg: AeBDievQZHKa1z+dQAzVuoGYVyv9hJqGccKqmPA/u2ZYR+qdIwq9ce8kGJu1vuhFzgb
	h+bijH0cDDN1p1Sfi4a8u5Frdzch8AMdwIknMD8widd1jCnMhioBpVqi5wME/Q4b9wd4on2B0NI
	HsDB2AlmNzxhCSYabnwRSmhswkLsnSLnr4+T/dBA7ppEJaXpjV8RcFILSXV0F2GnY5nR21Rnz3R
	sjLKU9wfsagHX7GTnd+Om4IhXpTAXWNQnIfP8oGjQmEFTM1vuMyIGOlRLeL9BI+znaLSqsGXic4
	6gqiJeVx4BbQXwAeZpvlDnZ5OIvJp8Qeh7HegYIXSfqEjiW36qF7bzoFlKeZ9bausTw0FcdITeG
	+9IsW2eth+AiUbO0IhhCmz3qwp6FxGm6R6O9D/+/HgvSPQGa4wlohb2wfe6wn8mfFLwCn6jf/0a
	B3QADD34qdBy1jtmV36v40b1tMlla0xORmE+uQEJdi8N1IOw==
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr217328951cf.36.1776195718742;
        Tue, 14 Apr 2026 12:41:58 -0700 (PDT)
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr217328391cf.36.1776195718201;
        Tue, 14 Apr 2026 12:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefe209sm3530550e87.72.2026.04.14.12.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:41:57 -0700 (PDT)
Date: Tue, 14 Apr 2026 22:41:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916-panasonic-eluga-u2: add
 initial device tree
Message-ID: <azb2e7oiqf4t4xmjqyznzr76medvtljq4ncv46lxoyuv4dsqgu@7hxlao7fp27x>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
 <20260414184429.168612-3-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414184429.168612-3-linmengbo06890@proton.me>
X-Proofpoint-GUID: UFWsvQd4dBFjkLC_bYk9Pubk7VgoHEDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4NCBTYWx0ZWRfX+GjUG0Iaq50D
 qDt+laF4q68Z3hXqc2WJgZHMOXvJjoGOjMPknxsxHL9kjfEMvejTCEXAGhXgcCxYHj9afwiEXtC
 V4H0jFF7NrNnLlZHsju7oa/fYxMol4DhWptiQdqn+KZGiPKsxAfNP5ZzgKBZ3I7RmCiIYxe/Nkt
 HeZEG+X7v6PeP11iwJDot5pOkgAFRh0k6sbmBwtEfg1u2hmdtldSMXtou+fbcKVDD3qiPVlpZSY
 TkECTzyX9jrLlpwja2DJVbBK+pNLCMVWwViOD03GQVAqe0Daao/o/H8AZ7DOwx3Ti67klploNMj
 TX4rKV2hBh5JJJ3IGADHXkvfbYhAyBmDWo70PH1FM5sHUKGZT0hJtU56Ge1GOiywPu0esHNiEGr
 JZN6BGC+3ORtoqsyMqewo4kKGHqqa1a3Ql95sOcsaYxHdPjtsSycA9Gh9YAgUnODQTde6a07NkY
 iBDA48EcBwtOvMw7jLA==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69de9887 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=0BkvYA8_tpNE3naGNAUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UFWsvQd4dBFjkLC_bYk9Pubk7VgoHEDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140184

On Tue, Apr 14, 2026 at 06:44:55PM +0000, Lin, Meng-Bo wrote:
> Panasonic ELUGA U2 is a phone using the MSM8916 SoC released in 2015.
> 
> Add a device tree for with initial support for:
> 
> - GPIO keys
> - GPIO LEDs
> - pm8916-vibrator
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART
> - Regulators
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/msm8916-panasonic-eluga-u2.dts   | 149 ++++++++++++++++++
>  2 files changed, 150 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-panasonic-eluga-u2.dts
> 
> +&venus {
> +	status = "okay";

Does it work with the standard Venus firmware or do you use a
device-specific one?

> +};
> +
> +&venus_mem {
> +	status = "okay";
> +};
> -- 
> 2.47.3
> 
> 

-- 
With best wishes
Dmitry

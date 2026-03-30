Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD43C3BE5
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869778; cv=none; b=tPfmMg5nOahyFPUUViLOZQ7CXm9X/cS5zlSmTsrYTmb83bE0+2SBnt4QVfR7tSaIO9EYfQMKi0fgztj1RrvvDN06RdovaVwHeFmu/ktEYr8QBRIDHPOlpoJ3EPOiJsxd6fkCxdBO7CoKj8ggYjt36kJ3QAelTWbshoRgMonDntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869778; c=relaxed/simple;
	bh=EcbnKwvlMQtKZ8zaJ6Pf3gDfNFf7RB2favD1ONugsJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzI4gElBugCKb2o/jCryktHlnM2VAaaaLIr/tIYEXo82V3VdcLDCy8jCGOzwpnypFV/6CDicmjU6m7QAd6GX4Zj8QdmwFYKFYH6FqT311beoogesKYpPKGEPLp+bRaAmXRdqmQ/sA2ZKEOXikhnzP3AFqvVMbemHA50weh/osoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eN+/nEud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BA1GI7z3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eN+/nEud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BA1GI7z3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9vuse2195751
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=; b=eN+/nEudwXb+wVXd
	Hlj7gMrI1Nxnan1OU5Gb7o6sIQo4OdbCDAH4gPtAgRNax21N9Xr9M0jB1l5xU1O/
	NYdr8qQcwIQf370OTMeLJ5WZvl8PbCgsP4DoLpSzEN++Lqws3njCQZdYgzbVJ96b
	r+n8VPsSbKkztsg30WPBqSzztDGn0NODb7bTqrOUH/2v38d6Gnlvz9I6OLiEnvgm
	oGNOhtNNcnz/z+3IRGjPaRqziSaSLqA5n8WciNbzISDKkkWpBsVbzQyuiPvJGPFx
	d9mckR9y5Nbg9ODrq91rWBoXs6Ibz4kEg+0o+0VPy1Gu57k4ZwH6uKFHpG2qdaoZ
	y7dKxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3ug9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:22:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cbcb48003so19699746d6.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869770; x=1775474570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=;
        b=BA1GI7z32qTodTtLUs2BCOoK6RSRRMmAXCFJxVxj5bgsQVUcLliG8WidnjhKGBxhBX
         5RsFq/PMzYxmQmYDKnasJi/WPp6DyFL23b9w4jztp8JMKQUx+iF3e5tx89TxY42MJfCF
         rTD/rPbCcNXFiuuWVsE0HJpgSos4A+rPHQTOfVAFbfITO36Y70oCmMcHrGqEusR4f0MF
         csPglzzQ95sIasABAvOwkPglAt/bRTYmKPLMxdNGmId0bNOxCZvXhDfICMCBQG9GZgqg
         k458JKFWna7JTLNLQQyJmEt3z9sCPACNDklO9YZUQO8iFbzVoz1/8JZOiPiWSf7FcGNU
         MP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869770; x=1775474570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=;
        b=CfeiCmVfQOEC+B4/UOHsEvTi4rvG+Xx+my4ERzz7djBNQczqNSQmDU3Jpx1kUR5Jq0
         86fSue9rgPDwpz5mAyTAzMtCE0++u0XrNmQBUIUyArl1nzH0wj2WDjnQLhWcVuPPsOZG
         4xof0oChz+RJG5OUCSKzJmiFUyXZcC7tf5pRqQ9RBZeBkYPDAOXM+DoSydUF+VB8Cdgt
         xtuigoW6jvTUXKMa5Qg/A+ZjoU6cc5Hi3UgvjQL2dBmyzS5bLVQ4Zx/6fI6QQdRioJQD
         SUXzq3ebDG0XqOot/NK7YKUlNSPl97ekmv13wJQGFy8Y/Y56eB8aa5nq1cvdnHYoTeG5
         UL+g==
X-Forwarded-Encrypted: i=1; AJvYcCXmBVcNhjPH6HHkEi0qGKVi8Jk+WaRnG4tFslMBdrw1SBHi2+8Phv9yODVv2lGCxliIdYzWW9ZBhrva@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69h/uWN5HDi4DdKJ9b20EaDoSCxrRpq9m+0C4PXqA8ZPnIql7
	+0KzVJqszBlyDC6/JrFr5XiIzj3ygxD+qhrSWvxrgMr2SVBcr9dDDh6I618lXkwepN6AeG5WAqu
	o6Y5vCaxU1AFnNZsZq1+6qUrETaa96rAAcYET4RSy71NxrPr8hjPRaai92pzhmbh0
X-Gm-Gg: ATEYQzw8//XygmT3gRL9tpkSlqey77Q9wbt23yU/eCSDbmxcnw1o87MIrKe3L1Z2Hmn
	mdkG7BIZL/riMjPeeX43kGOxanP77FXwhXW+9HYn/g131CURfIbw2I2gxlhufXRzXWDD8NX74cd
	NrJ0yeVdEDYHJ1qg27O2Nr9OargOPZ7O5NDX7dIY+WuZjMSiWhO2/6qpUReRZyl3EWVhwChAWi/
	1DOzFoYnlZS5zXbFPakbhHgT5jnyslL7FadihUV1pOVwpQeuTlOx7GIQIWLswIiCvDWaMch9IQJ
	H/WBN27aFhkQCMQ6Ka0rFFbBmGi36bk7+ODecVMA9cZRtQUsXhtxsYS3kE+ubYzl+qhATKfbUND
	Y6fHVcTccpIEJrq/QP79kIw3S/p8Wzx3pcaimaT+9lDfu5odolJpJ4vVJiatLzqpjuLfcE3q1b3
	EndrI=
X-Received: by 2002:a05:6214:528a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-89ce8df70cbmr125942686d6.4.1774869770140;
        Mon, 30 Mar 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:6214:528a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-89ce8df70cbmr125942386d6.4.1774869769508;
        Mon, 30 Mar 2026 04:22:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm276245966b.6.2026.03.30.04.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:22:48 -0700 (PDT)
Message-ID: <ecfae618-b2fd-426d-ab2c-c13ba5d764f1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:22:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfX6I+Evk08+R8c
 bBcgkpMIv/5tiv+7jmOPuW5Gbuq49O0gch20tAX+DdCECrlK39GaScmowz8Aq1n4f6NL70KOcLk
 Dk5rNy/XRs/xSmW0eDIjFjjKzJgMGVskGhX+72xrtU+mz7yivCm1mqv5Jkmkw6GarHnd/j93dR2
 LQowCKXvV+jBVRr5tZkx+6xhHtWhuClh8MuOI+QAEYKai2TyHjQs4LybZL9niFGdSbGhIl4L0vV
 fb77nD6mygnk3uS4hNAW3RZ9m7gaqWyU3s4uQSLqMq6oEiEEDDsJOUtpj9zq92jQveiFuHRz6th
 cP41d7l1Z/jUNChJv9uDRGjQy4jtByli2XFZpm1aGDwiKk+IECyeeYP1pKJweRI14kTpAifGgs3
 YC+rTpAEfdF7o5X7zmw3tq46W2To0yrkgjrcfIm+XwfxH5jgQPhn74l+/iQTgY9JK0UkYHNqzo5
 4/5bv512XWEgy5T3WpQ==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca5d0a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=ER6jexHYGgKHINCZH0oA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: UmPzhHISpMLRWaeWik3jAOrXQQJEDe09
X-Proofpoint-ORIG-GUID: UmPzhHISpMLRWaeWik3jAOrXQQJEDe09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300089

On 3/27/26 3:30 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm8953-regulators";
> @@ -244,6 +310,13 @@ gpio_key_default: gpio-key-default-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	panel_default: panel-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};

Nit: ideally the pin entries would be ordered by the GPIO index,
via:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

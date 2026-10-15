Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83E74EBAF9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055685; cv=none; b=drlXRtyqYZuZvErCvKklDZUx0lSTMgXiAZYkQjXieJoJe5sw84aKd9rcdhWOMErAblFK4KswqWkzgfre7yBqfCvauPaqyQshowPf/JhD/9SdTv6PZBqKTmWis3CZqsLxtzqLPIJQK2V6TkP95bxjOVd2+mC98+gCzAfhVsXKF8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055685; c=relaxed/simple;
	bh=NdMk2ynksy7sBjLxlWYdSSrqCkDbJYPWnxILUrgM718=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKxDX0ZxTcNrn7mrg4e2/6LfeErReWA+vGXnb+Vc5c21uu85v57okmeUgG04ewqFtUnEMNsBj6R3jwdqXNhnQtCpZpAN3Wahery5PizBIO52a7zYEG8DC9ynAvjX15M1m/b0WbuxGXb7jKJBMGa63s6Qx12+nnlUAJV/1YyAg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoFaPHI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c05qoc+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoFaPHI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c05qoc+2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F82poP842288
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=; b=aoFaPHI54vkSpmpD
	a1Y6KPj5BeUeWY3unHT9VmZYPKV11uJlgoWgamUUQ1lCJg46kSfwkeL5kl74rFkE
	6B2wn/JhQdtGHCJUCeBAls0cFWaYnbvG/ar5Sqya+D88iCtKtAtOEKZLkI47WpwU
	9lMtlwBPzPp3YvBEy50OQ1xqScyFM/wVEqaPrukX6XfH2efEArOL83M7/CZY7Acu
	zG7LpGcQw6+UWQpbQ6pgPf+is/sStmsOo0Moo8JlLqAJWdxaBZL26Y0Yy5YH1yzf
	aKNvxikL30E4J8jBFTi37uRNToib/G0k5cCVa06LFP3Fxuew8qgSSNeJjNGx5n/B
	jsiQqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wu7qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:14:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338d5d0509so11031551cf.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055680; x=1792660480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=;
        b=c05qoc+21Lfu7X5+PRza+ujvXuMr7oMOy27n9qyD5XxWe8KbiqgZGSbMU7DcyNn4kQ
         dS96EsoYFzJCCrCIC6jvOnY70+pDTOGg1sScA5qnkV2Nm3Rgo/AHmZ3WXG5GNNPfVUcI
         IJtPynR4ofkhuYTvk+BEOFm73ULmQZuN+q/iaKPOLomVLmRoNQBl4WC9ROu/sRLWfh00
         qbVpjP3xXQEX/3+kTkdZKEWC3g8THz3OIg1nLT9I2hDt1aayorF/Q3YU5ke1jzxcLO6F
         ugCyH8t7xxOwzo06QK1vUnO0l0d2Hc+gCC3toeE4gwysTaUn7kniPuqoOtFwrukTStL7
         f6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055680; x=1792660480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=;
        b=0R2JjLo8aCXHWKl/jaaQ05fjbZrY9axIycFml5DeeuW7AopEnojNl9wqD2wnXHWw6F
         KQ3Dcl3FNDzGa5LYAnGeAj2Ua2FNwBtt517hNeOvQC5kDLuyV5Z+5ilU+BXr2yM/Hx31
         WAqYMY0hWoj8lXogL+cfyYdGOJWaJ9K9zApOx0PGbaHRyLoJSP1qaUF+3RFsdvW15lN/
         EzWCesO7YpU9ZlgIGFojc4noKzOZ2fApfn9Z875fiHUwFSSK+Bkc2xl72epaIhLbFG5b
         otDJ5CTmC4Ev8EMJuzEIS6QDD6GaOLwfli5+qVTQa/90Ri6thhfZ0y3TcmtahIB8LYp7
         XUmg==
X-Forwarded-Encrypted: i=1; AKwUvBzMqtMfkjTDRDvlZP+GidCSVfjUoKIasS2RSVKu4UQ8zcjrHdaqRx9cMjqGHBoHCEIG4G7yvmPn20W2@vger.kernel.org
X-Gm-Message-State: AFq9FYIdbk5cO3jT+/KrlAXF/knEOF4NAq6apuaQ9SRtQt9Y8LZRQ5ac
	tYDpLTKy0fHS9fJUo0Pg9VNqLuvdCdAiRdvb8wUGWAZMXs9lPWKj4vkAJoFzkmkmSM6ywnppdh0
	Fu2HdYnS1Fq76vDCtVfFmORfAKfFqBh6TCwruddjUjI4gRSA/UvNHqvULDgbXgcv+
X-Gm-Gg: AYBFou1xruf0OxhUPtrHjoow5b2DqPeSfDZv17wG038DcIBjv6q9pUx0gX6ekXKWct2
	prk265ef7Htw+TWnXKp3qRdFgJHr44p3gufeS4YOyt7XvjqTWvecs/I6DDKTSOxJrEPiewn/R3+
	YvzzmPbkDZuijGmxKTj7ScntJ0Q4o8vEEpztL2Eqy8cqlF5pN2Fd2cuqd132K2YwtO3ylfOQVRG
	YyIsbVzgR1oykAM+BwcP2uCQ8v62Ayiaup+DYOkvUIZRUI1s90yhvo8fOsBB0YvRNzjFeuASQXf
	T1NJ7+YX6e651enILTxE2/WD8Emq5mvlnQYVLSKC5KemZclSA9EiY9ONu4PER7NdVZwl9X5Qc+m
	mHXYbiIhdxYrhr08li6VmbA==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3283604985a.4.1792055679485;
        Thu, 15 Oct 2026 02:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3283601285a.4.1792055678894;
        Thu, 15 Oct 2026 02:14:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101640266b.83.2026.10.15.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:14:37 -0700 (PDT)
Message-ID: <8c375f13-ecd2-4ceb-8bc8-949a90f971fc@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:14:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: regulator: add Qualcomm LCDB regulator
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX8ARTnPCLpICM
 LHi79N+N1Ble7ObNigqYWKJAhmRELr9jFuOGSz0K3oHBXYNTjQx+qO6A4q9b/ozp9O9PT8mnmTq
 9i2+SAV4ZZWIxQIrJK+4IUpDmo5zXvw=
X-Proofpoint-ORIG-GUID: JT9ZlgCp64drdQRYf-IXl4Dhw3xJ1LH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX924Gv3uGNuP9
 8MEcm6gTfNT7xfUdaq8zoyHNzXKP5CLrRq+2gFKpQQVLe0NwfGiBN5Xl+PLTdl5zyPhcB9n9YdE
 kjuq87mNfri2yHXY56EYkqE7Gg8sWUa+RoshfQQ6Y2spm8K2vPoGNdxFC9yd/HcdaMtN27McoNf
 ZBY2C7OPhUt6wWAoFoX1Oa6cMGnvAXv2U7gAwiknNhXMR+NeNPypUJnzt8GweHYAzePlzGeQPDz
 2Vmjvh10uyhU83yaT9pqmU1NNHYOC9ZY5dueitwvRmgQBeL/NofAKYpfMomFrbfl6gX/iKpON3R
 QL4R3btQtWzxYiOyDwY1EkxryzYEVbBakjGeulJ5i7o17SeMvFeYytMkjq5r4fHrUBOTaqWVeSV
 Mcd0pxABtv5Iq+U+chwdcy6EwJAe5n+9NZelYVhXgnA69Mh648vMclLz8aflBpPnCfUPm6u9Zek
 H6lh4ph1XVu9LYBRafw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad09980 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OJYj8EsONSIZtexx7k8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JT9ZlgCp64drdQRYf-IXl4Dhw3xJ1LH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> Several Qualcomm PMICs have an LCDB block providing the positive and
> negative bias rails for LCD panels. It is not supported by Linux, so
> boards using it either model the rails as dummy fixed regulators and
> depend on the state left by the bootloader.
> 
> Describe the LCDB regulator present on the PM8150L. Use it as a fallback
> compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
> version of LCDB block, so it's not being covered.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +        lcdb@ec00 {
> +            compatible = "qcom,pm8150l-lcdb";
> +            reg = <0xec00>;
> +            interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
> +
> +            ldo {
> +                regulator-min-microvolt = <4000000>;
> +                regulator-max-microvolt = <6000000>;
> +            };
> +
> +            ncp {
> +                regulator-min-microvolt = <4000000>;
> +                regulator-max-microvolt = <6000000>;
> +            };

Let's tighten up the example to some specific voltage to reduce
room for poor copypastas

Konrad

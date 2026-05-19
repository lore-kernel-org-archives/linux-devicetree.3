Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDE48C41E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189164; cv=none; b=LM7KWyDa0Iu7xyDjPgN+10nLVAZsCZeHZz3b93bRYBiRPGTh80AAWNOS9+/lxxqdUrABzI31DVUXYuPKCrwwWTwW5f6x1odj7zPiKHwVTPwAAoyF0XeHoYvIt5jjfIJIWVFCFOxK1RUToDW2gDJj+P9+msi4EpYhCVRCAGbRGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189164; c=relaxed/simple;
	bh=lN4ebmOI56ySsRA5WjpBi796VYIXOpn2IRp3wLpyJiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgnIzCvCGMinvhS22XJWIgkMYeI6GDqwx/DpHzqZ9jFYhnxmS2pxVTjT3oNsXSPLExoAVCuBnfAEevt5fS0zqKxx3IAWPEKf28wW4vZPnm1eBgRSe60WiOgcB8JxIPOTx0AtLzpiSiC6M1RPij3KeL2ee+8emlOsjTeTqWPw/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIUL1VHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeCwX4ND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIUL1VHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeCwX4ND"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EFLR3612442
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1XQr65IlqltbgM6x08wrUNNZlwpTYCCV54Ti+76Ka4=; b=TIUL1VHQ6SnO0XV+
	770eD2QJ5MlJ6irBsXZ27TInp9WnSdW1wyPZByNyEINog+Dva/c0um2m939AL08y
	nvlGxJh6VV67lRRsdFufJEVOQ+Ke4RezketMKdFt60vWEL90qnpM3ulFV2TjGIa6
	jFwjStJ9z3zN6AB4dTtKjLM3BBwsILgODdloGC5bJoroAYoq3DML4Cz7k35mb3km
	jotEC/6xHI5aSXjUdU9ffOB+LSJXznOPF235WHbK9NJ4QFg10/6+n2TWruhlV88G
	lzzv4MJvCLVkluUNLjmk+OcMl9En8rJfYz/qNnHNJOW/ONpBIwbxEm8boVng3rc6
	YhrJ9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64rr4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:12:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d840206c3so11791661cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189159; x=1779793959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1XQr65IlqltbgM6x08wrUNNZlwpTYCCV54Ti+76Ka4=;
        b=CeCwX4NDlX/EaqiPim9rRpw/H0baTGqlzRZpfw2zKNj2U4Qn+cxR5ZUDBZ1uw/pLeE
         eUuHDzBhRg14jaRkDy710/H6bbbU4UJNaA45lxAPzNSlvntMHIG+Dd0V9eYqzRpKxSK2
         9pULmE+CslJ/1NGXub6BTV/NjurE9v2C4VfYfUtLeULfasrGenHQzl9sZ3WuzhNu4tfY
         32uJpRSV0cKED4be/f4xp64BCuUn8JPpYluucPcswnLJnuh6fBBPxBtFDzlOgn9Qdxf2
         vu5mPyXuKcYiSHRWB9ikH41GCUN6m9jpq9TzUzBBMyM6VvYmbFiWpnX+cT1dWRbAMKc3
         iniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189159; x=1779793959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1XQr65IlqltbgM6x08wrUNNZlwpTYCCV54Ti+76Ka4=;
        b=Sjoqlqfb6RULSUg7cnf6Y3Ipxgbh3ojLJENDKDSpe4pYmVkQuRy0Pk5liA5PHD/jK6
         SRUQrqu8BnxAYGNowchnjDKWAqjzv2xxUWxsPDRdolq+Uyi825BAC8ceW1fIUdXfWVFQ
         zfN/4dp35irfWu7NCDbMQjxRwV/gw8oFfhnU2QHeO7MGmkg0XvP4DTYZM3iwbXXYsV6P
         0WAfZxLQXr11WKgTZEfKsv6pbwR4yYCwvOGAN0gVTuZYU28s7sF7zcedTzjiSWETpJ9t
         7c4MdwYq3B5KLQUKEfzpl+M9+wRdY2NriQfLljNvdrUA0WPKK81ECOif/7wqiroLtpsE
         BPEA==
X-Forwarded-Encrypted: i=1; AFNElJ/pTO6o0pcGqs9Rd/hWM6UTYNaeEi+bMHdC+J648TnGqEPJDnl56OQ6gBW5T+Go0fONTZ3TxA4swbaV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NfFl3yPUUW9mNGjTeUUkKc6Av/enFBhokp1XnCbtgpMAb0VE
	eXRjLV9B6BxeuHSm5Gm+mYWi1KvkRKow6rJS21s/AHkemPwasAmd4tTex19AVGSkSPffRcuZi2t
	5yqkS7OxwV81r+VTdMfGVDufCh3+9P3Z5cjRjdUo3zqjUfRLYejCuUuFL66GwE2Yp
X-Gm-Gg: Acq92OHww4++zimF+JViJTKkG8Vra85rhysfnme28RO9EobCa4Us+WkG4JDIkrgVcFp
	yUkbYC+W1zhssqd/gQbFoEFdqX1+sVj8DdXlN79OWtGSi3bXfFo1TrOLGtyA4W1P4Ynwx3jp+Dm
	QjetfH6k2VK+RNqQNsy3QU8R1ZWSb6LPckTzoBJGqAYJrZ5GXwqzNJlFprkO3/PSV20nYhPwjTo
	5rP9baZOmYZGiQ8slatYuWeVsormYuCfHmp9YhqFZ5DeET+YyZx2TyJMkj/6ISAc4k6e7Au8Ytu
	NT6UQ0HH0A5Y2mlvBVrxOn+ZdnCI2u6Vq1+pPJRsHefjVkzTJmOyWZGIysHIKAmDEQNG/6b0/xz
	kA21+205WP6goPtwwnsfAcSbRSP9l7yZk2FMfVRfTkCSjZpqenjS759PhI1E2RdAZt7pPa3oqIb
	mjxcX/RVnO/KOC6Q==
X-Received: by 2002:ac8:7f10:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-5165a0c922dmr185565651cf.3.1779189158950;
        Tue, 19 May 2026 04:12:38 -0700 (PDT)
X-Received: by 2002:ac8:7f10:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-5165a0c922dmr185565191cf.3.1779189158412;
        Tue, 19 May 2026 04:12:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm679135166b.28.2026.05.19.04.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:12:37 -0700 (PDT)
Message-ID: <d9b2e38e-ce6c-4ce9-961b-aeab7e63a10b@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:12:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMCBTYWx0ZWRfX/cUi+x9IHc31
 k10gg5hBYyTY75dPiS1AQ97tKTsRxtseHqZfMq5xWkVgZqcYzOHGhULJ6g+86cllLk9LfPzasDI
 Pu8skOqTr8lnaqRe3f+v5FXUYjxfaLPXHNDmDkiQPuXnNQ7fo1Acos4Fv0MciAZVMLg1Mm6kI4Z
 XB8OaHzbSqCPSkOE+sJtbdnFWpiDfpmkPzRGrhc4uN8Ub6gEc/G+RMhYd0Lao1a7G7ud+kJCwWT
 xdd52KI8CgwsLfq513fN2CW/q94g04FEeQO+4dsmAQDsEdPFaKGOwV9/rcDGMKZn1moGbTuzyON
 lLuH3E+jkdxbGHocdxvn9rDUnGlk2+by2QI5cetT0mphtQowEbyu43gG6b5gBuDDPm1uFEorECj
 SA90A4+RuH0XqSdH2icAKp0nahmrIIQ8FaoOnJ6gf0DVBHSedYxUuwhzNjiHK8pdpw0EuyRo9yD
 /Rp8iCcW4yhHfjCJ68w==
X-Proofpoint-GUID: h6s7THjlku_HPaqfly8opdXr_zzxhgT6
X-Proofpoint-ORIG-GUID: h6s7THjlku_HPaqfly8opdXr_zzxhgT6
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c45a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=A-Mz9B4pz0Xx8zSY_0oA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190110

On 5/18/26 10:22 PM, taygoth wrote:
> This series adds USB Type-C role-switch support for the PMI8998 PMIC
> used on SDM845 phones (OnePlus 6/6T, Xiaomi Poco F1, SHIFT 6mq), which
> have been locked to USB peripheral mode under mainline kernels until
> now.
> 
> The PMI8998 SMB2 charger block integrates a Type-C detection unit at
> SPMI offset 0x1300 that performs CC sensing, debounce and Rp/Rd
> resolution entirely in hardware. The state is exposed through the
> TYPE_C_STATUS_4 register and reported via a single consolidated
> "type-c-change" interrupt. The new driver reads that status on every
> interrupt and pushes the negotiated role to a usb_role_switch consumer
> (dwc3), enabling automatic peripheral/host switching on cable change.
> Because the hardware handles the Type-C state machine natively, no
> software TCPM port manager is required.
> 
> The Type-C block shares the SMB2 USBIN region with the already
> mainlined qcom_pmi8998-charger driver. The two coexist on the shared
> SPMI regmap without write conflict: the typec driver only reads
> TYPE_C_STATUS_* and touches the IRQ enable bits at offsets
> 0x130b-0x130f and 0x1367-0x1368.
> 
> The PMI8998 USB OTG VBUS boost converter at offset 0x1100 has the
> same CMD_OTG / OTG_CFG / OTG_CURRENT_LIMIT register layout as PM8150B,
> so the existing drivers/regulator/qcom_usb_vbus-regulator can drive it
> through a compatible cascade -- only the DT binding needs the new
> compatible string added.
> 
> Power Delivery is not implemented. The PMI8998 PDPHY block at offset
> 0x1700 is register-identical to PM8150B and could be wired through
> the existing drivers/usb/typec/tcpm/qcom code in a follow-up if PD
> negotiation becomes a requirement.
> 
> Tested-on: OnePlus 6T (sdm845-oneplus-fajita) running Mobian
> 6.12-sdm845.

FWIW 6.12 has been released 2 years ago and the sdm845 fork contains
a lot of unrelated changes. Please give this a test on linux-next/master

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99BA4071DA
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780827470; cv=none; b=QdBsFisUjzeQMTm/GueF9FvSJdTG/lau5C68HO2kLYDye4G2WMZ4Ta78RK4wB7s7Z0CGgpi4zuhxDRC21W/M18JiL4xbYaUMNDmedtdJLX2GqKIAvDl2LeREF4YY6rbsB384WSEHnj/eWDGYWQuRnlqHkfkKF/EOOmUeuPoy2Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780827470; c=relaxed/simple;
	bh=idf868Vsbnyyotx0jfNiPXsybJ5w2gQ2keSGP20nPmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHmb2DA+HpScScSof3Yv2htlNEvQIYEKodIVewQu1TMLxxKgucDmLVNzGu3AlEUxTTWNdZv0Gop36xQ+tZCBQ6CDgrygzR/132KYt7G0aIddMSiPG+gvYj165xZQVunarhAl18YCjBCmTuGIQG4Dy+eug6KYhm5oiPfKiSFDsFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nigugi1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHWSBPcy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nigugi1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHWSBPcy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577BT7J3719726
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 10:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M4FwfUZ9jESPMwli0wZo2L5a
	U9CNfaUCjDk/3XMqWL0=; b=nigugi1Dt5LzZTWMC73FUxJV06Ogbbaq1U2yR/C5
	DPFS30E5GhCYhDjYNBviOdHrcYccTJQWgvycC/HEyXGNVsqgESd5PqZn11JVd++T
	sYkHpwa4n0fHTtW+JHJBe+nKHp51LK9bhMebdrmCjg495VGqWpHo9ME0fWFa3yq6
	LxSC45J+z2rgyZA1BNNvQH58wWg+sQVR9oJPtwC9PdfEidCA6z+mP6dV5YNLYd4j
	xw7RueetEPuUty5K+40j+39Y8bOym0vEP45JIAFH4pQXbcig7gsUz5fraGxeibbq
	DaZlRGU+qfALXyKouvg6dgg1kta9OfN8qb5LDH+4n2+gJw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8u92w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 10:17:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c152655acfso535024137.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780827468; x=1781432268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4FwfUZ9jESPMwli0wZo2L5aU9CNfaUCjDk/3XMqWL0=;
        b=jHWSBPcydhs0Y6ENmiWmw2JJMFeXEDJn0hWGgJLQBLNqD8KwARLsjnuha2fI0JeUQ0
         FfDHUkjNSrD4VJSeBEyjWNkeFJ7yoIRDdNHhhvdtbBgwi6jMmhKBDUXK1ERHzfRLUpCd
         3yB3emAWteZKMLjM8UToENLzA1UP29q4QTqB0ms00CLwT0nFmSK2i2ln8IonerVoFPUA
         KgUhJdQDcMlEkJrWF3UtnYnTAwkD16SP5biWt2Ua+5l1qx+p1DoLNmWf7IAOsUmS7QMi
         EFRJ4Lh2ORCY0FqsDP7qKlQUBgNc5fRg2FiAAOa4d6WaK4nZKRe0U7E3GXERnONvDcdW
         5gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780827468; x=1781432268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4FwfUZ9jESPMwli0wZo2L5aU9CNfaUCjDk/3XMqWL0=;
        b=b/xWx+9bvS/OX3WsuCdaGXedXwoaeAU2gmeW2KtkYffo0+AugZko4vbIfWIewWbJUN
         zZs9xjk1h9BzgBHGWFQD7dh/mSeD0HtkajwEnjg+A2jCYvLAqe762RnQR7zY8SCDCHY6
         1J0rewt3YDLr1XhkNAws3WiSSZ+cpzFe0pi+3+08vht7xed+X0kDaqP2kAtOABLzRqmj
         jo16Y+R/YNN1g3ZSoH+k6HZBru8VEiixmN5LChvFsdcl91PioaznKiBFOzRyzodvF2UJ
         AnEpzPHASchQjdrY/b1OIkIymhbT5fq48tFHWKrI7GlEc9HLVuLAEx3HGSsohzC7c+Hw
         YhXw==
X-Forwarded-Encrypted: i=1; AFNElJ+15/VOMDZIAPWuFdAtD9skv/q6sUBhfBoTXdi88tjgCBOKDT9a7A9N+lQvN5bI91UjAVo0eUyOuAeB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4zlQO44Idz/yVHBmczf5dPU0NQTMtXoccHzCCXshGNPiwDnhL
	m3I0KswJnMhuiLhd6xcbtH4ppCXM1D+3c30PDKIl1PTSj7Fv2oi9v29JsqmsWpVqRTlL6kRWvHD
	ejoKc56XmD3mGUmuwIj75QYL+Geo4R1gs2O8IFgdkl9S2oj3C2DkHmUA/fAGNiQI5A9q1fxnu
X-Gm-Gg: Acq92OGn0rXBuQUUqHslA3yZpolOghfsbbRdE5eMXVMxAJQnRFukH8d+K6LEdxVur7/
	HT6WWJWG7oUmU5j/aINu0AjUMgyiihcAVIpU2LkNF1t+q3a25MQEzC2wYctfcbPF8fsEaPz49Oq
	CHjyZ0qSsQLYFNNpjDiaG2Cu280Mz3OUOGHA5FFVRLS8E65BmEtbmpybRLR626PKqosmvRcQi1y
	sIkTO8PywCjSRgMSkJC3iQOWDr9IdKOalj7svYlgMxdjXzJSNOzhupJuEpBtFwUNkJNZ8YEh/J8
	oi3kpQ/L177Mb02Lnjiusy7uD1mnN2oW3GzogkueNtQdzgpu0unT4NgKGKLS/7p/GeC8VmGnLiG
	d44bkobPnri84LSByP33e7v6eRFnthwk6sljdVD3JX6pjMmDpXB4DLA5zppMoTQhUpxHzEIq0OJ
	LyxUwl6A0rWmbS/jWR3eYnguDkJ+SdBj0dNbANbrqaUV5KVw==
X-Received: by 2002:a05:6102:3594:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-6ff018e8796mr4345830137.26.1780827467951;
        Sun, 07 Jun 2026 03:17:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-6ff018e8796mr4345825137.26.1780827467554;
        Sun, 07 Jun 2026 03:17:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c2b9sm2984082e87.80.2026.06.07.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:17:46 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:17:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <ny26r5a2npafcryx4z2xoyzkdbp6r5vbdoc6asyfprw5q4hgzh@ukbc7kfpzsle>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
 <20260519125655.23796-4-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519125655.23796-4-blfizzyy@gmail.com>
X-Proofpoint-ORIG-GUID: 0BD9vsDQfaucm6PsTY1uDkErTBlPrq3i
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a25454d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=JL1AdETER_kwsCMOzjcA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMCBTYWx0ZWRfXwi+pp0ZZBX1z
 riVWJEez0QXRCSBzdMqOLc9wKIPTfJjdse19gn7L9iG9IIs82hJQnhAiYi4WDlrXVpmuKxtahmL
 wQEoRJlsQbNmFluXvaSIsDEEZaYHYgAhRbM4xD0Ss+tMgiTD+NJWWHDkKnGlrmziI+yOSqMidVl
 6pIoPRoyscOeCaWGqzP/gd/BHAQRD0UH2P0lTnXWaYVvhQz89Ye6qP80QJWA+rpacyO0tz+hXXm
 TeBG9tGG2cbg7Jj9Do6k7DEr3xzrFg7TlXHy12pAl1k3cnIuRLiIt0RcVxfNgV5tzzv9XM5cv4Q
 YGQysZv4mtbX+JU/7VAy9hnAncCFvtSQdL/guuwUFZXRsAGMJlNeh5mgo41FJVdvCfIXQlcy8Sf
 dTj2T0CBtHwKU/QryIuy7wnYFQMTTHJt0ZTWs3lkJE9c8Fk5XoLkVZak2BcS114j7R5C862V6Uy
 15AEWWPwf8W4nb7YNHw==
X-Proofpoint-GUID: 0BD9vsDQfaucm6PsTY1uDkErTBlPrq3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070100

On Tue, May 19, 2026 at 06:26:55PM +0530, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
>  2 files changed, 1026 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
> 
> +
> +&pcie0_clkreq_n {
> +	bias-pull-up;
> +	drive-strength = <2>;
> +};

Could you please add a /* pinctrl */ comment at the end of the file and
group all pinctrl-related changes after it?

> +
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	/delete-property/ qcom,ice;

This should be explained in the commit message.

> +
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <900000>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	dr_mode = "host";

Is it actually host-only?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

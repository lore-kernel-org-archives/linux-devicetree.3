Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2571E41DDE4
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647968; cv=none; b=bS5b9VB4D7mYt9z8ggDEN95woWEAi4zKtULKnuOAfKd+G7Kh+gufOGZch9HDjPZXzDPA/MuBPpyxj9VM6CKNhYYl7r9XmEYol6lfHIf6cZyWm7x2Y922PMMFg68Kz4HSMv0GySAOmb8zPDss4tH1W/bMDeHATMoNyclGzmsQ0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647968; c=relaxed/simple;
	bh=jS8JkqlizgK4WoSUVO0lzGw9Um3tSM5EfLDcvRh59Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuLqqSpIALXvDviLvILQqj+mLZyrfHsvWe0BnVSHgrcE9bZM2GAke2EDdSPrPsjy1Cuh1lYUy5KJ5v+EVd4DgnOAB6wVO5q61XoyNcGa1f8VyJCvtkyvQm3jK0aZI3GD+Azk4RtphLUeQUTWlnybTqC75DsYHf5Dyk945ptRiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpnB7zj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEyJ0TaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpnB7zj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEyJ0TaN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DIhrUa3929322
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SqtYgCGRvHbqjrphQKjTjd9J
	al7/lUk67I7fKfQTEOE=; b=LpnB7zj8J15wJ22YF0idbKclmSXSW9MHg3UGbz29
	/G+yzpRNuN6DmPyvKhIvNriEV36s9c3P6aLxD/zoRVL9Wp58o91CisXIQurbyoax
	rzZPvnwIO1rdMp+znUEcpyo7CekHTRZmlUC2FgHWCpZSkzin4/RzDA3kDuCNdpJm
	HT/NQUGOX7FB15B3iFEwVOSYOLlb0SbC72ms/1Hu77beMpeMasTJWfYRqVTM7nT/
	rOZTKch70qNw2clpScW2sif5V8qjMhGC6Hss4dBBcGEMBJ+WTzeW86nSr9ILin++
	wivnmdwhQ+kecfJM56y0w39Jnbc8O79nQRpIo4AkxyBRyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18183epe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:06:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso3553101cf.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786647964; x=1787252764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SqtYgCGRvHbqjrphQKjTjd9Jal7/lUk67I7fKfQTEOE=;
        b=QEyJ0TaNCHwjmRlrMxJGt8Zi4P7wNT8PPg+z49hurDgOnPLwPmp65wggmGUgaPQQHq
         hvJyJVi1ITTmot0jbacm2OadUBaQX+VNxIsB873xgdUCr1vcFUWnRg8LFTwkVJVUKA7R
         X5AtWoKVbKlH0nxJesU2FsUG35TsuVengFdarjTeXXncPMc1eydnKfq5Uglw2Qsg7dT+
         s5UXMI6WhcwOqw0cYoPdftZWQxoqQQC55hbgMnV7/K9w63pFv7ub3/oXPiaxHPF4Xcu9
         SmB7gwIbcn0U1nFmSoGwj7qOfkpP8y7Dq3+pFp9UoLZNQnJBxZpfrveptcrSRNPs1V2F
         qDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647964; x=1787252764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqtYgCGRvHbqjrphQKjTjd9Jal7/lUk67I7fKfQTEOE=;
        b=pTVAlpdBD8XZlKZguZr4NdS0WK/Ya09ZEu8UzEIPsgE/B9A6Iy4ZrNo4AXUzhQwy4O
         NXKi2CVsWu9vky5tBMzaa2TBA07mHcqSdvYRcoht2wG7TLcKwvntQAmomUThoJ1ErEcO
         lxPoDN5tmxuYYauN+P9v45O7bGGI/wMMPpSZ2cmgsXwfj78N3cpkAeSwncM8vG6jw1Qn
         nol1IBIDJLz/b9IQJMSz3LEsKxRgEfax0WAsJqizXsseY6AaHtkaCs6hAsvOJ20V1kyq
         lHUz1nhbsWNyH2trxCoWRwAthowvbURMFtinDyH1X/N0ngaRx1WIbmR6XzUEyci3pTGk
         EOWg==
X-Forwarded-Encrypted: i=1; AHgh+RrcChtm7XZnTpxruf1RNMkb9bi9SZPHyQiFWwklOYOi4H1h9r2rlCEGfBgaJsZTJMxAq6EgiFnOV2tB@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfQk94335T73Mnb9of85FEbKiYESuTwOC+I0SLRyLbmtCuUmn
	JjuGCiSs5URhl+DMHRwXc2iioIH2d67aCqd3Rrci1FzUzTsm80taeO1kJub9qDZF64ey2GbNFqM
	MRlnGBoGRjD3NBLlJ4G1fgo8uCMdu1aG+Ss03VDZ9alW3URRykQ7fbwHX14VSlIgo
X-Gm-Gg: AR+sD13o8S2FKFfRWqWVNVEYcvnvtWoRIRBuV0BWO59R+62mndOQ7TjytJaay2BMaHf
	aTuzLDc7CJNYv/bbcdZO+djgWNBz4+bevSKcfzG8Sbl2kcL3ByJfYBdIPuVnbBI2tQI/nVeBeEf
	+ZlVEkm/bpBRN4wK57fVtJHW97co61PRnL1DxoMXdqjw0xBnnhUfN0V4/o5a00NnjsNDXZB9jGe
	MGNiY4ILAAKhPVnuqCQfdinEoRZ3zrpt0K0ii3aryNon4J6EyhEba3GQ24+OsutAYw/i1wwXWEW
	ofMsSRuj8+YOukGzEEI8l8X39Kf+/Cmdm7PTcN2N4r0BLudBWY+yrydhOFHg8wo6DILM/Obr0Wj
	wafHA3Zcd0cpPBQocPRiEG0HhpHLCChNB+lbCt8eI22a3I5fohNe3DLdKFqrkoBAR1kJhyCF1oZ
	DJKUrDmOHQhVdb
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr1954121cf.26.1786647964146;
        Thu, 13 Aug 2026 12:06:04 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr1953281cf.26.1786647963727;
        Thu, 13 Aug 2026 12:06:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bedfd8sm57388e87.52.2026.08.13.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:06:01 -0700 (PDT)
Date: Thu, 13 Aug 2026 22:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
Message-ID: <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzOCBTYWx0ZWRfX/85nHpALbgiR
 +k7hYE232eoiyM8DjmPRLQIx2ZGi+OIF+f+7PPOMpkSx+Ck+KURGcOIyJLZavHrCcqJoQ5bbfCW
 m5EL3AgkYF/U7bPOANqNTEtcykbTi6E=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7e159d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=x2SIRoQZ2ETBtXEx6nMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: p7SjYV_sIsxcMeB81XcQmOu3HB2uOMsv
X-Proofpoint-ORIG-GUID: p7SjYV_sIsxcMeB81XcQmOu3HB2uOMsv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzOCBTYWx0ZWRfXw7bA9/Olyc/7
 Vvgh03BLKHtPGep2YQj46e8Vxnh5oPVWJBlxd9BqZaNVomp/lGfQS8hJv0nD5ydAdBBSnnBlxvx
 cYOtThYETTWcQ500TVP8vltRbVdASWA97nyka1/ge2u9J46sG+Dv2fvV9PbekXfClZR+WS1wmtB
 SMS59xkuHY033v2yNp9kFizG3wq4sW5Ohn6E/CY6iFlM3jQtoGn91JJ1hFiUtqZWax513KoWNma
 QrXl/0MC1kskwlgpJcWba/RH/X3zTOkYQUXmuCmzMSw5QToXkt4AVUQrtGLwdiYuP3P0GridkiN
 iGykXZGUNXvPorhX1k2IchY/LAS9bPzNDTnIFLQMuJ2xQxxvsidurvvhK6TZlfwSbxIPnuDA4oC
 CK22udwVzVSlz8s3Dt9R+/wuxBeorPsTKZ0+Jt3PMk3g3QNjcORb2AUs3o9VRpLNUL2jESVd0jk
 pgv2KsQ5Mrh45jnlJ1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130138

On Sat, Aug 08, 2026 at 12:37:57PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.
> 
> This is based on the support by ROCKNIX, however their history does not
> show who the original author was, so direct attributation cannot be
> given.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
>  2 files changed, 123 insertions(+)
> 
> +
> +	vdd_disp_1v8: vdd-disp-1v8-regulator {

regulator-foo

> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_disp_1v8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vdd_disp_2v8: vdd-disp-2v8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_disp_2v8";
> +
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +
> +		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	ts_avdd_3v0: regulator-ts-avdd-3v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_avdd_3v0";
> +
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +
> +		gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	ts_vddio_1v8: regulator-ts-vddio-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_vddio_1v8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&mdss_dsi1 {

Out of place.

> +	status = "disabled";

Isn't this a default? If so, no need to repeat it.

> +};
> +
> +&i2c_hub_3 {
> +	clock-frequency = <100000>;
> +
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "focaltech,ft5426";
> +		reg = <0x38>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
> +
> +		vcc-supply = <&ts_avdd_3v0>;
> +		iovcc-supply = <&ts_vddio_1v8>;
> +
> +		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
> +		pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		touchscreen-size-x = <1080>;
> +		touchscreen-size-y = <1920>;
> +		touchscreen-swapped-x-y;
> +	};
> +};
> +
> +&pmk8550_pwm {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
> +			"qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&spk_amp_l {
> +	firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> +};
> +
> +&spk_amp_r {
> +	firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> +};
> 
> -- 
> 2.54.0
> 
> 

-- 
With best wishes
Dmitry

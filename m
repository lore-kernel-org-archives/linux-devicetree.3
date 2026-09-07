Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C9449B11
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772449; cv=none; b=XIjnpkMsvebkBgA0s5up6Pl1+lB6hw8hx+3OKsQbzm38I/Eyjs/e0LS+bh7I4dhzFHVn/ivz1oPjQ2uHrlhQHeKV+X2MHe+WxnJtkkqcS3RVVlOO7+NsQxVz6yuCxKooomkmdAXnBf2D/zcD5av5Ajluj2O7Tp5LGHifGbbGERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772449; c=relaxed/simple;
	bh=7yBNhNMECRErPKAvAk1dDwZ3RKE97WiF8lbynRTizJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBRbtiDfMsY6ofvLgm9YeX+cN1iCTFV5oQmZyh2u10uaNh24bleOFf+LOf6KCOq/KLv6UJQNRUV773eQdd4ILUYwL4Pry2SBIEEiLgMLPdC8L1ZXgFS48UYXg4ZZABMkTgm6VVrl2hDKUUQFd5dHaXvoVJSKyYKYxiUlgQzGIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcZi56L0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgrHhre3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcZi56L0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgrHhre3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NN1G333061
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=; b=DcZi56L0L/3cyJeS
	dCoLsvsT5uBHlPun6cktmEzdrkFeBPYBR1P7iolA/WfVNUCufTemIr8PksypgB1Z
	QuUCVluqhpGrIEF0CNiVuisFFcJacSOP26yF3NNHNstjMF1WRUq08WhJ8dqJJTPg
	TALrWSQnc8XPwJEY0vYBbbIdMluyzTeSKOedOMT5KheS2YkM4asshJtXP2+hj8I6
	QXdhWgymR8xHE6lZaWvCLcMnZui7ndb35yWf9ZLXZzKI6dkiajeOIf/oOF2ZnItt
	BUggUZK8mckoVcbFaa55hIGhDasAAF50LVgMEjZ/c9Edi+PTjLsWE2glT2HrcXvO
	ixHcsw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8kb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 09:14:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91045c83dbaso8418476d6.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788772446; x=1789377246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=;
        b=SgrHhre3857/7+v35X102sxc6onIH3v9p8sjz6ZV1NDmC5hnA+nA1VYOzErigO1YuL
         p26Kvv2EnS6c5Ek9m5UkvMB7crC071ITeuKy6KXQdtIwzJB2AWGKebpmFEsjrwYFweYJ
         pyT4lVGYLjuHBE6QbFilP2AAITMWQawKJ8GVAQ8Hp3+0gpFhnOSUxlIG2cYgi/9Ln48K
         awp2Vvu9FjyYpr9/LHs+/hK3DnxO1UEopv0/a5ARE1ptqefkTBVTc7v6bJ3Yhx5F64o7
         RuHNlw4n1komDhJcCRPXdn8cLGp31d5CF5Z9m/1IVQC+IpvoPHT/2f3sXv460tkARz7S
         mOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772446; x=1789377246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=;
        b=FcNgtLm8IaGqqIdc7FIeXoRqKS3B1mzy3XnZX+1aGoOHE1nDYuF/Iou6bHZlEC4eA6
         UkGZbp64tgIOhHR5w3PlIG4o2PbQvL2MkvwUWquDJKOipCEOCzLXHT9zDkpVPjuA4gHH
         IHBgB3AlTnGXl4X/jJp1QffCCD5dg9mK+qwqfGd8wyE/foVj3+kZQIgUipBo8KnC7PQA
         PNETrw6vxWJ1l2Y7wU5dcekDCO7z/AJtHYyNGSO6IXsg7cqCOoGz2LMTCNMUKz1oyYJS
         XkqnJ1YCyVfFaYK9E635/7h9/jLgZ7HltJKvlMZL1JAoUNqcsne5n5WmcW6qtxY9GhPW
         5Guw==
X-Forwarded-Encrypted: i=1; AKwUvByNYC1NBcceL+7VCPnU+C4E8B/I1S9PGqHfF39roIOu1dm8L9E/GouIdq2uw+edTtrYwJwUTmW4qR4X@vger.kernel.org
X-Gm-Message-State: AFuF++nr2Rj8cwLT8VQ1XpQ4ZItIQwPXm56bsyMk/UdbE5SgVI1urH77
	DRAMUXHiNwMv246GaIbFMNkZFCHbWEz0vK0wVu9OQH/UQ12hx5O0HnKZaEhN/8U26T7whWtQd/M
	I9r0CR/R0NKm1kRd/1Hw/X1lzOLbXuaT/zqugPh5c1u98sZBppQH3ClbDq8pWuDDP
X-Gm-Gg: AYBFou0TogsBVrY2vCkSeJSG4gQTYhriIJcc+E+ssy7NRIWG6wy6u1gEwxu4lr0jbYa
	MXD8VUXYiif+V5hL9Vj28jPeTQsVfrNzf7PxuNLva53vSwtDp5RYYw5/7z3tOH250fCn92F0eBG
	WEjp+0p9wWccbHl9Cvp79IPacIqvV03dNk5vApPlbYSVfDApAzRk+uJ4DKw48iajZBxuFoVoD3c
	NH9yme8SD2jxpiRRVoIeI8HH28UlwH7rGdZky5PSIaWWZhvevS82/JxhzNmigIPQRsK5f0E7zV/
	M+MTV5vjY6IavyAs1m91VJl6jZhosyyow1jFXaohax5ctCyzQJWneXr+DkU/ZWzpmPwt0sjLiO1
	/LJXtTzHWr+eHllwHV3c3jg==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr717458885a.6.1788772446342;
        Mon, 07 Sep 2026 02:14:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr717455285a.6.1788772445808;
        Mon, 07 Sep 2026 02:14:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b284bsm438969066b.51.2026.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:14:05 -0700 (PDT)
Message-ID: <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:14:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GFTkg4Y5eFYe1Fay8C9FjCKo5juVILm8
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e805f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gxl3bz0cAAAA:8 a=x-UWeAqAqefo9e84DDEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: GFTkg4Y5eFYe1Fay8C9FjCKo5juVILm8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX+JmmdMxzpgaw
 ql/MjlppRx/2RB7zK52aNc3rydUhI5qTzbwgANJK5ZdHTXLL+YdNTH6D8ZGZHiu/Htu41dY1W6m
 ghez5WvDRZL0inFkjcbZVbKE0tTzYZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX+1/vDWgmrio0
 zvYUJtx+i2x6Him/szWoqeNvwf8sRxJ53jvdagg7yBasuI82Vk01VSdzDVx+6fmpBSF++OaG+eA
 dpQ2EExlSr4OoTMsJ55bWnkIfcGAd972ItAwCnKHtrvmMoYMAR8ocyoCyOVRbrU4567s504LK4N
 5JaY8UQ8jvuZsTTEm5DgvPVvo16Ue7rLazqoYh/FnqKwNwkpd/W7ZXhLak/kzn6NK0xNaw0gyB0
 gOZesEt1cYPZpcJS0syOltOZX3LgO7xVEtqUDGZbn/iY2uLquVOXRreaM2Y5iovM6ZZXParUG0/
 WzQLG+YUwnjmZvuMXibBfa6JAKBv4ITQ5MUeztIiXlkCSeXbJLvKYKo5SJUY+a3RNlAkEvMnoXm
 NPw7wsWw53UWqG21z/jQto/US1ww+xZC7PMLR7Uj4QX0FbthP6AsZseTK0icutQ1YJD2xd/wpYD
 N6cqni8KWy6WiNm7uSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070100

On 9/6/26 2:22 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add a common DTSI plus LCD and OLED board files for the Lenovo
> IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100. In some
> regions this SKU is sold as "IdeaPad Slim 5x"; the "x" is the
> Qualcomm suffix in Lenovo's current IdeaPad naming (i = Intel,
> a = AMD, x = Qualcomm).

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	gpio-keys {

nit: 'g' < 'h'

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-LENOVO-Ideapad-5";
> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS1",
> +				"VA DMIC1", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS1",
> +				"VA DMIC1", "VA MIC BIAS1",

https://lore.kernel.org/linux-arm-msm/20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org/

[...]

> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-state-mem {
> +				regulator-on-in-suspend;
> +			};

Why is this necessary?

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* 3d PS883x */

Any reason not to wire it up now?

[...]

> +&iris {
> +	firmware-name = "qcom/x1p42100/LENOVO/83HL/qcvss8380.mbn";
> +	status = "okay";

nit: \n before status, please

[...]

> +&spi10 {
> +	status = "disabled";
> +
> +	/* Unknown device */
> +};

Either enable it, or remove it, I think

> +
> +&swr0 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names = "default";

'status' should go last

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +		<44 4>,
> +		<72 2>; /* Secure EC I2C connection (?) */

Please align the '<'s

> +
> +	eusb3_reset_n: eusb3-reset-n-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You don't need the output- properties on the TLMM pins

[...]

> +&usb_1_ss2 {
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_ss2_hsphy>;
> +	phy-names = "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +	/delete-property/ port@1;

nit: status last, please

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61014483B3
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982257; cv=none; b=UAP69zDotG0jA4YV1zLA9wc3Yb2e11mh8GbN89eZR5j4GoFa2ilkpPG9eMY4bJaRRMpqJvkvGWWK4siADdIZ58nwLrk1g13cBLDJ+sMFL7criNgOvdtZ8psmnYljvlJ5PwPTMvecELaxh+/KXorGtJ0iXaq2dB0NgfOVtr2RPoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982257; c=relaxed/simple;
	bh=emNPuRCAyxU3Gn6X+B2FnhI+z52aNUB6G0TLtPQJiWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNsUxSpPYOayw44+JV0sHwzCEVVBcCb0+rL+hcDaaNQF4S1IAhyMAR5o01EON0jWnSFZkM1bb2LiQBpUqz8NIRVZMvn54Kqr7HsPTofEjs/fAUXq5rByqB0xNO/1ZcJ8bb7B6rUSkmoP0R0fsLK5ipRrKywJGSfNjBzsFLcp0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnwFx4dN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWopLTob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnwFx4dN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWopLTob"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFZ5QP1841390
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxcqqZMcfMQG0NRazNx3M9ckLAOYPTmpP07Foy6k8GI=; b=GnwFx4dNXJOck/32
	lh8S0LUpRjNWIkYURELTU8rv18AsJKu8lilSCK6u/YgXq+eO5zRkKK3Si/ODV8xE
	lH+obl33oBaaDqqIDa4rmwwlKGwFu0Vlx9HkN64UVo1wYTKgNaOLrTwIk2YFTLRW
	5BxsPmUrVltriuvzZ+Fllkxt3o1snIwZ+gICy05W9pCuQXxv0SSS3n8KY1ZJlyOL
	j9t+lPkau0N27xFR9O2KCbyWx8fK1rI5SgpaphB4xAGhgf+c4S9GHljxX245RKrW
	DxH+iO0XmCbRmpIOYd2lfG7LJUkYTSjr+9huQqFGoMajSyKqQTzQ+x4g8tXL/bF9
	2Yz8Uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30hwuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:57:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so4345671cf.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982254; x=1787587054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxcqqZMcfMQG0NRazNx3M9ckLAOYPTmpP07Foy6k8GI=;
        b=SWopLTobvOJ7ee4Cz9Sq8bA+l++7dwWy+nPFkKO3nHH2Flmz++aBVT9KVfV8sLAjL7
         oGj6hLe0QNHXNAF4H7ulw6rT8Lk58npi02Iq/BnzAu1E4Zi/YAsuzdFPQbNgVxC4rInF
         inf8j0k89P4DEKWz4fj2VYeypEOlU5G/Cq+qbb5ZXbO94DfPHRdQDEUvXBRaOZzvWP1a
         X6ZKf+O6hCUCs3UyP491SLi6o9YnfZkxz53oYGIT6y2jUJfWMQT3qA41p0PsrUJN89ph
         DzLtCBp72Ns7E6wuUxmhW2FLpOJ1ATJFEabkNOU7sSULcT4yTSf10E+uZv85EGCs1gfR
         DUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982254; x=1787587054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxcqqZMcfMQG0NRazNx3M9ckLAOYPTmpP07Foy6k8GI=;
        b=IR60c039NNNj3R0zfROOQ+Oi0LEIJpVcS4zDQaLJ4eg6mGtCRm1fr2iX5+cE/+1VdJ
         qy77jk4uaJgz2MTGNLKawbYFBhVlXnx54wv4YaAWHpKhBP6F5zN8FMxgId8ObayABEII
         oK3WFf/53DdRHzC+D0fcXfGhqYmizdeAq6F402cPB3J2jeEDJetJrh+SA1mqGz+lFs0Z
         re6EIE6GyPcNhdtBN+IZIZ5PDY3P+bLdrPtFLmMBOJesoSnD1RRRuXl5qZKb6heEDkH3
         u391EX098F6n5+scfx8GmFt1k2qOcZIe6Wi1Cre2ZLY6V+IezPklUswrSMIsNcubLC6d
         40Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqPluLmOm5qLS7KRKXFyGswNklxFLJGmQt0MXNKgdh3wRSbYIdGg/SeKlE3C+fiIQ1lYf3QZErO98Ir@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oOpfOIhSb+mWW4IR6aKe65az3GfmamOq6jkeURRxM0WBbAUG
	ilqoTQYdlu6vUiA5Fkgtlyf2r6SACD+fu3GuPpp1g+6GPRFoPFrgIfhxFxjG/3thCM+2ruUhUlw
	BwZxw8QfHJw5E6h3I4xiGV0LLV7duInC6XwE5ALDNYIJzStE8dHoeNHr7n7Z2Ma2P
X-Gm-Gg: AR+sD11tIbbZ5chI47wthLjrzDc5GrlawBtvdQGazqrPfoSsh1oS3UobXBKdXATGdWC
	N/QhcA+V+LDpMPwCPy4EoRS3XEoYglDuHAaNq0iJYCcIDMuY2j5sWdnDJEINC/1x0EfNTs4XsH5
	lXO4yXNcnV+2+XbaT/ktUFOOJnDLu2LEFeWGTqlqoyxOpmnaybDQAksK5ID4kn5XCwvPhuPCPpg
	EeO71RSYlg8KVwJWH5+CU5J2IPL0jxlO06C8Rn06870uWaREEbel9dom9gXeTZiNq9vjdd3KJyg
	Ns0hYMruYWgp5khvoIXW08h6fyKOBch8PeehopGXgWqzlhxLY/Yh8RL+YNBT43z1I2PcfoQB3fk
	9iifxaxB+KBFtHem5F6Sh9NQB
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr113109071cf.1.1786982253529;
        Mon, 17 Aug 2026 08:57:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr113108391cf.1.1786982252961;
        Mon, 17 Aug 2026 08:57:32 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm921569a12.13.2026.08.17.08.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:57:31 -0700 (PDT)
Message-ID: <3021cb06-7219-4e54-8188-e9cef09aa1ec@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:57:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: Add LeEco Le2
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-5-79a779d76173@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-next-patches-v1-5-79a779d76173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX1FSyKDYNRMDj
 QJYKurdL3ZFBx7YmxTzIgdcLFh5TgVkGpuyC9vFES8T31xN6GeuRYSnpZIwhOGu5edwA+30UJpW
 oJ9eG/5ZrtQ72fO2WjWxrCMvq89/hLKy2AdL7aCZgL2RbQKbUhFIqYFqv02jouJhGRFHKj8G9OC
 5MGD7tdgZVOjxD8uBSiY1SHic2P0eMHu9sYizPfH8GE7t6ecC4eg1V2knwJHARFemDdJJB+gRq/
 2m7OBGDYMM1VufC3pnCtVywYtmQo138PQLGzwUwxi6MD4ofeXDmF/8tkOKGEoQmNny5wpAn1FeH
 ZuDpomZZKl8gE8le984XN5ovORYzr07qKnRBT2igf8nfX1+lWpD5b+sUXMzFook0EzHvuZi8tSJ
 SAr37scxVTq1pNJz3oNz+wpAjXvmLvrdDaW1RrCrz+ueYIaILgEhBZw5lkXGHGqpZ6JN4/Ggqov
 ehDY3hVRYif4aOW1Mfw==
X-Proofpoint-GUID: GoHj-n_9mlOJJHVpM_dBSeCtI8-B5jYg
X-Proofpoint-ORIG-GUID: GoHj-n_9mlOJJHVpM_dBSeCtI8-B5jYg
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a832f6f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c_BSE4CSJTi7_uz2YGEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfXzet02MWXQSFL
 OMqntR0NaRK9m+tCHms+Qg6C7AEL/nxItesQ4R8pg+wyv8Vxij+wVzg4BR9jcQrgdyEWwxTktGS
 uWlzM8o6aYPR+ve8ym12ievNE0wxwOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170122

On 8/10/26 6:55 PM, Adam Skladowski wrote:
> Add a devicetree for the LeEco Le2 smartphone, which is based
> on the Eldarion/MSM8976 SoC.

[...]

> +	reserved-memory {
> +
> +		ramoops {

Stray \n above

> +			compatible = "ramoops";
> +			no-map;
> +			reg = <0 0x9ff00000 0 0x100000>;
> +			record-size = <0x10000>;
> +			console-size = <0x60000>;
> +			ftrace-size = <0x10000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +		};
> +
> +		/delete-node/ memory@83000000;

Referring to nodes by their node names is fragile. In this case, you fell
victim to that since this node doesn't exist. The more modern approach is
to assign a label at the definition site and then do /delete-node/ &foo

[...]

> +&blsp1_i2c4 {
> +	status = "okay";
> +
> +	rmi4-i2c-dev@4b {

Node names must be generic, so touchscreen@

> +		reg = <0x4b>;
> +		compatible = "syna,rmi4-i2c";
> +		interrupts-extended = <&tlmm 65 0x2008>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd-supply = <&pm8950_l17>;
> +		vio-supply = <&pm8950_l6>;
> +
> +		syna,reset-delay-ms = <100>;
> +		syna,startup-delay-ms = <500>;
> +		rmi4-f01@1 {

Let's keep a \n between properties and the following subnodes

[...]

> +&blsp2_i2c2 {
> +	status = "okay";
> +
> +	haptics: haptics@5a {
> +		compatible = "ti,drv2604";
> +		reg = <0x5a>;
> +		enable-gpios = <&tlmm 109 GPIO_ACTIVE_HIGH>;
> +		mode = <DRV260X_LRA_MODE>;
> +		library-sel = <DRV260X_LIB_LRA>;
> +	};
> +
> +	tiusb320: tusb320@47 {

I'm not super sure what this chip is, typec@ or extcon@?


> +		compatible = "ti,tusb320";
> +		reg = <0x47>;
> +		interrupts-extended = <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
> +	};
> +};
> +
> +&blsp2_i2c4 {
> +	status = "okay";
> +	led-controller@45 {

Let's add a \n beforehand


> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		compatible = "awinic,aw2013";
> +		reg = <0x45>;
> +		vcc-supply = <&pm8950_l10>;
> +
> +		led@0 {
> +			reg = <0>;
> +			led-max-microamp = <5000>;
> +			function = LED_FUNCTION_INDICATOR;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +		led@1 {

And an \n between each subnode

[...]

> +&otg {
> +	status = "okay";

Let's keep 'status' last and with a \n before it
> +	extcon = <&tiusb320>,<0>;

The second extcon is optional, you can drop it

from the chipidea bindings:

    minItems: 1
    items:
      - description: vbus extcon
        maxItems: 1
      - description: id extcon
        maxItems: 1

Konrad

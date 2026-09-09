Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A355D875
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957792; cv=none; b=A7TK+eH17blg342szyUg83yRZ3UG6WWLBt98S7OxWdEBcguwP+pS4SP3joHZC3Cp/0RdiCuJCC+SlDKiTXs32a1HGSvjcittdJMMLhoadUtdyG89MFBSkbKomD2vA1QTPOySwp8/Qdlbi3LEGnxMXH+TSG5xzwQQ2W9Vj2M5Yv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957792; c=relaxed/simple;
	bh=mzTZ/S7+IJMli97Pl3huO2xHKYlikMJEbLwPxRSRxlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAKIWeNYSPbtrXOXUY2X1tS8MKqUTenA+vRZ7qPrmPB8DbzWzhpsWXy8g/kDIQjQH1qPD8mC7QdtnEdU46YXXvQ/+lCymz612ak6zbr5u2dvuL4U24P8d1VgHeoVgk3A85QEyvvygk0KVosaNRx93H6uMrKpfR+m9kUIPHcJ1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klN1P6bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+X5Y04o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klN1P6bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+X5Y04o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Qa1810036
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=; b=klN1P6bbHCPgPlve
	NnwHMq3xl3dQD5vMbBxlHuf2TFWL91G5renrlOXpc33xRUn+HtAXFRdVcLqCSWwh
	Z/MFSGwQF6nKrTjqTR6wBO4OUTeesnETVnqZWZ8ocsCG9OCLynhSHIZ5yYjC28SM
	UWi+Yo9Ye6HjBotQHrUb7TrBuH3hrkJhld5M0xy5dX7F6tNYcwVuuYsJxa5HJKFK
	fAZZPFTPBtXPojBkxIkCrVltGgEQjBjkxpofzSk6hbLA68KO4888N01/QGRmr3LD
	qqY1YPYBAYQGwBTfVbiRI3EIGPE+7NqsiZ4B+M2sYwPNkfOc9+lhd0qqCdhaFHot
	YfYWSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0nvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:43:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso74629885a.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957790; x=1789562590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=R+X5Y04ovw8dsEYVkQ60of03C47klPgHtC+lmy18e+dUDStUndQHp3Y5as8hkK6TYd
         0AoJwseqCJYRIrwpQbxA4OcYb9SiOzsGIo7i6EWcuz96DfkNrncBeeV7g1oN/O6sVGzE
         lL/UzQJ9dsE0jGrzbuNwNmDyAjsRsxXzluKYEbMzEAkH8kdsw7VCzm3h62M4jzmEgl94
         uhtGDGJTnO2YSLFAo1K+T0hVbwh2X303zqoNvvm+xITZc2rX2XDMO6BSueyibzmgMcRX
         0MqkHqlGk3oKZxi9+MjsN6zW6XYD6ffdZv2iSXutuUDfxIlchqFMtofpoSiHbeo3pdG/
         3qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957790; x=1789562590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=aFf/3BsDjctx6CDw2jJTMdHpsq5qo4Gq1pwk56hF2CMfKqaGooqPsG+HqdAzhugZW4
         OzLz0Pk9R+w1OMIX1w9K87tWdvtaPU+VKioSUvksS+8W3YxpVbsDKrkh4TV07uvY6XN8
         KpXuMg0JSJQ7J6t3Jmr2hZpP74MFft6HkcYDBXBnnabuU4NcdXFCCWk4GNHpcNRuNNvQ
         qnkiDfYuGqMbK+GhWcrnu2Xn+ZVzt/1YPvGo8eHiudrsjYxJ+BgT1EuKQosGm75GebDG
         Bl2N5SQF4nlQ873CkUAjPNiQSA+HRgPfEIxVv2x9Njm4ksI5tUpGmd0QOiCUKDBkqgU2
         c0wg==
X-Forwarded-Encrypted: i=1; AKwUvBwvq39iXMoXI6SQ017PMMa3O15IJrn5x5TUH36TyoOuJDOkxTgQu2CQDN/8zpXB9enYC6iWzey+0dUC@vger.kernel.org
X-Gm-Message-State: AFuF++nGDlhkWcgalUydq7kf2r2ZJ1koM1gk6jRPFG8QHcHn/sNYJAfw
	D4gYsqEADpWGQninhg5b6Tvmbdv/Ai5LsGruKdBVKHAgPgzUj5wDpv/UOMrnMn1Ixqx6h45EbI4
	3qjrX5yhWu7Wl9fa0113rIVjpmGmrcBsHX0NZ4JxWf08sOgVXn2amL7CM9ZH1Sb7V
X-Gm-Gg: AYBFou32yGAxIcyWOsI2qvcmm1v2kuIm+Z2wQVaKGxnuQ9eGVVsV0/Zv55iMsKRWzzp
	+dS0hPXQ7hhHA9ZX+TuaY227FP0eotTtnLe9OB+se2juDkjGN56hEgmaq95KNBRNuzgoesKtoLn
	zLFdXPEnX3188O8TC1pyjLvdBAot5wRtK2UZyUii0jBpt0V+vwsQymPG51tcZOPlCcAKwGAyged
	tQm8d1ZWFaWuxB4zrVIXnP46peRbO6l3wMExi9a1VR4c92pkPFoE+kuOegUd2206cF0ioGaQmJ2
	ygV0TsI8UCAr6BqVvIqdNg4dh5gCvjVgjwxlfSh0sEjIsifFEGSTQXLv0tlA1fB4dBXfSodwuaK
	7D/ZVeMWaUD8wC6RsZuQMWg==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186924585a.0.1788957788893;
        Wed, 09 Sep 2026 05:43:08 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186912585a.0.1788957787673;
        Wed, 09 Sep 2026 05:43:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9679sm6609508a12.20.2026.09.09.05.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:43:06 -0700 (PDT)
Message-ID: <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:43:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX4urelNE6xuhy
 LBCFWIVuCu7HeXXzOILOy+9khIXfnplxwnuXIkFFosgQTrX/KAEbVZTD6G8v5QS6OUQmQB47L2e
 Vx9vttwzWnLiSSyLsA2IXJyJPXShfUY=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa1545e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=cUeywdAnc2UWe6fb0OEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SgPstm5BsNf4mM18ATWhjnm-bgM_6J1-
X-Proofpoint-GUID: SgPstm5BsNf4mM18ATWhjnm-bgM_6J1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX3OGSCEcLsNV+
 3y+A2vdr84TwMJ6fboVYR966u+/Y7G/hzHJ2rM6XKzWUdD2o6fz9XadDxnoyFg5lTf6zdEWlofp
 aQYzvbEEmm4qGGIw16a1xGhAXWR/WIU/gNt8Q6IgH1KPtDRErge34GXCUU6za/xrrliml/gKKZ+
 VoAPonrOMsRmwmjJTLTlLSBlp2KmAa4HvBzyGxwGbK8J30BRMxUux/HQG5xzAk+vG0++SW8jOKH
 1LcycVliTY4m5keP2jCE3Sp4QDZTkRiM2xYzmt/NFXb13YYslO+ERBeF9boXe+f/YkQdgku6BMh
 M6T/4HsCYrMFMidMSJ/wtv9O9GtIet/4gYTTAqPOLrifqS5EfCcqgk1eupwasmxQERmFR1em6hY
 eNf7uWiWOVwl9fBYdS2kvRnZdvI6wtV9WAxcCHUJzc2pf5irgav8TL++HEiq/+QsSzugHQVlv8v
 6CqlmCicRVBi3e1ln3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


[...]

> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
> +		};

This port should be defined in the SoC DTSI

[...]


> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov08x40";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */

include/dt-bindings/media/video-interface-devices.h
MEDIA_ORIENTATION_FRONT

[...]

> +&csiphy4 {
> +	vdda-0p9-supply = <&vreg_l2c_0p8>;
> +	vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			csiphy4_in_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&ov08x40_out_ep>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			csiphy4_out_ep: endpoint {
> +				remote-endpoint = <&camss_csiphy4_inep>;
> +			};
> +		};

Likewise, define in SoC DTSI and only override necessary properties

Konrad

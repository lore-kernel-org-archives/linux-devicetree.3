Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDC38F64A
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982591; cv=none; b=S4EtQsV+3Acxz8l35+zqPNHWvoxJcrNwzeKYQEZBowHeo3Nj2Uj4B5DyUKrJDoR0e95MpAcs9apEH1qZWTfqAtnnzn7ayxlj1IzqXi0jktSIxtCPdj/QJaABQx5eZuJwgz6VjBH3OI52Dn86DBQ9VSLz9YHr4vxkFEnySR+SH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982591; c=relaxed/simple;
	bh=K96N7nNaFMzJ8cI33xDYcKxKaHytZImcOsyPx65LEsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh72REVGJXy472vS6wGdTbDV1vRr4S8hAWtZQlHTK71p5krSUDxAtgTlHGKGcM4+yHsPHTZf3EFS9T/gzjnO5JKLnPwjIOkOIfZjZyPx/21ZLL5sciJiPRwrQ/ujdL1dvqdfeBi6iAgq3RR4LVtlPw8a8bc2vhh9BuyGnkdBJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQqFPHPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkGNi9ZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQqFPHPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkGNi9ZS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdWON3240035
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SMdOIbthHq2n0ySGFj2ZWAir
	YYbzuHu09slMTEz98co=; b=PQqFPHPAs/aoYc+1EjsyFI0OiPt7+RbOM+zC8fiB
	VxaGbKJaQ0n2L5ipfejg+9HKBT8T/p6HKKg5lPWumgASjZOSh4W9PtTjqm/znVky
	dcHjcQ/1fDQiJoE51KfCSFHeMSSXwXVBHuDcawPXshbXy+P0WWlRs3TQu309G3WB
	SnTNbhL4lwWvMPm4WzayhMAe1KiU+uBvQwtrL/XrG05T7Ct5DFing3zwoG9VPXpW
	V5YxCMuo9AZ6ciIr+4slDJG1KlS87OIm4/3/Ex8lWABbDffxgG3YUBHjw+3Q+VNV
	JBvgPddCi0fLGMNOh1TVLzeKpbKEvaTDQuRi+zCIcin7HQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ytmnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:43:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso69117601cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982588; x=1775587388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SMdOIbthHq2n0ySGFj2ZWAirYYbzuHu09slMTEz98co=;
        b=NkGNi9ZSFT05stQe3Q24Uoho1df1oCSG9oeU47vVE/QdkiQ5GIwqHvQYGUIHO7Cxho
         VwlNbdQnSVKKLFPZ84QwFF6Z55KNmzzL+4PalOnNnYVjVX40GAgsCSFY/QMt+xmcOswc
         EnLm/qDD2ierfr3WpsN43BFTNNNYtjq0/143xCztNd714bj82Qe0Cl2BhUde5tvbrlwD
         GrBKNR11wrzidFf/B/gcfEbDLj0yEPJcXhC2XgjMSPQBl66+ZVNXQ9ns1AhQhtx1PqtO
         WVg1c89oLdqNUU792twaGrkZqMV8JjSYSDYGus6S12SNUtzaUoynetNwkcN3qHbWqmIK
         ZddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982588; x=1775587388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMdOIbthHq2n0ySGFj2ZWAirYYbzuHu09slMTEz98co=;
        b=L9rdbFnrqnDHss+K39Zadxht0zPQOmh/1M0eCLRvc2SbJ3WiamJ+qzhhEUa34GFmcJ
         6/+dBZj6VWXc52yOHpl6sUjm/pUZiwcvYmqhzscg5/ApK/DoCaKxvSVznCck5ts40M8B
         puun+yoXBsAv+mN3KCobbKRAatmzTCV4Wv1S0WJf8hcwhx1Pr6Dzxh2Aq8G8Pxq/csgv
         rVl4qdUD/RBLjmaSzKx2Nnntsm0KYiIK5gD2XVsWsO2+//yvhdIuoVXYT/8Cs3RPTKGl
         M/d9a9zUaDvgpXh5ilDBAVuvlr92xJVax8/cWOT8CmX5nz5z3p7VP9Db5WEqL5N0nOkf
         55NA==
X-Forwarded-Encrypted: i=1; AJvYcCVx2KlpTpSr6zpkCtehwvC73KRwFAHLrOiPJh4ZfoH1Llywh3NcVubz6N5CUe6gJSqwmFJrbX0YDgRb@vger.kernel.org
X-Gm-Message-State: AOJu0YyzW14GvfnJnBwtVHkeSEI2ZBicdfjUveJhmytw2dYpB7gGTOhY
	Yi0/O0xxTRqAV6AAABrFVzcfrE1Dy2bAHBfhyfGkacG11l5fb3biDgEugvgmHlAPx9oOZcIB11H
	YyfWjWd1vyEKKQldtdRxn9WWcf7juT3nrYLNDsLbtDFeECCifwqrnxrBVCVpjL4Y/S9TjTNfY
X-Gm-Gg: ATEYQzwmxRq2yZA7/BjNg9JycO4Ro7kpO060IBtrY3JHJVIJIjxGQl/dJFqbC5lkjYm
	Qxf+ww1eANjolt96c6sg7IK259MKmRB1k2q3CGmesz3xVaXXkSdn0g2w98r2k021b8dtdDQqDXC
	7Iq9LOdiYfTIR4svw+sV16f8MMao8QGngwjLd0TglYZDIUPp4DyNF54cs65NAKtN/lJAwZViSaE
	jx1y3aNJIkCLb/kQpBsWLnwwDTX2Q5kHnwvcip9oCUtjRIPufkLDqX6XJyf7Q2HeQclh97+BxAR
	lgHatAfaL2r6E694jemH3q+vPBGTL2OqBH4kGJk4PkO6fEL3arKJYvuWAUc7fDyzbSmNUvlzQvK
	WBACRLHm9vYAV3aYqa3b1XmWmiVcmXCJFek2aqi692vfc1xP5Hx3ptO6LQv/Yu1vkZBhf6qPN1J
	6S1cxm4bgClhCouL3TNTtbeeXC+FbF69K2zUE=
X-Received: by 2002:a05:622a:2e8b:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50d3bb9d73bmr7995281cf.12.1774982587877;
        Tue, 31 Mar 2026 11:43:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2e8b:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50d3bb9d73bmr7994861cf.12.1774982587355;
        Tue, 31 Mar 2026 11:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f48sm23457211fa.6.2026.03.31.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:43:06 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add MAX17048 fuel
 gauge
Message-ID: <t6dgamqbvqp373hfzkdjxi3blgyvnqiwvtzoepwylmakevpgni@qhdl4lf7j2wl>
References: <20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com>
X-Proofpoint-GUID: e9t5a7qM9cnJMHZMpEYIlrckjiBmY6Fv
X-Proofpoint-ORIG-GUID: e9t5a7qM9cnJMHZMpEYIlrckjiBmY6Fv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfX0keCgd+y+PCq
 Xu+DFzqFRr8RfKNI6QClS0b78FHrvziOYQOURpTEXWLukwkhdjOEV4F+hcM5KXCpnsaJo/eCqZ3
 UIt/99NDyM7SFY99GFGomkgHoi/+DowCsSbkCjPvjje5/wrfuWaABcJD5GqViKgv+vutUHV7NRk
 0BnP2dxXXOuU8lk4b9tU3d4nPxmg+2SNm7XHQ8xousWagMXX3MlWWwFWTrzkWl5kaG3EGEkLPty
 rhlxgeXYdtXmvNGxSifR9Yyk8BU+Lxx/aQcAfrk6CgjuCzABbvQy/QlulQRChCjVLiBrhw9QGLu
 Vt6u6sjzVzNHhomz+u1T8ogiV+azhjrcLFkP2Pulf+jHDxf2Z0Wf1JSpWFhd83WHDNDy/EDEV9y
 sSxC0gqMeY9oCNl9zHVL07rSoiQfrKTPssl9gIMIUvzMkgA86ZCdAs7XaZ/+vagftpgzYCQ//Zq
 Stg6nxzoGg9bZftpN1g==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc15bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=ahZNpFjp22rXwMqW-dcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310179

On Tue, Mar 31, 2026 at 11:00:04AM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add MAX17048 fuel gauge support.
> 
> Tested by comparing battery capacity readings between upstream (mainline
> max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
> across a full discharge cycle. Upstream reads ~3% lower throughout. Both
> track the discharge curve correctly:
> 
>   Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
>   Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3
> 
> +
> +	/* Fuel gauge (MAX17048) on i2c-gpio 24/25. Alert on GPIO 67. */
> +	i2c-fuelgauge {
> +		compatible = "i2c-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		sda-gpios = <&tlmm 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

These pins seems to match GSBI5. Is there a reason for using bit-banged
I2C instead of defining and enabling GSBI-based I2C?

> +		pinctrl-0 = <&fuelgauge_i2c_pins>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +		i2c-gpio,delay-us = <2>;
> +
> +		fuel-gauge@36 {
> +			compatible = "maxim,max17048";
> +			reg = <0x36>;
> +			maxim,double-soc;
> +			maxim,rcomp = /bits/ 8 <0x62>;
> +			maxim,alert-low-soc-level = <2>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
> +			pinctrl-0 = <&fuelgauge_alert_pin>;
> +			pinctrl-names = "default";
> +			wakeup-source;
> +		};
> +	};
>  };
>  
>  &gsbi2 {
> @@ -281,6 +307,13 @@ touchscreen: touchscreen-int-state {
>  		drive-strength = <2>;
>  	};
>  
> +	fuelgauge_i2c_pins: fuelgauge-i2c-state {
> +		pins = "gpio24", "gpio25";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	nfc_default: nfc-default-state {
>  		irq-pins {
>  			pins = "gpio106";
> @@ -325,6 +358,13 @@ touchkey_irq_pin: touchkey-irq-state {
>  		drive-strength = <2>;
>  		bias-disable;
>  	};
> +
> +	fuelgauge_alert_pin: fuelgauge-alert-state {

I don't see the previous node in upstream DT. Please make sure that you
list all dependencies.

> +		pins = "gpio67";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>  };
>  
>  &pm8921 {
> 
> ---
> base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
> change-id: 20260331-expressatt_fuel_guage-465dfb3f87ab
> prerequisite-message-id: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
> prerequisite-patch-id: ab8b8d87fd2d518c4c5b5dace3f22238d1abbe49
> prerequisite-patch-id: 47e32e653e520a27770bb05d99135694b0128ba0
> prerequisite-patch-id: 7ef7df61e7ef6476a35811d765f522f793d9ecc7
> 
> Best regards,
> -- 
> Rudraksha Gupta <guptarud@gmail.com>
> 
> 

-- 
With best wishes
Dmitry

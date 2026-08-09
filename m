Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB9203710
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786285907; cv=none; b=M7eMIY9Wy+/eBIzBnrmg+KQeKb0nEbAcr41ebW/k0BiqtLaOVQHcOdHNWnaMffMz3Sb+IMeP6Ah/zhjC9UE/se1dmSBNZ+Kzhap5R3CDJKG7sQKX1zsGlaRQ37aLwKFiV3Do2Rc/HCPgABU871rHSLqIZMcDsZNMhXRRkfPv5vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786285907; c=relaxed/simple;
	bh=qAo81IIqg014NsiVspRsJx2UFtW5L+QAc1xwS2rd804=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y/+STltb1/9PM05GZchak/gkHTfWByQQUUcduOgdCuDE171OQJe6OLzXfo9g3NQ7xGOUOvu6t4SFMczjcj3BaDm7JKg8UBP6yWZ7MuB8Q1gwYFuBK4r9mn6L57KHbgE3JetxxXXGbC5A0eVZKQtfwP6AqXNXkzMhyiCVl2okkQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2MfbZVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2MfbZVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180161F000E9;
	Sun,  9 Aug 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786285906;
	bh=QKr9qPAN1wMC3mUxkCDpRFgRFYW4rHt0s+XnOH8ojtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N2MfbZVo7ZmnMIOkOTIPzRsk2UstwRd04X19z9t6itbM0yn4fCye62+CldMCBouoT
	 56cuILtvIG8hpYHqyknZvt9dq49IVEDX2izUN0KOaKWDIGeZIpGe45wpuYh1gEU1td
	 86WY2plgiVkGr4p5vXrEKivozZMhkDix2lUgOLy+BxQ32nsEK/vbnNhBuymjbtFZbS
	 D9CCqC0h/NESsr5+0orESCyEV4yhz2n9yiz8uixW7LeuOOIW07zUpBr47K3VUYnaSx
	 f4lh4g1L851qCuRC5xRcYYRmWknyTNxefa1sSwy+x0V8XUQVxt2OfcxosYPmgg1b2y
	 nhBUvr9/JFqug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-shikra_adc_support-v5-3-bf6882d18bad@oss.qualcomm.com>
References: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
 <20260809-shikra_adc_support-v5-3-bf6882d18bad@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 14:31:45 +0000
Message-Id: <20260809143146.180161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added thermal zones lack the `polling-delay` property, m=
eaning the thermal framework will never autonomously read these polled sens=
ors, rendering the trip points completely inactive.
--

--- Patch [3]: [PATCH v5 3/4] arm64: dts: qcom: Add PMIC thermal support fo=
r Shikra CQ2390M SoM platform ---
commit e095016b4e3d3900333619bed0a4f6e72a9a0497
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform

This commit adds ADC channels for pa, quiet, and msm thermistors along with
their respective ADC thermal bridge nodes. It also creates thermal zones for
PMIC thermal mitigation on the Shikra CQ2390M SoM platform.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index 8ac42ff625a0e..9caff1a70d13d 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
[ ... ]
> @@ -32,6 +33,68 @@ key-volume-up {
>  		};
>  	};
> =20
> +	msm_therm_bridge: msm-therm-bridge {
> +		compatible =3D "generic-adc-thermal";
> +		io-channels =3D <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +		#thermal-sensor-cells =3D <0>;
> +	};
> +
[ ... ]
> +	thermal-zones {
> +		sys-1-thermal {
> +			polling-delay-passive =3D <2000>;
> +			thermal-sensors =3D <&pa_therm_bridge>;

[Severity: High]
Will this thermal zone ever be autonomously evaluated by the thermal core?

The zone defines polling-delay-passive but omits the standard polling-delay
property, which defaults to 0 (disabling non-passive polling). Because this
zone only defines a "hot" trip point and lacks any "passive" trip points,
passive cooling mitigation is never engaged.

Since the generic-adc-thermal bridges rely on polling and lack hardware
interrupts, omitting polling-delay means the thermal core might never
schedule its poll queue. Does this prevent PMIC thermal mitigation from
triggering during an overheating event?

This also applies to sys-2-thermal and sys-3-thermal below.

> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <80000>;
> +					hysteresis =3D <2000>;
> +					type =3D "hot";
> +				};
> +			};
> +		};
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-shikra_adc=
_support-v5-0-bf6882d18bad@oss.qualcomm.com?part=3D3

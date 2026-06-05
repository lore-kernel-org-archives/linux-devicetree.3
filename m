Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64521EB1AA
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666368; cv=none; b=tDAcLiI0Yzp9mKGQ0pP/dF2MaJ2cqS/Wptv9hFnQlUBUEPxxBzvneEx41mC0T1naBIORtMC7D8OWenljczMJi5NaBYIJtHea5ceOQ7GN2f10TT1aq8jq/8UNX2VHhLB9Wzs4Yuaup1PA1QvJhiCDFiYfkV8JtGO0R7uPou7SiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666368; c=relaxed/simple;
	bh=2WFbGRb+z0bzRXBqVgBhabAcFQmkDaUDT2fZIK5N0Zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=trEvylkqWna4058l+GG6xo5SQURT7S9bJlWJIHoFWn8bCQ3peZcOjy7Dyx4gByqI9fbtSvFct2PzlXz5ZjQTaPFu8hn2+dWaPngZsBS3HKzm+yCQJUZa4GcabvAh9bo5E70YKInGSzTpLzJLQbDV+rYQtpy19fWbHbUH5fbcDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdkW7krm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdkW7krm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3661F00893;
	Fri,  5 Jun 2026 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666366;
	bh=BkwYseeHuFbK9tm0zf/vf4QaKGWXDW8nHlYTkDCIjtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EdkW7krmFIvLxLWVurzjrcbyTdrmErZPoPsmb2DabNSgeZNGH7R1nJTNSXpsGHfqp
	 Ml6mvdD68osxtzNjMteidEiQpHH6Zz3Y63L7h9uiRkTsUZNNOP4GrC0DUN9DEy7iEB
	 w+asHVvgycixXAKy0fWFULzAU2dIgc5x2CUujFbnNEXnpVGl2nlnb+LLYwEZoSob71
	 mtHRc3El4YrCk92z0uaRNMSQZgKwezBcBbrOZe7KjMqKhF6FFdv2HR4E3WJMQJm1KZ
	 m7CXPap/mvXn+pVg4jEfEx1PkiH4fYaVwxsXyEun84WhuE2gguFAtrjCJaXVqaNlA/
	 BVzS0GCVz2/Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Wales via B4 Relay" <devnull+daviewales.disroot.org@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605-device-motorola-titan-mainline-v4-2-08a7be31f05c@disroot.org>
References: <20260605-device-motorola-titan-mainline-v4-2-08a7be31f05c@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:32:45 +0000
Message-Id: <20260605133245.BD3661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The fixed regulator `vddio_disp_vreg` is missing its `vin-supply` =
link to `pm8226_l8`, which will cause the display VDDIO to be unpowered aft=
er boot.
--

commit 70499333aacadd0ef2c646a655f7350a4c0e3f57
Author: David Wales <daviewales@disroot.org>
ARM: dts: qcom: Support Motorola Moto G2 (2014)

This commit adds the initial device tree for the Motorola Moto G2 (2014)
smartphone based on the Qualcomm MSM8226 SoC. It adds support for buttons,
eMMC, a Hall Effect Sensor, simple framebuffer display, and a vibrator.

Link: https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-=
14.1/Documentation/devicetree/bindings/misc/hob_ram.txt

> diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts b/arch/arm=
/boot/dts/qcom/msm8226-motorola-titan.dts
> new file mode 100644
> index 0000000000000..1609fb21c5448
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts

[ ... ]

> +	vddio_disp_vreg: regulator-vddio-disp {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vddio_disp";
> +
> +		gpio =3D <&tlmm 10 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us =3D <300>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};

[Severity: High]
Will this regulator fail to supply power if its upstream source is turned
off?

This fixed regulator controls the display VDDIO power via a GPIO, but it
seems to be missing its vin-supply link to pm8226_l8. Without the
vin-supply property, the regulator core is unaware of the parent-child
dependency, so enabling vddio_disp_vreg won't automatically enable
pm8226_l8.

[ ... ]

> +		pm8226_l8: l8 {
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +		};

[Severity: High]
Will this regulator get disabled by the regulator core during late init?

Because pm8226_l8 is not referenced by vddio_disp_vreg or any other
consumer, and it is not marked regulator-always-on, it appears it will be
disabled as an unused regulator. When this happens, will power to the
display be cut, causing the screen to go blank?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-device-mot=
orola-titan-mainline-v4-0-08a7be31f05c@disroot.org?part=3D2

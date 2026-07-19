Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D568B35979
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481357; cv=none; b=a9Zqw0V0SWUw0/L3cgtfES/dbMZHgdrFnLgAwcYPlYYN966NMpIK0Id4iQYe3tDLdRJIk6RySdo+Z4bRh6Zmnfg4HJ/Wp7mFRZx5aDX+GHzoSszNaNe3Mo96DQOIlv/9QdB3AbfDqObzrqfaxToAMASFThsaYjkAsP7tK+fh21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481357; c=relaxed/simple;
	bh=vAMcuX2jHbp2qWPDyOjwrYHiyAZGD6WLtsbLW3VAalU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dIW8h3TC+hl6va+G4fsCvEkwYHoIvVWHBkXfYW/JJSkz6II779cFe7/gDkVYDMEImVc4GPd875YYWuhVbOmnD2g3ueu8Zhd2fJSRbpRcdJSCJnZrqYVI7Ryn/3i1hAVPhne6tlt7Knhp1rXE4Tcrtbgz8xFwgFvzZzniM+gwRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKKcojED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKKcojED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C931F000E9;
	Sun, 19 Jul 2026 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481355;
	bh=M2H8K3sD51/OkhTzyA7+jvSVvXHtgE95y0572KfBZLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AKKcojEDD9uPBIfyE4yPdEqhChwYYtgkvHb7+qwSViFlJMew2ikl2AsyqwFhsN6qK
	 UFdHNr49ty8bHRn2FKRoQhBIEuSY8lJ8PrL+Cstysf24dyynH9aUB1RDh2M0pXEQ5g
	 1xxGpQqlTVh6/6IJzEFuFrn+77QUhjMC8N8yvqjla5+2lq4jxqzGCx8wEn0dE9U8e4
	 SqqUJB6NNX0aGCtdup3ys2zGhmsyEv0+qsmWBR8TFtLqWXq0ADc/ZZy1iEC92NYkF9
	 2LALCwQoD1ASJTJlsux2D/SAlwI4Y7u+I6hnSD3fMLj7ssE9qlXXSfVshRQkoCzzn9
	 lGJiiCgcpn/Tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260719-pixel3-camera-v4-1-48cab1236852@ixit.cz>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
 <20260719-pixel3-camera-v4-1-48cab1236852@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:15:54 +0000
Message-Id: <20260719171555.25C931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware Pin Configuration Error overriding `cci0_sleep` instead o=
f `cci1_sleep`, causing power drainage.
- [High] Placing the `MCLK2` pinctrl configuration in the `&camss` node cre=
ates a severe probe ordering race condition.
- [Medium] Mismatch between the commit message asserting both sensors share=
 CSIPHY1 and the Device Tree mapping them to separate PHYs.
- [Medium] The `vreg_l22a_3p3` regulator is defined with a voltage of 2.864=
V instead of 3.3V and causes a continuous power leak.
- [Low] Addition of undocumented and unsupported `vdda-csiX-supply` propert=
ies in the CAMSS node.
--

--- Patch [1]: [PATCH v4 1/2] arm64: dts: qcom: sdm845-google: Add dual fro=
nt IMX355 cameras ---
commit 24802f71e3152de09fabf33fc17c82719cd2b67b
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras

This commit adds device tree nodes for the Pixel 3's dual front-facing Sony
IMX355 sensors. It describes the camera nodes, MCLK2 clock source, CCI I2C1
bus connections, and associated regulators.

> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
>=20
> Both sensors are connected via CSIPHY1 and controlled over CCI I2C1,

[Severity: Medium]
Is this commit message description accurate?

The device tree maps the endpoints to port@1 (CSIPHY1) and port@2 (CSIPHY2).
Because both sensors request 4 data lanes (data-lanes =3D <1 2 3 4>), is it
possible for them to concurrently share a single 4-lane CSIPHY without a
hardware multiplexer?

Could the commit message be updated to reflect the actual hardware
connectivity shown in the device tree?

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-google-common.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi

[ ... ]

> @@ -288,6 +324,12 @@ vreg_l21a_2p95: ldo21 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
> =20
> +		vreg_l22a_3p3: ldo22 {
> +			regulator-min-microvolt =3D <2864000>;
> +			regulator-max-microvolt =3D <2864000>;
> +			regulator-boot-on;
> +		};
> +

[Severity: Medium]
Does this regulator configuration inadvertently cause a continuous power le=
ak?

The label indicates 3.3V, but the voltage is constrained to 2.864V. Also,
this regulator does not appear to be used by any device node in the device
tree, yet it is marked with regulator-boot-on. Should this unused, boot-on
regulator be removed to prevent battery drain?

[ ... ]

> +&camss {
> +	vdda-phy-supply =3D <&vreg_l1a_0p875>;
> +	vdda-pll-supply =3D <&vreg_l26a_1p2>;
> +
> +	vdda-csi0-supply =3D <&vdda_mipi_csi0_0p9>;
> +	vdda-csi1-supply =3D <&vdda_mipi_csi1_0p9>;
> +	vdda-csi2-supply =3D <&vdda_mipi_csi2_0p9>;

[Severity: Low]
Will adding these properties cause dtbs_check validation errors?

The upstream qcom,sdm845-camss.yaml devicetree binding explicitly specifies
additionalProperties: false and only supports vdda-phy-supply and
vdda-pll-supply. Are these undocumented vdda-csiX-supply properties ignored
by the Linux camss driver?

> +
> +	/*
> +	 * MCLK2 (GPIO15) is shared between both front camera sensors.
> +	 * The clock is generated by CAMSS, therefore the pin is
> +	 * configured here rather than in individual sensor nodes.
> +	 */
> +	pinctrl-0 =3D <&cam_mclk2_default>;
> +	pinctrl-names =3D "default";
> +

[Severity: High]
Does placing the MCLK2 pinctrl configuration in the &camss node create a
probe ordering race condition?

The comment states the clock is generated by CAMSS, but the clock is actual=
ly
generated by camcc. Since the sensors rely on camcc and the I2C controller,
they may probe before the camss node is initialized.

If the sensors attempt an initial I2C read before camss probes, the MCLK2
pinmux will not be applied to GPIO15, causing the clock signal to be missing
and the probe to intermittently fail. Should this pinctrl be managed
elsewhere to guarantee availability during sensor probe?

[ ... ]

> +&cci0_sleep {
> +	/* bus has external pull-up, don't pull down */
> +	bias-disable;
> +};
> +

[Severity: High]
Is this bias-disable override applied to the correct I2C bus?

The front cameras are connected to the cci_i2c1 bus. However, this override
is applied to the &cci0_sleep pinctrl node (which controls cci_i2c0 pins),
instead of the required &cci1_sleep node (which controls cci_i2c1 pins).

Will this leave the cci_i2c1 bus with its default bias-pull-down in sleep
mode, drawing current through the external pull-up and draining the battery?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-pixel3-cam=
era-v4-0-48cab1236852@ixit.cz?part=3D1

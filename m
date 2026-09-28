Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C34DDB31
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607846; cv=none; b=M3NIRLHRTcqic18ygrCN+6JU+r7JSksVlMwmqSjTWmEAfWAPCzy02fWJjPycDfoRS9QD1OweTEG98YPTOPItBJuJH3kEH44vQp/NgSY719c6ywNZ0cKSIdTL9kNOhe3dxfdCIGUASv1iEtZrSHck1OX29LpR9s7jVLJS+3PNF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607846; c=relaxed/simple;
	bh=H5xVl1zv+Hq8NAOamtWle2kp59nAlEpmbzq+i7rBvJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ACil627XtPiguYiK9IotoR172V/frD9QQj0qvtqMhdyjTe+M1eufWaLINu1ETosIPyebbS53ZvvdCmiO5ZNOhdJ8tASC5tl/fzVjvLves0vVweG0LIrEXDJu8KJ+IwSK59NZNVSSVhow9B4YL1Tx5Ve6UYAdiCKhnno5y5B6Ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5OQs38z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5OQs38z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18611F000FF;
	Mon, 28 Sep 2026 15:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607845;
	bh=lrzQkE48xpUQP4AwRKYmq/e/gOJlTx340MjbwoqjWgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L5OQs38zXh11Ahk4WK8rhddrVp3mstwKzsNZUAR40oQseyzXZRVriEygWH3Ur4muE
	 dIIGgqxekElc2v/aJcRMH5O/z3WRsmHtaQ1m1IktgXBIvMtEA27ohJ13sRkSXqEEcX
	 beTrPQaoztKOQueiwXQWPv2Mjd+RKS6MzjXZRVccvnd7PorarF79T/z2LLwHm/dwg8
	 dnkoZQOuk7kb7syMyKyXvDHyVr3Mu0pZuf+20LBsXZIDVSayp63xPIv4Opovh9/MK2
	 HLnxkhuOyqd7wnLEnHLhw6h4sirUZ1JKKIhHM9tVoOw/yOD3iQuu5DrjUery8urNkK
	 OHuhAB9TBGx/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928145122.1337186-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260928145122.1337186-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 15:04:04 +0000
Message-Id: <20260928150404.D18611F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: Reset GPIO conflict between ptn3222_1 and ptn3222_cam
- [Medium] dts: Panel power sequencing issue due to premature backlight ena=
ble
--

commit c99537659e637d229456f818bb7c8fc0b3d7fcf3
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
   =20
Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
design used by mahua-crd.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd=
.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> new file mode 100644
> index 0000000000000..26d6d8285e040
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -0,0 +1,1272 @@
[ ... ]
> +	ptn3222_1: redriver@4b {
> +		compatible =3D "nxp,ptn3222";
> +		reg =3D <0x4b>;
> +
> +		reset-gpios =3D <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply =3D <&vreg_l8b_e0_3p3>;
> +		vdd1v8-supply =3D <&vreg_l15b_e0_1p8>;
> +
> +		#phy-cells =3D <0>;
> +	};
> +
> +	ptn3222_cam: redriver@47 {
> +		compatible =3D "nxp,ptn3222";
> +		reg =3D <0x47>;
> +
> +		reset-gpios =3D <&tlmm 184 GPIO_ACTIVE_LOW>;

[Severity: High]
Could this GPIO assignment conflict with ptn3222_1 above?

The ptn3222 driver requests the reset GPIO exclusively during probe via
devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH). Because the GPIO
subsystem prevents sharing an exclusive GPIO by default, assigning the same
GPIO to both redrivers could cause one of them to deterministically fail to
probe with a -EBUSY error.

> +
> +		vdd3v3-supply =3D <&vreg_l8b_e0_3p3>;
> +		vdd1v8-supply =3D <&vreg_l15b_e0_1p8>;
> +
> +		#phy-cells =3D <0>;
> +	};
[ ... ]
> +	aux-bus {
> +		panel {
> +			compatible =3D "edp-panel";
> +			enable-gpios =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +			power-supply =3D <&vreg_edp_3p3>;
> +
> +			pinctrl-0 =3D <&edp_bl_en>;
> +			pinctrl-names =3D "default";

[Severity: Medium]
Will this cause visual artifacts during boot or resume?

It appears the backlight enable GPIO (tlmm 18) is passed here as the panel's
logic power enable. The panel-edp driver asserts enable-gpios in
panel_edp_prepare_once() before the eDP link is trained and valid video data
is streaming. Bypassing proper eDP DPCD and backlight sequencing could turn
the backlight on prematurely.

> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint =3D <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928145122.1337=
186-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2

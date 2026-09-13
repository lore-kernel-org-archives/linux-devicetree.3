Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2E33BBAF
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331271; cv=none; b=i7gnYK8loHTJ86RYQrGhxxVuos48phyimOVu15aASm+8f5Vs8ucz8ttUWqkI653bMCa0dPz39cRkfPRF8Qj+77rGb4z5/RvGqi7SNdC9Z1uOVfncVAGjr/YsTxdeSmhjmkQ6jrHgQ8ezDADnM/Dh3RbsMsVM+oc5wXMm0YhrzG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331271; c=relaxed/simple;
	bh=GkckaR4IUumGzODCgzIqZxoxA0Daithiege+8UAzSKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sRoZ/aRU0XfjY3NEi6B454AfdnsR3cY/M2T4Xy+JNaMHxsY/5FZ4in/vfj87EkhVRDXC6qo3RXjLiydeZZMw3NgYFjv4zR4PRn4Es8r1iaLIYBinwfa3bE8G2QR/S4vYUu9xKl4sjhoQpvtE/Q6ZXHuk1QXOwJsptqt8BPE7FTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9myeAzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9myeAzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451271F000FF;
	Sun, 13 Sep 2026 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789331269;
	bh=HYjO40TTJHmr4WU71qfoKNSqdL0KW4ZzobINfyQbEgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9myeAzE4UYgy1WFDDtNh6GcnA+ayf31Q5eGZsxQGrz4lQ6RUrKYUi21R9bJSjbf0
	 HEnXCVdQXWtFSVt3aQN1TuShjBJgFx4VBcF8I7yHr8GlDX74RUH3sNHIuKFQATpS71
	 Q0DnwkfF4yd7VTqhzY5xDEn1D3ywoY0QP2TFSMc+vajAovgmkV0ld8+UTqrgngLvY0
	 oylhpL82fetmu7x/93pUfEwHm+PBThKlQcgk4k72EX6tMIuVEpzfv0QVV15sTD1dLT
	 N6g3GVR3ge4AlrP1R+p4dbBf45JJKjD4l6q9f05QxhDBbmk0u1Qd83LWGHqbpI/6IK
	 zfD9K1DCv25WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 20:27:48 +0000
Message-Id: <20260913202749.451271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing pinctrl configuration for `vreg_misc_3p3` regulator enab=
le GPIO
- [Low] Unused `wcd_default` pinctrl configuration
--

commit d71c12fe04485a49b8c9508f6401f49a6f0252e9
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7

Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
a Snapdragon X2 Elite laptop.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts=
 b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts
> new file mode 100644
> index 0000000000000..be5f12bfe56a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts

[ ... ]

> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_EDP_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&edp_reg_en>;
> +		pinctrl-names =3D "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_misc_3p3: regulator-misc-3p3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_MISC_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

[Severity: Medium]
Should vreg_misc_3p3 include pinctrl-0 =3D <&misc_3p3_reg_en>; and
pinctrl-names =3D "default"; properties?

Since the explicit pinctrl state for this GPIO (misc_3p3_reg_en) is defined
later in the file but never referenced, omitting it here might cause the PM=
IC
GPIO pad to lack the intended configuration (such as drive-push-pull and
power-source).

Could this fail to drive the enable pin correctly and leave the I2C touchpad
and keyboard unpowered?

[ ... ]

> +&tlmm {
> +	gpio-reserved-ranges =3D <4 4>,   /* EC TZ Secure I3C */
> +			       <10 2>,  /* OOB UART */
> +			       <27 1>,  /* TZ trigger  */
> +			       <44 4>,  /* TPM */
> +			       <139 1>; /* TZ trigger */

[ ... ]

> +	tpad_default: tpad-default-state {
> +		pins =3D "gpio3";
> +		function =3D "gpio";
> +		bias-disable;
> +	};
> +
> +	wcd_default: wcd-reset-n-active-state {
> +		pins =3D "gpio191";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-low;
> +	};

[Severity: Low]
Is wcd_default still needed?

This pinctrl configuration is defined but never consumed by any device's
pinctrl-0 property. Since this board uses WSA8845 and DMICs for audio, it
appears a WCD audio codec reset GPIO is not required. Is this a remnant
from a reference design that can be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913201835.2500=
85-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB83BB115
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303834; cv=none; b=sEsjorhPNP/YVIYdoKcpT6WYx0Tj5PjdWPJebk6+yJ++LAwffAppubb6HaQCkVvvC0BF5xcGDkNA8GVreeX5eluWosq2hgVuOenleLp8+jmcd8VWW64ghKbN+aQFXS8CkPsmeGCLQ3ud8YtuMpEGB40mUugWzUnBckPHvucVxxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303834; c=relaxed/simple;
	bh=4Co+r1Pz5IfT90MGlgTPR1Rg70SowxgIxj7viVjXb2U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kcZtnvyOunKL+uIM3lZhhTODlEO4ZQ0N39P6Kx7Uokv3WcLUafUZI0K8wnXXjhGY8th7yC6hwjIF/lnFMHgF7vj90QPngbE0b6wBdC4erJmNlF3PJKYWRnazz+V+n3f2npoqCx0lbRRR8zPwSpCxEqsyUnMZdLdPY1OzKwYpGkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK97F6do; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK97F6do"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D791F000C4;
	Sun, 18 Oct 2026 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792303833;
	bh=KpjrymM8Np6w9KxY2C/UqClTu1rglvPCQV6i7XV43s8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FK97F6do/4z8RN3Jl+/TWVK6WWVj0tLOHULO3rnkeFOm7l4a8rlWo7PtQjvPJC/VS
	 SFHSk2THSPR+h50mtNZoCiyvX1z46DeNF7vy/qLMRJzX8F0rYHaRnCXoxCvR3UFGPl
	 EOI3DObXWLgP7PLLhQ3+7BB3TkB27B3cgf+m8ZzAqaFTmFG241yBlE34kyJ8Q7BYXH
	 6HoJTuMnOWqijRrnitpTX6DBKxrJP5fKsEFMQRXq8gkxTq+kapGR5G0xccfQCizrgn
	 FAylQkAAAHH0flAas4iUbGIMZBidHS6/PY815BgLEjkzstxnoljPmMxMhlo6peMtGb
	 50YGvEo64Mp8A==
Message-ID: <sashiko-outbox-175980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:10:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: apple: duplicate regulator node names merge into sin=
gle node
- [Low] arm64: dts: apple: t8103-j274: duplicate &i2c2 node reference
--

commit 2140e74bb313811cd8c26e108fe31118f7e0ab3f
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes

This commit adds Device Tree nodes for the TI TAS5770L speaker codec on
i2c1, the Cirrus CS42L83 headset jack codec on i2c2, and the top-level
sound node for the M1 Mac mini (J274).

> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/d=
ts/apple/t8103-j274.dts
> index 1212852251e07..150d778565f0c 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,76 @@ &i2c2 {
>  	status =3D "okay";
>  };
> =20
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker: codec@31 {
> +		compatible =3D "ti,tas5770l";
> +		reg =3D <0x31>;
> +		interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		ti,imon-slot-no =3D <0>;
> +		ti,vmon-slot-no =3D <2>;
> +	};
> +};
> +
> +&i2c2 {
> +	status =3D "okay";

[Severity: Low]
Does this duplicate the existing &i2c2 block right above? Since
arch/arm64/boot/dts/apple/t8103-j274.dts already has an &i2c2 block
setting status =3D "okay", could jack_codec be placed inside that existing
block (or the earlier stub removed) to avoid referencing &i2c2 twice in
the same file?

> +
> +	jack_codec: codec@48 {
> +		compatible =3D "cirrus,cs42l83";
> +		reg =3D <0x48>;
> +		interrupts-extended =3D <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Jack";
> +		cirrus,ts-inv =3D <1>;
> +		VA-supply =3D <&jack_va_reg>;
> +		VP-supply =3D <&jack_vp_reg>;
> +		VCP-supply =3D <&jack_vcp_reg>;
> +		VD_FILT-supply =3D <&jack_vd_reg>;
> +		VL-supply =3D <&jack_vl_reg>;
> +	};
> +};

[Severity: Medium]
Do all five regulator supplies in jack_codec end up resolving to a single
merged /regulator node in the compiled DTB?

In arch/arm64/boot/dts/apple/t8103-jxxx.dtsi (included by t8103-j274.dts
after t8103.dtsi), all five fixed regulators under the root node / use the
identical node name regulator:

	jack_va_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-va";
	};

	/* CS42L83 VCP and VCP_FILT */
	jack_vcp_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vcp";
	};

	jack_vl_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vl";
	};

	/* VD_FILT */
	jack_vd_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vd";
	};

	jack_vp_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vp";
	};

When dtc merges the root node / from t8103-jxxx.dtsi into the existing
root node from t8103.dtsi via merge_nodes() in scripts/dtc/livetree.c, the
first regulator child (jack_va_reg) is added to old_node->children, and
each of the remaining four regulator children matches that node name and
merges into it before check_duplicate_node_names() runs.

As a result, four of the five regulators (jack-va, jack-vcp, jack-vl,
jack-vd) are overwritten, leaving a single /regulator node with
regulator-name =3D "jack-vp" and all five labels pointing to the same
phandle. Should the regulator nodes in t8103-jxxx.dtsi be given distinct
node names such as regulator-jack-va, regulator-jack-vcp,
regulator-jack-vl, regulator-jack-vd, and regulator-jack-vp?

[ ... ]

>
> --=20
> 2.51.2
>

 base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f
--=20
2.51.2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-macaudio-v=
3-0-abdff7741dea@gmail.com?part=3D10

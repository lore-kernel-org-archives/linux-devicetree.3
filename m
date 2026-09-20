Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F237DEA1
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881391; cv=none; b=d4xP0cO4ujTc5QuiEOQVBPOwPzzwHvGWxj5AArZ+tODmY+xwpyviM9O40XAecxYuwfPMzU7tvYWUkA6nqE4+f6MmnuWLy+qM/U4tLdzKoQfp1HT+3FKrwcbXL8iT/IFIpN9EKATGt+aXIhUMEHPtWAPgNBRGgUCyKK7/AFef4gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881391; c=relaxed/simple;
	bh=+ENMk9SXyti9gAEw8KjXqpffkQe6xdvBU6ds8MIxMTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MbrBk5BEPeKRJooZe6zUTZ6Ed3vXLmIffmWDie/Tq8xVApL3DDst1j3Ixp1PqYwSg7gae+Z9gWIItYB4SwtBunMhJc+XOfHXpWPZScTPV5bWXH1nYiZxe9oz7HJqVwT5SSdquCAe/jJnhLzrtM//ITZmbYBCZNOcQlCQk9Uwnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+/ILckh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+/ILckh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE54E1F000FF;
	Sun, 20 Sep 2026 05:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881390;
	bh=4RwIz5ytAJZoMbhjy3FvENPFzBGSqxcwbM07Q0u7w9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+/ILckhVmt0UkMGabx9WIivioC9vycZduIV7GW6nh1S5/BZSs8QBG28+6pK/uMZW
	 94bFnHE5IO6maqYd9/5TOntndkc1ztgMPvvqijIyXN0zt1XjgkkQkCYk0JHORArkJJ
	 FHmdcDufWRBKTb1dRJ3iNe2CYD3F6vXHWscMhZb5S5wx+2LMfdlHOu1IObriVGFhWR
	 4CZ8OKMngaZgYgk+fXe7YIv50uXSx2tgAfm2FAMb/tSuAovm1dEvZsiUS77+AaQcmT
	 0Bv394ffa+F0xupSmAK0yRa7Lowr7YHyWtIPKbfq39ytKlDFPBHLzOwSFMnPwyC5Tk
	 WEKWblouuc3ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:16:29 +0000
Message-Id: <20260920051629.CE54E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: apple: macaudio: J457 silently falls back to generic configu=
ration
- [Low] dt-bindings: apple,macaudio: missing reg and address-cells in DT
- [Low] dt-bindings: cirrus,cs42l42: missing required power supply properti=
es
--

commit 5cc5dec336bb9d8d002a9d3bcf32f9e5d5e39879
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j45x: Add headset jack nodes

This commit adds headset jack nodes to the M1 iMacs (t8103-j456 and
t8103-j457). It wires up the TI TAS2770 and Cirrus CS42L42 components
and advertises them via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/d=
ts/apple/t8103-j456.dts
> index 090c97bb781b3..41ec1398f981b 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
[ ... ]
> +&i2c1 {
> +	status =3D "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible =3D "cirrus,cs42l83";
> +		reg =3D <0x48>;
> +		interrupts-extended =3D <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Jack";

[Severity: Low]
Does this codec node miss required power supply properties? The=20
cirrus,cs42l42.yaml schema requires VP-supply, VCP-supply, VD_FILT-supply,
VL-supply, and VA-supply. Furthermore, #sound-dai-cells and sound-name-pref=
ix
do not appear to be declared in the schema, which causes an "additional
properties are not allowed" failure during dtbs_check.

> +		cirrus,ts-inv =3D <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j456-macaudio", "apple,macaudio";
> +		model =3D "iMac J456";
> +
> +		dai-link@1 {

[Severity: Low]
This dai-link node defines a unit address (@1) but lacks a corresponding
reg property. Would it be possible to add the reg property here, and also
include #address-cells and #size-cells in the parent sound node so the reg
property can be parsed correctly? Without these, the device tree compiler
will throw unit_address_vs_reg warnings.

[ ... ]
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/d=
ts/apple/t8103-j457.dts
> index ebddde75455c6..aa2a08cb22cb4 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
[ ... ]
> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j457-macaudio", "apple,macaudio";

[Severity: High]
The macaudio driver expects J457 to use "apple,j456-macaudio" as a DT fallb=
ack
and explicitly omits J457 from its macaudio_snd_device_id match table. Since
the "apple,j456-macaudio" compatible string is correctly omitted here to
satisfy the schema, won't of_match_device() silently match the generic
"apple,macaudio" instead?=20

If so, this would assign the generic fallback configuration (AMP_NONE,
SPKR_NONE) to J457, which might severely misconfigure its amplifier and
speaker topology.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D20

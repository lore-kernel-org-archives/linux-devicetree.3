Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A330BF6D
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881554; cv=none; b=hrEIED1Qh+o1bbk3GDSBdIYomMP5KTzEj0CscsCExhfdZOUpwRZq7ZiXreoyMVQ20ySEzPxm7744VfdfD1DYXWtjHOqizv5ckIi2TrA8xH1FGiYP1mI57DGkOiJBZFTuEJsCX5fuwsNmsFd/7Cu7VQAW/pRxppZztDqUX35Z6yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881554; c=relaxed/simple;
	bh=IrqYVxFfqp1TBL3R6FGN7c9/FcSBpD1Sd4a90dAVHIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gr2nsmOmJwPTtxE2pce5qdMkB1bp+EnKuh97k+xxS2fDYxbmKprwcPpVnw4A4DhqETKf8T0oB6RCUxM9KxsDSLneAZ1tMd26cPk+S1dlzgopTKuvOes9YwUV5Jd6fC5rTQQQoy9B7Vxj1NWUCs9nFdQy6wHDnb4pqTQbECor3Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai6n73Ra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai6n73Ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A141F000FF;
	Sun, 20 Sep 2026 05:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881553;
	bh=xtThD1LM95TGNOkMLUis3XpJVn6LxY9PBewl/hWmdM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ai6n73RalMMWhA0nJwpOZCWQAC43j1x+ysZXwYEvlU7wbPdb58dC4GvohZJTG94B6
	 iAs3GPh1pPvDyDmhEyZIXulLINNIrVykSKNf4dsMKOsqin5FqiC15dfOXeWp4Zd+gU
	 GF3VbXlwZIGHL8F7juvZOqzgzZvqhBpZcteSLGoGTyQLq1kfJrMttGXHNtDuiZiYFS
	 SGmLNpoA9tD8ymRcAsTBrbIwx6F5HDgXrlwEDFZXtdHTWxWiz6mKFlBzHD5KDgTAtm
	 p/9lSJHVKi/UPxXbE9yqivSFKZWmeAhtrcDqErSa6qY76HGttb7EpWOMA0CyfrZF40
	 ikNVg/OYcC8Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/28] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-macaudio-v1-19-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-19-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:19:12 +0000
Message-Id: <20260920051913.19A141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] dt-bindings: apple: t8103-j293: ALSA probe failure due to shared s=
hutdown GPIO
- [Low] dt-bindings: apple: t8103-j293: Missing required regulator supplies=
 for cs42l83
- [Low] dt-bindings: apple: t8103-j293: Unit address used without reg prope=
rty
- [Low] dt-bindings: apple: t8103-j293: Redundant duplicate &i2c2 node over=
ride
--

commit beea98820cabe339ebc83e4b7bba334d2303a499
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes

This commit adds device tree nodes for the Apple-specific variants of the TI
TAS2770 and Cirrus CS42L42 audio codecs found in the M1 MacBook Pro. It also
advertises them to the machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/d=
ts/apple/t8103-j293.dts
> index 1d074b9e60183..24d0b512fac4a 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
[ ... ]
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker_left_rear: codec@31 {
> +		compatible =3D "ti,tas5770l", "ti,tas2770";
> +		reg =3D <0x31>;
> +		interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does sharing the same shutdown-gpios across all four TAS2770 codecs prevent
ALSA from probing?

During I2C enumeration, speaker_left_rear requests the GPIO exclusively and
drives it LOW (shutdown state). The subsequent three codecs fail to request
it with -EBUSY and silently fall back to a NULL GPIO handle.

When ALSA later probes speaker_left_front first, it skips pulling the
hardware out of shutdown due to the NULL handle. It then issues I2C writes
which are NAKed because the line is still held in shutdown by
speaker_left_rear, causing the entire sound card registration to abort.

> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Left Rear";
> +		ti,imon-slot-no =3D <8>;
> +		ti,vmon-slot-no =3D <10>;
> +	};
[ ... ]
> +&i2c2 {
> +	status =3D "okay";

[Severity: Low]
Is this &i2c2 override redundant? The base device tree already overrides
&i2c2 to set status =3D "okay" earlier in the file.

> +
> +	jack_codec: codec@48 {
> +		compatible =3D "cirrus,cs42l83";
> +		reg =3D <0x48>;

[Severity: Low]
Are the required regulator supplies missing for the cs42l83 codec?

The cirrus,cs42l42.yaml bindings require VP-supply, VCP-supply,
VD_FILT-supply, VL-supply, and VA-supply, which appear to be entirely
omitted here.

> +		interrupts-extended =3D <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
[ ... ]
> +		dai-link@0 {

[Severity: Low]
Should this node include a reg =3D <0>; property? Per device tree syntax
rules, any node with a unit address (@0) must have a matching reg property.

> +			dai-tdm-idle-mode-0 =3D "pulldown";
> +			dai-tdm-idle-mode-2 =3D "pulldown";
> +
> +			link-name =3D "Speakers";
[ ... ]
> +		dai-link@1 {

[Severity: Low]
Should this node include a reg =3D <1>; property?

> +			link-name =3D "Headphone Jack";
> +
> +			codec {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D19

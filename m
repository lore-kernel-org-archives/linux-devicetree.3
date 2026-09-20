Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154AC3D2FE6
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881294; cv=none; b=DegfRIT5M1KjvN6e8/ZW+8nM2du7eivYXKLB77hy5KfyIe1/FgrT35P7fSqtK+uCi5XEbBrERiNo260KaEG+xLdF8D4ghWuyuliWtxF5qFstubtxnL0M/zd1+47msxNd58aL4LA5m0vvft4wKbwp1BRmBidvXVf4YUf3EjbQMe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881294; c=relaxed/simple;
	bh=Y4TwA4UpLUE6myioa4dvueuwTx3r22lccBT/D7ixNyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JtmGJUec67CIr+2vKIGD9ajjf0N9XT4leJ1UT3WGm4qjLeyUhTI7UxzCUXpud1Lv+zpC81qtsHDJkk1Q7fiPZI0HoIUbF0KOd2mCs9Pk7hLiErpFYzMIx5Z5dp2ive3mEjPJ8vYSFwSSryoL5SErq5Kvaod4yEsyqmVAgYSQf+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfUgIN3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfUgIN3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A1A1F000FF;
	Sun, 20 Sep 2026 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881293;
	bh=196qq50DEwRyAMwYTM9Uui1NJGv5PW6zG6S+1AyuEP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfUgIN3fH9rqlavghoSsBNXn2Q4w0+UEq62Td6ZqNl/cC8Na2H+LHs1y8Rsv2JL1G
	 c2dgf2Il6MVfoAGnli4CsNn83daseDh18sgrGm/pTZwrTf+NssT84MvjoasYLDbKCZ
	 WNAHYmSVvmrN2r56kdlRpX7CkSTZu4JJVqIW44d+a8G4A3U5wi+gNg1M30WMgnUopm
	 3xZozxY0T0oydJHtxvl1wPKaBwj8O2E/gWVDBOVf2iUEC3YdViAoBznUlxUyHVhzCH
	 zX0KyGo+2/p+vJVTIlXEhkrWtpxTs9QZnBTgLI+ZOYcFsnbvl6TQdI+i5GQOa0roOJ
	 +PAk3AkQGgkzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/28] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:14:52 +0000
Message-Id: <20260920051452.B4A1A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] dts: missing required regulators in cs42l83 node
- [Low] dts: duplicate &i2c2 node definition
- [Low] dts: invalid compatible string array for tas2770
- [Low] dts: undocumented properties in cs42l83 node
- [Low] dts: missing addressing properties in sound node
--

commit 05517f4fbd6ba283bbb6aac224c8afd505d5bf52
Author: James Calligeros <jcalligeros99@gmail.com>
arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes

This commit introduces speaker and headset jack nodes for the M1 Mac mini.=
=20
It defines configurations for the TI TAS2770 and Cirrus CS42L42 audio=20
codecs and links them to the machine driver.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/d=
ts/apple/t8103-j274.dts
> index 1212852251e07..4b30f08eaac01 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
[ ... ]
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker: codec@31 {
> +		compatible =3D "ti,tas5770l", "ti,tas2770";

[Severity: Low]
Will this compatible string array fail schema validation?=20

The ti,tas2770.yaml schema restricts the compatible property to a single en=
um
of either "ti,tas2770" or "ti,tas5770l". Providing an array instead of a=20
single string causes a dtbs_check validation error.

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
> +
> +	jack_codec: codec@48 {

[Severity: Low]
Is there a reason to redefine &i2c2 here?

The t8103-j274.dts file already contains an &i2c2 block earlier in the file=
.=20
Appending another &i2c2 block at the end of the file is redundant; the=20
jack_codec child could be added directly to the existing &i2c2 block.

[Severity: Medium]
Are there missing regulator supplies for this codec?

The cirrus,cs42l42.yaml binding explicitly requires VP-supply, VCP-supply,=
=20
VD_FILT-supply, VL-supply, and VA-supply. These are absent from this node,=
=20
which can lead to schema validation failures and driver probe failures if=20
dummy regulators are disabled.

> +		compatible =3D "cirrus,cs42l83";
> +		reg =3D <0x48>;
> +		interrupts-extended =3D <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Jack";

[Severity: Low]
Do these generic audio properties pass schema checks?

The cirrus,cs42l42.yaml binding specifies `additionalProperties: false` but=
=20
does not include #sound-dai-cells or sound-name-prefix, nor does it include=
=20
a reference to dai-common.yaml. Their presence will trigger validation erro=
rs.

> +		cirrus,ts-inv =3D <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j274-macaudio", "apple,macaudio";
> +		model =3D "Mac mini J274";

[Severity: Low]
Should this parent node declare #address-cells and #size-cells?

Since the children dai-link nodes use unit addresses, standard DT syntax an=
d=20
the apple,macaudio.yaml binding require the parent sound node to specify=20
these properties to avoid compiler warnings.

> +
> +		dai-link@0 {

[Severity: Low]
Does this node require a reg property?

Using a unit address without a matching reg property violates device tree=20
specification and causes compiler warnings.

> +			link-name =3D "Speaker";
> +
> +			codec {
> +				sound-dai =3D <&speaker>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 0>;
> +			};
> +		};
> +
> +		dai-link@1 {

[Severity: Low]
Similarly, does this dai-link need a reg property to match the @1 unit=20
address?

> +			link-name =3D "Headphone Jack";
> +
> +			codec {
> +				sound-dai =3D <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 2>;
> +			};
> +		};
> +	};
> +};
> +
>  #include "hwmon-mini.dtsi"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D17

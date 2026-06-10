Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5881465B4
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078503; cv=none; b=VHdTwCl6h9m11/2j1yP/W+2AeS1ACoITF705DWdR+FbRt8GrQU6nQaujBx348pUcEuB6xT1TUz+fg+lBilahHXkK6noSm0kozGx9ceSn4T9Jtx4gTBTL0sAEAyGN3Apz3//BVXjpp7eBEnyxsw3+ojs14FU/9kdo2DhcY5bAOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078503; c=relaxed/simple;
	bh=cOuibsIfWPT8iKIH4zeAzbiyK9HDb5Sq8X9HlobkC0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gLcW7fcqHI2yp+mis/wRxYn6evWSetlnOsm45BXt1McIowTjZKSeepv3ICk0R+4FO8tUWVjkMwixASglIGgxn+ho877wCqaEe9GzhMADFFaPbEEGi8A48rf0ohwP4s/eL2F8qYQ858b4Jxct/m4gh4X+etzV1WSG5lughN0dBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJfTXnmn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJfTXnmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D2E1F00893;
	Wed, 10 Jun 2026 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078502;
	bh=NnZahA+nLdWwOWRyyfXawSjU8NjNnwaPlAT+3TExnho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MJfTXnmn6CGaQXcBA9rBN6T22QAz3giIxhEQ7/uPoBQCaLdacgkoeoSbxDgyjAnAt
	 TOLPWpJAIleuyxam6ZGmkSBUivcjMxX3xpU31NAmXPPmu4kMXUlCwZhz26OwpCRMUb
	 mFsCCA1Lq4U1UK0UAL4T5a6yI5iEW6uN1AKgaESu445JjadjTS6+UnMl3nBPl0uuQb
	 9qhDVZlWNPakKSobC8OqDIfnPOv6FsypTu2FKfZ+ddUp10F2YI7iDuqsajvSuCXHS6
	 MC3Yv1DWBvbzlPFGCDzo8sIZouMeV4X12/nI2BP3YwHBDpvQPzNg04K3GCEQyLCv9k
	 1NEwqAp61ZP3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260610074702.1743334-5-john.madieu.xa@bp.renesas.com>
References: <20260610074702.1743334-5-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:01:41 +0000
Message-Id: <20260610080142.09D2E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Uninitialized `i2c1` interface and missing pin multiplexing conf=
iguration.
- [Low] Missing labels `audio_clkb` and `audio_clkc` resulting in device tr=
ee build error and incorrect clock configuration.
- [Low] Unnecessary `#address-cells` and `#size-cells` properties in the `c=
odec@1a` node.
--

commit fe54753481ec78b59331c5d3dffff0a3ac46ac08
Author: John Madieu <john.madieu.xa@bp.renesas.com>

arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support

This patch enables audio support on the RZ/G3E SMARC EVK board. It configur=
es
a DA7212 audio codec on I2C1 and the SSI interfaces for playback and captur=
e.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 6372f582a7c41..7defd342294ad 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts

[ ... ]

> @@ -55,6 +86,22 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
>  		gpios-states =3D <0>;
>  		states =3D <3300000 0>, <1800000 1>;
>  	};
> +
> +	sound_card: sound {
> +		compatible =3D "audio-graph-card";
> +
> +		label =3D "snd-rzg3e";
> +
> +		dais =3D <&rsnd_port0>;	/* DA7212 */
> +	};
> +};
> +
> +&audio_clkb {
> +	clock-frequency =3D <11289600>;
> +};
> +
> +&audio_clkc {
> +	clock-frequency =3D <12288000>;
>  };

[Severity: Low]
Will this cause a dtc compilation error? The labels audio_clkb and audio_cl=
kc
do not appear to be defined in the included SoC device trees.

Additionally, should these be configured as external fixed clocks? Since th=
ey
are internal CPG module clocks, it might be more appropriate to configure
their frequencies using assigned-clocks and assigned-clock-rates inside the
snd_rzg3e node.

[ ... ]

> @@ -99,6 +146,37 @@ &i2c0 {
>  	pinctrl-names =3D "default";
>  };
> =20
> +&i2c1 {

[Severity: Medium]
Is this missing the status =3D "okay" and pinctrl-0 properties? Without the=
se,
the I2C controller remains disabled by default, which may prevent the audio
codec from initializing and cause the sound card binding to fail.

> +	da7212: codec@1a {
> +		compatible =3D "dlg,da7212";
> +		#sound-dai-cells =3D <0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: Low]
Are the #address-cells and #size-cells properties necessary here? Since the
only child node is a port without a unit address or a reg property, this
could trigger an avoid_unnecessary_addr_size dtc schema warning.

> +		reg =3D <0x1a>;
> +
> +		clocks =3D <&versa3 1>;
> +		clock-names =3D "mclk";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610074702.1743=
334-1-john.madieu.xa@bp.renesas.com?part=3D4

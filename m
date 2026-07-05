Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBFB233721
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282690; cv=none; b=DeSTET415PinijTDRp/8NiBBdyhXb17RJ48dBJTx6cbYEdvlsKp4L26U2T9f+u1IJpaRA6G11SmD9CCALtI/A/DXxifQmKhAncPFcrN2bfjujHiMFlI8focKt4qHUcTcJZzvqATG7OMVFYedY2Q18ipx1quyC5UGRFXwLeICucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282690; c=relaxed/simple;
	bh=gGnndCmb7p6i9YdaOhYsnKc3RPfmFy4uC6AOaZselB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j3AVeE0KaxVECGe8gTEpVbPv4N4GAU2Fgfk0oaO6WZUTjyXJaB5xqL3141lQmAH2fEQdAo7TDbNgvu5tN1LBk2KNz8Onv4tC+Pycnnsa4wZ4jJIX87fYsR3usyJnlKQ3EauHcsU+mIzFKXKEffBk7d5lYn6OFu1LE/RNmtdERr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvlVrcwr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvlVrcwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82201F000E9;
	Sun,  5 Jul 2026 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783282689;
	bh=3Dvrp8rnyzNBMfqqtEKtN0dYsXCIrJspCBt8S2QdLf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GvlVrcwrubrNKvJsVJV3YjZjjg0943lQyPpRIBPOW36gAC0gV+31oDEKC+45u2REJ
	 rgztStcHr55VwTfE1N4DioiY3O8cO4v9hVa1MmYtRmAQ9OzOjX/89VH+T19t5x3xL/
	 QVnzIzCX3GNiMgQlAKhWnEzfzZBKsgDrCZQkj/g7c65Was+nDy0dnLSr/X/iBUPHtE
	 6bVR26FVHkD72dsTRk4vtAYk/WTha2yHLiuCGXtwjpPiBf8GHkgfwUQttn+otgCk75
	 fT3p+4aerhX7GXNdR7N0SsrmeQgtiklCWvM2Gkw5DheVnjRJd1dNxCqY2ti6Duhl+W
	 QV3xvdLBUU0hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic
 audio support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:18:08 +0000
Message-Id: <20260705201808.B82201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `reset-gpios` property for the CS35L36 codecs incorrectly speci=
fies `GPIO_ACTIVE_HIGH` to work around a logical bug in the CS35L36 driver.
--

commit 380e434eaeea6507428e5e193d27e7812369af1c
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-google: Add basic audio support

This commit introduces audio support for the sdm845-google devices. It adds
the sound card and wires up two CS35L36 audio codecs for the top and bottom
speakers.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-google-common.dtsi
> index b2dc0327dff85..d00fee7ebd424 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi

[ ... ]

> @@ -409,9 +411,53 @@ nfc@28 {
>  };
> =20
>  &i2c12 {
> -	/* Bottom spkr (right) CS35L36 @ 40 */
> +	status =3D "okay";
> +
> +	/* CS35L36, Bottom Speaker */
> +	cs35l36_bottom: audio-codec@40 {
> +		compatible =3D "cirrus,cs35l36";
> +		reg =3D <0x40>;
> +		reset-gpios =3D <&tlmm 112 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Is this reset-gpios polarity intentionally set to GPIO_ACTIVE_HIGH to work
around the cs35l36 driver bug?

Since the CS35L36 hardware reset pin is active-low, shouldn't devicetree
accurately describe the hardware rather than encode a software workaround?

The driver in sound/soc/codecs/cs35l36.c currently treats the GPIO as an
enable signal, requesting it with GPIOD_OUT_LOW and writing a logical 1
to run. Setting GPIO_ACTIVE_HIGH in the DT translates this into a physical
high voltage, taking the device out of reset.=20

Would it be better to specify this as active-low to match the hardware and
address the bug in the driver instead?

> +		#sound-dai-cells =3D <0>;

[ ... ]

> +	/* CS35L36, Top Speaker */
> +	cs35l36_top: audio-codec@41 {
> +		compatible =3D "cirrus,cs35l36";
> +		reg =3D <0x41>;
> +		reset-gpios =3D <&tlmm 75 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Are we encoding the same driver workaround in the devicetree here for the
top speaker?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-pixel3-aud=
io-v1-0-3b66f33859f1@ixit.cz?part=3D6

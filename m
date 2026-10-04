Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360C1A5BAE
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094909; cv=none; b=PhXjh9oAmBHiINgEiRMd9sFWdlpGp38qKY/bQPW/Wxj2rZkYXAJdiE+SV8Lwtiy9BaFdEaSO5DOhav1+Vawwql3q4OEoK0tu2EO0ObwDuj5h+oWuAA9o8rRYDVWQ8g3Uy/ukIn0XNf4I7aKezAd/JNqbDZYkqx/5YKRwLhou8Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094909; c=relaxed/simple;
	bh=NxaytQ8l1JwmREzUKXC8jTNOAdXMgRBSfTRjjvxiVjI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sUlEh8FjwjkdlSzTZJ+dzJor62F9j5/6tH7OeGRHyx+4dqmti1iyKx7XY0hbFXszGWeMRJF3rS2xOJAyOdTm4WgCCQMaiSg5JM93btWNzxQaFdAs+Cy3ApUL/FoMlo9hnnQv3/uMu92Y/8Uz4Ifk34uO4Mw/cj0Z0o5mvyDqQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVmORXYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVmORXYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3951F000FF;
	Sun,  4 Oct 2026 06:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791094908;
	bh=Y9QFIRt1CAaVaUkRsSZg0XqcyviAp7zIstoNph9o7g0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RVmORXYUMw9Plu/8DoRhN1PL8EiBIczB2l8exlOerckZfGEdeel0sytE4jx5LbLvz
	 5lj4ZavQxsOQ9FN1BciOnZXgs9aKYtKrNrm8X3R7crWq6NiCQmvGqlWdjYloujEVuK
	 pJqAv0kYqAL2WgD0CxftDRU8REpjaD+yLpBNqcCtvKszkqqzIxwYVKKdKPuxP0KHDb
	 tP2zGml2muhj1++lV81xOreQEcvd2SIRSfD0DfcfqKgrXOucjTph3679F4o7L8E86R
	 M9IUFsoIBH1snfBEYR2UOcHOgu2yJpCdV92FgUSwH9EoDyFqY00R5W8jmmnhwJsrJ/
	 dFDkzUuJP8GPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-15-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-15-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:21:47 +0000
Message-Id: <20261004062148.4C3951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sound: shared shutdown-gpios exclusive access breaks codec probe
- [Low] sound: typo in sound-name-prefix for right tweeter
--

commit ddd222332b9cc5e6dd657f47e5e0fc1b0c690e08
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8112-j415: Add speaker/headset jack nodes

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/d=
ts/apple/t8112-j415.dts
> index fdc3409d2e079..4f3db2a93db03 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j415.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
> @@ -92,4 +92,136 @@ &fpwm1 {
>  	status =3D "okay";
>  };
> =20
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker_left_woof1: codec@38 {
> +		compatible =3D "ti,sn012776";
> +		reg =3D <0x38>;
> +		interrupts-extended =3D <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does sharing the same shutdown-gpios across all 6 speaker codecs break the
probe sequence?

The tas2764 driver requests the GPIO exclusively:

sound/soc/codecs/tas2764.c:tas2764_parse_dt() {
	...
	tas2764->sdz_gpio =3D devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_L=
OW);
	if (IS_ERR(tas2764->sdz_gpio)) {
		if (PTR_ERR(tas2764->sdz_gpio) =3D=3D -EPROBE_DEFER)
			return -EPROBE_DEFER;

		tas2764->sdz_gpio =3D NULL;
	}
	...
}

Because devm_gpiod_get_optional() requests the GPIO exclusively, the first
codec to bind on the I2C bus will get the GPIO and drive it LOW.

The other 5 codecs will receive -EBUSY and silently fall back to NULL.

Later, when ALSA probes the codecs in the order defined by the sound-dai
property, the physical shutdown pin might still be LOW. This causes the
first codec attempting I2C initialization to fail with -EREMOTEIO, rendering
audio unusable.

[ ... ]

> +	speaker_right_tweet: codec@3c {
> +		compatible =3D "ti,sn012776";
> +		reg =3D <0x3c>;
> +		interrupts-extended =3D <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Right Tweet";

[Severity: Low]
Is this sound-name-prefix correct, or should it be "Right Tweeter"?

The left tweeter uses "Left Tweeter", so naming the right one "Right Tweet"
might cause ALSA UCM profiles that rely on string matching "Tweeter" to fail
to match the right channel, potentially causing broken or asymmetric mixer
routing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D15

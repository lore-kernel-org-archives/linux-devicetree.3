Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15333372A
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094788; cv=none; b=QHY2ITRsosvfBEvt8WD0MKddVU/q0flYbhy75TmNYRwgUIMq0RdPyvDRUeNlZOH3ZuX7ruMAXnEsH/t7irba+W2OHjgjBUglWlQ9xnH36aOBL+BG60obewQxhscTvSNpGWhhp39+NEzv0WmSSOVjoEmSLEMeyC6jkV00R5K/Hro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094788; c=relaxed/simple;
	bh=AdkLFD2GQoIGoOZ/LDU6A+NL6NVT2CYOduRG5KnfwMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XIR1qkbeKvtDE6rvFVTUeYYbbsfN0571lz0Ux4wrWowuAs3iuVXOQW1hFw1znA+4aHUrIB53yYNEbvBmRZpTuYIqVTK1R8XderkHmuASChTkY/sM5HSyGgDmMUp/O+/Y9UnyVUhxwxN+usuCQX06uLKLX//h4SUUBUIG3+L9py8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BN7UaTMP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN7UaTMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95C11F000FF;
	Sun,  4 Oct 2026 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791094787;
	bh=4LYfG8TcbAFeB6AdAzL+s+ftsn63wBy/ji8wxsXj4sQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BN7UaTMP6olo5hMFRAg48/u9P4U8U3cVqkbwRvZmyQ8LEFsxLLUmMteGEbwLLuS2i
	 RFCMjFmPPsYXYYgP+gPZtsf3vUxktCoyJlfU8SbXKk/QkmepjVh6CdpMy6ZgVuPXlr
	 C0E9lptSbw8biKANVoZEF+OYuMkNchzGLDkhfAEidTIle/pCN68CGz/iPr0EJ1j/2i
	 VTaEIbUW0Gg2XdAkYwjbKwkS2zZTW1cmA0zpNfqmzZSKace2jTK2BUDMAbHgSjk0CY
	 g5gbzMEyj6giC180y9azwDjKDVfOECTZn9CuZrISS07rFyt9eED1BA4uqfQOY56NO8
	 alva38wuHI8cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:19:46 +0000
Message-Id: <20261004061946.A95C11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sound: missing tas5770l driver binding prevents audio probe
- [High] sound: shared shutdown-gpios cause power desynchronization and sus=
pend failure
--

commit f49e30a50ba190f34e911ebbdc8c79e90f63cee5
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes

This commit adds device tree nodes for the Apple-specific variants of the TI
TAS2770 and Cirrus CS42L42 audio codecs on the M1 MacBook Air. It connects
them to the machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/d=
ts/apple/t8103-j313.dts
> index f8b2b1637b9dc..cdda63ca8b349 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
[ ... ]
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker_left: codec@31 {
> +		compatible =3D "ti,tas5770l";

[Severity: High]
Will this node fail to probe because the driver lacks a binding for
ti,tas5770l?

Looking at the driver in sound/soc/codecs/tas2770.c, tas2770_of_match[] only
includes the ti,tas2770 string:

sound/soc/codecs/tas2770.c:tas2770_of_match[] =3D {
	{ .compatible =3D "ti,tas2770" },
	{ }
};

Since there is no fallback string provided in the device tree for either
speaker_left or speaker_right, will the ALSA machine driver defer
indefinitely waiting for these speaker codecs to bind?

> +		reg =3D <0x31>;
> +		interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;

[Severity: High]
Can this shared shutdown-gpios configuration cause a system suspend failure?

Since both speaker_left and speaker_right map to the exact same physical
shutdown-gpios line, the second codec to probe will fail to acquire it.
Looking at tas2770_parse_dt() in sound/soc/codecs/tas2770.c, the driver
requests the GPIO exclusively:

sound/soc/codecs/tas2770.c:tas2770_parse_dt() {
    ...
	tas2770->sdz_gpio =3D devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_L=
OW);
	if (IS_ERR(tas2770->sdz_gpio)) {
		if (PTR_ERR(tas2770->sdz_gpio) =3D=3D -EPROBE_DEFER)
			return -EPROBE_DEFER;

		tas2770->sdz_gpio =3D NULL;
	}
    ...
}

The second codec will get -EBUSY and silently fall back to sdz_gpio =3D NUL=
L,
leaving it without control of its power state.

During system suspend, the first codec will pull the physical GPIO low,
cutting power to both chips. When the second codec's suspend callback
subsequently runs, it will attempt an I2C write (TAS2770_PWR_CTRL_SHUTDOWN)
to a chip that is already physically powered off.

Could this I2C timeout or NACK return an error that fails the component
suspend, thereby aborting the overall system sleep transition?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D11

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258F1C5F39
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778734484; cv=none; b=Bm8bRqLu6Kbu3UfPSgwdj+x+/oiVkBXjPYNNkg4rRysmOj/ZwaoB71Nsq1RJo6Hhx2of+4Y8pnP/nmmFtCx1i6N/x4QaP4pKxIiUDCqIJ8CSICsNnl4NmUsG24t+rWq4rT8IPeyjA383sREjQHPfhG+ugwMifPqP3ZYC+sfXguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778734484; c=relaxed/simple;
	bh=ctUHGpuuuZbEme2lA5n3VT8j6UUqq3Tc3Rcv2e3t5c4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z0aENyMfdfZT2Zp2cicof7c9FVbGW4AD8FVsQnS9ell+qGRwylkPeWo2RQByJLBrSAFBHIQFCtWcmolvb/sxEwQINbmrrgH1YjZ+s4oU9YvezoZS1Htdkf62aYXYvuwN5rRhbPL+F7u6D58ZcLR0HLfqKq4EhwQGprQ3YkabYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAG2axXg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAG2axXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32896C2BCB7;
	Thu, 14 May 2026 04:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778734483;
	bh=ctUHGpuuuZbEme2lA5n3VT8j6UUqq3Tc3Rcv2e3t5c4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kAG2axXgkmwPF2oULN6lGKSvbLCFPVMwJ9gbdEnuCItkLsQEeELS+vccOPStAvHjW
	 b3SHZEDwNgOFxncXlr8lIOVFwbiPaneSkkNTS4Kbb/ilB9tnaaigBOnzMDzDN04fAy
	 O3GnEy+I9+mWqBq4dHLSeNgDX1TgquVIZp4M3uJw8qd9S6FuaF/Atw5/37lrAkPCic
	 jIGrtePVrlG1ijB0GoA6oD2zCE5LVOttj9ehGuiF82ej3fZ1HHcQ3hvjvZhrEGoEH4
	 Cr7AYJJuznFGIyyBZm7Zwi6CJtMJTwz0aFGKzmH2/RIIKEpcWudC0a3q6AClLBzfOC
	 LgapWISOSDQog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/17] ASoC: simple-amplifier: gpio-audio-amp: Add
 support for bypass gpio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513081702.317117-13-herve.codina@bootlin.com>
References: <20260513081702.317117-13-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:54:42 +0000
Message-Id: <20260514045443.32896C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The bypass GPIO can drive a physical logic HIGH into an unpowered =
amplifier chip, creating a severe risk of back-powering and permanent hardw=
are damage.
--

commit 802f9d8e2a1a80c9fdc791af2e538c251cfdc8e9
Author: Herve Codina <herve.codina@bootlin.com>

ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio

This commit adds support for controlling an amplifier bypass feature using
a GPIO. It duplicates the initialization pattern used for the mute GPIO.

> diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simpl=
e-amplifier.c
> index c8991e340def5..b9c09a04832a8 100644
> --- a/sound/soc/codecs/simple-amplifier.c
> +++ b/sound/soc/codecs/simple-amplifier.c
[ ... ]
> @@ -352,8 +360,15 @@ static int simple_amp_probe(struct platform_device *=
pdev)
>  			return ret;
>  	}
> =20
> +	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_BYPASS) {
> +		ret =3D simple_amp_parse_single_gpio(dev, &simple_amp->bypass, "bypass=
");

Looking at simple_amp_parse_single_gpio(), it requests the GPIO
synchronously with GPIOD_OUT_LOW:

sound/soc/codecs/simple-amplifier.c:simple_amp_parse_single_gpio() {
    ...
    single->gpio =3D devm_gpiod_get_optional(dev, gpio_property, GPIOD_OUT_=
LOW);
    ...
}

Since this is called during probe, before the DAPM powers up the device,
can this cause hardware damage if the device tree defines the GPIO as
active low?

If the GPIO is defined as active low, gpiolib will immediately drive the pin
to a physical high voltage. Because the amplifier's power supplies and enab=
le
pin are managed by DAPM and disabled at probe time, driving a physical high
signal into an unpowered CMOS device might forward-bias the internal ESD
protection diodes.

This could back-power the chip from the SoC's GPIO pad and cause latch-up.
Would it be safer to strictly sequence the GPIO state changes with the
device's power state? For example, by deferring the GPIO output configurati=
on
until DAPM powers up the device, or implementing the controls as DAPM widge=
ts.

Note that this identical behavior appears to exist for the mute GPIO as
well, which this bypass GPIO implementation is modeled after.

> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* Set controls name */
>  	simple_amp->mute.control_name =3D "Switch";
> +	simple_amp->bypass.control_name =3D "Bypass Switch";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513081702.3171=
17-1-herve.codina@bootlin.com?part=3D12

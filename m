Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3C4C77CF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448126; cv=none; b=YeKkOjzcihTEY/All2A7AGma30SQPMO43EY/b0PV0BeebxPEAMcoI54WLJbKy83PAHYXsAZmd76PdmA6Sj7p8ntkG2/yGjV5ILLVUvZyH4Iun8GUDVGWd90YOi5DPKDOiMAopxsBTCNMbKoT+ksZU1JzaZth8ZysoqvlZcjwsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448126; c=relaxed/simple;
	bh=3OrX5PBXaXmt4da+SJWUyL07eFz6FHls/F7bEpo/v7A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WEMbmkyW0QeVPJNhdc2wn5rcan+hdhrs0rABcJ2tHTs87Qhp+unmU8VSgrcCtlbhFI1CijpyUDEoWc4eKZVU+VFLlWCNbJi3A533Im27XbiYi9dRujZ+hubeCwEBy7bdsoTZP2MAxGXhMXJtYPUFlgp8emjloSw2GaORW7L3lwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGapKdkm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGapKdkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B981F000E9;
	Thu,  3 Sep 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788448124;
	bh=KU1tb2TWIaQLnnkjVIbtQX+OgwmcH0aKwZ8/YZf1Ivo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGapKdkmU/lwENc91oFVA5YhQqcKAWruCzNP+To0xZsx1a2ZllX8cs1j9qsT3pVOI
	 p5khOFDcl2myvqxxykr+ds84Cx7xNGHmHklq/Tc7be3BGevhiF2/k+V02yjKIxbzRC
	 QQ3ottZRqbn3ctx3KyMhVRucdtejr5Jcw/TWHXS+HQ6hA/GtTMWCQyzUtVKiM+FhYC
	 freW8z/deaHtdZvwyboysr7HaAMVfobz0Nf+MmUJp+gJgXlT3ja8juxu2epCIfS8Eb
	 HgLZqaadmamUozKuLFUuaoip++6iN8rt1UVZTxjOYdRoNm6cnXdKzlWT1yVClsezBj
	 00IZUjixYumOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:08:44 +0000
Message-Id: <20260903150844.82B981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-after-free race condition if devm_add_action_or_reset() fails =
after drvdata is set.
--

commit ea24b0bc9b26402781f7da38607787a0f6b47e39
Author: Gregor Herburger <gregor.herburger@linutronix.de>

firmware: raspberrypi: Add reboot mode support
   =20
The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This can be used to create a A/B update scheme.

To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
message must be sent to the firmware. Add support for this by
registering a reboot mode driver.

> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> index 0aa322e9a2e73..2a0c40b8052e5 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
[ ... ]
> @@ -302,9 +331,14 @@ static int rpi_firmware_probe(struct platform_device=
 *pdev)
> =20
>  	platform_set_drvdata(pdev, fw);
> =20
> +	ret =3D devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
> +	if (ret)
> +		return ret;

[Severity: High]
If devm_add_action_or_reset() fails here, could this create a use-after-fre=
e=20
race condition?

When the failure occurs, devm_add_action_or_reset() immediately executes
devm_rpi_firmware_put(), which drops the refcount and frees the fw context.=
=20
Because platform_set_drvdata() was already called, the driver data=20
will point to this freed memory until the core probe cleanup mechanism=20
eventually clears it.

During this window, a consumer driver could call rpi_firmware_get(), which
performs a lockless lookup of drvdata and attempts to dereference the freed
pointer:

drivers/firmware/raspberrypi.c:rpi_firmware_get() {
    ...
	fw =3D platform_get_drvdata(pdev);
	if (!fw)
		goto err_put_device;

	if (!kref_get_unless_zero(&fw->consumers))
		goto err_put_device;
    ...
}

> +
>  	rpi_firmware_print_firmware_revision(fw);
>  	rpi_register_hwmon_driver(dev, fw);
>  	rpi_register_clk_driver(dev);
> +	rpi_register_reboot_mode(dev, fw);
> =20
>  	return 0;
>  }
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-rpi-tryboo=
t-v3-0-ce94c347e932@linutronix.de?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEC1DDC37
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854035; cv=none; b=dyWBqFpBWijw9alEw+85jzIL3bXx09/vu/gbvlFlMWi9cgdyVhEvfD8NrfDbHHR/9ZS9z9bUyYzRTxzqM5GEPDuu9CvWtjYX6Yj47fp7DSljikC8r8NmDfaqO5TD93wINz7xM7bctvku19uySIZeL9w+k1iB1WOo3NhsDKnN91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854035; c=relaxed/simple;
	bh=7rTzzQePlEfRl440Fe2ISddtvK5w5BTunN+N4wqaYMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xt1J1tATE99ARNiBSJjI2BL9aUN8xGVfXX+IWN4l5mCBCeuZuYM6p4aIoLCatWuY3gqUFoH0NSlo/dZxO5L0rZ2lx0ruhDzpayBRsyxVvRvz3detjUihBM/a9Keps5en2nZLBxOqhdKIJraH5c3Wg9U8UK+hHFZ0/ULxLDJ3bVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kf94YMr0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kf94YMr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897E71F000E9;
	Tue, 30 Jun 2026 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782854033;
	bh=NbvcV1TD4yLg8xZSfyj1vyrU5B9FEqe/6/Fm9KDgeGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kf94YMr0Gp0k1FuHBYlK1EM4wW9ppypmZWk9Ydls470Hq9XAQOAGHkRCn5w2Cavx5
	 ekayPs7JLEkVEe/OM10CHbGsBRTGgS9k1YdnjDg0DIU8Z4z0IFYNdlo3zUai2n0VSL
	 3xciOwH+zUXCO1sFseDZzeJO2HRBKTxy/y6McYC7V8Lyv3CuwOTF/OEaGAkvURsuCd
	 t26j2dz8JKo0UAsmeskqfZKF2HkpzeSOXEV2dZIvHx/X1XyCdkThi1ZBjnEBHim+XS
	 gZ/Psr/q51Twj4nau76eRFgFOXtyN/ft5tVkhCKVx0bCsiAh9f0fGmWWgtSgE/xiLv
	 LQ1UKgzMBrk1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] firmware: raspberrypi: Add reboot mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630-rpi-tryboot-v2-3-f68d2dc6aa27@linutronix.de>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
 <20260630-rpi-tryboot-v2-3-f68d2dc6aa27@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 21:13:53 +0000
Message-Id: <20260630211353.897E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Use-After-Free in devm_reboot_mode_release due to incorrect de=
vres registration.
- [Medium] The reboot mode magic value is sent to the firmware in CPU byte =
order, which breaks on big-endian kernels.
- [Low] RASPBERRYPI_FIRMWARE selects REBOOT_MODE without depending on POWER=
_RESET, causing a linker error.
--

commit c3a66741771139fdb5972557da035f4b4fb75ce1
Author: Gregor Herburger <gregor.herburger@linutronix.de>

firmware: raspberrypi: Add reboot mode support

The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This can be used to create a A/B update schema. Add
support for this by registering a reboot mode driver.

> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -115,6 +115,7 @@ config ISCSI_IBFT
>  config RASPBERRYPI_FIRMWARE
>  	tristate "Raspberry Pi Firmware Driver"
>  	depends on BCM2835_MBOX
> +	select REBOOT_MODE

[Severity: Low]
Since REBOOT_MODE implicitly depends on POWER_RESET, does selecting it here
without also adding `depends on POWER_RESET` cause unmet direct dependency
warnings and subsequent linker errors when POWER_RESET is disabled?

>  	help
>  	  This option enables support for communicating with the firmware on the
>  	  Raspberry Pi.

[ ... ]

> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c

[ ... ]

> @@ -273,10 +275,25 @@ static void devm_rpi_firmware_put(void *data)
>  	rpi_firmware_put(fw);
>  }
> =20
> +static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *reb=
oot,
> +					  unsigned int magic)
> +{
> +	struct rpi_firmware *fw =3D container_of(reboot, struct rpi_firmware,
> +					       reboot_mode);
> +	int ret =3D 0;
> +
> +	if (magic)
> +		ret =3D rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
> +					    &magic, sizeof(magic));

[Severity: Medium]
The `magic` parameter is passed by reference directly to the firmware here.

Since the firmware expects a little-endian 32-bit value, does this cause
the reboot mode flag to be misinterpreted on big-endian kernels?

Should this value be converted with `cpu_to_le32()` before sending it?

> +
> +	return ret;
> +}

[ ... ]

> @@ -306,6 +323,12 @@ static int rpi_firmware_probe(struct platform_device=
 *pdev)
>  	rpi_register_hwmon_driver(dev, fw);
>  	rpi_register_clk_driver(dev);
> =20
> +	fw->reboot_mode.dev =3D dev;
> +	fw->reboot_mode.write =3D rpi_firmware_reboot_mode_write;
> +	ret =3D devm_reboot_mode_register(dev, &fw->reboot_mode);

[Severity: Critical]
Does unbinding the driver lead to a use-after-free in the devres cleanup
phase?

The `fw` structure is allocated and managed by a kref, which gets dropped in
`rpi_firmware_remove()` when the driver unbinds, freeing the `fw` memory.

However, `devm_reboot_mode_register()` ties the cleanup of the reboot mode
driver to the device's devres lifecycle. Since devres cleanup happens after
the remove function returns, `devm_reboot_mode_release()` will attempt to
access `&fw->reboot_mode` after the memory has already been freed.

> +	if (ret)
> +		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-rpi-tryboo=
t-v2-0-f68d2dc6aa27@linutronix.de?part=3D3

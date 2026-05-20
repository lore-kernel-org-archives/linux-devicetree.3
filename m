Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E095200C2
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282024; cv=none; b=BgsArDMOLhn6hq1hRpAraqiFmNP9Kr5RU+0u/5JX51sCbFOCXIVkkRjl5XtUvJiA/zXDC48ZZhTsG+9KRi/8tk2bTb9FnXQcM47Fd7u8RqNAtj/cWGhbqLd9hp8130vqeBM9Ujwc9RTe/8K+ZRqixzccdFwzE8pVRFg73doD6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282024; c=relaxed/simple;
	bh=yPOLHz1LWzsplwFKoEa4OqoYAg24NBqMFXO28ev/3z4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O/Bma4V+7p8++JXXM7FHcTTJFmMnwxIhFs5IB0rYVoMqA9qjX7BptF26khtIsSBhR0X0TjaA4mVav8OKVnAGblj9xydhfMFVODMJbspPVb50YQDX/keWXBl5qr3zY9dW5VeWN2qpLEoolrsNQgc5oDyJeeHTSN9Vx1HCWWYnN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFFYd7fN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFFYd7fN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE631F000E9;
	Wed, 20 May 2026 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282022;
	bh=NBKOdERGd5IKnleswfQFlfp6kKBz2k9WySZlClSlyQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hFFYd7fN9J+6L3euC8QviSVGdVjs2dfhjIRehbwgPfYa5LZzOYPp5HJm4/dn0ydgT
	 g6y2sU4ZGpx4ehHnNI+1Fljf5VMIv2glc1R94YFLFeFoLlVdcZbeuVhi1jvS+NDVId
	 wOPv7Fh67dUTOzGFs9+sFOKuyrTRyVtKCfXB4VK0Bai3LGwbLps/dVC/+Kh4t7UiRq
	 i1BY3hzGQLpXqKxLoeZTlohgRRAzEQ4Rb4dAPiKsKmeUxosNTzaaDkC2PA5MGNJAxE
	 u25BPELxTQtS1T2l2jjSSO9isIZHJ0UBAJ3wdVlmDkiQMAm9a6JIMX32JikM7xqV6+
	 ixaSqpl6gDtnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 15/17] media: cadence: csi2rx: Support runtime PM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520120022.539913-16-r-donadkar@ti.com>
References: <20260520120022.539913-16-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 13:00:22 +0000
Message-Id: <20260520130022.9EE631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Asynchronous pm_runtime_put() combined with pm_runtime_disable() d=
uring device removal causes a hardware resource leak.
- [Low] Unconditional assignment of the dev_pm_ops structure and improper K=
config PM dependency.

Pre-existing issues:
- [High] The interrupt handler accesses hardware registers without ensuring=
 the device is active, risking bus faults.
--

commit a72fbe3bfad5203480d07b860f9bc4fef20bf3ce
Author: Changhuang Liang <changhuang.liang@starfivetech.com>
media: cadence: csi2rx: Support runtime PM

This commit introduces runtime power management hooks to save power when
the CSI-RX controller is inactive. It also shifts the error handling in
the csi2rx_enable_streams() function to use goto statements.

> diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platf=
orm/cadence/Kconfig
> index 1aa608c00dbce..ea85ef82760e6 100644
> --- a/drivers/media/platform/cadence/Kconfig
> +++ b/drivers/media/platform/cadence/Kconfig
> @@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
>  config VIDEO_CADENCE_CSI2RX
>  	tristate "Cadence MIPI-CSI2 RX Controller"
>  	depends on VIDEO_DEV
> +	depends on PM

[Severity: Low]
This isn't a bug, but does this driver strictly require the PM dependency?

Using the pm_ptr() macro for the dev_pm_ops assignment below would allow
this Kconfig dependency to be dropped, avoiding dead code while still
compiling correctly when PM is disabled.

>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API

[ ... ]

> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index 8931e824c597c..1ff2d8f78d5b4 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c

[ ... ]

> @@ -590,8 +559,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev=
 *subdev,
>  	csi2rx->count--;
> =20
>  	/* Let the last user turn off the lights. */
> -	if (!csi2rx->count)
> +	if (!csi2rx->count) {
>  		csi2rx_stop(csi2rx);
> +		pm_runtime_put(csi2rx->dev);

[Severity: High]
Could this asynchronous pm_runtime_put() cause a hardware resource leak?

If the device is unbound via module removal right after streaming stops,
csi2rx_remove() will run and call pm_runtime_disable(). This cancels any
pending asynchronous idle/suspend work, leaving the controller in the
RPM_ACTIVE state.

Does this leave the sys_clk, pixel_clk, and p_clk running indefinitely?
Would it be safer to use pm_runtime_put_sync() here to ensure the suspend
completes before removal?

> +	}
> =20
>  	return 0;
>  }

[ ... ]

> @@ -1019,6 +990,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
> =20
> +	pm_runtime_enable(csi2rx->dev);

[Severity: High]
This is a pre-existing issue, but does csi2rx_irq_handler() access hardware
registers without ensuring the device is active?

With runtime PM introduced, the device's clocks will be gated when it enters
the RPM_SUSPENDED state. If a spurious or delayed interrupt triggers while
the clocks are disabled, accessing the hardware registers could result in a
synchronous external abort and a kernel panic.

Should the interrupt handler use pm_runtime_get_if_active() to check if
the hardware is powered before reading the registers?

>  	ret =3D v4l2_async_register_subdev(&csi2rx->subdev);
>  	if (ret < 0)

[ ... ]

> @@ -1068,6 +1104,7 @@ static struct platform_driver csi2rx_driver =3D {
>  	.driver	=3D {
>  		.name		=3D "cdns-csi2rx",
>  		.of_match_table	=3D csi2rx_of_table,
> +		.pm		=3D &csi2rx_pm_ops,

[Severity: Low]
This isn't a bug, but could the pm_ptr() macro be used here?

Wrapping &csi2rx_pm_ops with pm_ptr() would avoid dead code compilation
warnings when PM support is disabled, without needing the hard Kconfig
dependency mentioned earlier.

>  	},
>  };
>  module_platform_driver(csi2rx_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D15

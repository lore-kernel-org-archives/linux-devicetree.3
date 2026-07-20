Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2526423177
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553381; cv=none; b=oLRfvK54+tZ3biacDqdmXnxPEMoW6PGDbfRz0kNN9/z8eYLOsEozDABh1q4DuoZqr6mjwy7eYSV/eufg6Cs+doWrhzOWXZ8iR9opFbhKielLyJlQGR8bRoGJmT3zDyG44tU2kqmosKFOHjg07jlyoYFljanxbxCHcRizStaBWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553381; c=relaxed/simple;
	bh=qeeBSusO9J32iX3a65cU+nEVvJsgwigJjhbqXPn50kw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a2iTP8AUDM+OnP/y9RYFwk5ek7HFEWI44a5I0xPwTaVQ69IASPGkB0Bm1qjRt9T5CSGeqNA5Imrh5EJVWYiAiMY+Ly0Dj+0kMEeI7fWtjJXqr2tI9i6jFE6iRGRUXqia/6A5erCA3XExdL7Hwh0uRrFqzTVR8+R93ia4xANl8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMRxQ7eH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMRxQ7eH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516811F000E9;
	Mon, 20 Jul 2026 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553380;
	bh=sBblrXQ0JPnHNqmbtjS7D28xHufFD4AdxFLnWayY+cU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMRxQ7eHHn/hyNNmEOfEwuGBEc/9uA2lwIkysS+pokXlWrlnlu58qSjg9ruD3CpsW
	 SYuJQxblyfbwia9+ymbNOF59cxFjb6+9PfrYgrDgz+7yfYBm1EQOUNDLHp5JE4boov
	 pkvuHC1mIGuegq+fqJTISfN4/UwS50UU28GFKrJbiQImlMwdZ6wa78iIkkdCcNHLa1
	 tJzvIqGc1KiXSzz2ENCsJ+Op/D5Y8c96TnsWVURNhwJi8pT0IQFiRrC125xZDURQt5
	 E8hg1i1TYBxS2YUfd2CcXtq+1LVWFsMp7pRTaGtBn4OTWxHEO2PjjgiSg3w/5+YK5e
	 yjksYUCgzHkGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS
 LPI TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720130511.493295-5-prasad.kumpatla@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <20260720130511.493295-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:16:19 +0000
Message-Id: <20260720131620.516811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use of destroyed mutex during device removal or probe failure.
--

--- Patch [4]: [PATCH v4 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS=
 LPI TLMM ---
commit d1a3c124f6b76999c46378d71d6ae4c570d93507
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

Add pin controller driver for the Low Power Audio SubSystem (LPASS)
Low Power Island (LPI) of Qualcomm Hawi SoC. The controller has 23 GPIOs
with various mux functions.

> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinc=
trl/qcom/pinctrl-hawi-lpass-lpi.c
> new file mode 100644
> index 0000000000000..7036bf4c66920
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
> @@ -0,0 +1,244 @@
[ ... ]
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops =3D {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
> +static struct platform_driver lpi_pinctrl_driver =3D {
> +	.driver =3D {
> +		.name =3D "qcom-hawi-lpass-lpi-pinctrl",
> +		.of_match_table =3D lpi_pinctrl_of_match,
> +		.pm =3D pm_ptr(&lpi_pinctrl_pm_ops),
> +	},
> +	.probe =3D lpi_pinctrl_probe,
> +	.remove =3D lpi_pinctrl_remove,

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under revi=
ew,
but since this driver uses lpi_pinctrl_remove() and lpi_pinctrl_probe()
from drivers/pinctrl/qcom/pinctrl-lpass-lpi.c, I wanted to ask about a
potential mutex lifetime issue.

During device unbind, lpi_pinctrl_remove() explicitly calls
mutex_destroy(&pctrl->lock). However, the driver uses devm_pinctrl_register=
()
and devm_gpiochip_add_data(), meaning the pinctrl and gpiochip subsystems
are not unregistered until after remove() returns and devres callbacks exec=
ute.

In this window, the subsystems remain active. Can a concurrent GPIO access
(e.g., from userspace via sysfs/chardev or another driver) invoke callbacks
like lpi_gpio_set() -> lpi_config_set(), which attempt to acquire the
destroyed mutex?

drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_config_set() {
    ...
	guard(mutex)(&pctrl->lock);
    ...
}

The probe error path in lpi_pinctrl_probe() similarly destroys the mutex
via err_pinctrl: while the previously registered pinctrl device (via
devm_pinctrl_register) remains active until devres cleanup.

Should the driver use devm_mutex_init() instead of manual mutex_destroy()
to ensure the mutex outlives the devres-managed subsystem devices?

> +};
> +
> +module_platform_driver(lpi_pinctrl_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720130511.4932=
95-1-prasad.kumpatla@oss.qualcomm.com?part=3D4

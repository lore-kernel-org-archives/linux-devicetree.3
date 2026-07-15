Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376462EF653
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123690; cv=none; b=a5jQ9M5tFkh05toyp79vSI9AIAKmhrX8Rnguyw1aqgswOI2DUtPPoIaqFv2ckLpyVpei3Ek3fDwCEDlXrRPSWWRVclCb0bYwIS1RIhmEMSr3L0IDNUZuW4uxISpRy00hM8H2P4uqem2D0VzFO2mUKTfN+bOq0LjezHer0MUxWRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123690; c=relaxed/simple;
	bh=bBw48diXwFOK38Dx6gxtIuLa5+zeklxvuiTnL2WNOTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gM54BfCkyrOnMOeclkVfWKtXAbChFKZ69QijlvludAnnx6A4S2KMVReDnygXLFxHRiVr5hPm92RB2HCb1sQ6ARn1g6BJoEZ8hDz62ZYesTuiGp0BpwbNZVHMIN/HWrf1QI7QxIfVdlho4YgCD0b13MPW0bQnjmYiUTf0+DWcJyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO3Vohjd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO3Vohjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C656F1F000E9;
	Wed, 15 Jul 2026 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123688;
	bh=Y44OoswXjN65vjW189sEfT92BvHEadjhRrasP8g9XjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mO3VohjdqjMFyIPYosxlFXqb7pjl/Z9MlaIva1YIMmTLLfG879I+XH50Q7PSv6fao
	 N0QYwqThApCdKgnbhK1Pe4hSYf/ieTFjrFN1r45qe6oLGJAF6HFx9LyDJh1Cp/E8EN
	 DSlmDFks5X7pLTrmVCav+IFcPA5tG7pIK+l9l6le9QqnXUwn1mYj2xmxnwyFiCDXdD
	 syo94vabudCNthbyiveGFOa2EurLwF0zIdXQtnh1No1+MntHPv2SDfuUkOLXgJ1lvc
	 7zO6M5Pj4M2bMgEzkuMT/S6y1f+FVq/AG0NzsTO8YvXZ9PnazhLbuhwTsYc048MiEu
	 k3pTH9/0GXiMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS
 LPI TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715133243.3170821-5-prasad.kumpatla@oss.qualcomm.com>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
 <20260715133243.3170821-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:54:47 +0000
Message-Id: <20260715135447.C656F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Functions like `lpi_gpio_read()` and `lpi_gpio_set_mux()` incorrec=
tly return the result of `pm_runtime_put_autosuspend()`, leading to spuriou=
s `-EAGAIN` failures during concurrent access.
- [High] The driver destroys its mutex in `lpi_pinctrl_remove()` and the er=
ror path of `lpi_pinctrl_probe()`, but relies on delayed `devm` teardown to=
 unregister the pinctrl and gpiochip devices, creating a window where callb=
acks can access the destroyed mutex.
--

--- Patch [4]: [PATCH v3 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS=
 LPI TLMM ---
commit b206b5a7cb05f8fc2d4dea4f8c7ff6d338891d30
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

    pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
   =20
    Add pin controller driver for the Low Power Audio SubSystem (LPASS)
    Low Power Island (LPI) of Qualcomm Hawi SoC.
   =20
    The controller has 23 GPIOs with SoundWire, I2S, DMIC, VA I2S,
    ext_mclk1 and slimbus mux functions.
   =20
    Two pins (gpio13, gpio22) require 6 mux slots due to a test_bus
    entry occupying a middle hardware slot. Add LPI_PINGROUP6 macro
    to pinctrl-lpass-lpi.h to support pins with 5 alternate functions.

> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinc=
trl/qcom/pinctrl-hawi-lpass-lpi.c
> new file mode 100644
> index 0000000000000..7036bf4c66920
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

[ ... ]

While reviewing this new driver, I noticed a couple of pre-existing issues =
in
the core driver code that this driver uses:

drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_gpio_read() {
    ...
    lpi_gpio_read_reg(state, pin, addr, val);

    return pm_runtime_put_autosuspend(state->dev);
}

[Severity: High]
This is a pre-existing issue, but does this cause spurious failures?

If multiple threads access the pinctrl device concurrently, for example if a
consumer holds a PM reference via pm_runtime_resume_and_get(), calling
pm_runtime_put_autosuspend() drops the usage counter but it remains greater
than zero. The PM core intentionally returns -EAGAIN in this scenario.

Returning this value causes lpi_gpio_read() to falsely report a failure back
to the consumer despite a successful hardware read. The same pattern is also
present in lpi_gpio_set_mux() and lpi_config_set().

I also noticed this in the probe and remove paths:

drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_pinctrl_probe() {
    ...
    ret =3D devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
    if (ret) {
        dev_err(pctrl->dev, "can't add gpio chip\n");
        goto err_pinctrl;
    }
    return 0;

err_pinctrl:
    mutex_destroy(&pctrl->lock);
    return ret;
}

And similarly during removal:

drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_pinctrl_remove() {
    struct lpi_pinctrl *pctrl =3D platform_get_drvdata(pdev);
    int i;

    mutex_destroy(&pctrl->lock);

    for (i =3D 0; i < pctrl->data->npins; i++)
        pinctrl_generic_remove_group(pctrl->ctrl, i);
}

[Severity: High]
This is a pre-existing issue, but does destroying this mutex before devres
cleanup create a race condition?

The pinctrl and gpiochip devices are registered using devm_ calls, meaning
they remain active until lpi_pinctrl_probe() or lpi_pinctrl_remove() returns
and the driver core executes devres cleanup. If a concurrent operation invo=
kes
a callback like lpi_gpio_set_mux() during this window, it could attempt to
lock the destroyed mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715133243.3170=
821-1-prasad.kumpatla@oss.qualcomm.com?part=3D4

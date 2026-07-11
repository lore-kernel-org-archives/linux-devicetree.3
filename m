Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3C2989B5
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789604; cv=none; b=c9pPIg1RdDeMJUEN8rXNC9m5SKhEsEKxJdqOmuuy9w7MVo8vSKtVXdnl0FSTbHEhugK0KtuEFuOs+r6Z8I2PWlM1t7lg11zj5qpZFWru0MdNzjBPkyimNbFnJbIu6w2E9xjkKNu6kP014sjT+Xnxi0xI76C9NdZ9OSthygMTeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789604; c=relaxed/simple;
	bh=7sTmTnptkACXFPfnlub7+Ga5CpXeQFg5kmy1aPQ5rFA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMQ/Ms4ljsb4YgytcIdb9cr4nbK40NoZSXnoIZmvbh03JNHuQcWr/EdO5rPHCXuPjgAyOCTUUnWmJaqvT2jKS9qD2nT6U2cWbYfvHcAt3gPPncEx2vU0g9t8m9HRKfbgTxccN9FkRsxQTpvExFsbdVqTBYAfTe/x1U7NLxIq+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Px7aHcjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Px7aHcjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9A61F000E9;
	Sat, 11 Jul 2026 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789603;
	bh=wUWDYIcY8F+g78dToxDQA4HnGeV4QLeONGfJJppqmkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Px7aHcjp+dolpK2Gkn9set6hhP5c6rlLmQyRQ1s3Rdx74pEAToTJPykizaUaBHEtI
	 XwQZ3JEhRiUOJ3YyVwhSXpbv5QOaQmlV+5F3jGNzuGURTVWBvRw1YeEZtcK9dMlto+
	 a3KIvxmyTzt2eev+onRmDvji91AMioGJJp47zpJldhxPPSWJRp9KPuXXGW9RLDSd48
	 y5ocyzjZ33XOmLd4nW7wy+iMzSe59Jmy38uv4tJR62+aV/Up+bDwroHGik+NEPEuma
	 X/mhedbyDeen0a1mMe5rEH00uD3flB/aHqGo3eC1XJEsOItlJaTonhE3on5AV3rMoK
	 PliJ40/E0Qx/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] phy: cpcap-usb: add DCP detection and make UART
 idle mode optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260711164754.185565-4-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
 <20260711164754.185565-4-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 17:06:42 +0000
Message-Id: <20260711170642.BA9A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] `cpcap_usb_set_idle_mode()` unconditionally sets `CPCAP_BIT_DMPD_S=
PI` and `CPCAP_BIT_DPPD_SPI`, overriding hardware pulldowns and breaking su=
bsequent charger detection.
- [Medium] The `cpcap_usb_set_dcp_mode` function fails to fully configure t=
he PHY registers, leaving them in a non-deterministic state.

Pre-existing issues:
- [High] A TOCTOU race condition exists between the IRQ handler thread and =
`cpcap_usb_phy_remove`, leading to a use-after-free of the `ddata` structur=
e.
--

--- Patch [3]: [PATCH v4 3/6] phy: cpcap-usb: add DCP detection and make UA=
RT idle mode optional ---
commit ccdf9470fbb5fbd414c5546a329d78f69ecf50b7
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

phy: cpcap-usb: add DCP detection and make UART idle mode optional

Handle DCP separately from USB host connections using CPCAP charger
detection status. Make the existing idle UART mode optional via the
enable_uart module parameter. Also initialize the PHY into the baseline
configuration required for reliable charger detection during probe.

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/=
phy-cpcap-usb.c
> index 7cb020dd3423c..d4eb8086b6000 100644
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c
[ ... ]
> @@ -411,43 +446,84 @@ static int cpcap_usb_gpio_set_mode(struct cpcap_phy=
_ddata *ddata,
[ ... ]
> +static int cpcap_usb_set_idle_mode(struct cpcap_phy_ddata *ddata)
> +{
> +	int error;
> +	unsigned int val;
> +	bool enable_uart =3D cpcap_enable_uart;
> +
> +	error =3D cpcap_usb_set_safe_mode(ddata);
> +	if (error)
> +		return error;
> +
>  	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC1,
> +				   CPCAP_BIT_DP150KPU |
> +				   CPCAP_BIT_DP1K5PU |
> +				   CPCAP_BIT_DM1K5PU |
> +				   CPCAP_BIT_DPPD |
> +				   CPCAP_BIT_DMPD |
>  				   CPCAP_BIT_VBUSPD,
> +				   CPCAP_BIT_DP150KPU |
>  				   CPCAP_BIT_VBUSPD);
>  	if (error)
>  		goto out_err;
> =20
> -	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC2,
> -				   0xffff, CPCAP_BIT_UARTMUX0 |
> -				   CPCAP_BIT_EMUMODE0);
> +	val =3D CPCAP_BIT_USBSUSPEND;
> +
> +	if (enable_uart)
> +		val |=3D (CPCAP_BIT_UARTMUX0 | CPCAP_BIT_EMUMODE0);
> +
> +	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC2, 0xffff, val);
>  	if (error)
>  		goto out_err;
> =20
> -	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC3, 0x7fff,
> -				   CPCAP_BIT_IDPU_SPI);
> +	val =3D CPCAP_BIT_VBUSSTBY_EN |
> +	      CPCAP_BIT_VBUSPD_SPI |
> +	      CPCAP_BIT_DMPD_SPI |
> +	      CPCAP_BIT_DPPD_SPI |
> +	      CPCAP_BIT_PU_SPI |
> +	      CPCAP_BIT_IDPU_SPI |
> +	      CPCAP_BIT_ULPI_SPI_SEL;
> +
> +	if (!enable_uart)
> +		val |=3D CPCAP_BIT_SUSPEND_SPI;
> +
> +	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC3, 0x7fff, val);

[Severity: High]
Does setting CPCAP_BIT_DMPD_SPI and CPCAP_BIT_DPPD_SPI here break charger
detection?

Writing this value to USBC3 unconditionally sets both DMPD_SPI and DPPD_SPI=
 to
1. This overrides the hardware pulldowns and forces them off. The original
code correctly cleared these bits, and as noted in cpcap_usb_init_usb(),
disabling these pulldowns can break subsequent charger detection when the
cable is disconnected.

>  	if (error)
>  		goto out_err;
> =20
[ ... ]
> @@ -508,6 +583,31 @@ static int cpcap_usb_set_usb_mode(struct cpcap_phy_d=
data *ddata)
>  	return error;
>  }
> =20
> +static int cpcap_usb_set_dcp_mode(struct cpcap_phy_ddata *ddata)
> +{
> +	int error;
> +
> +	error =3D cpcap_usb_set_safe_mode(ddata);
> +	if (error)
> +		return error;
> +
> +	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC3,
> +				   CPCAP_BIT_SUSPEND_SPI, 0);
> +	if (error)
> +		goto out_err;

[Severity: Medium]
Does cpcap_usb_set_dcp_mode() need to configure USBC1 and USBC2 as well?

Because this only updates USBC3, it seems to inherit whatever state was left
by the previous mode. For example, if transitioning from USB mode, USBXCVREN
in USBC2 might remain set. If transitioning from IDLE mode with
enable_uart=3D1, UARTMUX0 might remain set, leaving the UART connected to t=
he
data lines during charging.

> +
> +	error =3D cpcap_usb_gpio_set_mode(ddata, CPCAP_DM_DP);
> +	if (error)
> +		goto out_err;
> +
> +	return 0;
> +
> +out_err:
> +	dev_err(ddata->dev, "%s failed with %i\n", __func__, error);
> +
> +	return error;
> +}
> +
[ ... ]
> @@ -688,17 +849,13 @@ static int cpcap_usb_phy_probe(struct platform_devi=
ce *pdev)
>  static void cpcap_usb_phy_remove(struct platform_device *pdev)
>  {
>  	struct cpcap_phy_ddata *ddata =3D platform_get_drvdata(pdev);
> -	int error;
> =20
>  	atomic_set(&ddata->active, 0);
> -	error =3D cpcap_usb_set_uart_mode(ddata);
> -	if (error)
> -		dev_err(ddata->dev, "could not set UART mode\n");
> -
> +	cancel_delayed_work_sync(&ddata->detect_work);
> +	cpcap_usb_set_idle_mode(ddata);
>  	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
> =20
>  	usb_remove_phy(&ddata->phy);
> -	cancel_delayed_work_sync(&ddata->detect_work);
>  	regulator_disable(ddata->vusb);
>  }

[Severity: High]
This is a pre-existing issue, but is there a TOCTOU race condition between
cpcap_phy_irq_thread() and cpcap_usb_phy_remove() that can result in a
use-after-free?

If the IRQ thread reads ddata->active as 1 in cpcap_phy_irq_thread() and ge=
ts
preempted:

cpcap_phy_irq_thread() {
    if (!atomic_read(&ddata->active))
        return IRQ_NONE;
    /* preempted here */

And cpcap_usb_phy_remove() completes, setting ddata->active =3D 0, cancelin=
g the
work, and allowing devres to free ddata:

cpcap_usb_phy_remove() {
    atomic_set(&ddata->active, 0);
    cancel_delayed_work_sync(&ddata->detect_work);
    ...
}
/* devres frees ddata */

Could the IRQ thread then resume and call schedule_delayed_work() on the fr=
eed
ddata?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711164754.1855=
65-1-ivo.g.dimitrov.75@gmail.com?part=3D3

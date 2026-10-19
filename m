Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD414973B1
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403466; cv=none; b=BbRSjud1z1L3JxtNai+QB85q/ekVnlkZS/k6H20NfMMAGl57KLdIcldIW5dKxcxvcaodc9X3MbnMyGdHdbsfNz3DdFalP2uRyNXasPBazo6YmjJzRXiODWzkPetVVt7sGbc0xq/Ydl2gOZPn+dB4COkNmAdGATmiovHLnOAxKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403466; c=relaxed/simple;
	bh=twd4ESDMdOTm4p6z3G2BkWCb2L7jcQ0Y5bNkRtBLZuU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CyMz1QuJjMfuxqLVqd2aWpFO1UUlszcGO9DccEvWqeOZZfh7ZfLCey7wIV+6LDMZ+UwSmUANal8f3567uUrF43jMsGucms2ejXt9rALtVkMDRYnDRNQthDCrh6oNRiw1oqEu62v8P4BJzTfaiIknB9injP8tBYurWwCIc7KlBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evWvS/Nw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evWvS/Nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0BE1F000C4;
	Mon, 19 Oct 2026 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403464;
	bh=Ps3JS0NxryyNrBFAzrnTCPvhywc41fVPhC4r6YGTp/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=evWvS/Nwvp5S6ld6ulDtSRNX7iYIoI0dq3dHqgAUiRLfPmLkvXC6WeNg5cRykNP5v
	 +DGh+PnQL2bTcnupifB1oB71uHI3v4EYeoUliTpgro+S4/wtCBTvpaqKC+d+Rboh3p
	 pbqUidg+nbjDGD15K99eYgQdnPEOjCPTVva1cyFN0tXw+pyT6jQnboarTKTabuGHX2
	 rXCt1hCjbGr+pPzuKpU49GUSmtyVBvaRkEFB+BsDGaxkuzyc0SFUVl1FFV87/T0yKT
	 NMqzMFKpPhA648Qq1vGWK8brX3Dde/CkvRbR7mUeAOCUU3k2NYXLJqWLinrENhBoDl
	 MOTVMyyd004OA==
Message-ID: <sashiko-outbox-176920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] power: sequencing: qcom-wcn: support SW_CTRL
 wake
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019093911.3199891-3-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-3-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 09:51:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] power: sequencing: missing wake IRQ trigger type in pwrseq_qcom_wc=
n_probe()
--

commit 67f02e162090cebd2a43e112d0d0073d05afbfee
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

power: sequencing: qcom-wcn: support SW_CTRL wake

When the WCN PMU is marked with the wakeup-source property, this commit
requests the SW_CTRL GPIO as an input, maps it to an IRQ, and registers
it as a dedicated wake IRQ.

> diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/s=
equencing/pwrseq-qcom-wcn.c
> index 636dd7e638917..69b7eb565996e 100644
> --- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
> +++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c

[ ... ]

> @@ -526,6 +535,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_dev=
ice *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
>  				     "Failed to get the Bluetooth enable GPIO\n");
> =20
> +	if (device_property_read_bool(dev, "wakeup-source")) {
> +		swctrl_gpio =3D devm_gpiod_get(dev, "swctrl", GPIOD_IN);
> +		if (IS_ERR(swctrl_gpio))
> +			return dev_err_probe(dev, PTR_ERR(swctrl_gpio),
> +					     "Failed to get the SW_CTRL GPIO\n");
> +
> +		wake_irq =3D gpiod_to_irq(swctrl_gpio);
> +		if (wake_irq < 0)
> +			return dev_err_probe(dev, wake_irq,
> +					     "Failed to get the SW_CTRL wake IRQ\n");
> +
> +		ret =3D devm_device_init_wakeup(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to enable wakeup\n");
> +
> +		ret =3D dev_pm_set_dedicated_wake_irq(dev, wake_irq);

[Severity: High]
Does wake_irq need an IRQ trigger type configured via irq_set_irq_type()
before calling dev_pm_set_dedicated_wake_irq()?

In pwrseq_qcom_wcn_probe(), gpiod_to_irq() maps swctrl_gpio through
gpiochip_to_irq() in drivers/gpio/gpiolib.c with IRQ_TYPE_NONE:

    spec.fwnode =3D domain->fwnode;
    spec.param_count =3D 2;
    spec.param[0] =3D gc->irq.child_offset_to_irq(gc, offset);
    spec.param[1] =3D IRQ_TYPE_NONE;

    return irq_create_fwspec_mapping(&spec);

Then dev_pm_set_dedicated_wake_irq() calls
__dev_pm_set_dedicated_wake_irq() in drivers/base/power/wakeirq.c, which
requests the threaded IRQ without any IRQF_TRIGGER_* flags:

    err =3D request_threaded_irq(irq, NULL, handle_threaded_wake_irq,
                               IRQF_ONESHOT | IRQF_NO_AUTOEN,
                               wirq->name, wirq);

In __setup_irq() in kernel/irq/manage.c, because both new->flags and
irqd_get_trigger_type() have trigger type 0 (IRQ_TYPE_NONE),
__irq_set_trigger() is never called:

    if (!shared) {
        /* Setup the type (level, edge polarity) if configured: */
        if (new->flags & IRQF_TRIGGER_MASK) {
            ret =3D __irq_set_trigger(desc,
                                    new->flags & IRQF_TRIGGER_MASK);

            if (ret)
                goto out_unlock;
        }

On Qualcomm TLMM in drivers/pinctrl/qcom/pinctrl-msm.c, msm_gpio_init()
initializes GPIO IRQs with IRQ_TYPE_NONE and handle_bad_irq:

    girq->default_type =3D IRQ_TYPE_NONE;
    girq->handler =3D handle_bad_irq;

Without .irq_set_type() being invoked, the hardware trigger registers in
TLMM/PDC/MPM or SPMI PMIC GPIO are not programmed, and the flow handler on
TLMM remains handle_bad_irq when dev_pm_arm_wake_irq() enables wake_irq
during system suspend.

Other callers combining gpiod_to_irq() with
dev_pm_set_dedicated_wake_irq(), such as pci_configure_wake_irq() in
drivers/pci/of.c and stm32_add_pcie_port() in
drivers/pci/controller/dwc/pcie-stm32.c, call irq_set_irq_type() first.

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to set the SW_CTRL wake IRQ\n");
> +
> +		ret =3D devm_add_action_or_reset(dev,
> +					       pwrseq_qcom_wcn_clear_wake_irq, dev);
> +		if (ret)
> +			return ret;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019093911.3199=
891-1-linghui.wu@oss.qualcomm.com?part=3D2

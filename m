Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DD3FDC18
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420176; cv=none; b=cpqmPbeGZGbdzaL2PAAwit/UT3jRMLzPyORLsRx7JDeemsTDgbamI5m2G0xOq89xfREXf5h/2lscwF5b0Y4Nk/VWPXCuzkSRQNuZF/68gMdjUGMR2T0Tyi6h4SjjJnsaxY8f8QcBXwUHcZvyWkQA2blo+L+wpQ8s7aECWWARwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420176; c=relaxed/simple;
	bh=MqLbTjQhpxiiqfYhRnZfBj1sHHN1SD+FEPJHmbidvfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tBBH3Dle4aOmKc/U+svlVPdUUis5edouHCB6zmM2i+yDDXBT+MvxInfaAXOtfJX31HrWaSL9z7bQbXiWi2l27iOeowVL2qx73wozrfpDF7jBLItlGWyawnoMrA3wN9DQyYcGBDtzd3zVJlS0I/3xTomw4nVxtpa65aFMc1naTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4LPmMgV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4LPmMgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD7F1F000E9;
	Thu,  3 Sep 2026 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788420170;
	bh=SF0+A7cn+E1JW3LeFKzx0JCcr2Tr+DnLNix0KRv1wXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4LPmMgVSSn4NMqFvR2esv3SueIaeHG9sXX3VcJ3gRFpARpYK/aF3YgNncQDfd0DO
	 aQNndfCZdRbLm9okq4FAOKZuVFBp6gvTKSS3zej5m3bR8MeyrxXi6RgGuOJ2H8oEsE
	 LDzJNI8vEJetKzg4zl3QcbShgmWQyNyIe7/+9JaP2G5atEvHZXskM9Ip/crnMp6xQR
	 vk8xSfKY1m6qToZq3CV+VeLXogu6ibfMOXQPBssPi5ZnbPAuQtongZCUVY19ZHtyLA
	 ugKmzCrrugI9teZKRjD79D8w9Vz/A9iI6YtMNkr9/QgqiXgfc6rQYpX1LQdfWbcmwb
	 M/MmyyDKjclHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] gpio: axiado: add AX3005 SGPIO controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-axiado-ax3000-sgpio-controller-v3-2-b30820e1b858@axiado.com>
References: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
 <20260903-axiado-ax3000-sgpio-controller-v3-2-b30820e1b858@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:22:49 +0000
Message-Id: <20260903072249.CDD7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IRQ domain is instantiated and published before the driver's i=
nternal state (`sgpio->gpio`) is fully initialized, allowing concurrent IRQ=
 requests to cause a NULL pointer dereference.
--

commit 4babc207a066bfa307e830995ecabfdcf12404d1
Author: Petar Stepanovic <pstepanovic@axiado.com>

gpio: axiado: add AX3005 SGPIO controller support
   =20
Add support for the Axiado AX3005 SGPIO controller.
   =20
Each SGPIO position provides one input GPIO and one output GPIO with
fixed directions. The driver registers the controller as a gpio_chip,
supports interrupts on input GPIOs, and uses regmap for register access.

> diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-=
sgpio.c
> new file mode 100644
> index 0000000000000..a7c970217c59e
> --- /dev/null
> +++ b/drivers/gpio/gpio-axiado-sgpio.c
[ ... ]
> +static int axiado_sgpio_irq_request_resources(struct irq_data *d)
> +{
> +	struct axiado_sgpio *sgpio =3D irq_data_get_irq_chip_data(d);
> +
> +	return gpio_regmap_reqres_irq(sgpio->gpio, d->hwirq);
> +}
[ ... ]
> +static int axiado_sgpio_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	d_info.fwnode =3D dev_fwnode(&pdev->dev);
> +	d_info.size =3D ngpio;
> +	d_info.hwirq_max =3D ngpio;
> +	d_info.ops =3D &axiado_sgpio_domain_ops;
> +	d_info.host_data =3D sgpio;
> +
> +	sgpio->domain =3D devm_irq_domain_instantiate(&pdev->dev, &d_info);
> +	if (IS_ERR(sgpio->domain))
> +		return PTR_ERR(sgpio->domain);
> +
> +	config.parent =3D &pdev->dev;
> +	config.regmap =3D sgpio->regmap;
> +	config.ngpio =3D ngpio;
> +	config.reg_dat_base =3D GPIO_REGMAP_ADDR(sgpio->regs->din_ss);
> +	config.reg_set_base =3D GPIO_REGMAP_ADDR(sgpio->regs->dout_ss);
> +	config.reg_mask_xlate =3D axiado_sgpio_reg_mask_xlate;
> +	config.fixed_direction_output =3D sgpio->dir_out;
> +	config.irq_domain =3D sgpio->domain;
> +	config.drvdata =3D sgpio;
> +
> +	sgpio->gpio =3D devm_gpio_regmap_register(&pdev->dev, &config);

[Severity: High]
Could concurrent IRQ mapping trigger a NULL pointer dereference here?

The IRQ domain is instantiated and published by devm_irq_domain_instantiate=
()
before sgpio->gpio is assigned by devm_gpio_regmap_register().

If a consumer driver probes concurrently and resolves the IRQ via the
device tree, it can call request_irq(), which invokes
axiado_sgpio_irq_request_resources().

That callback will dereference sgpio->gpio before it has been set:

	return gpio_regmap_reqres_irq(sgpio->gpio, d->hwirq);

> +	if (IS_ERR(sgpio->gpio))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sgpio->gpio),
> +				     "Could not register gpiochip\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-axiado-ax3=
000-sgpio-controller-v3-0-b30820e1b858@axiado.com?part=3D2

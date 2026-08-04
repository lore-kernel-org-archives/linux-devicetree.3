Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799E41D136
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826478; cv=none; b=QWZwCwE65g0Re9Pt+tZmDCQQWBZM2WHLDCpZbFuUpQBdNIy6x1A3XgEdAI0i93CwHFE9b1TB4QPBPMj8msMhvLvVH1ALDb5yTTSfG7gWaSA7RN1J1aiGznnjGdlXKB0w7KDcKUD+PrM1PwrfRvg9iSMekuOjtVZVfTvzPKRDNGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826478; c=relaxed/simple;
	bh=glYaO8FKiz5LYX+TVpc16HIDtj2FKNghvt5DURiLIow=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TQ5S6r8yABvkPhq+kwQi0R+25ProacOnqU6T12LeR+B1Qyh/WAb745m/NHpzshli5kwvo0wNFxNraWv/JEx4o6KNBi4nDVYsAVf8CxlSMx2tY6vJ7ODouvnzoDatgGsxF6WIiCEnw44YqzR9JMPWadebZp8Ht3os0UZTCVqd1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByyAxcov; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByyAxcov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458051F000E9;
	Tue,  4 Aug 2026 06:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826476;
	bh=Fg9oCSIupzidkOyps1c+wu4Xw79soRdjh5Q2Z3K1yOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ByyAxcovfFd9DmsSIWaqXodo2XR71jjZ0APBwRilTWMPGhwu+v7OE/uEF5aOom4bX
	 C77Dz1X1HHHhiAFe+VLeJYezOryXqwkbcjAuyc3q87gR8rUhfwh6Ep36TZ9ekii5X/
	 wHDJ66INQcqe7tn0LBhjZLpd6tf4L0p7RVgEQW30pg/VeCmBXf5y3vCWDEAh45Klrf
	 QGLb3BRvzIRGYgB5iZiAAwfK+xgGaoTRhb+giRSwWShp+XWLqp1AAlqScnlEcrVIUJ
	 ntEcReQ/liB1Txb1LLslTcPLO1T3Kt1DMQhBX+9cjXr0Zbck0Nm7etnNWXUqwVI3Rq
	 VxRL1jHFokxow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extcon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE" <contact@alex-min.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-4-149dd4372ac8@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 06:54:35 +0000
Message-Id: <20260804065436.458051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The newly registered platform device 'qcom-pm8xxx-usb-id' violates=
 MFD naming guidelines and will never bind to the intended extcon driver.
- [High] The `usb_extcon` child platform device is unregistered twice, lead=
ing to a use-after-free, and inadvertently leaks the parent PMIC device.

Pre-existing issues:
- [High] The IRQ domain is explicitly destroyed before the devres-managed p=
hysical parent interrupt is freed, leading to a Use-After-Free.
- [High] Missing `irq_domain_remove()` on the `devm_request_irq()` error pa=
th causes the IRQ domain to leak and hold a dangling `host_data` pointer.
--

--- Patch [4]: [PATCH v5 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extc=
on ---
commit 61c97946b38af2a5d88c53960d6a580a045442ed
Author: Alexandre MINETTE <contact@alex-min.fr>
Subject: mfd: qcom-pm8xxx: register PM8921 USB ID extcon

This commit registers a child platform device for the USB extcon driver on
PM8921 after setting up the PMIC IRQ domain. It passes the USB ID interrupt
as a named resource and reuses the PMIC firmware node.

> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index 0cf374c015ce7..884fc99a1488f 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
[ ... ]
> @@ -501,11 +512,60 @@ static const struct of_device_id pm8xxx_id_table[] =
=3D {
>  	{ .compatible =3D "qcom,pm8821", .data =3D &pm8821_data},
> -	{ .compatible =3D "qcom,pm8921", .data =3D &pm8xxx_data},
> +	{ .compatible =3D "qcom,pm8921", .data =3D &pm8921_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
> =20
> +static int pm8xxx_add_usb_extcon(struct platform_device *pdev,
> +				 struct pm_irq_chip *chip,
> +				 unsigned int hwirq)
> +{
[ ... ]
> +	struct platform_device_info pdevinfo =3D {
> +		.parent =3D &pdev->dev,
> +		.fwnode =3D dev_fwnode(&pdev->dev),
> +		.of_node_reused =3D true,

[Severity: High]
Can setting of_node_reused to true lead to a double-free during removal?

When usb_extcon is created with of_node_reused set to true, it shares the
parent PMIC's of_node. The parent's of_node has the OF_POPULATED flag set
by of_platform_populate().

Later, when pm8xxx_remove() calls of_platform_depopulate(), it iterates over
the PMIC's children. Because usb_extcon shares the parent's of_node,
of_platform_device_destroy() will unregister usb_extcon and incorrectly
clear the OF_POPULATED flag from the parent's of_node.

This prevents the bus core from properly depopulating the PMIC later, causi=
ng
the parent PMIC device to leak.

Furthermore, after of_platform_depopulate() returns, pm8xxx_remove()
explicitly calls pm8xxx_remove_usb_extcon(), which invokes
platform_device_unregister() a second time on the already-freed usb_extcon
pointer.

Does this sequence result in a use-after-free crash?

> +		.name =3D "qcom-pm8xxx-usb-id",

[Severity: High]
Will this platform device bind to the target extcon driver?

The target driver for PMIC USB extcon is extcon-qcom-spmi-misc.c, which
matches against the driver name extcon-pm8941-misc or the OF compatible
qcom,pm8941-misc.

Because the device inherits the parent PMIC's qcom,pm8921 compatible and
uses the qcom-pm8xxx-usb-id device name, the driver core will not bind the
extcon driver to this new platform device.

Does this also violate the MFD subsystem naming guidelines which advise
against including the driver's own filename or the string mfd in names?

> +		.id =3D PLATFORM_DEVID_NONE,
> +	};
[ ... ]
> @@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *pdev)
[ ... ]
>  	chip->irqdomain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), da=
ta->num_irqs,
>  						   &pm8xxx_irq_domain_ops, chip);
>  	if (!chip->irqdomain)
>  		return -ENODEV;
> =20
>  	rc =3D devm_request_irq(&pdev->dev, irq, data->irq_handler, 0, dev_name=
(&pdev->dev), chip);
>  	if (rc)
>  		return rc;

[Severity: High]
This is a pre-existing issue, but does this error path leak the newly
created IRQ domain?

In pm8xxx_probe(), irq_domain_create_linear() dynamically allocates an IRQ
domain, registers it in the global domain list, and sets domain->host_data
to the devres-managed chip structure.

If devm_request_irq() fails, the function returns directly without calling
irq_domain_remove().

The IRQ domain remains permanently leaked in the global list, while devres
automatically frees the chip structure.

If another device requests an IRQ mapping on this fwnode, will the system
use the orphaned domain, dereference the freed chip pointer via host_data,
and trigger a use-after-free?

> =20
>  	irq_set_irq_wake(irq, 1);
> =20
> +	if (data->usb_id_irq) {
> +		rc =3D pm8xxx_add_usb_extcon(pdev, chip, data->usb_id_irq);
> +		if (rc)
> +			goto err_domain;
> +	}
> +
>  	rc =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>  	if (rc)
> -		irq_domain_remove(chip->irqdomain);
> +		goto err_extcon;
> +
> +	return 0;
> +
> +err_extcon:
> +	pm8xxx_remove_usb_extcon(chip);
> +err_domain:
> +	irq_domain_remove(chip->irqdomain);

[Severity: High]
This is a pre-existing issue, but is it safe to explicitly destroy the IRQ
domain before the physical parent interrupt is freed?

The physical parent interrupt is managed by devm_request_irq(), meaning it
is only disabled and freed later during the devres cleanup phase, after the
probe function has already returned.

If the physical interrupt fires in the window between this
irq_domain_remove() call and the devres cleanup, pm8xxx_irq_handler() will
execute and attempt to call generic_handle_domain_irq() on the freed domain
pointer.

Could this trigger a use-after-free crash?

> =20
>  	return rc;
>  }
> @@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device *pde=
v)
>  	struct pm_irq_chip *chip =3D platform_get_drvdata(pdev);
> =20
>  	of_platform_depopulate(&pdev->dev);
> +	pm8xxx_remove_usb_extcon(chip);
>  	irq_domain_remove(chip->irqdomain);

[Severity: High]
This is a pre-existing issue, but does destroying the IRQ domain here
create a similar use-after-free risk during device removal?

Just like in the probe error path, the physical parent interrupt is managed
by devm_request_irq() and remains active while irq_domain_remove() is
called.

If the interrupt fires before devres cleans up the IRQ, could it result in a
use-after-free when handling the interrupt?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mainline-s=
end-v1-sending-v5-0-149dd4372ac8@alex-min.fr?part=3D4

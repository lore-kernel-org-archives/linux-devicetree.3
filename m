Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696D3F9F4D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002335; cv=none; b=FeYy75zX83NvRTpByR8SAHBErAJNc6hrtwMcTp97E9+eYuNMstwMEElOzC8bsvdr/OKiZ9CazT4MRqZRutsRZBWs0BoptduJOaQHFXDSUDoJv8MLAsF+96V0aCtCMnFqbTf1pLULPuEvUnV8vJsedUbJ6+hZBk5KFCIa3hlKC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002335; c=relaxed/simple;
	bh=uMPoCMqCT+TVj4ShMmkXgxWAZjC6jZw+xaxb6FmCr04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LBLx/1cilh1H0hwlApFA54IsXHvNy+BLLQIoo9zVIS7VyR7ikjvndLBrMsSueoacGj5YpxNiOeN2cKDs6zpoS9okznFPdgUTm1GiQrKw9Cb3fjN9DH/jJZafVt6TXhNj1mIhJqdKzLzXtIfeU/oC2M2t/Xgtb2yt5EVGMCr/qRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFnVMlhF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFnVMlhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE521F0089B;
	Tue,  9 Jun 2026 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002334;
	bh=nydhIJ1Jgtcl+ndnm7dENx7Xe5XTNPyC+9zG2xnTYQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFnVMlhFp+Nii8V3M08oz+bXQVJ+QQgUtZ6wDiURPCnZaGgJv6yUiNWACxauMcoFJ
	 efS+XenANaIJQ5813dmnKD8AKF7X5SAJ4NRjN/JCcF7YTF7vi7fdq9XRcX+8SgHL96
	 af2ecF8iie/Hbd7RZ1IYc7l3wM6smdzn28rWkf816xK20pr26/rj2jRlE2wAo9Swud
	 D1EoONm0sBJpqdBWNbKH0wd9wLnFL7LAT/muREqOtYYqtem4FLUwoTyjbUZTGBl6jy
	 8VNupgh8o3DqinSkvdkCrktB7XSOQJ0HUuLJ0OrzeuVnin3wT7zBbWyClJeGLWWfxg
	 CIYpTSxckfqFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extcon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-mainline-send-v1-sending-v4-4-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-4-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:52:12 +0000
Message-Id: <20260609105213.CCE521F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The dynamically registered child platform device 'usb_extcon' is u=
nregistered twice during driver removal, resulting in a use-after-free and =
double free.

Pre-existing issues:
- [High] The IRQ domain is freed explicitly while the devm-managed parent I=
RQ handler is still active, leading to a potential use-after-free if the in=
terrupt fires before devres cleanup finishes.
--

commit c974699adaea81fa53001bda7b03087f8ea67b97
Author: Alexandre MINETTE <contact@alex-min.fr>
Date:   Tue Jun 9 08:13:47 2026 +0000

mfd: qcom-pm8xxx: register PM8921 USB ID extcon

This commit registers a child platform device for the USB ID interrupt on
PM8921 to act as an extcon provider. It shares the PMIC's devicetree node
and cleans up the child device upon driver removal or probe failure.

> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index 0cf374c015ce7..884fc99a1488f 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
[ ... ]
> @@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *pdev)
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
> =20
>  	return rc;
>  }
> @@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device *pde=
v)
>  	struct pm_irq_chip *chip =3D platform_get_drvdata(pdev);
> =20
>  	of_platform_depopulate(&pdev->dev);
> +	pm8xxx_remove_usb_extcon(chip);

[Severity: High]
Does this cause a double-free of the usb_extcon platform device?

When of_platform_depopulate() runs, it iterates over all children and invok=
es
of_platform_device_destroy(). Because usb_extcon is registered with
pdevinfo.of_node_reused =3D true and shares the parent's of_node (which has=
 the
OF_POPULATED flag set), of_platform_device_destroy() will assume it created
the device and unregister usb_extcon.

Calling pm8xxx_remove_usb_extcon() immediately afterward will call
platform_device_unregister() on the already freed usb_extcon pointer,
resulting in a use-after-free.

>  	irq_domain_remove(chip->irqdomain);

[Severity: High]
This is a pre-existing issue, but does this explicitly free the IRQ domain
while the parent interrupt handler is still active?

In pm8xxx_probe(), the parent interrupt is requested via devm_request_irq().
This means the devres cleanup mechanism won't free the IRQ until
devres_release_all() runs, which happens after pm8xxx_remove() completes.

If a hardware interrupt triggers during the window between this
irq_domain_remove() call and devres cleanup, will pm8xxx_irq_handler() call
generic_handle_domain_irq() and dereference the freed chip->irqdomain?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-mainline-s=
end-v1-sending-v4-0-83768fbf404d@alex-min.fr?part=3D4

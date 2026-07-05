Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64C36492C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239080; cv=none; b=PFrFb2XM0FyXcAKxpVgxdHXc7IiHt4W7ghCiR+iQJlVteAvOy0siHUjUpgmUqu0ksdHwMxgweZwGgTJqM6r3KLqEAwuhmCEoY4MfQVV2Kef5aIsxD8CJWTCrpxCzMlT9PtqAdSRM445bnh/uvnY/hROd9RVA0jCyzBH3HswoGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239080; c=relaxed/simple;
	bh=a196S0hbo3CUORhaD1jXa5J2HZoQ129tgT7e0UVK6L0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RH9oF1DVCx6384UOfVFSrwPrtwsDBp2F+v3V+K3YGQvP+gNYpeZkorU+T0nG5ygonqyMalL1OhaPUN4OZ2vxzqJo5whO1AV8nZmAtpGKSrRMzPY8N4q03OXy7CMbkUAp+3RZx4LPWxsRSa2V8O59bQT3xxUN07eTggSNm5f56R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpxC8oE7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpxC8oE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEFB1F000E9;
	Sun,  5 Jul 2026 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783239078;
	bh=E2cM6Kpq0UOPf89FzkSY9/2JBmy6n1whs04H4LNgR3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UpxC8oE7dTIfmfWiVTjuy38GbTUrtrxwerhK0pMxphSjzpA2+4nZuvCb5rdLtgWMW
	 XtjY3RoJSnQEnl5tei+JoWbdpvnO0xIHReTD68J+vsWcWbAQlKy8KhivhsrEt1l3w3
	 dYoZ+3SftI8M1/dCe+ZrmYWVGCNWu1WLpEEA5FkIeWd/RMlF6xQl+2wHSn8PFTTNXr
	 BEtlyP2cmg9guj2L6WGBGN6wyhGLN+eeO+kFAs+5TaCeXUzZG3sijrwH92AJ9O12Br
	 3pS415W6ghum6VckY7J5yGphM1Cd2WQP+hw0L/w/r7j1Qf/RNYWx9C/+stWG9jUU4P
	 U1kEqEEagxSHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] phy: cpcap-usb: add extcon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260705075809.1793784-6-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
 <20260705075809.1793784-6-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 08:11:17 +0000
Message-Id: <20260705081118.5EEFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing Kconfig dependency on CONFIG_EXTCON causes linker errors o=
r breaks USB probe entirely if Extcon is disabled or built as a module.

Pre-existing issues:
- [High] Race condition between module removal and the threaded IRQ handler=
 can lead to a use-after-free of `ddata`.
- [High] Booting with a USB cable or charger already attached prevents the =
driver from detecting the connection.
--

commit 85bc183819335614278666a8396810aa855aa0d7
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

phy: cpcap-usb: add extcon support
   =20
Register an Extcon device and report the detected cable state.
The driver already determines the type of cable attached during USB cable
detection. Export the detected state through the Extcon framework so
other drivers can consume it using a standard kernel interface.

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/=
phy-cpcap-usb.c
> index e776e54bbfd56..f1f2fe8183241 100644
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c
[ ... ]
> @@ -345,6 +400,8 @@ static void cpcap_usb_detect(struct work_struct *work)
>  		if (ddata->mode =3D=3D CPCAP_USB)
>  			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
> =20
> +		cpcap_usb_set_extcon(ddata);
> +
>  		return;
>  	}

[Severity: High]
This is a pre-existing issue, but does the early return logic just above th=
is
section prevent the driver from detecting a cable connected at boot time?

Looking earlier in cpcap_usb_detect():

	if (vbus && ddata->mode !=3D CPCAP_USB_HOST) {
		enum cpcap_mode new_mode;

		if (!s.chrg_det || !s.sessvld || ddata->mode !=3D CPCAP_IDLE)
			return;

At probe, ddata->mode is initialized to CPCAP_UNKNOWN. If a cable is already
attached when the device boots, vbus is valid. The condition checks if
ddata->mode !=3D CPCAP_IDLE, which evaluates to true because the mode is se=
t to
CPCAP_UNKNOWN.=20

This causes an early return without updating the mode or rescheduling the
work, which seems to leave the USB connection undetected.

[ ... ]
> @@ -785,7 +843,18 @@ static int cpcap_usb_phy_probe(struct platform_devic=
e *pdev)
>  	if (!otg)
>  		return -ENOMEM;
> =20
> +	ddata->edev =3D devm_extcon_dev_allocate(&pdev->dev, cpcap_extcon_cable=
s);
> +	if (IS_ERR(ddata->edev)) {
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ddata->edev),
> +				     "failed to allocate extcon device\n");
> +	}
> +
> +	error =3D devm_extcon_dev_register(&pdev->dev, ddata->edev);
> +	if (error < 0)
> +		return error;
> +

[Severity: High]
Does PHY_CPCAP_USB need a Kconfig dependency on CONFIG_EXTCON?

If the driver is built-in but the extcon subsystem is configured as a
module, won't this cause a build failure due to undefined references to
devm_extcon_dev_allocate() and devm_extcon_dev_register()?

Additionally, if the extcon subsystem is completely disabled, the stub
function for devm_extcon_dev_allocate() returns ERR_PTR(-ENOSYS). This
would cause cpcap_usb_phy_probe() to unconditionally fail.

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a race condition during module
removal that could lead to a use-after-free of the ddata structure?

During driver removal, cpcap_usb_phy_remove() sets ddata->active to 0 and
cancels the delayed work:

	atomic_set(&ddata->active, 0);
	cancel_delayed_work_sync(&ddata->detect_work);

However, the IRQ is managed by devm_request_threaded_irq() and remains
active until after the remove function completes. If the threaded IRQ handl=
er
cpcap_phy_irq_thread() reads ddata->active =3D=3D 1 but is preempted before
calling schedule_delayed_work():

	if (!atomic_read(&ddata->active))
		return IRQ_NONE;
=09
	schedule_delayed_work(&ddata->detect_work, msecs_to_jiffies(1));

The remove function could finish, causing devm to free the ddata structure.
When the IRQ thread resumes, it would schedule work using the freed ddata
pointer. Could this be resolved by explicitly disabling the IRQ before
canceling the work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705075809.1793=
784-1-ivo.g.dimitrov.75@gmail.com?part=3D5

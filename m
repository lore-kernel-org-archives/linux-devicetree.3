Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E13242D4
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151508; cv=none; b=diZZzVLc9RLU/g5p7x9Qdg3kSBawQA2JfIHU/+DmEiLXNVIJKVvfqZUI/xvv8LGispovp0BgQdwHc1ZHCSTemchx2LuF2pFS+xHBAnBU1JyFOeokUP/GLIP+A69Y86FgZzFjLpdFJSUzGP0sQtz17Xdvpmbz98QKJn6/SDkSqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151508; c=relaxed/simple;
	bh=WJQPXoV4CX9FxNljrf47UReCgG1FN5PZTqN96BiaKQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pmHkUDwrFQo2A7t/L7BIHqv8KeDVkSrOKpiEAGzMbLdbvq3c7JuwEqm/Ka4ml9cbFgc9iYxS0x+ig5c9UKq9RyTsxiyaiqEx0n6BZWdGjfkeDEFFf9xP11klnAx7SdkonZOqLHiS7phow4AjXkRqS7KFr2vN8GBYy90MJVSexHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+BDokhp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+BDokhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0014E1F000E9;
	Sat,  4 Jul 2026 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783151496;
	bh=nk6nP7hmKCgBnsx+MNVD61Cm7aZyuBzkUCKBoY7kSj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c+BDokhpWiPzgGP+7wIiERr9pI7Jx51Fed5Hpd0TFL8FVQIwTTuuSwF1aqzi3L4mf
	 D9feTB1bOJkXweUq7zKEmTCBqLxjTNVdxmqHEYCFK6JRvHUdqHK1JFIJHme2/aKTR5
	 kvLrycknJl9EByuxn856hP/pDHNp1qsmDK8Z4Nrn7Gj8qmZQQAmmPpz0MHb2jQax+z
	 VvkPN50n3bYSmSFMSgWRvp3h9Rc03p5yoEyl3lz9XR/QNJf3CXAiUo9u4UqtHH3hnm
	 Pg2QWNX54zkRdbze2+ubfb6HRp8ExleIo7ZRBcRR8EJJngVhwbljtJgjUfomEHlfkw
	 0Ixhx2JocRXog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] phy: cpcap-usb: add extcon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260704073843.1750458-6-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
 <20260704073843.1750458-6-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 07:51:35 +0000
Message-Id: <20260704075136.0014E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The EXTCON_USB state is updated using `extcon_set_state` without a=
 corresponding `extcon_set_state_sync` or `extcon_sync`, preventing registe=
red listeners from receiving state change notifications.
- [Medium] Extcon state can become permanently desynchronized from the hard=
ware/software state when regmap updates fail.

Pre-existing issues:
- [High] The driver's remove path races with the devres-managed threaded IR=
Q handler, leading to a Use-After-Free of the driver data structure.
--

commit 5e21d209058ee93304da0e1964b84339cf8709c2
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

phy: cpcap-usb: add extcon support

Register an Extcon device and report the detected cable state.
The driver already determines the type of cable attached during USB cable
detection. Export the detected state through the Extcon framework so
other drivers can consume it using a standard kernel interface.

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/=
phy-cpcap-usb.c
> index 3be2b3afaaf4d..8978a95c1c199 100644
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c
> @@ -123,6 +124,7 @@ struct cpcap_phy_ddata {
>  	struct regmap *reg;
>  	struct device *dev;
>  	struct usb_phy phy;
> +	struct extcon_dev *edev;
>  	struct delayed_work detect_work;

[Severity: High]
This is a pre-existing issue, but does the remove path race with the
devres-managed threaded IRQ handler, leading to a use-after-free of this
driver data structure?

If the devres-managed IRQ thread cpcap_phy_irq_thread() fires and reads
ddata->active as 1, but is preempted before calling schedule_delayed_work():

And then the driver remove path cpcap_usb_phy_remove() executes, sets
ddata->active to 0, cancels any pending work, and returns.

Devres cleanup then begins, calling devm_irq_release() -> free_irq() ->
synchronize_irq(), which blocks waiting for the preempted IRQ thread.

When the IRQ thread resumes, it successfully queues the delayed work and
returns.

Once devm_irq_release() finishes, devres proceeds to free ddata.
The delayed work timer expires and executes cpcap_usb_detect() on the freed
ddata memory.

> [ ... ]
> @@ -226,6 +239,43 @@ static void cpcap_usb_try_musb_mailbox(struct cpcap_=
phy_ddata *ddata,
> [ ... ]
> +static void cpcap_usb_set_extcon(struct cpcap_phy_ddata *ddata)
> +{
> [ ... ]
> +	if (ddata->cable =3D=3D EXTCON_CHG_USB_SDP)
> +		extcon_set_state(ddata->edev, EXTCON_USB, false);
> +	else if (cable =3D=3D EXTCON_CHG_USB_SDP)
> +		extcon_set_state(ddata->edev, EXTCON_USB, true);

[Severity: High]
Does this prevent registered listeners from receiving state change
notifications for EXTCON_USB?

The EXTCON_USB state is updated here using extcon_set_state() without a
corresponding extcon_set_state_sync() or extcon_sync(). When the driver
changes the state to or from CPCAP_USB (which maps to EXTCON_CHG_USB_SDP),
the subsequent extcon_set_state_sync() calls only target the charger cable
ID and its specific notifier chain.

The notifier chain for EXTCON_USB might never be fired.

> +
> +	if (ddata->cable !=3D EXTCON_NONE)
> +		extcon_set_state_sync(ddata->edev, ddata->cable, false);
> +
> +	if (cable !=3D EXTCON_NONE)
> +		extcon_set_state_sync(ddata->edev, cable, true);
> +
> +	ddata->cable =3D cable;
> +}
> [ ... ]
> @@ -356,6 +411,8 @@ static void cpcap_usb_detect(struct work_struct *work)
> [ ... ]
>  	if (ddata->mode =3D=3D CPCAP_IDLE)
>  		return;
> =20
>  	ddata->mode =3D CPCAP_IDLE;
>  	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
> =20
>  	error =3D cpcap_usb_set_idle_mode(ddata);
>  	if (error)
>  		goto out_err;
> =20
> +	cpcap_usb_set_extcon(ddata);
> +
>  	return;
> =20
>  out_err:

[Severity: Medium]
Can the extcon state become permanently desynchronized from the hardware and
software state if a regmap update fails?

Earlier in cpcap_usb_detect(), the internal software state ddata->mode is
updated prior to hardware configuration. If the hardware register update
fails, the code branches to out_err and skips calling
cpcap_usb_set_extcon().

Because ddata->mode is already modified, subsequent executions of
cpcap_usb_detect() will take the early return path and will never retry
updating the extcon state, leaving it stale indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704073843.1750=
458-1-ivo.g.dimitrov.75@gmail.com?part=3D5

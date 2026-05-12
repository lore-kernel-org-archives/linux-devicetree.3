Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA035A398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628592; cv=none; b=lGSr2yvE3/hClhzpb3NmYH7pDFXg18worPGZ0E3V0lvWNUOO58r+uoNr25I2hA4H1ATbtXpXDRAEjpGyMaxOIccx6SmPGT5+GXBa1TAJIDJH2Pad/X0ioDJdntJGNhLrCccw5VREkJhtHc7hQH5vInZw9X6Mu/wGRo6+rCvnlrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628592; c=relaxed/simple;
	bh=UbHYA9GF4XxAF0tQu8MZ7ADSQ5JVALZSiUl2AVdrCi8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dtMLtSynhLzMjTmtHkaFyRTSIwQuLSxWXEkksZgh29m00GbG7iOjgCu64+wEoaL7tcVosGoyO9OUQd4vj6q6xiHKgFY62/YBunshSAJS/d+WY6wfD5QWYMyGB5/wiHaWmKI+9xKw5Okicz8DtrK5ar1SSrQM5GXtoRSSeH45Ujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB539B8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB539B8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03398C4AF0B;
	Tue, 12 May 2026 23:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628591;
	bh=UbHYA9GF4XxAF0tQu8MZ7ADSQ5JVALZSiUl2AVdrCi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OB539B8rLZzgSLh8knYFJhUJFUu07XvVlxg9AH3JbfYCza4YexsOBhrQ7AFhg7kJb
	 CFr6ZOQZ+FBe56terU9SkeN2dyFUbA5HaJYUO9dGQwjqu23HGjovKlCeKdwf7YSKTa
	 hmI7Uzy2jkIxMR9KtcdjgqZVyyKvCks7PCJpKjshQDo9Auvf312UUzM6ZeUwzR3uNZ
	 yHPKPVjGz+qAhZjYKnz2CbOTmfZVLXPKWNbsJqePa+H6ZVElLNPY0T9v7oJaYo6XzX
	 Fn7Yy7MfyAaJ9gis5ora15u0vvLeeywXWYIipGGjniMemNDrhqQBCOfxg+dy7c5K2a
	 cTkTEw3p0F2zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/6] net: usb: Add Infineon XMM6260 Baseband modem
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511135703.62470-5-clamor95@gmail.com>
References: <20260511135703.62470-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:29:50 +0000
Message-Id: <20260512232951.03398C4AF0B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Type confusion and out-of-bounds read in USB notifier callback.
- [High] Hardware teardown in `remove()` races with devres-managed IRQ and =
delayed work.
- [High] Missing synchronization for driver state variables across multiple=
 contexts.
- [High] Delayed work bypasses intended timeout due to incorrect rescheduli=
ng logic.
- [High] Missing Kconfig dependency on RFKILL causes linker errors.
- [Medium] Incorrect error handling for `rfkill_alloc` causes `probe()` to =
succeed on memory allocation failure.
- [Medium] Unbalanced PHY and regulator calls in `remove()` and `set_block(=
)`.
- [Medium] Missing USB disconnect handling stalls the modem's state machine.
--

commit 0ae4ba7bc0acd1df4aeeb4a594adcd61b86ea4a4
Author: Svyatoslav Ryhel <clamor95@gmail.com>

net: usb: Add Infineon XMM6260 Baseband modem support

The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
for smartphones, data cards, and Machine-to-Machine (M2M) applications.

> diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
> index 52a5c0922c79f..503f24a3cfa69 100644
> --- a/drivers/net/usb/Kconfig
> +++ b/drivers/net/usb/Kconfig
[ ... ]
> @@ -642,4 +642,19 @@ config USB_RTL8153_ECM
>  	  CONFIG_USB_RTL8152 is not set, or the RTL8153 device is not
>  	  supported by r8152 driver.
> =20
> +config USB_NET_XMM6260
> +	tristate "Infineon XMM626X Baseband HSPA/HSUPA modem"
> +	depends on GPIOLIB && OF && USB_CHIPIDEA

Should this configuration also depend on RFKILL || RFKILL=3Dn?

Since the driver calls exported RFKILL functions like rfkill_alloc and
rfkill_register unconditionally, building this driver as built-in while
RFKILL is built as a module might cause linker errors.

> +	help
> +	  Select this if you want to use an Infineon XMM626X modem, found in
[ ... ]
> diff --git a/drivers/net/usb/baseband-xmm6260.c b/drivers/net/usb/baseban=
d-xmm6260.c
> new file mode 100644
> index 0000000000000..658f5351fab7e
> --- /dev/null
> +++ b/drivers/net/usb/baseband-xmm6260.c
[ ... ]
> +static int baseband_xmm_usb_notifier_call(struct notifier_block *nb,
> +					  unsigned long action, void *data)
> +{
> +	struct baseband_xmm_data *priv =3D
> +		container_of(nb, struct baseband_xmm_data, nb);
> +	struct usb_device *udev =3D data;
> +	u16 product =3D le16_to_cpu(udev->descriptor.idProduct);
> +	u16 vendor =3D le16_to_cpu(udev->descriptor.idVendor);

Does this safely handle all USB notifier events? The global usb_notifier_li=
st
broadcasts events for both devices and buses. For bus events (like
USB_BUS_ADD), the data parameter is a struct usb_bus pointer.

By unconditionally casting data to a struct usb_device pointer and
dereferencing udev->descriptor.idProduct before checking the action switch,
could this cause an out-of-bounds memory read when a bus event is received?

> +
> +	switch (action) {
> +	case USB_DEVICE_ADD:
> +		/* Infineon XMM6260 ID 1519:0020 */
> +		if (vendor =3D=3D BASEBAND_VENDOR_ID_COMNEON &&
> +		    product =3D=3D BASEBAND_PRODUCT_ID_XMM6260) {
> +			cancel_delayed_work_sync(&priv->modem_work);
> +			priv->inited =3D true;
> +		}
> +		break;
> +	}

What happens if the USB device is removed?

There doesn't appear to be a handler for USB_DEVICE_REMOVE. If the modem
drops off the bus, priv->inited remains true and priv->ap_state stays stuck
in IPC_AP_WAKE_INIT2.

Will the interrupt handler ignore all subsequent wake attempts, leaving the
modem unresponsive until the module is reloaded?

> +
> +	return NOTIFY_OK;
> +}
[ ... ]
> +static int baseband_xmm_set_block(void *data, bool blocked)
> +{
> +	struct baseband_xmm_data *priv =3D data;
> +
> +	if (blocked) {
> +		if (priv->inited && priv->powered) {
[ ... ]
> +			regulator_disable(priv->vbat_supply);
> +
> +			priv->powered =3D false;
> +			priv->inited =3D false;
> +		}
> +	} else {
> +		if (priv->inited)
> +			return 0;
> +
> +		priv->ap_state =3D IPC_AP_WAKE_IRQ_READY;
> +		baseband_xmm_reset(priv);

If the RFKill switch is repeatedly toggled before the USB device enumerates,
could this leak regulator enable counts indefinitely?

When blocking the device, regulator_disable is only called if priv->inited
is true. However, unblocking the device sets priv->inited to false and calls
baseband_xmm_reset which calls regulator_enable unconditionally.

> +
> +		priv->powered =3D false;
> +		priv->inited =3D false;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static void baseband_xmm_work(struct work_struct *work)
> +{
> +	struct baseband_xmm_data *priv =3D
> +		container_of(work, struct baseband_xmm_data, modem_work.work);
> +
> +	switch (priv->ap_state) {
> +	case IPC_AP_WAKE_INIT1:
> +		if (priv->powered)
> +			return;
> +
> +		phy_power_on(priv->mphy);
> +		priv->powered =3D true;

Is there any synchronization protecting these state variables (priv->powere=
d,
priv->inited, priv->ap_state)?

They appear to be accessed and modified concurrently by the delayed workque=
ue,
the threaded IRQ handler, the RFKill callback, and the USB notifier without
any locking.

For example, could the RFKill callback and this delayed workqueue both see
priv->powered as true and simultaneously execute phy_power_off, corrupting
the PHY framework's internal power count?

> +		break;
[ ... ]
> +static irqreturn_t baseband_hostwake_interrupt(int irq, void *dev_id)
> +{
> +	struct baseband_xmm_data *priv =3D dev_id;
> +	int state =3D gpiod_get_value(priv->ipc_ap_gpio);
> +
> +	switch (priv->ap_state) {
> +	case IPC_AP_WAKE_IRQ_READY:
> +		if (!state) {
> +			priv->ap_state =3D IPC_AP_WAKE_INIT1;
> +			schedule_delayed_work(&priv->modem_work, 0);
> +		}
> +
> +		break;
> +
> +	case IPC_AP_WAKE_INIT1:
> +		if (state) {
> +			priv->ap_state =3D IPC_AP_WAKE_INIT2;
> +			schedule_delayed_work(&priv->modem_work,
> +					      msecs_to_jiffies(BASEBAND_XMM_INIT_DELAY));

Will this properly delay the work if it is already pending?

If the work is already pending from the IPC_AP_WAKE_IRQ_READY state (which
queued it with a 0 delay), schedule_delayed_work will return false and won't
update the timer. The work would then execute immediately, observe
IPC_AP_WAKE_INIT2, and shut down the PHY, bypassing the 5-second delay.

Would mod_delayed_work be more appropriate here to update the timeout?

> +		}
> +
> +		break;
[ ... ]
> +static int baseband_xmm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	priv->rfkill_dev =3D rfkill_alloc("xmm-modem", dev, RFKILL_TYPE_WWAN,
> +					&baseband_xmm_rfkill_ops, priv);
> +	if (priv->rfkill_dev) {
> +		ret =3D rfkill_register(priv->rfkill_dev);
> +		if (ret < 0) {
> +			rfkill_destroy(priv->rfkill_dev);
> +			return dev_err_probe(dev, ret,
> +					     "failed to register WWAN rfkill\n");
> +		}
> +	} else {
> +		return dev_err_probe(dev, PTR_ERR(priv->rfkill_dev),
> +				     "failed to allocate WWAN rfkill\n");

Does this error path correctly return a negative error code?

Since rfkill_alloc returns NULL on allocation failure, PTR_ERR(NULL)
evaluates to 0. This causes probe to succeed and return 0 instead of -ENOME=
M.
Could this leave the driver bound in a partially initialized state?

> +	}
> +
> +	priv->nb.notifier_call =3D baseband_xmm_usb_notifier_call;
> +	usb_register_notify(&priv->nb);
> +
> +	baseband_xmm_reset(priv);
> +	priv->powered =3D false;
> +
> +	return 0;
> +}
> +
> +static void baseband_xmm_remove(struct platform_device *pdev)
> +{
> +	struct baseband_xmm_data *priv =3D platform_get_drvdata(pdev);
> +
> +	rfkill_unregister(priv->rfkill_dev);
> +	rfkill_destroy(priv->rfkill_dev);
> +
> +	usb_unregister_notify(&priv->nb);
> +	phy_power_off(priv->mphy);
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	regulator_disable(priv->vbat_supply);

Does this removal sequence race with the devres-managed IRQ and workqueue?

The threaded IRQ and delayed workqueue were allocated with
devm_request_threaded_irq and devm_delayed_work_autocancel, so they are only
canceled after baseband_xmm_remove returns.

If the IRQ fires or the workqueue executes concurrently with or just after
this function, could they interact with the powered-off hardware or call
phy_power_on after the PHY is already disabled here?

Also, are these teardown calls always balanced?

If the device was already blocked via RFKill, or if the initialization
workqueue never ran to power on the PHY and regulator, unconditionally
calling phy_power_off and regulator_disable here might trigger negative
reference count warnings in their respective frameworks.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511135703.6247=
0-1-clamor95@gmail.com?part=3D4

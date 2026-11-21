Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795254683;
	b=289hzjILfglNl+KgvWJvHFBpGICsv9gLq7fH6NaN2NHDnHT8QhOWTLdg/qNtn1mbTT5c
	 9fxJwG9atKGCOKolJjRF5+bzqYxloSr3wtNGinchhZo9S3mF1tOUqswDZidrZX5vcDeYa
	 xY+Y+SRseRul+N7ffO+hoo9/xcbgLtTbhRpJjgqi+9TiBs7prxWo6Dzm69g0q0k+2554o
	 jyTCInujowyufVmZsEwxmOdEgrGsmK7TStR+9rXRzTqr4uS8A2TioJvHv+BnNyVZL0TMP
	 rc2LTiOSr7lMN2u4qE9xqvsdAvM5Dwen0fxBc8kwi980eZKXyoEnjJW+u6MxpKxPN4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795254683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FQWaC9QQga6awo5DgEryMs0FEgzYrtb1aUsnlMfwWyk=;
	b=EcOAlMfSMfbJIQzZWJw9UkcQ7hPUro7FAR+n3YgAAhKnyfPVSGbPfE+zvU2va2TgZcQb
	 y0+UP/2MsJQad0tX3lfDCMsoptXckoA7BcnavHnIdDNmaOq2mi+B4fkdRVBY479KWsHL6
	 cAfLbggiKrv09eHUElQ+L9ImuOOmd+CxlMsDFmQq0JKRTIRh4noo1IwzFOlISj5vcFkQR
	 Q5ZcEi6sW7xQGI5K5Du9egaWind+NaP8NgvcbLHB7RrtoBcTwDAS74mZdvnyH8qYwf2BR
	 BD+M2GuZ3cFk7zXQmh6ZZL/B1NnR0A5xXTctv3hmAKiiBc+7DrJi3WbPJiIgoyzsekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ale6ZHMm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77BF606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ale6ZHMm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC751F000C0;
	Sat, 21 Nov 2026 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795254683;
	bh=FQWaC9QQga6awo5DgEryMs0FEgzYrtb1aUsnlMfwWyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ale6ZHMm7ym8jz9f2yuFh506Z7EPK+TwvwIIe1EdueBFEXWEnQcDKZP4tlZ9C9fMe
	 v358CMZN8o0M65SIyOJxIOVfH+OhKCg50kRg0m+VD+Z/zvyBM52oGBe9eHe5WL7ocw
	 B2CaDh6GapSCGenjDmyYav9LREXJdlnT9MPVX8DIZOux6vdxrH832YqVKyDCbtmYRW
	 sHpxL7JnwnnmIlrknRaZQrq/KN92yQ15ELPZF60eEliPHUTM60cmA/YCEwqkmgFcgG
	 dzGYt9PjXVpIkNnRakvT/vQHU9bGoo/qXV8+Sn+KFafY2jeDJ/K4N9wiQdiDcp/hYV
	 8Nr/+cAMQSSag==
Message-ID: <sashiko-outbox-226870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] power: supply: smb347: Set the USB input current
 limit from APSD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Fischer" <admin@tsv-stahl-riesa.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-upstream-smb347-apsd-v1-3-ca46b92bfd44@tsv-stahl-riesa.de>
References: <20261121-upstream-smb347-apsd-v1-0-ca46b92bfd44@tsv-stahl-riesa.de>
 <20261121-upstream-smb347-apsd-v1-3-ca46b92bfd44@tsv-stahl-riesa.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 09:51:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] power: supply: smb347: zero probe delay in
  smb347_apsd_schedule() when offline
- [Medium] power: supply: smb347: smb347_set_current_limits() sets USB
  limit before APSD
- [Medium] power: supply: smb347: unsynchronized CMD_A_ALLOW_WRITE in
  smb347_apsd_work()
- [Medium] power: supply: smb347: missing apsd_work cancel on
  remove/shutdown and IRQ free
--

commit 1d463a50b5c9dfcf14295d13dceba5f8a5903b43
Author: Patrick Fischer <admin@tsv-stahl-riesa.de>

power: supply: smb347: Set the USB input current limit from APSD

This commit adds Automatic Power Source Detection (APSD) support for the
SMB347 charger to configure the USB input current limit according to the
detected port type and expose POWER_SUPPLY_PROP_USB_TYPE.

> diff --git a/drivers/power/supply/smb347-charger.c b/drivers/power/supply=
/smb347-charger.c
> index 03d58b378a25f..330c05cfddc33 100644
> --- a/drivers/power/supply/smb347-charger.c
> +++ b/drivers/power/supply/smb347-charger.c
[ ... ]
> @@ -497,6 +535,59 @@ static int smb347_set_current_limits(struct smb347_c=
harger *smb)
>  	return 0;
>  }
> =20
> +/*
> + * Sets the USB input current limit. Like the vendor driver, turn AICL o=
ff
> + * while the limit changes, so that the charger detects the input current
> + * again with the new limit once AICL is turned back on.
> + *
> + * Must be called with the configuration registers writable.
> + */
> +static int smb347_set_usb_current_limit(struct smb347_charger *smb,
> +					unsigned int limit)
> +{
> +	unsigned int id =3D smb->id;
> +	unsigned int val;
> +	bool aicl;
> +	int hw, ret, ret2;
> +
> +	hw =3D current_to_hw(icl_tbl[id], ARRAY_SIZE(icl_tbl[id]), limit);
> +	if (hw < 0)
> +		return hw;
> +
> +	ret =3D regmap_read(smb->regmap, CFG_CURRENT_LIMIT, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((val & CFG_CURRENT_LIMIT_USB_MASK) =3D=3D hw)
> +		return 0;

[Severity: Medium]
Does this skip toggling CFG_VARIOUS_FUNCTION_AICL at boot when
"summit,usb-current-limit-microamp" is set in the device tree?

During probe, smb347_hw_init() -> smb347_set_current_limits() writes
smb->usb_hc_current_limit directly into CFG_CURRENT_LIMIT without
cycling AICL:

drivers/power/supply/smb347-charger.c:smb347_set_current_limits() {
    ...
	if (smb->usb_hc_current_limit) {
		ret =3D current_to_hw(icl_tbl[id], ARRAY_SIZE(icl_tbl[id]),
				    smb->usb_hc_current_limit);
		if (ret < 0)
			return ret;

		ret =3D regmap_update_bits(smb->regmap, CFG_CURRENT_LIMIT,
					 CFG_CURRENT_LIMIT_USB_MASK, ret);
    ...
}

If the board boots with a DCP charger already connected,
smb347_apsd_work() later calls smb347_set_usb_current_limit() with the
same limit, sees that CFG_CURRENT_LIMIT_USB_MASK already equals hw, and
returns 0 without turning AICL off and back on.  If the board instead
boots connected to an SDP host port, smb347_hw_init() enables charging
with the full smb->usb_hc_current_limit (e.g. 1800 mA) for the 500 ms
before smb347_apsd_work() runs.

> +
> +	ret =3D regmap_read(smb->regmap, CFG_VARIOUS_FUNCTION, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	aicl =3D val & CFG_VARIOUS_FUNCTION_AICL;
> +	if (aicl) {
> +		ret =3D regmap_clear_bits(smb->regmap, CFG_VARIOUS_FUNCTION,
> +					CFG_VARIOUS_FUNCTION_AICL);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret =3D regmap_update_bits(smb->regmap, CFG_CURRENT_LIMIT,
> +				 CFG_CURRENT_LIMIT_USB_MASK, hw);
> +
> +	if (aicl) {
> +		/* The vendor driver waits 20 ms before turning AICL back on. */
> +		msleep(20);
> +		ret2 =3D regmap_set_bits(smb->regmap, CFG_VARIOUS_FUNCTION,
> +				       CFG_VARIOUS_FUNCTION_AICL);
> +		if (!ret)
> +			ret =3D ret2;
> +	}
> +
> +	return ret;
> +}
[ ... ]
> +static void smb347_apsd_work(struct work_struct *work)
> +{
> +	struct smb347_charger *smb =3D container_of(to_delayed_work(work),
> +						  struct smb347_charger,
> +						  apsd_work);
> +	int usb_type =3D POWER_SUPPLY_USB_TYPE_UNKNOWN;
> +	unsigned int limit, val;
> +	int ret;
[ ... ]
> +	limit =3D smb347_usb_type_current_limit(smb, usb_type);
> +
> +	ret =3D smb347_set_writable(smb, true, true);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D smb347_set_usb_current_limit(smb, limit);
> +	smb347_set_writable(smb, false, true);

[Severity: Medium]
Can a concurrent smb347_set_writable() caller clear CMD_A_ALLOW_WRITE
while smb347_set_usb_current_limit() is sleeping in msleep(20)?

smb347_set_writable() disables the client IRQ, which nests across threads
and does not serialize process-context callers such as the USB VBUS
regulator callbacks or smb347_irq_disable():

kworker                           CPU1
smb347_apsd_work()
  smb347_set_writable(smb, true, true)
    /* CMD_A_ALLOW_WRITE =3D 1 */
  smb347_set_usb_current_limit()
    regmap_clear_bits(..., AICL)
    regmap_update_bits(..., hw)
    msleep(20)
                                  smb347_usb_vbus_set_current_limit()
                                    smb347_set_writable(smb, true, true)
                                    ...
                                    smb347_set_writable(smb, false, true)
                                      /* CMD_A_ALLOW_WRITE =3D 0 */
    regmap_set_bits(..., AICL)
      <-- rejected because CMD_A_ALLOW_WRITE is 0

When the second write to CFG_VARIOUS_FUNCTION is rejected, AICL remains
disabled.

> +out:
> +	if (ret < 0)
> +		dev_err(smb->dev, "failed to set USB input current limit: %d\n",
> +			ret);
> +
> +	WRITE_ONCE(smb->usb_type, usb_type);
> +	power_supply_changed(smb->usb);
> +}
> +
> +static void smb347_apsd_schedule(struct smb347_charger *smb)
> +{
> +	unsigned long delay =3D 0;
> +
> +	if (!smb->use_apsd)
> +		return;
> +
> +	if (smb->usb_online)
> +		delay =3D msecs_to_jiffies(SMB347_APSD_DELAY_MS);
> +
> +	mod_delayed_work(system_dfl_wq, &smb->apsd_work, delay);
> +}
> +
> +static int smb347_apsd_init(struct smb347_charger *smb)
> +{
> +	int ret;
> +
> +	smb->use_apsd =3D apsd_tbl[smb->id] && smb->use_usb &&
> +			!smb->irq_unsupported;
> +	if (!smb->use_apsd)
> +		return 0;
> +
> +	ret =3D smb347_set_writable(smb, true, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The vendor driver turns APSD on at probe as well. */
> +	ret =3D regmap_set_bits(smb->regmap, CFG_CHARGE_CONTROL,
> +			      CFG_CHARGE_CONTROL_APSD);
> +	smb347_set_writable(smb, false, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Directly after probe the charger NAKs the write to
> +	 * CFG_VARIOUS_FUNCTION. Wait as after a new connection.
> +	 */
> +	smb347_apsd_schedule(smb);

[Severity: Medium]
When the driver probes with no USB cable connected (smb->usb_online is
false), does smb347_apsd_schedule() queue smb->apsd_work with a 0 delay
instead of waiting SMB347_APSD_DELAY_MS?

smb347_apsd_work() then runs immediately at probe and calls
smb347_set_usb_current_limit() to lower the default limit to 500 mA,
hitting the post-probe NAK on CFG_VARIOUS_FUNCTION described in the
comment and leaving the higher NVM or DT current limit in place for the
next connection.

> +
> +	return 0;
> +}
[ ... ]
> @@ -1582,10 +1818,22 @@ static int smb347_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> +	/* Before the IRQ, so that it is cancelled after the IRQ is freed. */
> +	ret =3D devm_delayed_work_autocancel(dev, &smb->apsd_work,
> +					   smb347_apsd_work);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D smb347_irq_init(smb, client);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D smb347_apsd_init(smb);
> +	if (ret < 0) {
> +		smb347_irq_disable(smb);
> +		return dev_err_probe(dev, ret, "failed to enable APSD\n");
> +	}
> +
>  	usb_rdev_cfg.dev =3D dev;
>  	usb_rdev_cfg.driver_data =3D smb;
>  	usb_rdev_cfg.regmap =3D smb->regmap;

[Severity: Medium]
Can smb347_apsd_work() continue running during and after
smb347_remove(), smb347_shutdown(), or a devm_regulator_register() probe
failure?

smb347_remove() and smb347_shutdown() do not cancel smb->apsd_work, and
device_shutdown() does not run devres release callbacks, so an in-flight
work item (which polls STAT_D for up to 2 seconds) can keep issuing I2C
transfers after shutdown.

In addition, because devm_delayed_work_autocancel() is registered before
smb347_irq_init(), devres teardown frees client->irq before cancelling
smb->apsd_work, while smb347_apsd_work() -> smb347_set_writable() still
calls disable_irq(client->irq) and enable_irq(client->irq) on the freed
IRQ.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-upstream-s=
mb347-apsd-v1-0-ca46b92bfd44@tsv-stahl-riesa.de?part=3D3

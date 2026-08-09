Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA352566F7
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786283307; cv=none; b=FQaRHiXM4PfnALAL/9RvcgcfF6bwTBXXKbX45eAvx9es0OMJ7FnPTpfLm5mzfYUOJM6IJWuGqk0JHuKwjTqlyENT4AkbbrUThqsjdr6j2yg2gL6iF2ogUsbfPUsCA5FlTWHY9G2N+hGKTKJXKA2KNEhFlJEA2cnIiIILVq89hQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786283307; c=relaxed/simple;
	bh=AZVtlMqEUgeJN1Jf8t079Idj16V+BhG44JK7mGYgRrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MpAOAyX06bX2c2kI3VXfHB625bTBn3DLBllbH+21wQfoErv/LPmMvFJ7i/+ZM0Y4Mp0JdHO4Q4zt5s3a/rSGVxIZCBiqqBG+nfSE6Jgnu4J/c3sUGJ/xqtSRfsZ2gQy+/2s+gFWqkjJxRxlAZXt7Tcp+atOPgG1tiJdF45+UHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl26Wvvv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl26Wvvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E671F00A3A;
	Sun,  9 Aug 2026 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786283305;
	bh=+QM89EkYYl9JoirlYSLF/UNVKVMEaIf1mSl0I4YcQbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fl26WvvvlUwIzsv7CwHgrFoWOSK3IkUFBV2vBd3n0f48MMeDRcua5s7w199SQNcig
	 R9xB1IaNlCAt83/vDK5s2ap4sW6HCjhpG3xxqu1fLDPGRLJxZxGgwC0pAjzyMuE6pC
	 CJSNkk0r7/DTo3cb0ZbEG3yuEjMmLR7vqoK1WisNVkEVY61p95ZS5KWCqPMFZRHIaK
	 n1wuMIvWjXCt/i3qjHaIYdwxHVECQiDQ7CEbBwcNEeC9m+VMt0u3hm8ccWL7jD4CPs
	 BZ0RQOHv9yHRvq3rr55plg0qF4dvA7KEOZDEXMU71qLHMPEO9VpIKuZPku488WblDS
	 ReRybwm2O9mHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] platform: arm64: dell-xps-ec: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-dell-xps-9345-ec-v4-2-88306dbbc7aa@vinarskis.com>
References: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
 <20260809-dell-xps-9345-ec-v4-2-88306dbbc7aa@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 13:48:24 +0000
Message-Id: <20260809134825.39E671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] If the I2C suspend command fails during suspend or resume, the tem=
perature polling delayed_work is permanently halted, leaving the EC without=
 thermal updates.
- [High] The threaded IRQ handler returns IRQ_HANDLED without issuing comma=
nds to clear the interrupt source on the EC, leading to an interrupt storm.
- [High] Mismatch between thermistor IDs initialized in the profile and com=
mand bytes used for thermal updates.
- [Medium] Hardware state is modified before all software resources are acq=
uired, leading to inconsistent EC state if probe defers.
- [Low] The i2c_device_id array does not use named initializers, violating =
I2C subsystem guidelines.
--

--- Patch [2]: [PATCH v4 2/3] platform: arm64: dell-xps-ec: new driver ---
commit 4cf5509cb5dd3a2ed8d4226af2e175536980f3e7
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver

This commit introduces a new Embedded Controller driver for the Dell XPS 13
9345. It handles thermal management by periodically polling thermistors via
IIO channels and sending the readings to the EC using I2C commands to
control fan speeds and peripheral power.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c
> @@ -0,0 +1,299 @@

[ ... ]

> +static const u8 dell_xps13_9345_thermistor_profile[] =3D {
> +	0xff, 0x54,
> +	0x01, 0x00, 0x2b,	/* sys_therm0 */
> +	0x02, 0x44, 0x2a,	/* sys_therm1 */
> +	0x03, 0x44, 0x2b,	/* sys_therm2 */
> +	0x04, 0x44, 0x28,	/* sys_therm3 */
> +	0x05, 0x55, 0x2a,	/* sys_therm4 */
> +	0x06, 0x44, 0x26,	/* sys_therm5 */
> +	0x07, 0x44, 0x2b,	/* sys_therm6 */
> +};
> +
> +static const struct dell_xps_ec_therm dell_xps13_9345_therms[] =3D {
> +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> +	{ "sys_therm0", 0x02 },
> +	{ "sys_therm1", 0x03 },
> +	{ "sys_therm2", 0x04 },
> +	{ "sys_therm3", 0x05 },
> +	{ "sys_therm4", 0x06 },
> +	{ "sys_therm5", 0x07 },
> +	{ "sys_therm6", 0x08 },
> +};

[Severity: High]
Is there a mismatch between the thermistor IDs initialized in the profile a=
nd
the command bytes used for thermal updates?

The profile array initializes thermistors 0x01 through 0x07, but the command
mapping array maps sys_therm0 to 0x02 and goes up to 0x08. Could this cause
thermal updates for ID 0x01 to be completely missed, while sending updates
for the uninitialized ID 0x08?

[ ... ]

> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec =3D data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=3D%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Does this handler properly clear the hardware interrupt source?

Returning IRQ_HANDLED without issuing I2C commands to acknowledge the
interrupt on the EC side could result in an interrupt storm if the IRQ is
level-triggered. The core will unmask the line on return, and the hardware
might immediately fire the interrupt again.

[ ... ]

> +static int dell_xps_ec_probe(struct i2c_client *client)
> +{
> +	const struct dell_xps_ec_data *data;
> +	struct device *dev =3D &client->dev;
> +	struct dell_xps_ec *ec;
> +	unsigned int i;
> +	int ret;

[ ... ]

> +	/* Set default thermistor profile */
> +	ret =3D i2c_master_send(client, data->profile, data->profile_len);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to set thermistor profile\n");
> +
> +	/* Get IIO channels for thermistors */
> +	for (i =3D 0; i < ec->num_therms; i++) {
> +		ec->therm_channels[i] =3D
> +			devm_iio_channel_get(dev, data->therms[i].name);
> +		if (IS_ERR(ec->therm_channels[i])) {
> +			ret =3D PTR_ERR(ec->therm_channels[i]);
> +			ec->therm_channels[i] =3D NULL;
> +			if (ret =3D=3D -EPROBE_DEFER)
> +				return ret;

[Severity: Medium]
Is it safe to modify the EC hardware state before fully acquiring all IIO
channels?

If devm_iio_channel_get() returns -EPROBE_DEFER, the probe will abort and be
retried later. This leaves the EC initialized with a new profile but waiting
for thermal updates that will not arrive until the driver successfully prob=
es.

[ ... ]

> +static int dell_xps_ec_suspend(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&ec->temp_work);
> +
> +	return dell_xps_ec_suspend_cmd(ec, true);
> +}

[Severity: High]
If dell_xps_ec_suspend_cmd() fails and returns an error, the suspend will be
aborted by the PM core, but the delayed work is already cancelled and never
restarted.

Could this permanently halt the thermal polling loop if the I2C transfer
encounters a temporary error?

> +
> +/*
> + * Notify EC of resume
> + *
> + * This will undo the suspend actions
> + * Without the resume signal, device would wake up but be forced back in=
to
> + * suspend by EC within seconds
> + */
> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +
> +	return 0;
> +}

[Severity: High]
Similarly, during resume, if dell_xps_ec_suspend_cmd() fails, it returns ea=
rly
without scheduling the delayed work.

Does this completely stop thermal updates to the EC after a failed resume I=
2C
transaction?

[ ... ]

> +static const struct i2c_device_id dell_xps_ec_i2c_id[] =3D {
> +	{ "dell-xps-ec", (kernel_ulong_t)&dell_xps13_9345_data },
> +	{}
> +};

[Severity: Low]
Should this i2c_device_id array use named initializers?

The I2C subsystem guidelines state that initialized arrays of type
struct i2c_device_id must be declared const and use named initializers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-dell-xps-9=
345-ec-v4-0-88306dbbc7aa@vinarskis.com?part=3D2

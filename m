Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976813;
	b=4DH05PBjgoXiLpeVLPzXU22nxVLqcyYP8oXJsLxcQQK6WPHLobbSmjzeGOLRRmzgFhmw
	 XwdIQ21qZRRE5veAxttGrXRGf2PPtjO/WmmExdyazAzXJ7sVBp5PzWkyfkx6n7j5fgn/s
	 sf+YZtx5mQ8msA42X3GGobjFxpPp3gEBShMiA/VJqlpRPVw1i2Jin4cte9I3bTDHXqssO
	 LjcFcnWFXo601vzFCmTxHn5VuCIAzjqj4Uo8acZKb/CXA0VRF6oLGLvQugk4vMGUNs+XI
	 qxoSvzhEMQWZtwEo0FBlE4B/FTAC6eLKDS40ZUV88avX17dRqFgeIMADLKQkWIkDqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976813;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zYwKxydsdQY/TQfhUMvToMWTzQA9t+3/IJIkkxy6ceI=;
	b=dKTIDqzwcKdz6tpkuCqad5+7wJ0GHtWwFBdLRIOUm0YvOYPXWIZ0iTKc97zy+5hfFxZ3
	 p8ko/FgUl/2r4Fy7J3ll2Kv0iR3uQasqk7aHWq18h6nNb+r8h/HeNBiSM+Vs9kAgJUlNC
	 g2z9PED9wgL60Q/jyWjJ4LdAT8U0JU4iYmEzZFRlpRGiuRMz2pqDBi4v5b57qcH/P2nb9
	 C90da9kxgTMfgQbgS3yQ2YE6lXJC5iYY4dJC2iShuFHe4dg9ZHlnYly8e0Cjpfy34/Bn+
	 5Ftv2yGxGajNYamR2gWAqNmuotzghBp1cO5RJAYoF9zOneUOraMZK21yqtjZ8Br/Wxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ovqC1vNB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8575606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ovqC1vNB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF3D1F01825;
	Mon, 26 Oct 2026 01:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792976812;
	bh=zYwKxydsdQY/TQfhUMvToMWTzQA9t+3/IJIkkxy6ceI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ovqC1vNByILPl8SCPrA2JqCwSiI2S2BqJXQhGL8d+LN/a9Y1ylTfFqqJNTHxVsKq5
	 j3QBODyfTtc5KO83U0j3iSEpx/olTV1NUiAEyvudEgjgUPDhuiuaO7eSp3Lu6PjuGB
	 F01SQTe1kTEnqU3EVzfEkQqTxq6x8zh8UoX+kVvkkFHVIJ996iXQoT8oM6t4TZuRS+
	 KEr9v8jyfPbejmifobY1Zj2HNXF6PyW3xomN+ZShiLfmF0tHYvdv40KBRR4K60z78D
	 H27Psjd9cefbqOt0t1aIzrUXEAMDQsLz2WIGFp9Y6wL9SeUQ3ygo2Zo02bxcrcA4Le
	 T5DJGS5fpQVVg==
Message-ID: <sashiko-outbox-184570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] platform: arm64: dell-xps-ec: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-dell-xps-9345-ec-v8-2-251c2cbfbc6c@vinarskis.com>
References: <20261026-dell-xps-9345-ec-v8-0-251c2cbfbc6c@vinarskis.com>
 <20261026-dell-xps-9345-ec-v8-2-251c2cbfbc6c@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 01:06:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] platform: dell-xps-ec: unacknowledged level IRQ in dell_xps_ec_irq=
_handler()
- [Medium] platform: arm64: dell-xps-ec: stopped temp_work on dell_xps_ec_r=
esume() error
- [Low] platform: arm64: dell-xps-ec: mismatched ID and positional init in =
dell_xps_ec_i2c_id
--

commit 89371344f2f860e258af233ab4a65e60a8d3f321
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver

This commit introduces an I2C driver for the Embedded Controller in the
Qualcomm Snapdragon-based Dell XPS 13 9345. It configures the thermistor
profile, periodically reports thermistor temperatures read via IIO channels=
 to
the EC, and notifies the EC across system suspend and resume.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> index 0000000000000..20cb2a1b7bbd4
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c
> @@ -0,0 +1,308 @@

[ ... ]

> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec =3D data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_dbg(ec->dev, "IRQ triggered (irq=3D%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dell_xps_ec_probe(struct i2c_client *client)
> +{
> +	const struct dell_xps_ec_data *data;
> +	struct device *dev =3D &client->dev;
> +	struct dell_xps_ec *ec;
> +	unsigned int i;
> +	int ret;
> +
> +	data =3D i2c_get_match_data(client);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV, "No match data\n");

[ ... ]

> +	/* Request IRQ for EC events */
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}

[Severity: High]
Can requesting this interrupt before event readout is implemented cause an
interrupt storm when the EC asserts the line (for example, on lid close)?

Both the devicetree binding
(Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.y=
aml)
and the board devicetree configure the EC interrupt as level-triggered
active-low:

    interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;

In dell_xps_ec_probe(), devm_request_threaded_irq() enables this interrupt
with IRQF_ONESHOT, but dell_xps_ec_irq_handler() only logs a debug message
and returns IRQ_HANDLED without performing an I2C transfer to read or clear
the pending event on the EC.

When the EC asserts the level-low interrupt line, irq_thread_fn() runs
dell_xps_ec_irq_handler() and irq_finalize_oneshot() immediately unmasks the
line while it is still asserted low, causing the interrupt to re-fire in a
tight loop. Because dell_xps_ec_irq_handler() unconditionally returns
IRQ_HANDLED, note_interrupt() treats every firing as handled and spurious I=
RQ
detection will not disable the line.

Should the driver hold off on requesting the IRQ until the EC event readout=
 is
implemented?

> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Cut power to display/trackpad/keyboard/touchrow, wake-up source sti=
ll works.
> + */
> +static int dell_xps_ec_suspend(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +
> +	int ret;
> +
> +	cancel_delayed_work_sync(&ec->temp_work);
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, true);
> +	if (ret) {
> +		schedule_delayed_work(&ec->temp_work,
> +				      DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Notify EC of resume
> + *
> + * This will undo the suspend actions. Without the resume signal, device=
 would
> + * wake up but be forced back into suspend by EC within seconds.
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

[Severity: Medium]
If dell_xps_ec_suspend_cmd(ec, false) fails in dell_xps_ec_resume(), does t=
his
leave ec->temp_work permanently stopped after the system resumes?

During suspend, dell_xps_ec_suspend() cancels ec->temp_work via
cancel_delayed_work_sync(). On resume, the PM core continues resuming the
system even if a device resume callback returns an error, so returning early
before schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES)
leaves periodic temperature reporting disabled while the system is running.

> +
> +static const struct of_device_id dell_xps_ec_of_match[] =3D {
> +	{ .compatible =3D "dell,xps13-9345-ec", .data =3D &dell_xps13_9345_data=
 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dell_xps_ec_of_match);
> +
> +static const struct i2c_device_id dell_xps_ec_i2c_id[] =3D {
> +	{ "dell-xps-ec", (kernel_ulong_t)&dell_xps13_9345_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);

[Severity: Low]
Should dell_xps_ec_i2c_id use the vendor-stripped compatible string
"xps13-9345-ec" and named initializers (.name and .driver_data)?

When an i2c_client without an fwnode (such as via sysfs instantiation using
the OF compatible name "xps13-9345-ec") is matched via
i2c_device_match() -> i2c_of_match_device() -> i2c_of_match_device_sysfs(),
dell_xps_ec_probe() calls i2c_get_match_data(client). Because
device_get_match_data(&client->dev) returns NULL when no fwnode is attached,
i2c_get_match_data() falls back to i2c_match_id(driver->id_table, client),
which fails to match "xps13-9345-ec" against "dell-xps-ec" and causes
dell_xps_ec_probe() to fail with -ENODEV. Using named initializers also
matches the I2C subsystem convention for new struct i2c_device_id entries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-dell-xps-9=
345-ec-v8-0-251c2cbfbc6c@vinarskis.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2375346A0C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301505; cv=none; b=ahP6SwGvM4xqwlJf2XfF6wf89t0g1GZp2tImDKpmGIXjTFNry5thesbAhQwLEbTNn+Bq2z0hJXK/XJ7wEq2wyqiaE68jErYPgS+TmJbeZQU+lzXUKTPXSrAT0T/SfTDSI1i8tTDkd4HKVZopKvi26AgT9rOPTLTd6s8j4PCpAug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301505; c=relaxed/simple;
	bh=I2avWxIzfSVrI5uA4VvvPei5FCCv/BtqOgz8LYRLb5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VA6Var1jCxtXie4m3C80YQBhgKhJxTYWkd7kMgC5a068DpadQ1ZPBDPVTHWG0jSBccyhb1rHyqe+AXRpH/Uqco/z6rRsrTHWdJStKxlKm9zAxeZzYVU7qnF4yyBPEA++Ru6DEE7gTK0HPHO33lSN+Jwvo8YNUaRKvA0omOj2N+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp8SaGW8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp8SaGW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7281F000E9;
	Fri, 21 Aug 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301504;
	bh=FGVDtShurTvVb8AHbQTAE/R164A5aID1LHDbhO3NykU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bp8SaGW8w6buyE13aUZfWR/pebjZAjmxZ9+sJHdmUht75bSVzooqYVN7Dcggbompc
	 Kz7CYtjPPmvE8cwezUxJvb2SzMeu/SRhJISt0TRrBrRKV1t0tX5N2Pg9+YGeEkFC7y
	 /VfieCNi1O6wtEsMzHn9XtHKpMG/3BSE4FtzpQVqKkulk3NhWSaYhTj7a8XL54SA79
	 SCO2cD1EJqcoXa+EqHEmIqWACQMVaDx0Gmm0BFd6zpSffNWYv+yLt00345k7RiZSCK
	 toIZ3Ow5YHIb0enZubBLMsiKoXHIIHGwJmDQeRWoELO1XLQpNf+OkYsyC7V10jKCsv
	 Ep43syqlsItcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-tipd-ace3-v5-2-3244ed3bdc3f@chaosmail.tech>
References: <20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech>
 <20260821-tipd-ace3-v5-2-3244ed3bdc3f@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:38:23 +0000
Message-Id: <20260821083823.ED7281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The `ti,tps66993` compatible string was inadvertently removed from=
 the OF match table during the I2C split.
- [High] The hardware variant mapping for `TIPD_VARIANT_TPS66993` incorrect=
ly points to `tipd_tps6598x_data` instead of `tipd_tps66993_data`.
- [Medium] The supposedly bus-agnostic core still contains direct I2C struc=
t downcasts, risking kernel crashes on non-I2C buses.
- [Low] Direct pointer-to-integer cast causes build warnings/errors on 64-b=
it systems.

Pre-existing issues:
- [Critical] Missing cancellation of delayed works in the probe error path =
leads to use-after-free.
- [High] Suspend and resume functions unconditionally disable/enable IRQ 0 =
when in polling mode, potentially causing system instability.
--

--- Patch [2]: [PATCH v5 2/3] usb: typec: tipd: Factor out i2c specifics ---
commit 691ce94a8de82880f19343c1fa6f0daf5755c9d5
Author: Alyssa Milburn <amilburn@zall.org>

usb: typec: tipd: Factor out i2c specifics

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip.

> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip

[Severity: Medium]
Will this bus-agnostic abstraction fail on non-I2C buses due to remaining I=
2C
struct downcasts?

For example, tps25750_write_firmware() in core.c still uses to_i2c_client():

	struct i2c_client *client =3D to_i2c_client(tps->dev);
	...
	slave_addr =3D client->addr;
	timeout =3D client->adapter->timeout;
	...
	client->addr =3D bpms_addr;

Could this cause memory corruption if a non-I2C variant calls
tps25750_apply_patch() -> tps25750_start_patch_burst_mode() ->
tps25750_write_firmware() in the future?

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -1887,14 +1760,14 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  	if (tps->irq) {
> -		ret =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +		ret =3D devm_request_threaded_irq(tps->dev, tps->irq, NULL,
>  						tps->data->irq_handler,
>  						IRQF_SHARED | IRQF_ONESHOT,
> -						dev_name(&client->dev), tps);
> +						dev_name(tps->dev), tps);
>  	} else {
>  		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
>  		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
>  		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
>  				   msecs_to_jiffies(POLL_INTERVAL));
>  	}
> =20
>  	if (ret)
>  		goto err_disconnect;

[Severity: Critical]
This isn't a bug introduced by this patch, but could this error path leave
delayed works pending and cause a use-after-free?

If tipd_init() fails after queueing tps->wq_poll in polling mode, or after
connect() schedules cd321x->update_work, it jumps to err_disconnect. Since
cancel_delayed_work_sync() is missing in the cleanup, devres will free
the tps structure while the system workqueue might still execute the pending
work and dereference the freed memory.

[ ... ]

> @@ -1955,29 +1826,26 @@ static void tps6598x_remove(struct i2c_client *cl=
ient)
> +int tipd_suspend(struct tps6598x *tps)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
> -
>  	if (tps->wakeup) {
> -		disable_irq(client->irq);
> -		enable_irq_wake(client->irq);
> +		disable_irq(tps->irq);
> +		enable_irq_wake(tps->irq);
>  	} else if (tps->reset) {
>  		gpiod_set_value_cansleep(tps->reset, 1);
>  	}

[Severity: High]
This is a pre-existing issue, but does this unconditionally disable and ena=
ble
IRQ 0 when in polling mode?

If a device tree specifies a wakeup-source without providing an interrupt,
tps->irq remains 0 while tps->wakeup is set to true. During suspend and res=
ume,
tipd_suspend() and tipd_resume() call disable_irq(0) and enable_irq_wake(0).
Manipulating IRQ 0 (typically the system timer on x86) can cause lockups or
panics.

[ ... ]

> @@ -2085,33 +1950,14 @@ static const struct tipd_data tps25750_data =3D {
> +const struct tipd_data *tipd_hw_variants[] =3D {
> +	[TIPD_VARIANT_CD321X] =3D &tipd_cd321x_data,
> +	[TIPD_VARIANT_TPS6598X] =3D &tipd_tps6598x_data,
> +	[TIPD_VARIANT_TPS66993] =3D &tipd_tps6598x_data,
> +	[TIPD_VARIANT_TPS25750] =3D &tipd_tps25750_data,
>  };

[Severity: High]
Is it intentional that TIPD_VARIANT_TPS66993 points to tipd_tps6598x_data
instead of tipd_tps66993_data?

Since tipd_tps66993_data is defined with the correct
tps66993_read_power_status() callback and IRQ masks, assigning
tipd_tps6598x_data here will cause TPS66993 devices to use the wrong
callbacks and experience hardware state parsing failures.

> diff --git a/drivers/usb/typec/tipd/i2c.c b/drivers/usb/typec/tipd/i2c.c
> new file mode 100644
> index 0000000000000..f852cdc327f5d
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/i2c.c
> @@ -0,0 +1,106 @@

[ ... ]

> +static int tps6598x_probe_i2c(struct i2c_client *client)
> +{
> +	enum tipd_hw_variant variant;
> +	const struct tipd_data *data;
> +	struct tps6598x *tps;
> +	int ret;
> +
> +	variant =3D (enum tipd_hw_variant)i2c_get_match_data(client);

[Severity: Low]
Will this pointer-to-int cast trigger a -Wpointer-to-int-cast build warning=
 on
64-bit architectures?

[ ... ]

> +static const struct of_device_id tps6598x_of_match[] =3D {
> +	{ .compatible =3D "ti,tps6598x", (void *)TIPD_VARIANT_TPS6598X},
> +	{ .compatible =3D "apple,cd321x",  (void *)TIPD_VARIANT_CD321X},
> +	{ .compatible =3D "ti,tps25750",  (void *)TIPD_VARIANT_TPS25750},
> +	{}
> +};

[Severity: High]
Did we accidentally drop the ti,tps66993 entry here during the refactoring?

Without this compatible string in the I2C driver, it seems we will no longer
bind to TPS66993 devices during boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-tipd-ace3-=
v5-0-3244ed3bdc3f@chaosmail.tech?part=3D2

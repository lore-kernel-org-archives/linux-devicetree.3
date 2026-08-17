Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE23DDB01
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964664; cv=none; b=UxIJA70eA9UBpQzzW2qDEjqXGYBWRI+Fcw7BgoH4BRmSaC4cXrEBDblYVXX1zj1uA8tvYCIywfKkyw8x6mjTDHJ3VT3RdwIaekJUP8MnoS9une81zlsRmvoCjTzF1cYuceZDFSQzf/qJUzgQiVN2rftp4ihHA+G6WPPX0BvIwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964664; c=relaxed/simple;
	bh=h7TeyE9fg/NG6rp2BtOxqa7f1Uqjrvl/iwz17nMGK4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GE5ghpJBqb3uPAGkqwkEG8A+lupDMYuQ49Hb3oyqF5UFPzrif1W9EWNwy1XFQmub8Wtv6bgpW/w5HaGINPNKjMROZIUlsRmGSFy2SRaqT11BLkLHgmbqC72MUF1ktP4oVjYIOGWAFxhnGJ7DCUte/zuQOh4UhmSHiUFD0nsnbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEk2GX6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEk2GX6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE551F000E9;
	Mon, 17 Aug 2026 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964663;
	bh=bIttZLgyypIKlTynMYKddjmtIFUSJt2nlQmLkrznhpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CEk2GX6nAImT5GA70vac+4lRvyJfeMaDdItmpNuhqj3a510NHXLNFUIcfeRKHXewc
	 I4PiYES0+SKpS+tedW8H/kTSzMt4IG5d8ByZC0OmJJMyGnvKPv6ZeTEfNUzjr0W9Ft
	 I0yJODexqf1oojiTZwLhYh+zh54QFdblnOlESDJZxiwyyMEyc8Zl6TYxKYFO0ollqK
	 4OuP6GVKlqkXaZvRdiQ8OjF3CzwjRjPPZ5wTTNCdPXNGKkmD0rJwFircmqKfxq2Dp/
	 wGjqTgMqZ759E5jUjGNf3HeHfjHU0tDh5m52hX5Cb/XksGzoatQkTub3HpxHwcKNKd
	 vs59CgLBL4ULw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817103844.2142802-9-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:04:22 +0000
Message-Id: <20260817110422.CDE551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Failing to clear the software slave state on hardware disable fail=
ure causes a use-after-free or invalid code execution when the slave driver=
 unloads.
- [High] A stack-allocated buffer is passed to `regmap_bulk_read()` for an =
I3C device, violating the I3C core's requirement for DMA-able buffers and l=
eading to DMA corruption.
- [Low] Missing I2C_FUNC_SLAVE flag in adapter functionality mask when CONF=
IG_I2C_SLAVE is enabled.
--

--- Patch [8]: [PATCH v15 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode supp=
ort ---
commit 1191525da64840a794eb47502525402f71bb5f79
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

This commit adds SMBus slave mode support for the P3H2x4x hub SMBus target
ports. The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index f6d4ade506e25..c095ae524e664 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> @@ -15,6 +17,177 @@ enum p3h2x4x_smbus_desc_idx {
>  	P3H2X4X_DESC_READ_LEN,
>  };
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, e=
num p3h2x4x_rcv_buf rfbuf,
> +					    enum p3h2x4x_tp tp)
> +{
> +	struct p3h2x4x *p3h2x4x =3D i3cdev_get_drvdata(i3cdev);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	u8 slave_rx_buffer[P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE] =3D { 0 };
[ ... ]
> +	/* read data */
> +	if (packet_len) {
> +		ret =3D regmap_bulk_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_=
DATA,
> +				       slave_rx_buffer, packet_len);

[Severity: High]
Is it safe to pass the stack-allocated slave_rx_buffer directly to
regmap_bulk_read()?

Since the underlying regmap is for an I3C device, this resolves to
regmap_i3c_read(), which maps the user buffer into an i3c_xfer struct.

The I3C subsystem mandates that buffers passed to transfers must be DMA-abl=
e.
Could passing a stack buffer here cause DMA corruption or kernel panics on
systems where the stack is virtually mapped?

> +		if (ret)
> +			goto ibi_err;
> +	}
> +
> +	client =3D p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client;
> +	if (!client)
> +		goto ibi_err;
[ ... ]
> @@ -206,6 +379,115 @@ static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapte=
r *adapter)
>  	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }

[Severity: Low]
Should I2C_FUNC_SLAVE be included in this mask when CONFIG_I2C_SLAVE is
enabled?

Without it, userspace tools and subsystems querying the adapter capabilities
via the I2C_FUNCS ioctl might incorrectly assume the adapter does not suppo=
rt
slave mode.

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
[ ... ]
> +static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +	struct tp_bus *bus =3D i2c_get_adapdata(slave->adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub =3D bus->p3h2x4x_i3c_hub;
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(hub->dev->parent);
> +	int relock_ret =3D 0;
> +	int ret =3D 0;
> +
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (bus->tp_smbus_client !=3D slave)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
> +		/* Unlock access to protected registers */
> +		ret =3D regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +				   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			break;
> +
> +		ret =3D regmap_clear_bits(hub->regmap,
> +					P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +					bus->tp_mask);
> +
> +		/* Lock access to protected registers */
> +		relock_ret =3D regmap_write(hub->regmap,
> +					  P3H2X4X_DEV_REG_PROTECTION_CODE,
> +					  P3H2X4X_REGISTERS_LOCK_CODE);
> +	}
> +
> +	/*
> +	 * A relock failure does not re-enable the IBI, so report it
> +	 * separately and keep the callback result tied to the IBI operation.
> +	 */
> +	if (relock_ret)
> +		dev_err(hub->dev,
> +			"failed to restore protected register lock: %d\n",
> +			relock_ret);
> +
> +	if (ret)
> +		return ret;

[Severity: High]
If ret is non-zero (for example due to an I3C bus error), this returns early
without clearing bus->tp_smbus_client.

The i2c_slave_unregister() core function propagates the error, but the driv=
er
will typically unbind anyway, freeing its private data and potentially
unloading the module.

If an IBI arrives later, could p3h2x4x_read_smbus_agent_rx_buf() see the
dangling tp_smbus_client pointer and call a freed slave_cb via
i2c_slave_event(), resulting in a use-after-free or kernel panic?

Should bus->tp_smbus_client be cleared unconditionally?

> +
> +	/*
> +	 * Clear the software state only after the hardware IBI has been
> +	 * disabled successfully.
> +	 */
> +	bus->tp_smbus_client =3D NULL;
> +	hub->hub_config.tp_config[bus->tp_port].ibi_en =3D false;
> +
> +	return 0;
> +}
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D8

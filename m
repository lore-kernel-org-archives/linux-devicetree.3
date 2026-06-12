Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E133C507
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264517; cv=none; b=kabK7NqDt40c/y7K+PveiZaQuq7PBO/QbHEeAGtma5wEQQWFT70WWS8kJsDp1qU7VKc/6u6aRmftJrNBMwuuI7omp4Hsy19W4TOzpNo1WfYEJ+uo8zL/ng5uB9QcVMsZrJBlsogEm7Puw0c3VXJB/VUyoWiXntGmXmhgsqo48mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264517; c=relaxed/simple;
	bh=TVBnzo45of42ymEL0WqVO1MuMZ22PHKMEB5Zg0Lx1NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HMGiHtrpvehUVRNaXE85Nf0L4A+XOnggHg81gRdSYqI2OkLJOjH9pnBFkYnfeL8y6WQ3rcpslcHIpi9d3L1RnqNqMVWTmGToB1LUpUDMaC1uO7kMigZzMh62io9rPUmKVrtXGrvSA5WQq1yoOj6/kPxJwcYaHeqC7IJxbxJngn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hh0xQU1Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hh0xQU1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081851F000E9;
	Fri, 12 Jun 2026 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264515;
	bh=ylbQ3WDgglVbQIR5UCvUscgBs0RR6IK3cMZ7rSE9EpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hh0xQU1YrqSU2I/+wzvkKzKC/jpIZACY5GFjmXivSFY11b+D5AoizJT9cYvOQBBzw
	 klLAaHH827IjWp1LrjevHWhqeNoTlHZ1v56R7fu/jDO0yMZCR7IhEHnFcKhXZOXKFS
	 WQXWvKPY0wyn03yNvdj4tQfcErXuHpGQLrFf7XBmlA0LPgCSsY8g6YSpBg5HVbaRsN
	 +09/dCjHALlz0TrxCiBEdrUW6p7z8jNbiaYUfNfK4ByyojJvLKxcVObYhF2+hlT4iH
	 l/pyBUaV2OhOq+rMgAPGevDjs/zqydhWU5JpNTi2uELj0EKi++41qer1ABMmETTW5m
	 A452qTUhYFCKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 9/9] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260612111816.3688240-10-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-10-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:41:54 +0000
Message-Id: <20260612114155.081851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unconditional dereference of `tp_smbus_client` prior to its NULL c=
heck in `p3h2x4x_read_smbus_agent_rx_buf`.
- [High] Failure to clear `tp_smbus_client` on hardware error in `p3h2x4x_t=
p_i2c_unreg_slave` leads to Use-After-Free.
- [High] IBI requests are not cleaned up on the `probe` error path, leaving=
 active interrupts pointing to freed device memory.
- [High] Early return on `regmap_read` failure in `p3h2x4x_ibi_handler` abo=
rts processing for other ports, risking an interrupt storm.

Pre-existing issues:
- [High] I2C adapters registered in `p3h2x4x_tp_smbus_algo` are leaked on s=
ubsequent probe errors, leading to Use-After-Free.
--

commit c3438427374cdabfa4f0a09443f69b5b076d009a
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports,
allowing the hub to receive downstream payloads into target buffers and
report receive events through IBI to registered I2C slave clients.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
[ ... ]
> @@ -120,5 +128,24 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *=
p3h2x4x_hub)
>  		p3h2x4x_hub->tp_bus[tp].is_registered =3D true;
>  		p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
>  	}
> -	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_=
mask);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	ret =3D i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);

[Severity: High]
Because these IBI functions are not devres-managed, do we need to manually
clean them up on a probe failure?

If a subsequent step in p3h2x4x_i3c_hub_probe() fails after this completes,
probe will abort and devres will free the p3h2x4x_i3c_hub structure. Since
the I3C core isn't informed to free the IBI, the hardware remains
configured. If an IBI fires later, could p3h2x4x_ibi_handler() try to
dereference the freed driver data?

[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> @@ -15,6 +15,146 @@ enum p3h2x4x_smbus_desc_idx {
>  	P3H2X4X_DESC_READ_LEN,
>  };
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, e=
num p3h2x4x_rcv_buf rfbuf,
> +					    enum p3h2x4x_tp tp, bool is_of)
> +{
[ ... ]
> +	/* notify slave driver about received data */
> +	if ((p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client->addr & 0x7f) =3D=3D (=
slave_address >> 1)) {
> +		client =3D p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client;
> +		if (!client)
> +			goto ibi_err;

[Severity: High]
Can this code cause a panic if an In-Band Interrupt occurs for a port
without a bound SMBus slave client?

We dereference tp_smbus_client->addr unconditionally here, right before
the NULL check happens.

[ ... ]
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
[ ... ]
> +	for (i =3D 0; i < P3H2X4X_TP_MAX_COUNT; ++i) {
> +		if (p3h2x4x_i3c_hub->tp_bus[i].is_registered && (payload_byte_two >> i=
) & 0x01) {
> +			ret =3D regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_S=
TS + i,
> +					  &target_port_status);
> +			if (ret) {
> +				dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
> +				return;
> +			}

[Severity: High]
If regmap_read() fails for one port, this return statement prematurely
exits the handler.

Does this skip clearing the hardware status of the current port and prevent
servicing other ports with pending events? If the underlying hardware
interrupt conditions are not cleared, could the device immediately re-assert
the IBI line and cause an interrupt storm?

[ ... ]
> +static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
> +{
[ ... ]
> +	ret =3D regmap_clear_bits(hub->regmap,
> +				P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +				bus->tp_mask);
> +	if (ret)
> +		return ret;
> +
> +	bus->tp_smbus_client =3D NULL;

[Severity: High]
If regmap_clear_bits() fails, we return the error without clearing
bus->tp_smbus_client.

Since the client driver might still free its i2c_client structure during
removal despite the unregistration failure, could this leave a dangling
pointer that gets dereferenced if an IBI fires later?

[ ... ]
> @@ -205,11 +345,63 @@ static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapte=
r *adapter)
>  	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
> =20
[ ... ]
>  /*
>  * I2C algorithm Structure
>  */
>  static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm =3D {
>  	.master_xfer    =3D p3h2x4x_tp_i2c_xfer,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave =3D p3h2x4x_tp_i2c_reg_slave,
> +	.unreg_slave =3D p3h2x4x_tp_i2c_unreg_slave,
> +#endif
>  	.functionality  =3D p3h2x4x_tp_smbus_funcs,
>  };

[Severity: High]
This is a pre-existing issue, but I2C adapters registered in
p3h2x4x_tp_smbus_algo() lack a devres action for automatic cleanup.

If p3h2x4x_i3c_hub_probe() encounters an error after adapters are added
with i2c_add_adapter(), devres will free the memory backing the adapters,
but they remain registered with the I2C subsystem.

Could this lead to a use-after-free if the I2C core accesses these ghost
adapters?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D9

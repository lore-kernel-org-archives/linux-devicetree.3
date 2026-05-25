Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2AB340DB8
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704974; cv=none; b=RdSuv60y3Yu19sk6O+CTE23Z50y9BA/vTUJNL4hlY/TW1a7btPtOK2HzdRVfcJBord+4psZcy6yDxxhiBTtwpDBjxYlKF3V5GwTD7iSww0X7vx0FohUX7VTAdKxOddtz9MptxwVw/K3jZkJXVwUWX5m90mAXa3Yi7iDEsyP/NJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704974; c=relaxed/simple;
	bh=wFA6S8nssTqRa6h1kHUEN5lGTBp6uTuq3U5uGUZ/Zao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bxTCPC0/MEGY7pHt4e7Qg0wsov3g2sTTkuBzY1MuMkWctzDrV9mPhgCA6msi581EDCnJYQJYASOASKwiW4gpqjjYg6NWDQc/f8BBGDZyCC3k/5ReLuOThqTXDIObZ0ZExuO/siayYQGdW74egjVuTEZubJWR5+RNqkk7U04XDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eobIgjrW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eobIgjrW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE301F00A3A;
	Mon, 25 May 2026 10:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704972;
	bh=fE3XxyY4LfZlcEy5nna/fMDUcQrJrXuJa8jt7bED+hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eobIgjrWBvDI8568OS3tqn44K/jTRts7i9GSm5JLR5Ae/4H5BkFu1rpd3h93CP92e
	 NHdjR2aYNy0UV0vjUbad2X8SWu9xa93kolP+ih+aoPPYCfdLqmoiAOFo1ckgd8pcJY
	 2jS+7Hrsh3HU+eT9ZXGcJcsiwm3YVars4dNQCKfMqgPOei/Lg6KgZG3E89DNAgcsMX
	 PTgXl4jGpRJxMN/adLGmqE1mGy9XxoGqUgaVNQ51ZN2srt/FW54b9Z2z46fR5XvIZI
	 ahj/CteyEeZyGm2PljhCKnA3asSUtbOwaUiu7Ih2v7D62lmmGXc88lLZpjiuXBFBu7
	 9deN2DBj+KBdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 9/9] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525064209.2263045-10-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-10-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:29:31 +0000
Message-Id: <20260525102932.7FE301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] The IBI handler reads 8 bytes from a potentially smaller payload b=
uffer and incorrectly casts the byte array to `int *`.
- [High] IBI resources are permanently leaked and left enabled on probe fai=
lure paths, leading to a Use-After-Free.
- [High] Failure to clear the `tp_smbus_client` pointer on a hardware error=
 during slave unregistration creates a dangling pointer.
- [High] Unchecked dereference of `tp_smbus_client` when processing an SMBu=
s agent RX buffer.
- [High] Incorrect teardown order in the device removal function exposes a =
window for Use-After-Free.
- [High] The IBI handler invokes opaque subsystem callbacks with a global h=
ardware mutex held, risking deadlocks.
- [Medium] Passing the address of a 32-bit variable cast to `u8 *` to `i2c_=
slave_event` yields an incorrect value on big-endian architectures.
- [Low] An uninitialized stack variable is passed to the I2C slave event su=
bsystem if the packet length is zero.

Pre-existing issues:
- [Critical] The driver unregisters the I3C master controller twice during =
device removal.
--

commit fc819c542aa0d8f86b3e2a96ec99e8ee3cec6f5d
Author: Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: i3c: hub: p3h2x4x: Add SMBus slave mode support

This patch adds SMBus slave mode support for the P3H2x4x hub SMBus target
ports. It enables the receive path and forwards the received payloads to
the registered I2C slave client using i2c_slave_event() by processing
hardware IBI events.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> index f1a24a3d3ffa0..26d5e13455cae 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
[ ... ]
> @@ -328,6 +328,12 @@ static void p3h2x4x_i3c_hub_remove(struct platform_d=
evice *pdev)
>  			i3c_master_unregister(&p3h2x4x_i3c_hub->tp_bus[i]
>  					      .hub_controller.controller);
>  	}

[Severity: Critical]
This is a pre-existing issue, but does this function double-unregister the
I3C master controller?

The controller appears to be registered via devres in p3h2x4x_tp_i3c_algo()
with devm_add_action_or_reset(..., p3h2x4x_unregister_i3c_master, ...).
Since this explicit call executes first during removal, will the later
devres unwinding trigger the action again and cause a double-free?

[Severity: High]
Also, since i2c_del_adapter() is called in the loop just before this, could
an IBI interrupt fire before we call i3c_device_disable_ibi() below?

If the handler executes concurrently, might it attempt to access slave clie=
nt
structures that have already been freed by i2c_del_adapter()?

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (p3h2x4x->i3cdev) {
> +		i3c_device_disable_ibi(p3h2x4x->i3cdev);
> +		i3c_device_free_ibi(p3h2x4x->i3cdev);
> +	}
> +#endif
>  }

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> index 38505dda0e81b..544d961d0b8ad 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
[ ... ]
> @@ -120,5 +128,14 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *=
p3h2x4x_hub)
>  		p3h2x4x_hub->tp_bus[tp].is_registered =3D true;
>  		p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
>  	}
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	ret =3D i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
> +	if (ret)
> +		return ret;
> +#endif
>  	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_=
mask);

[Severity: High]
If the subsequent regmap_write() fails here, do we permanently leak the IBI
resource?

If this function returns an error without disabling or freeing the IBI, the
probe will abort and devres will free the p3h2x4x_i3c_hub driver data.
Could a subsequent hardware IBI trigger p3h2x4x_ibi_handler() and
dereference the freed driver data?

>  }

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index 43639f04b77ac..12fac276b0410 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> @@ -15,6 +15,135 @@ enum p3h2x4x_smbus_desc_idx {
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

[Severity: High]
Could tp_smbus_client be NULL when dereferenced here?

Since IBIs are globally requested and enabled for the hub, an IBI might
arrive before a slave driver registers or after unregistration, resulting
in a NULL pointer dereference.

> +		i2c_slave_event(p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client,
> +				I2C_SLAVE_WRITE_REQUESTED, (u8 *)&slave_address);

[Severity: Medium]
Will this pass the correct value on big-endian architectures?

Since slave_address is declared as a u32 variable, passing its address
cast to u8 * will yield the most significant byte (which is zero) instead
of the actual address byte.

> +		for (i =3D 0; i < packet_len; i++) {
> +			temp =3D slave_rx_buffer[i];
> +			i2c_slave_event(p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client,
> +					I2C_SLAVE_WRITE_RECEIVED, &temp);
> +		}
> +		i2c_slave_event(p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client, I2C_SLAVE=
_STOP, &temp);

[Severity: Low]
If packet_len is 0, does this pass an uninitialized stack variable temp
to the I2C slave event subsystem?

> +	}
> +
> +ibi_err:
> +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
> +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, =
flag_clear);
> +}
> +
> +/**
> + * p3h2x4x_ibi_handler - IBI handler.
> + * @i3cdev: i3c device.
> + * @payload: two byte IBI payload data.
> + *
> + */
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
> +	u32 target_port_status, payload_byte_one, payload_byte_two;
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	u32 ret, i;
> +
> +	payload_byte_one =3D (*(int *)payload->data);

[Severity: High]
Does this unconditionally read 4 bytes regardless of payload->len?

If the actual hardware payload is smaller, this could cause an
out-of-bounds memory access. Also, does casting a byte array to an integer
pointer misinterpret the payload bytes on big-endian architectures?

> +
> +	if (!(payload_byte_one & P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS))
> +		return;
> +
> +	p3h2x4x_i3c_hub =3D i3cdev_get_drvdata(i3cdev);
> +
> +	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
> +		return;
> +
> +	payload_byte_two =3D (*(int *)(payload->data + 4));
> +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);

[Severity: High]
Could holding etx_mutex here lead to a deadlock?

Since the handler goes on to invoke i2c_slave_event(), if the registered
slave driver callback reacts to the event by initiating an I2C transaction
on the hub, the hub's master transfer function might attempt to acquire
this same etx_mutex lock.

[ ... ]
> @@ -199,11 +328,63 @@ static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapte=
r *adapter)
[ ... ]
> +static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +	struct tp_bus *bus =3D i2c_get_adapdata(slave->adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub =3D bus->p3h2x4x_i3c_hub;
> +	int ret;
> +
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (bus->tp_smbus_client !=3D slave)
> +		return -EINVAL;
> +
> +	ret =3D regmap_clear_bits(hub->regmap,
> +				P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +				bus->tp_mask);
> +	if (ret)
> +		return ret;
> +
> +	bus->tp_smbus_client =3D NULL;

[Severity: High]
If regmap_clear_bits() fails, it returns an error and bypasses clearing
bus->tp_smbus_client.

Since the I2C subsystem proceeds with tearing down the client anyway, does
this leave a dangling pointer that will be dereferenced in a subsequent IBI
interrupt handling?

> +	hub->hub_config.tp_config[bus->tp_port].ibi_en =3D false;
> +
> +	return 0;
> +}
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D9

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E883F4DCA
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695452; cv=none; b=K0At0Iz3bJt1BAiH6O6pATwdpR3bWgrvEAH9h9aTql+C561VtiuHyv8eDFrlnVXqHEFwYZJgCSdZO7oip8GNBS7hrFG3PQsg0YoC69Bg3Qlbc2zcKYxBEvDFZwhPQMduDI9OulJ8dPyzTKGTCYjI6wFUBSUKz7fyDY8bbODR8uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695452; c=relaxed/simple;
	bh=zYAtaTMA4z9/HpMPf9VKERGrjsAPBGPy/VySfhkFzyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MGbtlZBav07MicdsfWIFOZ9/z18U19jA+29ezPQA0wLJfUXtmC19gii2z9GkcGucxLF8eZGAa82hml8ytYtNbANfHgSRpAG2cXVs9yNKxRwXL/Ok7Vas9S4dpfpwyyF8krnLeWlKnab5SkM/TvLxIM/YX7M2exKTceoAgT37kvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLDe4zRm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLDe4zRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2DB1F0156D;
	Wed, 17 Jun 2026 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695445;
	bh=1GqKDiifPoS5JBbx/0LyqR8zvsDknb4g0B97x2ss29M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NLDe4zRmcGEkicRquX2aePUurgczhyu2hAlt30OQYkwgLZKy6+mCXQ7XiiHGxgjHp
	 nG5lLxq7/wtx9mCR+KTlqgS8kV7+gC2jB7JVYvstH3yPmamkLCXVlmZM67/3SWl5oB
	 CdYYpHl9u1wqdONH+2BK5DW1XTMh8hXC2jiFAsNbWrs+Paa7c7aMo5YHKARgcJI756
	 o7lCFqmDJAP9rhlIncJTMvglEsYvUDoOaf+7QjLpb52PwFk8tYe4xRmDbcArfAjuzx
	 ZuPXgECTkeLi9aSBGtMU06RsnE7Vj+Sxd/DjLZl7/5CpWAptw6ohcMmhpA8uMs3jQW
	 bWc23Bu8V41NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 7/7] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617110355.1591844-8-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:24:04 +0000
Message-Id: <20260617112404.8D2DB1F0156D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unconditional IBI request causes probe failure if the upstream I3C=
 controller lacks IBI support.
- [High] Over-clearing buffer status flags on error paths discards pending =
data in the receive buffers.
- [High] DMA-from-stack vulnerabilities by allocating buffers on the stack =
and passing them to regmap bulk operations.
- [Medium] SMBus slave registration configures IBI without verifying if the=
 upstream connection is I3C.
- [Medium] Missing SMBus agent status clear for unregistered ports leads to=
 IBI storms.
- [Medium] Lockless read of `is_registered` in the IBI handler races with l=
ockless write during SMBus adapter teardown.
--

commit 4badb83d7f4fe074334808f3d555ec26e7923604
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

This commit adds SMBus slave mode support for the P3H2x4x hub target ports.
The hub SMBus slave agent can receive downstream payloads into target buffe=
rs
and report receive events through IBI, which are then forwarded to the
registered I2C slave client.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c

[ ... ]

> @@ -117,5 +135,25 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *=
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

[Severity: High]
Could this unconditional IBI request cause the probe to fail entirely if the
upstream I3C master controller does not support In-Band Interrupts?

If i3c_device_request_ibi() returns an error like -ENOTSUPP, it looks like
it aborts the entire initialization sequence for the hub.=20

Does this mean the core I3C/I2C target port routing functionality would bre=
ak
on systems without IBI support merely because an optional SMBus slave featu=
re
could not be enabled?

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
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D i3cdev_get_drvdata(i3cd=
ev);
> +	u8 slave_rx_buffer[P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE] =3D { 0 };
> +	u8 target_buffer_page, flag_clear =3D 0x0f, temp =3D 0, i, addr;

[Severity: High]
This isn't a bug strictly introduced by this patch, as a similar preexisting
flaw exists in p3h2x4x_tp_i2c_xfer_msg() with the desc array, but allocating
slave_rx_buffer on the stack and passing it to regmap bulk operations can
cause DMA-from-stack vulnerabilities.

Because the underlying regmap is backed by an I3C controller that may use D=
MA
for transfers, passing stack addresses is unsafe.

If CONFIG_VMAP_STACK is enabled, the stack memory is not guaranteed to be
physically contiguous, which could cause dma_map_single() to fail or corrupt
memory.

Should these buffers be dynamically allocated or pre-allocated in the device
structure instead?

> +	u32 packet_len, slave_address, ret;

[ ... ]

> +ibi_err:
> +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
> +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, =
flag_clear);
> +}

[Severity: High]
Could this over-clear the buffer status flags on error paths and discard
pending data?

The local variable flag_clear is initialized to 0x0f, which matches
BUF_RECEIVED_FLAG_TF_MASK.

If an early error occurs before flag_clear is constrained to the specific p=
ort
buffer flag, it will write 0x0f to the status register.

Will this unconditionally clear all receive buffer flags, including buffer =
0,
buffer 1, and overflow flags, for that port? If the other buffer contained a
valid pending message, would it be silently dropped?

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

[ ... ]

> +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
> +
> +	for (i =3D 0; i < P3H2X4X_TP_MAX_COUNT; ++i) {
> +		if (p3h2x4x_i3c_hub->tp_bus[i].is_registered && (payload_byte_two >> i=
) & 0x01) {

[Severity: Medium]
What happens if an IBI is triggered by a port that is not registered?

Since the loop skips unregistered ports entirely, the hardware interrupt so=
urce
at P3H2X4X_TP0_SMBUS_AGNT_STS is never read or cleared.

Does this mean the underlying hardware condition remains active, causing the
hub to immediately re-assert the IBI after the handler returns?

Could this result in an infinite loop of IBIs locking up the I3C bus, and
should the event status be cleared defensively even for unregistered ports?

[Severity: Medium]
Is there a data race here involving the read of is_registered?

During driver unbind or probe failure, p3h2x4x_unregister_smbus_adapters()
executes hub->tp_bus[tp].is_registered =3D false; without holding etx_mutex.

Because the devm action to free the IBI executes after the SMBus teardown
action, this new handler could be running concurrently and reading
is_registered under etx_mutex.

Since the writer does not hold the mutex, should this state modification be
properly synchronized?

> +			ret =3D regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_S=
TS + i,

[ ... ]

> @@ -205,11 +345,64 @@ static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapte=
r *adapter)
>  	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
> +{
> +	struct tp_bus *bus =3D i2c_get_adapdata(slave->adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub =3D bus->p3h2x4x_i3c_hub;
> +	int ret;
> +
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (bus->tp_smbus_client)
> +		return -EBUSY;
> +
> +	ret =3D regmap_set_bits(hub->regmap,
> +			      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +			      bus->tp_mask);

[Severity: Medium]
Does this configure IBI without verifying if the upstream connection is I3C?

The registration enables P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG to route receive
events via IBI. However, it does not check if the hub is connected via an I=
3C
bus (i.e., whether hub->i3cdev is valid and an IBI handler was successfully
requested).

If the hub is connected via an I2C upstream bus, it cannot generate IBIs.
Enabling IBI generation on an I2C-connected hub would cause slave receive
events to be silently dropped since no handler is registered.

Should this function return -EOPNOTSUPP if !hub->i3cdev?

> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D7

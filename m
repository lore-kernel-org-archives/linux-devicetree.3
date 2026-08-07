Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC443815C3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110169; cv=none; b=uJfceWDKa44PM2LLtaPjEQq2qEpCd2AjfaKzPf0/8qF9VwP7UjCKaQIwnXzO9x8fHsNZX+nKW+hjbjD4E7up4YXd3+V7p7tq6T6tNSt0pj4WzyE5ifpLo56CIIzMBRgThibbZ3SG3ZOLDBxibvb7Y62THholF4z/V20TtHC53Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110169; c=relaxed/simple;
	bh=ug9gPNBT0dHwIRjViBXQX/awgDAQTKmQmA6Wqon1Sic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XoYa5mWBvV7QgIbtuKVgIfjUH/Iqdpr+s7rTUo5m0zEmiIykE5uWQJnDMpmg3NnmesS4Oamdrh9zOL8EDJlUdleXjlJPCipKOCPimmtZgH6EkrLv0DzaXEwg+bepWcr4kKpTkuAlheL+gD1qJ1hy+UsedSYAOJC2bDd40UtDnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHaBXrTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHaBXrTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249BB1F000E9;
	Fri,  7 Aug 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110157;
	bh=Zp13FvG/6XChZ/3wErU+YhvaSD2ZUlkCkqwZ9g8mzEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iHaBXrTgLGiN0F5OQN/nQVy/8WgHE/xP4WIcw5AQWU7YmBgHMpCMLIfNEuxSWGB41
	 hXR85l4Few6XqEmch6Rd4fFzD0vO71xim8unhvuZZ3D+Cg0/FbmXihtZ4Ig/JzsZW6
	 PLSbQ4gwBY8iUKm7J4fExTczpHz1X0WuQyBY2zfC6L8eDrHmwx2LHmRRRc+7e0lp+S
	 FYH32Gj3XWquL0u6TImdR/uPY0iP99pRtV595MdMl9EQeW2OHQONJx/EuaTLNKxWlw
	 SvB1ro/aNq46L/BW3CqKpw5gYgO/QNoIS4pHBGB8bcvaHZemDRzYxRF5TDovO+CV+K
	 TgbVdc5+ERYxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:42:36 +0000
Message-Id: <20260807134237.249BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Stack buffer overflow in `max_ser_get_frame_desc_state` due to mis=
sing bounds check on `fd->num_entries`.
- [High] Writing unshifted 7-bit I2C client address into 8-bit hardware reg=
isters in `max_ser_fix_tx_ids`.
- [High] If `media_create_pad_link()` fails in `max_ser_notify_bound()`, `s=
ource->sd` is left pointing to the subdev, creating a dangling pointer.
- [High] Stack-allocated buffers are passed directly to `i2c_transfer()`, v=
iolating I2C API requirements and causing panics on DMA-enabled systems.
- [High] The global `ser->active` flag is incorrectly overwritten by the st=
ate of a single pad, allowing format modifications while the hardware is ac=
tively streaming.
- [High] Concurrent I2C ATR attach/detach operations cause data races on th=
e shared `i2c_xlates` array.
- [High] TOCTOU race between async subdevice unbind and route processing le=
ads to a use-after-free of the source subdevice.
- [High] The return value of `i2c_transfer()` is checked incorrectly, leadi=
ng to silent partial transfer failures and garbage reads.
- [Medium] Improper use of devres APIs (`devm_kcalloc` and `devm_kfree`) in=
 the hot streaming path.
- [Medium] Routing logic restricts all streams from a given PHY to a single=
 pipe, ignoring multiple pipes.
- [Medium] Returning -EINVAL for unsupported formats in `set_fmt` and `set_=
frame_interval` breaks V4L2 format negotiation.
- [Low] Potential kernel panic due to division by zero if `num_phys` is 0.
- [Low] `max_ser_log_status` prematurely aborts logging when encountering t=
he first disabled I2C translation, missing active translations at higher in=
dices.
--

--- Patch [14]: [PATCH v15 14/22] media: i2c: add Maxim GMSL2/3 serializer =
framework ---
commit 60c008b16504a2b4c009035ea0ab39d7dfbf93c1
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 serializer framework

This patch adds a common framework for Maxim GMSL2/3 serializers supporting
features like the Streams API, get_frame_desc(), I2C ATR, and automatic
configurations.

> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c=
/maxim-serdes/max_ser.c
> index 0000000000000..2699c57c18404 100644
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c
[ ... ]
> @@ -109,6 +109,7 @@ static struct max_ser_pipe *
>  max_ser_find_phy_pipe(struct max_ser *ser, struct max_ser_phy *phy)
>  {
>  	unsigned int i;
> =20
>  	for (i =3D 0; i < ser->ops->num_pipes; i++) {
>  		struct max_ser_pipe *pipe =3D &ser->pipes[i];
> =20
>  		if (pipe->phy_id =3D=3D phy->index)
>  			return pipe;

[Severity: Medium]
Will this unconditionally return the first matching pipe for a PHY?
If the hardware supports multiple pipes mapped to a single PHY, this
appears to render the additional assigned pipes unreachable.

>  	}
> =20
>  	return NULL;
>  }
[ ... ]
> @@ -219,6 +219,8 @@ static int max_ser_route_to_hw(struct max_ser_priv *p=
riv,
> =20
>  	hw->source =3D max_ser_get_phy_source(priv, phy);
>  	if (!hw->source->sd)
>  		return 0;

[Severity: High]
Does returning 0 unconditionally when the source subdevice is missing
allow arbitrary userspace-defined routes to bypass validation and
incorrectly increment the entry counter?

Also, could a TOCTOU race occur here? If max_ser_notify_unbind() clears
source->sd asynchronously without holding a lock, this might pass the NULL
check but result in a use-after-free when v4l2_subdev_call dereferences it.

> =20
>  	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
>  			       hw->source->pad, &fd);
[ ... ]
> @@ -239,6 +239,8 @@ static int max_ser_i2c_atr_attach_addr(struct i2c_atr=
 *atr, u32 chan_id,
>  	int ret;
> =20
>  	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++)
>  		if (!ser->i2c_xlates[i].en)
>  			break;

[Severity: High]
Are concurrent attach and detach operations serialized here?
It looks like this finds a free slot and modifies the global translation ar=
ray
without locking. Since the ATR core locks are per-channel, concurrent hotpl=
ugs
on different channels could cause data races on i2c_xlates.

> =20
>  	if (i =3D=3D ser->ops->num_i2c_xlates) {
[ ... ]
> @@ -262,6 +262,8 @@ static void max_ser_i2c_atr_detach_addr(struct i2c_at=
r *atr, u32 chan_id, u16 ad
>  	unsigned int i;
> =20
>  	/* Find index of matching I2C translation. */
>  	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++)
>  		if (ser->i2c_xlates[i].dst =3D=3D addr)
>  			break;

[Severity: High]
Could clearing a slot in the global translation array race with other
attach/detach operations?

> =20
>  	if (WARN_ON(i =3D=3D ser->ops->num_i2c_xlates))
[ ... ]
> @@ -420,6 +420,8 @@ static int max_ser_set_tpg_fmt(struct v4l2_subdev *sd,
> =20
>  	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
>  				       fmt->code, 0, 0);
>  	if (!entry)
>  		return -EINVAL;

[Severity: Medium]
Should this return -EINVAL if the exact format is not found?
The V4L2 specification generally requires falling back to a supported format
rather than returning an error during format negotiation.

> =20
>  	in =3D v4l2_subdev_state_get_interval(state, format->pad, format->strea=
m);
[ ... ]
> @@ -557,6 +557,7 @@ static int max_ser_log_status(struct v4l2_subdev *sd)
>  		v4l2_info(sd, "\ten: %u, src: 0x%02x dst: 0x%02x\n",
>  			  ser->i2c_xlates[i].en, ser->i2c_xlates[i].src,
>  			  ser->i2c_xlates[i].dst);
>  		if (!ser->i2c_xlates[i].en)
>  			break;

[Severity: Low]
Will the break statement prematurely abort logging?
If an intermediate I2C translation was detached, this might mask later valid
entries in the array.

>  	}
>  	v4l2_info(sd, "\n");
[ ... ]
> @@ -597,6 +597,8 @@ static int max_ser_set_frame_interval(struct v4l2_sub=
dev *sd,
> =20
>  	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
>  				       fmt->code, fi->interval.numerator,
>  				       fi->interval.denominator);
>  	if (!entry)
>  		return -EINVAL;

[Severity: Medium]
Is it intentional to return -EINVAL for unsupported frame intervals?
V4L2 typically expects drivers to fall back to the closest supported interv=
al.

> =20
>  	in =3D v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
[ ... ]
> @@ -678,6 +678,7 @@ static int max_ser_get_frame_desc_state(struct v4l2_s=
ubdev *sd,
>  		if (ret)
>  			return ret;
> =20
>  		hw.entry.stream =3D route->source_stream;
> =20
>  		fd->entry[fd->num_entries++] =3D hw.entry;

[Severity: High]
Can fd->num_entries exceed V4L2_FRAME_DESC_ENTRY_MAX here?
If a userspace application configures more than 8 active routes, this could
lead to a stack buffer overflow.

>  	}
> =20
>  	return 0;
[ ... ]
> @@ -897,6 +897,8 @@ static int max_ser_update_pipe(struct max_ser_priv *p=
riv,
> =20
>  	if (!ser->ops->num_dts_per_pipe)
>  		return 0;
> =20
>  	dts =3D devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts=
),
>  			   GFP_KERNEL);
>  	if (!dts)

[Severity: Medium]
Is it safe to use devm_kcalloc dynamically in a runtime path?
Using devres APIs in the hot streaming path requires an O(N) list traversal
under a spinlock for every free operation, which could lead to locking
overhead and memory fragmentation.

>  		return -ENOMEM;
[ ... ]
> @@ -1098,6 +1098,7 @@ static int max_ser_update_streams(struct v4l2_subde=
v *sd,
>  			goto err_revert_phys_update;
>  	}
> =20
>  	devm_kfree(priv->dev, priv->streams_masks);

[Severity: Medium]
Similarly, is it appropriate to call devm_kfree dynamically here?

>  	priv->streams_masks =3D streams_masks;
>  	ser->active =3D !!streams_masks[pad];

[Severity: High]
Could overwriting the global ser->active flag with a single pad's state
allow format modifications while the hardware is actively streaming?
If Pad A is streaming and userspace disables Pad B, ser->active becomes 0,
potentially allowing set_fmt on Pad A.

> =20
>  	return 0;
[ ... ]
> @@ -1528,6 +1528,8 @@ static int max_ser_notify_bound(struct v4l2_async_n=
otifier *nf,
>  		return ret;
>  	}
> =20
>  	source->sd =3D subdev;
>  	source->pad =3D ret;
> =20
>  	ret =3D media_create_pad_link(&source->sd->entity, source->pad,

[Severity: High]
If media_create_pad_link fails, will source->sd be left pointing to the sub=
dev?
This could create a dangling pointer and result in a use-after-free later if
the async subdevice binding is aborted and freed.

>  				    &priv->sd.entity, pad,
[ ... ]
> @@ -1549,6 +1549,7 @@ static void max_ser_notify_unbind(struct v4l2_async=
_notifier *nf,
>  	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
>  	struct max_serdes_source *source =3D asc->source;
> =20
>  	source->sd =3D NULL;

[Severity: High]
Could a TOCTOU race occur between this unbind and route processing?
source->sd is cleared asynchronously without locks, which could race with
max_ser_route_to_hw() as mentioned earlier.

>  }
[ ... ]
> @@ -1734,6 +1734,7 @@ static int max_ser_parse_dt(struct max_ser_priv *pr=
iv)
>  	for (i =3D 0; i < ser->ops->num_pipes; i++) {
>  		pipe =3D &ser->pipes[i];
>  		pipe->index =3D i;
>  		pipe->phy_id =3D i % ser->ops->num_phys;

[Severity: Low]
Could ser->ops->num_phys be 0 here, leading to a division by zero panic?

>  		pipe->stream_id =3D i % MAX_SERDES_STREAMS_NUM;
>  	}
[ ... ]
> @@ -2137,6 +2137,8 @@ static int max_ser_read_reg(struct i2c_adapter *ada=
pter, u8 addr,
>  			    u16 reg, u8 *val)
>  {
>  	u8 buf[2] =3D { reg >> 8, reg & 0xff };
>  	struct i2c_msg msg[2] =3D {
>  		{

[Severity: High]
Is it safe to pass the stack-allocated buf directly to i2c_transfer()?
On systems with DMA-enabled I2C controllers and CONFIG_VMAP_STACK=3Dy, pass=
ing
a stack buffer can cause memory corruption or kernel panics.

>  			.addr =3D addr,
[ ... ]
> @@ -2153,6 +2153,8 @@ static int max_ser_read_reg(struct i2c_adapter *ada=
pter, u8 addr,
>  	};
>  	int ret;
> =20
>  	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
>  	if (ret < 0)
>  		return ret;

[Severity: High]
Does this correctly check the return value of i2c_transfer()?
If a partial transfer occurs (e.g. ret =3D=3D 1 due to a NAK on the second =
msg),
the driver might silently accept it and process uninitialized data from buf.

> =20
>  	*val =3D buf[0];
[ ... ]
> @@ -2165,6 +2165,8 @@ static int max_ser_write_reg(struct i2c_adapter *ad=
apter, u8 addr,
>  			     u16 reg, u8 val)
>  {
>  	u8 buf[3] =3D { reg >> 8, reg & 0xff, val };
>  	struct i2c_msg msg[1] =3D {
>  		{

[Severity: High]
Similarly, passing the stack-allocated buf to i2c_transfer() here could
cause issues with DMA-enabled I2C controllers.

>  			.addr =3D addr,
[ ... ]
> @@ -2177,6 +2177,8 @@ static int max_ser_write_reg(struct i2c_adapter *ad=
apter, u8 addr,
>  	};
>  	int ret;
> =20
>  	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
>  	if (ret < 0)
>  		return ret;

[Severity: High]
Does if (ret < 0) fail to catch partial transfers for writes as well?

> =20
>  	return 0;
[ ... ]
> @@ -2236,6 +2236,7 @@ int max_ser_fix_tx_ids(struct i2c_adapter *adapter,=
 u8 addr)
>  	int ret;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(addr_regs); i++) {
>  		ret =3D max_ser_write_reg(adapter, addr, addr_regs[i], addr);

[Severity: High]
Is the 7-bit I2C client address written directly without the required 1-bit
left shift? In max_ser_change_address, FIELD_PREP is used correctly, but
here the unshifted address is written to an 8-bit hardware register.

>  		if (ret)
>  			return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D14

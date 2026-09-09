Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063FC4B5CBD
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961784; cv=none; b=fmYwr2Px55RgtwIP0ss2YVy4yboUxT/4lQiZhgwczudGDtFtG/E5KHPhQKs/8D3KGgyESS3rUUhQKkAqACiC8s5tFzAdivMKko9NDWxwcw0N3gJGQ6L7YZYeMAzrJJ/UrAtRr90yXEGiEUl6MRNv3mrS7IqjEN23g9PG64DLPr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961784; c=relaxed/simple;
	bh=lclhfDyMSo5EE0ur0gokYQmF0AfTTqXG5i6lzJ8Z4SU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RoK+Nymyf+BkUiYBiSyD2fSsaHiRlPiwWLLiDk1DIcSvbj5jKL8kt5dbzovZUWhYMTAe857ZvpzwadS+2rBpoBEKH4rIyw7Otvua6R2a3tzkr6LjebOBGSuZWEobkssKqZTKNrJG2gaG0TkLDXf+HBhdoKhV12zEnJjYfTb/VaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uixx7+2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uixx7+2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3FE1F00A3D;
	Wed,  9 Sep 2026 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961782;
	bh=a7wrHBGRd9QDuh5kAJiUCpu12kwUUu/RRklKJDZlMiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uixx7+2NDRMsZ7/tSgJ2cajTh8JEyh5fonxxVde/j3PtvyQMKV6LcZYadnsw6qSQO
	 ZctjMLk1C9h+CYTSwpMf0uvOa34k2Ff2dM9H5O9/rvyFI8kBfBymTvc2WDH+s2e2Cj
	 labo7F13kmrdWgsRZ6WsHXY+HvJZAqaLg4evelvn9SHXwyMG1SNpb/23FXMrMB95mY
	 Ll7yiihR64heh5zfr6Qw+bGSgLkQ6bSRCuiXNl0Vewd4G+Rzee16xBtXG7nGnA/FQX
	 p8VMHfKkEuzaj7g0bmuMgzMUmGGoQwDAr3GEq9WEM8bopxZ27ueEHiFczwRJluRfek
	 ur4RRiI+U0Gcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-14-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-14-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:49:41 +0000
Message-Id: <20260909134942.5A3FE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Global active stream state `ser->active` is incorrectly cleared ba=
sed on a single pad's activity, bypassing safety checks.
- [High] Lockless TOCTOU race on remote subdevice pointer `hw->source->sd` =
leads to a Use-After-Free.
- [Medium] V4L2 API violation: format and frame interval setters return `-E=
INVAL` instead of coercing unsupported requests.
- [Medium] Error handlers in `max_ser_update_phy` hardcode the global state=
 instead of using the provided rollback state parameter.
- [Medium] Fragile rollback logic relies on dynamic memory allocation (`dev=
m_kcalloc`) and ignores failures.
--

commit 9430220b74c7534e5c5a372a45443f0cc95ff25e
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 serializer framework

This commit adds a common framework for Maxim GMSL2/3 serializers. It
enables support for the Streams API, I2C ATR, automatic GMSL link version
negotiation, and various other features across the chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c=
/maxim-serdes/max_ser.c
> new file mode 100644
> index 0000000000000..673c1b34b8e77
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c

[ ... ]

> +static int max_ser_route_to_hw(struct max_ser_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_route *route,
> +			       struct max_ser_route_hw *hw)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_mbus_frame_desc fd =3D {};
> +	struct max_ser_phy *phy;
> +	unsigned int i;
> +	int ret;
> +
> +	memset(hw, 0, sizeof(*hw));
> +
> +	hw->is_tpg =3D max_ser_pad_is_tpg(ser, route->sink_pad);
> +	if (hw->is_tpg)
> +		return max_ser_tpg_route_to_hw(priv, state, route, hw);
> +
> +	phy =3D max_ser_pad_to_phy(ser, route->sink_pad);
> +	if (!phy)
> +		return -ENOENT;
> +
> +	hw->pipe =3D max_ser_find_phy_pipe(ser, phy);
> +	if (!hw->pipe)
> +		return -ENOENT;
> +
> +	hw->source =3D max_ser_get_phy_source(priv, phy);
> +	if (!hw->source->sd)
> +		return 0;
> +
> +	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
> +			       hw->source->pad, &fd);

[Severity: High]
Is this pointer safe to access here without taking a lock? If a userspace
thread concurrently calls format or routing ioctls, and the remote sensor
module is unloaded, max_ser_notify_unbind could set source->sd =3D NULL. Si=
nce
there is no synchronization (like a reference count or graph lock) held
across this block, does this allow v4l2_subdev_call to dereference a freed
pointer?

[ ... ]

> +static int max_ser_set_tpg_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt =3D &format->format;
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_fract *in;
> +
> +	if (format->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				       fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Does this violate the V4L2 core contract by rejecting the format entirely
instead of coercing it? Typically, the driver should automatically adjust
formats to the closest match rather than returning an error when an exact
match isn't found.

[ ... ]

> +static int max_ser_set_frame_interval(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_fract *in;
> +
> +	if (!max_ser_pad_is_tpg(ser, fi->pad) ||
> +	    fi->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -ENOTTY;
> +
> +	if (fi->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ser->active)
> +		return -EBUSY;
> +
> +	fmt =3D v4l2_subdev_state_get_format(state, fi->pad, fi->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				       fmt->code, fi->interval.numerator,
> +				       fi->interval.denominator);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Similar to the format setter above, should this coerce the frame interval to
the closest supported value instead of outright rejecting the request with =
an
error?

[ ... ]

> +static int max_ser_update_pipe(struct max_ser_priv *priv,
> +			       struct max_ser_pipe *pipe,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe_mode mode =3D { 0 };
> +	unsigned int num_dts;
> +	unsigned int *dts;
> +	unsigned int vcs;
> +	int ret;
> +
> +	if (!ser->ops->num_dts_per_pipe)
> +		return 0;
> +
> +	dts =3D devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts=
),
> +			   GFP_KERNEL);
> +	if (!dts)
> +		return -ENOMEM;

[Severity: Medium]
Is it safe to rely on dynamic allocation here? This is called during stream
start/stop operations, and if the allocation fails during a rollback, the
error is ignored and the hardware could be left in a corrupted state. Also,
using device-managed memory dynamically on operations triggered by userspace
might continuously leak memory onto the devres list.

[ ... ]

> +static int max_ser_update_phy(struct max_ser_priv *priv,
> +			      struct v4l2_subdev_state *state,
> +			      struct max_ser_phy *phy, u64 *streams_masks,
> +			      u64 *old_streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	u32 pad =3D max_ser_phy_to_pad(ser, phy);
> +	bool enable_changed =3D !streams_masks[pad] !=3D !old_streams_masks[pad=
];
> +	bool enable =3D !!streams_masks[pad];
> +	struct max_ser_pipe *pipe;
> +	int ret;
> +
> +	pipe =3D max_ser_find_phy_pipe(ser, phy);
> +	if (!pipe)
> +		return -ENOENT;
> +
> +	if (!enable && enable_changed) {
> +		ret =3D max_ser_phy_set_active(ser, phy, enable);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D max_ser_update_pipe(priv, pipe, state, streams_masks);
> +	if (ret)
> +		goto err_revert_phy_disable;
> +
> +	ret =3D max_ser_update_pipe_enable(priv, pipe, state, streams_masks);
> +	if (ret)
> +		goto err_revert_pipe_update;
> +
> +	if (enable && enable_changed) {
> +		ret =3D max_ser_phy_set_active(ser, phy, enable);
> +		if (ret)
> +			goto err_revert_update_pipe_enable;
> +	}
> +
> +	return 0;
> +
> +err_revert_update_pipe_enable:
> +	max_ser_update_pipe_enable(priv, pipe, state, priv->streams_masks);
> +
> +err_revert_pipe_update:
> +	max_ser_update_pipe(priv, pipe, state, priv->streams_masks);

[Severity: Medium]
Should these rollbacks use the old_streams_masks parameter instead of
hardcoding the global priv->streams_masks? If a nested rollback fails partw=
ay
(for example, when max_ser_update_phys attempts to revert a partially
successful multi-pad update), utilizing the global state here might restore
to the wrong target state instead of the actual old state.

[ ... ]

> +static int max_ser_update_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 updated_streams_mask, bool enable)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +	u64 *streams_masks;
> +	int ret;

[ ... ]

> +	devm_kfree(priv->dev, priv->streams_masks);
> +	priv->streams_masks =3D streams_masks;
> +	ser->active =3D !!streams_masks[pad];
> +
> +	return 0;

[Severity: High]
Does this incorrectly clear the global active stream state if a single
pad is disabled? If userspace enables a stream on one pad (setting
ser->active to true) and then disables a stream on a different pad, this
unconditionally sets ser->active to false based only on the disabled pad,
even though the first pad is still streaming. This could bypass hardware
configuration safety checks elsewhere that rely on ser->active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D14

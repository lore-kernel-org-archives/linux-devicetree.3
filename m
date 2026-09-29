Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6B344DB9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722761; cv=none; b=q44Nnl0S+/4aXOtohOOoE+XjPa6xKTayOEv9i0sBu5tGwRDiIFygltB9kJmFLFRuvLXUPEyoYcUcCSW1uRaBs2hY584QIQTMnbtZ5x0DsR4yHevK7ljCA2ct3HqsFZOs+kOo4ajwZjryXgJrfC/DsmSjhYRLdZb+kFca1bTiBT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722761; c=relaxed/simple;
	bh=N/PqK404nAlJ64DjvYpA8r6OSgoEfHKs19af7vTM2N8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ADXoUausS5CvGSoswkQqcrsXCMgnHShreQbMMn6dNDrGd7QIopNKko4TsngbzbF71bpWi0ZlbogPxxTv10AMnf6u6drAmhaV/XU8ZXly5blGn045NmVp0VJCe50Lwyuo0OWZxk+wIRzz2hfYWEJnnXzq1+b0msEAjT3AF0WNjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4CEtjMn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4CEtjMn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5301F000FF;
	Tue, 29 Sep 2026 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722759;
	bh=JIUZDjJQoDyrb3clfTybKUgx6wrXzVmX8nuWsKP3Tos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e4CEtjMnO003GQhnfAc0ZORSg9EnNgao3MiSY15N/Nfq1+amgF1WmKLdyxH8DiAGi
	 GH8aQq/Mr9Us5yeJb/QEZrI81p9/710BhXsN2K6vwZmVSreNfSeCC5WV+OZV1lAa2k
	 B+2jrEBGuCT3YQEgEbF/fUD5JUoiISCsSp54fNxshUqwfDwr8kR3TDS+kWJBlMOFcP
	 8YIi6NkXsfVbTpC5gqrObp4hwF6x6X/bTxq+jqfk96eur/Dr9YCmd9GjNMLOmHSJmU
	 8UMhYDSEDFb6mbOYv7cMNB1+GdJl6gauEsQHWChaUF2a1vEWz1wTG7fRHJi3blfVof
	 hkMQ+e2lf9Y7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 15/23] media: i2c: add Maxim GMSL2/3 serializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-15-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-15-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:59:18 +0000
Message-Id: <20260929225919.1E5301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] media: i2c: max_ser: global ser->active state is improperly cleare=
d based on single pad mask
- [High] media: i2c: max_ser: error handlers in max_ser_update_phy() rollba=
ck to wrong state
- [High] media: i2c: max_ser: UAF of hw->source->sd due to lockless unbind =
race
- [High] media: i2c: max_ser: max_ser_update_pipe() dynamically allocates m=
emory during active stream routing and ignores rollback failures
- [Medium] media: i2c: max_ser: V4L2_CID_TEST_PATTERN fails to apply immedi=
ately during active streaming
- [Low] media: i2c: max_ser: msleep() inside I2C address polling loop delay=
s hardware discovery
- [Low] media: i2c: max_ser: max_ser_set_vc_remaps() mutates internal array=
s locklessly
- [Low] media: i2c: max_ser: data race on I2C ATR translation array during =
V4L2 logging
--

commit 795bb4a1063d9c2062b4bd589a53c080e53deb71
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 serializer framework

These drivers are meant to be used as a common framework for Maxim GMSL2/3
serializers. This framework enables support for various new features across=
 all
the chips, including Full Streams API support, I2C ATR, and automatic GMSL =
link
version negotiation.

> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c=
/maxim-serdes/max_ser.c
> index 0000000000000..e9bb722ea22f0
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c
[ ... ]
> +static int max_ser_route_to_hw(struct max_ser_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_route *route,
> +			       struct max_ser_route_hw *hw)
> +{
[ ... ]
> +	hw->source =3D max_ser_get_phy_source(priv, phy);
> +	if (!hw->source->sd)
> +		return 0;
> +
> +	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
> +			       hw->source->pad, &fd);

[Severity: High]
Does this code have a use-after-free or null-pointer dereference risk if the
source subdevice unbinds concurrently?

If max_ser_notify_unbind() happens asynchronously when the source subdevice
unregisters, setting source->sd =3D NULL without holding the active state l=
ock:

> +static void max_ser_notify_unbind(struct v4l2_async_notifier *nf,
> +				  struct v4l2_subdev *subdev,
> +				  struct v4l2_async_connection *base_asc)
> +{
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +
> +	source->sd =3D NULL;
> +}

It looks like the unbind can interleave between the lockless check
if (!hw->source->sd) and the immediate macro expansion in v4l2_subdev_call(=
),
potentially accessing a freed or NULL subdevice.

[ ... ]
> +static int max_ser_i2c_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
> +				       u16 addr, u16 alias)
> +{
[ ... ]
> +	ret =3D ser->ops->set_i2c_xlate(ser, i, &xlate);
> +	if (ret)
> +		return ret;
> +
> +	ser->i2c_xlates[i] =3D xlate;

[Severity: Low]
Does updating the I2C translation array here locklessly race with V4L2 logg=
ing
readers?

The I2C ATR core dynamically updates ser->i2c_xlates during active transact=
ions,
but a concurrent VIDIOC_LOG_STATUS query via max_ser_log_status() iterates
this array using only the V4L2 active state lock, which provides no mutual
exclusion against the ATR mutex:

> +static int max_ser_log_status(struct v4l2_subdev *sd)
> +{
[ ... ]
> +	v4l2_info(sd, "i2c_xlates:\n");
> +	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++) {
> +		v4l2_info(sd, "\ten: %u, src: 0x%02x dst: 0x%02x\n",
> +			  ser->i2c_xlates[i].en, ser->i2c_xlates[i].src,
> +			  ser->i2c_xlates[i].dst);
> +		if (!ser->i2c_xlates[i].en)
> +			break;
> +	}

This might result in torn or partially updated translation parameters appea=
ring
in the kernel log.

[ ... ]
> +static int max_ser_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_ser_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ser->tpg_pattern =3D ctrl->val;
> +		return 0;

[Severity: Medium]
Will this cached control value fail to apply to hardware immediately during
active streaming?

V4L2 control semantics expect dynamically mutable controls to be applied
concurrently. However, the hardware programming routine max_ser_update_tpg()
skips updating the hardware if the format entry matches (entry =3D=3D ser->=
tpg_entry).
Since only the pattern changed and not the format, the update might be skip=
ped
even if the stream is toggled.

[ ... ]
> +static int max_ser_update_pipe(struct max_ser_priv *priv,
> +			       struct max_ser_pipe *pipe,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks)
> +{
[ ... ]
> +	if (!ser->ops->num_dts_per_pipe)
> +		return 0;
> +
> +	dts =3D devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts=
),
> +			   GFP_KERNEL);
> +	if (!dts)
> +		return -ENOMEM;

[Severity: High]
Does dynamically allocating memory here during active stream routing risk
ignoring memory allocation failures during rollback?

Using devm_kcalloc repeatedly on stream enable creates overhead and
fragmentation. Furthermore, if this allocation fails under memory pressure
during the rollback loop in max_ser_update_phys():

> +static int max_ser_update_phys(struct max_ser_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks, u64 *old_streams_masks)
> +{
[ ... ]
> +err:
> +	for (i =3D 0; i < failed_update_phy_id; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +
> +		max_ser_update_phy(priv, state, phy, old_streams_masks,
> +				   streams_masks);
> +	}
> +
> +	return ret;
> +}

The rollback loop completely ignores the -ENOMEM returned by max_ser_update=
_phy(),
potentially aborting the PHY rollback and corrupting the pipeline state by =
hiding
the failure from the V4L2 layer.

[ ... ]
> +static int max_ser_update_phy(struct max_ser_priv *priv,
> +			      struct v4l2_subdev_state *state,
> +			      struct max_ser_phy *phy, u64 *streams_masks,
> +			      u64 *old_streams_masks)
> +{
[ ... ]
> +err_revert_update_pipe_enable:
> +	max_ser_update_pipe_enable(priv, pipe, state, priv->streams_masks);
> +
> +err_revert_pipe_update:
> +	max_ser_update_pipe(priv, pipe, state, priv->streams_masks);

[Severity: High]
Do these error handlers roll back to the wrong state by hardcoding
priv->streams_masks?

The caller max_ser_update_phys() attempts to rollback partial PHY updates by
passing old_streams_masks as the target state. However, the error handler e=
xplicitly
hardcodes priv->streams_masks (which still holds the old state), effectively
reapplying the old state after failing to apply the old state, rather than
reverting back to the correct state.

[ ... ]
> +static int max_ser_update_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 updated_streams_mask, bool enable)
> +{
[ ... ]
> +	devm_kfree(priv->dev, priv->streams_masks);
> +	priv->streams_masks =3D streams_masks;
> +	ser->active =3D !!streams_masks[pad];

[Severity: High]
Does this code improperly clear the global device active state based only o=
n the
isolated state of the single pad being manipulated?

If userspace configures streaming via the V4L2 Streams API by enabling stre=
aming
on pad 1 (source), ser->active becomes 1. If userspace then explicitly disa=
bles
streaming on pad 0 (sink), streams_masks[0] zeroes out, resulting in
ser->active =3D 0. This occurs despite pad 1 still having active streams. T=
his
would allow userspace to change formats mid-stream on remaining active pads,
risking hardware crashes.

[ ... ]
> +int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
> +			      unsigned int num_addrs, u8 *current_addr)
> +{
> +	unsigned int i, j;
> +	int ret =3D 0;
> +	u8 val;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		for (j =3D 0; j < num_addrs; j++) {
> +			ret =3D max_ser_read_reg(adapter, addrs[j], MAX_SER_REG0, &val);
> +			if (!ret && val) {
> +				*current_addr =3D addrs[j];
> +				return 0;
> +			}
> +
> +			msleep(100);
> +		}
> +	}

[Severity: Low]
Does the placement of msleep(100) inside the inner I2C address polling loop
unnecessarily delay hardware discovery?

The sleep is placed inside the inner address iteration loop rather than the
outer retry loop. If the device sits at index 1, the driver unconditionally
sleeps 100ms after checking index 0 before trying index 1, even if the
device is already booted and ready.

[ ... ]
> +int max_ser_set_vc_remaps(struct v4l2_subdev *sd,
> +			  struct max_serdes_vc_remap *vc_remaps,
> +			  int num_vc_remaps)
> +{
[ ... ]
> +	for (i =3D 0; i < num_vc_remaps; i++)
> +		ser->vc_remaps[i] =3D vc_remaps[i];
> +
> +	ser->num_vc_remaps =3D num_vc_remaps;
> +
> +	return 0;
> +}

[Severity: Low]
Does modifying these shared subdev arrays locklessly risk torn reads?

Helpers like max_ser_set_vc_remaps() modify the shared arrays
(ser->vc_remaps, ser->num_vc_remaps) without acquiring the serializer's
V4L2 active state lock. A concurrent VIDIOC_LOG_STATUS relies purely on
the active state lock to safely iterate ser->num_vc_remaps:

> +static int max_ser_log_status(struct v4l2_subdev *sd)
> +{
[ ... ]
> +	if (ser->ops->set_vc_remap) {
> +		v4l2_info(sd, "vc_remaps: %u\n", ser->num_vc_remaps);
> +		for (j =3D 0; j < ser->num_vc_remaps; j++) {
> +			v4l2_info(sd, "\tvc_remap: src: %u, dst: %u\n",
> +				  ser->vc_remaps[j].src, ser->vc_remaps[j].dst);
> +		}
> +	}

This might output an inconsistent pipeline state in the kernel log.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D15

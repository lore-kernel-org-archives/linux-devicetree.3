Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402FD39BFFA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281314; cv=none; b=tYKxDJncSRoRogdPFi2sf1KW+miQJFsyRpvzdDTrAxLECJnLbjTBduM8cjORYgTBKKL8qpgLprm83RQ22JQBhT5Krr6lstqEa++kTlP9bY9SN6vIM5JIksZYZ3uz5p7hDmyGz+j1lljVktQUc3qBjjWjKa3Tirq2+F+VsJ3YqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281314; c=relaxed/simple;
	bh=9AsHvTNAAsxxr5tv7Vu6aloxhNbhrVQvsWY3Z0KCtDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lWIPUzFbY4BucHBXC2msQ1nm/H7SJXTD5RVsPPOuN40FsVzXmoLc6Y8/R1LQbgEazQj/8vY14b2Gsjat8YkhUvXiyQBiclElQ7RDMb3Y8RFrZOgF3gxg2uCIi48so3qSid21zj1AyHX0w28li2gdiFtR4YmQPXe7jc7O+cqZrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k93igezG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k93igezG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EA71F000E9;
	Wed, 20 May 2026 12:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281313;
	bh=tcIyI/oJtF1ae4sFeg1zdUq+wOMFbiMdTRgC/i4+zK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k93igezGBXcOP2re+VPjWRU/bat22WYviuJYZ1C2ygU/9WG4FzXIalDwVgl1oPOBg
	 Hw8WZk4jNmKXTlaJO8IesoTe8JmcEokmKwScX4cQSYVVIH3YKG4iID57H2h+i0GiJp
	 4Nyjbkykb+IwE6t+S4BHww8hfixccJ4KlVDwONupIbWlWJkg6SmWH8bCDXZlX/H9ga
	 k5L8dLAKeWA5JOqLtNBizXnsPj1nkHFZy20gXFhrbB5V1FbRypcK9hebFmvqRmt1yq
	 MdaIceCsim7aa+7jUh3+MEOe+wq32RZAn6XNBvt31EubftpLKNxyMLIjVTC9ggTNGn
	 9gsKJ9h8L5c0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 12/17] media: ti: j721e-csi2rx: add multistream
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520120022.539913-13-r-donadkar@ti.com>
References: <20260520120022.539913-13-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:48:32 +0000
Message-Id: <20260520124832.87EA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Global pixel interface reset is unconditionally asserted on stream=
 start failure, breaking other active multiplexed streams.
- [High] Fallback initialization for missing `get_frame_desc` support only =
configures the first context, breaking secondary multiplexed streams.
- [High] Incorrect NULL check on `media_entity_remote_source_pad_unique` le=
ads to ERR_PTR dereference.
- [High] Failing to disable the upstream subdev permanently desynchronizes =
the driver's stream enable counter from the hardware state.
- [Medium] `ti_csi2rx_sd_set_routing` improperly rejects TRY routing config=
urations while streaming is active.
- [Medium] Unreachable error check inside `ti_csi2rx_get_vc_and_dt` loop pr=
events returning `-EINVAL` on stream mismatch.
- [Medium] `ti_csi2rx_sd_set_fmt` leaves state partially modified when retu=
rning error for unrouted streams.
--

commit e0451de187b4fd8470a4a9aee7ab731e7acd8ee7
Author: Jai Luthra <jai.luthra@linux.dev>

media: ti: j721e-csi2rx: add multistream support

Each CSI2 stream can be multiplexed into 32 independent streams, each
identified by its virtual channel number and data type. The incoming
data from these streams can be filtered on the basis of either the
virtual channel or the data type. This patch adds routing APIs to allow
application-specified data routing and handles pixel interface reset
assert/de-assert on stream start/stop.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index d0a681ba78ebf..1ec63715baf2c 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

[ ... ]

> @@ -887,34 +872,82 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
>  static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dev *csi =3D ctx->csi;
>  	struct media_pad *pad;
>  	struct v4l2_subdev_state *state;
>  	struct v4l2_subdev_route *r;
> =20
>  	/* Get the source pad connected to this ctx */
>  	pad =3D media_entity_remote_source_pad_unique(ctx->pad.entity);
>  	if (!pad) {

[Severity: High]
Could this lead to an invalid pointer dereference?

Looking at media_entity_remote_source_pad_unique(), it returns an ERR_PTR
(like ERR_PTR(-ENOLINK)) on failure rather than NULL. Since error pointers
would bypass this !pad check, would they be immediately dereferenced below?

>  		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
>  		return -ENODEV;
>  	}
> =20

[ ... ]

>  static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dev *csi =3D ctx->csi;
> +	struct ti_csi2rx_ctx *curr_ctx;
>  	struct v4l2_mbus_frame_desc fd;
> -	struct media_pad *pad;
> -	int ret, i;
> +	struct media_pad *source_pad;
> +	const struct ti_csi2rx_fmt *fmt;
> +	int ret;
> +	unsigned int i, j;
> =20
> -	pad =3D media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_F=
L_SOURCE);
> -	if (IS_ERR(pad))
> -		return PTR_ERR(pad);
> +	/* Get the frame desc from source */
> +	source_pad =3D media_entity_remote_pad_unique(&csi->subdev.entity, MEDI=
A_PAD_FL_SOURCE);
> +	if (IS_ERR(source_pad))
> +		return PTR_ERR(source_pad);
> =20
> -	ret =3D v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, =
&fd);
> -	if (ret)
> +	ret =3D v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->=
index, &fd);
> +	if (ret) {
> +		if (ret =3D=3D -ENOIOCTLCMD) {
> +			ctx->vc =3D 0;
> +			fmt =3D find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> +			ctx->dt =3D fmt->csi_dt;
> +		}
>  		return ret;
> +	}

[Severity: High]
Does this fallback logic properly initialize multiplexed streams?

Because ti_csi2rx_get_vc_and_dt() is only called on the very first stream
start (when !csi->enable_count), if get_frame_desc returns -ENOIOCTLCMD,
only the current context's virtual channel and data type are configured.

Would subsequent multiplexed streams be left entirely uninitialized
(defaulting to 0) since this function won't be called again for them?

> =20
>  	if (fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>  		return -EINVAL;
> =20
> -	for (i =3D 0; i < fd.num_entries; i++) {
> -		if (ctx->stream =3D=3D fd.entry[i].stream) {
> -			ctx->vc =3D fd.entry[i].bus.csi2.vc;
> -			ctx->dt =3D fd.entry[i].bus.csi2.dt;
> -			break;
> -		}
> +	for (i =3D 0; i < csi->num_ctx; i++) {
> +		curr_ctx =3D &csi->ctx[i];
> =20
> -		/* Return error if no matching stream found */
> -		if (i =3D=3D fd.num_entries)
> -			return -EINVAL;
> +		/* Capture VC 0 by default */
> +		curr_ctx->vc =3D 0;
> +
> +		ret =3D ti_csi2rx_get_stream(curr_ctx);
> +		if (ret)
> +			continue;
> +
> +		for (j =3D 0; j < fd.num_entries; j++) {
> +			if (curr_ctx->stream =3D=3D fd.entry[j].stream) {
> +				curr_ctx->vc =3D fd.entry[j].bus.csi2.vc;
> +				curr_ctx->dt =3D fd.entry[j].bus.csi2.dt;
> +				break;
> +			}
> +
> +			/* Return error if no matching stream found */
> +			if (j =3D=3D fd.num_entries)
> +				return -EINVAL;

[Severity: Medium]
Is it possible to ever reach this error path?

Since this check is placed inside the body of the loop, j will always be
strictly less than fd.num_entries. If no matching stream is found, the
loop will naturally exit without ever returning -EINVAL.

> +		}
>  	}
> =20
>  	return 0;

[ ... ]

> @@ -925,8 +958,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue=
 *vq, unsigned int count)
>  	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
>  	struct ti_csi2rx_dev *csi =3D ctx->csi;
>  	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> -	struct ti_csi2rx_buffer *buf;
> -	const struct ti_csi2rx_fmt *fmt;
>  	unsigned long flags;
>  	int ret =3D 0;
> =20

[ ... ]

>  err_dma:
>  	ti_csi2rx_stop_dma(ctx);
> -err_pipeline:
>  	video_device_pipeline_stop(&ctx->vdev);
>  	writel(0, csi->shim + SHIM_CNTL);

[Severity: High]
Can this error path disrupt actively running streams?

If we fail to enable the stream in v4l2_subdev_enable_streams(), we
unconditionally write 0 to SHIM_CNTL here, which causes a global reset of
the pixel interface.

If one context is already streaming (enable_count > 0) and another context
fails to start, will this reset break the actively running stream?

>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> @@ -995,11 +999,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queu=
e *vq)

[ ... ]

> @@ -1046,25 +1047,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subde=
v *sd,
>  	fmt =3D v4l2_subdev_state_get_format(state, format->pad, format->stream=
);
>  	*fmt =3D format->format;
> =20
> -	fmt =3D v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
> -					   format->stream);
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Does this leave the subdevice state partially modified on error?

The requested format is written to the state right before this step:

	fmt =3D v4l2_subdev_state_get_format(state, format->pad, format->stream);
	*fmt =3D format->format;

If v4l2_subdev_state_get_opposite_stream_format() fails (for example,
if the stream is unrouted), this returns -EINVAL while leaving the format
partially modified. Should we avoid updating the state until we know all
operations will succeed?

> +
>  	*fmt =3D format->format;
> =20
>  	return 0;
>  }
> =20

[ ... ]

> +static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    enum v4l2_subdev_format_whence which,
> +				    struct v4l2_subdev_krouting *routing)
> +{
> +	struct ti_csi2rx_dev *csi =3D to_csi2rx_dev(sd);
> +
> +	if (csi->enable_count > 0)
> +		return -EBUSY;

[Severity: Medium]
Is it intended to block TRY configurations while streaming?

If userspace calls this with which =3D=3D V4L2_SUBDEV_FORMAT_TRY to probe
valid configurations while another stream is active, it will be rejected
with -EBUSY. Does the V4L2 API mandate that TRY operations must be allowed
regardless of the active streaming state?

> +
> +	return _ti_csi2rx_sd_set_routing(sd, state, routing);
> +}
> +

[ ... ]

>  static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
> @@ -1072,15 +1132,56 @@ static int ti_csi2rx_sd_enable_streams(struct v4l=
2_subdev *sd,
>  				       u32 pad, u64 streams_mask)
>  {

[ ... ]

>  	remote_pad =3D media_entity_remote_source_pad_unique(&csi->subdev.entit=
y);
>  	if (!remote_pad)

[Severity: High]
Could this check miss an error pointer, similar to the instance in
ti_csi2rx_get_stream() above?

media_entity_remote_source_pad_unique() returns an ERR_PTR on failure, not
NULL. Will this bypass the !remote_pad check and cause a dereference issue?

>  		return -ENODEV;
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
> =20
>  	ret =3D v4l2_subdev_enable_streams(csi->source, remote_pad->index,
> -					 BIT_U64(0));
> +					 sink_streams);
>  	if (ret)
>  		return ret;
> =20
> @@ -1094,18 +1195,28 @@ static int ti_csi2rx_sd_disable_streams(struct v4=
l2_subdev *sd,
>  					u32 pad, u64 streams_mask)
>  {
>  	struct ti_csi2rx_dev *csi =3D to_csi2rx_dev(sd);
> +	struct ti_csi2rx_ctx *ctx =3D &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURC=
E];
>  	struct media_pad *remote_pad;
> +	u64 sink_streams;
>  	int ret =3D 0;
> =20
> +	WARN_ON(csi->enable_count =3D=3D 0);
> +
> +	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> +
> +	/* assert pixel reset to prevent stale data */
> +	if (csi->enable_count =3D=3D 1)
> +		writel(0, csi->shim + SHIM_CNTL);
> +
>  	remote_pad =3D media_entity_remote_source_pad_unique(&csi->subdev.entit=
y);
>  	if (!remote_pad)
>  		return -ENODEV;
> -
> -	if (csi->enable_count =3D=3D 0)
> -		return -EINVAL;
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
> =20
>  	ret =3D v4l2_subdev_disable_streams(csi->source, remote_pad->index,
> -					  BIT_U64(0));
> +					  sink_streams);
>  	if (!ret)
>  		--csi->enable_count;
> =20
> @@ -1114,6 +1225,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2=
_subdev *sd,

[Severity: High]
Can this error path permanently desynchronize the enable counter?

If v4l2_subdev_disable_streams() fails, the --csi->enable_count line is
skipped, but the function still returns 0. Since the hardware has already
been put into reset (if enable_count was 1), the software counter will
remain > 0.

On the next start attempt, the driver will skip de-asserting the pixel reset
because it thinks a stream is already running, which could break capture
completely until the driver is reloaded.

> =20
>  static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops =3D {
>  	.enum_mbus_code	=3D ti_csi2rx_enum_mbus_code,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D12

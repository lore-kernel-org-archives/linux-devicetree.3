Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90308442B23
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828924; cv=none; b=s+ydRz/DOLzo1Nm50u3LD2lG4zfWChh0jj2tUBTi5gGXgLWDjAcd0icp/4RU56kI/kRg8EJvADf/0UiO5CJ3esyAjTCN6iWkJQ4SBwLW6L1V9KtqNczWw/+YyhLr9/MAJbslWJLTdVu/aO35KlCP+J7xD7bLuV4vbBPUyTSWltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828924; c=relaxed/simple;
	bh=Kx46RoxkYOqSEy5C7GnBKnHJ5C7kG3tsaw+j6bnk0fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M3VQs2DU3tiAq13lrCsXy/j04ELVOt4jqiytllfsY1orwIVZUBnLwNKHpVctBUK1jR9QzXxCXi+i2RN/tQe20h4mhLmO5d3yAj6GlLzZLMUX3R4iGwQun6Fd7hBjJ7XRJyyCuuadmYaKz4gOETxmyRgOGgBYLYAEi7Fiy2bVovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXBV6/df; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXBV6/df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A5E1F00A3A;
	Thu, 27 Aug 2026 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787828919;
	bh=ESyrtZhoprBagK5/ZwJP0pKiiw7QQoWHHF6mSXFbSGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXBV6/dfh+1Ja+3wmeTzTlE+c7m9ei7lcPM3YxO0XEXXhUz5Rtj8Lgj7YHVkths/3
	 DpCAhayEZu0VVw1bmsrAgr/Cfwq1ArB4WLF6uqWm3N27EgjDL5nJ7ui1rG3imXGsFm
	 KPG85TItRGdnip4PMfRnjaBR4hpvRM4HExOpcjNAGKtMZhjiinmAvRJc3HiN8WXSVc
	 lpnecvwHD/dufBAOp4ulSuJDzo6t+ebO/+eWv1jsqMwLb0vUs6ptJt8tkPDH4bkhms
	 3hB/Zb1Hrvlf3O74motq2emvLiilhzQmSaZj40LJm7AcoIcpxjCYVwe0Ch9Z+Z2USW
	 C0tnG+0IjcuNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] media: rkisp2: Add statistics capture video node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder@ideasonboard.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-rkisp2-v3-3-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-3-e91ff0a604d6@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 11:08:39 +0000
Message-Id: <20260827110839.89A5E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [High] Missing V4L2 block type info for big histogram 2, causing an infin=
ite loop in userspace parsers.
- [High] Unacknowledged hardware 3A interrupts cause an IRQ storm when no s=
tats buffers are queued.
- [High] Return value of rkisp2_stats_init_vb2_queue() is ignored.
- [High] mutex_destroy() is called while file descriptors might still be op=
en, leading to Use-After-Free.
- [High] Unprotected initialization of stats->icr in start_streaming races =
with the ISR.
- [High] Measurement window dimensions are not clamped in the statistics co=
nfiguration handlers, which can cause ISP hardware hangs.
- [Medium] Uninitialized stats block exposes stale memory to userspace when=
 hardware status bits are unset.
- [Medium] Truncated programming of big histogram weights.
- [Medium] Missing SRAM/WRAM address pointer reset before reading or writin=
g AWB statistics and parameters.

Pre-existing issues:
- [Critical] Time-of-check to time-of-use (TOCTOU) vulnerability in paramet=
ers buffer validation.
--

commit a35565a8e85636bb5290bad9e33a1d9d66a1f24a
Author: Paul Elder <paul.elder@ideasonboard.com>

media: rkisp2: Add statistics capture video node

This commit adds support for capturing statistics out of the ISP by dequeue=
ing
statistics buffers from rkisp2. Support for configuring the statistics engi=
nes
in the ISP is also added, implemented as configurations in parameter buffer=
s.

> diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c b/dri=
vers/media/platform/rockchip/rkisp2/rkisp2-params.c
> --- a/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
[ ... ]
> @@ -84,6 +100,12 @@ rkisp2_params_handlers[] =3D {
>  	RKISP2_PARAMS_BLOCK_HANDLER_INFO(GOC, goc, PRE),
>  	RKISP2_PARAMS_BLOCK_HANDLER_INFO(LSC, lsc, POST),
>  	RKISP2_PARAMS_BLOCK_HANDLER_INFO(CROP, crop, PRE),
> +	RKISP2_PARAMS_BLOCK_HANDLER_INFO(AE_LITE, ae_lite, PRE),
> +	RKISP2_PARAMS_BLOCK_HANDLER_INFO(HIST_LITE, hist_lite, PRE),
> +	RKISP2_PARAMS_BLOCK_HANDLER_INFO(HIST_BIG0, hist_big, PRE),
> +	RKISP2_PARAMS_BLOCK_HANDLER_INFO(HIST_BIG1, hist_big, PRE),
> +	RKISP2_PARAMS_BLOCK_HANDLER_INFO(HIST_BIG2, hist_big, PRE),
> +	RKISP2_PARAMS_BLOCK_HANDLER_INFO(AWB_MEAS, awb_meas, PRE),
>  };

[Severity: Critical]
This is a pre-existing issue, but can malicious userspace bypass block vali=
dation to trigger an out-of-bounds read on the rkisp2_params_handlers array?

In rkisp2_params_vb2_buf_prepare(), the buffer is copied to params_buf->cfg=
, but v4l2_isp_params_validate_buffer() is mistakenly called on the userspa=
ce-accessible buffer (cfg) instead of the snapshot.=20

If userspace concurrently changes block.header->type in the shared memory a=
fter memcpy() completes, rkisp2_params_configure() will read the unvalidate=
d type from the snapshot, resulting in an out-of-bounds index when accessin=
g info =3D &rkisp2_params_handlers[block.header->type] and potentially exec=
uting an arbitrary function pointer.

[ ... ]
> +static void rkisp2_params_ae_lite(struct rkisp2_params *params,
> +				  union rkisp2_params_block block)
> +{
> +	const struct rkisp2_params_ae_lite *arg =3D block.ae_lite;
> +	u32 control;
[ ... ]
> +	rkisp2_write(params->rkisp2, ISP_RAWAE_LITE_BLK_SIZ,
> +		     ISP3X_RAWAE_LITE_H(arg->meas_window.h_size) |
> +		     ISP3X_RAWAE_LITE_V(arg->meas_window.v_size));

[Severity: High]
Is it safe to write these user-controlled window sizes directly to the ISP =
registers without bounds checking? If a userspace program provides extremel=
y large dimensions that exceed the sensor frame size, could it cause the IS=
P hardware to hang indefinitely while waiting for lines that will never arr=
ive?

[ ... ]
> +static void rkisp2_params_hist_big(struct rkisp2_params *params,
> +				   union rkisp2_params_block block)
> +{
[ ... ]
> +	for (i =3D 0; i < 16; i++) {
> +		rkisp2_write(params->rkisp2, reg_base + ISP_RAWHIST_BIG_WEIGHT_BASE + =
4 * i,
> +			     ISP_RAWHIST_BIG_WEIGHT_WND0(arg->weights[5 * i + 0]) |
> +			     ISP_RAWHIST_BIG_WEIGHT_WND1(arg->weights[5 * i + 1]) |
> +			     ISP_RAWHIST_BIG_WEIGHT_WND2(arg->weights[5 * i + 2]) |
> +			     ISP_RAWHIST_BIG_WEIGHT_WND3(arg->weights[5 * i + 3]) |
> +			     ISP_RAWHIST_BIG_WEIGHT_WND4(arg->weights[5 * i + 4]));
> +	}

[Severity: Medium]
Is this loop intentionally truncated? The rkisp2_params_hist_big struct def=
ines the weights array size as RKISP2_ISP_HIST_WEIGHT_GRIDS_SIZE_BIG (which=
 is 225), but this loop only runs 16 times, writing 80 weights. Could this =
leave 145 weights unprogrammed and corrupt the histogram output?

[ ... ]
> +static void rkisp2_params_awb_meas(struct rkisp2_params *params,
> +				   union rkisp2_params_block block)
> +{
[ ... ]
> +	for (i =3D 0; i < RKISP2_ISP_AWB_COUNTS_SIZE / 5; i++) {
> +		val =3D (arg->weights[5 * i] & 0x3f)
> +		    | ((arg->weights[5 * i + 1] & 0x3f) << 6)
> +		    | ((arg->weights[5 * i + 2] & 0x3f) << 12)
> +		    | ((arg->weights[5 * i + 3] & 0x3f) << 18)
> +		    | ((arg->weights[5 * i + 4] & 0x3f) << 24);
> +		rkisp2_write(params->rkisp2, ISP21_RAWAWB_WRAM_DATA_BASE, val);
> +	}

[Severity: Medium]
Should the internal WRAM address pointer be reset before writing these valu=
es? Since data is written sequentially to ISP21_RAWAWB_WRAM_DATA_BASE, the =
pointer might start at whatever leftover value it had from previous operati=
ons if ISP21_RAWAWB_RAM_CTRL isn't cleared first, potentially misaligning t=
he parameters.

> diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-stats.c b/driv=
ers/media/platform/rockchip/rkisp2/rkisp2-stats.c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-stats.c
> @@ -0,0 +1,509 @@
[ ... ]
> +static const struct v4l2_isp_stats_block_type_info
> +rkisp2_stats_blocks_info[] =3D {
> +	RKISP2_STATS_BLOCK_INFO(AE_LITE, ae_lite),
> +	RKISP2_STATS_BLOCK_INFO(HIST_LITE, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG0, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG1, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG1, hist),
> +	RKISP2_STATS_BLOCK_INFO(AWB, awb),
> +};

[Severity: High]
Is the duplicate HIST_BIG1 entry here a typo? It looks like HIST_BIG2 is mi=
ssing, which leaves its block type uninitialized and implicitly sized at 0.=
=20

If rkisp2_stats_hist_read() processes RKISP2_STATS_BLOCK_HIST_BIG2, would a=
dding a block with a size of 0 cause userspace parsers to spin in an infini=
te loop since their block offset logic will never advance?

[ ... ]
> +static int rkisp2_stats_vb2_start_streaming(struct vb2_queue *vq, unsign=
ed int count)
> +{
> +	struct rkisp2_stats *stats =3D vq->drv_priv;
> +
> +	stats->icr =3D 0;
> +	stats->cur_buf =3D NULL;
> +	stats->awb_window_offset =3D 0;
> +
> +	return 0;
> +}

[Severity: High]
Does initializing stats->icr to 0 here need to be protected by stats->lock?

If userspace calls VIDIOC_STREAMON while the ISP is already running and gen=
erating EOF interrupts, could this race with rkisp2_stats_isr_eof()? This m=
ight clobber the bits accumulated by the ISR, causing it to write 0 to ISP_=
ISP3A_ICR and fail to clear the pending hardware interrupts, leading to an =
IRQ storm.

[ ... ]
> +static void rkisp2_stats_get_rawae_lite(struct rkisp2_stats *stats,
> +					u32 status,
> +					struct v4l2_isp_buffer *pbuf)
> +{
[ ... ]
> +	block =3D rkisp2_init_stats_block(rkisp2, pbuf,
> +					RKISP2_STATS_BLOCK_AE_LITE);
> +	if (IS_ERR(block))
> +		return;
> +
> +	ae_lite =3D &block->ae_lite;
> +
> +	/* TODO figure out what the other channels are for */
> +	if (!(status & ISP2X_3A_RAWAE_CH0))
> +		return;

[Severity: Medium]
Could this early return expose uninitialized kernel memory to userspace?

Since rkisp2_init_stats_block() allocates the block and increments buf->dat=
a_size, returning here without filling the payload or initializing the done=
 flag might cause userspace to consume stale or poisoned statistics data fr=
om the buffer. This same pattern appears to be present in rkisp2_stats_get_=
rawawb() below.

[ ... ]
> +static void rkisp2_stats_get_rawawb(struct rkisp2_stats *stats,
> +				    u32 status,
> +				    struct v4l2_isp_buffer *pbuf)
> +{
[ ... ]
> +	for (i =3D 0; i < RKISP2_ISP_AWB_COUNTS_SIZE; i++) {
> +		val1 =3D rkisp2_read(rkisp2, ISP21_RAWAWB_RAM_DATA_BASE);
> +		val2 =3D rkisp2_read(rkisp2, ISP21_RAWAWB_RAM_DATA_BASE);
> +		awb->counts_r[i] =3D (val2 >> 4) & 0x3ffff;
> +		awb->counts_g[i] =3D (val1 >> 18) | ((val2 & 0xf) << 14);
> +		awb->counts_b[i] =3D val1 & 0x3ffff;
> +		awb->counts_w[i] =3D val2 >> 22;
> +	}

[Severity: Medium]
Should the internal address pointer be reset before reading these AWB count=
s? It appears this reads from the data port sequentially without first writ=
ing 0 to ISP21_RAWAWB_RAM_CTRL, which might cause the read pointer to start=
 at a leftover value from previous operations and corrupt the stats output.

[ ... ]
> +static void rkisp2_stats_send_measurement_3a(struct rkisp2_stats *stats,=
 u32 status)
> +{
> +	struct v4l2_isp_buffer *cur_stat_buf;
> +	struct rkisp2_buffer *cur_buf;
> +
> +	cur_buf =3D rkisp2_stats_get_buf(stats);
> +	if (!cur_buf)
> +		return;

[Severity: High]
If no V4L2 stats buffers are queued, does this early return bypass the hard=
ware interrupt acknowledgment routine?

If the ISP is running and asserting 3A interrupts on EOF, skipping the writ=
e to ISP_ISP3A_ICR could leave the IRQ line asserted indefinitely, resultin=
g in an infinite IRQ storm and system hang.

[ ... ]
> +int rkisp2_stats_register(struct rkisp2_device *rkisp2)
> +{
[ ... ]
> +	vdev->device_caps =3D V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> +	vdev->vfl_dir =3D  VFL_DIR_RX;
> +	rkisp2_stats_init_vb2_queue(vdev->queue, stats);
> +	rkisp2_init_stats(stats);
> +	video_set_drvdata(vdev, stats);

[Severity: High]
Is it safe to ignore the return value of rkisp2_stats_init_vb2_queue() here=
? If the queue initialization fails due to memory pressure, allowing the re=
gistration to proceed could register the video node with a broken vb2_queue=
, potentially leading to crashes when queue ioctls are invoked.

[ ... ]
> +void rkisp2_stats_unregister(struct rkisp2_device *rkisp2)
> +{
> +	struct rkisp2_stats *stats =3D &rkisp2->stats;
> +	struct rkisp2_vdev_node *node =3D &stats->vnode;
> +	struct video_device *vdev =3D &node->vdev;
> +
> +	if (!stats->rkisp2)
> +		return;
> +
> +	vb2_video_unregister_device(vdev);
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
> +}

[Severity: High]
Can destroying the mutex here lead to a use-after-free?=20

The mutex_destroy() is being called synchronously during device unregistrat=
ion. If a userspace process still holds an open file descriptor to the stat=
s node, it could later call vb2_fop_release() upon closing the file descrip=
tor, which will attempt to acquire this destroyed mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-rkisp2-v3-=
0-e91ff0a604d6@ideasonboard.com?part=3D3

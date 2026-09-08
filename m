Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478A2397928
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855110; cv=none; b=dt2AzCL3J66Yzh75+XhjuFUmBVG7cSiukitiBBHtBsnj/ziNT8QjZP2PFfoq6e1HbiauC3oI3ciKA6Yb1CchSFjsaeFVdtUg0XhUVrAnXLEBnE4936QicsMJhbYh0RvNE7qwwbCpgOQRsQumxYPJXsRJopteL/00R7bzbbvtuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855110; c=relaxed/simple;
	bh=NPKEE9GUXxhbVJnlBdX1K3t19rP+zYGDTRaEH+m0oIw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kM6n3/qjUVu0HNtDC9vaiff0U5HJ+X7bMLx9ZLB799KTsiaTSeLyQCsbp2ybhVERRg00iwwXG2/SwYG0H1xG6nFxX2n2+HtaBCJk/I3QK6iKey0tnpnJdE9zeYXPH755UNTytu19rsuRdv3OSa8Waf+X/tXN8WgHDDPe605BNcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4Knlc3A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4Knlc3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9571D1F00A3A;
	Tue,  8 Sep 2026 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788855108;
	bh=uGZnKUwG5VH1EmCHeCcoI+gM7KK8Dn8A67Ow/GQqcCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4Knlc3AyV+EjReRQ6w3yOnSScrvIXiDwgh6JG5t0cddLrkrbcOEuUURRbIlaHdmM
	 x67JEKHoUTvIHAQBt/B3DOivla8WdNTi8eMvTSBtIIE6U9boMFaUJeF3uuCmJZ2yKO
	 /UHCMtTKMq4maAohXG+FBzY4CcFHRMoTWhSJw1BLiKYvg0tk33Eql6Er6ktRJVgQ3E
	 FXrIX22nlvm8JQ/eA4xEzNhxscUsuK8FSD4DN1h8c4j8HvJMLi0H8Ie5Lwk1pLcLvN
	 Tag9fNvX0UMR3VNtlxiqq0WcIviuIG0LUDJV+yy79pOvbzUextjN+fk+DnLBTRvIgC
	 qWmlJLoG2dDDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-mira016-v4-2-1950504c131c@ideasonboard.com>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-2-1950504c131c@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 08:11:48 +0000
Message-Id: <20260908081148.9571D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The control handler is freed before unregistering the subdevice, c=
ausing a use-after-free and mutex corruption.
- [High] Catastrophic precision loss in the pixel rate calculation due to s=
ub-optimal integer division order.
- [High] `MIRA016_NUM_FRAMES_REG` is incorrectly defined as a 32-bit regist=
er, causing it to overlap with `MIRA016_TARGET_FRAME_TIME_REG`.
- [High] 64-bit divisions will cause build failures on 32-bit architectures.
- [Medium] `read_poll_timeout` silently swallows I2C read errors by overwri=
ting the error code with 0.
- [Medium] Active state is corrupted when set_fmt is called during streamin=
g.
--

commit 2b80e1eeb468d23eb8cad50e0145a2e47627a080
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016

This commit introduces a new V4L2 I2C sensor driver for the ams OSRAM Mira0=
16
camera.

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> new file mode 100644
> index 0000000000000..4ea2d87bd63c8
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
> @@ -0,0 +1,2300 @@
[ ... ]
> +#define MIRA016_EXP_TIME_L_REG		CCI_REG32(0x000e)
> +#define MIRA016_EXP_TIME_S_REG		CCI_REG32(0x0012)
> +#define MIRA016_NUM_FRAMES_REG		CCI_REG32(0x0007)
> +#define MIRA016_TARGET_FRAME_TIME_REG	CCI_REG32(0x0008)

[Severity: High]
MIRA016_NUM_FRAMES_REG is defined as a 32-bit register at 0x0007, and
MIRA016_TARGET_FRAME_TIME_REG is at 0x0008. Will a subsequent write to
0x0008 corrupt the higher bytes of the write to 0x0007?

[ ... ]
> +static inline u32 mira016_calc_prate(struct mira016 *mira016, u32 h_tot)
> +{
> +	/*
> +	 * Pixel rate is calculate as the row duration divided by the total line
> +	 * length.
> +	 *
> +	 * pixel time (psec) =3D t_row(psec) / h_tot
> +	 * pixel rate (mbps) =3D 10^12 / pixel_time
> +	 *		     =3D 10^12 * h_tot / t_row
> +	 *		     =3D h_tot * 10^6 / t_row * 10^6 to avoid overflows
> +	 */
> +	u32 trow_psec =3D mira016_trow_psec(mira016);
> +
> +	return h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ;
> +}

[Severity: High]
Does this sequence cause precision loss? The division by trow_psec happens
before the final multiplication, truncating the result to the nearest
megahertz.

[ ... ]
> +static int mira016_configure_timings(struct mira016 *mira016)
> +{
> +	int ret =3D 0;
> +	u64 val;
> +
> +	/* Configure the PLL clock tree. */
> +
> +	cci_write(mira016->regmap, MIRA016_BANK_SEL_REG, 0, &ret);
[ ... ]
> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D read_poll_timeout(cci_read, ret,
> +				((ret < 0 || (val & MIRA016_PLL_LOCKED))),
> +				1000, 1000, false, mira016->regmap,
> +				MIRA016_PLL_LOCK_REG, &val, NULL);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
If cci_read fails, it returns a negative error code in ret. Does
read_poll_timeout swallow this error by overwriting ret with 0 upon
successfully breaking the loop without a timeout?

[ ... ]
> +static int mira016_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +	struct v4l2_rect *crop;
> +	u32 pixel_rate;
> +	u32 min_vblank;
> +	u32 gain_max;
> +	int ret;
> +
> +	mira016_update_pad_format(mira016, &fmt->format, fmt->format.code);
> +	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;
> +
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	crop->width =3D fmt->format.width;
> +	crop->height =3D fmt->format.height;
> +	crop->left =3D MIRA016_PIXEL_ARRAY_LEFT;
> +	crop->top =3D MIRA016_PIXEL_ARRAY_TOP;
> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	/*
> +	 * Update the row length: changing the image format implies changing the
> +	 * row_length parameter, which changes the line duration and the pixel
> +	 * rate consequentially. Also, changing the image format changes the
> +	 * analogue gain limits.
> +	 *
> +	 * Do not allow to change image format while the subdevice is streaming.
> +	 *
> +	 * TODO: row length depends on binning, update it also in the
> +	 * implementation of set_selection.
> +	 */
> +	if (v4l2_subdev_is_streaming(sd))
> +		return -EBUSY;

[Severity: Medium]
The active state is modified in-place before checking if the subdevice is
streaming. If it is streaming, the hardware update is aborted but the active
state remains modified. Can this leave the active state out of sync with the
hardware?

[ ... ]
> +static int mira016_write_frame_duration_reg(struct mira016 *mira016,
> +					    struct v4l2_subdev_state *state,
> +					    u32 vblank_lines)
> +{
> +	struct v4l2_rect *crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	u32 frame_duration;
> +	int ret =3D 0;
> +
> +	frame_duration =3D mira016_lines_to_usec(mira016,
> +					       crop->height + vblank_lines);
> +
> +	/* Write Bank 1 context 0 and context 1 */
> +	cci_write(mira016->regmap, MIRA016_RW_CONTEXT_REG, 0, &ret);
> +	cci_write(mira016->regmap, MIRA016_BANK_SEL_REG, 1, &ret);
> +	cci_write(mira016->regmap, MIRA016_NUM_FRAMES_REG, 1, &ret);
> +	cci_write(mira016->regmap, MIRA016_TARGET_FRAME_TIME_REG,
> +		  frame_duration, &ret);

[Severity: High]
As mentioned earlier, since MIRA016_NUM_FRAMES_REG is defined as a 32-bit
register at 0x0007 and MIRA016_TARGET_FRAME_TIME_REG is at 0x0008, won't th=
is
subsequent write corrupt the data written to the higher bytes of 0x0007?

[ ... ]
> +static void mira016_timings_calc(struct mira016 *mira016)
> +{
> +	/* Time base is the number of input clock cycles per microsecond. */
> +	mira016->timings.time_base =3D mira016->xclk_freq / HZ_PER_MHZ;
> +
> +	/* Seq time base is in pico-seconds, to not lose precision. */
> +	mira016->timings.seq_time_base =3D 8 * HZ_PER_MHZ
> +				       / mira016->pll.data_rate_mbps;

[Severity: High]
Since mira016->pll.data_rate_mbps is a u64, will this direct 64-bit division
cause a linker error on 32-bit architectures?

[ ... ]
> +static void mira016_pll_calc(struct mira016 *mira016)
> +{
> +	/* Multiply link_freq by 2 to account for D-PHY DDR. */
> +	u64 target_mbps =3D mira016_link_freqs[__ffs(mira016->link_freq_bitmap)=
] * 2;
> +	u32 clk_in =3D mira016->xclk_freq;
> +	u32 best =3D UINT_MAX;
> +	bool found =3D false;
> +	u32 n_best =3D 0;
> +	u32 m_best =3D 0;
> +	u32 gran_tg;
> +	u32 n;
> +	u32 m;
[ ... ]
> +	mira016->pll.otp_gran =3D DIV_ROUND_UP_ULL(mira016->pll.data_rate_mbps,=
 160) - 1;
> +
> +	/*
> +	 * As the division might introduce rounding errors, compute gran_tg
> +	 * in the Kbps domain and then divide by 10^3.
> +	 */
> +	gran_tg =3D mira016->pll.data_rate_mbps * KHZ_PER_MHZ / 1500;

[Severity: High]
Similarly here, won't this direct 64-bit division cause build failures on
32-bit architectures?

> +	mira016->pll.gran_tg =3D DIV_ROUND_UP_ULL(gran_tg * 50, KHZ_PER_MHZ);
> +
> +	mira016->pll.lut_del =3D DIV_ROUND_UP_ULL(7000, mira016->pll.gran_tg) -=
 140;
> +	mira016->pll.byte_period =3D DIV_ROUND_DOWN_ULL(8000,
> +						      mira016->pll.data_rate_mbps);

[Severity: High]
DIV_ROUND_DOWN_ULL uses do_div() internally, which throws a compile-time er=
ror
when given a 64-bit divisor on 32-bit targets. Should a different macro be =
used
here?

[ ... ]
> +static void mira016_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&mira016->sd);
> +	media_entity_cleanup(&sd->entity);

[Severity: High]
The control handler is freed before unregistering the subdevice. Can this
cause a use-after-free and mutex corruption if userspace issues an ioctl
concurrently with module removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-mira016-v4=
-0-1950504c131c@ideasonboard.com?part=3D2

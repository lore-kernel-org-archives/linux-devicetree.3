Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6E438038
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788446; cv=none; b=Vx0hlrYQL6gsFXsg3XI2rxUgsFKQwpRL+7LO547D8drSi5EbK/bVRtNBY/v1vnAcQmh43EbH4VvulIY8RaKhH7KoKSI3WGtIQOytRXmRShV5ggVJvJ2C7QRDpsr4E2XcZeczerPO05WkuY6iJv2ENGctSwZYtldQoGwMbIiQYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788446; c=relaxed/simple;
	bh=La6IgJpLoT43Nw3m9K0GGyfC1fNLfOF+BJJhYDuSuHE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mEtb2bleV7Wy8KHekA2t0lFmP+RZdW64TYg1OJT2b4IKDszwUGK1kc38D5eeWMDJoOoGuYVErDz5/866W0o0haQ4hO7FgS73FtlfKEcz5S5+tM5+mpTXR1xQbDaIVS4TQa0Dk5hVkEEWXTs1bCaT7BUFcxX4KQU1INVu53InjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POD/7O5l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POD/7O5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9281F0089D;
	Mon, 12 Oct 2026 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788445;
	bh=PFIp1TdPGhi/dzhaDgsqYvqouWDSj/ttrVAY52ALsjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POD/7O5lkr+Y8LsbAOqrJjzw03iqpsY3M0bEzVPks1D4c3b89tqQJKSrTYITb2kpt
	 J3wFaURcVmpwH4/gBblG7nvtN50JwwfmXK1JysGOLVQiluIr86LXbda83EZK0qPJ/2
	 4AY4wBvlKZqsRGDZkLEfAngUP9l29hgOz4xTS54EGpMhFiOMjIQQSt3CuQYw9Wo/GP
	 09E5BL3yFC0mYt/43OP3c8hs/OZADcMHmHYlo4Eg8SsmJ73ZL20NLIaVN5EryfV2cx
	 1SGltg2GYdre9Ef/VwSqlN4dFWtydBluvP5d3luV+6A+koluVmVAcsguiHx7fLeB3u
	 h7hn0cAjYo8kg==
Message-ID: <sashiko-outbox-167765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/tiny: Add RAiO RA8875 display controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Azuddin" <azuddinadam@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20261012064518.3497285-3-azuddinadam@gmail.com>
References: <20261012064518.3497285-1-azuddinadam@gmail.com>
 <20261012064518.3497285-3-azuddinadam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:00:44 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm: sleeping functions called from atomic commit callbacks
- [High] spi: DMA-mapped buffers embedded in struct ra8875_device lack cach=
eline alignment
- [High] drm/tiny: ra8875: heap overflow in ra8875_clear_screen() via overs=
ized mode
--

commit 7912d063f00aebeba1b3f55021d00d84d5599465
Author: Adam Azuddin <azuddinadam@gmail.com>

drm/tiny: Add RAiO RA8875 display controller driver

Add a DRM tiny driver for the RAiO RA8875 SPI-connected TFT display
controller. The driver supports display resolutions up to 800x480
and uses the GEM shmem helper for buffer management.

> diff --git a/drivers/gpu/drm/tiny/ra8875.c b/drivers/gpu/drm/tiny/ra8875.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ra8875.c
> @@ -0,0 +1,719 @@

[ ... ]

> +struct ra8875_device {
> +	struct drm_device drm;
> +	struct spi_device *spi;
> +	struct gpio_desc *rst_gpio;
> +	struct drm_crtc crtc;
> +	struct drm_plane plane;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +	struct drm_display_mode mode;
> +	u8 cmd_buf[RA8875_CMD_DATA_BUF_SIZE];
> +	u8 data_buf[RA8875_CMD_DATA_BUF_SIZE];
> +	u8 *txbuf;
> +};

[Severity: High]
Since these embedded arrays are passed to spi_write() and may be mapped
for DMA transfers, could they cause memory corruption?

During DMA mapping, the CPU performs cache invalidation and flushing
operations that operate on full cache lines. Because these small buffers
share cache lines with adjacent members of struct ra8875_device, this risks
silent memory corruption of adjacent fields (such as the txbuf pointer)
via false sharing.

Should these be declared with ____cacheline_aligned, or allocated
separately?

[ ... ]

> +static int ra8875_write_pixels(struct ra8875_device *ra8875, size_t len)
> +{
> +	int ret;
> +
> +	ra8875->cmd_buf[0] =3D RA8875_CMDWRITE;
> +	ra8875->cmd_buf[1] =3D RA8875_MRWC;
> +	ret =3D spi_write(ra8875->spi, ra8875->cmd_buf, 2);
> +	if (ret)
> +		return ret;
> +
> +	return spi_write(ra8875->spi, ra8875->txbuf, len);
> +}

[Severity: High]
Can this blocking SPI write cause scheduling while atomic warnings?

The DRM subsystem guidelines state that plane atomic callbacks (like
ra8875_plane_atomic_update()) execute in an atomic context where sleeping
is strictly forbidden.

Because ra8875_plane_atomic_update() calls ra8875_fb_dirty() which in turn
calls ra8875_write_pixels(), this synchronously invokes spi_write(). The
spi_write() API is blocking, takes a mutex, and sleeps during the transfer.

Could this be moved to a non-atomic worker or handled differently?

> +static int ra8875_hw_init(struct ra8875_device *ra8875,
> +			  struct drm_display_mode *mode)
> +{
> +	u8 hdwr, hndr, hstr, hpwr, vpwr;
> +	u16 vdhr, vndr, vstr;
> +	int ret;
> +
> +	if (ra8875->rst_gpio) {
> +		gpiod_set_value_cansleep(ra8875->rst_gpio, 1);
> +		usleep_range(1000, 1200);
> +		gpiod_set_value_cansleep(ra8875->rst_gpio, 0);
> +		msleep(RA8875_RESET_WAIT_MS);
> +	}

[Severity: High]
Does this code call sleeping functions from an atomic commit callback?

ra8875_crtc_atomic_enable() calls ra8875_hw_init(), which invokes
gpiod_set_value_cansleep(), usleep_range(), and msleep().

The DRM guidelines require that CRTC atomic enable callbacks do not sleep.
Executing these functions within the atomic commit pipeline can cause
priority inversion, deadlocks, and system instability.

[ ... ]

> +static enum drm_mode_status ra8875_mode_valid(struct drm_crtc *crtc,
> +					      const struct drm_display_mode *mode)
> +{
> +	if (mode->hdisplay % 8 !=3D 0 || mode->hsync_start % 8 !=3D 0 ||
> +	    mode->hsync_end % 8 !=3D 0 || mode->htotal % 8 !=3D 0) {
> +		drm_dbg_kms(crtc->dev,
> +		   "mode timings must be 8-pixel aligned (hdisplay=3D%d hsync_start=3D=
%d hsync_end=3D%d htotal=3D%d)\n",
> +			    mode->hdisplay, mode->hsync_start, mode->hsync_end, mode->htotal);
> +		return MODE_H_ILLEGAL;
> +	}
> +	return MODE_OK;
> +}

[Severity: High]
Could this validation allow custom modes to trigger a heap buffer overflow?

In ra8875_probe(), txbuf is allocated with a fixed size based on
RA8875_MAX_WIDTH:

    buf_size =3D 1 + RA8875_TXBUF_ROWS * RA8875_MAX_WIDTH * 2;
    ra8875->txbuf =3D devm_kzalloc(&spi->dev, buf_size, GFP_KERNEL);

When userspace submits a custom display mode, the DRM core does not restrict
mode dimensions against mode_config.max_width (which only limits framebuffer
sizes). Since there is no explicit check here that mode->hdisplay is less
than or equal to RA8875_MAX_WIDTH, a malicious or oversized mode can reach
ra8875_clear_screen().

This results in a heap overwrite when deriving the memset length:

    int width =3D mode->hdisplay;
    ...
    memset(txbuf, 0, 1 + rows_per_chunk * width * 2);

Should this function verify that mode->hdisplay <=3D RA8875_MAX_WIDTH and
mode->vdisplay <=3D RA8875_MAX_HEIGHT?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012064518.3497=
285-1-azuddinadam@gmail.com?part=3D2

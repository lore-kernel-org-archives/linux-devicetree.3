Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7130443078B
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534452; cv=none; b=BFThBrhKFHOvESKljeEYkxuGTJZCjcTAZQwKV5oeQqE6s3UNRLHMhQzh/zlcCv2382gDFSWOu6oVFB6qQIYYTExC5uhE0HR9Xlzi2ybjg21SK6kzOrlp5NO71EseFAScujc5eKXevet68VPylIyyb9nveHJWcAB/9d6XqA1W8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534452; c=relaxed/simple;
	bh=qxJCQIF4HqAK4FMyF1DDVvGywAz39R5mFjErzq+d94k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EVA4wLyEnKn0UQMSWhDJVnuxKMlnss21qnqYA7csoaA7GQsn3NvDW7BJpCQjYrQM0436spcEmx4QoRVbOYs9xO37dLWGdE/ccek1IzMxlPw1sBRc1+9CVxR7t/syoezbtU36Hh6ZVfh0xNCqvtICmRDCFtIDWz7gWoQm0U1FZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkk43sts; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkk43sts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83521F000FF;
	Sun, 27 Sep 2026 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534451;
	bh=OaBf7xddw2D53JcU0DRpu4plXwIjffjOq+eYS5SJf3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fkk43stscSrpzKfFYoeCaGhEu7QvF5ze0AEMCvlMgd7mUIryaWljPy2FDwG2eLx50
	 Y3TvPIWC8KpPX0fsH9qO/Jxjl+WP/gfEskckw3va71bKpAli59zDQgyPxXbjixPBBg
	 Hza2goQ6ho6fHngNZDouQS5UT7gL2t+q3d8fT3f44tBp/bQs8iaa18uywTXqhvkmOw
	 1vNP/xOIfxepYp/D6oLuliWwo2S3SofxG8JIE4jPro+UFi7NJQhRchhl++NWkPBCYn
	 2xp9GUBwG+jZEJMHTh3AjzWecNqJzRjPZA+VExu8vh9glPlpXwEcpR89FCYYN8op10
	 jTS8PF8IZgQZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/14] drm/solomon: ssd16xx: Add support for Solomon
 SSD1677 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260927182329.4193961-7-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
 <20260927182329.4193961-7-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:40:50 +0000
Message-Id: <20260927184050.A83521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/solomon: heap buffer overflow during 1bpp framebuffer conversi=
on
- [High] drm/solomon: illegal DMA mapping of .rodata via SPI tx_buf
--

commit 097c6bbe33ac16a0e3a2bddb2a05e16d23d7914c
Author: Devarsh Thakkar <devarsht@ti.com>

drm/solomon: ssd16xx: Add support for Solomon SSD1677 controller

Add infrastructure to support the Solomon SSD1677 e-paper controller
(up to 960x680 pixels, 10-bit pixel-level X/Y RAM addressing).

> diff --git a/drivers/gpu/drm/solomon/ssd16xx.c b/drivers/gpu/drm/solomon/=
ssd16xx.c
> index c478309d08e9f..93fa064cf5894 100644
> --- a/drivers/gpu/drm/solomon/ssd16xx.c
> +++ b/drivers/gpu/drm/solomon/ssd16xx.c
[ ... ]
> @@ -420,6 +426,29 @@ static const struct ssd16xx_controller_config ssd16x=
x_controller_configs[] =3D {
>  		},
>  		.ctrl2_load_temp_lut     =3D SSD1683_CTRL2_LOAD_TEMP_LUT,
>  	},
> +	[SSD1677] =3D {
> +		/*
> +		 * 10-bit pixel-level X/Y addressing; only deep sleep mode
> +		 * 0x03 is supported (no RAM-retain mode). Border waveform
> +		 * encoding matches SSD1683.
> +		 */
> +		.max_width  =3D 960,
> +		.max_height =3D 680,
> +		.ram_x_address_bits =3D 10,

[Severity: High]
Does this configuration allow panels with widths that are not a multiple of=
 8,
leading to a heap buffer overflow during framebuffer conversion?

Because ram_x_address_bits is 10, it bypasses the multiple-of-8 width check=
 in
ssd16xx_probe():

	if (device->controller_cfg->ram_x_address_bits =3D=3D 8 &&
	    device->width % 8 !=3D 0) {
		drm_err(drm, "panel width %u not a multiple of 8 required for byte-addres=
sed X controller)\n",
			device->width);
		return -EINVAL;
	}

This permits device->width to not be a multiple of 8. However,
ssd16xx_alloc_tx_bufs() calculates the buffer size using global packing:

	size_t frame_size =3D DIV_ROUND_UP(device->width * device->height, 8);
	device->tx_buf =3D drmm_kmalloc(&device->drm, frame_size, GFP_KERNEL);

But ssd16xx_convert_fb_to_1bpp() pads each row to a byte boundary:

	for (y =3D rect->y1; y < rect->y2; y++) {
		...
		if (++bit_pos =3D=3D 8) {
			dst[dst_idx++] =3D byte;
			byte =3D 0;
			bit_pos =3D 0;
		}
		...
		if (bit_pos > 0) {
			dst[dst_idx++] =3D byte;
			byte =3D 0;
			bit_pos =3D 0;
		}
	}

This padding means it writes DIV_ROUND_UP(width, 8) * height bytes in total,
which exceeds the allocated frame_size, causing memory corruption past the =
end
of device->tx_buf.

[ ... ]
> @@ -691,21 +736,34 @@ static int ssd16xx_hw_init(struct ssd16xx_device *d=
evice)
> =20
>  	ssd16xx_hw_reset(device);
> =20
> -	/* Software reset */
> +	/* Software reset (0x12): resets command/parameter registers to default=
s. */
>  	ssd16xx_send_cmd(device, SSD16XX_CMD_SW_RESET, &err);
>  	ssd16xx_wait_for_device(device, &err);
> =20
>  	/* Internal temperature sensor (SSD1683/SSD1680 only; not present in SS=
D1673) */
>  	if (device->controller_cfg->has_temp_sensor_ctrl) {
>  		ssd16xx_send_cmd(device, SSD1683_CMD_TEMPERATURE_SENSOR_CONTROL, &err);
>  		ssd16xx_send_data(device, SSD1683_TEMP_SENSOR_INTERNAL, &err);
>  	}
> =20
> +	/*
> +	 * Booster soft-start (0x0C): panel-specific charge pump tuning.
> +	 * Some panels (e.g. PIXPAPER 4.26m on SSD1677) require this step;
> +	 * others (e.g. GDEY042T81 on SSD1683) omit it.
> +	 */
> +	if (device->device_cfg->booster_soft_start_data) {
> +		ssd16xx_send_cmd(device, SSD16XX_CMD_BOOSTER_SOFT_START, &err);
> +		ssd16xx_send_data_bulk(device,
> +				       device->device_cfg->booster_soft_start_data,
> +				       device->device_cfg->booster_soft_start_len,
> +				       &err);

[Severity: High]
Does this pass a .rodata pointer directly to the SPI core, causing an illeg=
al
DMA mapping?

The booster_soft_start_data pointer comes from the device configuration, wh=
ich
points to static const tuning data. When this is passed to
ssd16xx_send_data_bulk() under 4-wire SPI mode:

	if (device->dc) {
		/* 4-wire SPI: D/C# GPIO high selects data mode */
		xfer.tx_buf =3D data;
		xfer.len =3D len;
		gpiod_set_value_cansleep(device->dc, 1);
		ssd16xx_spi_sync(device->spi, &msg, err);

The SPI core will attempt to DMA map the xfer.tx_buf. Mapping .rodata for D=
MA
is prohibited and can cause kernel panics or mapping failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927182329.4193=
961-1-devarsht@ti.com?part=3D6

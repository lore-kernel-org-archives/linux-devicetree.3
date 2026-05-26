Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F7E3CF699
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791033; cv=none; b=DvquyEUtfOA+orMUQ9OfPSRCsr+DL5PysJsbp3qnIIEbJMcUYMQewDHch0ltg8UMCmejffIHNh5IOHkLe/ob3H5vCjBclQ7TbO775y6bjbHTvQz4twpYPlTKxPNiWfyezRWPez+UW5HwXTO+an/UJpsYbKFWxkRAjFwe2LBYnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791033; c=relaxed/simple;
	bh=cagSGwe/XlyEUK6Ffw+H1A+roNqBJbqytKY8sJKavn8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oDrYlHUSn7vGGFQp/BsPSTHdE+/p6ylPCjifd3Ka52/AKz4tGPsO7EBMTEQpH2MtumXug+mxAGoRM5sCIrOI/oWgV1TXeCHZgW1PqOlHCiQBJPX1u4xg1cKk2WQnu+y2IzHri5FQWz1UNXtosR5iAEzWqSIhiAtjCbhtdzWhz14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtYHELld; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtYHELld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12121F000E9;
	Tue, 26 May 2026 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791032;
	bh=kM9fUIVV4scwDiXVmkE6x677JvlNvA9FataG8Ho+VMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WtYHELldo1fa3/wsR4XQRlDjYvlodoiRjzFHOMFobi4ZUNliQ6q1UNydxy5w0hpld
	 3x5cUC8mW3HU86ORIaH21rntDgpCNjCXIaBGlh/TVvbnriNVYKz3Pfze68DpNY7hcO
	 JfrCqNBieVayuF4KZsHs55JGML9gZZco+NiwvNv/jhUURloxsuZIUEDsJbdgwdmp5W
	 xFehg+/TD4Vc2/CDGum3uU+svHxuzrU2DlBg8wXNfggFLLzRbKM0t4thP8LTlH/4Sg
	 GCFxSGNBa57ffYfE401NzGY1FxXfW222t+cQeig9eutY1yvR/nnz3gxj1NefkiosYq
	 dNleMAvrAQVkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/tiny: add support for PIXPAPER 4.26
 monochrome e-ink panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "LiangCheng Wang" <zaq14760@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260526-bar-v2-2-c66df9a840c4@gmail.com>
References: <20260526-bar-v2-2-c66df9a840c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:23:51 +0000
Message-Id: <20260526102351.F12121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The plane's atomic_update callback calls multiple sleeping functio=
ns and allocates memory with GFP_KERNEL, violating DRM subsystem constraint=
s.
- [High] The driver passes stack-allocated variables and read-only data (`.=
rodata`) directly to `spi_write()`, which violates Linux DMA API requiremen=
ts.
- [High] Incorrect pixel format extraction on big-endian architectures due =
to native 32-bit reads of a little-endian byte array.
- [Medium] Hardware timeouts in `pixpaper_wait_busy()` are logged but not p=
ropagated to the caller, causing the driver to issue subsequent commands to=
 an unready panel.
- [Medium] The format conversion function `pixpaper_xrgb8888_to_bw()` unint=
entionally flips the image horizontally.
--

commit 9e268f738b87e01832dbe79fc73ab5d8adefe3cb
Author: LiangCheng Wang <zaq14760@gmail.com>

drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel

Introduce a DRM driver for the Mayqueen Pixpaper 4.26
monochrome e-ink display panel, which is controlled via SPI.
The driver supports an 800x480 display with XRGB8888
framebuffer input.

> diff --git a/drivers/gpu/drm/tiny/pixpaper-426m.c b/drivers/gpu/drm/tiny/=
pixpaper-426m.c
> new file mode 100644
> index 0000000000000..159dcc246092f
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/pixpaper-426m.c

[ ... ]

> +static void pixpaper_wait_busy(struct pixpaper_panel *panel)
> +{
> +	unsigned int timeout_ms =3D PIXPAPER_BUSY_TIMEOUT_MS;
> +	unsigned long timeout_jiffies =3D jiffies + msecs_to_jiffies(timeout_ms=
);
> +
> +	usleep_range(PIXPAPER_BUSY_POLL_INITIAL_US_MIN,
> +		     PIXPAPER_BUSY_POLL_INITIAL_US_MAX);
> +	while (gpiod_get_value_cansleep(panel->busy) !=3D 0) {
> +		if (time_after(jiffies, timeout_jiffies)) {
> +			drm_warn(&panel->drm, "Busy wait timed out\n");
> +			return;
> +		}

[Severity: Medium]
Should this function update the error context when it times out?

Currently, on timeout it logs a warning but returns without setting
err->errno_code to -ETIMEDOUT or another error code. Because the error
context is not updated, callers like pixpaper_trigger_update() remain unawa=
re
of the failure and continue sending SPI commands to an unready panel, which
may cause hardware state corruption.

> +		usleep_range(PIXPAPER_BUSY_POLL_US_MIN,
> +			     PIXPAPER_BUSY_POLL_US_MAX);
> +	}
> +}

[ ... ]

> +static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
> +			      struct pixpaper_error_ctx *err)
> +{
> +	pixpaper_spi_write(panel, 0, &cmd, sizeof(cmd), err);
> +}
> +
> +static void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
> +			       struct pixpaper_error_ctx *err)
> +{
> +	pixpaper_spi_write(panel, 1, &data, sizeof(data), err);
> +}

[Severity: High]
Does this code violate the DMA API by mapping stack memory?

The spi_write() function maps the provided buffer using the DMA API.
In pixpaper_send_cmd() and pixpaper_send_data(), pointers to local stack
variables (cmd and data) are passed.

The Linux DMA API forbids mapping stack memory because cacheline operations
by the DMA controller can silently corrupt adjacent stack frames or cause
kernel panics.

[ ... ]

> +static void pixpaper_send_init_seq(struct pixpaper_panel *panel,
> +				   const struct pixpaper_init_seq *seq,
> +				   struct pixpaper_error_ctx *err)
> +{
> +	if (err->errno_code || !seq->data || !seq->len)
> +		return;
> +
> +	pixpaper_send_cmd(panel, seq->cmd, err);
> +	pixpaper_spi_write(panel, 1, seq->data, seq->len, err);
> +}

[Severity: High]
Can passing read-only data to spi_write() cause DMA issues here?

The caller passes pointers to global const arrays residing in .rodata
(e.g., pixpaper_init_temp_sensor). The DMA API also explicitly forbids
mapping read-only data.

[ ... ]

> +static void *pixpaper_prepare_buffer(const void *vaddr,
> +				     const struct drm_framebuffer *fb,
> +				     u32 *dst_pitch,
> +				     struct pixpaper_error_ctx *err)
> +{
> +	void *dst;
> +
> +	if (err->errno_code)
> +		return NULL;
> +
> +	*dst_pitch =3D DIV_ROUND_UP(fb->width, 8);
> +	dst =3D kzalloc(*dst_pitch * fb->height, GFP_KERNEL);

[Severity: High]
Is it safe to allocate memory with GFP_KERNEL here?

This function is called from pixpaper_plane_atomic_update(), which executes
in an atomic context where sleeping is forbidden. This allocation can cause
kernel warnings (e.g., scheduling while atomic) and potential deadlocks.

> +	if (!dst) {
> +		err->errno_code =3D -ENOMEM;
> +		return NULL;
> +	}

[ ... ]

> +static void pixpaper_xrgb8888_to_bw(const void *src, void *dst, u32 heig=
ht,
> +				    u32 width, u32 src_pitch, u32 dst_pitch)
> +{
> +	const uint8_t *src_base =3D src;
> +	uint8_t *dst_pixels =3D dst;
> +
> +	if (dst =3D=3D NULL || src =3D=3D NULL)
> +		return;
> +
> +	for (u32 y =3D 0; y < height; y++) {
> +		uint8_t *dst_row =3D dst_pixels + y * dst_pitch;
> +		const uint8_t *src_row =3D src_base + y * src_pitch;
> +		const uint32_t *src_pixels =3D (const uint32_t *)src_row;
> +
> +		for (u32 x =3D 0; x < width; x++) {
> +			u32 src_x =3D width - 1 - x;

[Severity: Medium]
Does this coordinate mapping intentionally flip the image horizontally?

The source pixel index is calculated as width - 1 - x, while the destination
bit is derived directly from x. This maps the rightmost pixel of the source
to the leftmost pixel of the output.

> +			uint8_t r, g, b;
> +			u8 bit;
> +			u32 bit_pos =3D x % 8;
> +			u32 byte_pos =3D x / 8;
> +			uint32_t gray_val;
> +			uint32_t pixel;
> +
> +			pixel =3D src_pixels[src_x];
> +			r =3D (pixel >> 16) & 0xFF;
> +			g =3D (pixel >> 8) & 0xFF;
> +			b =3D pixel & 0xFF;

[Severity: High]
Can this pixel format extraction fail on big-endian architectures?

The DRM_FORMAT_XRGB8888 pixel format specifies bytes in little-endian order
in memory (B, G, R, X). The native 32-bit read casts the source buffer and
performs a 32-bit load. On big-endian architectures, this will interpret the
byte sequence incorrectly, placing the color bytes in the wrong positions
and extracting the wrong channels.

[ ... ]

> +static void pixpaper_plane_atomic_update(struct drm_plane *plane,
> +					 struct drm_atomic_state *state)
> +{

[Severity: High]
Are you aware that plane atomic_update callbacks execute in an atomic conte=
xt
where sleeping is forbidden?

This function calls pixpaper_prepare_buffer(), which allocates memory with
GFP_KERNEL, and it invokes blocking SPI operations via pixpaper_write_image=
()
and pixpaper_trigger_update() which sleep. Calling sleeping functions from
atomic context violates DRM subsystem constraints.

> +	struct drm_plane_state *plane_state =3D
> +		drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state =3D
> +		to_drm_shadow_plane_state(plane_state);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-bar-v2-0-c=
66df9a840c4@gmail.com?part=3D2

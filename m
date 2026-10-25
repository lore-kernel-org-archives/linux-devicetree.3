Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792921489;
	b=wV+JyPC5ahcZzGZn9hM40I5M0Q46M5Xe+NAV9/hzr7OeWom9nYGBaDHPwJ8zAv9prq4+
	 tJrrMgLSszxQCD4z+Se5QZhdmy2ftFOw1YmkjjpK8BvxHMl/5uAb+shb2Z6F/LLCmYmXG
	 H9xEqg/y4fNenOCb8G0WgnaR7h1EV38zqfx3fFCdNZlfAV7sq9dzktbnjm2JVspUIvxlx
	 oeEpnEDS0Pgaq0HsOuRav0G/curlHsUK9eJ3EdJSTzLjA8U8gSEWXRKbJfqc8ichQCfv6
	 7x4ioayzpW+TC43DU4yHdiM4Cc8lhtWnNM6bsvOgEIFuJT0Yw17rlt4S6bxH0o2U9pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792921489;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3JwxsyCfb55NCobpjZR9jSidMoC2tmsb6VCKlofU2pk=;
	b=I1LPj7SC5GUHZRAcARLtHRjsZOOM6gmCq0uKZGhp/5uBn6kfgogPtSSCTpn+hXp55C4x
	 5VPDLC4gYkI+zHM5tXi4TSjY44Bxl2dp8CFi5WDWCy2w1lJObaoly5gRFRFeKY1cnjvgT
	 e459ml4TwIQSGQXPbZxyR+qKW3h+bRMFaKzCK0DXHpoDOvnkNwSBqh8gshW/LF76zR2IX
	 pssG4pabK5Ihx91toHNeGaoYic4BUDJcDjgEIfXTpf4jVeARHRqolg/Cv4w/uF4k8QzMo
	 jJQJZ/tPM1t6E/U2Bi+eiI+95d1YxuSnqJDGy4guCDJc7tt0ltLhRNulHmKurcp8W6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZ1FJQd4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B5606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZ1FJQd4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDB91F01828;
	Sun, 25 Oct 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792921488;
	bh=3JwxsyCfb55NCobpjZR9jSidMoC2tmsb6VCKlofU2pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VZ1FJQd4qCNVdhT+MWemv6Ng8GdRPBxzHaY7VI0yCLqBRve3keb3D6j7XvYCamY6j
	 DiluvvT4toB0FPF1HomuzJw9DGzTeVTNrT1mzf7wVOgEAsOn6499AR7p5l/GTfFRKO
	 sst55MaFYrgulbZsDZSYiGIxgeAZQHq8H18OrfpoQlIYzfB3qCH4tl0XHCkigfpS/4
	 9ZS0QL8odZD73GsRA24PLbJDDENn07uQK1zxKhiTNIrFpKRWT6le7fss7pCmguO9DW
	 x92gwhX89Ws3sjKYKwoXdKfdjQ+LjCYIms35xLlL8/d+mXTpGEPGT8sZ0y854sOX5z
	 JO/Roed9oj1/g==
Message-ID: <sashiko-outbox-184181@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] drm/ingenic: Add a driver for the X1600 LCD
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025085816.60405-4-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
 <20261025085816.60405-4-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 09:44:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/ingenic: premature plane cleanup via drm_atomic_helper_wait_fo=
r_vblanks()
- [High] drm/ingenic: missing visibility check in x1600_lcd_plane_atomic_ch=
eck()
- [Medium] drm/ingenic: premature vblank event in x1600_lcd_crtc_atomic_flu=
sh()
- [Medium] drm/ingenic: unclocked MMIO on disable in x1600_lcd_crtc_atomic_=
disable()
--

commit ff594f68d62e2b467c0fa558eebe60679b4a51ba
Author: Olivier Louvignes <olivier@mgcrea.io>

drm/ingenic: Add a driver for the X1600 LCD controller

This commit adds a DRM driver for the Ingenic X1600 LCD controller,
supporting parallel RGB panels on a 24-bit bus with a single full-screen
RGB565 primary plane and descriptor-chain page flipping.

> diff --git a/drivers/gpu/drm/ingenic/ingenic-x1600-drm.c b/drivers/gpu/dr=
m/ingenic/ingenic-x1600-drm.c
> new file mode 100644
> index 0000000000000..34fbfc7de1c4b
> --- /dev/null
> +++ b/drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
[ ... ]
> +static void x1600_lcd_crtc_atomic_enable(struct drm_crtc *crtc,
> +					 struct drm_atomic_commit *state)
> +{
> +	struct x1600_lcd *lcd =3D to_x1600_lcd(crtc->dev);
> +	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	unsigned int hde =3D mode->htotal - mode->hsync_start;
> +	unsigned int vde =3D mode->vtotal - mode->vsync_start;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D clk_set_rate(lcd->clk, mode->crtc_clock * 1000);
> +	if (ret)
> +		dev_warn(lcd->drm.dev, "Unable to set the pixel clock: %d\n", ret);
> +	ret =3D clk_prepare_enable(lcd->clk);
> +	if (ret) {
> +		dev_err(lcd->drm.dev, "Unable to start the pixel clock: %d\n", ret);
> +		return;
> +	}
[ ... ]
> +	writel(x1600_lcd_desc_addr(lcd, lcd->cur), lcd->base + X1600_LCD_SRD_CH=
AIN_ADDR);
> +	writel(1, lcd->base + X1600_LCD_SRD_CHAIN_START);
> +	lcd->running =3D true;
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void x1600_lcd_crtc_atomic_disable(struct drm_crtc *crtc,
> +					  struct drm_atomic_commit *state)
> +{
> +	struct x1600_lcd *lcd =3D to_x1600_lcd(crtc->dev);
> +
> +	if (!x1600_lcd_stop(lcd))
> +		dev_warn(lcd->drm.dev, "The controller did not stop\n");
> +	lcd->running =3D false;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (lcd->event) {
> +		drm_crtc_send_vblank_event(crtc, lcd->event);
> +		drm_crtc_vblank_put(crtc);
> +		lcd->event =3D NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +
> +	drm_crtc_vblank_off(crtc);
> +	clk_disable_unprepare(lcd->clk);
> +}

[Severity: Medium]
In drivers/gpu/drm/ingenic/ingenic-x1600-drm.c, if clk_prepare_enable() fai=
ls
in x1600_lcd_crtc_atomic_enable(), the function returns early with lcd->clk
disabled and lcd->running left false, while the atomic state still marks the
crtc as enabled.

When the crtc is later disabled (for example via DPMS off, a subsequent
modeset, or drm_atomic_helper_shutdown() in x1600_lcd_remove()),
x1600_lcd_crtc_atomic_disable() unconditionally calls x1600_lcd_stop(lcd) a=
nd
clk_disable_unprepare(lcd->clk).

Could this access hardware registers in x1600_lcd_stop() while lcd->clk is
gated and underflow the clock prepare/enable counts in
clk_disable_unprepare(lcd->clk) if x1600_lcd_crtc_atomic_disable() does not
check lcd->running first?

[ ... ]
> +static void x1600_lcd_crtc_atomic_flush(struct drm_crtc *crtc,
> +					struct drm_atomic_commit *state)
> +{
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> +	struct drm_pending_vblank_event *event =3D crtc_state->event;
> +	struct x1600_lcd *lcd =3D to_x1600_lcd(crtc->dev);
> +
> +	if (!event)
> +		return;
> +
> +	crtc_state->event =3D NULL;
> +
> +	/*
> +	 * The controller takes a new descriptor "at appropriate time" (manual,
> +	 * 10.6.4): wait until it reports reading the one just handed over.
> +	 */
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (lcd->running && !WARN_ON(lcd->event) && drm_crtc_vblank_get(crtc) =
=3D=3D 0) {
> +		lcd->event =3D event;
> +		lcd->event_desc =3D x1600_lcd_desc_addr(lcd, lcd->cur);
> +	} else {
> +		drm_crtc_send_vblank_event(crtc, event);
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}

[Severity: Medium]
In x1600_lcd_probe(), drm->mode_config.helper_private is left unset, so
atomic commits use the default drm_atomic_helper_commit_tail() ordering:

  drm_atomic_helper_commit_tail()
    drm_atomic_helper_commit_modeset_disables()
    drm_atomic_helper_commit_planes()
      x1600_lcd_plane_atomic_update()
      x1600_lcd_crtc_atomic_flush()
    drm_atomic_helper_commit_modeset_enables()
      x1600_lcd_crtc_atomic_enable()

During any commit that enables or re-enables the crtc,
x1600_lcd_crtc_atomic_flush() runs before x1600_lcd_crtc_atomic_enable() se=
ts
lcd->running =3D true and calls drm_crtc_vblank_on(crtc).

Won't the check in x1600_lcd_crtc_atomic_flush() always take the else branch
during a modeset enable, sending the vblank event and completing flip_done
before the controller and panel bridge have even started?

[ ... ]
> +static irqreturn_t x1600_lcd_irq(int irq, void *data)
> +{
> +	struct x1600_lcd *lcd =3D data;
> +	u32 st =3D readl(lcd->base + X1600_LCD_INT_FLAG);
> +
> +	if (!st)
> +		return IRQ_NONE;
> +
> +	writel(st, lcd->base + X1600_LCD_CLR_ST);
> +	if (st & X1600_LCD_ST_STOP_SRD_ACK)
> +		complete(&lcd->stopped);
> +
> +	if (st & X1600_LCD_ST_DISP_END) {
> +		drm_crtc_handle_vblank(&lcd->crtc);
> +
> +		spin_lock(&lcd->drm.event_lock);
> +		if (lcd->event &&
> +		    readl(lcd->base + X1600_LCD_CHAIN_SITE) =3D=3D lcd->event_desc) {
> +			drm_crtc_send_vblank_event(&lcd->crtc, lcd->event);
> +			drm_crtc_vblank_put(&lcd->crtc);
> +			lcd->event =3D NULL;
> +		}
> +		spin_unlock(&lcd->drm.event_lock);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
When a page flip is programmed near the end of a frame and the controller h=
as
not yet switched to the new descriptor in lcd->event_desc when the next
end-of-frame interrupt fires, x1600_lcd_irq() holds back the flip event
because X1600_LCD_CHAIN_SITE does not match lcd->event_desc yet, but it sti=
ll
calls drm_crtc_handle_vblank(&lcd->crtc) unconditionally.

Because drm->mode_config.helper_private is unset in x1600_lcd_probe(), the
default drm_atomic_helper_commit_tail() waits for
drm_atomic_helper_wait_for_vblanks() rather than
drm_atomic_helper_wait_for_flip_done():

  drm_atomic_helper_commit_tail()
    drm_atomic_helper_wait_for_vblanks()
    drm_atomic_helper_cleanup_planes()

Can that first vblank interrupt wake drm_atomic_helper_wait_for_vblanks() a=
nd
allow drm_atomic_helper_cleanup_planes() to release the old framebuffer whi=
le
the controller is still scanning out the previous descriptor for another
frame?

> +
> +static int x1600_lcd_plane_atomic_check(struct drm_plane *plane,
> +					struct drm_atomic_commit *state)
> +{
> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
state, plane);
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!plane_state->crtc)
> +		return 0;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;
> +
> +	/* The plane covers the whole screen: no scaling, no position. */
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, true);
> +}
> +
> +static void x1600_lcd_plane_atomic_update(struct drm_plane *plane,
> +					  struct drm_atomic_commit *state)
> +{
> +	struct x1600_lcd *lcd =3D to_x1600_lcd(plane->dev);
> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
state, plane);
> +	struct drm_framebuffer *fb =3D plane_state->fb;
> +	unsigned int next =3D lcd->running ? !lcd->cur : lcd->cur;
> +	struct x1600_lcd_desc *desc =3D &lcd->desc[next];
> +
> +	if (!fb)
> +		return;
> +
> +	desc->next =3D x1600_lcd_desc_addr(lcd, next);
> +	desc->addr =3D drm_fb_dma_get_gem_addr(fb, plane_state, 0);
> +	desc->stride =3D fb->pitches[0] / fb->format->cpp[0];

[Severity: High]
In drm_atomic_helper_check_plane_state(), if userspace places the plane's
destination rectangle completely outside the active crtc dimensions, the
helper sets plane_state->visible =3D false and returns 0 before checking
can_position:

  drm_atomic_helper_check_plane_state()
    plane_state->visible =3D drm_rect_clip_scaled(src, dst, &clip);
    ...
    if (!plane_state->visible)
            return 0;

    if (!can_position && !drm_rect_equals(dst, &clip))
            return -EINVAL;

If userspace submits a small framebuffer positioned off-screen, won't
x1600_lcd_plane_atomic_check() accept the state and
x1600_lcd_plane_atomic_update() program desc->addr to scan out a full frame
past the end of the small buffer unless !plane_state->visible is rejected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025085816.6040=
5-1-olivier@mgcrea.io?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF53B0591
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484184; cv=none; b=r7dHQ1XInpMt4giQe1rwGC5F/lHDd92YUv+WmqHH4OtMp0dOjukoDkAZXdjjRhiEpO11fSOj24NP1NYSZaLo9tApuityEB6VkLzUlUlpsmInecbdbkM/LR4YxKzx5kFgoGfffWRfODwre+fUhtYgUHekIFFPh+zOQGQQZw3YMkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484184; c=relaxed/simple;
	bh=HDTbXKSrEP8NnfcN7wLq1xW25e0/ozuWqLrsgbv/4go=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=adFFZGyFUnAgGiugeuydfnCJyTyvNdw9iElWcVRyRX1ElkaXyGq11EfI3YwI079zQuE0DwMAfPVmQZgWHwza/5e44jml2NaN3ulQmwr7nn7nujxBMsOdVwPohMqrOgCy4AqtokuVHJCgEWMWCxE3jnvTz6udqVlNV6lnhU/xTx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nttf8gkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nttf8gkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82151F00A3A;
	Fri, 31 Jul 2026 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785484183;
	bh=SwB3a4bKw9EyUYICJ4TZRD6pOg3HlJ/uWRdUcg8AS00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nttf8gknYtCQqIY/QWmpL42W47afP2t+9CJPqs7/PB5Yd7yq5IiNRbZ+D1su6YC6Z
	 gKa5w0L6jniGpJd1u0+b4nioJ3bVmenx7gDwIZG9IXbyfaz18fSG6N2r4iUQudJjlI
	 ksMFT6TlitF/E9bS5kJuJE10TJ3Y8AQp9rdbsKJl2dYfRPiwllySDoBz5PgBTzJWcM
	 SyXzndF8ZFpIn+20U6xljxxlGl4xz6Pn7hEVAmuUFs2TE1874+GV5Br07PzVNbze56
	 UMUMKuI1RXcmngGBulNzPafuYYRbpnpxka9rYyoF/i+lb2ldSuy6zi3Ps//AnLoo7j
	 Dy7yqPV5QZumw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add onsemi AR0234 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Shiyan" <eagle.alexander923@gmail.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731073505.2278769-3-eagle.alexander923@gmail.com>
References: <20260731073505.2278769-1-eagle.alexander923@gmail.com>
 <20260731073505.2278769-3-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:49:42 +0000
Message-Id: <20260731074942.A82151F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Incorrect clamping order in crop selection bounds calculation =
causes unsigned integer underflow, bypassing bounds checks.
- [High] Incorrect validation of `pm_runtime_get_if_active()` allows execut=
ion to proceed on negative error codes, leading to a usage counter underflo=
w.
- [High] Missing `v4l2_subdev_cleanup()` causes a memory leak of the subdev=
ice active state.
- [High] Static hblank lower bounds permit dynamic line length reduction be=
low the absolute hardware minimum.
- [High] Potential division by zero during delay calculation if the clock r=
ate is zero.
- [Medium] Unlocked V4L2 control helpers are called during initialization w=
ithout acquiring the control handler lock, triggering a lockdep splat.
- [Medium] Mixing goto-based error handling with scope-based `__free()` cle=
anup in the same function violates API guidelines.
- [Medium] Changing the crop height fails to update exposure control limits=
 reliably.
- [Medium] The active format state is modified before verifying PLL configu=
ration, leaving state inconsistent on error.
- [Medium] Unlocked access to shared format state in `ar0234_get_frame_desc=
`.
- [Low] Using `DIV_ROUND_UP` with a 64-bit numerator causes a link error on=
 32-bit architectures.
--

--- Patch [2]: [PATCH 2/2] media: i2c: Add onsemi AR0234 image sensor drive=
r ---
commit eb8d4f60c8466169ec68bf0a9f862a5fa52e97fd
Author: Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: media: i2c: Add onsemi AR0234 image sensor driver

This commit adds a new driver for the onsemi AR0234 CMOS image sensor.

diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
new file mode 100644
--- /dev/null
+++ b/drivers/media/i2c/ar0234.c
@@ -0,0 +1,1265 @@
[ ... ]
> static void ar0234_set_framing_limits(struct ar0234 *ar0234, u32 width)
> {
> 	int hblank =3D AR0234_LINE_LENGTH_PCK_MIN * 4 - width;
>=20
> 	__v4l2_ctrl_s_ctrl(ar0234->vblank, AR0234_VBLANK_MIN);
>=20
> 	__v4l2_ctrl_modify_range(ar0234->hblank, AR0234_HBLANK_MIN,
> 				 AR0234_HBLANK_MAX, 4, hblank);
> }

[Severity: High]
Could this allow the line length to be reduced below the hardware minimum?

If userspace reduces the format width and sets hblank to this static minimu=
m,
the resulting programmed line length might violate the hardware minimum
requirement of 612. Should AR0234_HBLANK_MIN be calculated dynamically based
on the current width?

[ ... ]
> static int ar0234_set_pad_format(struct v4l2_subdev *sd,
> 				 struct v4l2_subdev_state *state,
> 				 struct v4l2_subdev_format *fmt)
> {
[ ... ]
> 	*v4l2_subdev_state_get_format(state, fmt->pad) =3D fmt->format;
>=20
> 	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> 		int ret =3D ar0234_calculate_pll(ar0234, mode);
>=20
> 		if (ret) {
> 			dev_err(sd->dev, "PLL recalculation failed: %d\n", ret);
> 			return -EINVAL;
> 		}

[Severity: Medium]
Is it safe to write to the active format state before verifying that the PLL
configuration is structurally possible?

If ar0234_calculate_pll() fails, it returns -EINVAL, but the active state
has already been irreversibly modified and left inconsistent.

[ ... ]
> static int ar0234_set_selection(struct v4l2_subdev *sd,
> 				struct v4l2_subdev_state *state,
> 				struct v4l2_subdev_selection *sel)
> {
[ ... ]
> 	/* Clamp the top-left corner so that the whole rectangle stays */
> 	/* inside the active pixel array */
> 	rect.left =3D
> 		clamp_t(u32, rect.left, AR0234_PIXEL_ARRAY_LEFT,
> 			AR0234_PIXEL_ARRAY_LEFT + AR0234_PIXEL_ARRAY_WIDTH -
> 			rect.width);

[Severity: Critical]
Can this bounds check underflow if a maliciously large rect.width is provid=
ed?

Subtracting an unvalidated width from the pixel array dimensions could resu=
lt
in a massive upper limit due to 32-bit unsigned arithmetic underflow, defea=
ting
the clamp for rect.left and causing subsequent clamps to fail as well.

[ ... ]
> 	*crop =3D rect;
> 	sel->r =3D rect;
>=20
> 	if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> 		ar0234_set_framing_limits(ar0234, crop->width);
>=20
> 	return 0;
> }

[Severity: Medium]
Does changing the crop height require updating the exposure control limits?

ar0234_set_framing_limits() forces vblank to AR0234_VBLANK_MIN, but if vbla=
nk
is already at its minimum, the V4L2 core skips the control setter. As a
result, the exposure limit is never recalculated for the smaller crop heigh=
t.

[ ... ]
> static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
> {
[ ... ]
> 	if (!pm_runtime_get_if_active(sd->dev))
> 		return 0;

[Severity: High]
Does this properly handle negative error codes from pm_runtime_get_if_activ=
e?

If runtime PM is disabled, it returns a negative error code (e.g., -EINVAL).
Because it is non-zero, this check bypasses the early return, proceeds to
access the hardware, and then calls pm_runtime_put_autosuspend(), which will
underflow the usage counter since get never incremented it.

[ ... ]
> static int ar0234_ctrls_init(struct ar0234 *ar0234)
> {
[ ... ]
> 	ar0234->sd.ctrl_handler =3D &ar0234->ctrls;
>=20
> 	ar0234_set_link_limits(ar0234, &ar0234_modes[0]);
> 	ar0234_set_framing_limits(ar0234, AR0234_PIXEL_ARRAY_WIDTH);
>=20
> 	return 0;
> }

[Severity: Medium]
Could these calls trigger a lockdep warning during boot?

ar0234_set_link_limits() and ar0234_set_framing_limits() invoke unlocked
internal control API functions which assert that the control handler lock
is held. Since this happens during probe before the lock is explicitly
acquired, this might cause a diagnostic splat.

[ ... ]
> static int ar0234_parse_hw_config(struct ar0234 *ar0234)
> {
> 	struct v4l2_fwnode_endpoint *ep_cfg =3D &ar0234->ep_cfg;
> 	struct fwnode_handle *ep __free(fwnode_handle) =3D NULL;
[ ... ]
> 	switch (ep_cfg->bus.mipi_csi2.num_data_lanes) {
> 	case 2:
> 	case 4:
> 		break;
> 	default:
> 		ret =3D dev_err_probe(ar0234->sd.dev, -EINVAL,
> 				    "Invalid number of CSI2 data lanes %d\n",
> 				    ep_cfg->bus.mipi_csi2.num_data_lanes);
> 		goto done_endpoint_free;

[Severity: Medium]
Is it acceptable to mix goto-based error labels with scope-based __free()
cleanup in the same function?

According to the cleanup.h API guidelines, mixing these heavily obscures
ownership semantics and makes the function susceptible to memory leaks and
double-free bugs during future maintenance.

[ ... ]
> static int ar0234_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> 				 struct v4l2_mbus_frame_desc *fd)
> {
[ ... ]
> 	state =3D v4l2_subdev_lock_and_get_active_state(&ar0234->sd);
> 	fmt =3D v4l2_subdev_state_get_format(state, pad);
> 	v4l2_subdev_unlock_state(state);
>=20
> 	mode =3D ar0234_mode_from_code(ar0234, fmt->code, true);

[Severity: Medium]
Is it safe to access fmt->code after releasing the active state lock?

The lock is dropped, so a concurrent set_fmt ioctl could potentially overwr=
ite
the format while it is being read here, leading to inconsistent reads.

[ ... ]
> static int ar0234_power_on(struct device *dev)
> {
[ ... ]
> 	gpiod_set_value_cansleep(ar0234->reset, 0);
>=20
> 	/* ~160000 EXTCLKs */
> 	fsleep(DIV_ROUND_UP(160000ULL * 1000000, clk_get_rate(ar0234->clk)));
>=20
> 	return 0;
> }

[Severity: Low]
Can this cause a build failure on 32-bit architectures?=20

DIV_ROUND_UP with a 64-bit numerator expands to a 64-bit by 32-bit division
using the / operator, which is prohibited in the kernel. Should this use
DIV_ROUND_UP_ULL instead?

[Severity: High]
Also, what happens if clk_get_rate(ar0234->clk) returns 0?

Since the clock rate is used as a divisor without prior validation, a
misconfigured clock could cause a kernel panic (division by zero) during
driver probe.

[ ... ]
> static void ar0234_subdev_cleanup(struct ar0234 *ar0234)
> {
> 	media_entity_cleanup(&ar0234->sd.entity);
> 	v4l2_ctrl_handler_free(&ar0234->ctrls);
> }

[Severity: High]
Does this leak the active subdevice state?

The V4L2 active state is allocated by v4l2_subdev_init_finalize() during
probe, but it appears v4l2_subdev_cleanup() is never called to free it duri=
ng
teardown, leading to a permanent leak on every unbind or failed probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731073505.2278=
769-1-eagle.alexander923@gmail.com?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264862;
	b=bmxkBQ9q872x37nafXoqOm7cDEYkZ3K0dhbRxnkPKkz1v+Avjw8AoqhLqNjOataRvnYR
	 J3xtlFSvyH7x4W8lgSezTyzbKCjHxdBJpcUS38fPmNgc3KAry7FXv6dbZ+VZiwjmgXrX9
	 gpYmWmbdMxTq9hQf2FsyB5IAASCqkmvi7jsEw0Htqi/HT+G0LrG8Xy/A6hh44JgAAmbvL
	 DMFmg2ZnGqKP+oyQglXS7v0hLSJX7et3R+Dql6RicNd3pLPm0ln7dQB48axYft53WHuhN
	 /CE1xmkZf3gojp+0DE41lcWatR7XS/UI7f27xFbaDhHONW+9x3jGQTfRJ0130MlMm2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264862;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6/24GF7874A8z6Ogu/mPCmR3eez1IXLNe8nIlrJbGf8=;
	b=MuJ7ZbwQWz7IUaUTdAb+HLo3+CG2d4hdVQf3puYgY9nMXG8Fe2JKTVAc+sSYTdafuVgf
	 qHjlUcuLAOXahCKBEcsOYpF/wMSacvOjeGwWJA7dBYzqlzUh31oXwFlcdoSbsMsuXW4eB
	 aRIkqzmxJKS18FJRhq7Re4HlOyfiWTx/8wk7Jfnw/gqS9RWQReuUN3rGVoqR+ft8HTexy
	 +Ep8IZ57zno3fM3FFjtnZapRq0oHC0uY4A+ekgsP/qeya3+2jYWbCmff6TdxmgxIy633A
	 YYAWYRZ+FLTfMowAeoSVGzujqiTRTEqKRu25q+RAL5YvqC7eoUQ+f2Rh9cTNg3DKTvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTEdtta2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD1606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTEdtta2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6787C1F008A3;
	Mon,  9 Nov 2026 22:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264861;
	bh=6/24GF7874A8z6Ogu/mPCmR3eez1IXLNe8nIlrJbGf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTEdtta2t8Ruj/eA2ZCCFtxKJ2i4Nmonrr7voldI7I5dDXyMHwq8TV+NnAjKONX58
	 /ufKGB1pRZniLdMNij/hY1qMtgwdpyOrTA6BjrgfGig23kx1xKGWvQGUS/kCDqFhvM
	 fIjv5Pu8jgJCbNGVK/erRygD5Opi5i5CQehWyRhqmC7EOK4PcybvdHO48X2pIlllNO
	 C+/rQY/XSEt1TMc6FmsgeUFhll3gM2f/39zKvAh3FMeqsfBG5gAU7GHXG3veUZiDHi
	 qQDsSRNboDPLhXV1SuFFUZPYIo1FbHGTmr47kVcC5KnFSXcMBF752dHQo5BKc4bnPo
	 XXPvZYelBEnRA==
Message-ID: <sashiko-outbox-205774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] media: i2c: Add Samsung S5KGD1 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261109-sm8150-camera-v1-6-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-6-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:54:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] media: i2c: s5kgd1: unbalanced power off in s5kgd1_probe() on
  hw check error
- [Medium] media: i2c: s5kgd1: control handler leak in s5kgd1_probe() on
  ctrl init error
- [Low] media: i2c: s5kgd1: missing link-frequencies check in
  s5kgd1_check_hw()
- [Low] media: i2c: s5kgd1: mismatch between V4L2_SEL_TGT_CROP and mode
  registers
- [Low] MAINTAINERS: SAMSUNG S5KGD1 CAMERA DRIVER entry is out of
  alphabetical order
--

commit ef74f5fd81a29e539440b215310a76d207e486a4
Author: Gaurav Suman <gauravsuman007@gmail.com>

media: i2c: Add Samsung S5KGD1 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5KGD1 32MP
quad-Bayer image sensor supporting the 2x2-binned 3264x2448 RAW10 mode.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb12d4c0c22e9..b13cf3ad43a18 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22017,6 +22017,14 @@ F:	Documentation/devicetree/bindings/media/i2c/s=
amsung,s5k3m3.yaml
>  F:	drivers/media/i2c/s5k3m3-regs.h
>  F:	drivers/media/i2c/s5k3m3.c
> =20
> +SAMSUNG S5KGD1 CAMERA DRIVER
> +M:	Gaurav Suman <gauravsuman007@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kgd1.yaml
> +F:	drivers/media/i2c/s5kgd1-regs.h
> +F:	drivers/media/i2c/s5kgd1.c
> +
>  TASK DELAY MONITORING TOOLS
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Wang Yaxin <wang.yaxin@zte.com.cn>

[Severity: Low]
This entry is placed in the P section (where TASK DELAY MONITORING TOOLS
was previously misplaced) rather than in alphabetical order between
SAMSUNG S5K5BAF CAMERA DRIVER and SAMSUNG S5KJN1 CAMERA DRIVER.

> diff --git a/drivers/media/i2c/s5kgd1.c b/drivers/media/i2c/s5kgd1.c
> new file mode 100644
> index 0000000000000..b7bd7e18cde17
> --- /dev/null
> +++ b/drivers/media/i2c/s5kgd1.c

[ ... ]

> +static int s5kgd1_get_selection(struct v4l2_subdev *sd,
> +				const struct v4l2_subdev_client_info *ci,
> +				struct v4l2_subdev_state *st,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:		/* analogue crop of the mode (0x0344..0x034a) =
*/
> +		sel->r.left =3D 24;
> +		sel->r.top =3D 16;
> +		sel->r.width =3D 6528;
> +		sel->r.height =3D 4896;
> +		return 0;

[Severity: Low]
Does V4L2_SEL_TGT_CROP match the crop registers programmed in
s5kgd1_mode_regs[]?

drivers/media/i2c/s5kgd1-regs.h:s5kgd1_mode_regs[] {
    ...
	{ 0x0344, 0x0018, 0 },
	{ 0x0348, 0x1997, 0 },
	{ 0x0346, 0x0010, 0 },
	{ 0x034a, 0x133f, 0 },
	{ 0x034c, 0x0cc0, 0 },
	{ 0x034e, 0x0990, 0 },
	{ 0x0352, 0x0004, 0 },
    ...
}

Registers 0x0346..0x034a select rows 16..4927 (4912 native rows), and
register 0x0352 applies a 4-row binned (8-row native) Y digital crop
offset before outputting 2448 binned rows (4896 native rows). Reporting
top =3D 16 with height =3D 4896 mixes the pre-digital-crop start row with t=
he
post-digital-crop height instead of reporting top =3D 24 (or height =3D 4912
for the raw analogue window).

[ ... ]

> +static int s5kgd1_check_hw(struct s5kgd1 *s)
> +{
> +	struct fwnode_handle *ep;
> +	struct v4l2_fwnode_endpoint bus =3D { .bus_type =3D V4L2_MBUS_CSI2_DPHY=
 };
> +	u64 id =3D 0;
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(s->dev), NULL);
> +	if (!ep)
> +		return -EPROBE_DEFER;
> +	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +	if (bus.bus.mipi_csi2.num_data_lanes !=3D 4)
> +		ret =3D dev_err_probe(s->dev, -EINVAL, "need 4 data lanes\n");
> +	v4l2_fwnode_endpoint_free(&bus);

[Severity: Low]
Should s5kgd1_check_hw() also validate bus.link_frequencies against
s5kgd1_link_freqs[] (e.g. via v4l2_link_freq_to_bitmap()) before freeing
bus?

v4l2_fwnode_endpoint_alloc_parse() parses the endpoint's link-frequencies
property, but it is discarded without checking that the firmware specifies
S5KGD1_LINK_FREQ (380.8 MHz).

[ ... ]

> +	ret =3D s5kgd1_check_hw(s);
> +	if (ret) {
> +		if (ret !=3D -EPROBE_DEFER)
> +			s5kgd1_power_off(dev);
> +		return ret;
> +	}

[Severity: Medium]
Can this call s5kgd1_power_off() when s->mclk and s->supplies are not
enabled?

If s5kgd1_check_hw() fails before s5kgd1_power_on() (for example when
num_data_lanes !=3D 4 returns -EINVAL) or inside s5kgd1_power_on() itself,
s5kgd1_probe() still calls s5kgd1_power_off(dev), which unconditionally
disables and unprepares s->mclk and disables s->supplies, triggering clock
and regulator enable-count underflow warnings. Powering off inside
s5kgd1_check_hw() when the chip ID check fails avoids this.

> +
> +	ret =3D s5kgd1_init_ctrls(s);
> +	if (ret)
> +		goto err_power;
> +	s->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	s->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +	s->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +	ret =3D media_entity_pads_init(&s->sd.entity, 1, &s->pad);
> +	if (ret)
> +		goto err_ctrls;
> +	s->sd.state_lock =3D s->ctrls.lock;
> +	ret =3D v4l2_subdev_init_finalize(&s->sd);
> +	if (ret)
> +		goto err_entity;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	ret =3D v4l2_async_register_subdev_sensor(&s->sd);
> +	if (ret)
> +		goto err_pm;
> +	pm_runtime_idle(dev);
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	v4l2_subdev_cleanup(&s->sd);
> +err_entity:
> +	media_entity_cleanup(&s->sd.entity);
> +err_ctrls:
> +	v4l2_ctrl_handler_free(&s->ctrls);
> +err_power:
> +	s5kgd1_power_off(dev);
> +	return ret;
> +}

[Severity: Medium]
Does this leak s->ctrls when s5kgd1_init_ctrls() fails?

s5kgd1_init_ctrls() calls v4l2_ctrl_handler_init(h, 10) and allocates
controls before checking h->error, and returning h->error without calling
v4l2_ctrl_handler_free(h) while jumping to err_power skips err_ctrls and
leaks the bucket array and any controls allocated before the failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sm8150-cam=
era-v1-0-3d2e7b407516@gmail.com?part=3D6

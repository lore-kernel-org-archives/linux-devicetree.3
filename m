Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264735;
	b=c9e5Z5AmaAAUasAxTvR5UQc0PpTV3BaAkVdo9+3anu+Vfp8oDhvQvO/ciQ9h4I/WMjpv
	 fQhPAR+zHNManr4zWGNwXdHmrl1h2Pqfvg6aAgfRl0EXFR5bMm9KZsg69rVctPAoGubVW
	 tS0CfTYBuPDtemLdgQWntPcFDBsreWkA4ZeYrFmmbxWwPlfoK0M/S++mVWwAGz4xn3Wpb
	 /fWZo80qZOBMUXPxNybTAnaLo8CJJcuu38rr9C6fTDzxqeU+XJMh2WkoYqgrVG25maKjP
	 YxCGchvJ3afwBUPpdLW3EdjEWyKGfz/UT0zHdA2ul4ZZ+l6r/fRd1NzguRDxurI3qhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2pJNpdDiZKJWHrsQoVAmPEePUBviwsT1mvR3Wka0AyM=;
	b=jG+zEQO2s1ettD9oBIaoMQYNrz3kRtpbKPrGXzoHq4G7UO4lYWPkP112RQ/MlcZvOiQo
	 JIbCQoCYmdEyq2ftvQfqJYXOj9buFPdVKtuxjHVO/EcKsosxtC4cdy9HgTEZpRbw1OJD7
	 c25RgKd54vjHaweZPVOoUpqB2ZnGA+55lcIiPtVDp8nT23Rh4+Xoz+AJd90xuL5PmcTGf
	 EmeHQmM//NCYJ7MY9mnmGvzuviNPjiB/Ahi0K4q1TvedbOc8TGDPBAAXKjg+HfHb8BYke
	 G9wA/TMFPhMaHxf/GVqBnZ8TErD3N6ozqLFtgO64ohs/pEouC7nOcJLWtGIfTa5lhIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDgZuEl0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE3606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDgZuEl0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFCA1F0089F;
	Mon,  9 Nov 2026 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264734;
	bh=2pJNpdDiZKJWHrsQoVAmPEePUBviwsT1mvR3Wka0AyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZDgZuEl0d5TeBO/YjCrGfNQCvw0X1BpBzq5UqFq7JXdmmZ6YVLghwvmyHrW2GaveT
	 e0K/0z5kqbbD4MptX6kcFxp/su1qChMfsTzualyb61UZA8CbJ4OSFwH5G8LZQ3lpdm
	 VMyC9/chW1vQrbPx6k4xo9uY2WzrRF34Ip6X4k3ycsOwAfcAHrWALS+WdSkdAlK17O
	 TK9bVK+aDRXKgxh1M/4r5+6dyX0jurl5HkOMm2dirXsvsb2aIdpbhOX3CNdluUpZm9
	 7lvVQPE8jEnF8wjb0jKKt7NtHW7MHbe9V2BoX6A6LX6gJbPEOgBDBZhz5BNRNrNn6/
	 kJZsIxx+6qvEg==
Message-ID: <sashiko-outbox-205771@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] media: i2c: Add Samsung S5K3M3 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:52:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] media: i2c: s5k3m3: unbalanced s5k3m3_power_off() on
  s5k3m3_check_hw() error
- [Medium] media: i2c: s5k3m3: leak of v4l2_ctrl_handler on
  s5k3m3_init_ctrls() error
- [Medium] media: i2c: s5k3m3: bad default_value in
  __v4l2_ctrl_modify_range()
- [Low] MAINTAINERS: SAMSUNG S5K3M3 CAMERA DRIVER entry out of
  alphabetical order
--

commit 4b23471f84d4d555487d19f192d7c504117888ad
Author: Gaurav Suman <gauravsuman007@gmail.com>

media: i2c: Add Samsung S5K3M3 image sensor driver

This commit adds a V4L2 sub-device driver for the Samsung S5K3M3 13MP image
sensor supporting 4160x3120 RAW10 at 30 fps over 4-lane MIPI CSI-2.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa647f5d37ddb..fb12d4c0c22e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22009,6 +22009,14 @@ S:	Maintained
>  F:	include/linux/delayacct.h
>  F:	kernel/delayacct.c
> =20
> +SAMSUNG S5K3M3 CAMERA DRIVER
> +M:	Gaurav Suman <gauravsuman007@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
> +F:	drivers/media/i2c/s5k3m3-regs.h
> +F:	drivers/media/i2c/s5k3m3.c
> +
>  TASK DELAY MONITORING TOOLS
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Wang Yaxin <wang.yaxin@zte.com.cn>

[Severity: Low]
This isn't a bug, but SAMSUNG S5K3M3 CAMERA DRIVER is inserted in the P
section (after PER-TASK DELAY ACCOUNTING) rather than in alphabetical order
in the S section before SAMSUNG S5K3M5 CAMERA DRIVER.

[ ... ]

> diff --git a/drivers/media/i2c/s5k3m3.c b/drivers/media/i2c/s5k3m3.c
> new file mode 100644
> index 0000000000000..5436178c5e355
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3m3.c

[ ... ]

> +static int s5k3m3_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k3m3 *s =3D container_of(ctrl->handler, struct s5k3m3, ctrls);
> +	int ret =3D 0;
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		s64 max =3D S5K3M3_HEIGHT + ctrl->val - S5K3M3_EXP_MARGIN;
> +
> +		__v4l2_ctrl_modify_range(s->exposure, s->exposure->minimum, max,
> +					 1, min(s->exposure->val, (s32)max));
> +	}

[Severity: Medium]
Does passing min(s->exposure->val, (s32)max) as the default value to
__v4l2_ctrl_modify_range() overwrite s->exposure->default_value and risk
failing with -ERANGE?

The fifth parameter of __v4l2_ctrl_modify_range() sets ctrl->default_value,
whereas clamping the current value to the new range is already handled
internally by cur_to_new() and validate_new().  In addition, s->exposure->v=
al
is the p_new scratch space rather than the committed s->exposure->cur.val; =
if
a previous VIDIOC_S_CTRL or VIDIOC_S_EXT_CTRLS call on V4L2_CID_EXPOSURE
failed validation with a value below s->exposure->minimum (4), s->exposure-=
>val
retains that out-of-range value and check_range() rejects the range update
with -ERANGE.  Passing max as the default value (matching s5k3m3_init_ctrls=
())
avoids both issues.

[ ... ]

> +static int s5k3m3_init_ctrls(struct s5k3m3 *s)
> +{
> +	struct v4l2_ctrl_handler *h =3D &s->ctrls;
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *c;
> +	u32 vb =3D S5K3M3_FLL - S5K3M3_HEIGHT, hb =3D S5K3M3_LLP - S5K3M3_WIDTH;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(h, 10);

[ ... ]

> +	ret =3D v4l2_fwnode_device_parse(s->dev, &props);
> +	if (!ret)
> +		v4l2_ctrl_new_fwnode_properties(h, &s5k3m3_ctrl_ops, &props);
> +	if (h->error)
> +		return h->error;
> +	s->sd.ctrl_handler =3D h;
> +	return 0;
> +}

[ ... ]

> +static int s5k3m3_check_hw(struct s5k3m3 *s)
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
> +	if (ret)
> +		return ret;
> +
> +	ret =3D s5k3m3_power_on(s->dev);
> +	if (ret)
> +		return ret;
> +	cci_read(s->regmap, S5K3M3_REG_CHIP_ID, &id, &ret);
> +	if (!ret && id !=3D S5K3M3_CHIP_ID)
> +		ret =3D -ENODEV;
> +	if (ret)
> +		dev_err(s->dev, "chip id 0x%llx, error %d\n", id, ret);
> +	return ret;
> +}
> +
> +static int s5k3m3_probe(struct i2c_client *client)
> +{

[ ... ]

> +	ret =3D s5k3m3_check_hw(s);
> +	if (ret) {
> +		if (ret !=3D -EPROBE_DEFER)
> +			s5k3m3_power_off(dev);
> +		return ret;
> +	}

[Severity: Medium]
Can this call s5k3m3_power_off() when s->mclk and s->supplies have not been
enabled?

s5k3m3_check_hw() can return a non-EPROBE_DEFER error from
v4l2_fwnode_endpoint_alloc_parse(), the 4-lane check (-EINVAL), or
s5k3m3_power_on() itself (which already rolls back s->supplies if
clk_prepare_enable() fails).  Calling s5k3m3_power_off() in s5k3m3_probe() =
on
those paths triggers unbalanced clk_disable_unprepare() and
regulator_bulk_disable() calls.

> +
> +	ret =3D s5k3m3_init_ctrls(s);
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
> +	s5k3m3_power_off(dev);
> +	return ret;
> +}

[Severity: Medium]
Does s5k3m3_init_ctrls() leak s->ctrls when control registration fails?

s5k3m3_init_ctrls() returns h->error without calling
v4l2_ctrl_handler_free(h), and s5k3m3_probe() jumps to err_power instead of
err_ctrls, leaking the allocations made by v4l2_ctrl_handler_init() and any
controls added before the failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sm8150-cam=
era-v1-0-3d2e7b407516@gmail.com?part=3D4

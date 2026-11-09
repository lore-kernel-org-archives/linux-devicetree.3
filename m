Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264552;
	b=XETwt8I07N8DtuoCBo5/nUJeql8wLmpXg5Dqkjg8IP1YbmZiZHKUPxi7o12gaU05CZVS
	 YLftjMAE+2RMiJ/fQ1pSRQsxW5NmNlYJ3O1jSpwyEy5l3/gA4RaCjq5oBkKH8+UJtJBK4
	 6iI6JodjkN3EJE/9pYN0jzCmWsuwni880lacnsuWNAV5zIxaH27SSci5OPWjO0ex24KZj
	 /VruSSlsbzXJfkklXcQdJ6iY3yUyHMUWKywP3ZZgcC5lGUGZwpUAN5UYIUBfzJMnNqLu8
	 uM9Alj8aKJcGr90gtR++Kvzgom12DHkn64MLfcNFgrapR1S/8vx0m3/EeCArRqUvorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1srK4Sa4wuMYCeJzv1YGlREBvmRIup7vSZqR6NjRDH0=;
	b=KWrScV69w951Ytwdi2KqIN2Fs1NbbIiAf6iOK2hs+VQTAQfTuK442N9+sFveA38pfiUf
	 YhzXiwZtbNSO6faMF2CFcs+KKlQeUwMcsNmDzELNh+i7NM5Uhwz1UKnJEIHAPVm2rtRi8
	 8ylDsi3PfpIhU89N2XVS7fumohIeqPSi2a89WdzN9A3RylQNEUuyGuEHzEYiEZDyFgX8c
	 4tPQI+F0+7HaItWyr+91mAtNeshO9NRFPwkkM5QhBh9UKkQ5G0cBxFxbMMUcB6TW1oytr
	 Ro/JjUAEbmaMc7EcbS9znLHALfTrdeY8FUkHEZI1+s9iou+qKTYYr7y9e8e8jdVb4Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fv7j1HKL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C808606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fv7j1HKL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FE41F0089F;
	Mon,  9 Nov 2026 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264551;
	bh=1srK4Sa4wuMYCeJzv1YGlREBvmRIup7vSZqR6NjRDH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fv7j1HKLjxIarKk0G/J7ktQ+nKt4om52Y1hix5/8jLAqZfCI/dibwYZJXVVf34mQB
	 6wMlg8e5bsT/aPWTubUMCVqIuqO8cgbxqgzafBJbXD3MAycYVGWG3WufsxCxAXArn9
	 n1rQ7gscP4ImAcebIJmjUQyGfa5v7rgYM1Hx1uB1uCmoaTGBVRLxzhWmXk4yvy7BPn
	 hkQ3cDt2pxwiIYZJRnQYZ4M8xKIRVYyvAx6siM9uncypKXL7Xa9JEEfX1YTkDxsEb5
	 5xJwMM0A7XEH/zCTe4925pRp5e0JsISf+cml26BZbv8egviXuP0iJEA7lMTahVKcny
	 cxngk1k7wBHNA==
Message-ID: <sashiko-outbox-205770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] media: i2c: Add ON Semiconductor LC898123F40 lens
 autofocus driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261109-sm8150-camera-v1-8-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-8-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:49:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] media: i2c: lc898123: unlocked __v4l2_ctrl_handler_setup() in
  lc898123_open()
- [Medium] media: i2c: lc898123: missing runtime PM and unconditional
  init on every open()
- [Low] media: i2c: unsorted CONFIG_VIDEO_LC898123 entry in
  drivers/media/i2c/Makefile
--

commit 90488b1ee2e93be2704532224dc3a72b0184545b
Author: Gaurav Suman <gauravsuman007@gmail.com>

media: i2c: Add ON Semiconductor LC898123F40 lens autofocus driver

This commit adds a V4L2 lens sub-device driver for the autofocus function
of the ON Semiconductor LC898123F40 OIS/AF controller.

> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 7e714dbcbf69d..836bf5b8a44e2 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_VIDEO_DW9714) +=3D dw9714.o
>  obj-$(CONFIG_VIDEO_DW9719) +=3D dw9719.o
>  obj-$(CONFIG_VIDEO_DW9768) +=3D dw9768.o
>  obj-$(CONFIG_VIDEO_DW9807_VCM) +=3D dw9807-vcm.o
> +obj-$(CONFIG_VIDEO_LC898123) +=3D lc898123.o
>  obj-$(CONFIG_VIDEO_ET8EK8) +=3D et8ek8/
>  obj-$(CONFIG_VIDEO_GC0308) +=3D gc0308.o
>  obj-$(CONFIG_VIDEO_GC0310) +=3D gc0310.o

[Severity: Low]
This isn't a bug, but entries in this Makefile are sorted alphabetically by
CONFIG symbol, so CONFIG_VIDEO_LC898123 belongs between CONFIG_VIDEO_KS0127
and CONFIG_VIDEO_LM3560.

> diff --git a/drivers/media/i2c/lc898123.c b/drivers/media/i2c/lc898123.c
> new file mode 100644
> index 0000000000000..69516ad964d60
> --- /dev/null
> +++ b/drivers/media/i2c/lc898123.c

[ ... ]

> +static int lc898123_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *=
fh)
> +{
> +	struct lc898123 *lc =3D container_of(sd, struct lc898123, sd);
> +	int ret =3D 0;
> +
> +	cci_write(lc->regmap, LC898123_REG_OIS_CTRL, 0, &ret);
> +	cci_write(lc->regmap, LC898123_REG_SERVO, 1, &ret);
> +	if (!ret)
> +		ret =3D __v4l2_ctrl_handler_setup(&lc->ctrls);
> +	return ret;
> +}

[Severity: Medium]
Should lc898123_open() call v4l2_ctrl_handler_setup(&lc->ctrls) instead of
__v4l2_ctrl_handler_setup(&lc->ctrls)?

subdev_open() invokes sd->internal_ops->open() without holding
lc->ctrls.lock, so calling the unlocked helper triggers
lockdep_assert_held(hdl->lock) on every open of the subdev node and races
with concurrent V4L2 control ioctls or open() calls when updating control
state and writing LC898123_REG_AF_POS.

> +
> +static const struct v4l2_subdev_internal_ops lc898123_internal_ops =3D {
> +	.open =3D lc898123_open,
> +};
> +
> +static const struct v4l2_subdev_ops lc898123_ops =3D { };
> +
> +static int lc898123_probe(struct i2c_client *client)
> +{
> +	struct lc898123 *lc;
> +	u64 val;
> +	int ret;
> +
> +	lc =3D devm_kzalloc(&client->dev, sizeof(*lc), GFP_KERNEL);
> +	if (!lc)
> +		return -ENOMEM;
> +	ret =3D devm_regulator_get_enable_optional(&client->dev, "vdd");
> +	if (ret && ret !=3D -ENODEV)
> +		return dev_err_probe(&client->dev, ret, "vdd supply\n");
> +	if (!ret)
> +		usleep_range(10000, 12000);	/* controller boot from flash */
> +
> +	lc->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(lc->regmap))
> +		return PTR_ERR(lc->regmap);
> +	ret =3D cci_read(lc->regmap, LC898123_REG_AF_POS, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "no response\n");
> +	cci_write(lc->regmap, LC898123_REG_SERVO, 1, NULL);

[Severity: Medium]
Does enabling the vdd supply and LC898123_REG_SERVO here without runtime PM
or a .close callback leave the regulator and VCM servo energized permanently
from boot?

Although linux/pm_runtime.h is included, runtime PM is never set up, so the
actuator draws current continuously even when the camera is idle or the
system is suspended.  In addition, the return value of cci_write() here is
ignored, and lc898123_open() unconditionally rewrites LC898123_REG_OIS_CTRL,
LC898123_REG_SERVO and LC898123_REG_AF_POS on every open() of the subdev
node, which can disturb an active camera session if another process opens
the device node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sm8150-cam=
era-v1-0-3d2e7b407516@gmail.com?part=3D8

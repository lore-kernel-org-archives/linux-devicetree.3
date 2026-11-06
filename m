Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939539;
	b=U0XBR6JC7J80lJurP5fB2zYQ3w70aQsWkgGwLIRXYsGcyfqnBYARt5OjbckKLKocFm0H
	 xn8ikKgm95XfTUWrnmnL+iVA6s5B7zZ2Cw3YpiiQKPqJYLXx++EhrKca3qIL6o5HNWVIj
	 OZf6lyG7jk3MPuyl3/D5ffTVNWU0kq4pMugZ70jnkmhoxgbDix3M2PPWAY2/tuMotkhem
	 u/xT+fw8EkqOYYzQytV/td7Qt5qKRR+72F2Wv9O2fsutaoqOsdHauJa/eVI0e7scYGDMB
	 fyAXfIGKd8h9IzYJLUjnNkuPH+e1NBgnSufGXR5UuwR/PpGjhbVxdqp86ZxvY9rHqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7XTm/rlLuipPB4Vv3FcD84vpicrBkOW6hXuFXbWoUrI=;
	b=s40vbD8whoghEBovm4xAzw9s39i94bwj5VzS4rROwSJoSup0zclx0hqPSh2ZNdF6U3RH
	 ohi7AvN0czLoD/GwWdGQz6CPzg3YkOGLUovFaZ0cm/XOa2TecPz0Nk7qOtf7S2xaGBJHC
	 toBZSkmt2skddphDLKlChxJbTlJfexseq3quOpgCQhbx4foxreL5k2jfSrwc9yAM3lRJv
	 eyyB7MeA7fT8in7gKT7AoN/kgnZZyBwqf07yuKzAES2wl4LphJsaT4IrYIpcdd9v3506E
	 yHnyPwOvMRUz5UWK1V/ul9hMqFBSDf16yf085GCyTNGIXowUG8irdAbJBZdCiBdWtfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TM9oLUto;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDCB606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TM9oLUto
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5336F1F0089F;
	Fri,  6 Nov 2026 04:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793939538;
	bh=7XTm/rlLuipPB4Vv3FcD84vpicrBkOW6hXuFXbWoUrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TM9oLUto72kkmZy94dB8SFMChEC9mXyFDnxpVKxzY/uh38M79sfbfDplyPlqCUyIS
	 3MflxpG1cPbEIW1q0wUsFRjiXk0YHZyyzs4z18CQzldKi0SLYhe1LKi2G2409FizD8
	 sSlvOS9R2jtZ+7OBA0mm1CWpHBgdk5WV/9uRDKeAHij5oEMK6tBF/+DHRfpxbGxJHg
	 EzH01fCCkipRZOLIpEuxLd10i28KZAmRQ8J2gj/vW7zqjCOb9OJhG4JZbAnME4u3g9
	 qpPy7n1pCFg5AhKQmEtTNCm3ZwixrRORcJwaF/TE855/neLsrNXmEfySoHAZMST6AW
	 Fx2V7qPKJ5OEw==
Message-ID: <sashiko-outbox-200726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106041116.78937-3-lsa.uz@pm.me>
References: <20261106041116.78937-1-lsa.uz@pm.me>
 <20261106041116.78937-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 04:32:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: i2c: imx681: double imx681_power_off() on imx681_probe() =
error path
--

commit c9e6568c02771cf63bede017166c475cf41cb773
Author: Andre Gilerson <andre.gilerson@gmail.com>

media: i2c: Add Sony IMX681 sensor driver

This commit adds a V4L2 sub-device driver for the Sony IMX681 10-bit Bayer
sensor supporting 3844x2640 at 30 fps over a two-lane CSI-2 bus, with contr=
ols
for exposure, gains, vertical blanking, flips, and test patterns.

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000000..06fdf1856aecc
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c

[ ... ]

> +static int imx681_probe(struct i2c_client *client)
> +{
> +	struct imx681 *imx681;
> +	unsigned long xclk_freq;
> +	int ret;

[ ... ]

> +	/* Power on and verify chip ID */
> +	ret =3D imx681_power_on(imx681->dev);
> +	if (ret)
> +		return dev_err_probe(imx681->dev, ret, "power on failed\n");
> +
> +	ret =3D imx681_identify_module(imx681);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Enable runtime PM */
> +	pm_runtime_set_active(imx681->dev);
> +	pm_runtime_enable(imx681->dev);
> +	pm_runtime_set_autosuspend_delay(imx681->dev, 1000);
> +	pm_runtime_use_autosuspend(imx681->dev);
> +
> +	/* Init V4L2 controls */
> +	ret =3D imx681_init_controls(imx681);
> +	if (ret)
> +		goto error_pm;
> +
> +	/* Setup subdev */
> +	imx681->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx681->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +	imx681->sd.internal_ops =3D &imx681_internal_ops;
> +
> +	/* Init media entity */
> +	imx681->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +	ret =3D media_entity_pads_init(&imx681->sd.entity, 1, &imx681->pad);
> +	if (ret) {
> +		ret =3D dev_err_probe(imx681->dev, ret,
> +				    "media entity init failed\n");
> +		goto error_handler_free;
> +	}
> +
> +	imx681->sd.state_lock =3D imx681->ctrl_handler.lock;
> +	ret =3D v4l2_subdev_init_finalize(&imx681->sd);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(imx681->dev, ret,
> +				    "subdev init finalize failed\n");
> +		goto error_media_entity;
> +	}
> +
> +	ret =3D v4l2_async_register_subdev_sensor(&imx681->sd);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(imx681->dev, ret,
> +				    "async register subdev failed\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_idle(imx681->dev);
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&imx681->sd);
> +error_media_entity:
> +	media_entity_cleanup(&imx681->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
> +error_pm:
> +	pm_runtime_dont_use_autosuspend(imx681->dev);
> +	pm_runtime_disable(imx681->dev);
> +	pm_runtime_set_suspended(imx681->dev);
> +error_power_off:
> +	imx681_power_off(imx681->dev);
> +
> +	return ret;
> +}

[Severity: Medium]
Can imx681_probe() call imx681_power_off() twice on the error path?

When pm_runtime_set_autosuspend_delay() is called after pm_runtime_enable()
with a usage_count of 0 (and use_autosuspend not yet set),
update_autosuspend() invokes:

  pm_runtime_set_autosuspend_delay()
    -> update_autosuspend()
      -> rpm_idle(dev, RPM_AUTO)
        -> rpm_suspend(dev, RPM_AUTO)
          -> imx681_power_off()

This synchronously suspends the device and disables xclk and the supplies
during probe. Similarly, at the error_pm label, calling
pm_runtime_dont_use_autosuspend() before pm_runtime_disable() also runs
update_autosuspend() -> rpm_idle() -> rpm_suspend() -> imx681_power_off() if
the device is still runtime-active.

If imx681_init_controls(), media_entity_pads_init(),
v4l2_subdev_init_finalize(), or v4l2_async_register_subdev_sensor() fails,
execution falls through error_pm to error_power_off and calls
imx681_power_off(imx681->dev) a second time, underflowing the enable counts
on imx681->xclk and imx681->supplies.

Would holding a runtime PM reference across probe (via pm_runtime_get_nores=
ume()
before pm_runtime_enable(), paired with pm_runtime_put_noidle() on error or
pm_runtime_put_autosuspend() at the end of probe) or checking
!pm_runtime_status_suspended() after pm_runtime_disable() as done in
imx681_remove() avoid the double power-off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106041116.7893=
7-1-lsa.uz@pm.me?part=3D2

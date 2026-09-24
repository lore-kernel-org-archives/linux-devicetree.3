Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829D3E4115
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229518; cv=none; b=eUXUuJQDkh/pMq6v1rZolg6zScIGi5gaCvj8t82GO88H0AER+a7eg+NCF3brMARtQXKotRoKml+6Ip2YMYEf9cobELRGzb4CGCiDTn1FQWAwPetHf14M/Ic+/jKoxR0OgpxuBbkdQtjXs3qdOuavRSUrzytrSjMPM2sa5rM/5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229518; c=relaxed/simple;
	bh=PaotyZKSjOcQcts6Jc0PkzjK1eC3u+QALjxjkoDrS0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DU+oMzWN+IRpFw2JIMYXooOMuK4BcyrWyzWDMcZPywbde0eiqeq4o9x6rDGPI3lGtW1ysD8Z9d8viT86kmZJ0zYVQQeiYZu7rvRICKpFA9PJMxt6K2x0RJBlip5zws31X9zJFkhw5dH9nnnNN4uOM3Jj7UqDFpMolUyAZ/AFubE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5BAFmI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5BAFmI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A141F000FF;
	Thu, 24 Sep 2026 05:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790229517;
	bh=nlsBt72y7JVORF3zGz+MHJ+SagO6rdPvh92lOecd9fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5BAFmI3pfEIQl9krz9+jkfRXi80Qh5Er3zzEIdtWeIT8dHCqxozCecSHJjfUtufQ
	 i5iUvwAwQc0iwkmOvemwfj1IU602iuJ4kyPcOfWNBX/qz/KpoqKIcQ0oEWV4Qo4Zv4
	 PX7ab5kieBgUlErvpjSuUAcREzOwsvqRpEmx/aCv7OEYR1NcJdJh8c1HLYXI0nULqT
	 mVj9lRQJA1usryWgypL1bt4i+RV74OIYoQ0XxS6wKk9SZ6aaymlIGuPakjZ55FeYSa
	 Pbl2kezx+DGU8GtieT0OCx9rr6AN/NtSQMxmgRWWjlnUA9OPcafjW5NoL30qsQw7Sj
	 CpaIyVxCC2N7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260924-upstream-s5k3t2-v3-2-a5c58dfcec29@proton.me>
References: <20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me>
 <20260924-upstream-s5k3t2-v3-2-a5c58dfcec29@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 05:58:36 +0000
Message-Id: <20260924055836.A5A141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: i2c: s5k3t2: PM usage counter underflow due to incorrect pm=
_runtime_get_if_active() check
- [High] media: i2c: s5k3t2: Array filter ignores index leading to NULL poi=
nter dereference
--

commit 3fc6dedbde02c5967afbd9449d7a6ccc791af98e
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>
Subject: media: i2c: Add Samsung S5K3T2 image sensor driver

This commit adds a driver for the Samsung S5K3T2 20 Mpixel CMOS image senso=
r.
It supports three modes and manages power using runtime PM with autosuspend.

> diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c
> new file mode 100644
> index 0000000000000..5958312177753
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3t2.c
[ ... ]
> @@ -0,0 +1,1360 @@
[ ... ]
> +static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	if (!pm_runtime_get_if_active(s5k3t2->dev))
> +		return 0;

[Severity: High]
Does this code handle negative error codes correctly?

If pm_runtime_get_if_active() returns a negative error code (such as
-EINVAL when runtime PM is disabled, which can happen during driver unbind
or system suspend phases), !(-EINVAL) evaluates to 0.

This bypasses the early return and allows execution to proceed to access
the hardware when the device is not active.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
[ ... ]
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(s5k3t2->dev);

[Severity: High]
Can this cause a PM usage counter underflow?

If pm_runtime_get_if_active() returned a negative error code earlier,
the usage counter was not incremented. Calling pm_runtime_put() here
would unconditionally decrement the counter, leading to an underflow.

> +
> +	return ret;
> +}
[ ... ]
> +static int s5k3t2_init_controls(struct s5k3t2 *s5k3t2)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr =3D &s5k3t2->ctrl_handler;
> +	const struct s5k3t2_mode *mode =3D s5k3t2->mode;
> +	s64 hblank, vblank, exposure_max;
> +	struct v4l2_fwnode_device_properties props;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> +
> +	s5k3t2->link_freq =3D
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &s5k3t2_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       ARRAY_SIZE(s5k3t2_link_freq_menu) - 1,
> +				       mode->link_freq_index,
> +				       s5k3t2_link_freq_menu);
> +	if (s5k3t2->link_freq)
> +		s5k3t2->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	s5k3t2->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE,
> +					       S5K3T2_PIXEL_RATE,
> +					       S5K3T2_PIXEL_RATE, 1,
> +					       S5K3T2_PIXEL_RATE);
> +
> +	hblank =3D mode->hts - mode->width;

[Severity: High]
Can mode be NULL here?

If v4l2_find_nearest_size_conditional() returns NULL during probe,
mode is NULL and this assignment will trigger a NULL pointer dereference.
This occurs because s5k3t2_filter_by_link_freq() always evaluates the
first element of the modes array, leading to a failure to match any mode
if the board doesn't use the link frequency of the first element.

> +	s5k3t2->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,
> +					   V4L2_CID_HBLANK, hblank,
> +					   hblank, 1, hblank);
[ ... ]
> +static bool s5k3t2_filter_by_link_freq(const void *array, size_t index,
> +				       const void *context)
> +{
> +	const struct s5k3t2_mode *mode =3D array;
> +	const struct s5k3t2 *s5k3t2 =3D context;
> +
> +	return s5k3t2->link_freq_bitmap & BIT(mode->link_freq_index);

[Severity: High]
Does this filter ignore the index parameter?

By assigning array to mode directly, it only ever checks the first element
of the array instead of indexing into it.

If the first element's link frequency is missing from the device tree
configuration, this function will always return false for every index,
causing v4l2_find_nearest_size_conditional() to return NULL.

> +}
[ ... ]
> +static int s5k3t2_probe(struct i2c_client *client)
> +{
[ ... ]
> +	s5k3t2->mode =3D
> +		v4l2_find_nearest_size_conditional(s5k3t2_supported_modes,
> +						   ARRAY_SIZE(s5k3t2_supported_modes),
> +						   width, height,
> +						   S5K3T2_DEFAULT_WIDTH,
> +						   S5K3T2_DEFAULT_HEIGHT,
> +						   s5k3t2_filter_by_link_freq,
> +						   s5k3t2);
> +	ret =3D s5k3t2_init_controls(s5k3t2);

[Severity: High]
If v4l2_find_nearest_size_conditional() returns NULL, s5k3t2->mode will be
set to NULL, and s5k3t2_init_controls() will dereference it.

Is it possible to add a check for NULL here?

> +	if (ret) {
> +		dev_err_probe(s5k3t2->dev, ret, "failed to init controls\n");
> +		goto power_off;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-upstream-s=
5k3t2-v3-0-a5c58dfcec29@proton.me?part=3D2

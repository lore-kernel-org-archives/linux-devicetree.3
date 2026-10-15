Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7FC4D7D4D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061337; cv=none; b=YTsFsqbJRcB87Qi8o7gkmUX8tRB82hTvaqvULHuhkvFeO6z+4axCTvGg4ffsjZu2nNeZ+pOr/M9DAV0p6HohGdyhyJCpq1UC1FEwx2DZ+hWKMubjkQ6f+rXj8lydj0SwNE+mtJUj5/Gx3TzyQYTqeH7DA77+zNuZmh8GmmVwXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061337; c=relaxed/simple;
	bh=PE5IM/0c5n7mnZAp7qzXdNrq32P7L4J4B5RI6uIq1Wk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=X12giZeNBCor213pFJXq154Fp2h9h++/zqLnecvog3msw3ceE/qiPc8QiTUTmMHKEYOPC0h7CHyxJu0RCSDBv0zqbHmE1Eg2KLygpXbxbL7fPg+OU6BnkTWO2iX1a8TbYZlL+OCKAK8gZsqDrlMPx3TXpJxfCWesMb2PVVDUUTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igmSW63u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igmSW63u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E520C1F000C4;
	Thu, 15 Oct 2026 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061335;
	bh=37YvCkKbKy+8dVXjVaECplbVZHlKkjmQqurews8dNTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=igmSW63uz9U+nuwoy5k+/Pi7gwVCs7WlVh0Mdzz9JlTtdQ2JatZ4W5XLPIaOYVLT7
	 3Ou/42SD27hzV4cWiwOvuWP9MddHChq2zVffR2ykC30L0EDMMcK7Z4uGwW8NQsKj4E
	 MEXDJu9wtQqTulMVHYDoyM1L12UOJ30ZAY+N0AIdvuYUVAPv7P2P7bfcqy9ioSvQQu
	 WUH/VSsC63ns2V9ZbDZpNgsfns9W6TE49fALsgiHqza7KEsWug+TAPUhnkBq179H4R
	 XNrW5HAh0f9Pzo77dxLcbX8emVuBhR/2aWMIJlh/vjE1tGdLF74HJGYkEviv/ouQ7y
	 elZGbHV2PO5aA==
Message-ID: <sashiko-outbox-172681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261015-mira016-v6-2-177ecfd6d357@ideasonboard.com>
References: <20261015-mira016-v6-0-177ecfd6d357@ideasonboard.com>
 <20261015-mira016-v6-2-177ecfd6d357@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 10:48:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] media: use-after-free in mira016_remove() due to wrong teardown or=
der
- [Medium] pm: usage count underflow due to improperly checking pm_runtime_=
get_if_in_use()
- [Medium] regulator: unbalanced regulator_disable() in mira016_power_on() =
error path
- [Medium] media: i2c errors are silently masked in mira016_configure_pll()
- [Low] gpio: reset line improperly de-asserted in power-on error path
- [Low] media: severe integer truncation in mira016_calc_prate()
--

commit 6cf847015f19126b3da9f83cec8a64f50c6aa2bd
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016

Add driver for the ams OSRAM Mira016 sensor.

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> index 0000000000000..7ab42dd865593
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
[ ... ]
> +static inline u32 mira016_calc_prate(struct mira016 *mira016, u32 h_tot)
> +{
[ ... ]
> +	u32 trow_psec =3D mira016_trow_psec(mira016);
> +
> +	return h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ;

[Severity: Low]
Does this calculation suffer from severe integer truncation?=20

The intermediate division divides a value around 400,000,000 by 5,600,000,
resulting in a small integer. Multiplying that small integer by HZ_PER_MHZ
discards all fractional precision, which might lead to an inaccurate pixel
rate and A/V sync drift.

[ ... ]
> +static int mira016_configure_pll(struct mira016 *mira016)
> +{
> +	int ret =3D 0;
> +	u64 val;
[ ... ]
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_TX_ESC_L_REG,
> +		  mira016->pll.esc_l, &ret);
> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +	if (ret)
> +		return ret;
> +
> +	return read_poll_timeout(cci_read, ret,
> +				 (ret < 0 || (val & MIRA016_PLL_LOCKED)),
> +				 500, 10000, false, mira016->regmap,
> +				 MIRA016_PLL_LOCK_REG, &val, NULL);

[Severity: Medium]
Will this silently mask I2C communication errors?

The macro read_poll_timeout() evaluates to 0 when its exit condition is met.
If cci_read() fails, it sets ret to a negative error code. This makes the
condition (ret < 0) true, causing the macro to break the loop and return 0
(success) instead of propagating the actual error.

This could allow the driver to proceed under the false assumption that the
PLL locked successfully.

[ ... ]
> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mira016 *mira016 =3D
> +		container_of(ctrl->handler, struct mira016, ctrl_handler);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_rect *crop;
> +	int ret =3D 0;
[ ... ]
> +	if (!pm_runtime_get_if_in_use(mira016->dev))
> +		return 0;

[Severity: Medium]
Can this bypass the early return if pm_runtime_get_if_in_use() returns an
error code?

The function returns a negative value like -EINVAL if Runtime PM is disable=
d.
In that case, (!ret) evaluates to false, allowing the driver to proceed and
access unpowered hardware.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D mira016_write_exposure_reg(mira016, ctrl->val);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret =3D mira016_write_frame_duration_reg(mira016, state, ctrl->val);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D mira016_write_analogue_gain(mira016, state, ctrl->val);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(mira016->dev);

[Severity: Medium]
If the earlier pm_runtime_get_if_in_use() returned a negative error code and
bypassed the return, won't this call to pm_runtime_put_autosuspend() cause
an unbalanced usage count decrement? The count was never incremented by the
failed get call.

[ ... ]
> +static int mira016_power_on(struct device *dev)
> +{
[ ... ]
> +	ret =3D cci_multi_reg_write(mira016->regmap, mira016_init_sequence,
> +				  ARRAY_SIZE(mira016_init_sequence), NULL);
> +	if (!ret)
> +		ret =3D mira016_configure_pll(mira016);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(mira016->xclk);
> +err_reset_assert:
> +	gpiod_set_value_cansleep(mira016->reset_gpio, 0);

[Severity: Low]
Is this writing the inverse of the expected reset value?

The probe function requests this GPIO as GPIOD_OUT_HIGH, and
mira016_power_off() writes 1 to assert reset. Writing 0 here de-asserts the
reset line, waking the sensor up instead of leaving it in a safe reset state
during an error rollback.

> +err_reg_disable:
> +	for (int i =3D ARRAY_SIZE(mira016_supplies) - 1; i >=3D 0; i--)
> +		regulator_disable(mira016->supplies[i]);

[Severity: Medium]
Does this unconditionally disable all regulators regardless of how many were
successfully enabled?

If regulator_enable() fails, this cleanup loop uses a newly scoped variable
starting from ARRAY_SIZE(mira016_supplies) - 1 and iterates down to 0,
disabling regulators that were never successfully enabled. This can cause
reference count underflows in the regulator core or accidentally unpower
shared regulators.

[ ... ]
> +static void mira016_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +
> +	v4l2_async_unregister_subdev(sd);

[Severity: High]
Could freeing the control handler before unregistering the subdevice lead to
a use-after-free?

This ordering leaves a race window where the subdevice remains accessible to
userspace while its control handler and associated mutex have already been
destroyed. If concurrent ioctls (such as VIDIOC_S_CTRL) occur during driver
unbind, the V4L2 core might attempt to lock the destroyed mutex and access
freed memory.

> +	v4l2_subdev_cleanup(&mira016->sd);
> +	media_entity_cleanup(&sd->entity);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-mira016-v6=
-0-177ecfd6d357@ideasonboard.com?part=3D2

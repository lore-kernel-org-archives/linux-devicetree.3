Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E03921C6
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976802; cv=none; b=HOxBufA7Y3Uurf4ynAwsAMu8e0j8TCLfF0eTb4i5J1zHON43kst2MERZ0YVKD/aSdpATUHNHKoDFTVolFkheESv1JJ4YxSYOR9sUalocfAC+aZaWfTjwu8vi8BF1GtbtvMs6CCHroXeD5o3SuvgWUcKCvYD0nNuiR/z45NKpqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976802; c=relaxed/simple;
	bh=Gb/c4t7QF9QkmzIh6GwcR/d33OMUnxNBxN+I7+8XwFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MPMXLARWDShhlcmp98mgR6NfwzO5tboB90wTiiGu0vk0vA2ZDmf9ap3WjBCxLhlxEUgkVT1lxJxyfy8FnIXHKrouWwW+VnrGK7sU5HWRtpem4iX8xjFYKWlUAFsP9s4JPgI8/C1DTca98jvklW2qcpLGKsqlLvspDnkEgrJ0maU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TN7zUHWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TN7zUHWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BF71F000FF;
	Wed,  9 Sep 2026 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788976801;
	bh=iTarC5nn06l6wZr09nuP18ND0COo7EAilgusNPQmmgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TN7zUHWmDc4RN9v1qMPYWuSh26OWNklVdvC6U/YhFEpVWHdBi3BQSy+r4asP/eMeM
	 8wDw46b7dQQh6a2NGfcKouvZ5Q/x/NETLnxf8ESQbze7Vd16tWrkOTgW8KLpSM3yWQ
	 nth06gn4BUBIHKD/uprLmKu15khjorrq6qhvbu8EN/Qh9wdQXriCjfRzcndUqwMISy
	 l9Ay8kFWz0ed40/n7cF13oQy9Qir9PAtljsZQS9YIbGhnKJk40ktej5uXkjOIhekjk
	 JVaOVCFBifoNgRShJ2aKaMqw0KecASHh0I0F1BBzBJm/pHAQplQ72tA2zbq8GiYbIE
	 s9KX1alzxUuYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909174240.80023-3-lsa.uz@pm.me>
References: <20260909174240.80023-1-lsa.uz@pm.me>
 <20260909174240.80023-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 17:59:59 +0000
Message-Id: <20260909180000.A8BF71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Ignoring devm_regulator_bulk_get() return value causes NULL pointe=
r dereference and Use-After-Free during regulator_bulk_enable().
- [High] Potential NULL pointer dereference in imx681_set_pad_format() when=
 state is NULL.
- [High] Incorrect check of pm_runtime_get_if_active() return value leads t=
o hardware access while suspended and reference count underflow.
- [High] Unclustered controls V4L2_CID_ANALOGUE_GAIN and V4L2_CID_DIGITAL_G=
AIN clash over the same hardware register.
- [Medium] Missing pm_runtime_put_noidle() on the probe error path leads to=
 a PM usage counter leak.
--

commit def0570ed5235b7103f00a2f2f7f233dec35fdd6
Author: Andre Gilerson <andre.gilerson@gmail.com>
Subject: media: i2c: Add Sony IMX681 sensor driver

This commit adds support for the Sony IMX681 sensor, used in the
Microsoft Surface Pro 11 for Business. It implements standard V4L2
subdev APIs, CCI register access, runtime PM, and streams support based
on register sequences recovered from I2C traces.

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000000..78c8da89c6323
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
> @@ -0,0 +1,900 @@
[ ... ]
> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/* Only apply controls to hardware when streaming */
> +	if (!pm_runtime_get_if_active(imx681->dev))
> +		return 0;

[Severity: High]
Does this incorrectly treat negative error codes from
pm_runtime_get_if_active() as a success condition?

pm_runtime_get_if_active() returns a negative error code (like -EINVAL) when
Runtime PM is disabled. Because negative values are non-zero, this check
evaluates to false and execution proceeds to access the hardware, which cou=
ld
be powered off.

[ ... ]
> +	case V4L2_CID_ANALOGUE_GAIN: {
[ ... ]
> +		cci_write(imx681->cci, IMX681_REG_ANALOG_GAIN, ana_code,
> +			  &ret);
> +		cci_write(imx681->cci, IMX681_REG_DIGITAL_GAIN, dig_reg,
> +			  &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
> +		dev_dbg(imx681->dev, "set gain code %d: analog=3D%d digital=3D0x%x, re=
t=3D%d\n",
> +			ctrl->val, ana_code, dig_reg, ret);
> +		break;
> +	}
> +
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_DIGITAL_GAIN, ctrl->val,
> +			  &ret);

[Severity: High]
Will this independent digital gain control blindly overwrite the compensato=
ry
value computed in the V4L2_CID_ANALOGUE_GAIN handler?

Since these controls are unclustered, the framework applies them individual=
ly
in ID order when streaming starts. The digital component computed and writt=
en
by ANALOGUE_GAIN to IMX681_REG_DIGITAL_GAIN could be overwritten here, losi=
ng
the intended high-gain configuration.

> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
> +		dev_dbg(imx681->dev, "set digital gain: %d, ret=3D%d\n",
> +			ctrl->val, ret);
> +		break;
[ ... ]
> +	}
> +
> +	pm_runtime_put(imx681->dev);
> +	return ret;
> +}

[Severity: High]
If pm_runtime_get_if_active() failed and returned a negative error code, the
usage counter was never incremented. Does this unconditional pm_runtime_put=
()
call corrupt the usage counter by causing an underflow?

[ ... ]
> +static int imx681_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct v4l2_mbus_framefmt *format;
[ ... ]
> +	fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
> +
> +	format =3D v4l2_subdev_state_get_format(state, fmt->pad);
> +	*format =3D fmt->format;

[Severity: High]
Is it possible for state to be NULL here, leading to a NULL pointer derefer=
ence
when v4l2_subdev_state_get_format() returns NULL?

For subdevices without the V4L2_SUBDEV_FL_STREAMS flag, the media framework=
's
check_state() wrapper does not enforce that state is non-NULL for active
formats. If a bridge driver directly calls v4l2_subdev_call() and passes a =
NULL
active state, this will oops.

[ ... ]
> +static int imx681_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct imx681 *imx681 =3D to_imx681(sd);
> +	int ret;
> +
> +	dev_dbg(imx681->dev, "power on\n");
> +
> +	ret =3D regulator_bulk_enable(IMX681_NUM_SUPPLIES, imx681->supplies);

[Severity: High]
Can this cause a crash in the regulator core if regulators were unavailable
during probe?

In imx681_probe(), the driver explicitly ignores failures from
devm_regulator_bulk_get() to support ACPI setups. However, when that fails,=
 the
regulator core's error path leaves the imx681->supplies array populated with
NULL pointers or dangling pointers for partially acquired regulators. Calli=
ng
regulator_bulk_enable() on that invalid array dereferences them.

[ ... ]
> +static int imx681_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_regulator_bulk_get(imx681->dev, IMX681_NUM_SUPPLIES,
> +				      imx681->supplies);
> +	if (ret) {
> +		dev_dbg(imx681->dev,
> +			"regulators not available (expected on ACPI): %d\n",
> +			ret);
> +		/* Continue without regulators - INT3472 may handle power */
> +	}

[Severity: High]
Since failures here are expected and ignored, does the imx681->supplies arr=
ay
need to be cleared to avoid the crash in imx681_power_on() mentioned above?

[ ... ]
> +	/* Enable runtime PM */
> +	pm_runtime_set_active(imx681->dev);
> +	pm_runtime_get_noresume(imx681->dev);
> +	pm_runtime_enable(imx681->dev);
> +	pm_runtime_set_autosuspend_delay(imx681->dev, 1000);
> +	pm_runtime_use_autosuspend(imx681->dev);
> +
> +	/* Init V4L2 controls */
> +	ret =3D imx681_init_controls(imx681);
> +	if (ret)
> +		goto error_pm;
[ ... ]
> +error_pm:
> +	pm_runtime_disable(imx681->dev);
> +	pm_runtime_set_suspended(imx681->dev);

[Severity: Medium]
Will this error path leak the runtime PM usage counter?

The probe function increments the usage counter via pm_runtime_get_noresume=
(),
but this cleanup path does not decrement it with pm_runtime_put_noidle().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909174240.8002=
3-1-lsa.uz@pm.me?part=3D2

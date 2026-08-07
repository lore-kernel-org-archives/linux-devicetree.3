Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C2472F9A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108368; cv=none; b=Ucg4LF/NqYbZcJtJC8i9uY84HmvuzhA3ZZhABrZJ99YOafABes5efu5vyoz4oeGz9q2Z1rmd81hN7cbu34Y5on3SuUx6XraCUvfYVa6pwcCEhMVUK0l+utmodEa/Dxfp4CgQM/+F1z2VRixIZA9j9P0hduycSGtf0dNkFJA4jJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108368; c=relaxed/simple;
	bh=ZWntpuWThXR9YTo0L1JW5hVpBchEz6XC1YaB3gLb8sY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TWrDXR4Al9STcFreB16hUvJ1ZzaCv+/dW9fehJ3bzHAhb3D7OrU9O2lwXR+Wc3Xlh+gyX6E/NfjW2lzjR3PN6D1jcSHT9LLjQKM5ANpJbyRPR9L8PqqvOVwuKcskHq3Buho/YnGLSdzvJ0Elc0pzyXF/dFtvdR++LU2DDzUZQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lfv4H4hE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lfv4H4hE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2016B1F000E9;
	Fri,  7 Aug 2026 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108359;
	bh=yviDwoGBpRoP7WX7rN/W7Ie19clTndRaZwobDomWMRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lfv4H4hEl7ZmxNjzF4KIAJaZP7OCG7WFxH93IVE6B+wfHP1T2qIaurD69NWCmw+n3
	 wUvELhqJ1llr7K4ZtYF5dYBbNOojWWXP2kd6It+S21lK80R1mBjd/nMqkitZbN3nON
	 SSlt4FIKWWLxzPllb9xBZJIy8iFZ8Oqk4cZ7ZiT9jvOHckSzs/HehoAUQ2+nTI/viG
	 DrDc2n3UlqIeNsoAQwuQmeaVVRCGcV+sg0YzJecvsuWbwWJwHchYslryoQfx0xwlQm
	 guIkxcPSTve5S054PXZIHAgCdclfYW9HAUUuqtiFrMuld0a1rv75XO071bpsjcnM7g
	 KVFD1LX8n2Ilw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] media: i2c: Add a driver for Sony IMX708
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260807-imx708-v2-3-7d3d7b57779d@ideasonboard.com>
References: <20260807-imx708-v2-0-7d3d7b57779d@ideasonboard.com>
 <20260807-imx708-v2-3-7d3d7b57779d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:12:38 +0000
Message-Id: <20260807131239.2016B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect hardware power-off sequence: clock disabled after regula=
tors.
- [Medium] Incorrect Runtime PM initialization ordering in `imx708_probe()`=
 bypasses autosuspend.
- [Medium] Loss of precision in frame length calculation allows exposure to=
 exceed physical hardware limits.
- [Medium] Missing system sleep PM operations causes a power leak during sy=
stem suspend.
- [Medium] Lockless data race on V4L2 control values during TRY format enum=
eration.
--

--- Patch [3]: [PATCH v2 3/3] media: i2c: Add a driver for Sony IMX708 ---
commit 0f39548715745ff8d2825112d41ad4cfb31c5791
Author: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: media: i2c: Add a driver for Sony IMX708

This commit adds a V4L2 subdevice driver for the Sony IMX708 11.9 Megapixel
CMOS sensor. It supports capturing the full active area up to 14.35fps
with features including MIPI RAW10 output, analog gain, and VBLANK control.

> diff --git a/drivers/media/i2c/imx708.c b/drivers/media/i2c/imx708.c
> new file mode 100644
> index 0000000000000..7d5b8bdc2b437
> --- /dev/null
> +++ b/drivers/media/i2c/imx708.c
[ ... ]
> +static u32 imx708_get_format_code(struct imx708 *imx708)
> +{
> +	unsigned int i;
> +
> +	i =3D (imx708->vflip->val ? 2 : 0) |
> +	    (imx708->hflip->val ? 1 : 0);

[Severity: Medium]
Could this result in a data race during format enumeration? When userspace
calls VIDIOC_SUBDEV_ENUM_MBUS_CODE with V4L2_SUBDEV_FORMAT_TRY, the V4L2
core acquires the TRY state lock, which is independent of the control
handler lock. If another thread modifies the flip controls via VIDIOC_S_CTRL
concurrently, it could cause an inconsistent read of vflip->val and
hflip->val in imx708_get_format_code(), leading to incorrect format
enumeration results.

[ ... ]
> +static int imx708_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	case V4L2_CID_VBLANK:
> +		ret =3D imx708_set_frame_length(imx708,
> +					      imx708_active_area.height +
> +					      ctrl->val);
> +		fallthrough; /* update exposure with new long_exp_shift */
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(imx708->cci, CCS_R_COARSE_INTEGRATION_TIME,
> +			  imx708->exposure->val >> imx708->long_exp_shift,
> +			  &ret);
> +		break;

[Severity: Medium]
Will this precision loss allow the programmed exposure time to exceed
physical hardware limits? If VBLANK is set such that the active area plus
the blanking exceeds 65535, long_exp_shift becomes greater than 0. If
long_exp_shift is 7, and the frame length modulo 128 is 48 or greater,
integer division truncates the shifted exposure value so it exactly equals
the shifted frame length in imx708_set_ctrl(). This leaves a 0-line blanking
margin instead of the required 48 lines, which could cause sensor
malfunction or I2C errors.

[ ... ]
> +static int imx708_power_off(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct imx708 *imx708 =3D to_imx708(sd);
> +
> +	gpiod_set_value_cansleep(imx708->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(imx708_supply_name),
> +			       imx708->supplies);
> +	clk_disable_unprepare(imx708->inclk);

[Severity: High]
Does this disable the regulators before the clock? Calling
regulator_bulk_disable() while the external clock is still running can
backpower the unpowered sensor IC through the clock pin's ESD protection
diodes. This backwards sequencing in imx708_power_off() might cause
latch-up, excessive current draw, or physical damage to the hardware.

[ ... ]
> +static int imx708_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D v4l2_async_register_subdev_sensor(&imx708->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to register sensor sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_idle(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 5000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	return 0;

[Severity: Medium]
Might this bypass the autosuspend delay? By calling pm_runtime_idle() before
pm_runtime_use_autosuspend() is enabled in imx708_probe(), the PM core sees
a 0 usage count and immediately invokes the synchronous suspend callback.
This causes the sensor to be powered off immediately during probe instead of
remaining active for the intended 5000ms delay.

[ ... ]
> +static const struct dev_pm_ops imx708_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(imx708_power_off, imx708_power_on, NULL)
> +};

[Severity: Medium]
Is it intentional to omit the system sleep operations here? Since the PM
operations structure only sets SET_RUNTIME_PM_OPS, the PM core will not
force the device to suspend during system sleep. If the host system suspends
while the camera is active, the sensor regulators and clocks will remain
fully powered on, causing a power leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-imx708-v2-=
0-7d3d7b57779d@ideasonboard.com?part=3D3

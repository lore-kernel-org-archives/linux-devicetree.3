Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82211B4156
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119935; cv=none; b=Gntkl/uYXWc1TOWXDjsoJbWmSI/BkPsMeif8azZ2/miQ8nhWFWA2ySyO95LsOVBnt5ojm/oage4JySFkbkECAnC/y47iCWXXZ5teei/Jb3pNqJe89wk0dXkAjtCig3WMdYuvaq5VDZ2C01s1zYbd4HibHxme2qAxeesEmdal15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119935; c=relaxed/simple;
	bh=SQfGHRpwfFtyo90fbgO9DOG5XaPR7DxpriLos2yuhtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AGDHzTMVX+xvSn2StDul3k0qxQpxGNj26yTxiKcaG+PU5HrprGb1kjsNdXx/0613xPlvFBc+Z86fXd2iDvOoiSCq2EzFgWzJCHQ0iJOnGmyuoF8Gg/EZzkQhGoh8EDV7JWlPtsYH8Jn+Sul/iuwwaopLCDwms+FZrwRwwHVsLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhJUw0fO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhJUw0fO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D8C1F000E9;
	Mon, 27 Jul 2026 02:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785119933;
	bh=ho0SngGK7LquA0E6PRtd/1O7cZd3DkAXr3puRQlqSZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VhJUw0fOMEwn4VDVsMn0upYd2+tM3tDkFdmIgF7R1TwgYMaxueOn4I+xCsT502TjW
	 d6ppAIzJKW9c5tLdtM/qrA3T9pWivzJ2nyB1sq0HyaqPSiiB2ixFLX/SxuD2iE1Lg3
	 YEbrkVUokC587b+Uk0HA+pGn0LqEWMT0hQ7FFjZmx8DnvlkOuTgtBKXcgijb8jWk0Z
	 DHx13pkvymO+eIHNWWkdfZJ+bqKYCVKv5lAmTnIfk2oXl4SfhXtiOytQNwif7zDUFc
	 lmpeVsbLvGjrBKKQlVpopuf1ahx1d08EDzmp9B6CAamCUhnT9HY0nYTAdGA8yoFBwR
	 J0LpIbk3FGRzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-upstream-it6625-it6626-v8-2-2c3b0f9524fc@ite.com.tw>
References: <20260727-upstream-it6625-it6626-v8-0-2c3b0f9524fc@ite.com.tw>
 <20260727-upstream-it6625-it6626-v8-2-2c3b0f9524fc@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 02:38:52 +0000
Message-Id: <20260727023853.25D8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unconditional return of IRQ_HANDLED in the threaded IRQ handler le=
ads to an IRQ storm if the I2C read fails or the interrupt is spurious.
- [High] The `fps_from_bt_timings()` function computes the denominator as `=
V4L2_DV_BT_FRAME_HEIGHT(t) * V4L2_DV_BT_FRAME_WIDTH(t)` using 32-bit unsign=
ed arithmetic. Malicious or manipulated timing parameters can cause this pr=
oduct to exactly equal `2^32`, wrapping around to `0` and causing a kernel =
panic via division-by-zero.
- [Medium] it6625_initial_setup() races with userspace CEC transmissions be=
cause it is called after adapter registration and lacks locking.
--

--- Patch [2]: [PATCH v8 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit 053fb4f690d4c8eec60373a939622584d5a96c81
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: add driver for ITE IT6625/IT6626

Adds a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-MIPI CSI-2
bridge chips. The bridge is configured over I2C, exposes an HDMI CEC adapte=
r,
and supports EDID and video timings configuration.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> new file mode 100644
> index 0000000000000..fd1d0c85e4f3a
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
[ ... ]
> +static inline unsigned int fps_from_bt_timings(const struct v4l2_bt_timi=
ngs *t)
> +{
> +	if (!V4L2_DV_BT_FRAME_HEIGHT(t) || !V4L2_DV_BT_FRAME_WIDTH(t))
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST((unsigned int)t->pixelclock,
> +				 V4L2_DV_BT_FRAME_HEIGHT(t) *
> +				 V4L2_DV_BT_FRAME_WIDTH(t));

[Severity: High]
Can the denominator calculation overflow and cause a divide-by-zero panic?

The width and height fields are 32-bit unsigned integers. If manipulated
timing parameters or malicious HDMI signals provide large blanking intervals
such that width is 65536 and height is 65536, the check for zero passes.

However, the 32-bit product (65536 * 65536) overflows to exactly 0, which is
then passed as the divisor to the DIV_ROUND_CLOSEST macro.

> +}
[ ... ]
> +static irqreturn_t it6625_irq_handler(int unused, void *data)
> +{
> +	struct it6625 *it6625 =3D data;
> +
> +	it6625_interrupt_handler(it6625);
> +	return IRQ_HANDLED;

[Severity: High]
Could this lead to an interrupt storm if the I2C read fails or the interrupt
is spurious?

If it6625_read_byte() fails and returns a negative value in
it6625_interrupt_handler(), it returns early without clearing the hardware
interrupt source:

static int it6625_interrupt_handler(struct it6625 *it6625)
{
	...
	val =3D it6625_read_byte(it6625, REG_MCU_INTERRUPT);
	if (val <=3D 0)
		return 0;

Since it6625_irq_handler() unconditionally returns IRQ_HANDLED, the kernel's
spurious IRQ detector is bypassed. If the IRQ line remains asserted due to
the early return, this might cause an infinite loop and soft-lockup.

> +}
[ ... ]
> +static int it6625_probe(struct i2c_client *client)
> +{
[ ... ]
> +	err =3D cec_register_adapter(it6625->cec_adap, &client->dev);
> +	if (err < 0) {
> +		dev_err(it6625->dev, "%s: failed to register the cec device", __func__=
);
> +		cec_delete_adapter(it6625->cec_adap);
> +		it6625->cec_adap =3D NULL;
> +		goto err_clean_hdl;
> +	}
> +
> +	it6625_debugfs_init(it6625, client);
> +
> +	it6625_initial_setup(it6625);

[Severity: Medium]
Is there a race condition between it6625_initial_setup() and userspace CEC
transmissions?

By calling cec_register_adapter() before it6625_initial_setup(), the CEC
device node becomes accessible to userspace. A process or udev rule could
immediately open the node and issue a transmission, which sets
B_CEC_SEND_DATA in REG_HOST_CTRL_INT.

Concurrently, it6625_initial_setup() modifies REG_HOST_CTRL_INT without
holding it6625_lock and waits for it to become 0x00. If both bits are set,
the wait might stall waiting for the long CEC transmission to finish, causi=
ng
a timeout.

> +	it6625_v4l2_sd_ctrl_update(sd);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-upstream-i=
t6625-it6626-v8-0-2c3b0f9524fc@ite.com.tw?part=3D2

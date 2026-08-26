Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358583AD526
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729487; cv=none; b=rr2j7uREzzxs8hMWHnh6Ps9HkBvGoJfVFuQ/QH2LN8OMlSAl4EIFsxHtDid0DAQ5hSah4xKdIx6AXPUgbDN2mH7ZS9kxabsSrj+pQ9m/DufD4q2kFpsqcg/VQ7m98VCTNL1jQ8CNl8DhMWZf7Cquno+Xt+ImCqF63ByeOgwOwtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729487; c=relaxed/simple;
	bh=kYT8eYzeSHMZzrBWqZsq7zrmBv2ytOGRsTbU5lB3xQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z9YC8SxoKy9iC+9JL472DpaQqf26mSorv85QEmNBq6yfne0Bw65/ZcAXvC+oepw8/K3sNo59F9G12DlIFZzyp0GC0nllPItrI/gHsjCeQJqFM1GGQbCC0KXd9M1TkVocg1N9eTgrvgTrCh4FUIOJcSlZ5dNuKEQplFr7jFtJIl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDzDb63Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDzDb63Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B942D1F000E9;
	Wed, 26 Aug 2026 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787729484;
	bh=yGQhi7B3EaXW61g0nxZIk02cX+WNvsjxMDXQIn4C+dQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDzDb63QG9XHdmJGPhutafZ+y23H9uYJaNxPm1ne+uVL2c5JWFztIl6/BK412nbc7
	 422zMkTQM29EJ6LeKhTGdjUIWUj5IFPTbgdRwgdWNq7qKYG+GsEMq2rqKDHx+//qph
	 R9qQ7jk86za8/OnSqKVIyjGawoAD8Z36pqVzGIVUu+0/4VaSDBKAdr6jOEoKtnw3gT
	 vjzURqPWE1023gojR0HnI9ddgKqSsNgZkz3258Szy2sBmthksrhtEMEpzOvR3w6bQj
	 TSvtmV8Qv7tEAWAwIxrXdGiHIf/1gsFtjRtbr6dmNwgZS2teRqqodRCYN6gfHYhCra
	 /rz7VzZi7lBjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: i2c: Add driver for OmniVision OV32C4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Bozik" <robertbozik@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260826072002.14357-3-robertbozik@gmail.com>
References: <20260826072002.14357-1-robertbozik@gmail.com>
 <20260826072002.14357-3-robertbozik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 07:31:23 +0000
Message-Id: <20260826073123.B942D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect use of pm_sleep_ptr() for the dev_pm_ops structure poi=
nter disables runtime PM when CONFIG_PM_SLEEP is disabled.
- [Medium] Memory leak of V4L2 control handler resources on the probe error=
 path if ov32c4_init_controls() fails.
--

commit 86444baf0012dbc98352979b151e14a3e84e5a51
Author: Robert Bozik <robertbozik@gmail.com>
Subject: media: i2c: Add driver for OmniVision OV32C4

This commit adds a new V4L2 I2C sensor driver for the OmniVision OV32C4
camera. It configures the sensor for a 3264x1840 at 30 fps mode and includes
controls for exposure, gain, blanking, along with runtime PM support.

> diff --git a/drivers/media/i2c/ov32c4.c b/drivers/media/i2c/ov32c4.c
> new file mode 100644
> index 0000000000000..4039aa85cf5e8
> --- /dev/null
> +++ b/drivers/media/i2c/ov32c4.c
[ ... ]
> +static int ov32c4_init_controls(struct ov32c4 *ov32c4)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr =3D &ov32c4->ctrl_handler;
[ ... ]
> +	ret =3D v4l2_fwnode_device_parse(ov32c4->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov32c4_ctrl_ops, &props);
> +
> +	if (ctrl_hdlr->error)
> +		return ctrl_hdlr->error;
> +
> +	ov32c4->sd.ctrl_handler =3D ctrl_hdlr;
> +
> +	return 0;
> +}
[ ... ]
> +static int ov32c4_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D ov32c4_init_controls(ov32c4);
> +	if (ret) {
> +		dev_err_probe(ov32c4->dev, ret, "failed to init controls\n");
> +		goto probe_error_v4l2_ctrl_handler_free;
> +	}
[ ... ]
> +probe_error_v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(ov32c4->sd.ctrl_handler);

[Severity: Medium]
If ov32c4_init_controls() fails (e.g. because v4l2_fwnode_device_parse()
fails or ctrl_hdlr->error is set), it returns early without assigning
ov32c4->sd.ctrl_handler =3D ctrl_hdlr.

Since the pointer remains NULL, does the probe cleanup path leak the
allocated V4L2 controls when it calls v4l2_ctrl_handler_free(NULL)? Should
this explicitly free the embedded &ov32c4->ctrl_handler instead?

[ ... ]
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov32c4_pm_ops, ov32c4_power_off,
> +				 ov32c4_power_on, NULL);
[ ... ]
> +static struct i2c_driver ov32c4_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "ov32c4",
> +		.pm =3D pm_sleep_ptr(&ov32c4_pm_ops),

[Severity: Medium]
Is pm_sleep_ptr() the correct wrapper for &ov32c4_pm_ops here?

The ov32c4_pm_ops structure is defined using DEFINE_RUNTIME_DEV_PM_OPS()
which relies on CONFIG_PM. By wrapping it with pm_sleep_ptr(), the entire
dev_pm_ops structure pointer evaluates to NULL when CONFIG_PM_SLEEP is
disabled, even if CONFIG_PM is enabled.

Does this unintentionally disable runtime PM callbacks in configurations
without sleep support? Should this use pm_ptr() instead?

> +		.acpi_match_table =3D ACPI_PTR(ov32c4_acpi_ids),
> +		.of_match_table =3D ov32c4_of_match,
> +	},
> +	.probe =3D ov32c4_probe,
> +	.remove =3D ov32c4_remove,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826072002.1435=
7-1-robertbozik@gmail.com?part=3D2

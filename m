Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A4B3191D3
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982271; cv=none; b=mhhqsgCzBIy8+CdAlHdtAY4k50d/LzwBTxhP8aw23GI89vEAkzhd3bSDIL0jOeg7eqEeBDalk5eAtcLTdOjAn/igSlqbpRXftQP4bmd+nmxlgcvgMYYJUGJ/imdStgpExFC/1KPBqLwfa6vW0Zgbniol9V4f2X78z3EGuF0pQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982271; c=relaxed/simple;
	bh=Heq1/00NQno93pD99OyqE/AYFyKlu++ZBsOcqGcMRAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M6Kr/BFEComsuFPn1Xb4aWZoex+Xw+UjcMu6FKx/efejUHXJAVoeMHTa57t0DlP13vBLK2LlFtE19mkl5j9ACTvOCcqpX4UUny59ZtrlIBsaZIiR+vEe7BMcuN7pfXGDlSYXDYGOifg1KV5ZbLGLJ4zItOtjre1mkVZwlWbFbQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYeNMxaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYeNMxaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC1D1F00A3E;
	Sat, 29 Aug 2026 05:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787982270;
	bh=XsNBXApXxfU9GQH1DBBmg2t4ZTKeOkCLCLblGcfyPbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYeNMxaZb0ud+nmECjfL+XnGSQFy2LCHzFoxW2ANcBewJ+fEunlLK2mUTlw4oYCQO
	 OKHvM/9CvfR0bEXFUXzkdk7T/AAyx77sW8RUy+Eb/N0/aQdNYoteZ37SpIl77EB58w
	 QMANve5Y1JTCG/oqZWin0cX8FDaYZaJQUS+DH+N+wuIVuInkctzNcSgWA4N8RcoaC1
	 SwdQ1VrQ0JsCsvoLl+U3y9QzgKVpxzMekuWc9L/WE0wRRS1RHq9JUHibElFXKowGyh
	 VHu+YWUYH5GkwSFH/6vE/2rWRQSXuMlY4Lot1VqSi4q3xdord2SzhLzOZIC0hqv83h
	 dGiWU0k672WtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ak7375: Add support for the AK7377
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Michael Brummer" <jan.brummer@tabos.org>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260829052514.18178-3-jan.brummer@tabos.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
 <20260829052514.18178-3-jan.brummer@tabos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 05:44:29 +0000
Message-Id: <20260829054429.EAC1D1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The V4L2 control handler `ak7375_set_ctrl()` performs I2C writes w=
ithout checking the PM runtime state, predictably failing when the device i=
s idle.
- [High] Potential NULL pointer dereference in `ak7375_probe()` if the devi=
ce is instantiated without matching firmware data.
--

commit 26c53b3777209184aea3eb12bf84bb8a8e00a5f8
Author: Jan-Michael Brummer <jan.brummer@tabos.org>

media: i2c: ak7375: Add support for the AK7377
   =20
This commit adds support for the AK7377 focus actuator by defining its
register layout and adding it to the compatible table. The AK7377 drives
the focus of the main camera on the Fairphone 5.

> diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
> --- a/drivers/media/i2c/ak7375.c
> +++ b/drivers/media/i2c/ak7375.c

[ ... ]

> @@ -65,6 +65,25 @@ static const struct ak73xx_chipdef ak7375_cdef =3D {
>  	.power_delay_us	=3D 10000,
>  };
> =20
> +/*
> + * The AK7377 is register compatible with the AK7375: 12 bit position in
> + * registers 0x00/0x01, standby via 0x02.  Verified on the Fairphone 5,
> + * where it drives the focus of the IMX800 main camera.
> + */
> +static const struct ak73xx_chipdef ak7377_cdef =3D {
> +	.reg_position	=3D 0x0,
> +	.reg_cont	=3D 0x2,
> +	.shift_pos	=3D 4,	/* 12 bits position values, need to << 4 */
> +	.mode_active	=3D 0x0,
> +	.mode_standby	=3D 0x40,
> +	.has_standby	=3D true,
> +	.focus_pos_max	=3D 4095,
> +	.focus_steps	=3D 1,
> +	.ctrl_steps	=3D 64,
> +	.ctrl_delay_us	=3D 1000,
> +	.power_delay_us	=3D 10000,
> +};
> +

[Severity: High]
This isn't a bug introduced by this patch, but does the control handler
safely handle I2C writes when the device is not actively streaming?

If userspace sets the V4L2 focus control while the camera is idle,
ak7375_set_ctrl() blindly issues an I2C write without checking the PM=20
runtime state:

drivers/media/i2c/ak7375.c:ak7375_set_ctrl() {
    ...
    if (ctrl->id =3D=3D V4L2_CID_FOCUS_ABSOLUTE)
        return ak7375_i2c_write(dev_vcm, cdef->reg_position,
                                ctrl->val << cdef->shift_pos, 2);
    ...
}

Without first calling pm_runtime_get_if_in_use() or similar, won't the
unpowered VCM NACK the I2C transaction? This would return an error like
-EIO to userspace and break focus initialization before streaming begins.

[ ... ]

> @@ -331,6 +350,7 @@ static int __maybe_unused ak7375_vcm_resume(struct de=
vice *dev)
>  static const struct of_device_id ak7375_of_table[] =3D {
>  	{ .compatible =3D "asahi-kasei,ak7345", .data =3D &ak7345_cdef, },
>  	{ .compatible =3D "asahi-kasei,ak7375", .data =3D &ak7375_cdef, },
> +	{ .compatible =3D "asahi-kasei,ak7377", .data =3D &ak7377_cdef, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ak7375_of_table);

[Severity: High]
This is a pre-existing issue, but can this cause a NULL pointer dereference
if the device is instantiated without matching firmware data?

If the driver is instantiated via the I2C sysfs new_device interface or
legacy board info, there will be no corresponding OF or ACPI node. Since
the driver lacks an I2C id_table, device_get_match_data() will return NULL:

drivers/media/i2c/ak7375.c:ak7375_probe() {
    ...
    ak7375_dev->cdef =3D device_get_match_data(&client->dev);
    ...
    ret =3D ak7375_init_controls(ak7375_dev);
    ...
}

The cdef pointer is then passed into ak7375_init_controls(), which
dereferences it unconditionally:

drivers/media/i2c/ak7375.c:ak7375_init_controls() {
    ...
    dev_vcm->focus =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
            0, cdef->focus_pos_max, cdef->focus_steps, 0);
    ...
}

Should there be a NULL check after device_get_match_data() to prevent
local privileged users from triggering a panic via sysfs hotplugging?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052514.1817=
8-1-jan.brummer@tabos.org?part=3D1

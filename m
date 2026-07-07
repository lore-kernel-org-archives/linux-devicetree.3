Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACC735E936
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444549; cv=none; b=Xbgxm3pSdeUO8ItixTxLHTwK71BtBEJiWLT7n+GSKhRVX25WPCZ7+nvRKYdOpQxapPNKsLajqsn9Hs0PIqTwZwxxxHdb1hDaBFcyyhsj2qKpCIlMtgY+uHl7Cegd+qbzdPzd5yDdDrOavsL2wb9dVlhGIecgvgi7ujAMyorETp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444549; c=relaxed/simple;
	bh=2fl4jN26S3P9ihtJ+21DqhFWSMLNlxnDMXXm3OCLOXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ao4B/LW9/XEis0R2dzwr0ZJyMjVY+t3FNz+Rk6i2UU77TTZLR4PGEH8C9qFftt8+9PnuRkqXy3ibAtAswysxNBAab9MRY/nzROlFGlUBfEuHFZKJWsxDHqJjQZO4frwou0mO17gVWheMJrejk/45H1BmSEZBk12tOwl3uI8w4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DckT959T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DckT959T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B741F000E9;
	Tue,  7 Jul 2026 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444548;
	bh=II0T4Opv45I+8QEpm4mEs1dFYZXQxAjcgUZPaJAkcfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DckT959T+6++LcM8cmHJaitrotQjXQbB1A246ujjmNsVzH1HgHSj6Yu1GQ0EGcXtK
	 W6+0lstgQKZdSHOYGHvnHU7BjwOFpQInektsIyyixcFwe4/DhM/rjdYGD0bTEu7hSF
	 cj03hWWR9dtTZ8JwNnOESmkpII25YdR0GrLXaD93NTjJ9URDgigtgTMP2Q5IGcUq4s
	 Fizb/jeWqqefpHHCNBgCpWOQtKisD0A0f8DgEA5tA86W6feCmryu3hB4dvI0mFu4ag
	 Qydeamp8L39lIMkMKHM7OUKT6Yd+nsVw31EHDm3aRU3ym97HB6g5NIvY4ShnIGpaft
	 xdkyVlTNjyYVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/20] media: imx355: Set binning mode registers
 programmatically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-media-imx355-v2-7-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-7-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:15:48 +0000
Message-Id: <20260707171548.66B741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The arguments for 'length' and 'value' are swapped in the `imx355_=
write_reg()` call for `IMX355_REG_LLP`, breaking sensor streaming.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it causes a doub=
le-disable of regulators and clocks in the probe error path due to uncondit=
ional power off after PM runtime idle.
--

--- Patch [7]: [PATCH v2 07/20] media: imx355: Set binning mode registers p=
rogrammatically ---
commit 1bc86e7b2e33db0b1ab1611b670669f99ca08232
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Set binning mode registers programmatically
   =20
Compute the binning registers based on the difference between
the mode width/height vs the crop width/height.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 66e70650e666b..cfc47b5100c46 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -1018,6 +981,20 @@ static int imx355_start_streaming(struct imx355 *im=
x355)
>  	if (ret)
>  		return ret;
> =20

[Severity: High]
Are the arguments for value and length swapped in the imx355_write_reg() ca=
ll
for IMX355_REG_LLP?

Looking at the code just before this addition in imx355_start_streaming():

	/* set line length */
	ret =3D imx355_write_reg(imx355, IMX355_REG_LLP,
			       imx355->hblank->val + imx355->cur_mode->width,
			       2);

The length parameter receives the computed line length (which can be in the
thousands), while imx355_write_reg() strictly enforces a maximum length of =
4.
Will this cause imx355_start_streaming() to immediately fail with -EINVAL a=
nd
prevent the sensor from starting?

> +	binning_mode =3D ((mode->crop.width / mode->width) << 4) |
> +			(mode->crop.height / mode->height);
> +	ret =3D imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
> +			       binning_mode =3D=3D 0x11 ? 0x00 : 0x01);
> +	if (ret)
> +		return ret;
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
imx355_probe() unconditionally cause a double-disable of regulators and
clocks?

When pm_runtime_idle() is called with a usage count of 0, it can invoke
imx355_power_off() to physically power down the sensor. If
v4l2_async_register_subdev_sensor() subsequently fails, the error path
blindly calls imx355_power_off() a second time:

drivers/media/i2c/imx355.c:imx355_probe() {
    ...
error_power_off:
	imx355_power_off(imx355->dev);
    ...
}

Will this lead to an unbalanced disable, potentially causing issues if the
clocks or regulators are shared and actively used by another subsystem?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602C0367B98
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731325; cv=none; b=XZuCfI5g58x7hBoa+1nNBFIynEJOnA682eiuIN/hcbpJJ3ecsSctda7jDj53ey7ejmJx3pOziZYk6udUJXrjBp/HVCTQ4ZuoLdEkJxrk/sg9gioWtbT/Hjrly4bU+37gayk40mapl5bzCFE/d+1rSVWk1gD0h/sK4Neic8EGDm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731325; c=relaxed/simple;
	bh=C7LYnV5cPGrQ4FakMXv0vrPFgX/zSK8Y4zIEi2atbKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d0Z5qlfwj2GTyzC2UqsxiT4aCjtMVy+sLf1E4kkryKQg1KeCPgcV2wroa0cd60tKL5tdlxZEmXmx3UGebgwqJo5vBz+Q2jJeKULB9UeZn5hbrewi9BhQwg6VsGdeBTtnMsZYNJy6rTNk1MkyHdP3ZnjVGEJPSNRyha76Ua/4CCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdjCZlvE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdjCZlvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFDD1F000E9;
	Mon, 29 Jun 2026 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731324;
	bh=50RhA1Fg2aJRaYEflK7X17DI7ev1N4qsDCX9+yjHDg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PdjCZlvEYCONz/860BL4U5OtUpEOsN9sbsGjhhpipeHkgYfFPDYodfxKIpWKj2/Ke
	 ikRTsZ/Kd/9JBjlOCmOpRHwIk1eS0PEEzCq6/MPsshpoYSUApZx3/eS3RWGPcDptQF
	 2PJuEPNOn1u6BNtSeOF8Ik+IrlEYQivZZXmA+ktd6Bkp7DFGTsY4K58P4YWQtVsuiW
	 vH3CfOKirlulY59HrX/Wdqn3ue8EWETLUm0qQU1P2x2FhILUUPynKbZmj55HjgxQ2O
	 h0pSEUpOjFY6E+WV7sxQ/oUXsBwET4a2htwwUXNtCDfUyUWuRb9YIGMC7wpzECWJU8
	 Oh3lC9CA7m5iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] media: i2c: vd55g1: Add support for vd55g4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629-vd55g4_and_fixes-v2-5-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
 <20260629-vd55g4_and_fixes-v2-5-ea0a7cf3cd66@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 11:08:43 +0000
Message-Id: <20260629110843.BBFDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unchecked dereference of `device_get_match_data()` result in `vd55=
g1_detect()` leads to a NULL pointer dereference.

Pre-existing issues:
- [High] The V4L2 subdev state lock and control handler lock are mismatched=
, causing lockless execution of `__v4l2_ctrl_modify_range()`.
--

commit 6446db5fc4015fc328aed2df077a1b5dfc46a590
Author: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

media: i2c: vd55g1: Add support for vd55g4

vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
RGB. Adapt the driver structure according to this new variant, and add
its support.

> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 37d44abd1435c..c4142d771e7c8 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c

[ ... ]

> @@ -1658,38 +1693,46 @@ static int vd55g1_init_ctrls(struct vd55g1 *senso=
r)

[ ... ]

>  static int vd55g1_detect(struct vd55g1 *sensor)
>  {
> -	unsigned int dt_id =3D (uintptr_t)device_get_match_data(sensor->dev);
> -	u64 rev, id;
> -	int ret;
> +	const struct vd55g1_version *dt_version =3D
> +		device_get_match_data(sensor->dev);
> +	const struct vd55g1_version *version;
> +	u64 color, id;
> +	int ret =3D 0;
> =20
> -	ret =3D vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
> +	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
> +	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
>  	if (ret)
>  		return ret;
> =20
> -	if (id !=3D VD55G1_MODEL_ID_VD55G1 && id !=3D VD55G1_MODEL_ID_VD65G4) {
> -		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
> -			 (u32)id);
> +	version =3D vd55g1_get_version(id, color);
> +	if (!version) {
> +		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
> +			 dt_version->name);

[Severity: High]
Could dt_version be NULL here? If the device is instantiated via software
nodes or forced to bind via sysfs without matching OF compatible properties,
device_get_match_data() returns NULL.

If it returns NULL, this will cause a kernel oops when dereferencing
dt_version->name here, as well as dt_version->id and dt_version->color
below. The previous version of this code safely cast the result to an
integer instead of dereferencing it.

>  		return -ENODEV;
>  	}
> -	if (id !=3D dt_id) {
> -		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s)=
 mismatch",
> -			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
> +	if (version->id !=3D dt_version->id ||
> +	    version->color !=3D dt_version->color) {
> +		dev_err(sensor->dev, "Probed sensor version %s and device tree definit=
ion %s mismatch",
> +			version->name, dt_version->name);
>  		return -ENODEV;
>  	}

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a mismatched lock assignment
in vd55g1_subdev_init()?

It appears sensor->sd.state_lock is assigned to sensor->ctrl_handler.lock
before v4l2_ctrl_handler_init() is called, meaning the lock is still NULL:

vd55g1_subdev_init() {
    ...
    sensor->sd.state_lock =3D sensor->ctrl_handler.lock;
    ret =3D v4l2_subdev_init_finalize(&sensor->sd);
    ...
}

Since v4l2_ctrl_handler_init() allocates a different internal mutex later,
the V4L2 core allocates a separate mutex for the state. When V4L2 core
invokes vd55g1_set_pad_fmt(), it calls __v4l2_ctrl_modify_range() while
holding only the subdev state lock. Could this violate V4L2 locking
invariants and cause a data race if a concurrent user-space VIDIOC_S_CTRL
ioctl is issued?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-vd55g4_and=
_fixes-v2-0-ea0a7cf3cd66@foss.st.com?part=3D5

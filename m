Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FB6568FCE
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001487; cv=none; b=mT7DwVhxinM56wM6+ADh71Pt/ymFf1QXz8/tHpC6lb9azPz2bNVpZlFwnEJqeFfxraGDSf3zMfWdCKr8QF67JyEegqyWAoq/yBVLRqlQdKH7gUzaI4lUVoKZFf4yYVOImtQG7tZt5y/6I/juGeQt66GB6O3Y1tLq3ewZYyZ/oMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001487; c=relaxed/simple;
	bh=Jt5a8grOsBKx9q8HqPBZ85rXVrGMmzJVdNrqMXW9tdI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=by+3orjiDfQjBy2/6J/AaX8VXS6JXfotCg5RRrAb1ghxOtcBQ//eHwdsskHM3ASXEXvqzwIHDLsa9GUV46Xp1Gr+3XtED2YF4BNCzW+gSbkq3sn9tHgLQsqK/9uye7ggVnHCQMcno9qA+BhO8roj+0rHgyBSZezNrHeLvq1DOB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFc+S5uX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFc+S5uX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA691F000C4;
	Wed, 14 Oct 2026 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001482;
	bh=7G4S4XAfZ67pFcr5D+W4s0IBhJNuIDRq7h3GJbulRuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFc+S5uXhKHCgkNTTCuuALLn/+BTw91feinvjQ5ECL1AA+HGkgptGOtuOqe97pyyS
	 pZdKTHrKJ4uPKRYzybJgmqJFIaVpLrlWIn3jWqzg9cfb0FMuIBI5tfs2WaBHkZr2u9
	 G1CmghxwRgri1E275bdAPIMYZQVRFUWkreQQM9RnXKkPjsddWVONZ3HdM9IJsqSPYK
	 c0/F9hhIIubCebxKthS53HX+O+xjh0y8UykqXbzsjs6co5AmVqHUlnMCLLZfK3Af9o
	 RszL82UVqCJT2P8kCh2kVT2SbGegFNLohxxVqcuSkJDcInw3WMiJeMJ8555Mi65u+8
	 ALRsFqwHPmtLQ==
Message-ID: <sashiko-outbox-171674@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/14] media: imx678: Rework into generic Starvis 2
 sensor driver.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261014-media-starvis2-v3-1-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
 <20261014-media-starvis2-v3-1-c958362b5d06@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:11:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: UAF of active_state due to unsafe cleanup ordering in remov=
e()
- [Low] media: sony-starvis2: sensor left active after identify
--

commit baf6081a4a9848a2866e87a317711ee36642f79e
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

    media: imx678: Rework into generic Starvis 2 sensor driver.
   =20
    The register layout and programming model for multiple of the
    Sony Starvis2 sensors is identical, so prepare for supporting
    those by renaming all common parts of the driver to a starvis2_
    prefix, and renaming the driver.

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/sony-starvis2=
.c
> index 8413fd44d6575..b4733990d03a7 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/sony-starvis2.c

[ ... ]

> @@ -1078,10 +1103,10 @@ static int imx678_identify_model(struct imx678 *i=
mx678)
>  	 * This sensor's ID registers become accessible 80ms after coming out
>  	 * of STANDBY mode.
>  	 */
> -	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> -	fsleep(IMX678_MODULE_ID_DELAY);
> +	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
> +	fsleep(STARVIS2_MODULE_ID_DELAY);

[Severity: Low]
In starvis2_identify_model(), the sensor is woken from standby by writing 0=
 to
STARVIS2_REG_MODE_SELECT to read the chip ID. However, the driver never wri=
tes
STARVIS2_MODE_STANDBY (1) back to the register before returning.

While pm_runtime_idle() in probe() will normally power off the regulators
entirely, if runtime PM is disabled in the kernel (CONFIG_PM=3Dn) or the
device's power state is forced 'on' by userspace, the regulators will remain
on.

Without reverting to standby mode, the sensor could remain active indefinit=
ely
after probe, unnecessarily consuming power. Should a write to return to
standby mode be added before the function returns?

[ ... ]

> @@ -1380,45 +1407,45 @@ static int imx678_probe(struct i2c_client *client)

[ ... ]

> -static void imx678_remove(struct i2c_client *client)
> +static void starvis2_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> -	struct imx678 *imx678 =3D to_imx678(sd);
> +	struct starvis2 *starvis2 =3D to_starvis2(sd);
> =20
>  	v4l2_async_unregister_subdev(sd);
>  	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
> -	v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);
> +	v4l2_ctrl_handler_free(starvis2->sd.ctrl_handler);

[Severity: High]
Does this cleanup ordering create a race condition that could lead to a
use-after-free?

v4l2_async_unregister_subdev() unregisters the device node but does not
block currently executing ioctls on open file descriptors. Then,
v4l2_subdev_cleanup() unconditionally frees sd->active_state.

However, v4l2_ctrl_handler_free() (which synchronizes with running ioctls
by taking the handler lock) is called after v4l2_subdev_cleanup().

If a user opens the V4L2 subdevice node and concurrently calls an ioctl like
VIDIOC_S_CTRL, starvis2_set_ctrl() could dereference the freed active_state.

Should v4l2_ctrl_handler_free() be called before v4l2_subdev_cleanup() to
ensure proper synchronization and protect the active state from being freed
while ioctls are still using it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-media-star=
vis2-v3-0-c958362b5d06@raspberrypi.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCF366045
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452844; cv=none; b=jC0aGK1qJi1lQ273uHa6f8DhduxG6rNUO6g3/MmcDMHxDHR2g6FtBeHaugNIC0zXdDLwRXQO5KQta9MnDRtLMwZTzMDd5OJrXVgEcJHY+CxLknMSbaPIJdX67Oyw0VoipxHcEu2tjPGa2Bfk+mT3qCcW2RCFphogQhyRundT88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452844; c=relaxed/simple;
	bh=uP5ScxF6qCGm32Hv2mJis+/1qn/+1fpTOtvLBPtu5To=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=noUxCo6FnaVC8R52KzWN7Z6Lx5EjfUfg8Z2jrPcz5EugVRwG4wb9E/jc2CLaWaINJq85Vjl/5+I3rHNlJXv/0eWgBTxN32GqoSP0gFKI41sGU3JdXlILKbpBKXBbzn7LRNLBP/ZyRHTpFSeLRoN7sWzlKNl4J8Ei0qSlQfQLlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFOSs8HF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFOSs8HF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9423A1F00A3A;
	Tue,  7 Jul 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452842;
	bh=k/JxGSJxKb398IG82QHvNKA+B0/tSaVzOeZSmm5FfOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dFOSs8HFjsyqufJzOrimsleje/KXQ9ndGE0w8/6RStpHwqV16jNdniBXF234g/scv
	 2+RYqAgQRdZPTwDI9QIfZ/E3GET066Dg7LgdH9U13IbLsi0ZJQxXwjf3BO//dayfql
	 RaxVXJFCTEuBFyt/ZOmQhyN+VEXw7bfN+jypJSXn6Fu62EXCxVtk/9dLfTZFHRwB6+
	 t+Ooe+XahbuopVTme8YZ2OaKOMPWfzFnb0S440NCgdptALiMiBm2/2e4QS2rRNpjcM
	 zpIG8X8xUakGbmlkBA9/zBN2a04TI97vNERsZVir5sauvCb1/gUGWZMRY6t5E0tiea
	 muiolONs8SnCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/20] media: imx355: Switch to using the subdev
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-media-imx355-v2-19-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-19-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:34:00 +0000
Message-Id: <20260707193402.9423A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing state lock acquisition in imx355_set_stream() leading to l=
ockdep BUGs and data races.
--

--- Patch [19]: [PATCH v2 19/20] media: imx355: Switch to using the subdev =
state ---
commit bbaa67e1db37273f6e97e0631f0e7e19179737fd
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Switch to using the subdev state

The commit transitions the imx355 driver to use the v4l2 subdev state for
handling crop and format instead of maintaining its own state variables, and
removes the driver-specific mutex.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 10b9cf56e8c56..bb620ebb074f7 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -958,12 +893,10 @@ static int imx355_set_stream(struct v4l2_subdev *sd=
, int enable)
>  	struct imx355 *imx355 =3D to_imx355(sd);
>  	int ret =3D 0;
> =20
> -	mutex_lock(&imx355->mutex);
> -
>  	if (enable) {
>  		ret =3D pm_runtime_resume_and_get(imx355->dev);
>  		if (ret < 0)
> -			goto err_unlock;
> +			return ret;
> =20
>  		/*
>  		 * Apply default & customized values

[Severity: High]
Does this leave imx355_set_stream() entirely lockless?

This function calls imx355_start_streaming(), which calls
v4l2_subdev_get_locked_active_state() to get the subdev state. That function
asserts that the state lock is held.

Without holding the state lock here, won't lockdep unconditionally trigger
BUG splats when calling v4l2_subdev_get_locked_active_state() and later
when calling __v4l2_ctrl_grab() in this function?

Also, without the lock, couldn't these reads race against concurrent
VIDIOC_SUBDEV_S_FMT and VIDIOC_S_CTRL ioctls?

> @@ -981,14 +914,10 @@ static int imx355_set_stream(struct v4l2_subdev *sd=
, int enable)
>  	__v4l2_ctrl_grab(imx355->vflip, enable);
>  	__v4l2_ctrl_grab(imx355->hflip, enable);
> =20
> -	mutex_unlock(&imx355->mutex);
> -
>  	return ret;
> =20
>  err_rpm_put:
>  	pm_runtime_put_autosuspend(imx355->dev);
> -err_unlock:
> -	mutex_unlock(&imx355->mutex);
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D19

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3AB577E56
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177503; cv=none; b=C9EaWHvW86f/FGmDeTqjqE2RLLe0c58dC50WahkBuY8rcLvgmd0KfVf73oMutrBTgDpHfD8RV+lAUzQPcby1eacmAcKmqyYlnMcOp3sJJ2eKxVCS6RJNSJCelAlIipOjfFN0e1n0bgQkR13oUCNBFfmDwGdgUEjXhGu1C/YpxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177503; c=relaxed/simple;
	bh=EIYWhK0wVRsFaOfR0R7jdOMIoYNlnmEdp5Y/9QAKa/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m/c8UP8GCiHtkwz7PluO1RdcyXyJUgDmn4zUW0oE54ht+aKs8rdaJueqASuXcU+cXVvXZib0NQQVnmVVXVGEhSzbkwaYRy+jkY4PQlS+mmL/s2xjgeIkQ6WumF65K/wNVRTq6eFDgm/hmWWAmuS4V+6CXt/FRF5HTFFhQiQyaTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMk5c3GL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMk5c3GL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0451F00899;
	Wed, 23 Sep 2026 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790177493;
	bh=+LUs7u+N94At2FfZ46011LEuhmJ3nY7hXTFUxN6NMjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OMk5c3GL1I/rj617uAxfAM3oslPSY1ZvDbZtKroP/NMHGKk56YGVPkv3B3yOsOWQr
	 468b7Ptpp20UFX6fPedoJcDPuo+eDIwqrxjOzlzFZDu3pzPIldDOjnBFLgjLfA5+uY
	 PhBufab6AkaldzR460coaqdNcLNTaiuaZMXE9F5R//Z6YMlfxjtA3rhNRtTk7U5SMp
	 EDVwmKVfY5zcvf2StQu3DTcXjPAWuS244dCiFhQPqqM4GkIxGaoCDaNBozKO6gRk9O
	 eZb9cWpRb0MJklSFekKXnc8IZefIOlcyRryYwyzTNpjT1h9actwUU+ikdwqBoydcqG
	 g6La9xARzSZdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260923-upstream-s5k3t2-v2-2-04ffda3350c1@proton.me>
References: <20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me>
 <20260923-upstream-s5k3t2-v2-2-04ffda3350c1@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 15:31:33 +0000
Message-Id: <20260923153133.8D0451F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: i2c: s5k3t2: V4L2 controls are silently ignored when CONFIG=
_PM=3Dn
- [Medium] media: i2c: s5k3t2: unchecked dereference of v4l2_subdev_state_g=
et_format()
--

commit 0ff25daea454ea586f399f585c1432a8ce3f431a
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

media: i2c: Add Samsung S5K3T2 image sensor driver

This commit adds a V4L2 driver for the Samsung S5K3T2 20 Mpixel CMOS
image sensor, supporting three modes up to 5184x3880.

> diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c
> new file mode 100644
> index 0000000000000..de24a6b9dacae
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3t2.c
[ ... ]
> +static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k3t2 *s5k3t2 =3D container_of(ctrl->handler, struct s5k3t2,
> +					     ctrl_handler);
[ ... ]
> +	}
> +
> +	if (pm_runtime_get_if_active(s5k3t2->dev) <=3D 0)
> +		return 0;

[Severity: High]
When the kernel is built with CONFIG_PM disabled, pm_runtime_get_if_active()
returns -EINVAL. Could this condition evaluate to true for that -EINVAL
return, incorrectly treating it as a suspended state?

If so, this would cause the function to return 0 without writing any values
to the hardware registers, silently ignoring all V4L2 control updates like
exposure and gain permanently.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
[ ... ]
> +static int s5k3t2_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_format *fmt)
> +{
[ ... ]
> +	if (s5k3t2->sd.ctrl_handler->error)
> +		return s5k3t2->sd.ctrl_handler->error;
> +
> +set_format:
> +	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;

[Severity: Medium]
Can v4l2_subdev_state_get_format() return NULL here and lead to an unchecked
pointer dereference?

While the check_format() guard normally executes for standard ioctls,
s5k3t2_init_state() acts as a direct caller that bypasses the check_state()
core validation wrapper. Additionally, this performs a mismatched lookup by
hardcoding pad 0 instead of matching the fmt->pad parameter.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-upstream-s=
5k3t2-v2-0-04ffda3350c1@proton.me?part=3D2

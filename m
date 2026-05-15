Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8733FF1DE
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860812; cv=none; b=p7HUGnUrnDHVPAA+z7duHJdXbpDU+Z0Di5p4vp1YS8jfHhr5nzauW2IWHQSCEee4C8IEHiID2T+sktxNg5fafWZLrVvMxqyo4sPLa9QdSY3pCAaoaR3iUKvoTKVwd4/C9deXRy67BgQdToEhfbb9gPXiSA5qZ9784GI19JSKsbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860812; c=relaxed/simple;
	bh=uv7mAr8JaX9LyDOISDI5xNG/EQSX8zVq0wIH2PamoCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BxdKo6jMQZZosQtqIipvxgDX3jJrzlipqB17LHPmnvnoJgr5KSDjdSVmvV6dmR/C0qhhjrKSeigYHXpC1XdL8YyRLdYUjegQTvV+zPlfv040bVkuW0J95lRJVjud3StneZ1JuEEOKDDn4R1ohvckMWr072PDh8k3zfcsxgVY9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcD9h93A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcD9h93A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61DAC2BCB3;
	Fri, 15 May 2026 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778860812;
	bh=uv7mAr8JaX9LyDOISDI5xNG/EQSX8zVq0wIH2PamoCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RcD9h93AFJQWjE+xvf1myL2fVVJhp3Ij7QnxwT1nfYPrBXVWnpMQPaBu41Ss4RFXQ
	 u6WU5KbXSn2e9SYfmes5Iuy+GAAdAWZN6XjF9iNwu4d2WS5utVGu/aQoeULQuGgYiq
	 RgsEb4bEcWBOLuk61bbRPPxyfo0Bzgf/H5kyx2O4e23y0NJsu4SkNzYdwuSgFBXjNI
	 o2tilLBKLE7kHFrOv+1/HVnHbPve2t714CX0PCTUKLFS9byTOJRLmU/1cvG9dnUU2K
	 7DTz/cevIHT3RL9D2EQluum1ZugfM2oWm92KZg0hpMaECC3DeMY0gMAU6V/DnhDkTP
	 uAtvavbmurSGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/28] media: rockchip: rga: use card type to specify
 rga type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-18-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-18-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:00:11 +0000
Message-Id: <20260515160011.E61DAC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Changing the V4L2 `card` capability string for existing devices br=
eaks userspace backwards compatibility.
- [Medium] The commit updates `cap->card` to differentiate device nodes but=
 fails to update `vfd->name`, leaving sysfs attributes with the generic nam=
e.
--

commit bb9e5b143d71f3baaeea92ea613c7a8d9627f5cc
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: use card type to specify rga type

In preparation of the RGA3 support add a filed to the rga_hw struct
to specify the desired card type value. This allows the user to
differentiate the RGA2 and RGA3 video device nodes.

[ ... ]

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 22954bbae55fc..91775b43ff617 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -354,8 +354,10 @@ static const struct v4l2_file_operations rga_fops =
=3D {
>  static int
>  vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *c=
ap)
>  {
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> +
>  	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
> -	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
> +	strscpy(cap->card, rga->hw->card_type, sizeof(cap->card));

Will changing the cap->card string from "rockchip-rga" to "rga2" break
existing userspace applications or udev rules that rely on the old string
to identify the hardware?

The cap->card field is often used by udev (which extracts it to
ID_V4L_PRODUCT) and userspace frameworks like libcamera to identify specific
video hardware, so modifying it could cause regressions for existing
configurations.

Additionally, since the goal is to differentiate RGA2 and RGA3 device nodes,
should this change also update the name field of the video_device struct
(vfd->name)?

If vfd->name remains initialized from the generic template as "rockchip-rga=
",
sysfs attributes like /sys/class/video4linux/videoX/name will still report
the old name. This could prevent tools relying on sysfs from differentiating
the nodes as intended.

>  	strscpy(cap->bus_info, "platform:rga", sizeof(cap->bus_info));
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D18

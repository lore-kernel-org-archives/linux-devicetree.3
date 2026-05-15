Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD217355049
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862125; cv=none; b=VlCLW15bFBezATWiMEp/nFV4gautka0C0Wnlj5EYGk/Ns4oxlwRPkMXVL/HkyQSFITqoAMxwdyweKJ0XtWdzWZ5Fg/+jRenmBN+7dHBh6fjEOxfa5IuBQZ8ujJo8DO6pv83Qhg++MhGV7hZ0dVUG6VMqG5eqVpIsAV2JTeu0Jeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862125; c=relaxed/simple;
	bh=ybT+TSGjs9hIrIwEylV9W066KBNX/esI532oEG5A+bI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JSRRuSpFSWyWXuutcqPycm0GcMBtnNHfYo5nZAPcZYGbnlh3nDztqDhR3BICkBm7ft+RRQw+MNxMaX/jOcpsA04JEImEGesOKDGEyUtqPH0x3D7eXbuzf4gCAKwM1bnRbSuuKsnOotblRrFTNmUxM01k6EyhESHDZKqWxvPjSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knZWq1hn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knZWq1hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567A1C2BCB0;
	Fri, 15 May 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862125;
	bh=ybT+TSGjs9hIrIwEylV9W066KBNX/esI532oEG5A+bI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=knZWq1hnFQeCFfDQt8P7FhIptExKQKgfC4suAXNINcYXJAVmHQyLctQ+xqH8vAb97
	 3pLdTviIg3qw9urx22IPnYTI23Mh/LKwquiW6MGNI1xFNITlar+p2maQXgqXcN3k7V
	 CQFyE/8Kp2guUBlReqtBc81QlOmkheH1FudfxZkH748/q1G5Weto43A2Ucohrz20R2
	 SpQ8Gbz2dqKOmGhM5YfTZjVCy4MpZY8WhW5cOpcd86b41ZK5EMDT7Tw3K15PbVYDPD
	 ATI1ZesUemQvyWeuBIV2Qw0rqg7dl26p6fNrgSxZrzqdUhK87q5jx0FFv4Z3Kn84hj
	 ubh4NVrOrIlNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 25/28] media: rockchip: rga: add feature flags
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-25-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-25-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:22:04 +0000
Message-Id: <20260515162205.567A1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing return value check for `rga_setup_ctrls` in `rga_open` lea=
ds to a Use-After-Destroy of the control handler mutex.
--

commit 0e807f6179fe82fa9a8a593d5cefb491574e313b
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: add feature flags

In preparation to the RGA3 addition add feature flags, which can limit
the exposed feature set of the video device, like rotating or selection
support. This is necessary as the RGA3 doesn't initially implement the
full feature set currently exposed by the driver.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 1878b4e26360b..8d60e94da32d8 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -177,17 +177,21 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =20
>  	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
> =20
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (rga->hw->features & RGA_FEATURE_FLIP) {
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				  V4L2_CID_HFLIP, 0, 1, 1, 0);
> =20
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	}
> =20
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			  V4L2_CID_ROTATE, 0, 270, 90, 0);
> +	if (rga->hw->features & RGA_FEATURE_ROTATE)
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				  V4L2_CID_ROTATE, 0, 270, 90, 0);
> =20
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
> +	if (rga->hw->features & RGA_FEATURE_BG_COLOR)
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
> =20
>  	if (ctx->ctrl_handler.error) {
>  		int err =3D ctx->ctrl_handler.error;

This issue wasn't introduced by this patch, but since rga_setup_ctrls() is
modified here, does the error handling in the caller expose a use-after-free
if rga_setup_ctrls() fails?

In rga_setup_ctrls(), if there is an error, it calls
v4l2_ctrl_handler_free(&ctx->ctrl_handler) and returns an error code.

However, in rga_open(), the return value of rga_setup_ctrls() is ignored:

drivers/media/platform/rockchip/rga/rga.c:rga_open() {
	...
	rga_setup_ctrls(ctx);

	/* Write the default values to the ctx struct */
	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
	...
}

Since v4l2_ctrl_handler_free() destroys the handler's internal mutex, does
calling v4l2_ctrl_handler_setup() subsequently attempt to lock a destroyed
mutex?

Additionally, does rga_open() returning success to userspace leave the V4L2
context in a corrupted state if rga_setup_ctrls() failed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D25

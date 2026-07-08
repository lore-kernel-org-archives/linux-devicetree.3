Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3D42DA5A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523164; cv=none; b=bhJghHku6hHn+vUgUd5fWX/rXLj45aM2G10NtueyVgWOQEOgUiJGWhUDSQVuV0k1XLmTgrDFuSCWiTOETtByKaoBZwrWGuG9mYd5G7+aZgaeZ09dvzAxdw1zWe8RiYV7kf7gGkAFqpsTfE2YeDo+7K2+suJST/2zIQuY25X7A/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523164; c=relaxed/simple;
	bh=Mfp3/umRbXDoAzwugI+XaLo9O5tOTt9K4xrXQKdo9HE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FjVJdWuChVBYVU9tL47m5yIU+C9lr8LaUF3rGnu/03xkhtE76jqaU57+dQfO+1airzaEa+SlBbXJigJoLCmeLjD6AdK+9H+3pAANo/ffDMPS0/gnaGL/vx3YJ7XNy1fxah8x9GoN7vSdENFkhkfIQXPMC4RKVLxAIaD6ZimYGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRC4oKZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRC4oKZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58071F000E9;
	Wed,  8 Jul 2026 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523163;
	bh=1QmN50MPWx49JAZv4ZKVx4NOPZcnUwPFqdX7g8iGSJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRC4oKZp+pDdQA5yqZe3chS8wiemPcP2JaOBPsJ30zDytGrFhwWXZ0VoR+TluokrC
	 iAcHXMUzNXeB5Io50g7nPZk1i+bIjFBziw0FNEpTC0zcyaRIL3FXAGYP5AAAA+T2QV
	 YCCcsUe7OrTs+PKlRx5quUWl4L+G2SmaN8p82l+NC7CGyVhTIxBGOFwpqfrGX7XCAU
	 BIT+VIAo9TmWWAe947hmE42PFLa5nW3dtiX+y5R232faBi86vcrrfD+gAV0Ukx90Sy
	 Mrmg9bsUzOhyhE22KUpW2KHwDg+opk5faEfrmZ3SE+mXjCbaxX0y0Wc/vvOYZAwtY6
	 hyiJeuA6hVkSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/20] media: imx355: Use pm_runtime
 autosuspend_delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:06:02 +0000
Message-Id: <20260708150602.E58071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The autosuspend optimization is bypassed during driver probe bec=
ause `pm_runtime_idle()` is called before autosuspend is enabled.
--

--- Patch [12]: [PATCH v3 12/20] media: imx355: Use pm_runtime autosuspend_=
delay ---
commit c848098f5125edf42a401c819297cfe0a783116c
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Use pm_runtime autosuspend_delay

This commit introduces pm_runtime autosuspend functionality to the imx355
sensor driver. It configures a 1000ms autosuspend delay to prevent=20
unnecessary power cycling between operations.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index ee1f41a66a0b6..f01a1a5ae7c9a 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c

[ ... ]

> @@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
>  	pm_runtime_set_active(imx355->dev);
>  	pm_runtime_enable(imx355->dev);
>  	pm_runtime_idle(imx355->dev);
> +	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> +	pm_runtime_use_autosuspend(imx355->dev);

[Severity: Medium]
Does this sequence cause the device to power off immediately during probe?

Because pm_runtime_idle() is called before pm_runtime_use_autosuspend(), the
device usage count is 0 and autosuspend is not yet enabled. This seems to=20
trigger a synchronous suspend right away, bypassing the 1000ms delay=20
optimization intended by this patch.

Would it be better to reorder these so the autosuspend properties are=20
configured before triggering the idle check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-media-imx3=
55-v3-0-9df386a623d7@raspberrypi.com?part=3D12

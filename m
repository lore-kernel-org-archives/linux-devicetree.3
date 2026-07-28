Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D03EE1D1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262860; cv=none; b=F5iWCS96+iL8nuP0GxPILn80NY1JpTiyfyIZvDql/vtNk9qGkpAdQjvxVhi/z8ENOrNw0EpK8kfv/8DKGCiSK92/puayzJ+TafHZw8cnXBDdItWGOQSno+jc060jVf1S9W83O1DLLsXVoiAJnL13D45KmQz4FXX36H/wNY7P1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262860; c=relaxed/simple;
	bh=sDYhAWOoaUIYhsUTPHTqR7mrrzPcGTkmUTqoL2NyfVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bt5qQ/B8vfTdkHBVk9b7qGLFVoz8f00lhbMfrOBdpwNeqGbNKXZ3ZpCuyW4p/8kApoMUOTwA+xWOCydZI174W7F0iDeCq/WDPiJHi/KmillZz/XWTKY2xtTauGZ/R2yLl7bKoz4zNilJa/mhsBorw77UIO6e7lkkFFk/LNK6nGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afguqk1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afguqk1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9151F000E9;
	Tue, 28 Jul 2026 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262858;
	bh=jE7lh2aFKrZdG1Uj7ccPQY4WB7/NS6vEgjbz753yY5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afguqk1/4/Ym56aUQc4oA5OeiK7l79ZZFcX3HuS2mZ3hMP86xpbRp3mPXL1lECWD8
	 BlzTVkJo26E8gWeWq87T8RDvSU6r+3zwzPye1/fRPRAVRYf+GgI3To8oROS0MaI4ti
	 4Yw6gkJUVpOYXVnL8YqeZC0Kb8BVo5bJRqv7kcn/kQrK0yHXvxIISzbaHarBjxzBuA
	 YyEm16grH6Cb36XpksKHTdJMBpX23AKNTxsnkLvCx2BJA5NXxbb8doEJktR9o7TuKH
	 1EC5njHcg5gHzZiEvae+C9pMaClSYbGvfmxIt8OtH1zSReMaAQV4rIwETHCVGIZFZk
	 yzXeZ4SqvHqBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/18] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-3-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-3-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:20:57 +0000
Message-Id: <20260728182057.AD9151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DRM bridge is exposed to the system before its backing resourc=
es are fully initialized, leading to a reverse-order teardown Use-After-Fre=
e (UAF) vulnerability.
--

--- Patch [3]: [PATCH v7 03/18] drm/bridge: synopsys: dw-dp: Add missing mu=
tex cleanups on module removal ---
commit 374a35fd683724436ba90569775efd9aa551c376
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add missing mutex cleanups on module removal
   =20
The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 8393f9c9b0f00..ca7ff544d243a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2028,10 +2028,13 @@ struct dw_dp *dw_dp_probe(struct platform_device =
*pdev, const struct dw_dp_plat_
>  	if (ret)
>  		return ERR_PTR(ret);
> =20

[Severity: High]
This is a pre-existing issue, but since this patch focuses on teardown
cleanups, could the early bridge registration cause a use-after-free
during driver unbind?

Because devres executes cleanup callbacks in reverse order of initializatio=
n,
the bridge remains registered globally while its backing resources, such
as dp->regmap, are freed.

If an administrator triggers a driver unbind, a concurrent DRM operation
(like a DRM_IOCTL_MODE_GETCONNECTOR ioctl) querying the connector state
could invoke bridge->funcs->detect(), leading to a dereference of the freed
regmap:

dw_dp_bridge_detect()
  dw_dp_hpd_detect(dp)
    regmap_read(dp->regmap, ...)

Should the bridge be registered later in the probe function, after all
hardware resources are allocated, to avoid this reverse-order teardown race?

> -	mutex_init(&dp->irq_lock);
>  	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
>  	init_completion(&dp->complete);
> =20
> +	ret =3D devm_mutex_init(dev, &dp->irq_lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	res =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(res))
>  		return ERR_CAST(res);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D3

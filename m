Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF143BA222
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045880; cv=none; b=We39B8c8+g33SGWMcI6q9EPUjzcN/Tvzcjv0v/fU4F0v224TPwsjCkgVYGC8Byg18GpdobS2kNBkp6u1lb/00UqONA8IcPsUYp03q/xIO34ow6mUx9Hln4mDCm5PFC4zfb0xD8uViuz6JzdjsRCeToMoMyRwy40rR0PnxzWCd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045880; c=relaxed/simple;
	bh=iwUjvlRt11ZLJvFv6Z3nzGwsbJHnTXBDkxx5bqNx0Rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dYESALDH8wZzDQrSgsix7268t0ojO9S5GSBqph8cTtr9zwaeo9ep4MNXJxGW1M0j4vWWOdiRzFcKEmsgXF3rB9iHo22G4cZ3VTl4V5xWdrTsyb2ckFeyqjsQr0ucemP8sHVo0TNXT7saQ4Q6ucvEPgkolN5Aqqf3WZ2jFwHikeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=So+T73uS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="So+T73uS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4967F1F00893;
	Fri, 29 May 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780045879;
	bh=6tgekIIi0aqjvVnx9X2vM9TwgqbhE1PQEaWGM1uc1Iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=So+T73uSs7/hqYLGmhWJzJGt/h4CA+5Ib47nisFTY6+Sbm70DK9pxPR7FeONQFp7m
	 qvSsfFMrxsNEYMN81bGHm17kQ+vIzcMkZO5LKtL1/tHMmWo63HYd6SeTI1nXmWvuIX
	 y0UuwxrLLM4IvMVujuR9tC+Yk84KF/O1zioL5FisfSTBFZw/Uv0zxU4F+PFIpz1t9b
	 3HXVSY0i36KIVTq7aN1anRdzv8b8PB/VV2ufSvHC20sidx6745QxDolAaDG9PvEiHS
	 gUy0mN7JM15d2S3MygJnU4r/GeDWjmZVBV+I2GyN29yt3QGQBS9c6xa9LwYVaBqVOX
	 6rmDdly5Pl3zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/15] drm/tidss: Remove extra
 pm_runtime_mark_last_busy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-beagley-ai-display-v3-6-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-6-7fefdc5d1adf@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 09:11:18 +0000
Message-Id: <20260529091119.4967F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the WARN_ON(r < =
0) following pm_runtime_put_autosuspend() incorrectly treats valid Runtime =
PM API returns as driver bugs. According to the Runtime PM subsystem API co=
ntracts, pm_runtime_put_autosuspend() can legitimately return negative erro=
r codes during normal operation. For example, if another thread concurrentl=
y increments the usage counter between the usage drop and the idle check, t=
he internal PM checks will return -EAGAIN. If the driver has active childre=
n (like the newly added OLDI auxiliary devices) and ignore_children is not =
set, it can return -EBUSY. Furthermore, if CONFIG_PM is disabled, it uncond=
itionally returns -ENOSYS. Asserting WARN_ON(r < 0) on these valid state tr=
ansitions leads to spurious warnings in the kernel log.
--

commit d589ba6abd338a264b1bc27a4829172f13fddbbc
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: Remove extra pm_runtime_mark_last_busy

This commit removes the explicit call to pm_runtime_mark_last_busy() in
tidss_runtime_put(), as pm_runtime_put_autosuspend() already handles this
internally.

> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/ti=
dss_drv.c
> index 1c8cc18bc53c3..5cb3e746aeb37 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -42,8 +42,6 @@ void tidss_runtime_put(struct tidss_device *tidss)
>  {
>  	int r;
> =20
> -	pm_runtime_mark_last_busy(tidss->dev);
> -
>  	r =3D pm_runtime_put_autosuspend(tidss->dev);
>  	WARN_ON(r < 0);

[Severity: High]
This isn't a bug introduced by this patch, but does this WARN_ON() incorrec=
tly
treat valid Runtime PM API returns as driver bugs?

According to the Runtime PM subsystem API contracts,=20
pm_runtime_put_autosuspend() can legitimately return negative error codes d=
uring
normal operation. For example, if another thread concurrently increments the
usage counter between the usage drop and the idle check, the internal PM ch=
ecks
will return -EAGAIN.=20

If the driver has active children and ignore_children is not set, it can re=
turn
-EBUSY. Furthermore, if CONFIG_PM is disabled, it unconditionally returns
-ENOSYS.

Asserting WARN_ON(r < 0) on these valid state transitions could lead to spu=
rious
warnings in the kernel log.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-beagley-ai=
-display-v3-0-7fefdc5d1adf@ideasonboard.com?part=3D6

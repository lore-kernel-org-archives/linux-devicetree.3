Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E927732
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444900; cv=none; b=SeN/qO0shNzI6O6Cf/Z8zh/7irgPML/I0soTOzdAskSdKHnRB6U4LGVx6uaQypWKW6o3clhmRs/6PfhvN34L4QxZIAEeAsjRdix/RwDFIMzlJrCuXypsOXVUUPAQDcXyH3VltEvAYc4zM5asl5OHZyMx+B1kMrENH0Dbp5Qw41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444900; c=relaxed/simple;
	bh=dV3R3j3kCs6j1jstcHcj6nofz8txjRDtWwXpgUHY6QI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CRzH0KBbG9emLxgUsjv591xQGw0rT2R1690BR4Te5ykzRUSmqVtEJ2+X2Klk3ILug8ebHJ30KsLFB3kXzO+JmLrFl7VKhcd9em7iR3xguTLGy9ti16o3T3iroKpDz5AfwkMWRe3Nxgf/VSd78vCbzbzG5j4Sdx9GIw/aOtx3j5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVIbeygz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVIbeygz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0271F000E9;
	Tue,  7 Jul 2026 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444898;
	bh=R2rzh3C2OfBhsrHFnXBc5eUm3wPT0vlEVB7NLugbL4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVIbeygz9Rc3/g6GgOsJrruyzpn0oZG5dwsTtpT0FMWTFBFAkQ2X3p93fsnD/0qNx
	 DPknDOTtLZ4iQz3/oZeK96T3TSvtwID56STT+4ymythArLl2pnW2vVWbK7b/yfqOEw
	 KiApnqOd/VyfrVJ4h8DkrJo+C+H5+YnBFwWsoJlsiqES07fVA95i1+cJeDzUr1AFQ9
	 FgYaHqE/LLCZwqLGLvEU7QLh/z0tPQnORQkgSPfrknGmq+7EutPWje4WMEaCFUHfdP
	 787F+1mv9DVzIY+zLbIQww73l+x2Ie+P1vk7Iuot0qLyUkLnR/YGNIPGIqgULpUVzi
	 IJbpoRDe8ssEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/20] media: imx355: Use pm_runtime
 autosuspend_delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-media-imx355-v2-12-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-12-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:21:38 +0000
Message-Id: <20260707172138.AE0271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing pm_runtime_dont_use_autosuspend() leaves device PM confi=
guration in an inconsistent state on teardown.
--

--- Patch [12]: [PATCH v2 12/20] media: imx355: Use pm_runtime autosuspend_=
delay ---
commit 2fa89d9640a2f437c76ce04712298549178132d2
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Use pm_runtime autosuspend_delay

Avoid powering the sensor up and down unnecessarily by using pm_runtime's
autosuspend_delay feature.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 0f5fbe21d7fb2..c7a24c69c0df8 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -1430,6 +1430,8 @@ static int imx355_probe(struct i2c_client *client)
>  	pm_runtime_set_active(imx355->dev);
>  	pm_runtime_enable(imx355->dev);
>  	pm_runtime_idle(imx355->dev);
> +	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> +	pm_runtime_use_autosuspend(imx355->dev);
> =20
>  	ret =3D v4l2_async_register_subdev_sensor(&imx355->sd);
>  	if (ret < 0)

[Severity: Medium]
Should there be matching calls to pm_runtime_dont_use_autosuspend() during
teardown?

Since pm_runtime_use_autosuspend() sets the use_autosuspend flag, leaving it
set on driver unbind or probe failure leaves the device PM configuration in=
 an
inconsistent state.

For example, if probe fails after this point, the error path disables runti=
me
PM without undoing the autosuspend usage:

imx355_probe() {
    ...
error_media_entity_runtime_pm:
    pm_runtime_disable(imx355->dev);
    pm_runtime_set_suspended(imx355->dev);
    ...
}

The same pattern appears in the driver removal path:

imx355_remove() {
    ...
    pm_runtime_disable(imx355->dev);

    if (!pm_runtime_status_suspended(imx355->dev)) {
    ...
}

Could this cause state leakage that affects subsequent driver bindings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D12

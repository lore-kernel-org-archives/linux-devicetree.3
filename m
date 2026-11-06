Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962720;
	b=p+tvZTCuipIMMqAXz/N8cQobI7TlsCm3YhUWCq3RZnRTviFdq/6mUnQysLQRkTde8Yib
	 CRDefOiSNrzcNoDTqtdP/y/Sdn9JTJIVhj0vKbg97UzO18JXB67KiUekOcVN2WGuP2c6a
	 O24veVeKogOpL++j9osCmjeUtUCf6y1hon0ItAHw1CyXAiG13OJ5AoPM2DxcEW+v4skrK
	 OfmRZNO8Os+X+CiMIC2/US3avi8INKNaJDTaiy7TEG9bTR/iOWut6jnurVsnE6dllnMXw
	 0zxSKq4+hWAf+0SSnSVqD+A73O9cmeWp+uYP7X3VZDzZlo4YUgzElF5BqQkoQEMw0bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962720;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F03PV+awTeyeZc1CPOrbfwMWziWjOIGLK1gby3UcZcg=;
	b=viaqU75O8TRleal89lUiA/dYhYxRqc5OQdSl3ANGWJOWNfw/7k3xS5gibs7lVYzGkpPQ
	 FRAHkkBwX7jx9hADxt/AJTW99JUWXmFNu0SEmBobmT9Mma9ZHQucwZ6JDYNMUHhG3gtBQ
	 cYSornkRsiH2xQfbaczzsc6Papul6mdJouHDWitzBaSrnRL/gw1OuXnHXG/C10t6fT/H+
	 pw5My+a245nryibZYxZ1SVBgNUks2T5QCxMW404x3/R0fD7rKy86s4DYJ1iPHzVtNeVoc
	 Yn/aMRJaqBplvzwfJw5Jk+x4MpBaqYusbgQ+yOAYaGQ6RWREF1HBJZHyQO0AqtGjo8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G6syX/6l";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E3606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6syX/6l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B8A1F0089F;
	Fri,  6 Nov 2026 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962719;
	bh=F03PV+awTeyeZc1CPOrbfwMWziWjOIGLK1gby3UcZcg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6syX/6lMaAFvLTayWGkeTgtCRSpyzhdynfTh8kqMsnc+MFNHWcX7fDOZluYi1QjK
	 U+lfyzTdrQd4k4BeFiUH713gwKVTD3sbQCIxyB7pkxMFNDrS6QEAWeWu1PDYYvCH5Y
	 V4X5ADSdSjzPHGxHe/KP9R/lRDp/TnLLtOOrsv+dX7Oexd4gvwFDUO6df6PhXC4Rw2
	 A2xe0g0jHhKSXmjW0dB2wId5JlKSef0r3eL7Cu40YivuTjFCcZcZM5MZIOSkG7Gxm0
	 lEOwyJu74z/qA1MlSpq8OXV/4r7jPsM1A0Vz5p1lSQg4eSF/akGYJ7MiKikC5w1h7I
	 DhKD8Pguxn4KA==
Message-ID: <sashiko-outbox-201259@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/panthor: Add initial support for CIX Sky1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunyuan Liu" <cunyuan.liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261106104735.1651267-3-cunyuan.liu@cixtech.com>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
 <20261106104735.1651267-3-cunyuan.liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:58:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] drm/panthor: memory leak and use-after-free in
  panthor_devfreq_init() [1]
--

commit a4d7e2c7598493163cc0be92c3c3410ed211540f
Author: Cunyuan Liu <cunyuan.liu@cixtech.com>

drm/panthor: Add initial support for CIX Sky1

This commit adds SoC data and driver handling for CIX Sky1 to perform an
external GPU reset on initial resume, program SYSC_ALLOC registers before
L2 power-on, and skip devfreq initialization.

> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 2249b41ca4afe..1914549f7b1fb 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -154,6 +154,12 @@ int panthor_devfreq_init(struct panthor_device *ptde=
v)
> =20
>  	ptdev->devfreq =3D pdevfreq;
> =20
> +	/* Keep the firmware clock settings until Sky1 devfreq is supported. */
> +	if (ptdev->soc_data && ptdev->soc_data->skip_devfreq) {
> +		ptdev->fast_rate =3D clk_get_rate(ptdev->clks.core);
> +		return 0;
> +	}
> +
>  	/*
>  	 * The power domain associated with the GPU may have already added an
>  	 * OPP table, complete with OPPs, as part of the platform bus

[Severity: Critical]
This problem wasn't introduced by this patch, but does panthor_devfreq_init=
()
leak the cooling device [1] and leave a dangling pointer to
pdevfreq->devfreq on unbind?

drivers/gpu/drm/panthor/panthor_devfreq.c:panthor_devfreq_init() {
	...
	pdevfreq->devfreq =3D devm_devfreq_add_device(dev, &panthor_devfreq_profil=
e,
						    DEVFREQ_GOV_SIMPLE_ONDEMAND,
						    &pdevfreq->gov_data);
	...
	cooling =3D devfreq_cooling_em_register(pdevfreq->devfreq, NULL);
	if (IS_ERR(cooling))
		DRM_DEV_INFO(dev, "Failed to register cooling device\n");

	return 0;
}

cooling is registered with non-devm devfreq_cooling_em_register() and
never saved or unregistered, while pdevfreq->devfreq is managed by devres
and freed when the device is unbound.  Any subsequent thermal governor or
sysfs access to the cooling device will dereference the freed devfreq
instance.

[1] https://sashiko.dev/#/bug/linux-aae5bae7-91d6-4e9e-9c28-1cbf604c1457

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104735.1651=
267-1-cunyuan.liu@cixtech.com?part=3D2

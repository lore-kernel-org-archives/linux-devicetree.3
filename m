Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964816;
	b=kHbcjkOpRUFuY7uiFEnrHVC8LAEPswin15g/KKZO1gCSYh2W9gJ28LHRIl/kgpeJ2c4J
	 6GsIMoth4ch5siPiYcyxuyR9bLqnkqUhlrM1gJDBgiQYZ3lK+q48dOpbQj0Uba9x16ybR
	 LcqpltZ/ocS6Kt3tLWwylEQu+52ubgtnwebdDBQuADvtvcDIImOjOC+Wj4oStqs+b5lq/
	 X1/0sFh+9oI4Tjciny2qTQprkSEF8BPkD7ZLq39uU8bLd41FOK88G7hDbYaE0R6vfeIt2
	 sWxn81opug74x5iqY2gw6YKq/i+FSDeD525ZufdjE9Mj1SFfRhdaDaJQe3c3OazZ7lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7P5zNMeKPnx3xe1x+0JQR513+3VjQobVS0eV+liJabI=;
	b=urPsElshh6cVd8Y1kgkORmhjzqpKnR6qOENGtHWlDdqwr9ApT97CYkPDqzdWmEzP0wrI
	 VPJMRm10U/XOIBKK+6lPdjCIMSIszN+F/Hl4wHnAli0ubtXHGiz3FbtCMHSXn+A/zcTqE
	 aNyzyIQPEnIvxMeTeX1GftRvhNx6ngHP6oJ0VpooILD6XjJ4IeOPz/Owea843hGV0omnS
	 brLSaVrdYRqi/js3NpSiBejXIInYeetK8iQalqTDyGLcFX/vfqoJsQsFcToJlA19rPBVQ
	 J1G7uIOZdWyGzfO8Lb7MaSP9gZp7lcKRCS+ioDuHsMzQMbI68cVR8ke6r3cD3W9hBYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BBaYsXjs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C6606D803
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BBaYsXjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1FE1F0089F;
	Fri,  6 Nov 2026 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793964815;
	bh=7P5zNMeKPnx3xe1x+0JQR513+3VjQobVS0eV+liJabI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BBaYsXjsA+14vNu+isWf9OBhbWRDKZBhJpWA+G1ObRRBKH/QVHlamg90aTHSfRM50
	 u6GRPoU0gvug4D7eaHcYZ4sUTmGY6rmiIvopMnq/2vv1jv7YFVCD+z+mPwke6lmTOi
	 JH9otBMbyp6A7epOjC9q2kggQEa8ozXHQzF3lkEHfovPg3wJZqstlw8U4xMMsggHMB
	 XeptVkHsql9pguQSB7m3dmc6jKsCWZgvrtPEoMPu8stNs9p/GzvAUuUqDIvoiJlqCB
	 ZOsiyonx3qrKFyprIa5LaQgDuK0H7LINcBP2JjcF9pPtY0mKGT4ovSInr1D0M+0CVM
	 P8aNX2/LIHp/A==
Message-ID: <sashiko-outbox-201317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] drm/panel: Add the HiBy LG35583
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106112000.1612-6-olivier@mgcrea.io>
References: <20261106112000.1612-1-olivier@mgcrea.io>
 <20261106112000.1612-6-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:33:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/panel: hiby-lg35583: reverse regulator disable order in
  lg35583_unprepare()
--

commit d7b0c5c3d496f641bc7958504a4bf1c7175af30f
Author: Olivier Louvignes <olivier@mgcrea.io>

drm/panel: Add the HiBy LG35583

This commit adds a DRM panel driver for the HiBy LG35583 480x800 parallel
RGB panel configured over a 3-wire SPI bus.

> diff --git a/drivers/gpu/drm/panel/panel-hiby-lg35583.c b/drivers/gpu/drm=
/panel/panel-hiby-lg35583.c
> new file mode 100644
> index 0000000000000..47aba09e91a4c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-hiby-lg35583.c
[ ... ]
> +static int lg35583_prepare(struct drm_panel *panel)
> +{
> +	struct lg35583 *ctx =3D to_lg35583(panel);
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D regulator_enable(ctx->vccio);
> +	if (ret)
> +		return ret;
> +	usleep_range(5000, 6000);
> +
> +	ret =3D regulator_enable(ctx->vcc);
> +	if (ret)
> +		goto err_vccio;
[ ... ]
> +err_vcc:
> +	gpiod_set_value_cansleep(ctx->reset, 1);
> +	regulator_disable(ctx->vcc);
> +err_vccio:
> +	regulator_disable(ctx->vccio);
> +	return ret;
> +}
[ ... ]
> +static int lg35583_unprepare(struct drm_panel *panel)
> +{
> +	struct lg35583 *ctx =3D to_lg35583(panel);
> +
> +	lg35583_cmd(ctx, LG35583_SLPIN);
> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value_cansleep(ctx->reset, 1);
> +	regulator_disable(ctx->vccio);
> +	regulator_disable(ctx->vcc);
> +	return 0;
> +}

[Severity: Low]
Should lg35583_unprepare() disable ctx->vcc before ctx->vccio?
lg35583_prepare() enables ctx->vccio before ctx->vcc and disables ctx->vcc
first in its error path, whereas lg35583_unprepare() turns off the I/O
supply while the main panel supply is still enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106112000.1612=
-1-olivier@mgcrea.io?part=3D5

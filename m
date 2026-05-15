Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7945743E9F5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837880; cv=none; b=nyEOE9buD7KHqE2erzbzKVaZxsFXQDm7VZxVunb5pKQsJPw9HISBEL6FfHcHWgkI4sjcb1RWV8vznV+1kFRhGdFZOw4mBtq/8r113cAM0JUHSUCzkIliHFrTg3nPyrhDO8w6u5MQUj/lS2ocMIfZHaCtzj0akHtt6rRZjHQAPWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837880; c=relaxed/simple;
	bh=GDxxDaS8LD3dJrFZNtvF/N3EA38mKY4Ha5k06AngsEw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EuVHY2Ze0Ute1elfdTl3DUYjFfiWzVPYKiMZoMbTz78N3VSwd0o4vHoGqDRalGuIcaFCXCqIa2pNAThcRJZh5XaGESXMbpvXsjFKBSFKpJGY9drTkKKYz7aDuhnzKKoj5YYULY7atqz1WzuipJTGxmG3Q43XxeK2dMqUwXg1txk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIHL5nuo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIHL5nuo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04EBC2BCB0;
	Fri, 15 May 2026 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778837880;
	bh=GDxxDaS8LD3dJrFZNtvF/N3EA38mKY4Ha5k06AngsEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gIHL5nuo8L6QT2elwSMxhL/yb8SOBrQk6oNe82TOxgGHJ+3RJfauULc+vMxoZexSX
	 tMwPDBpZeTLNhcSFMVxBCG0/UdJj4ND/NFeXXJZoQhjSaS0i8YhYToqQFwdEbfcqS0
	 yQnMMSIwM6jc83oMRRoBCp8YOrvlUaLW6yeBFeRtirqlq7jGTrEdBJF3Eo6nQBEMTr
	 eElJMA8HK3rsWyYe0ymGo8y+N16RAQqc97DzUe2KrHn2STvwxJFNW5sa02f4mUGHXZ
	 WaMH8h6CBiVlnZnGYAeL0Ab4i7g6VfVU36WRQwbADmBz6xr0ctTC6kpkdR7bM6Cz8Z
	 lCdMu4+bB3k9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 09:37:59 +0000
Message-Id: <20260515093759.C04EBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unbalanced PM runtime usage counter due to unconditionally calling=
 pm_runtime_put() after pm_runtime_resume_and_get() failure.
- [High] Incorrect devm teardown ordering between DRM bridge registration a=
nd PM runtime.
- [High] The drm_bridge reference obtained via of_drm_find_and_get_bridge()=
 is never released.
--

commit 02d8011f56016654fa33cd3453d89ee92304eef9
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H DSC driver

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
pass-through bridge and allows DSI1 to be operational on R-Car V4H.

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c b/drivers/gpu/drm=
/renesas/rcar-du/rcar_dsc.c
> new file mode 100644
> index 0000000000000..5d3d083e3ce65
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

[ ... ]

> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +				   struct drm_atomic_state *state)
> +{
> +	struct rcar_dsc *dsc =3D bridge_to_rcar_dsc(bridge);
> +
> +	WARN_ON(pm_runtime_resume_and_get(dsc->dev));
> +}

If pm_runtime_resume_and_get() fails, it does not increment the usage count=
er.
Since execution continues even if the call fails:

> +static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct rcar_dsc *dsc =3D bridge_to_rcar_dsc(bridge);
> +
> +	pm_runtime_put(dsc->dev);
> +}

Could the unconditional pm_runtime_put() here cause a usage counter underfl=
ow
if the initial enable failed?

[ ... ]

> +static int rcar_dsc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	dsc->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
> +	of_node_put(remote);
> +	if (!dsc->bridge.next_bridge)
> +		return -EPROBE_DEFER;
> +
> +	dsc->bridge.of_node =3D dev->of_node;
> +
> +	ret =3D devm_drm_bridge_add(dev, &dsc->bridge);
> +	if (ret)
> +		return ret;

The function of_drm_find_and_get_bridge() acquires a reference to the bridg=
e.
Is a corresponding drm_bridge_put() needed if devm_drm_bridge_add() fails,
and also when the device is removed?

> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static void rcar_dsc_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +}

Since devm_drm_bridge_add() registers the bridge via devres, the bridge
remains registered and accessible after rcar_dsc_remove() returns.

Does manually calling pm_runtime_disable() here create a window where the
bridge might be accessed while its PM runtime is disabled?

Would using devm_pm_runtime_enable() prior to registering the bridge ensure
proper reverse-order teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-rcar-du-ds=
c-v3-0-164157820498@ideasonboard.com?part=3D3

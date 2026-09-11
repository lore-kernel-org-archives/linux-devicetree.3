Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762C8492E4A
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141475; cv=none; b=oo1ghTJv14OoBl1wotmVVkMq5CYxHvp8O8ua2nO4vkfo1Muu0OUJkIv+ICuxUt5L+8XjzJiEfwX6wfH18hkVjBA5zoDlIFo1gQFLC7rscuJ9Q9Fc4KNcFVhqU3aNLA0rw4nByYYSfdqYAEh13prPlGL4CV1+PJspDx18UUOzfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141475; c=relaxed/simple;
	bh=AIrUqdhNkGbmVt/SOhLFn+jqdv301OqWBagy1DZ+cZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lRkwDoO6Es4UnYbOsXGzzI5HF1qtq6yraqOVaT6avDtT+3ZeyZufTFoyV195zIRTveM21R/mJ4HuqlpwziXOchHBwTUIggnrI2sYSCYloaQBbeSq6bJ5mNYeJw6QIE1VVVRqD+FJox0kQCjHAaW70OGQGj+ePkEA7xZEIoJytv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMlBlxWS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMlBlxWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD65B1F00893;
	Fri, 11 Sep 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141474;
	bh=K+LelqBFzO9KDETDqbuzO0UakHXPDsXNSjenJa0M2fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IMlBlxWSuavSrs8jAgkML9UZWfybd03qxAyjrM6lJ2Bg6snmFB5ELV2G/gCBlz5Pn
	 9cYnN8cUlCqaGb/Qdf/Pisf2/Xo72a2UCnBWHpB38jWvlltJAPuiryc3iCi+YExee7
	 CaRb4UcHjmRcnzrZP0T5KKj73cuGRSriR2AAJp+wCsm5roziwXOoGDOU54/s5Jmji6
	 Bp2P7xc0PWmZCrXAEORQAe17IHMXVCTax6DDihoRSxZrDSjD1lid39c8WVcgYtS4sf
	 cv1BiCV80udoxYLEzLO/NrbPwaR0Oj4Ijtjli2mj+F1G+MPZfiUpkg4Qv+S1rhbc2S
	 zPS6CJ0jmnKmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nickolay Goppen" <setotau@mainlining.org>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-qcom-novatek-nt51021-panels-v2-2-135e3190a7fb@mainlining.org>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
 <20260911-qcom-novatek-nt51021-panels-v2-2-135e3190a7fb@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:44:33 +0000
Message-Id: <20260911154433.BD65B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ignored return values from `devm_drm_panel_add()` and `devm_mipi_d=
si_attach()` leading to silent probe failures.
--

commit d977b7bfeacd8104619cc818002d70a48f32aad3
Author: Nickolay Goppen <setotau@mainlining.org>

    drivers: gpu: drm: panel: Add BOE NT51021 driver
   =20
    Add driver for BOE NT51021-based 8-inch and 10-inch DSI video mode
    panels used in Xiaomi Mi Pad 4 and Mi Pad 4 Plus (xiaomi-clover)
    tablets.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt51021.c b/drivers/gpu/=
drm/panel/panel-novatek-nt51021.c
> new file mode 100644
> index 0000000000000..61dd283769a75
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt51021.c

[ ... ]

> +static int nt51021_novatek_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct novatek_nt51021_desc *ctx;
> +	int ret;

[ ... ]

> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	devm_drm_panel_add(dev, &ctx->panel);
> +
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
> +
> +	return 0;
> +}

[Severity: High]
Does this code silently ignore initialization failures?

In nt51021_novatek_probe(), the return value of devm_drm_panel_add() is
discarded. Additionally, the return value of devm_mipi_dsi_attach() is saved
to the ret variable, but then the function unconditionally returns 0.

If either devm_drm_panel_add() or devm_mipi_dsi_attach() fails, the probe
function will incorrectly report success. Should the code check these return
values and propagate any errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-qcom-novat=
ek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org?part=3D2

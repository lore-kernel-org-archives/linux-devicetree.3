Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792446281;
	b=EmFGTTkKJyz24Mpx4mKYaFksL7dJq+5LFBZSyWI+PHGG2WdXcWJGJ8JdZ7ZARDUgvCMt
	 wBo17O47N6lSSLee6ZR+WmCoWSpiLg/tRUC1M2pCLp0WtMbawLb0xVqQbMypqPjZ+AN+e
	 X0Au3H5i0VRQSY5o9X/C40jdH117jmp684bfURaSqehRj4lW6VanHSDEsiW6840xVNm1o
	 5ZdM8JAO/iwRJ/wjy0QH7296t1AvbSUm1E/2yc5OewM+s8GVAZXwIgALoqL5dIcwQyFam
	 RUMlpFmiITPnRHpAvDFm+xTXPRm8enTwP3vXIRhAKp9RpjiOTtKR8oViHlLJ98mOTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446281;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0gH035Ctt/IymfpW1MkjJssoA9dnmKGxwVzV9qVJRYQ=;
	b=l5N8VUTMsHx+JGz0F3qUoY74RYpdep0A66ErX5M/WWYE675ZpWoP0lqNGezR5FoJGJzu
	 zZ16WeErnVHqqkTvAkdSD4fOwFeocEuEuzXCbKoeNXRDEKW4s3MlMcJV9F/hJhT9gWvCb
	 lMFm44+xr/Pj5dQv6ZXxm1QcEddoaw272O8kgiizkPkBqOD4Lcl4WIQIhHKP0PCHuDMch
	 O3iXOMCpnlxCerTQOZPPWwuikomMntQj7fJNPPDrtOGSfN4xZqOvYfWhFGt3WfKohXtbs
	 TeH8tMkzqN+y4N1MP9PdYs96yNsGdnY9PDKhJ6+Bm71h1CI/6XDDT0flASJVe9l9nrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GT3VhE0W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F3606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GT3VhE0W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A7A1F000C4;
	Mon, 19 Oct 2026 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792446280;
	bh=0gH035Ctt/IymfpW1MkjJssoA9dnmKGxwVzV9qVJRYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GT3VhE0WJmwTy03LQnC9me3v0zHThFZaQsOHCad7Hj/gLVEqRe3TlAnoc+ol8iZto
	 wbqHiEpaRRWKvC3bBjpqVBUCGXSugXxxxwHF7q3+EqIRbxPjIzgKBctZy7EOVOT4bE
	 dAz++d0ulSejg+iGKWuiLlzdljlnJvlfkKbrdFE0kikGP3Y+2S45ybwmt2zqgzMWat
	 GQdvGwtaXCck8zxv9lGWsEgi2W/8HjfjECBWOwl2/LWsmT7GDkzkN9Yo9w3s92nVfr
	 /hurFOswslZx2brdmOkyTigNd+Qx8fbP5NSG5mPlPTnJo3BuIaMUb7jQqRexMHlMCH
	 OQaQ5lqzrU8pg==
Message-ID: <sashiko-outbox-178273@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/14] dt-bindings: display: solomon,ssd16xx: Add
 Solomon SSD1677 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019213726.4145532-4-devarsht@ti.com>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-4-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 21:44:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: display: ssd1683: bare solomon,ssd1677 compatible w=
ithout panel
--

commit 99bb2813cd624693670923f366680d97f3d2c796
Author: Devarsh Thakkar <devarsht@ti.com>

dt-bindings: display: solomon,ssd16xx: Add Solomon SSD1677 controller

This commit adds solomon,ssd1677 as a compatible string to the Solomon
SSD1683 e-paper display binding.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1683.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd1683.yaml
> index 2e2aa195fb1e6..df8d9ff821a78 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1683.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1683.yaml
> @@ -31,6 +31,7 @@ properties:
>                # Good Display 4.2" 400x300 monochrome e-paper panel
>                - gooddisplay,gdey042t81
>            - const: solomon,ssd1683
> +      - const: solomon,ssd1677
> =20
>    reg:
>      maxItems: 1

[Severity: Medium]
Should solomon,ssd1677 be used as a fallback behind a panel-specific
compatible in an items list rather than as a standalone const?

The SSD1677 is a display controller IC that supports panels of varying
resolutions (up to 960x680 pixels), physical dimensions, booster soft-start
tunings, and color configurations. Because this binding does not define
Device Tree properties for panel resolution, timings, or color mode, panel
parameters must be determined by a specific panel compatible string (just as
gooddisplay,gdey042t81 is paired with solomon,ssd1683 above, and as
ssd16xx_of_match in drivers/gpu/drm/solomon/ssd16xx.c expects when
ssd16xx_probe() looks up ssd16xx_device_configs[model]).

Defining solomon,ssd1677 as a standalone const under properties:compatible
allows a bare compatible =3D "solomon,ssd1677" node that lacks panel geomet=
ry
and cannot bind to the driver, while rejecting valid two-entry
panel-plus-controller compatible tuples during dtbs_check validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019213726.4145=
532-1-devarsht@ti.com?part=3D3

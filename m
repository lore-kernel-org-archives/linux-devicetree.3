Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C965A514E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158362; cv=none; b=ENz69Oy8PcWH01piqxQh5ibazsfBKzEx6ZNqStfKCk5rmhlupCgJ3E0nfqYKp9Ka3YTdNO/lw5w/efZ70v25uWnVLKymIUPtz2t4HgHkwmshY9VDou9GeKHXsBUWrbeHnEF98hoHylii8QYlJ7tQ5YqUj4hNyKiE0cO8pwgIu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158362; c=relaxed/simple;
	bh=hRdELXpZKzKR0tS9Pa4prVhytho45d/FhFVvToEKhIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CET7e3PyfLK3Q24TALwjayUqPJFL/401jPIeR9Vnt0PI7SRsliz5j1Py2m9d/hqhRfegzxUp5FbprisGa1HWBnv44gEjIuCAa1ocq/+sZGIc0wrcBe+3mJi597VYpqynIk1mlZGMMdMCed6Mp8KkxVH4m8P4eC5orGk0CiG4m64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdMWP7jT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdMWP7jT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250EA1F000FF;
	Fri, 11 Sep 2026 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789158359;
	bh=FMQ87La+n3zYM8L3jNEb48smDmU8bZ/yFQYBTNCegPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SdMWP7jTM9YT1NkRuc16xD4tGNPe8xT40lNpXGBzNRsfIrS+ZKqB73RfRzmGy/gV+
	 7qllLWGg1xvA3mPrjlU/fgjKpAmGx6tTwF0lGjZCeYfZTiw5OmjI8hRSgHzA1YY2xK
	 /mCuhZhJspE8i9gbjWgAiHc4h9TqJMdh+knwqmQhP+hn7P44L1obI6dsRBCaQkjKZy
	 k8WhyxddTLN00129ElwN3bm6itu0pHe7VNBrJaVRTOPwqhefju18WVNqu/KaUj1DwM
	 9x5lNac/3V/dyoiOvVKfyYC19pSJYReCd9URIcFQ/DhW7Ll5dxzfwL/bOPDt4VMLL2
	 ZepdRVtH0wWcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel: mipi-dbi-spi: add
 st7789v-tft28
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Frese" <freseenzo@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911201920.72734-1-freseenzo@gmail.com>
References: <20260911201920.72734-1-freseenzo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 20:25:58 +0000
Message-Id: <20260911202559.250EA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added compatible string `st7789v-tft28` lacks a mandatory=
 vendor prefix, violating Devicetree specification rules.
--

commit b9c6f3f7002bdc4087c21d6e0612fcb912f52747
Author: Enzo Frese <freseenzo@gmail.com>

dt-bindings: display: panel: mipi-dbi-spi: add st7789v-tft28

This commit adds a generic 2.8" 240x320 RGB LCD panel using the
Sitronix ST7789V controller to the panel-mipi-dbi-spi binding.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-d=
bi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-db=
i-spi.yaml
> index 6f0290c4e2917..c28659bd05dc1 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.=
yaml
> @@ -75,6 +75,7 @@ properties:
>            - saef,sftc154b
>            - sainsmart18
>            - shineworld,lh133k
> +          - st7789v-tft28

[Severity: Low]
Does this compatible string violate the Devicetree specification rules
by missing a mandatory vendor prefix?

Modern dt-schema checks require compatible strings to be in the format
<vendor>,<device> to prevent global namespace pollution. Since this string
lacks a comma and an approved vendor prefix (such as sitronix,st7789v-tft28
or panel,st7789v-tft28), will this cause dt_binding_check to fail validatio=
n?

>        - const: panel-mipi-dbi-spi
> =20
>    reg:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911201920.7273=
4-1-freseenzo@gmail.com?part=3D1

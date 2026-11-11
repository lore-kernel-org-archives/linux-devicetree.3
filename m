Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395447;
	b=hvOjjlpEK0Yt9rlGwr2P1NbGMQi/Kk5L3DngKAZn9GCM9/3sJ1cXjVCypS8l3PIrqYQf
	 WJ/BoawKPk3FvSH4+TYhJFugDQ62HIylRscSB8t064gW0yoEwZ0CBOANmoHAtsH6wccwa
	 Ba7R9HfYDsnGRaem8MzCFWQpaCDFTfRYjiN2I+13F6l/guaDCV1rX8bt/wU9JCBH4I4+C
	 nRt+94kigeh1KbTVL5SMzQs4XqBY+8hA7a8f1c5gMZFZmArNA89qFgI1R+Ti0dO0cd6TN
	 67YscsEXq65LPdMlkwuxrrG2zbN2VbmxLPuPDnXz5FSGSKP1UZFfZyG1g5IHID2xHtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395447;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pLhx0B7rZp8JjL6NJ1Ii8OSP29Jgl2dZGv2AwdDNFQo=;
	b=4Gk2NwT8SODxuUTnEc9JjGMD+MYYdOeYXeXTqE9X6A4+ogQPdoN76k3rwTI6njNUUWM3
	 vuMjBzsFc2WeReR+tk5+OZFPzsat0D7qksTyjWKxyO07/KeM+BQ2K+HBqQubrtPWyztq4
	 mZmDJOwVxMEMhR0PsCqFaLe++R8wNCt95Gd/RB+Pf5hecLgapLnuOnSdJGmz/hhyOxgZ1
	 53FdQ8V1jNKejni4gd/WrxUdGEN2mbpPBs2yJsXD4p36xrJqIaUV+tiyDJMnt8m1KCqeB
	 b5aXyD+e2x4WVV4pXjcgx/ptSNcUI1iSFlE6MwnR9ZXUvjUAejwyQI9Ewo0p/UJCzUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lE7VM1/5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47E606B40F
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lE7VM1/5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80651F00A05;
	Wed, 11 Nov 2026 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395447;
	bh=pLhx0B7rZp8JjL6NJ1Ii8OSP29Jgl2dZGv2AwdDNFQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lE7VM1/57TRlXJ4WhNqXBNSixDkdrUfis8/oB9BFszCVq3YVtu62MnpI7pqrzUeXH
	 zBrMM/DkB82x9aIpuyQniPYixko5JBgzd6QEbV5eamGTtLGXRvXAfv8cNHUvAAtoHG
	 KukztDUfvDUcZYOVusougknME6uzg5vb7YBdt4VbQccS3+dpeHx6CRLXW5gQBOS8Op
	 ArgplQvts5LgwSLhnP1hTjoQKwYQ6EbGZNuUxrf8/Mlykm2lBjYh8pyHjayPsOc/mH
	 xLPHOR9uRAGHiUZIlSsd7wSOKZU2y3tJ/rGWarsLHuK7v+hp0rZSB2NuBkbvFmd4t8
	 piSf2PlmumcKg==
Message-ID: <sashiko-outbox-208855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:10:46 +0000
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
- [Low] dt-bindings: display: panel: ilitek,ili9806e: port made optional
  for SPI panel
--

commit 2dd7afd9762ebccda9424fc16917d18216458223
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: display: panel: Make DSI panels port optional

This commit removes the port property from the required list in 39 DSI
panel Device Tree bindings so that panels placed directly under a DSI bus
node do not have to specify an OF graph port.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
06e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.=
yaml
> index 2080d9e0ffac4..9a2602ddd9060 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> @@ -33,7 +33,6 @@ required:
>    - vdd-supply
>    - reset-gpios
>    - backlight
> -  - port
> =20
>  if:
>    properties:

[Severity: Low]
Should port remain required in the conditional then branch for
rocktech,rk050hr345-ct106a?

While densitron,dmt028vghmcmi-1d and ortustech,com35h3p70ulc are MIPI-DSI
panels, rocktech,rk050hr345-ct106a is an SPI-controlled DPI/RGB panel
(driven by panel-ilitek-ili9806e-spi.c with DRM_MODE_CONNECTOR_DPI).
Because it sits under an SPI controller node, the RGB display controller
still needs the OF graph port to link to the panel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111110338.8171=
7-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

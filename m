Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47410169AD2
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260858; cv=none; b=kWsmnGljYzGHPlFGiijFSE7kUa7T+qUY/TkK8x9Guts+ALmSRGLNlQQxggb36qKZeZeDQ8TlMV0hTC6WE4ez6faeuP7kXYpE6Uyo6gNxkz2/CYILRsA4ffqEUgzSolOpIdLk6YteqsRQtOHnsUeEYy9LpBOHj94LJ/EwkGofiyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260858; c=relaxed/simple;
	bh=1sy0SqeqpzzX1PNT3Q3uBBX1PTnbxCXQEIwpfv4JS2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bmGlmLTm+kZe55Uj1ClQbfWppaI0p2ykohAcSdWUIJFGB7QLGZngcvMtLEsHhVJS9pXfAwhqKIRtS1vti50AQUwtRvNdVFrekO/jPH1+IQ0fxQOpL8FsRPrT4Z7XaIlln9hKafphXbFoAZk1wOlUUM0eZnhmVV31WMBJogEpim0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGDGmGcj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGDGmGcj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA971F000E9;
	Fri, 17 Jul 2026 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784260856;
	bh=PwOkEy8C3+8zcielTkx4YVyJzWQmV+QDjPL3dA5zhL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGDGmGcjXIaBSQhsBTXBCkaQ96uPaETinbUeOASHOBgUHTf5xBhKAN70wuaDhIS6P
	 vGwKXLcgv9IiXuMuGfElPzEpP+gIdTEzxh235a3m4tbT7d2eItp/N9R72lBSds+LRv
	 0uQ4R5Jbpeq7hzjntzmpdzw4qCk/YSuD/ui0mvQkL90PUPkVXFaY1cf4BOemocSMZK
	 Gur3IoMT8t+V+pbYMEQ+JWdu/kIcn+nm/3Owz0XzhILAG5Y6k5tReuniGsVX+W1Fqz
	 xs32m82p1mjG/ieAxln+h9/fwZ+HHYcwEHOSumSx6jRa1UMckuMuRO8DgsS29sVuj5
	 y5oZ5riGuLxxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swark Yang" <syang@axiado.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 04:00:55 +0000
Message-Id: <20260717040056.6BA971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The schema enforces a 3-item compatible string chain that unintent=
ionally forces AX3005 devices to inherit an AX3000-specific driver quirk, c=
ontradicting the commit message.
--

--- Patch [2]: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GP=
IO variant ---
commit 53c67e7dc4609ee9e61f57a1d43c9c6ca04d123b
Author: Swark Yang <syang@axiado.com>

dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant

Add binding for the Axiado AX3005 GPIO controller. The commit message states
there are no known changes and it should fall back directly to the
cdns,gpio-r1p02 compatible string.

> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Docu=
mentation/devicetree/bindings/gpio/cdns,gpio.yaml
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> @@ -14,8 +14,11 @@ properties:
>      oneOf:
>        - const: cdns,gpio-r1p02
>        - items:
> -          - enum:
> -              - axiado,ax3000-gpio
> +          - const: axiado,ax3000-gpio
> +          - const: cdns,gpio-r1p02
> +      - items:
> +          - const: axiado,ax3005-gpio
> +          - const: axiado,ax3000-gpio
>            - const: cdns,gpio-r1p02

[Severity: High]
Does forcing axiado,ax3000-gpio into the 3-item compatible string chain
unintentionally cause AX3005 devices to inherit AX3000-specific driver
quirks?

By requiring the axiado,ax3000-gpio compatible string in the fallback chain,
any AX3005 device tree must include it to pass schema validation. The
underlying driver will then match this intermediate string via
device_get_match_data() and apply ax3000_gpio_quirks, such as skipping
initialization of CDNS_GPIO_DIRECTION_MODE and CDNS_GPIO_OUTPUT_EN.

The commit message states the intent is to fall back to the cdns,gpio-r1p02
compatible. Should axiado,ax3005-gpio instead be added to an enum alongside
axiado,ax3000-gpio in a 2-item fallback chain, avoiding the intermediate
AX3000 string entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-upstream-a=
xiado-ax3005-upstream-v3-0-c429095143ec@axiado.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D953822A1
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454820; cv=none; b=RGYgMccB5LsaEPV7XaDWyWAN0IVJEsfYmdciX3lRg/oNDzYR9O9bkspA/kN+pUdnz4VTrK0AXgsHGw/0NbmfcjkQ8AwVTuVEuKQj0GoWgxjE8q7xRX98FnObqWAQk/ORCn4r4W6qGVD+hG75bh1HdT9BW79ciC7XL6iCesdjhVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454820; c=relaxed/simple;
	bh=QaAWdugz0rWgwrfBpQGnEszyijoTQid2T7rN2cjWOqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YVGrgPtGJT5oxqYFGN2j/59w6SvV3s0S7FjkhZzNlEXiDOOJw72G+0CRknl5osuKl49FTwXzc4GVWVpaECzjVSqShuR0/a25933b78GUpAg11LWAfoTfuAu1B4MY9sk4qfEQeAJ0bSekWAAtxI44VjU4ku+LZIqwDlU4Cl9vRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4lu9Pq3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4lu9Pq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C999A1F000E9;
	Fri, 22 May 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779454819;
	bh=UKbHxJPb+Z3Pi1GoEBseLiaeLdTgHra0YjGjV7NQbnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4lu9Pq3ehhVuVSwfFB/J4d9nbC//s/OThmAho4fuooEJOXmDuLpnM+sYjTh+AJFC
	 3Pir7AC0kZE4DAjQDd+GBdVCI9OZxydJVkGGedciuH3nfZsstswCLhcCOX+Nt3nf9e
	 xAVpEK5ebImmFAqFJQ+QOHxbh4uf1hX7Jg3SgFoX5IjZ7SxeF2YP5UYPSu7k15tjV/
	 EWvqHSmmEkCE52yHhNmb5nFC86YGXbsTh2gFknzUyObKXeNkIdAwuHmzrQphnTR17D
	 iSvtemZ5W8jHaQ95JaGrcRPAF6vlhEValfAl/d+AJMFCnDuDl62DwGfHupgVWbMT3s
	 N6xa8BEbF0f8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: display: panel: document the
 Renesas R63419 based dual-DSI video mode Display Panels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-1-16edddda9951@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-1-16edddda9951@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:00:18 +0000
Message-Id: <20260522130018.C999A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect use of `additionalProperties: false` with a `$ref` to a c=
ommon schema, causing validation failures for standard properties.
--

commit d5d9023fc9149b85c30a89eb9e658f1d3b246c85
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: display: panel: document the Renesas R63419 based dual-DSI vid=
eo mode Display Panels

This commit documents the Renesas R63419 generic display driver IC used to
control dual-DSI LCD panels. It introduces a new YAML binding schema for
devices such as the Ayaneo gaming handheld panels.

> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r634=
19.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.ya=
ml
> new file mode 100644
> index 0000000000000..adfdd2c300a35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
[ ... ]
> +allOf:
> +  - $ref: panel-common-dual.yaml#
> +
> +properties:
> +  compatible:
[ ... ]
> +  vdd-supply: true
> +  vddio-supply: true
> +  vsp-supply: true
> +  vsn-supply: true
> +  vci-supply: true
> +
> +  backlight: true
> +  reset-gpios: true
> +  rotation: true
> +  ports: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - vddio-supply
> +  - vsp-supply
> +  - vsn-supply
> +  - vci-supply
> +  - backlight
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false

[Severity: Low]
Should unevaluatedProperties: false be used here instead of
additionalProperties: false?

Because this schema includes a reference to panel-common-dual.yaml in an
allOf block, additionalProperties only considers the properties explicitly
declared in this local file. This requires redundantly redeclaring standard
properties like backlight, reset-gpios, rotation, and ports to prevent
validation errors during dtbs_check.

Using unevaluatedProperties: false would properly evaluate against the
referenced schemas and allow removing the redundant property declarations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-topic-sm86=
50-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org?part=3D1

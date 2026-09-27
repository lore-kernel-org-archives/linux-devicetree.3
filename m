Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB9434988
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534224; cv=none; b=UcEO2ang2wo/RRHL5SBefYYpyYeuJIZ34n2MaqD8i/HXbdBLzxZYvU1NYeM/ieRS4ipN4o93jX89+rUG1dg0546jxJRL3ltjWTY08AylWevkfcXogmDyT/hRMiXDW/elBACCXpog5Rh1q5ETuGo37CNytobeazHQgEhx60EKEso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534224; c=relaxed/simple;
	bh=a72YbicMBu3nuST9M4p02CAc8G1XaJnDfi+N2yPKHuE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDMvpjUyg0da+3qZIBupBV8VqEz2sT6nv/GCvl59YtSLjoYhwAE8dDVKv55S6i9Z+OCT8wKxFv6NPOfD+/MEtThdIQ+T9S7qXNcUx9FUJYzvUAYAg1kg2x8oBUbPa4CMjOU2oVVLAeAE41De1r3fySYjwx/Po7GxHuliQg2Vdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=davDUBk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="davDUBk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB6F1F000FF;
	Sun, 27 Sep 2026 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534222;
	bh=AmAGmdz7yJBOCu3/ATC5ZoeOsQb5TYZWkUrdrNhIISo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=davDUBk5an4VEUQWoFtjOZMNTZPjX3a2EEI6DR0oTVtH7AFyxu4/Lh5PNitIxtrkt
	 YBZsHHjW4F1Oi7xAK6s6xillMuo/9QgaD/va3fIAh0LwlYrYd4WWre8+HotTuaOPjK
	 +eg3c9iMw4E/Fnf322L46wPLSqsxgYuFg4WNz0YJnsCI2F9N2fmvvsDitW68p7mxni
	 kswXKeYwmS6K7CfLWpmqMNDj7VfHJhtHvu6QWMDU+XrHOjEndRpDL7DVcYmqTzdjLA
	 YHNzb/UINqc2lLEsgjrAlNWJRaL6/p56YQWjLHi3j5SfiMZJJVwIoXLhyWR7JW1Fn2
	 iV/TlTiKmaQzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/14] dt-bindings: display: Add Solomon SSD16xx
 e-paper controller binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260927182329.4193961-3-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
 <20260927182329.4193961-3-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:37:01 +0000
Message-Id: <20260927183701.AAB6F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: redefined standard rotation property semantics (clo=
ckwise vs CCW)
- [Medium] dt-bindings: missing panel-common.yaml reference incorrectly rej=
ects panel properties
- [Medium] dt-bindings: missing spi-3wire property definition breaks valida=
tion for 3-wire mode
--

commit 504b4d897333eddd3593a4ba35eae49d79d7d739
Author: Devarsh Thakkar <devarsht@ti.com>
dt-bindings: display: Add Solomon SSD16xx e-paper controller binding

This commit adds a device tree binding for the Solomon Systech SSD16xx e-Pa=
per
display controllers. It covers the 4-wire SPI interface and required GPIO p=
ins
while also noting optional 3-wire mode support.

Link: https://www.crystalfontz.com/controllers/SolomonSystech/SSD1683
Link: https://files.seeedstudio.com/wiki/Other_Display/42-epaper/GDEY042T81=
.pdf
Link: https://www.crystalfontz.com/controllers/SolomonSystech/SSD1673
Link: https://www.crystalfontz.com/controllers/SolomonSystech/SSD1680
Link: https://www.crystalfontz.com/controllers/SolomonSystech/SSD1681

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd16xx.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
[ ... ]
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

[Severity: Medium]
Is this missing a reference to /schemas/display/panel/panel-common.yaml#?

Because this schema acts as a display panel node and sets
unevaluatedProperties: false later in the file, omitting the panel-common
reference strictly forbids standard panel properties like power-supply or
port. This might prevent valid hardware board configurations from passing
schema validation.

> +
> +properties:
> +  compatible:

[Severity: Medium]
Should spi-3wire: true be explicitly declared here in the properties sectio=
n?

The commit message notes that the controller supports 3-wire mode, but neit=
her
this schema nor the referenced spi-peripheral-props.yaml define spi-3wire.
Because unevaluatedProperties is set to false, configuring a peripheral in
3-wire mode with the standard spi-3wire property will erroneously fail sche=
ma
validation.

[ ... ]
> +  rotation:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 90, 180, 270]
> +    description:
> +      Display rotation in degrees clockwise.

[Severity: Medium]
Does defining rotation as clockwise conflict with standard device tree
semantics?

The device tree standard for displays (panel-common.yaml) explicitly defines
rotation as counter-clockwise. Defining it as clockwise here creates a
semantic mismatch that could lead to inverted rotation at runtime if the DRM
driver or generic kernel helpers parse it assuming the standard CCW semanti=
cs.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927182329.4193=
961-1-devarsht@ti.com?part=3D2

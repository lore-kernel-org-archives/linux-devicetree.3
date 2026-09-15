Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DCB360EF2
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464608; cv=none; b=ltd9gzuo55Gqzij9HYF46OCy6MnrDSVsYPfvLkcQuG4/9rU7BaHUXM1sM84+cQHizvFmAWdD/7Ak/G26vWXNdc0u0HGfzui2EM/wj5t1WOXDBqK4q2NdfO/7FfsZ+z9ZWAeWBoGQeHBcBWsYoh/uX7tx+WqIhluGYFpLNXaZTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464608; c=relaxed/simple;
	bh=mVlouF4HyudmCqzHkO98pWtY+ShdRPNRLuawvSZ+B0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lm4LBsDpppcyM6R4SPvVlRwWQkxOjsHKmliJ9+1i2+L03QvRU/8sD1oAPD6bApFX/J8KNl6IhoO60xiWRj344ndd+UGft0rw8Y9pPJrGPCPF4ytFXp+JqU2i2q5MKGQeoBsR7ZZez33uJjTgxREhUhrBszZoXESlZvw3J7LAfOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO20r4D4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO20r4D4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D891F000FF;
	Tue, 15 Sep 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789464605;
	bh=NBx334q4uaVZQyK98WP76o+yghrpB4+RyFUz1Nxu0Gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YO20r4D44eymyQitmZzm0nZsiUWzxk0UIGnBXk7eMgNq2qdiAkzIC448juVYKgvkr
	 21QFg/0oDZWWZ9ZzMRvyqk7WXwua8/lnSNF9lVdOa4D2Ter/C/8wGAEYnZ5lzM4iDO
	 0qCDntO9P3yrCme7Z1XI/thL9djToQgQlhitw/BbQOto7CMsV3obYyAAx526+DkcC6
	 vHU/HI3rmpcd1gTftwpARceZjXG9jYPAODwfbhHqxcl/xSigPI5I7wJE3/pVHXnAKf
	 UilrvZv2L58CX+z2NrYMiD4nUDJ0KYJuwZ+Vk3ez4LG35OH7n7O6u5i/EAmFE2IwWK
	 P6rogy3v2inow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add CAT9532 GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alban Bedel" <alban.bedel@lht.dlh.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915092046.931449-2-alban.bedel@lht.dlh.de>
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
 <20260915092046.931449-2-alban.bedel@lht.dlh.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:30:04 +0000
Message-Id: <20260915093005.84D891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: gpio: fragmenting LED dimmer binding by isolating C=
AT9532 as pure GPIO
- [Low] dt-bindings: gpio: redundant ngpios requirement for fixed-pin hardw=
are
--

commit 5e8f0055659d78276b37db0fd1e766db66fdb2f8
Author: Alban Bedel <alban.bedel@lht.dlh.de>

dt-bindings: gpio: Add CAT9532 GPIO

This commit adds a devicetree binding document for the CAT9532 LED dimmer
as a GPIO controller.

> diff --git a/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml b/D=
ocumentation/devicetree/bindings/gpio/onnn,cat9532.yaml
> new file mode 100644
> index 0000000000000..6f3e3d0f4f29b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/onnn,cat9532.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: On Semiconductor CAT9532 LED dimmer as GPIO controller

[Severity: Medium]
The title explicitly acknowledges the hardware is an LED dimmer, but does
this binding intentionally strip away all LED functionality by isolating it
in the GPIO subsystem?

The ON Semiconductor CAT9532 is functionally identical to the NXP PCA9532
LED dimmer. A comprehensive binding for this hardware family already exists
in Documentation/devicetree/bindings/leds/nxp,pca953x.yaml, fully supporting
both its LED and GPIO capabilities.

Could the onnn,cat9532 compatible instead be integrated into the existing
nxp,pca953x.yaml binding to avoid fragmenting the devicetree representation
of the hardware?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - ngpios

[Severity: Low]
Does this erroneously force ngpios to be provided in all devicetree nodes
using this binding, despite the pin count being fixed?

The CAT9532 hardware inherently possesses exactly 16 pins, and the driver
implemented in the follow-up patch completely ignores the ngpios property
from devicetree, instead hardcoding chip->ngpio =3D 16. Making ngpios a
required property forces devicetree authors to specify redundant, fixed
hardware parameters.

Could this redundant requirement be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915092046.9314=
49-1-alban.bedel@lht.dlh.de?part=3D1

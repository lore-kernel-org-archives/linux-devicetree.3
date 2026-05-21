Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E22494FE
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369648; cv=none; b=NNo4w3WqG9Pc8uz9WZ8en3eWd9LH6Rwsj3tNpeOt2gg4m3/Nimc/GYO6MZBHv/DlEezdtn/wyBhcteq9ugNQ+kX6vRPBbWq+w0kds3k/rZTLALftMV6BayBVP+k7KSmkoewZHif4xIJ43h8GhBtwq/bdS6V1mfx+MtpiXlAVGys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369648; c=relaxed/simple;
	bh=+jRf4uhriOPqmYfD86fU2Fxtikvrtc1cRlxoWUu260s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kPGG+pon09sANwAVV/gmnXvw9XrETOSxaVwJvKemJ/wuZNiOp8GJ+H+c0a6LadvuCkX0AsBuWaem9pOyJ/7zCRlk5tK9xEHZ9h25uieQITO18b/SKJhltmCLHsF+SYombxXzKSFTlTvey2x0OHhrr4jab/lvOr6pZf6r7y4A6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6jNkiBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6jNkiBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5121F000E9;
	Thu, 21 May 2026 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369646;
	bh=eCw9C/LvtkLqPVnvrvDoe/4Pvj+U81XUeCsrbZMJbrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6jNkiByQhPD+NU0LItkCjHvfiEa0fhzVo2Pk4YrWo/8wVTGU6nQ6CuWvFihw08no
	 RXdsf/J8D/dtKF/WO3shGlNB93QwSlTNywyz9VlryaVLQcykSRbIjHIm99DfRgzhub
	 khkXasg+uDuouoOWUnqtwWpa70aP09A4fZIT2+05N2tjy+9uhHqD0nUwA3uJd3KsE/
	 M8//mW1uALJ1NKZmMtP/s2TaPM2lk334kpASJMwwPnIZOBdi9kr56V6DPwSozm1olM
	 a9yEBCzuXQC+AW3A206jlQajJmoVUIke+7UoPzR2KB3wTidY8RExrXd9PiDJST79Mq
	 N07pOczWwgynw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 02/22] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-2-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-2-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:20:46 +0000
Message-Id: <20260521132046.9D5121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `reg` property constraint inside the `^i2c@[01]$` pattern is=
 missing `maxItems: 1` and incorrectly applies numeric constraints directly=
 via `items`, making the validation ineffective.
- [Low] The `anyOf` logic used to enforce mutual exclusion between `i2c-atr=
` and `i2c-gate` is overly complex and redundant.
--

commit 38012c69a8fca6511a921f6751ee84fefe0e14a1
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96717: add support for I2C ATR

This commit adds support for I2C address translation (ATR) to the MAX96717=
=20
device tree bindings. It introduces the i2c-atr property and associated=20
address pools while maintaining support for the legacy i2c-gate property.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..976f6dd2c164c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml

[ ... ]

> +    patternProperties:
> +      '^i2c@[01]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: Medium]
Does this properly validate the reg property? Since dt-schema parses reg as=
=20
a matrix (an array of tuples), applying minimum and maximum directly to=20
items causes JSON schema to silently ignore the numeric constraints, as the=
y=20
are being applied to arrays instead of numbers.

Additionally, the lack of maxItems: 1 allows multiple register regions to=20
incorrectly pass validation.

[ ... ]

> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - anyOf:
> +      - oneOf:
> +          - required: [i2c-atr]
> +          - required: [i2c-gate]
> +
> +      - not:
> +          required: [i2c-atr, i2c-gate]

[Severity: Low]
Is this anyOf block more complex than necessary?=20

The not branch evaluates to true when only one is present or when neither=20
is present, which completely subsumes the oneOf branch. Could this be=20
mathematically simplified to just use the not condition without changing=20
the validation logic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04102423780
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323487; cv=none; b=EMFFmij2f0vrxILUy0OdbzRue4TvkG0fjxh9CvCrneDCZnYTLEYXJTOsvr6Q1g51xeusOO0h4GrL5yICgu6XtJo0+0ePKbJiRhSf9J55tyBqj9goVoB4ol/WFh+3e9j9q+iIKiPSp2I+ZaFZcTLYTtICmp2RZpvDhio9dHARqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323487; c=relaxed/simple;
	bh=xIW0XIoN9at5dZWfr61Udz5IIA6GlolZxiID3+mWbMQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZlN3aPZzhe0gf7z8RbdzKiJGClbtVSwFji31Me0i628YDLN4cevvemiXsWZTjoqxDMDNYozxYLa9Z+HePfP8CQP/i3kZfiVj7yy8SHMyQFCv6Wm3d53GdFQcYcoLtI7XvFGGxmOU0ZwXa8e9Pfl7rl/wne9HIJ/gWkcB6BzcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgUTuzut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgUTuzut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A871F000E9;
	Fri, 21 Aug 2026 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323481;
	bh=8qPfgThyyL364l/iRyJyGOjJkKE5L9rSIGEqO7afDi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RgUTuzutZIRFWZo40zGEpoYmjsAZWfo2QxS9++wLKc9S8c9f6uc44egixrNkOJEjM
	 75kSWxtK6EOYadyM9YBs6VvUV3H2CYgdiMrfLFuYcFrCK2Uqti7uJpd7G6Q/7oRe4u
	 DSOISBTHNEmcDgUXqHWswnfGQ0vc4RmFWQYzkvHZyQbJdaXpwJs+Mhp098gcqz61NW
	 C3oJbFLnHRjrliNp/10TgnkTABk86XKX3udJKPm3E63mB20XtrZaxufN6Nqt7tWA9q
	 KqPWas+4hqPgJyaQwLpgHepDs5aTJ5Tt3drt0tUs0nmbndJTaKFTnpw0AMUwI/6pXx
	 tYf/Hirz6JZJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add Chipwealth CH1115 OLED
 Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Tmljb2zDoXMgQW50aW5vcmk=?= <nico.antinori.7@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <379eb0dbb4a911d80a3af680f647cf13ae0ece32.1787321297.git.nico.antinori.7@gmail.com>
References: <cover.1787321297.git.nico.antinori.7@gmail.com>
 <379eb0dbb4a911d80a3af680f647cf13ae0ece32.1787321297.git.nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 14:44:40 +0000
Message-Id: <20260821144440.D9A871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding incorrectly uses `additionalProperties: false` alongsid=
e an `allOf` `$ref` to `panel-common.yaml`, preventing the use of standard =
panel properties.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: display: add Chipwealth CH1115 O=
LED Controller ---
commit dea96c423e55cd876a4ae165ef9b13a3b42cc6fc
Author: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

dt-bindings: display: add Chipwealth CH1115 OLED Controller

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

> diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.=
yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
> new file mode 100644
> index 0000000000000..9d9c437221312
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

[ ... ]

> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:

[ ... ]

> +  chipwealth,contrast:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description:
> +      Panel contrast.
> +
> +  width-mm: true
> +  height-mm: true
> +  flip-horizontal: true
> +  flip-vertical: true
> +  panel-timing: true

[Severity: Low]
Are these manual redefinitions of standard panel properties necessary?

Since they are already included via panel-common.yaml above, redefining
them locally appears to be a workaround for the additionalProperties: false
schema evaluation issue noted below.

> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +
> +additionalProperties: false

[Severity: Low]
Should this use unevaluatedProperties: false instead?

Using additionalProperties: false alongside an allOf $ref restricts the
schema to evaluate only locally defined properties. This causes it to
incorrectly reject standard properties included from panel-common.yaml,
such as backlight, power-supply, or port.

Changing this to unevaluatedProperties: false allows standard panel
properties to be evaluated correctly, which also removes the need to
manually redefine them in this file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787321297.gi=
t.nico.antinori.7@gmail.com?part=3D1

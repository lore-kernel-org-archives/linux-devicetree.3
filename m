Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6632EC09F
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317263; cv=none; b=d4LDpxRy0ui9O3evycp8NRpOgqfSCSEejFo61HWCTvSTW3x5E/bGPZ2kNzkqc2ZHUvBZ3+mknMu65pFfleYKecJ9PgJ0xsWYq1092IOC+vvOZl5COeJjJ6ivAfjziE8PQRr6LKzvIFgUfURu46+FU/Iu7OoMSJRJADBZsFLMyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317263; c=relaxed/simple;
	bh=J26K/1IIPHZGNBPP4ra14GkgOOM1/Cjag4PAy0dOIG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TfYV9pNu5nUGSr/Xxs43aVJgRpMuM+oguugHjyWk1O7m/FTZagD8HT00MTSzSRSg/X+ZA1+Q/rWB53YRJ/zEG0XF3ZgMaGE6MjCrB4wmKFITNP1ynhUkqWyOCB8dyE+Tn4hSH7wETalJvaD557mHhtR7C6SvJLeFuFw4gr8nlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXqwyGgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXqwyGgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0856A1F000E9;
	Wed, 24 Jun 2026 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782317262;
	bh=is3dic8ucDQEiaLxokZfwOndvkHxUxgIc/RiQ1Eg7Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iXqwyGgXW0Vu21Ay5x6hieJmKN5grMV0fHZaE/KlsTDbJ3PspFzoeje2tkS55Xmtl
	 vIzPGboir3ayvpr0KEkFW82p3lPbpbFHdkNqahwSTduX6tu6wpLX1FOUxj3mLnLrAc
	 bX5XqReCt5WSlRybqTqHdsrFqXTbInxQjFYHsC3Dn7h0dNJ1aq0XBlJO5Lp4HkDDvp
	 O7n/7p65D5g3soXv+EV8uMJu8fTMVqetE60v2cVr5CBgPbKxA1t7fke4Gg5hTVe3Ff
	 XWKb7vLlugyHgIkwtsn3OP6EbK4HBtFznAnyNuQ+8Sq8GUJTQu428N+cT5/Wk5wx9P
	 JB634jCAgTw+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
References: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 16:07:41 +0000
Message-Id: <20260624160742.0856A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect `$id` path in the YAML schema breaks cross-referencing.
- [Low] Undefined properties in the dt-schema example cause validation fail=
ure.
--

commit 637d0c2cb3168267adcc3eaf3f2d6a7d9fd028f5
Author: David Heidelberg <david@ixit.cz>
   =20
ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema

This commit converts the CS35L36 Speaker Amplifier device tree binding from
plain text to YAML schema. It also includes the dai-common.yaml schema for
sound DAI cells and prefix.

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> new file mode 100644
> index 0000000000000..af0acaaefb68e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> @@ -0,0 +1,224 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cirrus,cs35l36.yaml#

[Severity: Medium]
Does this $id field break schema cross-referencing? Since this file is loca=
ted
in the sound/ subdirectory, shouldn't the path exactly match the file locat=
ion
(e.g., http://devicetree.org/schemas/sound/cirrus,cs35l36.yaml#) to allow
dt_binding_check to resolve references properly?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - VA-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>

[ ... ]

> +            cirrus,boost-ind-nanohenry =3D <1000>;
> +            cirrus,boost-ctl-millivolt =3D <10000>;
> +            cirrus,boost-peak-milliamp =3D <4500>;
> +            cirrus,boost-ctl-select =3D <0x00>;
> +            cirrus,weak-fet-delay =3D <4>;
> +            cirrus,weak-fet-thld =3D <0x01>;

[Severity: Low]
Will this example fail validation with dt_binding_check due to the
unevaluatedProperties: false restriction?=20

The example uses cirrus,weak-fet-delay and cirrus,weak-fet-thld, but the
schema defined earlier specifies these properties as cirrus,classh-wk-fet-d=
elay
and cirrus,classh-weak-fet-thld-millivolt.

Additionally, is <0x01> a valid value for the millivolt threshold enum?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-dt-cirrus-=
cs35l36-v2-1-74eccdbd8fe4@ixit.cz?part=3D1

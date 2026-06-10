Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F453E44EA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091417; cv=none; b=uj3L0W6IkEmg331CZn0jLGpPytRLMDIfwbXEpHclygHLbFxyz63xS304g8olX8sZeRahq3AJQq9E/iTvFsEhikQCiccXAl4OwLrvTxob5imxYTHVahI/wgbKo4n4fcMizeA/ISVDzi4PPYtVk1pjRSzRJsXEFr3z3UU48lpU7ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091417; c=relaxed/simple;
	bh=gFuo4vfFNbq1ksipMi/FovTUWkjQJbBP5iWLRSF23kk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XahHnQZzY81YKjag2yuaL8FzKDyKmtp4TB61HR9bGCpHAHP2VHxZGbFfgTlqp5q/FHC7141O8RBH4j2IKeQcwvCtyEPC2a+AnfSb06+rrRXJsTz94BkLXNncIiLVVoAnOVVRcP3xRpbmtHaaxc/5vlqwE4Ocgt0Ia8FygVMgoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLmGvMR2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLmGvMR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72371F00893;
	Wed, 10 Jun 2026 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091416;
	bh=LCCurZQi/xC6pNZNdO56hbjLI1hOzqOBQGxB0VK43os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mLmGvMR2J4EGQy/R8tehW7RGdLW+r6Ah5/VHXwyI+qr6oo2e8mevHeDHss40ekbyD
	 BWoB1d9XTKVR9iFDmvifeo4wiIw4HQ/aiPTruuYaWvmGtasZG5WB0RtDSGNfrEDATl
	 w1rnY68a07D1s8W0MdPKbE5QexQPILrCAiFjHkHKJDyyLq5jwkn9XXbq138jpSgB73
	 jgWPwffXiYaqyJx43zxR9f9Lu0JeU1ZEQLKuw59t2Y5sXK+JDYVwqG1XMq3xITDObe
	 xJXl4WtVncpn99dXDjCzduU4FuysxTOMqHDbiUVHaABMDvK5mMhfnm137TGVo7Zsjf
	 HseJVDfmhUmWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: serial: Add binding for Cortina-Access
 UART
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Li" <jason.lee651024@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610112821.3030099-3-jason.li@cortina-access.com>
References: <20260610112821.3030099-3-jason.li@cortina-access.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:36:54 +0000
Message-Id: <20260610113655.C72371F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The board compatible strings restrict the array to a single stri=
ng, forbidding the required generic SoC fallback.
- [Low] The UART binding example defines a 4-cell `reg` property without sp=
ecifying the parent bus `#address-cells` and `#size-cells`, which causes `d=
t_binding_check` to fail.
- [Low] Alphabetical sorting violation in `vendor-prefixes.yaml` and `MAINT=
AINERS`, breaking devicetree tooling and sorting guidelines.
- [Low] The UART binding uses a generic device class compatible string inst=
ead of a specific implementation string.
--

commit 32a23126a643cf7b114be8e3c3826bc3ea97f447
Author: Jason Li <jason.lee651024@gmail.com>

dt-bindings: serial: Add binding for Cortina-Access UART
   =20
This commit adds a new device tree binding schema for the Cortina-Access
UART controller, targeting the CAXXXX SoC family. It also introduces the
vendor prefix for Cortina Access and a top-level ARM board binding for the
CA8289 (Venus) SoC.

> diff --git a/Documentation/devicetree/bindings/arm/cortina-access.yaml b/=
Documentation/devicetree/bindings/arm/cortina-access.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cortina-access.yaml
[ ... ]
> +properties:
> +  $nodename:
> +    const: /
> +  compatible:
> +    oneOf:
> +      - description: Cortina-Access CA8289 (Venus) engineering board
> +        const: cortina-access,ca8289-engboard

[Severity: Medium]
Will rigidly enforcing a single compatible string cause dtbs_check to fail
on standard board device trees?

Standard ARM platform device trees typically define the board compatible as
an array containing the specific board followed by the generic SoC string.
Should this use an items array to explicitly define and allow both the
board string and the required SoC fallback string instead of const?

> +
> +      - description: Cortina-Access CA8289 (Venus) reference board
> +        const: cortina-access,ca8289-refboard
[ ... ]
> diff --git a/Documentation/devicetree/bindings/serial/cortina-access,seri=
al.yaml b/Documentation/devicetree/bindings/serial/cortina-access,serial.ya=
ml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: cortina-access,serial

[Severity: Low]
Is this compatible string too generic?

The Devicetree specification generally advises against using generic device
class names in compatible strings. Would it be better to name the
compatible string after the first specific SoC implementation, such as
cortina-access,ca8289-uart, and use that as the generic fallback?

> +
> +  reg:
> +    maxItems: 1
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    serial@f4329188 {
> +        compatible =3D "cortina-access,serial";
> +        reg =3D <0 0xf4329188 0 0x30>;

[Severity: Low]
Does this example fail dt_binding_check?

The schema restricts the reg property to maxItems: 1. Because no parent bus
node is defined, the dt-extract-example tool wraps this in a default root
node with 1-cell address and size. This causes the 4-cell reg array here to
be parsed as two distinct register regions, violating the maxItems constrai=
nt.

> +        interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&apb_pclk>;
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -367,6 +367,8 @@ patternProperties:
>      description: Chengdu Corpro Technology Co., Ltd.
>    "^corechips,.*":
>      description: Shenzhen Corechips Microelectronics Co., Ltd.
> +  "^cortina-access,.*":
> +    description: Cortina Access, Inc.

[Severity: Low]
Could this insertion break schema validation due to alphabetical sorting?

The vendor-prefixes.yaml file enforces strict ASCII alphabetical sorting.
A comma (ASCII 44) is less than a hyphen (ASCII 45), so ^cortina,.* should
precede ^cortina-access,.*.

>    "^cortina,.*":
>      description: Cortina Systems, Inc.
>    "^cosmic,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2749,6 +2749,13 @@ F:	tools/perf/tests/shell/lib/*coresight*
>  F:	tools/perf/util/cs-etm-decoder/*
>  F:	tools/perf/util/cs-etm.*
> =20
> +ARM/CORTINA-ACCESS VENUS ARM ARCHITECTURE
> +M:	Jason Li <jason.li@cortina-access.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/arm/cortina-access.yaml
> +F:	Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
> +

[Severity: Low]
Does this entry violate the alphabetical sorting guidelines for the
MAINTAINERS file?

A space (ASCII 32) is less than a hyphen (ASCII 45), so ARM/CORTINA SYSTEMS
should appear before ARM/CORTINA-ACCESS.

>  ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
>  M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
>  M:	Linus Walleij <linusw@kernel.org>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610112821.3030=
099-1-jason.li@cortina-access.com?part=3D1

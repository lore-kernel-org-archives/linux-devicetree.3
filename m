Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F4418A58
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299398; cv=none; b=RUHD+iTtxcR5ncictoxxC2QdP0xLrRJVwCbtCd38SMpPwqU2iTzHagFOFAP4hx/H8YMvdXRnByVbkEN/PqrcEA3/J0bsWiHxqjepUwItoRcRoDuVYGJ99cSfot4X8RNlkObHw79m1elemAgFRfUQCkjG0taCIwWBWEUizA9AlLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299398; c=relaxed/simple;
	bh=JxvWEaAUBGLt0xoIjDBveF6F1BViwPzRMUM29l9xE6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O82UYgT7sshVPhMQOYQ7EMUieYnMdCDhxESTyKLBrpK1F2iy/noMOb+MnyapPMTCnHsB1LUUATn3hi8jeYzScySTxju9xP9+1chKU2+KSDL3xJnmke2UwrTkwCKElyirovLZ2QlTnfwArvR1qFClGI2dS7u4JqXrayGg00LTHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5YTbsvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5YTbsvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7371F000E9;
	Fri, 17 Jul 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299396;
	bh=KkXYtYqIafR1TbIF1jb+QuFEL5YXpy6q/cuEX06IIIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5YTbsvY53I5pUxPBcX04hDv8Dj2H92/A+rcsoW+zBuL61l46A+6KOpyEUvw0PL5z
	 dLmQufHF5xbPyL0SMNloW2wt8IC9CZ9FYW0qOilJeDy4THpN2cupekLYac/HF81YpN
	 zOQ7hgrge8q4wYckMdUDSTm/ettezAkkaamZIaj2ajN6eUcsYt30BpKx9VgpVM2XV9
	 M5rQDwCl4Uf+A6FECcME0iBAdn1bqRfhi/7BC2GvKP78KIRiNtBTVbZ3GIs4uk75Xs
	 kVaMo0VrKCwSraUrO/uBNplLpd6e1Q828ennTPJw1ENf7RjIXmXKoG/+42PFvGev6O
	 VpDbE9QRR+HyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-axp318-regulator-v4-1-50aff97084dd@baylibre.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
 <20260717-axp318-regulator-v4-1-50aff97084dd@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 14:43:16 +0000
Message-Id: <20260717144316.7D7371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `x-powers,axp318w` compatible string was omitted from the co=
nditional block that exempts similar PMIC generations from strictly requiri=
ng the `interrupts` property.
- [Medium] The regex pattern for regulator nodes allows non-existent switch=
ed output nodes (`swout3` through `swout9`) to silently pass validation.
--

--- Patch [1]: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document A=
XP318W ---
commit 08577b06937ca6f13b4a7f204e7f0abb6042c44d
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: mfd: x-powers,axp152: Document AXP318W

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
This patch adds the new compatible string, updates the PWM frequency=20
property list, adds input supply properties, and updates the pattern
for matching switched outputs.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..95b3984fe0f96 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -83,6 +83,7 @@ allOf:
>            contains:
>              enum:
>                - x-powers,axp313a
> +              - x-powers,axp318w
>                - x-powers,axp323

[Severity: Medium]
Should x-powers,axp318w also be added to the earlier conditional block that
exempts PMICs from requiring the interrupts property?

There is another allOf block in this binding that forces interrupts to be=20
required for all devices except a few specific generations:

  - if:
      not:
        properties:
          compatible:
            contains:
              enum:
                - x-powers,axp15060
                - x-powers,axp305
                - x-powers,axp313a
                - x-powers,axp323
    then:
      required:
        - interrupts

Since the AXP318W shares constraints with siblings like axp313a and axp323,
will omitting it from that exemption block cause valid device trees without=
=20
an interrupts property to erroneously fail validation?

[ ... ]

> @@ -277,7 +303,7 @@ properties:
>            Defines the work frequency of DC-DC in kHz.
> =20
>      patternProperties:
> -      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)=
ldo|cpusldo|drivevbus|dc5ldo|boost)$":
> +      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-=
9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":

[Severity: Medium]
Could the swout[1-9] pattern allow invalid switched output nodes to silentl=
y=20
pass validation?

The commit message notes that the PMIC features exactly two switched output=
s,
swout1 and swout2. Allowing swout[1-9] might let device trees with invalid
nodes or typos like swout3 pass schema validation incorrectly. Would a tigh=
ter
pattern like swout[1-2] be more appropriate here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-axp318-reg=
ulator-v4-0-50aff97084dd@baylibre.com?part=3D1

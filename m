Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F723491E1
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701008; cv=none; b=kzyXDyWM6welM8hCjab+c9Z0dbkAeSGSDhe+Yq5lsg1OVs4pig5qKL9vPAZ9uSUSNEjovKQwOrlTJ+o3gtL+h/J5n+jIGpGxP7UC5SEc9mF63PUEWgUKfay0L+HChvTx7xX/3g+6CSs4+tVELffv5p2u6BBasiPjVBHTxzcilL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701008; c=relaxed/simple;
	bh=ZgWG0VqeyWKCgJNoWU2y40VIQIoAHkfCgDBTEonbqWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jV5ygV6xNOc+4TZ5bvijubN84sGNGcnPvRUqm3y+lCWCLTtrFiOp9i1lU7ELhdY3V3bgLfJd9RqjAFUWz43j8vGdT6upCGYEHY2h5/YnucYktgvWK0NaBjGy+u+HABUgSNOs/7qxGKdF12v+LsGJVtK2BGp7az09clGsHknR5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxTWWoSW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxTWWoSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3041B1F000E9;
	Fri, 10 Jul 2026 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701007;
	bh=kgDyw1akXLKjlfNenIOhEex54NLLOT2JOTP4PxRxo14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UxTWWoSWYvjL8gZGKZb7GD44Fv/9IAAiUCM70jOTGdIe1ZvUjbfU4mFjQdr5duSee
	 U51kIqGL+O49UyyeD1OdwhYKIo3rC8iiyWVkK0xVxftC43GmisOAvJDI5k851HVFMG
	 UGleUXh5EdlnQ+M/ZbzNPJU02NR36Zqk6C/MSS3CwPnib2Y/0az7wdU3rthy7l6uZT
	 nPS4GaC9DjbieyZc3QtdPrVTDvTIjUGJsvS0FP5RRY9okRtiodmhxbPQUAKqfPiyoe
	 6I3THuhmP7c3hdORU/zxjknUtWw79JX7fO6ST8JsPpNqCm55ziXNDWoWeS62SAE4mA
	 IpRz7O+LR+TVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: x-powers,axp152: Document
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-axp318-regulator-v2-1-ee5f1c56b49f@baylibre.com>
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
 <20260710-axp318-regulator-v2-1-ee5f1c56b49f@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 16:30:06 +0000
Message-Id: <20260710163007.3041B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema validation will falsely reject `dcdc8` and `dcdc9` no=
des because the regex for regulators was not updated to include them.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: mfd: x-powers,axp152: Document A=
XP318W ---
commit fba0de88525a2ca51e0528a24ed28b5ca4ccd346
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: mfd: x-powers,axp152: Document AXP318W

This commit documents the AXP318W PMIC, adding its compatible string and
input supply properties. It includes new power supply nodes like vin19-supp=
ly
and vin678-supply, and adds swout1/swout2 to the regulator node name patter=
n.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..1bed19fc91ec4 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -156,10 +158,18 @@ properties:
>      description: >
>        DCDC1 power supply node, if present.
> =20
> +  vin19-supply:
> +    description: >
> +      Combined DCDC1/DCDC9 power supply node, if present.

[ ... ]

> @@ -176,6 +190,10 @@ properties:
>      description: >
>        DCDC6 power supply node, if present.
> =20
> +  vin678-supply:
> +    description: >
> +      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.

[ ... ]

> @@ -277,7 +303,7 @@ properties:
>            Defines the work frequency of DC-DC in kHz.
> =20
>      patternProperties:
> -      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)=
ldo|cpusldo|drivevbus|dc5ldo|boost)$":
> +      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-=
9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":

[Severity: Medium]
Will this regex falsely reject dcdc8 and dcdc9 nodes? The commit adds
vin19-supply (for DCDC1/DCDC9) and vin678-supply (for DCDC6/DCDC7/DCDC8), b=
ut
the regex dcdc[0-7a-e] only matches 0-7 and a-e, excluding 8 and 9.

This could cause device trees configuring these new regulators to fail
schema validation.

>          $ref: /schemas/regulator/regulator.yaml#
>          type: object
>          unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-axp318-reg=
ulator-v2-0-ee5f1c56b49f@baylibre.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F636A34C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382350; cv=none; b=Z0TY0/ODIXTL8ajZR66YeGaPjjbysOLnSVLRnWrk9Q4OgzKOKSkZy5HAqKy/eVZKemRu0bz4BO+dk6L9EPRtC0STuRK2nelH/alHcdtY1BWeUXMNXYC+f0YyfBMnB0ZlVOkL5Mfj4AzweTaP6PZU4oe37yg4iebiYemRRkxbvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382350; c=relaxed/simple;
	bh=SruqCj7pyIf4opL1F+WOFL8wOA0NLLPUZbG/1quuH6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l3YjooxM1G97dk7zHAQI0fZKZ9iE5qJ0WQ8i4hOVfuYzONFWvsVnimnJGQ3DNCSyacB0IuaXTbz9VCdXMngSnfhaD1W51b1kDBy5aqvEDYgFFOXpD6iyFtpsc8TDFOQbycg8oL75XHVQMMgqa+H6C5yucL/axf4shbqCuL+tZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqzGav/X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqzGav/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8261F000E9;
	Thu, 21 May 2026 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382348;
	bh=X+i8r8JT+U+EGxsi4XkhSX/9FFpyX4bvxafPC81jNVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JqzGav/XSJLZ/r20QjRWSZc24R/D7PZ1o9sVyjIz9epJPtpmdn9VMvcOVGyizRg++
	 0x/D7/L8rthtNjb6ptZBGhMuEsWazsIrYlX3SF7s6Y4k6zc5bCncv4ZVWkI3We9l6q
	 itvs/xNDwu2i72iHVfMVQJ11fvCZXIEhW0w+qsDPQSxwMdHQPgCPiKePZTMPARn2js
	 +Wmdwe0gLOaQKMgWRdPEg/zo+U6MfaG4oTdAL5UkTuB0BCYLPY+80qtGPAkNbmkNDA
	 XP43T6j+Os2NF9U6OzmvAIk8dkcwEfz8fjjIXzoNHWtwKYvMiXuBX2711jgKHqAIXS
	 uxK4Rj6R59Aeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-sc2730-regulators-v4-2-1ac8a3b5ed82@abscue.de>
References: <20260521-sc2730-regulators-v4-2-1ac8a3b5ed82@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 16:52:27 +0000
Message-Id: <20260521165228.AC8261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the unconditional `$ref` for the `regulators` node with=
out adding conditionals for `sprd,sc2720`, `sprd,sc2721`, and `sprd,sc2723`=
 leaves the `regulators` node unvalidated for those compatible strings.
--

commit 0dc1c5ed599d6def6003f8e26bf5f2c7220c8d77
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

dt-bindings: mfd: sprd,sc2731: Include SC2730 regulator bindings

The SC2730 PMIC provides a different set of regulators from SC2731 and
requires separate regulator bindings. This commit adds conditionals for
sprd,sc2730 and sprd,sc2731 top-level compatibles to ensure the correct
regulator schemas are applied.

> diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml b/Doc=
umentation/devicetree/bindings/mfd/sprd,sc2731.yaml
> index b023e1ef8d3cc..39d26b6ab4779 100644
> --- a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
> +++ b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
> @@ -54,7 +54,6 @@ properties:
> =20
>    regulators:
>      type: object
> -    $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
> =20
>  patternProperties:
>    "^adc@[0-9a-f]+$":

[ ... ]

> @@ -101,6 +100,26 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sprd,sc2730
> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/sprd,sc2730-regulator.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sprd,sc2731
> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#

[Severity: Medium]
Does removing the unconditional $ref leave the regulators node unvalidated =
for
the older compatible strings?

The compatible enum for this schema also includes sprd,sc2720, sprd,sc2721,
and sprd,sc2723. Now that the default $ref has been removed, if one of those
older compatible strings is used, there is no conditional block that applie=
s.

This appears to fall back to an unconstrained type: object schema for those
compatibles, which means invalid or malformed properties within the regulat=
ors
node will silently pass dt-binding checks.

Should there be an additional conditional block for these older PMICs to
ensure their regulators are fully validated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sc2730-reg=
ulators-v4-0-1ac8a3b5ed82@abscue.de?part=3D2

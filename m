Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA863546E7
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731918; cv=none; b=oXH3npTa34oKFfChmDUSMYD4UWiGT9SVTmdJ1jgHM/GhQIZPiIP91wI9t3Mae6AR6vldX4o1L+eM9kfE2k83yLjD8vT3zOyWW9bP1Uam6cD9cQ5TCeSNfxYpD0uzf4hVbOQfJ24HpUb1E1LuUE5q9QeRhdu590HepyfMU2SnYEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731918; c=relaxed/simple;
	bh=Y2/DHTVVIQ5bCPQ22/oNED2PoXjcsoj/njjEJHFgLYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OpgL7ZdhtoUlJ1EAJbHYx6lHLRJSNxEPm8rbcRSFsz0tVfBqiNFO8lHuxNCD2MnRnXpOENgz4HUhbzYU7oiuBTNSsBnOP4LRqBPhCXHVDVrVP7gNPFlb521YFAfGz3Wz79XpCqho1mzoJYbYazSlO2wrUXd2tulPz4avX1j1xXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz/BxkPA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz/BxkPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778FD1F000E9;
	Fri, 14 Aug 2026 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786731916;
	bh=E1M8VOdf4MxxVTVNs74J9EZwhzotWGu/9Mn61bcrb98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nz/BxkPANCEnTgwZPYn+xuH04e+SYd3LRwevu5pGaT4DGOrvT017pro+HBSns+V34
	 JnrvCUoM782x5GrAWJBYhBK7XW7ERnfs5t+9ycegKu/YmDJn7eQm4nMYZZtaJMWZSs
	 MTXHpG99JSOSKdXoyOKMqCzqmcE8x3WFltIZ6eFPReSV2U1qE2vpHJVYHcNeqXlP+A
	 x68+a21M26zO2VMD/CCEfJuJj5JN2X4+wTAmuEOHNq2j858KV7BhSHTAJtTOaaONjF
	 vse0wBhuCZEIKU8Lm4rTh0TaJMLY3NZFnudiFK196ARU2F6n3cixaGLL7yi6gDQSQW
	 CVc00Cl74bY8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: visionox,vtdr6130: Add
 Retroid Pocket 6 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814-rp6-panel-v1-1-111c1aeccf0f@gmail.com>
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
 <20260814-rp6-panel-v1-1-111c1aeccf0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 18:25:16 +0000
Message-Id: <20260814182516.778FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The display driver unconditionally requests the `vdd` supply, ca=
using probe warnings and unnecessary reliance on dummy regulators when `vdd=
-supply` is omitted in the device tree.
- [Low] Relaxation of schema constraints for the original `visionox,vtdr613=
0` compatible string by dropping `vdd-supply` globally instead of using a c=
onditional block.
- [Low] The new vendor prefix `retroidpocket` is undocumented.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: display: visionox,vtdr6130: Add Ret=
roid Pocket 6 panel ---
commit f69298db59942a4fe08895f95f545561dd02eb42
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: visionox,vtdr6130: Add Retroid Pocket 6 panel

The vtdr6130 is a display driver integrated circuit, a common chip used
for various panels. One such panel is used in the Retroid Pocket 6. The
RP6 panel only lists the regulators vddio and vci, so drop vdd as a
required property.

> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtd=
r6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6=
130.yaml
> index c99f4146f1bb0..682f30dc9ee43 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.y=
aml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.y=
aml
> @@ -14,7 +14,11 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: visionox,vtdr6130
> +    oneOf:
> +      - const: visionox,vtdr6130
> +      - items:
> +          - const: retroidpocket,rp6-panel
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Low]
Is the retroidpocket vendor prefix documented in the vendor-prefixes schema?
If it is not recognized, dt_binding_check will output a warning or error.

> +          - const: visionox,vtdr6130
> =20
>    reg:
>      maxItems: 1
[ ... ]
> @@ -25,13 +29,13 @@ properties:
>    vdd-supply: true
>    port: true
>    reset-gpios: true
> +  rotation: true
> =20
>  required:
>    - compatible
>    - reg
>    - vddio-supply
>    - vci-supply
> -  - vdd-supply
    ^^^^^^^^^^^^
[Severity: Low]
Does dropping vdd-supply globally allow invalid device trees for the origin=
al
visionox,vtdr6130 compatible to pass validation if they omit this property?

Could this be handled using an allOf if/then conditional block that keeps
vdd-supply required for visionox,vtdr6130 but optional for the new variant?

[Severity: Medium]
Will the driver unconditionally request the vdd supply, even when it is omi=
tted
for the retroidpocket,rp6-panel variant?

Looking at visionox_vtdr6130_probe() in panel-visionox-vtdr6130.c:

	ret =3D devm_regulator_bulk_get_const(&dsi->dev,
					    ARRAY_SIZE(visionox_vtdr6130_supplies),
					    visionox_vtdr6130_supplies,
					    &ctx->supplies);

Since visionox_vtdr6130_supplies includes vdd, might this cause the driver =
to
trigger a kernel warning during boot and unnecessarily rely on the regulator
framework dummy fallback when the supply is missing?

>    - reset-gpios
>    - port

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-rp6-panel-=
v1-0-111c1aeccf0f@gmail.com?part=3D1

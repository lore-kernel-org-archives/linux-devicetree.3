Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F73ACA68
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022155; cv=none; b=PtgxS5N1PpQwrviYJzUlm1W5fHnWy0JiwDkQLvY6O36dQE1UXVeZvWzxVFc3Z7qRerkUbHoLxwVfH5hGGZk2OkaNFL9/61QjtRZq2k/ul3ZbDTtECeq6fIco9EU+4cKd1tMJpEACu8ojavqv315yT2ZdrTPZsuX5TXXrSCNueko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022155; c=relaxed/simple;
	bh=FhITRzxGq/iseFBmXur5UI61Kte4GjlxGcI3Lg0DxQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DwKbAKQ8uSmJAGcT8gjK5pojeWvjWEORxeF9V5URi8Gk2S/ZvejZJhVJiN8LMM3G7q9XF1tfwiDulLe7xKWoNCNzaMOPzdlzn8vH4kpI1eIZ6c3KJ0jUc0WB0SGdvUa+qkaFuoxMKyuCWyI7mz80kiipblUaQ2LgXtEJowvUHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MM5gNBQk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MM5gNBQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8221F00A3D;
	Tue, 18 Aug 2026 03:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787022152;
	bh=mmlIs2n9rTc40fs0z8kOnpRO45vsNIgxrtFoedioQiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MM5gNBQkwpC9ZUMWVB+QWlo9Etg0MkQlaltONg6GRuD81XtPXg1srwtQe+0dP4mzd
	 8lHXQobbMPas4Bo3e3XNGDweu7KZnvhp2jatSuI8JvGmZBi/R1GDAJ3fp9xqvMSxLc
	 Q6MkWBQvIhrMmssCf8/zf4OJgIKpkDZh2lQ4xVVP8qyN9yVJ+Rye4lFCHMmnmIF2gi
	 BMkNYYmE0lvIXPqL/BS4GIZzSwBY839wjPhbNmDoht+Izn1JCa63dj+sCvTbv2fCct
	 6HBVhHaDU5tfER6xJFKXKNwjkdYaWDTNPY+xFXSpewwnmJKbfd4qk6j9p+8VRor5ty
	 DGtCjKxD+jgUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: net: altr,socfpga-stmmac: Add
 altr,socfpga-stmmac-agilex5-tsn compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817030213.6769-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260817030213.6769-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260817030213.6769-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:02:32 +0000
Message-Id: <20260818030232.9D8221F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string `altr,socfpga-stmmac-agilex5-tsn` was =
omitted from the `if-then` conditional block that configures Agilex5 hardwa=
re constraints, causing incorrect schema validation constraints.
--

--- Patch [3]: [PATCH v5 3/4] dt-bindings: net: altr,socfpga-stmmac: Add al=
tr,socfpga-stmmac-agilex5-tsn compatible ---
commit 2c9b079b75feaedbd6e75247894304aafdd870f8
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

dt-bindings: net: altr,socfpga-stmmac: Add altr,socfpga-stmmac-agilex5-tsn =
compatible

This commit adds the altr,socfpga-stmmac-agilex5-tsn compatible string for =
the
Agilex5 SoCDK TSN Config2 gmac1 path. The integration includes an FPGA soft=
-IP
GMII-to-RGMII converter between the DWXGMAC and the PHY.

> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.ya=
ml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index 63084f7623738..7db6a71029943 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
[ ... ]
> @@ -46,6 +47,9 @@ properties:
>        - items:
>            - const: altr,socfpga-stmmac-agilex5
>            - const: snps,dwxgmac-2.10
> +      - items:
> +          - const: altr,socfpga-stmmac-agilex5-tsn
> +          - const: snps,dwxgmac-2.10
> =20
>    clocks:
>      minItems: 1

[Severity: Medium]
Should altr,socfpga-stmmac-agilex5-tsn also be added to the allOf condition=
al
block for Agilex5 devices further down in the file?

Currently, the conditional block enforces constraints specifically for Agil=
ex5:

  - if:
      properties:
        compatible:
          contains:
            const: altr,socfpga-stmmac-agilex5
    then:
      properties:
        interrupts:
          minItems: 17

Since the new compatible string is omitted here, won't valid device trees
using the new tsn variant fail schema validation because they fall into the
else branch, which incorrectly applies interrupts: maxItems: 1 and
dma-coherent: false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817030213.6769=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D3

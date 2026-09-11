Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072240B11A
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108925; cv=none; b=sj6iGIBh8E+fQBdrwjUpafezHGT5WrUaUUI0DX55Fz1gWJzlvE9lFlU0TH4hh5271E8QQK/iVsmB3bdmd9wg1zEC+uFEie0GiC1yXbC8f3Fr6drNk8yW3MvPT2CnK97at8StNRW/tINX6LPs03OxeqU/qsSDM6pkWavs+pIbn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108925; c=relaxed/simple;
	bh=Y/HMkkqF4wop6Tw/mhRfVX2Ic02J7eyOJEpjnGCuMds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=psG7Awsy3VOqNhccAwqk2ADdTl2ZKC+r5qoTQ4RFdxOkM+9yCRGjAm+KDsicuAJIVqRg3acRC2HxYzEkwpectuaZV0m43w1FooEv7G9Z90I8ObF8OopVjrjD+sahs60EPxSAQSJfT0370DxUFBgiJ2bmesKIAfKa1o17/M/sGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A59CSLwx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A59CSLwx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05F81F000FF;
	Fri, 11 Sep 2026 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789108914;
	bh=5aZtDrp/0lR6zL4DNjGRbATJnHuyebIEUbRVckphiQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A59CSLwxGbuGameiRXRzr7hhalzL9bILu2w6UGoDOBRVvekd7DeQrsDaRSphRVude
	 fQOQZJzxpCfV8sIyOdpv4v5WRVhS3oU6sp93FCv0mlliF9I5pCHxZb+KnD71JGuOmN
	 fHSyWv9Ih0/5OoyM2tZv6p3bZAw24HxYJjymFPqQLy5RO7T92f+9/qL+MHJAqlOgaX
	 JoCPNxV8RfhvWA4TqsYZQGxYZl21S+EWEwNbwEwYVmLqZXn1+PkS07/Lb57m8k36Mf
	 SssEY7krUzMvms3zD9CMmOKCxOhnWLaqAQrGUxd2/yHOJOsmYHnivIdfhSWZ9tkdKM
	 aO3IH5HZE5uwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC EFUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-mt6323-nvmem-v4-1-626dd17531dc@protonmail.com>
References: <20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com>
 <20260911-mt6323-nvmem-v4-1-626dd17531dc@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:41:53 +0000
Message-Id: <20260911064153.C05F81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `efuse` object sets `unevaluatedProperties: false` but omits a =
`$ref` to the base NVMEM schema, preventing the use of standard NVMEM prope=
rties.
--

commit 564a77c7b7cc8f4b6a33fd5c7430ae49a1709346
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE

The MediaTek mt6323 PMIC includes an EFUSE used for storing calibration
data. This commit adds the corresponding devicetree binding documentation.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 3cbc0dc12c319..d2de227ae7a6d 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -159,6 +159,23 @@ properties:
>      required:
>        - compatible
> =20
> +  efuse:
> +    type: object
> +    unevaluatedProperties: false

[Severity: Low]
Does this efuse object also need a $ref: /schemas/nvmem/nvmem.yaml# include=
d?

Because unevaluatedProperties is set to false in properties.efuse without a=
=20
reference to the base nvmem schema, could this cause a schema validation=20
regression? It appears any device tree attempting to use standard nvmem=20
properties (such as read-only, wp-gpios, or #address-cells and #size-cells=
=20
for static cells) in the efuse node will incorrectly fail schema validation.

> +    description:
> +      The efuse is responsible for storing calibration data, such as the=
rmal
> +      sensor calibration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-mt6323-nvm=
em-v4-0-626dd17531dc@protonmail.com?part=3D1

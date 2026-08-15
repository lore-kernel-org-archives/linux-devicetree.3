Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062837F337
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 21:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831123; cv=none; b=D2on1CPgPr1hU/i2SQGj1+H+4izEf0OZ6+F2CQ32T/CYqiyMKFCbkzYz50m3JphOlSHzwHR52f/kqHMeEEubEXQZCT9p5nj8TKcw1WxY+3CYG5ElS1YgfjkwQOCJ4MPHRbVRq9eyNKdJC4lJT8WHnM/NZ1NyJ6bGdMTLYhiLChg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831123; c=relaxed/simple;
	bh=6auTmC3N/BtQ7+pqIC7HvUbBYsef4Te/Gx6MiDGG9zM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y5UM2CrKl15JFW+lBVKsH9bkB8NoUeUPsX18H/3gP6yiI6rXC227G0FEc2ClF+FLZrhuvZlhTh5U5JmW6P0SqRWGYbLGsB1JrV5Sk1d++GlvQgVSIpdoXB7EwPz4hlBojVOd9OFbFXoU35fvy/yZuPgcJVCruPfNZfH2YZx1sYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvrvNHff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvrvNHff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C531F000E9;
	Sat, 15 Aug 2026 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786831121;
	bh=ercBpKRU1k8T5WxJjIOF5PAgbwi5OhHKFSZt96rBNe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvrvNHffTLvw0OHEb/sMjVeIj76j3PddqB8d/GEMhNMdfCsmy1X1kvu8SRifzwJnB
	 VitjflGCm3AgPaBZtXkpe845fg+vX8S9FoHC8qPQbPWifbFNOCEn2GkGfyyH2Fv9Nl
	 5cYpdzu7i0/S8PD22q97JhFV+bD/MX609O3lL3xIu2TC+iAdv3uy0lexpI8c3BpcSX
	 SDcvrfoDpYZWhD1HCujK8sJJDy0gfekd36z85F4fsYzylvR9N4LzcCTHtXrMsHf4dA
	 akgCcaQDnRjXee1OXaFSXylSjDSUx7DxYWePyh8s246gGq+4yjvXrBZon6Mb5rR+56
	 GFEufId/5p7dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260816-ti-davinci-spi-v1-2-a7f57dfd5262@gmail.com>
References: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
 <20260816-ti-davinci-spi-v1-2-a7f57dfd5262@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 21:58:40 +0000
Message-Id: <20260815215841.31C531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `num-cs` property is incorrectly capped at a maximum of 6, a=
rtificially limiting the use of GPIO-based chip selects.
- [Medium] The converted DT schema incorrectly drops standalone support for=
 `ti,dm6441-spi`, breaking backwards compatibility for DM644x device trees.
--

--- Patch [2]: [PATCH 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT =
schema ---
commit e89abf8864b6f9ee684db27ba9936dcad0c1cd48
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: spi: ti,davinci-spi: convert to DT schema

This commit converts the TI DaVinci/Keystone SPI controller binding
from text format to DT schema. It also creates a separate schema for
peripheral properties.

> diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/=
Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> new file mode 100644
> index 0000000000000..81014e9639097
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - ti,da830-spi
> +          - ti,keystone-spi
> +      - items:
> +          - const: ti,keystone-spi
> +          - const: ti,dm6441-spi

[Severity: Medium]
Does this structure accidentally drop support for using ti,dm6441-spi
as a standalone compatible string?

The original text binding documented ti,dm6441-spi as valid on its own,
and the driver natively matches it. This new schema restricts it to
only being used as a fallback for ti,keystone-spi, which will cause
schema validation to fail for existing DM644x device trees.

[ ... ]
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Should contain a phandle to a PM domain provider node
> +      and an args specifier containing the SPI device id
> +      value.
> +
> +  num-cs:
> +    minimum: 1
> +    maximum: 6
> +    default: 1
> +    description:
> +      Number of chip selects supported by the controller. This
> +      includes both internal and GPIO chip selects.

[Severity: Medium]
Should this property be capped at a maximum of 6?

The commit message notes this constraint is based on the maximum
hardware chip selects available. However, since the description explicitly
states this includes GPIO chip selects, imposing a rigid hardware maximum
prevents using an unbounded number of GPIO chip selects.

Device trees using more than 6 total chip selects (such as by defining
num-cs =3D <8> along with a cs-gpios array) will now fail validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ti-davinci=
-spi-v1-0-a7f57dfd5262@gmail.com?part=3D2

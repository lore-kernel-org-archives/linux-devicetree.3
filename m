Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C23624DE
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090176; cv=none; b=jygtJMWqxeB1pzOZ4MOSghnDFQcYI1gYSSs9jo1unqVbh9Mgcl1JGUjuWVZOo/l3MDejEOmzsUAuFPEJ1jyjTeDS2xmOkv/1I0u9ysGSPyyVe9cC9aDErOJmYU9NzPi19iIVz11NA1DS68BZl0CLltQ3xL8YwkqoKaGND2Sau7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090176; c=relaxed/simple;
	bh=xEe6zaLR8n2vH9857lPpnoirB25PAzl9D2cVbJYV99E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uqGao37hXlusQJjdyHIFRVYi4fEenrshh/ubnYxE093tjKSq6apgywgjANGM2rTq+TgWtrdttxlIB358pjL1k+I/hPrxTBntPcUHNEblDfyhroNO97l2Hb4jnztCn33d+/USfj52aBqEJxiNvCr+yOE2JaVqLI6Cye7ox1PmA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjqTVHH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjqTVHH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6C21F00893;
	Wed, 10 Jun 2026 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781090172;
	bh=H5xHhrLNsvC+v9SkPkPm0QsJr4YO2aQaM4v4T/WD5Lw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PjqTVHH/HhMiPaLgscwJ6u0UJoUEfoq77xnV3mYJFQ9ISyRVfO6yn/fcqU0W9SrT3
	 yD2XXbjVX5LLZGt+m2cVXXmr5M5WjxBQIoBCxqJf/s3syfZ0Q6u8S6TwbeGNDNnMA4
	 kGdXzJhFOe9sI/46IGRU2LRi4iBL5fPoq+gmQQxYZyc18qLPeW/W21mOCMdRYTlCRq
	 LTpEiXHppanx2VhcmkORg5uiK/cvpW5CZXgnbjzOfTEVyRQb8z13UAWZudtev7k250
	 HxeHXh3CmmMSTW9QnOZ+s72rrD+YZzDBeRLi/zTjNmqnrNqpOeQEMU35gbvgDxnFJB
	 dxWEHPkvjY6Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: accel: Convert lis302 binding to YAML
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610110051.1228-1-shofiqtest@gmail.com>
References: <20260610110051.1228-1-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:16:12 +0000
Message-Id: <20260610111612.6E6C21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] DT Binding ABI Break (Validation Regression) due to missing lega=
cy property names
- [Medium] DT Schema Validation Regression for Compatible Strings (Array Fo=
rmat)
- [Medium] Architectural Conflict with Overlapping Bindings
- [Medium] Hardware Description Constraint Violation (`interrupts` property)
--

commit 32ffb2a415040f6cd59db09f02686f031f4414c1
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

dt-bindings: iio: accel: Convert lis302 binding to YAML schema

Convert the STMicroelectronics LIS302DL/LIS3LV02D accelerometer device
tree binding from plain text format to YAML schema format.

> diff --git a/Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml=
 b/Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml
> new file mode 100644
> index 0000000000000..befc419f7f397
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml
> @@ -0,0 +1,343 @@
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - st,lis302dl-spi
> +      - st,lis3lv02d

[Severity: Medium]
Will this strict enum definition cause a schema validation regression
by rejecting existing in-tree device trees that use a fallback list? Some
boards use an array format like compatible =3D "st,lis331dlh", "st,lis3lv02=
d";.
Could this be described using items and an enum instead so these arrays
are allowed?

[Severity: Medium]
These compatible strings are already documented and matched in
Documentation/devicetree/bindings/iio/st,st-sensors.yaml. Since
st,st-sensors.yaml uses additionalProperties: false, won't any node using
these compatibles fail dual-schema evaluation when properties like
st,click-single-x or Vdd-supply are evaluated by the other schema?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Medium]
The hardware has two physical interrupt pins, which is reflected in the
routing properties defined below like st,irq1-click and st,irq2-click.
Does enforcing maxItems: 1 here cause validation failures on existing
valid boards that wire both interrupts?

[ ... ]
> +  st,click-double-z:
> +    type: boolean
> +    description: Enable double-click detection on Z axis.
> +
> +  st,click-threshold-x:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Click detection threshold for X axis.

[Severity: Medium]
Since unevaluatedProperties: false is set at the end of the schema, could
defining strict new property names without supporting the legacy names
(st,click-thresh-x and st,click-click-time-limit) cause a regression in
dtbs_check validation for existing in-tree device trees that still use
the older names?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610110051.1228=
-1-shofiqtest@gmail.com?part=3D1

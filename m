Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51E38B131
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387789; cv=none; b=Twzs0Sfur2t7ozx2hoePvyOtORFig4E10ILBa2Dv6KGd8M9BzH53N0JVS0Sz5xRsWdidhGj0U5ionXG/3U2T99TD1LZWzR8BNFyEequc+0bYQCyiqS+4/aoxsoAKCuAgw9L92FSZAXwU9HBqQn/mH7vAt5uylo8hwmEE9n/ES80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387789; c=relaxed/simple;
	bh=Ngjlpevd6QjrRLvZGvmBw5WAZhI/UySjMg+vp0j1kfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OHrOZ+g5F9qMrVCLlMmZ8b33wET11YqvyFqpuk7xetLnGrp4/BYhATiZMEn3HdLOEOxxrGRcaOo5bTJlBLnknP/pT3ttkp5HAIectSKCLAger9/iWvfnJOUjHq7ALbJ/7kKUVoF/h3ZNr7YuKI+c3tyw2n6QIIKSOM8DM3MaRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR5+qYWR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR5+qYWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2731F000E9;
	Thu, 21 May 2026 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779387788;
	bh=UvRttlVKs1g19eqK+2ZrEeLyfCA4g6ExM6RiIFrmp+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NR5+qYWRdDMrEEiXKQOWgQXlbT1Ha5/BxLhtr2iNl5Y2F8luJ7MTuMPy2SADexURS
	 hzTiRJc5dkeacDMd9w+NuZndTsEla+W44LRwFypY4GHx23Zv1FbUd6XvYfj6ImF/M4
	 B/Gn3b+vbgXIqQsIbxQS5vY0kU8wStVteoYyozBMAtNj+iVc9nNZzLzIsNXvw+XW0v
	 t4csZJN3/mgEXj7ne9oXv3qTN1ziwuagQ7AnaA2qQzPaQrnzAk01wALwZ461nQOrCB
	 SOj4j84IraltAomihAx8DkCzvcUynaK7UjWUoDG2/zjGergcspqqOQZAgu+HpSITkf
	 mRC+I4F4w82hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] dt-bindings: iio: temperature: Add ADT7604
 support to adi,ltc2983
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521164323.770626-8-liviu.stan@analog.com>
References: <20260521164323.770626-8-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 18:23:07 +0000
Message-Id: <20260521182308.4E2731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The new compatible string 'adi,adt7604' is omitted from the existin=
g conditional block that disables '^temp@' nodes, violating subsystem guide=
lines.
- [Low] The schema allows invalid 'adi,sensor-type' values in '^rtd@' and '=
^thermistor@' nodes for the ADT7604.
--

commit fbbcd3bcbfbb106e48a6545868dd2b27a56b39b5
Author: Liviu Stan <liviu.stan@analog.com>

dt-bindings: iio: temperature: Add ADT7604 support to adi,ltc2983

This commit adds support for the ADT7604 to the LTC2983 binding schema. It
introduces the adi,adt7604 compatible string and adds two new sensor node
types: copper-trace@ and leak-detector@. It also adds conditional checks to
restrict unsupported nodes for the ADT7604 device.

> diff --git a/Documentation/devicetree/bindings/iio/temperature/adi,ltc298=
3.yaml b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> index a22725f7619b7..14cfa28809edd 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
[ ... ]
> @@ -477,6 +597,22 @@ allOf:
>        patternProperties:
>          '^temp@': false
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adt7604
> +    then:
> +      patternProperties:
> +        '^thermocouple@': false
> +        '^diode@': false
> +        '^adc@': false
> +        '^temp@': false

[Severity: Low]
Since ADT7604 shares the ^temp@: false constraint with the existing devices,
should adi,adt7604 be added to the existing compatible enum block instead of
duplicating the ^temp@ restriction in this new conditional?

[Severity: Low]
The commit message mentions that ADT7604 repurposes the custom RTD sensor t=
ype
(18) and custom thermistor type (27).

However, the schema doesn't restrict adi,sensor-type =3D <18> inside ^rtd@ =
nodes
or adi,sensor-type =3D <27> inside ^thermistor@ nodes for the adi,adt7604
compatible.

Should these restrictions be added to this block to prevent invalid device
tree configurations from passing validation?

> +    else:
> +      patternProperties:
> +        '^copper-trace@': false
> +        '^leak-detector@': false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521164323.7706=
26-1-liviu.stan@analog.com?part=3D7

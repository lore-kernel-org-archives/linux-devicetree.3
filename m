Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84F4968FE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814678; cv=none; b=Nuv6Gir36fqf6NWG9tCqYpXcHB3ovrNhIn2yeOfUH7ETB5Qp2abb4ZilFDe97X2NGEutQy5SnQx/EMKdCLbWnxsSyi5zh0zxhmfE7T9mjud2EwwE+pM7M6vqDAVjCu6pyBAzc5u4QLeAGZ/rFUmCqWatBm7396iYL3Md/F4PBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814678; c=relaxed/simple;
	bh=AwR57hfaLtd3jD9g7dgRymVFOi28vG9DQ27Jd8QY4ds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WyTTNodBPRYVCgK2Een/dGeWRgyoX16lXjnpa6jw8F+0M6m4SoqfTw1qq1iv70FrAl1kHrFZZqq94hk6O/0hqSK8A8mmhMlAY9om7dSLBkFz0DbcMBgNlkNY/SzxhsXGjiG6ZOmzMOaL/h+nSBUCYsDEXTWq+d++89gRU9Tcb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF451F00A3D;
	Thu, 23 Jul 2026 13:51:15 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: iio: dac: add support for MCP48FEB02
 SPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723-mcp47feb02_refactor-v1-2-ee59e63672bc@microchip.com>
References: <20260723-mcp47feb02_refactor-v1-0-ee59e63672bc@microchip.com>
 <20260723-mcp47feb02_refactor-v1-2-ee59e63672bc@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 13:50:59 +0000
Message-Id: <20260723135115.2AF451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema retains `additionalProperties: false` at the root lev=
el while introducing a conditional `$ref` to `spi-peripheral-props.yaml` in=
 the `allOf` block. This breaks schema validation for standard SPI properti=
es.
- [Low] The newly added SPI device tree example uses an inappropriate SPI c=
hip select value (`0x60`), copied from the I2C device address example.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: iio: dac: add support for MCP48FEB0=
2 SPI ---
commit a357ffde05c7807cd64bca71103d780d8dde416b
Author: Ariana Lazar <ariana.lazar@microchip.com>

dt-bindings: iio: dac: add support for MCP48FEB02 SPI

This commit adds SPI support for the MCP48FxBy1/2/4/8 DAC families to the
existing MCP47FEB02 device tree binding. It introduces the new compatible
strings, the spi-max-frequency property, and a devicetree example for SPI.

> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb=
02.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.ya=
ml
> index d131f136bd151..d25c763241a4f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
> @@ -178,6 +239,13 @@ required:
>    - vdd-supply
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: "^microchip,mcp48f[ev]b[0-2][1248]$"
> +    then:
> +      $ref: /schemas/spi/spi-peripheral-props.yaml#

[ ... ]

> +    then:
> +      properties:
> +        spi-max-frequency: false
> +
>  additionalProperties: false

[Severity: Medium]
Since this schema now includes a conditional $ref to spi-peripheral-props.y=
aml
in the allOf block, should this be changed to unevaluatedProperties: false?

JSON Schema limits additionalProperties: false to only evaluating properties
explicitly declared in the root properties or patternProperties. Any standa=
rd
SPI properties pulled in via the conditional $ref will be incorrectly rejec=
ted
by dt_binding_check.

>  examples:
> @@ -299,4 +424,29 @@ examples:
>              };
>          };
>      };
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dac@60 {
> +          compatible =3D "microchip,mcp48feb02";
> +          reg =3D <0x60>;

[Severity: Low]
Is 0x60 intended to be used as an SPI chip select here, or was this copied
from the I2C example?

Typically, an SPI chip select would be 0 or 1, and the node would be named
dac@0 with reg =3D <0>.

> +          vdd-supply =3D <&vdac_vdd>;
> +          vref-supply =3D <&vref_reg>;
> +          spi-max-frequency =3D <10000000>;
> +
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +          channel@0 {
> +            reg =3D <0>;
> +            label =3D "Adjustable_voltage_ch0";
> +          };
> +
> +          channel@1 {
> +            reg =3D <0x1>;
> +            label =3D "Adjustable_voltage_ch1";
> +          };
> +        };
> +    };
>  ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mcp47feb02=
_refactor-v1-0-ee59e63672bc@microchip.com?part=3D2

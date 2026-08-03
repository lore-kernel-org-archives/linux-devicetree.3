Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2DEEA8;
	Mon,  3 Aug 2026 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795512; cv=none; b=mCX8Hxaay58xShmkD9hJMJBrAzgoHvcCgyf3DmOwftVbPSarwQ6gl9uLA9rhGcNxPc8c1Z7sT0447cLC4s2MbXSsQNzVBzE3b4dGjNEB+ZFG9BJ4kFlxOQn4C0gMF/SOVrT2qxVAdlJBIiF3dbrBmZ+eFrHQ7vVrrbzMiP1oJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795512; c=relaxed/simple;
	bh=my4Y1+wmf3sMwspSF+4bGvbRTH4U+vqqwKX8SBPxYnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvWT9qouRAY2TY1vvSpjyk38BS4lSX4JEBDzRiELgLL9VL8qtAeg4Qlr05FkwW8CWJcbKCKqFoj6ZZYF1a6BSyFURTgAKdPS/p8d4MCuqy6xw6rzsaviiGvIiTeSMcrMujt9P8+9Hc1coXzZ+MN3gIo5jIl4jeYl9dIo9hrDqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbeYKtw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbeYKtw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAB51F00A3A;
	Mon,  3 Aug 2026 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785795511;
	bh=ZDYaoH2ZhDHFaQRTgoESAI5O+FdsRsQMwdsTlUSbNQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbeYKtw1mM5R7QCesGMwI7BV14gRJ0qYwWk/qAZAUoHn3RCj79eoHrccHuV/ejmJ1
	 hiypYB7My3emEKKS0d5kd+af4XwUacG1TAVAuPsN7Q9wlKgRU3huXlHbWlSiBv5aul
	 34ml617ss7jw8Eq67JTWt+6/+Lyw2C3qy9a1FqW5y6elrUQbK9N4sdoZ7iQkN2keDf
	 MftuGHGeeoAjnPSF6zp2mKwi0udAGcJdoPwa0aG9foaTI39Th7a5aZsdQ8ln4q3grv
	 9tB7nb8i/+r0hJLGtVqkVOtgA1jcrZfptmKs34Xh7/a9IeD53fozldmCdWoWTBe3hj
	 8jcY0COEuN8hw==
Date: Mon, 3 Aug 2026 17:18:30 -0500
From: Rob Herring <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: power: Convert TI SmartReflex to DT schema
Message-ID: <20260803221830.GA726471-robh@kernel.org>
References: <20260730092454.52466-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730092454.52466-1-egbostina@gmail.com>

On Thu, Jul 30, 2026 at 12:24:54PM +0300, Eduard Bostina wrote:
> Convert the Texas Instruments SmartReflex bindings to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/power/ti,smartreflex.yaml        | 70 +++++++++++++++++++
>  .../bindings/power/ti-smartreflex.txt         | 47 -------------
>  2 files changed, 70 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/ti,smartreflex.yaml
>  delete mode 100644 Documentation/devicetree/bindings/power/ti-smartreflex.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/ti,smartreflex.yaml b/Documentation/devicetree/bindings/power/ti,smartreflex.yaml
> new file mode 100644
> index 000000000..b2dc59b4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/ti,smartreflex.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/ti,smartreflex.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments SmartReflex
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description: |

Drop '|'

> +  SmartReflex is used to set and adjust the SoC operating points.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap3-smartreflex-core
> +      - ti,omap3-smartreflex-mpu-iva
> +      - ti,omap4-smartreflex-core
> +      - ti,omap4-smartreflex-mpu
> +      - ti,omap4-smartreflex-iva
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,hwmods:
> +    description: Shall contain the TI interconnect module name if needed by the SoC
> +    $ref: /schemas/types.yaml#/definitions/string

deprecated: true

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    smartreflex@4a0db000 {
> +        compatible = "ti,omap4-smartreflex-iva";
> +        reg = <0x4a0db000 0x80>;
> +        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +        ti,hwmods = "smartreflex_iva";
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    smartreflex@4a0dd000 {
> +        compatible = "ti,omap4-smartreflex-core";
> +        reg = <0x4a0dd000 0x80>;
> +        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +        ti,hwmods = "smartreflex_core";
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    smartreflex@4a0d9000 {
> +        compatible = "ti,omap4-smartreflex-mpu";
> +        reg = <0x4a0d9000 0x80>;
> +        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +        ti,hwmods = "smartreflex_mpu";
> +    };

One example is enough.

Rob

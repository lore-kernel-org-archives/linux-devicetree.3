Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AC2749DC;
	Thu,  4 Jun 2026 01:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780537636; cv=none; b=J3UEB+h090J0XOMAab8L2sZYB425kP1/lk1vFiA0L/ykdDvZN6c9M+nJ7tt+cgI/tBWMSY/hxGmoabTB3aR5D4+mJIZD6gFH9jNPr97RDui5izpbfZcqtoa3RmRnd78dwoDhcTFNJGxChEa3O+T5qXDZCB5dezm8SDHyRUMBq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780537636; c=relaxed/simple;
	bh=UMwyZf/uKr+FZ8yBlfVfuUbz6t9g0HNZRLt+heTYhIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mu9G51+fXitRnbSOGhEr1mZ0ntaa5KdJWbqBDhcNb/ruaN1JfYerbpbBHLacwbl3NCtHvTEZ79luMRxeZLcfsg+Xr/2JFqzjrbDuXdywSwcNOt7w2jFBWSEsUBult508O1NRUlPoS/5BTV5+cD58Nm//Dg5vNpg+CHvQBfhXc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9KE8GwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9KE8GwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B462B1F00898;
	Thu,  4 Jun 2026 01:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780537635;
	bh=B1/4QNZrjCVuXvK5agPN2ARKZz6GtIJ7tiYvtXOug94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L9KE8GwLkuM+TtfWZd1UYzDn2pG4LUYkRe3PoIH6R63B87VzB793SUBqiAptWLFtV
	 fGfC2Cc3xMboII64HEAIRpzs5qvOIDzT7HrfVOozK4tCKb9Dg/M4CZlAxavWtSkHNe
	 /fLwi1wVN9Gt5zMiiqahnRkgOytqA4nEDBJXycbz83R6nRRL2kH/bT3mCoJTjSLXW4
	 w2rgae/UttLLJK7oa2iXDWHA0Qc3dYlzVc4InCNlZqLE9yttgmCl6Emp8/82GLIwot
	 eCngV0FnT6GFwhJ/QMK0ov3tpf7eLyfF9KmgciEGloKvcqiCHlq0YVgZmkocpw6wW1
	 Dkslbh8Gcls+A==
Date: Wed, 3 Jun 2026 20:47:13 -0500
From: Rob Herring <robh@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] regulator: dt-bindings: mt6311: Convert to DT schema
Message-ID: <20260604014713.GA2331501-robh@kernel.org>
References: <20260531165712.729635-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531165712.729635-1-ninadnaik07@gmail.com>

On Sun, May 31, 2026 at 10:27:12PM +0530, Ninad Naik wrote:
> Convert mediatek,mt6311 to DT schema.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  .../regulator/mediatek,mt6311-regulator.yaml  | 72 +++++++++++++++++++
>  .../bindings/regulator/mt6311-regulator.txt   | 35 ---------
>  2 files changed, 72 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
> new file mode 100644
> index 000000000000..a51db46b0f41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6311 Regulator
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  The MediaTek MT6311 is an I2C power management IC that provides one step-down
> +  converter and one low-dropout regulator. The regulators are named VDVFS and
> +  VBIASN, respectively.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6311-regulator
> +
> +  reg:
> +    description: I2C slave address.
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: List of regulators provided by this controller.
> +
> +    patternProperties:
> +      "^(VDVFS|VBIASN)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        description: |
> +          Regulator nodes.

Drop. That's obvious with the $ref.

> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mt6311: pmic@6b {

Drop unused label.

> +        compatible = "mediatek,mt6311-regulator";
> +        reg = <0x6b>;
> +
> +        regulators {
> +          mt6311_vcpu_reg: VDVFS {

Drop unused label.

> +            regulator-name = "VDVFS";
> +            regulator-min-microvolt = <600000>;
> +            regulator-max-microvolt = <1400000>;
> +            regulator-ramp-delay = <10000>;
> +          };
> +
> +          mt6311_ldo_reg: VBIASN {

Drop unused label.

> +            regulator-name = "VBIASN";
> +            regulator-min-microvolt = <200000>;
> +            regulator-max-microvolt = <800000>;
> +          };
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
> deleted file mode 100644
> index 84d544d8c1b1..000000000000
> --- a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Mediatek MT6311 Regulator
> -
> -Required properties:
> -- compatible: "mediatek,mt6311-regulator"
> -- reg: I2C slave address, usually 0x6b.
> -- regulators: List of regulators provided by this controller. It is named
> -  to VDVFS and VBIASN.
> -  The definition for each of these nodes is defined using the standard binding
> -  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
> -
> -The valid names for regulators are:
> -BUCK:
> -  VDVFS
> -LDO:
> -  VBIASN
> -
> -Example:
> -	mt6311: pmic@6b {
> -		compatible = "mediatek,mt6311-regulator";
> -		reg = <0x6b>;
> -
> -		regulators {
> -			mt6311_vcpu_reg: VDVFS {
> -				regulator-name = "VDVFS";
> -				regulator-min-microvolt = < 600000>;
> -				regulator-max-microvolt = <1400000>;
> -				regulator-ramp-delay = <10000>;
> -			};
> -			mt6311_ldo_reg: VBIASN {
> -				regulator-name = "VBIASN";
> -				regulator-min-microvolt = <200000>;
> -				regulator-max-microvolt = <800000>;
> -			};
> -		};
> -	};
> -- 
> 2.54.0
> 
> 

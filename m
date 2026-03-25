Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85ED347BD9;
	Wed, 25 Mar 2026 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473861; cv=none; b=bFmO4r6SsY8Pj+RefWIaX7/No2TQDmryqpqJMYmK8hTwDFTkhfHFg9ajO86dPVcn6qGVGsAiOQGlfVqbJYzVle0Y251nuk5RKBnKuNZIGP3LRSHQjjfmn7h66TuRMHW1k8c26LHN96MbuYBexuQ7XA7RudheB0y7L7lbTXO2xX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473861; c=relaxed/simple;
	bh=3UftVOg0IFr5tv5Ygg1Rl9xOsfEycN0eTd8jj+exBEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHBLkCMDWXrzF8AfFbRNfWcDCdS+0ACkv2rBh1JpYZB99HCu2zYqRNKytUDFVJKksY3rRbQiZ94UpFx6FLM0toHKMXEPuvnXIBPUaJyVIUvIl4R0QPrj32PWMV++6Otov5TGpBNKnZ+N972NtTcDlbF1pHnyoHvnQrYpN3iH2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABYaTHDJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABYaTHDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3C8C4CEF7;
	Wed, 25 Mar 2026 21:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774473860;
	bh=3UftVOg0IFr5tv5Ygg1Rl9xOsfEycN0eTd8jj+exBEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABYaTHDJCxD2Rdaj6onhotLxYuolk0jrQq6U6uiOhF+7johkhRFDsSvvJyyoJYC/7
	 jCnH5B6sTwvL7z6be+/eemFjeREt9l9NK7CDq9s5cNNT/3/WjkzdNHCER/51uV7cmH
	 WlCH33L2U61scEZxaaXZuvZI2+jILRHE2iyFBrACqKJW73PmiRePmci0rsBsmcK7Dt
	 pNKldo8aqplNuBxolMhsoAhqshXOUQO1hO0FLe6GRaKkrQu84aTz1MC+6ubPaocfeR
	 bnlpKDUGAg2OqelXRZi1THJbcI9wUWr9VGhfIKtulswHucLix9xgXM6UjgL4S14pU3
	 LarhOT1eLLINg==
Date: Wed, 25 Mar 2026 16:24:19 -0500
From: Rob Herring <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v8 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20260325212419.GA4024060-robh@kernel.org>
References: <20260323062737.886728-1-lakshay.piplani@nxp.com>
 <20260323062737.886728-4-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323062737.886728-4-lakshay.piplani@nxp.com>

On Mon, Mar 23, 2026 at 11:57:33AM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

All these patches need your S-o-b tag. 

> 
> ---
> Changes in v8:
>  - Add compatible in i3c example
> 
> Changes in v7:
>  - Fix schema validation issues
>  - Adjust required properties
>  - Add I2C example
> 
> Changes in v6:
>  - Use a vendor prefix for the attributes
> 
> Changes in v5:
>  - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
>    tp0145-ldo-microvolt, tp2367-ldo-microvolt
>  - Changed supply entries and its descriptions
> 
> Changes in v4:
>  - Fixed DT binding check warning
>  - Removed SW properties: ibi-enable, local-dev, and always-enable
> 
> Changes in v3:
>  - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
>  - Added Regulator supply node
> 
> Changes in v2:
>  - Fixed DT binding check warning
>  - Revised logic for parsing DTS nodes
> ---
> ---
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 304 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 312 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 000000000000..f588fd8318a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,304 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP P3H2X4X I3C HUB
> +
> +maintainers:
> +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +  - Vikash Bansal <vikash.bansal@nxp.com>
> +
> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
> +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
> +     peripheral devices on the downstream  side.
> +  2. Have two Controller Ports which can support either
> +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
> +     peripherals.
> +
> +properties:
> +  compatible:
> +    const: nxp,p3h2840
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  assigned-address:
> +    maximum: 0x7f
> +
> +  nxp,tp0145-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  nxp,tp2367-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  nxp,cp0-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 0, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,cp1-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 1, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,tp0145-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 0/1/4/5, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,tp2367-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 2/3/6/7, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  vcc1-supply:
> +    description: Controller port 0 power supply.
> +
> +  vcc2-supply:
> +    description: Controller port 1 power supply.
> +
> +  vcc3-supply:
> +    description: Target port 0/1/4/5 power supply.
> +
> +  vcc4-supply:
> +    description: Target port 2/3/6/7 power supply.
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      ldo-cp0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-cp1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-tpg0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-tpg1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - reg
> +
> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    unevaluatedProperties: false

This is a child I3C bus, right? You don't support any devices on the 
bus. You need a $ref to i3c.yaml.

> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +

> +      '#address-cells':
> +        const: 3
> +
> +      '#size-cells':
> +        const: 0

Then these 2 can be dropped.

> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"

And these 2.

> +
> +  "^(i2c|smbus)@[0-7]$":
> +    type: object
> +    unevaluatedProperties: false

Likewise, you need a reference to i2c-controller.yaml.

Rob

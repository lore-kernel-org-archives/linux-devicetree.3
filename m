Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190AE2FD1C2;
	Sun, 22 Mar 2026 23:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222513; cv=none; b=Z4DTlXgFJiAwOPjQDtgjTKDsyohw8qy2x2u57H8IXIPT873aviZSI0+z/2qwNYMmZQcIWQ0e4J6yZVcKWLoYwwwWa4Fj3UZwcmQLN3q/YueOCyD5U5eIeZPMVdd45InfTGUv7WbIr13ie2Ck5PTIz/9Wo9iPU7SaBg/zqgss4qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222513; c=relaxed/simple;
	bh=Ri2XO0FRCm/AQC69Y7/yiRkrFDypS4Sf3lBTGwO2Cj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+oaxCH8FykQSkL7ka542PU44YvEzJc9LwQ2g9cNSa1cn1Kes/kDIu0IX39MTcqL0dQrSB9J6q6JHSmB79E2O+yBJL4UBD1jP3yM3SM1AtEJQLNuUVuY+YuSHz717v1b5Nd5J8gr0GRhKpH3NDifb3hzJPEdxZAswVuk9/ElvKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJjTBDiI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJjTBDiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89799C19424;
	Sun, 22 Mar 2026 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774222512;
	bh=Ri2XO0FRCm/AQC69Y7/yiRkrFDypS4Sf3lBTGwO2Cj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJjTBDiIGGTwBzFDT8QcTO/uzsuyg57sVwapN1/YeViEMULkUxLrBsq7pLiMNaukZ
	 VInPeSdsAFQTF02mgA2VnOqFkf6ON6Z9ZV+t9ytZfMTRPvUuS8fIDvzdyuULSKfQKQ
	 No0nUXY0ECd3hep+YmAllEOrKFrGnNudYFWZHNBre6BbI4SvlIqhwxR5s25vAMC+HC
	 UIGf/NYPOgDkcSI+W9Xul0eazjllV7WI06pMicNKeNzJM9y2kLuhO25Bf6PbGSFoIQ
	 Vna2pgjqKoxPZEyrXb9Py6FSbgv8s2yw85qiuGx/JHByxszJ219VifR8VIeKNCsVA/
	 KqhtR41+0ZJww==
Date: Sun, 22 Mar 2026 18:35:11 -0500
From: Rob Herring <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v7 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20260322233511.GA72130-robh@kernel.org>
References: <20260319112441.3888957-1-lakshay.piplani@nxp.com>
 <20260319112441.3888957-4-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319112441.3888957-4-lakshay.piplani@nxp.com>

On Thu, Mar 19, 2026 at 04:54:37PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
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
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 303 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 311 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 000000000000..495e0e4c1ae1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,303 @@
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
> +
> +  "^(i2c|smbus)@[0-7]$":
> +    type: object
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
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
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c {
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +
> +        hub@70,236153000c2 {
> +            reg = <0x70 0x236 0x3000c2>;

Once again, you must have a compatible. "The device is discoverable" is 
not an argument. If it is discoverable, then don't put the device in DT 
in the first place.

Rob

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B134B19F;
	Sun, 19 Jul 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784443807; cv=none; b=H6c7dWc11/WCg31V/ddQEFgLXnWnZd6vGw3oaX9t42b2ZI4NSYTvyt+1mYthnguwCOFjXnqe6NmwQ9k3cuSMECX5E06EE9uUr/4cO9QRAuJpUGajXZvwg8HIYabmyBC5Zg/gop9iGUqfsHu9fc3Pd+vuje87mmBCauvgs1mTVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784443807; c=relaxed/simple;
	bh=Z6LGqhCPCN1RkG5IAOCmUO0bkRvp1z2N11fPaZtKQbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BC4wZcWtSVxf28oLfWHOnT+4ohqnRTEkQoBQE/QobuLtwlPca2XhqOhqagTnprUwFHIvrPCIiFR3Abp5tYioEh1Lg0iZp5ZKpWZng1wy2y/SV4fKBq9Wk3ZIjGP/xlr9Nj6/3I+56XbRy/QH73OK86AT42o4aMk+J2JiyBxXUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+F4dZkv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+F4dZkv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E971F000E9;
	Sun, 19 Jul 2026 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784443804;
	bh=9PZVOUhVF1f1WpYMsMO5E6vmoYmxZuuCE38ucE6Txw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I+F4dZkvi4Q4teI5yrCpJinHTKO+N/VCV3GVTJFlF5MRKZgS3/qwSzcjQGeRMrlj+
	 rwR9QfZn9aQnT29ShDOeWTCg7RPt3Sz5ywQaPuSO2xtefNgNWBN1cUxvbM4XABkqSH
	 vnR0p5FSdypgASNaPqb4dCmmEAaZ3Vqfk9mi+/JvliGnOmKnuDBfZjbsA4MDF7fLnr
	 rjoFeyUFUCf+G28K+evNy60nQU59wS03W5sbQzy3NECWIbCcX5PlI+OKNN9kpnamro
	 VkbnYMm4vL13u5Rf0u6i48kM2VR7iquY2UeCWdwAw5PmkSCoEWNEaFaj8lJp2J5uR+
	 dgusrF3yJzBEg==
Date: Sun, 19 Jul 2026 08:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Message-ID: <20260719-sloppy-cornflower-hippo-8212e2@quoll>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-1-4f9e87a61463@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-glymur_linkmode_0717-v5-1-4f9e87a61463@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 02:58:33AM -0700, Qiang Yu wrote:
> diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
> new file mode 100644
> index 000000000000..73550f77e9b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml

Filename: qcom,glymur-qmp-gen5x8-pcie-phy.yaml

> @@ -0,0 +1,176 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-pcie-multiphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMP PCIe multiple link-mode PHY controller (PCIe, Glymur)
> +
> +maintainers:
> +  - Qiang Yu <qiang.yu@oss.qualcomm.com>
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> +
> +description: |
> +  The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> +  PCIe3a/PCIe3b controllers. This block supports two link modes, selected
> +  at runtime via a TCSR syscon register:
> +
> +  1. x8 - a single 8-lane PHY instance is exposed (PCIe3a only)
> +  2. x4+x4 - two independent 4-lane PHY instances are exposed (PCIe3a and
> +     PCIe3b)
> +
> +  The node always describes both PHY instances ("port a" and "port b"),
> +  regardless of which link mode is active on the board.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-qmp-gen5x8-pcie-phy
> +
> +  reg:
> +    minItems: 2

Dop

> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: port_a
> +      - const: port_b
> +
> +  clocks:
> +    minItems: 10

Drop

> +    maxItems: 10
> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: cfg_ahb
> +      - const: ref
> +      - const: rchng
> +      - const: pipe
> +      - const: phy_b_aux
> +      - const: cfg_ahb_b
> +      - const: rchng_b
> +      - const: pipe_b
> +      - const: pipediv2_b
> +
> +  power-domains:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: phy_a_gdsc

port_a

> +      - const: phy_b_gdsc

port_b

> +
> +  resets:
> +    minItems: 4

Drop

> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: phy_a

port_a

> +      - const: phy_a_nocsr

port_a_nocsr

etc.

> +      - const: phy_b
> +      - const: phy_b_nocsr
> +
> +  vdda-phy-supply: true
> +
> +  vdda-pll-supply: true
> +
> +  vdda-refgen0p9-supply: true
> +
> +  vdda-refgen1p2-supply: true
> +
> +  qcom,link-mode:
> +    description:
> +      Reference to a register in the TCSR syscon that reports the link
> +      mode the PCIe PHY is currently configured for, either a single x8
> +      link or two independent x4 links. The link mode is programmed by
> +      firmware before Linux boots; this property is only used to read
> +      the active link mode, specified as a phandle to the syscon and
> +      the register offset.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of TCSR syscon
> +          - description: offset of link mode register
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clock-output-names:
> +    items:
> +      - description: Name of the PHY A pipe clock output.
> +      - description: Name of the PHY B pipe clock output.
> +
> +  "#phy-cells":
> +    const: 1

You should explain in description the meaning of cell value. Or provide
filename of header with constants.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - vdda-refgen0p9-supply
> +  - vdda-refgen1p2-supply
> +  - qcom,link-mode
> +  - "#clock-cells"
> +  - clock-output-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-gcc.h>
> +    #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> +
> +    pcie3_phy: phy@f00000 {

Drop unused label.

The old 5x4 glymur compatible could be deprecated as well, but fine for
me without doing so.

Best regards,
Krzysztof


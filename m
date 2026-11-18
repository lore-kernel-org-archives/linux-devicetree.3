Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028868;
	b=uxVKpwx+UrNrne4E3MeK8McrnZeHQbIiZZVfBLzSfxvEHXZXnOSQ0FxLrJ26G0PVV1ff
	 RlPfCyql4Z39AVtLa7ZsOR1Mh3hXhZrFLcEOytiHNv0cz0YXK9vfhwai50JQ9KkOnqYAK
	 +/7N+O6XqzVMBazrfx0Lh/BOfoyBk/RKW+VK/tqKZCvmSS5VaAXfj5FHR8HPogq+bxb3V
	 mbsVczKfmc1Kc7eAoJ9rd1SrA5ouVV7nQcqlWrbQJdJOMPGBeuyzVox7VPY16yCZqxQM1
	 qH/yE02ipBcB+CPFECLrPijKTK12V5NHKqmaPTK/k4ZCCn7Jx+H/SLMujwBQZYXePYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028868;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vHDVIWi0stLdJ+2A+4zasrNWOSGgPQx8IYgHUVcpL7A=;
	b=oy23btDHzbXMnSj+YVnBeuwBSJOn64V9gdvVD9NuH629bGwGOIh1dGpnHM+cx9IXxVXZ
	 Vqqf4cUj1QlMCxkFql9+QWYo+5czfulxiPo3ORR+OB+KgzOLawEPWh14szHDb0x67zksa
	 0zDNXCrRQ9OAFV7Q8acIWZN7sJrn9KviqbkWc88toALh/EubYN8dF9d3vZPpOX8kGvMuc
	 DyVnbLq2+4VQNVY9YeH0z5yCvSef2uOaW6GdtENvZyhCAsyutoRtqS1M/efUNmDG4gvSG
	 LanRtt6lyYtS465hbxK7i2FnLRmgXqBahEOxoOI7HYzMbnEmHGjq+zl7hPNehAjuNSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T07e69Bj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD45260A2619;
	Wed, 18 Nov 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T07e69Bj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5079B1F000C4;
	Wed, 18 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028868;
	bh=vHDVIWi0stLdJ+2A+4zasrNWOSGgPQx8IYgHUVcpL7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T07e69Bjfc366PA37tW7HGzrn2O+873kedsPzUDGl3AOXX+3BXfi2/Wxq9Tc5rVN4
	 VlZAUCwOA2n4oRwBQZ/2xCbBlN/CvQc8G0P9ejdFiMwyKGLVLiAFNcvx+nqNX2sFhY
	 307EeS7q6lnxU8S2oJGhAEN/bTYHC/x0eu3pcsxuAn8SwvqPIIgMiHmzV0YLciRm/6
	 WaX2SeD45rLPVH9DJ1kcXGTZPEuyRofMMRI9SjKc1ZzqtE09HpVI2YmYIpvdvpy9bE
	 NlScqdSl9BUXltIjiVIedHY8w2hM/x65H8D/xFxI9+CLW5NuwET+IMEao37wlJwUZ9
	 otHHP0T+AEdzA==
Date: Wed, 18 Nov 2026 13:07:45 -0600
From: Rob Herring <robh@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Message-ID: <20261118190745.GA198891-robh@kernel.org>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>

On Tue, Nov 17, 2026 at 02:15:23PM +0530, Mohd Ayaan Anwar wrote:
> Shikra's EMAC requires two additional clocks for NOC interconnect
> access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
> OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
> are enabled.
> 
> Add qcom,shikra-ethqos to the compatible enum and use an if/else
> block to constrain Shikra to exactly six clocks and require
> operating-points-v2 and power-domains, while leaving existing
> compatibles unchanged.
> 
> Add the relevant compatible to the binding document for snps,dwmac as
> well.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: moved operating-points description to the top-level, and added
> power-domains as a required property for Shikra.
> ---
>  .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
>  2 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index ef520f810577..6bd4bded650a 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -14,9 +14,6 @@ description:
>    dwmmac based Qualcomm ethernet devices which support Gigabit
>    ethernet (version v2.3.0 and onwards).
>  
> -allOf:
> -  - $ref: snps,dwmac.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -32,6 +29,7 @@ properties:
>            - qcom,qcs404-ethqos
>            - qcom,sa8775p-ethqos
>            - qcom,sc8280xp-ethqos
> +          - qcom,shikra-ethqos
>            - qcom,sm8150-ethqos
>  
>    reg:
> @@ -57,9 +55,11 @@ properties:
>        - const: sfty
>  
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 6
>  
>    clock-names:
> +    minItems: 4
>      items:
>        - const: stmmaceth
>        - const: pclk
> @@ -67,6 +67,8 @@ properties:
>        - enum:
>            - rgmii
>            - phyaux
> +      - const: axi-noc
> +      - const: pcie-tile-axi-noc

These sound like inter-connect clocks. Shouldn't they be controlled by 
a interconnect driver?

>  
>    iommus:
>      maxItems: 1
> @@ -81,6 +83,14 @@ properties:
>        - const: cpu-mac
>        - const: mac-mem
>  
> +  operating-points-v2:
> +    description: |
> +      For Shikra, the OPP table specifies the rates for the NOC access
> +      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
> +
> +  opp-table:
> +    type: object
> +
>    phys: true
>  
>    phy-names:
> @@ -95,6 +105,42 @@ required:
>    - clock-names
>    - reg-names
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-ethqos
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - const: rgmii
> +            - const: axi-noc
> +            - const: pcie-tile-axi-noc

No need to repeat the names here. Just 'minItems: 6'. I suppose you 
might also want:

contains:
  const: rgmii

> +      required:
> +        - operating-points-v2
> +        - power-domains
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - enum:
> +                - rgmii
> +                - phyaux

Just 'minItems: 4'

Rob

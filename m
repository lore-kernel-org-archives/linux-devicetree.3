Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D37841B8F8;
	Tue, 28 Jul 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234437; cv=none; b=O57iX5DSS1F/t0YDf0ttMbVZjoOslTdLtZVrnBrd1a1gU6j4TrguGFp2DHVveu5ET4HDEc5QPpCwS4Tsc5G4pftyKOs9BGaaBVlRfTjhtRZz5C+S5XG/d9ww35z+YRGtKKq5iINZfgum9Jm7Ee3nWFS512riXvMZTaTWGfS0NPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234437; c=relaxed/simple;
	bh=PBL4bcwsZ2pRcB92r/JbVDJLb9l/P0M8lnYx0YrbTI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkqiwBXhYnJdivlaKlWfnDzEdJKPEn23cWO9s8R1pPLANcXjdZNsWu+JyDill2vFp1az67m21Eoa6Ie1EIT7iWqiCAQfRvr2uGN2Ii2guTH/dBqCW4khloCzp4hriJRtNP1DLBh9DreBv1WiQtk5+OWEkDjjYfzqemrvlOMbQhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9fhMXGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9fhMXGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA641F000E9;
	Tue, 28 Jul 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234436;
	bh=uiAaOW/UoDyPAMFo3YGGeL+aFC2bg347xxp5/EX2k1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9fhMXGH0Ulk3AKxRHa767ua4g49h6kpMpshBFnBGQ2eNKWXwzcKlSZ573rh6W5Bq
	 /KvGmNs2nzGG9yxWJSWeAsMbtzxvUUyhvuJUmonTZ2zkleeB88TzZNlPjxlNluXFJ4
	 TaSnn7ivMlNBibznbA2aLwciPILSOlJfQYDHIyHNy6inO7DN5xVEFkiqKW5dTy99Px
	 +PP8hfEHbf3eI8jOQ51tPrc7L+sz5uVm1PyXhfGDxOqz/kF7FGmEe+cmo4bw751F2q
	 uX06XV/5Odf7cSvQ6wdKwPTG3oyXOePr8QpZfpsOJWO83OcLS69HitKrjYJ9P/Fivh
	 IAFyV7HPui43g==
Date: Tue, 28 Jul 2026 12:27:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Subject: Re: [PATCH v2] regulator: dt-bindigs: ti,pbias-omap: Convert to DT
 schema
Message-ID: <20260728-vegan-carrot-hyena-1275f1@quoll>
References: <20260722-ti-pbias-omap-v2-1-e26fbd476e6e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-ti-pbias-omap-v2-1-e26fbd476e6e@gmail.com>

On Wed, Jul 22, 2026 at 09:55:07PM +0530, Bhargav Joshi wrote:
> Convert Texas Instruments PBIAS internal regulator from text to DT
> schema. No Functional changes are introduced.

Subject - typo, dt-bindings.

> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - remove top level $ref: regulator.yaml#
> - update schema to support OMAP3 SoCs to have both MMC and
>   SIM PBIAS regulators
> - Link to v1: https://lore.kernel.org/r/20260717-ti-pbias-omap-v1-1-527848131801@gmail.com
> ---
>  .../bindings/regulator/pbias-regulator.txt         |  32 -----
>  .../bindings/regulator/ti,pbias-omap.yaml          | 157 +++++++++++++++++++++
>  2 files changed, 157 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
> deleted file mode 100644
> index acbcb452a69a..000000000000
> --- a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -PBIAS internal regulator for SD card dual voltage i/o pads on OMAP SoCs.
> -
> -Required properties:
> -- compatible:
> -  - should be "ti,pbias-dra7" for DRA7
> -  - should be "ti,pbias-omap2" for OMAP2
> -  - should be "ti,pbias-omap3" for OMAP3
> -  - should be "ti,pbias-omap4" for OMAP4
> -  - should be "ti,pbias-omap5" for OMAP5
> -  - "ti,pbias-omap" is deprecated
> -- reg: pbias register offset from syscon base and size of pbias register.
> -- syscon : phandle of the system control module
> -- regulator-name : should be
> -			pbias_mmc_omap2430 for OMAP2430, OMAP3 SoCs
> -			pbias_sim_omap3 for OMAP3 SoCs
> -			pbias_mmc_omap4 for OMAP4 SoCs
> -			pbias_mmc_omap5 for OMAP5 and DRA7 SoC
> -
> -Optional properties:
> -- Any optional property defined in bindings/regulator/regulator.txt
> -
> -Example:
> -
> -		pbias_regulator: pbias_regulator {
> -			compatible = "ti,pbias-omap";
> -			reg = <0 0x4>;
> -			syscon = <&omap5_padconf_global>;
> -			pbias_mmc_reg: pbias_mmc_omap5 {
> -				regulator-name = "pbias_mmc_omap5";
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3000000>;
> -			};
> diff --git a/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> new file mode 100644
> index 000000000000..ea904946e352
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/ti,pbias-omap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments PBIAS internal regulator.

Drop final stop. Titles don't have them.

> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,pbias-dra7
> +          - ti,pbias-omap2
> +          - ti,pbias-omap3
> +          - ti,pbias-omap4
> +          - ti,pbias-omap5
> +      - const: ti,pbias-omap

Odd, old binding did not list such order and it said ti,pbias-omap is
deprecated.

Nothing in commit msg explains changes done to the binding. I guess
there is a reason to do that, but needs to be explicit. Especially that
you are changing the ABI - disallowing ti,pbias-omap alone.

> +
> +  reg:
> +    maxItems: 1
> +
> +  syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the system control module
> +
> +  pbias_mmc_omap2430:

Names were also not in the old binding and this is not explained WHY you
are doing that way.

> +    type: object
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        const: pbias_mmc_omap2430

So the regulator-name is required or node name? Looking at the code I
see only node name requirement, but feel free to elaborate in commit msg
why this name must be fixed as well.

> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false

Place this one after $ref.

> +
> +  pbias_sim_omap3:
> +    type: object
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        const: pbias_sim_omap3
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false

Ditto

> +
> +  pbias_mmc_omap4:
> +    type: object
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        const: pbias_mmc_omap4
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false

Ditto

> +
> +  pbias_mmc_omap5:
> +    type: object
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        const: pbias_mmc_omap5
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false

Ditto

> +
> +required:
> +  - compatible
> +  - reg
> +  - syscon
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,pbias-omap2
> +    then:
> +      required:
> +        - pbias_mmc_omap2430
> +      properties:
> +        pbias_sim_omap3: false
> +        pbias_mmc_omap4: false
> +        pbias_mmc_omap5: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,pbias-omap3
> +    then:
> +      anyOf:
> +        - required:
> +            - pbias_mmc_omap2430
> +        - required:
> +            - pbias_sim_omap3
> +      properties:
> +        pbias_mmc_omap4: false
> +        pbias_mmc_omap5: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,pbias-omap4
> +    then:
> +      required:
> +        - pbias_mmc_omap4
> +      properties:
> +        pbias_mmc_omap2430: false
> +        pbias_sim_omap3: false
> +        pbias_mmc_omap5: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,pbias-omap5
> +              - ti,pbias-dra7
> +    then:
> +      required:
> +        - pbias_mmc_omap5
> +      properties:
> +        pbias_mmc_omap2430: false
> +        pbias_sim_omap3: false
> +        pbias_mmc_omap4: false
> +
> +unevaluatedProperties: false

additionalProperties instead.

> +
> +examples:
> +  - |
> +    pbias_regulator: pbias_regulator@0 {

Drop unused label.


Best regards,
Krzysztof


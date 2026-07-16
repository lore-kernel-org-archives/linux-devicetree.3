Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD25374A08;
	Thu, 16 Jul 2026 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236482; cv=none; b=moqtzNLwy/n45Ry//GF6gYdUIpFngg6LV+3WTFQeLUYHE2W3ufFKcsZvhNcjbCX90YePiHktgtCwWRzEu+zIUhSjwj66Nt+E/htfxQba+jgFSChawJVkONksfMqdoBMD2U48Ojl0x1DOKUMRKe7KBkQdupuP71xE96f/veZdIoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236482; c=relaxed/simple;
	bh=2FdN5YRcskCueuGwMCYKJ2VbkmXaKTztOg9m4Dojmdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePHnZOZOYH/9O6s2wnf4upa1JJHaWV/NpFs1jMfouJX+FpwC4M3/SpAlnMMD/t8nRVnl5jiRNTyQ2Sx4YxR23rvzuRZmad1Nh1oiij3MkaD6ot80rJ46bjry0LuPETdhdqZA5t1UQMpBstAsG+8sm6ZOiXMQ9MyR0OzsOk0F5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHbnqieb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHbnqieb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E111F000E9;
	Thu, 16 Jul 2026 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784236480;
	bh=Wau55OCzpUM6sOwD9Op0bjxV2VyxXuwHcpEOYS3bsZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eHbnqiebdiUMRlaosJFb1lFntpi5gEWlmOKPFVElCPrHUxDIDxkaYSMGeSP0Nhtlf
	 HLW5eHp7Z3m5Rwh5MDsEZJELthGAhz9b9ZrSHjOKvlpnItIH4h1lq5zWbITHIwCnvZ
	 wBv8A7jE9ONARnCLkPgEv42FnbibwhHOJNy8g75hyT3hAv3H65If/C0BQT1ESR24eY
	 sCZ9EZWejkxp+ZA3OsYPqjYvTR3vUR10xiBpJb5d/a/AeYgDseylt8jLLlETQWJGF5
	 NvvbTq9JmDdI5enOo/5BuvCtESzCWoSr+ubW4gdgTmPUEc56yV1LJBlBlHpI8cm5Xh
	 N5XDFcr9ATL+g==
Date: Thu, 16 Jul 2026 16:14:39 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Message-ID: <20260716211439.GA1290290-robh@kernel.org>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-3-1b7d695be2e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-3-1b7d695be2e1@oss.qualcomm.com>

On Tue, Jul 07, 2026 at 03:36:01PM +0200, Krzysztof Kozlowski wrote:
> The schema checking for expected naming patterns for SoC IP block nodes
> was really incomplete and was checking only nodes with single
> compatible.  Fixing this and applying schema for nodes with fallbacks is
> not trivial, because obvious solution like:
> 
>   minItems: 1
>   items:
>     - oneOf:
>         - pattern: ...
>         - pattern: ...
>     - {}
>     - {}
> 
> is not allowed by dtschema.  The binding should also skip root nodes,
> which have SoC-based fallback, but completely random front compatibles.
> 
> Solve this all by:
> 1. Extending the select pattern to match all nodes except root node.
> 2. Apply schema to all items of "compatible" property, which means it
>    will be evaluating also all sorts of generic compatibles like
>    "syscon".  List them all and let's hope that fallback list will not
>    grow too much, because generic compatible fallbacks are discouraged.
> 
> The benefit is that this schema is finally very specific and evaluates
> all nodes for desired naming.
> 
> Diff is a bit obfuscated, due to indentation change so briefly
> explaining:
> 1. None of the patterns are changed (neither in "Preferred naming style"
>    group nor in "Legacy namings").
> 2. None of the enums with "Legacy namings" and "Legacy compatibles with
>    wild-cards" are changed.
> 3. Add pattern for sound cards.
> 4. Add enum with qcom,hamoa-crd-ec, because it is used as fallback to
>    SoC-codename (Glymur).
> 5. Add list with all used generic fallbacks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom-soc.yaml          | 190 ++++++++++++++++-----
>  1 file changed, 143 insertions(+), 47 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index d934afd59df1..ffdaff073c92 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -22,60 +22,156 @@ description: |
>  
>  select:
>    properties:
> +    # Select all nodes which have SoC-based compatibles, but not the root
> +    # "/" node, because its front compatibles do not follow any SoC patterns
> +    $nodename:
> +      pattern: "[^/]"
>      compatible:
> -      oneOf:
> -        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
> +      contains:
> +        oneOf:
> +          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> +          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
>    required:
>      - compatible
>  
>  properties:
>    compatible:
> -    oneOf:
> -      # Preferred naming style for compatibles of SoC components:
> -      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
> -      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
> -      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> -      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
> +    # SoC specific compatibles can appear alone or be followed by another SoC
> +    # specific compatible or generic fallbacks, therefore check for compatible
> +    # should use ideally:
> +    #
> +    #   minItems: 1
> +    #   items:
> +    #     - oneOf:
> +    #         - pattern: ...
> +    #         - pattern: ...
> +    #     - {}
> +    #     - {}
> +    #
> +    # but that is not allowed by dtschema ("oneOf" cannot be used as an item
> +    # for a compatible).  Work around this by defining schema for all items,
> +    # but drawback is that we need also to list all known generic fallbacks
> +    # like "syscon" etc.
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      # Use anyOf, because soundcards will match few patterns
> +      anyOf:
> +        # Preferred naming style for compatibles of SoC components:
> +        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
> +        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
> +        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> +        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
> +        # SoC codenames used for non-SoC components:
> +        - enum:
> +            - qcom,hamoa-crd-ec
>  
> -      # Legacy namings - variations of existing patterns/compatibles are OK,
> -      # but do not add completely new entries to these:
> -      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -        # qcom,apss-wdt with codenames
> -      - pattern: "^qcom,apss-wdt-[a-z]+$"
> -      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
> -      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> -      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> -      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> -      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> -      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -        # qcom,scm with codenames
> -      - pattern: "^qcom,scm-[a-z]+$"
> -      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
> -      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -      - enum:
> -          - qcom,dsi-ctrl-6g-qcm2290
> -          - qcom,gpucc-sdm630
> -          - qcom,gpucc-sdm660
> -          - qcom,lcc-apq8064
> -          - qcom,lcc-ipq8064
> -          - qcom,lcc-mdm9615
> -          - qcom,lcc-msm8960
> -          - qcom,lpass-cpu-apq8016
> -          - qcom,usb-hs-ipq4019-phy
> -          - qcom,usb-hsic-phy-mdm9615
> -          - qcom,usb-hsic-phy-msm8974
> -          - qcom,usb-ss-ipq4019-phy
> -          - qcom,vqmmc-ipq4019-regulator
> +        # Legacy namings - variations of existing patterns/compatibles are OK,
> +        # but do not add completely new entries to these:
> +        - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> +          # qcom,apss-wdt with codenames
> +        - pattern: "^qcom,apss-wdt-[a-z]+$"
> +        - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
> +        - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> +        - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> +        - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> +        - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> +        - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> +        - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> +          # qcom,scm with codenames
> +        - pattern: "^qcom,scm-[a-z]+$"
> +        - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
> +        - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>  
> -      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
> -      - enum:
> -          - qcom,ipq806x-ahci
> -          - qcom,ipq806x-gmac
> -          - qcom,ipq806x-nand
> -          - qcom,ipq806x-sata-phy
> -          - qcom,ipq806x-usb-phy-ss
> -          - qcom,ipq806x-usb-phy-hs
> +        - enum:
> +            - qcom,dsi-ctrl-6g-qcm2290
> +            - qcom,gpucc-sdm630
> +            - qcom,gpucc-sdm660
> +            - qcom,lcc-apq8064
> +            - qcom,lcc-ipq8064
> +            - qcom,lcc-mdm9615
> +            - qcom,lcc-msm8960
> +            - qcom,lpass-cpu-apq8016
> +            - qcom,usb-hs-ipq4019-phy
> +            - qcom,usb-hsic-phy-mdm9615
> +            - qcom,usb-hsic-phy-msm8974
> +            - qcom,usb-ss-ipq4019-phy
> +            - qcom,vqmmc-ipq4019-regulator
> +
> +        # Legacy compatibles with wild-cards - list cannot grow with new bindings:
> +        - enum:
> +            - qcom,ipq806x-ahci
> +            - qcom,ipq806x-gmac
> +            - qcom,ipq806x-nand
> +            - qcom,ipq806x-sata-phy
> +            - qcom,ipq806x-usb-phy-ss
> +            - qcom,ipq806x-usb-phy-hs
> +
> +        # Schema matches also sound card nodes and its front compatibles can be anything
> +        - pattern: "^.*,.*sndcard$"
> +
> +        # List all used generic fallbacks. The list can grow, but in practice
> +        # it is not expected, because specific compatibles are preferred for
> +        # fallbacks as well.
> +        - enum:
> +            - arm,gic-v3
> +            - arm,mmu-500
> +            - generic-ahci
> +            - jedec,ufs-2.0
> +            - mmio-sram
> +            - qcom,adreno-smmu
> +            - qcom,aoss-qmp
> +            - qcom,cpr
> +            - qcom,cpufreq-epss
> +            - qcom,cpufreq-hw
> +            - qcom,dcc
> +            - qcom,dwc3
> +            - qcom,epss-l3
> +            - qcom,eud
> +            - qcom,glink-smd-rpm
> +            - qcom,inline-crypto-engine
> +            - qcom,ipcc
> +            - qcom,kpss-gcc
> +            - qcom,kpss-timer
> +            - qcom,kpss-wdt
> +            - qcom,mdp5
> +            - qcom,mdss-dsi-ctrl
> +            - qcom,msm-iommu-v1
> +            - qcom,msm-iommu-v2
> +            - qcom,msm-timer
> +            - qcom,osm-l3
> +            - qcom,pcie2-phy
> +            - qcom,pdc
> +            - qcom,pmic-glink
> +            - qcom,qce
> +            - qcom,qfprom
> +            - qcom,qspi-v1
> +            - qcom,qusb2-v2-phy
> +            - qcom,rpm-proc
> +            - qcom,rpmh-rsc
> +            - qcom,rpmcc
> +            - qcom,saw2
> +            - qcom,scm
> +            - qcom,sdhci-msm-v4
> +            - qcom,sdhci-msm-v5
> +            - qcom,sec-qfprom
> +            - qcom,smd-rpm
> +            - qcom,smmu-500
> +            - qcom,smmu-v2
> +            - qcom,snps-dwc3
> +            - qcom,ssc-block-bus
> +            - qcom,tcsr-mutex
> +            - qcom,trng
> +            - qcom,tsens-v0_1
> +            - qcom,tsens-v1
> +            - qcom,tsens-v2
> +            - qcom,ufshc
> +            - qcom,usb-hs-phy
> +            - qcom,usb-hsic-phy
> +            - qcom,usb-snps-hs-5nm-phy
> +            - qcom,usb-snps-hs-7nm-phy
> +            - simple-mfd
> +            - snps,dwmac
> +            - syscon

You lost me here... 

This all looks pretty unmaintainable. Perhaps you should give up on old 
SoCs and only do something on new(er) ones:

select:
  properties:
    compatible:
      contains:
        pattern: '^qcom,'

allOf:
  - if:
      properties:
        compatible:
          contains:
            pattern: '^qcom,.+foosoc'
    then:
      properties:
        compatible:
          contains:
            pattern: '^qcom,foosoc'

Rob

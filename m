Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520909;
	b=0HhczaUG5fqgTS/xYTQe/R3P87/HdhWyMwLKGF9vZfXAxCOz3yJyLCGFVFTcHD6OwqX9
	 BBeK86TaKb4vv3VINUZxd8WIHIH2QwgfLFieqUPxwAUr60hgM1ip8sdyJZLksIp8s7i4M
	 irW0owz45J4/I4NVoV9MR71nNU++LCdo/za052BNv6jzNOzQe6WJm6zLW8vMLfS1s+lLm
	 MtsHqDv6tVcIR90qvcJqrsLVvSIS0NnzkHmN7jRhsXRB9S6C+3XlN50oMLkao+uRYsOMU
	 eACyi8TfN2ZSQBU6i5tbycZgjCpSQCHeLB7tiT1hODEX1WzyDT3pm3v48cFig/bqHeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vdMA1rZDsMWZnzwxj7F1cIHftxuCu3tfuRlXj3dXsUo=;
	b=E54IptIwqZQ9K8Y6PehtEb2j/9NJ5wpCaxzKNRqkmS8//EbBfEB74ES3TjqxILeGFCMQ
	 K4rUai2Tg7YI7oHIyM9MYlCjiuK1ZYkevrwIOHlwUAru/WcmPYmLePmhnIwCZG/jrbFpX
	 sHU+gHLHxu70BBwGdhC9NbCZnSg+44dvE3CZ/hXGOfD3fDyZjclVYhQihpYFxAg2z71cp
	 BaQKsr6WVvCk2Xs9UOd4pwPi1TcXv3Mg4zQY6D4u5cHRKxV7Q6BhJuoUv3sIl7eDIMPpY
	 33g2+sug7NdBI49h7wGZ8oDCUUuU3q/C7EefhN17TFRAPw3QZJZAkRXjCuQcM82H9BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0Nd4IU5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADECA606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0Nd4IU5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077CC1F000C4;
	Thu, 12 Nov 2026 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794520909;
	bh=vdMA1rZDsMWZnzwxj7F1cIHftxuCu3tfuRlXj3dXsUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0Nd4IU5ewOYMFpEovRpijk3pI+PT6ikNXtBYlDm6uvTabKBAioN+qb/Pm4Yf4owk
	 0M2U+4+OO9Njl85nKwSCy3KRGQCXlemxX+HWu9nxu+cl4T0UIYr7ko9GXfWYWf6r/+
	 JNedgMSIr/U2uLq/wRLouQx3P+EWfMiRzOEUrfp69qA2RFx4KLNTJC/Jo2zXQ0Kj66
	 M/oK1zRVrgD//UU5BrNhSagrcojGNvIR0kXlt885gtADHJRcV9gtEBMa6+7JR/fK3J
	 rpybBrzJNBQmicSJXq9kGu/R9CktfQ44C6PcAblUM3Lm7GqtiM+tLNdajKOMZ5tSLd
	 Tsvcg1terf+mw==
Message-ID: <sashiko-outbox-211882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112215342.2476801-2-dinguyen@kernel.org>
References: <20261112215342.2476801-1-dinguyen@kernel.org>
 <20261112215342.2476801-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 22:01:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: edac: altera: fixed-order interrupt-names tuple
  with minItems 1
- [Medium] dt-bindings: edac: altera: incompatible a10 fallback
  compatible for agilex5
- [Low] dt-bindings: edac: altera: unwieldy per-compatible conditionals
  in schema
--

commit 8ef209bb93609f50bb0952f3479bdf8adcfdc2d5
Author: Dinh Nguyen <dinguyen@kernel.org>

dt-bindings: edac: altera: agilex5: document new edac support

This commit documents the Agilex5 ECC manager compatible string and its
seven named interrupts in the Altera SoCFPGA ECC manager DT binding.

> diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-mana=
ger.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.=
yaml
> index 136e8fccd429a..14e09fc86055f 100644
> --- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> +++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> @@ -20,7 +20,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: altr,socfpga-s10-ecc-manager
> +          - enum:
> +              - altr,socfpga-s10-ecc-manager
> +              - altr,socfpga-agilex5-ecc-manager
>            - const: altr,socfpga-a10-ecc-manager
>        - const: altr,socfpga-a10-ecc-manager
>        - const: altr,socfpga-ecc-manager

[Severity: Medium]
Is altr,socfpga-a10-ecc-manager a valid fallback compatible for
altr,socfpga-agilex5-ecc-manager?

On a kernel without dedicated Agilex5 support, matching
altr,socfpga-a10-ecc-manager binds altr_edac_a10_driver with is_s10 set
to false.  altr_edac_a10_probe() and altr_edac_a10_device_add() then
treat the device as a 32-bit Arria10 ECC manager, writing Arria10 System
Manager register offsets (A10_SYSMGR_ECC_INTMASK_SET_OFST), registering
platform_get_irq(pdev, 1) as a chained IRQ handler, and requiring two
interrupts on every child peripheral ECC node.

> @@ -33,7 +35,25 @@ properties:
> =20
>    interrupts:
>      minItems: 1
> -    maxItems: 2
> +    items:
> +      - description: Global single-bit error
> +      - description: Global double-bit error
> +      - description: IO96B0 DRAM controller error
> +      - description: IO96B1 DRAM controller error
> +      - description: SDM QSPI single-bit error
> +      - description: SDM QSPI double-bit error
> +      - description: SDM single-event
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: global_sbe
> +      - const: global_dbe
> +      - const: io96b0
> +      - const: io96b1
> +      - const: sdm_qspi_sbe
> +      - const: sdm_qspi_dbe
> +      - const: sdm_seu

[Severity: Medium]
Does defining interrupt-names as a fixed-order tuple of const values
with minItems: 1 match how Agilex5 nodes specify interrupts?

In JSON Schema tuple validation, an array of length N (with N < 7) must
match the first N entries in exact order, so dtbs_check will reject any
Agilex5 node that omits an earlier interrupt (such as global_dbe or
io96b1) while specifying a later one (such as io96b0 or sdm_seu).  Or, if
all seven GIC interrupts are always wired in the Agilex5 SoC device tree,
should minItems be 7?

[ ... ]

> @@ -235,28 +255,50 @@ patternProperties:
>        - interrupts
>        - altr,ecc-parent
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: altr,socfpga-ecc-manager
> -then:
> -  required:
> -    - compatible
> -    - "#address-cells"
> -    - "#size-cells"
> -    - ranges
> -
> -else:
> -  required:
> -    - compatible
> -    - "#address-cells"
> -    - "#size-cells"
> -    - interrupts
> -    - interrupt-controller
> -    - "#interrupt-cells"
> -    - ranges
> -    - altr,sysmgr-syscon
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-ecc-manager
> +    then:
> +      required:
> +        - compatible
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +
> +    else:
> +      required:
> +        - compatible
> +        - "#address-cells"
> +        - "#size-cells"
> +        - interrupts
> +        - interrupt-controller
> +        - "#interrupt-cells"
> +        - ranges
> +        - altr,sysmgr-syscon
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-agilex5-ecc-manager
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 7
> +        interrupt-names:
> +          minItems: 1
> +          maxItems: 7
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names: false

[Severity: Low]
This isn't a bug, but this binding already spans several SoCFPGA
generations with different property requirements, and defining seven
Agilex5-specific interrupts at the top level only to restrict older
variants back in a second if/then/else block makes the schema hard to
follow (with minItems: 1 and maxItems: 7 in the Agilex5 branch also
duplicating the top-level 7-item lists).  Would it be cleaner to split
Agilex5 into a separate schema document instead of adding more
per-compatible conditionals here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112215342.2476=
801-2-dinguyen@kernel.org?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89C19DF6A
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782448286; cv=none; b=RDfeyMUva1QZmo2FMOOFOZU331Q9xK6+lD1czGJMbIuXqp/Pin2245OHAV9zwvx6nF5GV5I+6sTbq2SDYl2X5T2zt7HJexRcte/Ix2EGSJnd2067M6fYj46S4Nz0IrFqHEuWFgL/cUIXJGtr4dGHo6ag/748S4dCB3lQdpi8LjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782448286; c=relaxed/simple;
	bh=y2auVWcawMrbOSoghorxkbP/qI7W/N7IIQHScuulCc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VkMEVUeSUR0upSTCND3iRJfk0krcjCBArUlpNXNr8P0K8D19vhuXDP/wZuCkeTkjM5T8s6M98y7s2XKgX/6fmU8+gXicWk84c6wbQi27LNr5Kkt1O5FF/ZCyncj4SxFzeBnKbHx+6D9JrEjCs5OecGJfcAc/gkp4Bwz4j1yiZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdnl2Ke3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdnl2Ke3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4489B1F000E9;
	Fri, 26 Jun 2026 04:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782448285;
	bh=lK/IRIbtone83s70qz282fKMVrdG8N+Vysz2/y0ZYiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdnl2Ke3UzTHKuX3Kxtl+dSD5GU+L7qKwrVMh8OeRnhHh2QQj/MTXH8+/zlvQTA2B
	 Gridq8lwy2+4lNUXXaTgM1sG0pEp/LoHCVQXxZ3tRIma+YjqRLRDWKf33aTBS+kMro
	 q3uLlU68EuPen8yB2OCt0Xs+a5rofFyhW3fyOx53fhfsaUPCiAUATLxJIPMoHNAW3a
	 q+ExTPxSZTiRq1a9d8XHJMuekJyCwu6iRaL2wEb4Wb9vSmztEAXG5xIu7DN7gbX1QS
	 y94ynuFVX8iasqovj6+j8uOOQumPQW3h1kNx6o1IVHywHbGvXid+FQ4rSj3axvsW+F
	 MJfLOYBr9LtxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: altr,socfpga-stmmac: add more
 interrupts for Agilex5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260626042541.1091774-1-dinguyen@kernel.org>
References: <20260626042541.1091774-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 04:31:24 +0000
Message-Id: <20260626043125.4489B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the top-level constraints for `interrupts` and `interru=
pt-names` without restoring them in the `else` block allows older variants =
to incorrectly pass schema validation with up to 17 interrupts.
--

commit b9bb703e842480b5efde889d362af4d3e53520cb
Author: Dinh Nguyen <dinguyen@kernel.org>

dt-bindings: net: altr,socfpga-stmmac: add more interrupts for Agilex5

The stmmac hardware on Agilex5 supports 8 TX/RX queue pairs and is
dma-coherent. This commit updates the schema to handle the hardware
differences between SoC variants.

> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.ya=
ml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index fc445ad5a1f1a..9bae17688992c 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
[ ... ]
> @@ -62,12 +62,28 @@ properties:
>        - const: stmmaceth
>        - const: ptp_ref
> =20
> -  interrupts:
> -    maxItems: 1
> -
>    interrupt-names:
[ ... ]
> @@ -149,10 +165,35 @@ required:
[ ... ]
>  allOf:
>    - $ref: snps,dwmac.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-stmmac-agilex5
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 17
> +          maxItems: 17
> +
> +        interrupt-names:
> +          minItems: 17
> +          maxItems: 17
> +
> +        dma-coherent: true
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 1

[Severity: Medium]
Does this missing maxItems constraint allow older variants to incorrectly p=
ass
schema validation with up to 17 interrupts?

Since the top-level maxItems: 1 constraint was removed for interrupts, this
else block applies to all non-Agilex5 variants but only enforces minItems: =
1.
Because there are no top-level restrictions stopping it, device trees for
older variants (e.g., altr,socfpga-stmmac-a10-s10) could specify multiple
interrupts and matching interrupt-names without triggering a schema validat=
ion
error.

Should maxItems: 1 for interrupts and a matching constraint for
interrupt-names be added to this else block to enforce the original strict
hardware constraints for prior generations?

> +
> +        dma-coherent: false
> +
>  unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626042541.1091=
774-1-dinguyen@kernel.org?part=3D1

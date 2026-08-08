Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05048401A00
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194838; cv=none; b=J00GtgahML3viuIQ19z2J1wWeMN7VMj0GvKn7LIVMflOSkBizxgNwj7irIeRzeF5hSEVPOlOyPEgDu1MmLZJlQAGwL0yIntRyzF3qUd/iBAVzR5e4T935z5wYYMnIjVg8HYN189qmjJJ6hAqdZ3xxT6RdPVdzrkcbY03zO2M5A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194838; c=relaxed/simple;
	bh=sqiVqbYR0e/x/fSWn+Hxv9I+Nfpokrcwam/zk8YeGS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OTfHDZ6tzm9rtPsbDjxZ6WXvyoShlIC0HHnK32muryB2Kyk3JcLoSSwzryCR/JIn+3OdvVT9IVAOLf7hjhAHC8BkRHs6pL4NO15neMlfYn+RZsNNsi2++NSA7kGyORaC8EHMNMY22UybtK7SzL97T8sr2vfJh47Q6GMAEmAI//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZu+zIRL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZu+zIRL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC3A1F000E9;
	Sat,  8 Aug 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194836;
	bh=MAEKvzwy87oLPquqbFRK6i/JBvQiN56pujcuEi34qCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZu+zIRLrLn0WqBlXdKWJq0/xGHGVOcTUB/W1txEIx+paGVwCBLZm2RfknyGvcppN
	 bDFoNqySGVtA7B6N+lJmcsYaQs8Gu4djZVw75B8haGVdGWMRYcvQ6fZhCOOgt76rRh
	 etDo/n10zi+rwr7FmDFfEUtqK9uRxy52vzYZyIhvyu58Ad5ZWhBYY+TEwzZLuygUtR
	 L0tK/CnEWVsI1PAq0mZRK2OP20xNwlWrSRG1GwQ9SdWcJ4hXPp8B5fHbhmla3Ue0uW
	 UXfpfrW2m/dQLYG3f5FPKDU8jNGpgqiA23gDnGq5nepJrt/kK+iKqz8knpU7unaZrV
	 Kk/JRJAmfSd6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 10/12] dt-bindings: net: pcs: Document
 support for Airoha Ethernet PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807131301.192060-11-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:56 +0000
Message-Id: <20260808131356.9DC3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `minItems` and `maxItems` constraints in `if-then` block=
s for `reg` and `reg-names` allow incomplete device tree nodes to silently =
pass validation.
--

--- Patch [10]: [PATCH net-next v11 10/12] dt-bindings: net: pcs: Document =
support for Airoha Ethernet PCS ---
commit d59fd3ae8fb2709a26756c96f02e5d3905143b5a
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: net: pcs: Document support for Airoha Ethernet PCS

This patch documents support for Airoha Ethernet PCS for AN7581 SoC.
It adds a new physical coding sublayer provider binding for the various
Serdes ports (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

> diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/=
Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - airoha,an7581-pcs-eth
> +              - airoha,an7581-pcs-pon
> +
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: PCS MAC reg
> +            - description: HSGMII AN reg
> +            - description: HSGMII PCS reg
> +            - description: MULTI SGMII reg
> +            - description: USXGMII reg
> +            - description: HSGMII rate adaption reg
> +            - description: PCS Analog register
> +            - description: PCS PMA (Physical Medium Attachment) register

[Severity: Medium]
Should this allOf conditional block for eth/pon also specify minItems: 8 and
maxItems: 8 for the reg and reg-names arrays?

Because the top-level schema defines minItems: 6 and maxItems: 15, defining
an items list here without explicit length constraints means a device tree
providing only 6 registers will silently pass validation for this variant.

[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: airoha,an7581-pcs-pcie
> +
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: PCS MAC 0 reg
> +            - description: HSGMII AN 0 reg
> +            - description: HSGMII PCS 0 reg
> +            - description: MULTI SGMII 0 reg
> +            - description: USXGMII 0 reg
> +            - description: HSGMII rate adaption 0 reg
> +            - description: PCS MAC 1 reg
> +            - description: HSGMII AN 1 reg
> +            - description: HSGMII PCS 1 reg
> +            - description: MULTI SGMII 1 reg
> +            - description: USXGMII 1 reg
> +            - description: HSGMII rate adaption 1 reg
> +            - description: PCS Analog register
> +            - description: PCS PMA (Physical Medium Attachment) 0 regist=
er
> +            - description: PCS PMA (Physical Medium Attachment) 1 regist=
er

[Severity: Medium]
Similarly, does this pcie allOf conditional block need a minItems: 15
constraint to ensure all required registers are present?

Without minItems constraints on reg and reg-names, any array length between
the top-level 6 and 15 will pass validation, allowing incomplete device tree
nodes to be accepted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D10

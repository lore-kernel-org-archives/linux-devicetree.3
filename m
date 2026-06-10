Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6C2D1303
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108188; cv=none; b=ffJrkcJge+k5W9H3TQYLXaOpsZMTozugAj5EWPHzceTlZ1UzdYvtCeKE/2mWLwN9LaqLZWdiqQ33X2FPKJE2D6+9Kftpkde74krnKCgmuayMk66QhZN6rU3uR32Tj1fJ6ZDMgYDMoTJtLNex+MPt6/llmPU0Fst+Hfif0ImskvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108188; c=relaxed/simple;
	bh=2hvoW2mBwKfWGATryHUA8KqtmFxv97lZ4PSt7YlZf08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GeB4Be7CSlpTGQZPzfVM0wEVq/kPzityUNZ4+jfLdDJAQoO9yxSxHgnxtuN6g9gFJOaN2OLz6g/wqLljZtafn5nT8W6OBrw01KZbRCNbs/bZ1AGtOtbHG8v2Hla3LogV5qznLlrYaf95uIBfktR+0QEbc30gfepFdEnhxNL7xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/E2UvB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/E2UvB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F99C1F00893;
	Wed, 10 Jun 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108187;
	bh=48xWMANXAiITUtL4+5Hi6mJ+sTrfxqhTfXUUOYKvZPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/E2UvB0DBFR4ZkXoOhgEXervWb11edMj0JLTllmaiz5kqkAISXxgbexvypSaxWQQ
	 /DfWOhQiPw5qAdD7t24KToRPnVy8CQWrFvUfPWdEtbmMXuffG1G94TZVwOBX6X8Wmy
	 fBBbrFmd8RfCex6sk2h7k1Upt8ZCv27/ldrZFpEAL5JU5jj7nIEtI9n90/OmOtP+v8
	 /VKV/blBBXAzhm8lefjm9LLqVNLYqfMdczTCUXcoDZuYsoZUiPAWDZhTImmGiMrgma
	 cbF3NYuLqo+AWZItZjrwNkXguWdJfZxdDATrKxVxQgjhrWtngPiCshbAxB8SaibGGD
	 bQba+YLjHarAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 10/12] dt-bindings: net: pcs: Document
 support for Airoha Ethernet PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609151212.29469-11-ansuelsmth@gmail.com>
References: <20260609151212.29469-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:26 +0000
Message-Id: <20260610161627.4F99C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `phys` property is defined without a `maxItems` or `items` cons=
traint, allowing an unbounded number of PHY phandles.
--

commit 4a128a4fb15024e87f0aaa51566224ca71799731
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
   =20
Document support for Airoha Ethernet PCS for AN7581 SoC.
Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface.
This follow the new PCS provider with the use of #pcs-cells property.

> diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/=
Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
> new file mode 100644
> index 0000000000000..98d8ab7a90f5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - airoha,an7581-pcs-eth
> +      - airoha,an7581-pcs-pon
> +      - airoha,an7581-pcs-pcie
> +      - airoha,an7581-pcs-usb
> +
> +  reg:
> +    minItems: 6
> +    maxItems: 15
> +
> +  reg-names:
> +    minItems: 6
> +    maxItems: 15
> +
> +  airoha,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the SCU node required to configure
> +      the serdes line to the correct interface mode.
> +
> +  phys: true

[Severity: Low]
Does this phys declaration need a length constraint?

In dt-schema, standard array properties like phys require explicit length
constraints (e.g., maxItems: 1 or an items list) to ensure the device tree =
node
provides the exact number of resources the hardware expects. Defining phys:=
 true
permits the property but fails to enforce any bounds on the number of entri=
es,
allowing a device tree node with extraneous PHY phandles to silently pass s=
chema
validation.

> +
> +  "#pcs-cells": true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D10

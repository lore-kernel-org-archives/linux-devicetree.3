Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1242F3C18
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649038; cv=none; b=gD0BnBmzGMeJQX35+F+84+jTZ7Rt/SCt7hG/pCdrhOQgbXFHV+V3RNKg4LfoI+JTAmrJLGDvRIIaYGhGNYxBFtUFwwQLseTduzAS2SrxAZcZURMHO9Zk8z5VB7N6ZhgzhxVQkQ3th7p9f76Ji33PZoVeJGJPXcBG+1NVUU2Lz0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649038; c=relaxed/simple;
	bh=8s16gQ843gAbAVxQI73zxP+toN8Kgb+12dsLv8bmanI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=frAixFexBEplSnD/35N1uSV7FWrjze8hvod7uONPZ7FQYunKppif+D3111dOA179uPi3gFQ++jcuXIAHTkbsmbGFZGYzHehvgwjBkGJc/5flBPDLOUm0RTwNDG1zEyJC/+Dympxeqg6dwZUXACc8N0MMN2hH07/eZrSwDFYYgOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5nFOvx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5nFOvx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275CF1F000E9;
	Tue, 16 Jun 2026 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781649037;
	bh=E+paltGPM5f7SiyO/CNdKmtR96tCnTgv3o7npG+ndok=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=G5nFOvx47+y08ssPaDiN5BKXJXA/bvCaDsgTxpXTCYr/ltl5Qcm5SmyszSJL5oXxt
	 TfFtUBcUA1Ps9qRtK8U4QGDqku2SIt9W5nYpuhRbyhWFnEXJ4vw2FmkQa0zIlq/nbV
	 qSRow5JDbGgfPUSPbpxYU8Mz3QaWSfmOoXz11rQtdnK/cR/jZS99gPN8PdqYngvmbY
	 t04yCKQ49DYuvi9G38bkZWPg8T0UnCmWIjNvGMsTZC2Am/xSUM6Ki3EkXk7TqJ01kX
	 OZT+36IcD1FCKMvpxqtY3RQifbiuzU3rBdd0MD84unCSLM+dN5MhsUjYFkTL8B1gXU
	 rdrrhyf7oyGXA==
Date: Tue, 16 Jun 2026 17:30:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, sstabellini@kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org
To: Tejas <tejasmutalikdesai@gmail.com>
In-Reply-To: <20260615130928.10198-1-tejasmutalikdesai@gmail.com>
References: <20260615112625.7892-1-tejasmutalikdesai@gmail.com>
 <20260615130928.10198-1-tejasmutalikdesai@gmail.com>
Message-Id: <178164903408.2939711.8794886122293115636.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: xen: Convert to DT schema


On Mon, 15 Jun 2026 18:39:28 +0530, Tejas wrote:
> Convert the Xen ARM device tree binding documentation from the legacy
> plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
> the YAML schema format, as required by the modern DT binding process.
> The old xen.txt is removed as the YAML schema is now the authoritative
> source.
> 
> The YAML schema:
>   - Uses the preferred dual license (GPL-2.0-only OR BSD-2-Clause)
>   - Validates compatible string format as "xen,xen-<major>.<minor>"
>     followed by the generic "xen,xen" string
>   - Documents reg as accepting 1..N regions (region 0 mandatory for
>     grant table mapping; regions 1..N optional extended regions)
>   - Documents the uefi subnode with correct types:
>       * xen,uefi-system-table:   uint64 (guest PA of UEFI System Table)
>       * xen,uefi-mmap-start:     uint64 (guest PA of UEFI memory map)
>       * xen,uefi-mmap-size:      uint32 (size of UEFI memory map)
>       * xen,uefi-mmap-desc-size: uint32 (size of each mmap entry)
>       * xen,uefi-mmap-desc-ver:  uint32 (mmap descriptor format version)
>   - Marks all five xen,uefi-* properties as required within the uefi
>     subnode; the source table lists all of them as unconditionally
>     populated by Xen when UEFI is supported
>   - 64-bit properties use /bits/ 64 <value> in the example, consistent
>     with other bindings carrying uint64 properties (e.g. opp-v2.yaml,
>     arm/mali-bifrost.yaml)
> 
> The uefi subnode was originally introduced through a multi-version review
> series (v2..v7); the mistakes caught during those reviews (typos,
> duplicated UEFI spec content, insufficient description of Xen-specific
> hypercall semantics) are avoided with deliberate caution here.
> 
> Note: the example emits a dtc warning (unit_address_vs_reg) for the
> /hypervisor node. Both the normative text in xen.txt ("Xen ARM virtual
> platforms shall have a top-level 'hypervisor' node") and the example
> in xen.txt mandate this exact node name — the $nodename: const:
> hypervisor in the schema is a direct encoding of that pre-existing
> requirement. A unit address is therefore impossible despite the presence
> of reg. This warning is pre-existing and not introduced by this
> conversion.
> 
> Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
> ---
> Changes since v1:
>   - Switch to dual license (GPL-2.0-only OR BSD-2-Clause) as required by
>     submitting-patches.rst §3
>   - Add required: for all five xen,uefi-* properties within the uefi subnode;
>     the source table lists them as unconditionally populated by Xen
>   - Fix grammar: "an HYPERVISOR_memory_op" -> "a HYPERVISOR_memory_op"
>   - Fix subject: s/YAML schema/DT schema/ per submitting-patches.rst
> 
>  Documentation/devicetree/bindings/arm/xen.txt |  62 ---------
>  .../devicetree/bindings/arm/xen.yaml          | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/xen.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/xen.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/arm/xen.example.dts:13.16-26.7: Warning (unit_address_vs_reg): /hypervisor: node has a reg or ranges property, but no unit name
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/xen.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/xen.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):
Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
arch/arm/xen/enlighten.c: Documentation/devicetree/bindings/arm/xen.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260615130928.10198-1-tejasmutalikdesai@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE0B403EB9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191947; cv=none; b=Dz0kJueqm6EXfRAUM+Nw3h4KWIb44IPLguRhMUl90cZYZKllT3VFt9zWNjf1WiK4DHKrj2KIEY/CYe28gCT1J9EhoSJ5kONbWmga1ZamI2RLiUosYPffd1swzz0janxzs6LisFjacsqPFqMM0ILwE+eYLItX5SSyLlCmKpeW8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191947; c=relaxed/simple;
	bh=sRUG9andVFe1QxJ/GRtcWb0SFvbulcshBmTvpLal2w4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AxnfOZFlXrYr70wCxnNjT1varS2vuZk7Iw4YIfz9AVvni05sn8249x8tN0YmgrYUkuFrFwOHXDkV2cUc2kmtgV9b2jE5ftIPdF2zrKLv0BMOGa9mwhq5wufxbw/HeDpk2sP/8X3JD9WAlOpPhLDKm6R8CzvRLK6Y3o8FPrL9q+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmobJXMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmobJXMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B19D1F000FF;
	Wed, 23 Sep 2026 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790191946;
	bh=i0NoH1hH0qNOSDpjCL77hXBzw+KcxtgOHlUBaAgoCoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QmobJXMYljcLFKfTnOV+W4oJpClPNOc18KzywPGajGrcNnM9ZbZBzTGGEys8YX3c1
	 h3pWObHH/ToFYTzxoFP7MfBY/P2QYf8NKB1M+1AzxGveLv1BREfkLZQAkLYiaZKv4d
	 6w+qTWGTegR1LdaDDkFGxfwWGOnSTw4Bd7A6TP6TGFtb74p1+AyF8f8+OxrxzoKmk4
	 uN7ZlQMxGMU/qauaGwzkwaIN9Mrs9jRNWSjazfYxHucN6VjOrpsANbpwdInDGShKDC
	 pu78HycnIVecs1Q1xUrjOYRZRuLsiXmk+9QpnWR8NqCtT+MBzvntT85ltbp6j8S7So
	 GbqAXUAUqJ9ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dt-bindings: mtd: convert IBM NDFC binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923192528.52330-1-rosenp@gmail.com>
References: <20260923192528.52330-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:32:25 +0000
Message-Id: <20260923193226.1B19D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: mtd: incorrectly anchored regex in patternProperties
- [Medium] dt-bindings: mtd: schema validation bypassed for nand node
--

commit 56ea8b4c720a5df58f5f626346eba38c6d9ee900
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: mtd: convert IBM NDFC binding to YAML

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported a failure to match any schema with the ibm,ndfc
compatible. Convert the binding to the YAML format so those nodes match
the generic nand-controller-legacy schema.

> diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Docume=
ntation/devicetree/bindings/mtd/ibm,ndfc.yaml
> new file mode 100644
> index 0000000000000..51ba0bd1d329d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
[ ... ]
> +  nand:
> +    type: object
> +    description: NAND chip attached to the controller.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 1
> +
> +    patternProperties:
> +      "(^partition)?@[0-9a-f]+$":
         ^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Does this regex incorrectly match any node ending with a unit address?

Because the start anchor is inside an optional group, the unanchored
@[0-9a-f]+$ allows it to match any node name ending in @<hex> (for example,
chip@0). This incorrectly applies the deprecated partition schema and its
unevaluatedProperties: false constraint to unrelated subnodes, breaking
schema validation for any device tree containing a node named
<anything>@<hex> under the nand node.

> +        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-no=
de
> +        deprecated: true
> +        unevaluatedProperties: false
> +
> +    additionalProperties: true
                             ^^^^

[Severity: Medium]
Does setting additionalProperties to true on the nand subnode bypass schema
validation?

This explicitly disables strict schema validation for the nand subnode,
rendering its contents largely unvalidated. It allows arbitrary,
undocumented, or misspelled properties to pass validation silently, which
defeats the purpose of the YAML schema conversion for this node.

Should this node use additionalProperties: false or
unevaluatedProperties: false and explicitly define or reference the required
standard NAND properties?

> +
> +required:
> +  - compatible
> +  - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923192528.5233=
0-1-rosenp@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395FA38D402
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199120; cv=none; b=Pq2vpaHTcj6e46XJ1gmxlziE54pGueJecJ/Dh1SQzv9B5nZxvIAEJ+nfXQaTRXG7x4pujlWuki9P0Ksvby7ry0vMXy3uK/Y9R7d9Q10dgdSIz10li1HcU5U3+skRHNY7oC0ZX0vRXyMs9sNrw8+IzKTNypNnFpuhgUi8fARo+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199120; c=relaxed/simple;
	bh=hIaS7pkJwgIMhdxfGOaErvbYHEp04s84J5KapDNoZ7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/PCY2TbhzzBM2DZ559T5/VT2roh44ildA1lCG8NK4cv/PGXxm7ckc5jlySNgwb1T0GVU05DBlkMyCm4w/ZOH93QWDcYRxeCiF9ubgLuID5Jmkn7attYhaL7iIUc9cTxOjNcveYq7UtVew1H9sR8H/0fHZDFqGZR1J/frvAw63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMQlNFDA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMQlNFDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDFA1F000E9;
	Thu, 16 Jul 2026 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784199118;
	bh=ZJV8atGpKN2eVA9N2Zas0tL7PfG1xzVV/qD60zFNGuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMQlNFDAL9KZiwGdxQFKs0JUL3QcV8G+Y5N6g/NCA2GVMWkuBpQlpl7xgpFxjT2Ds
	 j3nbzVDKIh5aNmlrFt59Iw0rHfWJ1Pderp5w5vsqgG0c8M/dL+My4BFgGqf6KZo0X6
	 d23xHki1s++KdooXs/ekmvT43p4mV0hwQQPU2kVMOGq2gmYqvjDZ+YzjQGsRsh1IdG
	 VT2M/jG6/3f4ZtkKT6tLCRkJZG43Vr6IgrVm4HGBoNTQFP3xV9vrJs/Pjfg3AS+I9E
	 MglqtWl/ZdJHSCtT+mfgzVhRPVUUxf8iOX11CmIG6uR9S1vXs4yUiC7dwPyH92tO7F
	 emOzYe3gV0SAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: Introduce nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-1-98454e83845c@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
 <20260716-schneider-v7-2-rc1-eip201-upstream-v3-1-98454e83845c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 10:51:57 +0000
Message-Id: <20260716105158.6FDFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The clock nexus node schema omits definitions and constraints fo=
r `clock-map-mask`, `clock-map-pass-thru`, and `#clock-cells`.
- [Medium] The Linux core clock framework does not support nexus node trans=
lation, making the `clock-map` property silently ignored at runtime.
--

--- Patch [1]: [PATCH v3 1/7] dt-bindings: clock: Introduce nexus nodes ---
commit 30cf1cc96ffba77a6f8ef9429e05ed6f37f38c53
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

dt-bindings: clock: Introduce nexus nodes

This commit introduces a new device tree binding for clock nexus nodes,
allowing the remapping of clock specifier lists through a container or
connector node in a generic way.

> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yam=
l b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 0000000000000..ff3283bd5fb11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/clock-nexus-node.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock Nexus
> +
> +description: >
> +  A nexus node allows to remap a clock specifier list in a consumer node
> +  through a container or a connector node in a generic way. With this
> +  remapping, the consumer node needs to know only about the nexus
> +  node. Resources behind the nexus node are decoupled by the nexus node
> +  itself.

[Severity: Medium]
Does the Linux clock framework currently support traversing nexus nodes?

Looking at of_parse_clkspec() in drivers/clk/clk.c, it hardcodes a call to
of_parse_phandle_with_args():

drivers/clk/clk.c:of_parse_clkspec() {
    ...
    ret =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells",
                                     index, out_args);
    ...
}

Because there isn't a call to of_parse_phandle_with_args_map() here, will
device tree consumers attempting to acquire a clock routed through a nexus
node fail to resolve it during driver probe?

Is there a companion patch for the clock framework to add this mapping
support?

[ ... ]

> +properties:
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +dependentRequired:
> +  clock-map: ['#clock-cells']
> +
> +additionalProperties: true

[Severity: Medium]
Since this schema sets additionalProperties to true, are we missing the
definitions and constraints for #clock-cells, clock-map-mask, and
clock-map-pass-thru in the properties block?

Without defining them here, it appears device trees can use incorrectly
formatted properties for the mask and pass-through fields, and validation
will silently accept them since they are not constrained to standard
types.

Could we add these properties to ensure the schema enforces the correct
formats and dependencies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-schneider-=
v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com?part=3D1

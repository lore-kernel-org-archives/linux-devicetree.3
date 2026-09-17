Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE137CD4E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686503; cv=none; b=p+keaXskTOXnB0mzmnfTFBuZGnU5+LXX/GEQ9ohPwcvwWPqqqrOFp+BtQT+uLTJPxhh1VAwkFOQ+9YVgpjyo8auI5AaMYul++0tp/fvKBzbEX+sbwB7os2hcjDWnM9wmmsJhk+3pPjAlnIqXNUp27F+1b+1URopqgsv/MhpN6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686503; c=relaxed/simple;
	bh=MvJT9Kb6eHvL+2eNRpu+At6i9LsAKCWBO5nihlKsm4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jirYxr9Raf69cwQXHbW0LFe1zYFY0dshVrHxphN/aCbFEN6sAmdJJ1IU88FJUkbntu4wsd6Eds2mYPVPeYa0eIcQrGpegRsyWPXZdAbFVd9Oi2oVZTmd+vt1/UJSdefKasdcCd8jjCwbQXNPXEmf2qQiMNLDnRzVrR0uczLxADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjIIdWC8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjIIdWC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500301F000FF;
	Thu, 17 Sep 2026 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686498;
	bh=EWyzJ1fCk4xVCcL7o49PtUSB/c3zF4lww77vmzZhwek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjIIdWC8KqurTLv9zWonJDtNKcyyQ1x1j2A2LyjLx+lJDP7iWZFLHgZoMKTZne6T0
	 Z2xEcQ1rfwaUvumkyxQh3+ej9aSyJPiyxT4yAwxoDD6HpfIxj6cMolVMDW1XTkCHsr
	 PxA6+OHM/+qaXeR+uF3XXx7GWbnfwwzt3A4OhO9CLXK9BHloxI/TpsptBOYbO7XZnX
	 cSd5p5V1rmyeQhc/ZVk2wRrKqJZzqzupqWQk9glH8Ucnw5Gu8Cleq/eeOMsV1vebiu
	 CgL4Jcy5ovCPCY5rvqrN2FANnXhi/e0ldcFicNnRMjTTjEgUFsWMlyFqfpuP5yIYXr
	 mqQ3EQkFnbabw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917225929.2494111-2-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-2-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:08:17 +0000
Message-Id: <20260917230818.500301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: unsatisfiable 'not: {}' compatible schema rule
- [Low] dt-bindings: missing mandatory 'examples' schema section
--

commit 3ce20b70e7ce37fd253621a799e998d6f340d240
Author: Alex Ousherovitch <aousherovitch@rambus.com>

dt-bindings: crypto: add Rambus CryptoManager Hub

Add device tree binding schema for the Rambus CryptoManager Hub (CMH)
hardware crypto accelerator.  The binding describes the parent
SoC-level node with its SIC register region and one queue@N child
node per mailbox the host owns, each carrying a reg (mailbox instance
index), an optional interrupt, VCQ ring geometry (rambus,num-slots /
rambus,slot-stride-bytes) and a rambus,cores affinity list.  Which
crypto cores are present is discovered from the SIC CORE_ENABLE
register at probe, not described in the device tree.

> diff --git a/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.ya=
ml b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> new file mode 100644
> index 0000000000000..a0df35bdc371d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - not: {}
> +        description: SoC-specific compatible, e.g. vendor,soc-cmh
> +      - const: rambus,cmh-v1030

[Severity: Medium]
In JSON Schema, {} is an empty schema that matches any value. Therefore,
the not: {} constraint in properties.compatible matches nothing and
evaluates to false for all inputs.

Any device tree that supplies a valid 2-element compatible string (e.g.,
"vendor,soc-cmh", "rambus,cmh-v1030") will unconditionally fail validation
via dt_binding_check.

Could this compatible constraint be modified so valid inputs can pass?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false

[Severity: Low]
This schema definition completely omits the required examples section
at the end of the file.

Without an example, the kernel's dt_binding_check machinery cannot properly
validate the schema's internal logic against a simulated valid device tree
node. This effectively hides the not: {} bug from automated testing.

Can an examples section be included to enable proper schema testing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D1

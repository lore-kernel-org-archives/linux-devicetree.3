Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FD47ACDD
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531560; cv=none; b=m+F2NRs+a8fqEe5+JqSNhshjmWYeqPBNCD0P2dbrcpD4mwKVioQkSukRcAyEBxqZ1XkmgAXxEp9m/ejM1JP/llSXSwTA78bFPi7ZS5AAE4A6YqJ9ANnWB8HEnNKsRJ2WbrROMonOsqarLgEDw7q0DARbx2yjT1iwh95YHiAznss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531560; c=relaxed/simple;
	bh=0Zles52bMxElirkrxgeUCd7uc4Z1bPLRgxdJtlbHLc0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kT12iSjxsKbKLXtxuHN63T6uIEJ50HA8PcYx6+C2xdPn6MWkxjBL4ctWGMlwrvgts6iZ3ElZXwsnFcS1XXuHXl4uB8JuHYfn1ULI2+kg7S2yoQepbvioM5W4ImqeglQbsCk46pBMbxPoarIfKJtEL9vog4jvFElBze6nmg+XAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+7E09HD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+7E09HD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F2D1F000FF;
	Fri,  9 Oct 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531559;
	bh=fPx496+C8ikw1sdmGNK4mlhl6XmX1FSQDdKZYLN5OJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h+7E09HDGHzOmTiNGwLbgIxnWVJk5b7z2OuE8/LfVxNDVEVUA0TJSGczUbwPtg71d
	 O1xXSEz4S/Fl5IUeYi47cIe1u50/Tr1K1V8couWpsdTe59B4So2EhsKlNwurnD821m
	 mOXTqFrq3ijkjEMrSEfxgCD8FVLPlvPPpKkUPJTVH0KYOr8CVc+Y3VI+mSu3H8QX+r
	 3D/PYlzaSwAXuu2+RkeSNI4u2F+cvqbqVbyJI2pj6rV0My40ZDzMjAVKni36+vuXfF
	 Inb7Q+H7HdgzCucXDxtqGtI4n4pAbApj9M1e4gx7kMUESBFDLN4L+yomG5Tsy/bgaE
	 WdVubLvyh5Xyg==
Message-ID: <sashiko-outbox-165023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: Document support for
 Airoha Subsystem Scale
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261009073330.18175-2-ansuelsmth@gmail.com>
References: <20261009073330.18175-1-ansuelsmth@gmail.com>
 <20261009073330.18175-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:39:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: devfreq: airoha: virtual nodes created for software=
 driver instantiation
--

commit d2ff6805653f5553cb072876dd17890e25aca955
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: devfreq: Document support for Airoha Subsystem Scale

Airoha SoC contains multiple subsystems that are scaled to a
specific OPP taking the CPU clock as reference. Such subsystem
can enter idle or performance state based on the system load
and power consumption conditions.

> diff --git a/Documentation/devicetree/bindings/devfreq/airoha,subsystem-s=
cale.yaml b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scal=
e.yaml
> new file mode 100644
> index 0000000000000..2cf7f23a926c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.ya=
ml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/devfreq/airoha,subsystem-scale.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha SoC Subsystem Scale Driver

[Severity: Medium]
Does this binding describe a software driver instead of a physical hardware
block?

Devicetree is fundamentally designed to describe physical hardware structur=
e,
not software driver architecture or internal Linux models. The title highli=
ghts
a conceptual flaw by explicitly referencing a driver rather than the physic=
al
hardware.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/en7523-clk.h>

[ ... ]

> +    npu-subsystem {
> +        compatible =3D "airoha,an7581-subsystem-scale";
> +        operating-points-v2 =3D <&npu_opp_table>;
> +        clocks =3D <&scuclk EN7523_CLK_NPU>;
> +    };

[Severity: Medium]
Are these purely virtual hardware nodes functioning solely as a hook to
instantiate and probe a generic devfreq driver?

These nodes lack physical hardware resources, such as reg addresses or
interrupts, and appear to exist only as glue to bind an OPP table to a cloc=
k.
Introducing purely virtual nodes into the device tree creates an invalid
hardware description and pollutes the DT ABI with Linux-specific software
abstractions.

Instead of introducing virtual nodes, should the clocks and
operating-points-v2 properties be attached directly to the actual hardware
consumer nodes (e.g., the physical NPU, GSW, or BUS devices)?

The respective drivers for those hardware blocks, or generic frameworks like
PM domains and interconnects, could then be responsible for managing their =
own
power and performance scaling.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009073330.1817=
5-1-ansuelsmth@gmail.com?part=3D1

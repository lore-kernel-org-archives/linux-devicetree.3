Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A323F39EE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008851; cv=none; b=oGCiB3H/SZOsHLx9wqpHzl0rUKLwpdCMi+AuGVeBcdYvcQeXtMMIzog5gOYklaf94zWXkRLOvufJ6yMElVQasOyjskLmYCSg4cPpXOLPfcByVsHvVAXnSWyxjU1fYgMS3RCbqxspRUlUg1RD4P1fLORNtM16bvk00hvQ6iPsb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008851; c=relaxed/simple;
	bh=15UTbnDDfmxkTIUJ0+sZkenFZ6RIYjA6dL131IX0BnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j4ULlRdCfddNybhFvwT2pYeCgW9T/ko2oD8ycnW7wvAi6RQEMrwy9nDwcCBV4YEyPRWxjcwXIN0taBXciUEYQAoVgZ9qzGzvmVyqt+kIfBsRM52FF0aYD/VwAZDijeIoG2Qkg5a5wnDSOoEtolxcg/uqhaEMQVJi2no4YmXnAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vybqm8p5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vybqm8p5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3D51F00A3A;
	Thu,  6 Aug 2026 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786008849;
	bh=RjddM7Lujt5p1g2bjtp7w3IzzvIG4CtTXa19LCVy3MU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vybqm8p5i0f/0ZpCQ+cP911jKZ2Uc97KZEx1QbOynxncsD7Q3TFB/Ugxl+x0sC5GK
	 SO8G1sDY7Lfr98lkPqp6LjiffLrk0CTsdW1ai+ClRC+F6cKEL6NC5bcWTB8PH8/gag
	 HzbUM5Z1PQxaDY6SnfEuUBUS6LVYhMqs3Hm9A/5V3NSd3Tq6RXJ8GP6ZIMR0iI8Ln6
	 8j+aF7CyErgqj+FznCvolI8U8DsKvNn7iSwawdcMrRYvDZiNqt433n+WwuXzOjLGlx
	 lFIipmuPldVDLdocLrpE1qqjlSbexOfKXJuIfk2ARxdDgcj5sgx0cLxSz5LHZcq8AU
	 9IJbSRSLW2rWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: altr,agilex72-clkmgr: add
 Agilex72 clock manager binding
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <39f067c31125b43d9d4ee92cd02828e894de3f45.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <39f067c31125b43d9d4ee92cd02828e894de3f45.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:34:08 +0000
Message-Id: <20260806093409.4D3D51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The clock manager binding omits the `clocks` and `clock-names` p=
roperties, failing to properly model external hardware inputs.
--

--- Patch [2]: [PATCH 2/5] dt-bindings: clock: altr,agilex72-clkmgr: add Ag=
ilex72 clock manager binding ---
commit 99e14dc36681e2c2df411ac60959380ed8376f54
Author: Chiam, Evon <evon.chiam@altera.com>

dt-bindings: clock: altr,agilex72-clkmgr: add Agilex72 clock manager binding

Adds the device tree binding and clock ID header for the Altera SoCFPGA
Agilex72 clock manager.

> diff --git a/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr=
.yaml b/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: altr,agilex72-clkmgr
> +
> +  reg:

[Severity: Medium]
Should this properties block declare the clocks and clock-names properties?

Because additionalProperties is set to false, any device tree attempting to
properly link the external reference clocks to the clkmgr node via standard
phandles will be rejected by dt_binding_check.

[ ... ]

> +examples:
> +  - |
> +    /* External reference clocks supplied to the clock manager */
> +    clocks {
> +      cb_intosc_div2_clk: cb-intosc-div2-clk {
> +        #clock-cells =3D <0>;

[ ... ]

> +    clkmgr: clock-controller@915c000 {
> +      compatible =3D "altr,agilex72-clkmgr";
> +      reg =3D <0x915c000 0x1000>,
> +            <0x915e000 0x1000>,
> +            <0x915f000 0x1000>,
> +            <0x9160000 0x1000>;
> +      reg-names =3D "clkmgr", "gppll0", "gppll1", "gppll2";
> +      #clock-cells =3D <1>;
> +    };
> +...

[Severity: Medium]
Does this example accurately reflect the hardware topology?

The external reference clocks are defined just above this node, but the
clkmgr node does not consume them. While older bindings relied on global
fixed-clock lookups by name, newer schemas typically declare their
external clock inputs to support accurate topological representation and
potential parent clock power management.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786006669.gi=
t.evon.chiam@altera.com?part=3D2

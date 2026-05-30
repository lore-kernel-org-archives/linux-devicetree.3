Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F72DB7AE
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102160; cv=none; b=qkRldXwFHAnd/cs5tmbTmVg/87L1iFxTbednnGdRzHEjdy2wIT0CTwfcLTxLR9xpqCDKguKuzuif9xkZ1ruSRcYUo/7o/qAowwgctg36oQTkd0v8e3fT8h1H6GAabwq0P1IuWUzdfkvbPDRVgMRehYUD+2ZLFejUi6xomn/mQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102160; c=relaxed/simple;
	bh=Eeyqh8lNh73kibrlc/RsATxlVtfJ60Qpf2Rh80iIOTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Km3pmaODzp8S2FnSDcfRFmJiVlSQMT+BHQiVtARiLBmEZ8p5l8Y+QRB9Dv6J1KvIABtBlxE2MvnJXvZZlODPg30Qxb7Hranx6Ir+sbn+OyOyKrhONUpicYvuFuXbfJoYHBuP7Tm+8KZBwJxi6UnfNQdeQPqhHu4zqTzhh8+7AHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKBjDfsm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKBjDfsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24601F00893;
	Sat, 30 May 2026 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102159;
	bh=HAyCWzS77pRU9sOiGbz6BABWTVOUvw3C/51cweieeOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKBjDfsmOfEkL/2I69zRbKzRBwul8B+KEds1PCRsfRB40kg767AiSZAAarjUtHVm4
	 tqpztnwoFxLzN+AAfdl1pS+mL9GGqNZBhS83tIh12/tvaAIcV+uq3FeSHvCYyat1Gv
	 xFOQsYpqrYUse4K30cKdO8Yoiht6CRt6iaemPYMydmeYHifLVEFV7Cpb+LjDIC5zl5
	 I74tCERK5OSvEhO8FU8nqazoZxtSx/Wvyf+hEOpfXFOXB02w5CabK5Khb5TDd9OBiR
	 0RVfeNAUvTEZXx34Y+YbP20+xnuog6JV+43cZoCYFdJ0I7bfUL9VvpldK/WCYH7paP
	 kHdPzVfnfMxmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 6/6] dt-bindings: net: dsa: mv88e6xxx: add
 mv88e6xxx-avb-mode property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luke Howard" <lukeh@padl.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <f0a4fc5e6918040b2c9a72da46a8cdcb43ed5049.1779841530.git.lukeh@padl.com>
References: <f0a4fc5e6918040b2c9a72da46a8cdcb43ed5049.1779841530.git.lukeh@padl.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:18 +0000
Message-Id: <20260530004918.C24601F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Encoding runtime network configuration (traffic policy) in the D=
evice Tree.
- [Low] Schema validation fails for all valid inputs due to an array/intege=
r type mismatch.
- [Low] The Device Tree binding description violates OS-agnostic rules by r=
eferencing Linux-specific netlink flags.
--

commit aae733d9f490b168e212410379f1d8278d34ee3c
Author: Luke Howard <lukeh@padl.com>

dt-bindings: net: dsa: mv88e6xxx: add mv88e6xxx-avb-mode property

This commit adds a vendor-specific marvell,mv88e6xxx-avb-mode property to t=
he
Marvell MV88E6xxx DSA switch binding. The property configures the handling =
of
frames with non-AVB priorities and destination addresses into Standard,
Enhanced, or Secure modes.

> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.=
yaml b/Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml
> index 19ae600e93394..1a01810e7682c 100644
> --- a/Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml
> @@ -97,6 +97,32 @@ properties:
>      required:
>        - compatible
> =20
> +  marvell,mv88e6xxx-avb-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32

[Severity: Medium]
Does adding this property encode dynamic network configuration policy into =
the
Device Tree?

Device trees are typically meant for static hardware description. Setting h=
ow
AVB frames are handled and whether frames are dropped appears to be a runti=
me
traffic policy.

Shouldn't this be managed via standard Linux networking UAPIs like devlink,
bridge attributes, or tc, rather than being hardcoded in the DT?

> +    description:
> +      Marvell MV88E6xxx switches that support Audio Video Bridging /
> +      Time-Sensitive Networking (AVB/TSN) traffic prioritization can have
> +      ports configured in one of several modes. These modes control the
> +      handling of frames with non-AVB frame priorities and destination
> +      addresses.
> +    oneOf:
> +      - description:
> +          Standard Mode. Frames whose priority is mapped to an AVB
> +          traffic class (TC) are considered AVB frames; other frames are
> +          considered legacy (non-AVB).
> +        const: 0
> +      - description:
> +          Enhanced Mode. Frames whose priority is mapped to an AVB TC
> +          and for which a static FDB or MDB entry exists are considered
> +          AVB frames. Frames with an AVB TC but no matching FDB or MDB
> +          entry are dropped. AVB MDB entries can be added using the
> +          MDB_FLAGS_STREAM_RESERVED netlink flag.

[Severity: Low]
Does referencing MDB_FLAGS_STREAM_RESERVED violate the OS-agnostic rules for
Device Tree bindings?

This leaks Linux-specific netlink implementation details directly into the
hardware specification.

> +        const: 1

[Severity: Low]
Will this schema fail validation for all valid inputs due to an array and
integer type mismatch?

The uint32 reference above expects the property to be parsed as a
single-element array, but this applies a const constraint for an integer.
In JSON schema, an array does not match an integer.

Should this use enum: [0, 1, 2] instead, or place the const inside an items
array so it passes the binding checks?

> +      - description:
> +          Secure Mode. As Enhanced Mode, but the matching FDB or MDB
> +          entry must also have the source port's bit set.
> +        const: 2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779841530.gi=
t.lukeh@padl.com?part=3D6

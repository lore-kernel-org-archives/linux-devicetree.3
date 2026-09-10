Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC079329E7E
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075471; cv=none; b=kdeFpkjloE/hE/41JIwRVS1qFqiHYrGMHnnO90TshqDk+02qLzr+drXaKe1zmOZ+g9BrC7AMyBDwrTeb5s4ZI5lew64Mjgm/z0gGkkoxiaNqnpunU6TS/t7mdFSbMqwPltk8Q19ddDJ4g7uGzWg7yaCeGEZWgRT25Vj6qOnPYB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075471; c=relaxed/simple;
	bh=FeByBFSrTyVL2Qkf1gidLBipThJikoQJ81KiwyizJBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mE6NxNfrOGV0illqMbNBSNd3VfgmVvdOi5wbRgBTBuQC+BIzw7ya0xROSyQvX1ciLRblBAAMTb4GlL8gjHrFpA5FMgOA7qSJTEbmNStUd8FdZlqd59X9Me03hZesxpTXaApp9Inq4CkYoR/YzHBcQMeKJd5kYlazcSBMikQwax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDkqE9Fq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDkqE9Fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9D51F000FF;
	Thu, 10 Sep 2026 21:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789075470;
	bh=JtmwjnG2CDeZUTBbpleGZXsSH6L9b+UvzjXVjAT5SuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDkqE9Fqhd3A4QlGsTccfh3WEaJGMzhg4LpYMLJAHrRO1cNuc36DPYQVY3kv6SLzR
	 IqN5RiEgBcEwTSznOLF0Dty/uq0BPZgpKTEeTrrhRuTfBelIabcYUNySUw1yjqy6O2
	 OhDKmsRQFz+5NDNZd6yaQJC7v7vxtFvJGKO74farbpA+zyLPMSIfhm8tymNHO33rz1
	 sGnwDPXuhv0GsG47EcxeSd53voFY5OBdcXWuuPS40t10stecX4fVKDhLvg7CEjCzvi
	 4/4ZHCmQfWeu2/SKsitSkVHbjuDmHpfFGRE8C1efJ9thiRaMaKXem08XYyYHHnqn02
	 Zm1OAjD4UAk3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221
 ethernet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909212146.3184077-2-cjd@cjdns.fr>
References: <20260909212146.3184077-1-cjd@cjdns.fr>
 <20260909212146.3184077-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:24:29 +0000
Message-Id: <20260910212430.1F9D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The compatible string 'econet,en7528-eth' is introduced in the s=
chema without any documentation or mention in the commit message.
- [Low] The binding mandates xPON resets without explaining their relation =
to the Ethernet controller.
- [Low] Child nodes matching `^mac@[0-1]$` reference `ethernet-controller.y=
aml`, violating the strict `$nodename` constraint of the referenced schema.
--

commit 9471f88e7238b271d05f09311ad8d33d5d3b67fa
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: net: econet: add EN751221 ethernet

This commit adds device tree binding documentation for the EN751221 etherne=
t=20
system. The controller features two QDMA modules, two GDM modules, and a pa=
cket=20
processing engine to manage CPU communication and QoS prioritized forwardin=
g.

> diff --git a/Documentation/devicetree/bindings/net/econet,en751221-eth.ya=
ml b/Documentation/devicetree/bindings/net/econet,en751221-eth.yaml
> new file mode 100644
> index 0000000000000..5d953eaa16e52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/econet,en751221-eth.yaml
> @@ -0,0 +1,127 @@
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - econet,en751221-eth
> +      - econet,en7528-eth

[Severity: Medium]
Is this compatible string meant to be included in this patch? The commit
message only mentions EN751221, but this adds bindings for a second SoC
variant (EN7528).

Since this variant has different hardware behavior (such as
dscp_byte_swap =3D false compared to true for EN751221), should its inclusi=
on
be documented in the commit message?

[ ... ]
> +  reset-names:
> +    items:
> +      - const: fe
> +      - const: qdma0
> +      - const: qdma1
> +      - const: xpon-mac
> +      - const: xpon-phy

[Severity: Low]
Could the commit message provide some context on why the Ethernet Frame Eng=
ine
mandates xPON resets? While the hardware might require acquiring them, it is
unclear from the documentation why an Ethernet controller depends on xPON M=
AC
and PHY resets.

[ ... ]
> +patternProperties:
> +  "^mac@[0-1]$":
> +    type: object
> +    unevaluatedProperties: false
> +    $ref: ethernet-controller.yaml#

[Severity: Low]
Will this pattern result in a schema validation failure? The referenced
ethernet-controller.yaml schema explicitly restricts node names using the
pattern "^ethernet(@.*)?$".

By matching child nodes against "^mac@[0-1]$", any valid node for this bind=
ing
will fail the strict node naming constraints imposed by the referenced
ethernet schema.

[ ... ]
> +        gmac0: mac@0 {
> +          compatible =3D "econet,eth-mac";

[Severity: Low]
For example, will this "mac@0" example node trigger a dt_binding_check
failure because it does not begin with "ethernet@"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909212146.3184=
077-1-cjd@cjdns.fr?part=3D1

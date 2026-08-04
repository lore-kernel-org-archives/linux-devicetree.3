Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46B440A06
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837191; cv=none; b=IC15EWNx2fcV/b2qhYIAQJfodfr6Nn69KiloOZp2G/SV2W5MIy3YjKdYKirC9POPFRLSzbxPzzusvo72BVAo2CxY0HIfT4HLrisEqBpK89q2SB4MuXv0s+Me1JzCZSJtdXT57GI6tg7oWql8FogX+f96DJL23eBj9ypLfyWlfoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837191; c=relaxed/simple;
	bh=dqvIoxxn+cT+WIp/rx1re2HFoiJX+rQors3wp7MxCH8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A/sF/WT1QBg3oUxEq/vjDKwILxGA6apV6O21GcobITPkX2QOAoqZkJY6kblbCxE5seElm1/GQn0hPXWdNSQ5ZdUb5FWIzFvtGp3dbP9dPoKlm6oI8G6zCiVLTVGJ8wan6ZqdklotGSJD6UsdrRRzZsGLZKvlfaZBPVUAp0SMNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2h0p5+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2h0p5+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B411F000E9;
	Tue,  4 Aug 2026 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785837187;
	bh=hxpUfBjNZYgrt7oMJjoaEk3wE+WAiAHPnszVF9+WaxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2h0p5+oqbn3+FSS9+hKgmSvmsLzaWvx/ne5UhJPa+b0RkFCxRAGKviheV/t7FCcl
	 cUFAHxxmKoz5SdUx06Sj/ZibuZIFTlA5iSB9xokM9z14q5CnbKlGOwsnSD6OZKeCCq
	 UpvZjqk/dgGRvnEnnJsWkntxY3JGqYxBodpC7aUBJOpa5wHdYkuzCO4KiQBvoECobk
	 k7G+yiCU6yuEPu/SP+JvX7HKHIxqvBvlqyPTjaxyolj5GlSLJX6H5N9DeWZO19i9hw
	 EzzFS6LYLYJN6smJgeI23KDvjQyFOZgnefO1Fu1On+vq79AwPuoELR7Cc1cA3+b7bZ
	 JU/R1niMGiTag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 1/3] dt-bindings: ptp:
 renesas,rcar-gen4-gptp: Add R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803095232.3527111-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260803095232.3527111-1-niklas.soderlund+renesas@ragnatech.se>
 <20260803095232.3527111-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 09:53:05 +0000
Message-Id: <20260804095306.59B411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The standalone gPTP node will cause overlapping memory regions or =
schema validation failures due to conflicts with existing ethernet bindings.
--

--- Patch [1]: [PATCH net-next v6 1/3] dt-bindings: ptp: renesas,rcar-gen4-=
gptp: Add R-Car Gen4 ---
commit 1e91aef0621f1bc3f4049383c20bf5b76369d35b
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
   =20
This commit adds device tree bindings for the R-Car Gen4 gPTP timer. The
timer enables accurate clock synchronization and is shared among Ethernet
devices like RSWITCH, RAVB, and RTSN depending on the specific Gen4 platfor=
m.

> diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp=
.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779f0-gptp # S4-8
> +          - renesas,r8a779g0-gptp # V4H
> +          - renesas,r8a779h0-gptp # V4M
> +      - const: renesas,rcar-gen4-gptp
> +
> +  reg:
> +    maxItems: 1

[Severity: High]
Does defining this standalone MMIO region for the gPTP timer conflict with =
the
already-claimed gptp region required by the established Gen4 ethernet bindi=
ngs?

If a new standalone gPTP node maps the 0xe6449000 MMIO region on R-Car V4H =
as
intended, it will overlap with the existing renesas,ethertsn.yaml binding
which explicitly requires the gptp region (mapping the exact same address) =
in
its reg-names.

Defining both nodes in the device tree could result in overlapping memory
regions and cause runtime probe failures (-EBUSY).

If the overlap is resolved by removing the region from the ethernet node,
wouldn't dt_binding_check fail because renesas,ethertsn.yaml was not updated
in this patch series to make the gptp region optional or deprecated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803095232.3527=
111-1-niklas.soderlund+renesas@ragnatech.se?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E603E346ADA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278418; cv=none; b=LcHROcC5qRAl1wvmgTami7qDJIZ14b+m1aZrQ/hS88Wa3ANviC7peSV5U8PrUfAFCixpjQ57ufwMNwsMl5JcKPxS50Ma/O+P/+YOBxRAsysjkrTIYrg7cNkFs7x1UnOgh39JhV48OyP5JLqdN0mCQ9Vd7Q0vabSJqgSSLQNuQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278418; c=relaxed/simple;
	bh=Q9jCwvdcYINQrzyQEZB/kJwFTRk8BFtZbg4+F1brm04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SlTwK3DWQpSya7y9PjKPo6VC34yZ3GN3z2C1iqdJgmsLWOPbxQbGZ08p9xQk26VKVh/2O1AWBK/gnEGiykDCJnnVg/O3LLK1CoSHxLiHCKPrHuPsQmF9vFRC0UGcGwAoGuN/WmP2LRG9vwx163cFT9p6e8rrKabuinMcyLMdqb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5IRlcDP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5IRlcDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE191F000E9;
	Sun,  9 Aug 2026 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786278416;
	bh=RUVCeSmRxE46J+OlS7AkhvwfPcpKzAqzPp1jUmWgb78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5IRlcDPNHt9h53bR6iXVNCDCZZkSVIz2kjtWNKBigmaSqMzZYV3eYEdqy/TTEPZ4
	 xGIGp/64wILOm5C2UYO7vtSH7Nj/jJjkiTLN1qBol7bRkEi6UdZ/lgFG/FwBVn8WIg
	 wMBssdOSy1Rs6gbTWb7SUFeaXCFkFSBC0+hySCq2yYgr1/kPbDJB77rq1M9tNkodcp
	 onglB5WLvjKIVwR1Oew5wYzHsHvn/gAA0hXWQohyMdw+pYdmI8uppyNdrsUXRWb3Ug
	 QsMJ9ST60CF/FxJbtx0y2b25ojeTzas1B9lCLLjDtNhDutckHQgWR526sIx6ZR2gKp
	 Sf/ZoI0j3PeZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:26:55 +0000
Message-Id: <20260809122656.4CE191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unit address and reg mismatch in the dt-schema example causes `dt_b=
inding_check` to fail.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset ---
commit 97bcf50ad89703c7219aea4998995a3a045920b5
Author: Sven Peter <sven@kernel.org>

dt-bindings: reset: Add Apple SoC CIO reset

This commit introduces device tree bindings for the CIO (USB4/Thunderbolt)
reset controller on Apple Silicon SoCs. It defines both a standalone node
representation for t8103 and a syscon sub-node representation for t600x.

> diff --git a/Documentation/devicetree/bindings/reset/apple,t8103-cio-rese=
t.yaml b/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml

[ ... ]

> +examples:
> +  - |

[ ... ]

> +  - |
> +    power-management@28e080000 {
> +        compatible =3D "apple,t6000-pmgr", "apple,pmgr", "syscon", "simp=
le-mfd";
> +        reg =3D <0x8e080000 0x1c000>;

[Severity: Low]
Does this unit address mismatch the reg property base address? The node's
unit address is @28e080000, but the reg property uses 0x8e080000. This
typically causes make dt_binding_check to fail due to a unit_address_vs_reg
warning from dtc.

> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        reset-controller@1a034 {
> +            compatible =3D "apple,t6000-cio-reset";
> +            reg =3D <0x1a034 0x4>;
> +            #reset-cells =3D <1>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-b4-cio-res=
et-v1-0-4f33777d9b4b@kernel.org?part=3D1

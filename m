Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609282;
	b=hhYvntchmSFnpfJTiik5hLr7Vocn2sA9gCHNaW8wIZ95XO41neTDmazmAnTCBriiYalP
	 njcrW/v44ZAbODBiyjO6anYy7IUtk4+GahD6mj9l4WEwmzT1XEW8soRWZ3cHdTfuEPxqv
	 l1iJ1C0EtaUMquR9O6CzwEvWMwea/Qs614F9a+AC4jFiIBJ9IcR84sl3eoAuB69SfDv8g
	 jwBwf6N8KnN7tvLY822eM7bQJ40uCbVVAFn3MpXXF7u9A8NvKWJ7+hEmfth0mZG6awD6X
	 Sc5UUrkiL5TEmZmwwRr5oh3gJqRE/xD0Wg2nXuPdatn4ijiRujfuhX60p80RehgpIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609282;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AnCIx7hmDWF7Sg+9k+1s0xMtVFtG4ootIbpXirGz+rA=;
	b=iGJY3vL5KQ8SKNpjya6nNGGr2I1SmHPb5bhGirCPZkEqPnsnDdRev8NZJM1uT6cQivqd
	 AwNyudoNS6+0AcT+o1PofWYFxDuPKlF5NGG3lNUPaJzq0dTrX42dLeuP3YdMnuMNxlHcL
	 uPVAfOhM3IshoDaxByHH8u/NAaicttehFpdSEl4gHV0YqWwsOjgGkEJdc4gzrOFJIGRqY
	 awllTg40kLbnACLZWQx3S1mgwBPxlIaO42VPRTDc+f57ZlrcII0u8Cc75fxDzWNqQJ4Cs
	 0cMgoQt/cpVeSQtJz3sj/cgf+aKNGAsbTwKKOaK0o+zOt4JZY/vPxLhHqd5lrI8fmKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5WMzMwH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDF606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5WMzMwH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6B41F000C0;
	Wed, 25 Nov 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609282;
	bh=AnCIx7hmDWF7Sg+9k+1s0xMtVFtG4ootIbpXirGz+rA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C5WMzMwHZJM0WFdWpD9APQ1ROXcvhwWTTLANa09iWLeNhTp3DNYS4xQWbgPqV6Kff
	 ubcpjJWKKCQOv0cDmsj3jAB29N5Y36TbRBXcyGN1wRTwb6IOlCwIrym+N1Euh3MOPL
	 D8j7wD0ux9uhoBIvqYaIGohwgY8EGi4DMzVWrHD/rSijWTL0jJskRUNSBc67MbcZhh
	 kZzgd8Ai8Y4Io2MW/xPEwP8Y9kon1TiIKsnHu0jlB0COLhXZGaJupeom0CmZYOmr7t
	 sxrATQ+yFKDxqnjsb01oiLopiRMhIri3iipZLNdq/STPXPogDiHIEjGCW6OAJcJsbE
	 DnsR1w7IH/ylA==
Message-ID: <sashiko-outbox-233356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a08g046: Drop GBETH filter
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261125121448.180847-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261125121448.180847-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:21:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: renesas: r9a08g046: commit message cites dwmac-5.20
  instead of 5.30a
--

commit 820f5e22ff857b9ee742d15a64ef6dac9b4c7ea8
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Drop GBETH filter properties

This commit drops the snps,multicast-filter-bins and
snps,perfect-filter-entries properties from the eth0 and eth1 GBETH
nodes in r9a08g046.dtsi.

>     Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' a=
re
>     discoverable from the MAC hardware feature registers. The stmmac driv=
er
>     does not parse these properties for "snps,dwmac-5.20", and derives the
>     number of perfect filter entries and hash table bins from the hardware
>     feature registers instead.

[Severity: Low]
Should the commit message refer to "snps,dwmac-5.30a" instead of
"snps,dwmac-5.20"?  Both eth0 and eth1 in r9a08g046.dtsi use
compatible =3D "renesas,r9a08g046-gbeth", "snps,dwmac-5.30a".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125121448.1808=
47-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2

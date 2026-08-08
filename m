Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18AC3B2FD1
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186019; cv=none; b=jthG5ehx2QCJoK9K/pxlcp3+MFACx/Vxpo2XhefX2jx+7r1iUBcsmUHqUF9Dg4H26oJUu4rTr9tPQx3z0vfLtQUxdmDNJA2MMZHRbqmMoUL7uwHwWlTdWvJeHGGvB7f8iRy3CLujv6k6PpWiD4cHVjvbICWL5wBmqAjyjyeuSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186019; c=relaxed/simple;
	bh=HajdT04QKaVs10S4v/85l9Rp6v5S/jI8AK/rPCv9fT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWpRzSRJS/x/trm5bUHx8ImjbH6TZAZQLxF0md4L4cIA7+xQcSPJ3TsNGuTDYy6TcDId88AUWs5xpNhnmvlkFHsXm3tGoW4BzBfxHuKYupR5+vq4JvqieP6JGJMU+grFuM/uAATEjWrCvfSyqWHEcB53YDsVz2VUp86IZgd8gdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgDHxpha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgDHxpha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C16E1F00A3A;
	Sat,  8 Aug 2026 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186018;
	bh=gLwRLh7wNYi1TWpz2Q3paLdrMSujS4aRxCEl7f4UfcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DgDHxpha3yX7qJVdGu8PbzhX4ZpYrcnUvX8ozz6grHuFJph2Pm9ZweSI4NAEp8z/+
	 EQpBBTOjzjnqQKoNpfffDXvZ9w0yltQ+rBU1I/VXYnpVtBjJdvXyMlgwWKqMQykVZO
	 zSgTZkAyXZBuP8ig/Zok2PNbWLZKYn/VYBUoRd0GaTKCx2MAZu43ExaRxWujlc5+Ga
	 JQqDkvbUvEnWhUC1+OJfD8WWdlKXN0A/RiSxCKpRSulrC+rx1josS9t7EJETFwyVJ8
	 lQqcDZifdPKU66/QwIfYb6ljBq9mfD3qpMI/sU2uNps0JtmpPhT/1YYF23IZ2iWBnd
	 hqC4EBPq6Ta4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/20] net: dsa: xilinx: opt into TX forwarding offload
 on bridge join
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-18-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-18-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:57 +0000
Message-Id: <20260808104658.3C16E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Setting `ds->max_num_bridges =3D 1` restricts system-wide bridge a=
llocation and fails to reject a second bridge.
--

--- Patch [17]: [PATCH 17/20] net: dsa: xilinx: opt into TX forwarding offl=
oad on bridge join ---
commit 966c03a5b5314441d2f4752f9cd9e4603af2f3e5
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: opt into TX forwarding offload on bridge join

This commit sets tx_fwd_offload to true in port_bridge_join to let the
fabric handle per-port replication. It also sets ds->max_num_bridges to 1
with the intention of rejecting a second bridge.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> @@ -786,6 +800,9 @@ static int xlnx_tsn_probe(struct platform_device *pde=
v)
>  	ds->phylink_mac_ops =3D &xlnx_tsn_phylink_mac_ops;
>  	ds->priv =3D sw;
> =20
> +	/* The fabric offloads a single bridge across the user ports. */
> +	ds->max_num_bridges =3D 1;

[Severity: High]
Will setting ds->max_num_bridges to 1 cause system-wide bridge allocation
issues or silent hardware merging?

In a multi-switch system where another switch has already allocated bridge
ID 1, dsa_bridge_num_get() will assign ID 2. Since 2 is greater than
max_num_bridges, it fails with -EOPNOTSUPP, preventing this switch from
offloading even its first bridge.

Furthermore, if a user creates a second bridge, dsa_port_bridge_create()
returns -EOPNOTSUPP. In dsa_user_changeupper(), this error is masked to 0,
which allows the OS to bridge the port in software. Since the hardware
lacks isolation and will continue to flood packets across all ports, does
this silently merge the two networks?

> +
>  	platform_set_drvdata(pdev, sw);
> =20
>  	return dsa_register_switch(ds);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D17

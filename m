Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8743553B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009666; cv=none; b=S2NHjuZYsgFYSf8BF8pHzIJ+arHDIj2J42fapZvfwuZhe7SIxB0Ufm2vglscXLdqRk9JWyTPb3RJYDyHItyW9QRpQIrPP0sZv336t8iPgI+OuepxpQWZY1nJPlTDqMtsBw93RpmGFl8togSIRchqqXL3FoZkcEuNwE8K3liAKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009666; c=relaxed/simple;
	bh=UjsYZJ2PVQ8dnrKup5HR8cdzIPf7TkczKvvp5p0OjRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T1dgLxrHFWvWdZoo+C4MnuywsejoOgqki1GRpzqCwpEs5l9MJ1p8Fa64AQnqPWyKlbh1WbbCJm9TfDCDJB55CkvrawszRgTE92JuN73+w4yXX9veQfMCD/FR6bo7UWXgbWuXiWRPml4g3QmJxJDzHaq+ifxpAVcRZJhRg94LCHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw2c9B2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw2c9B2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356B81F000E9;
	Thu,  6 Aug 2026 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009662;
	bh=WPEIGPolk7IBZlP8e2/0YKOfCxDD3cDeIU2tunGd110=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aw2c9B2N+9pArJHxBiWPChkcgvwA7kOPUHRxbBSwqYY9OIeE+riyDqYw1UMAWddlY
	 f7R0TAo4gTvgtLPc3O+JQ+NeE2jSaCD5vqJuaY7uECS/meMu836ObIQB0lG8Hy5muO
	 hIBxCg1BvjX4wSCNAN20kjuUfaqttoUXiiCl4fFlBN84qF4dV9lkatn9HlmqKUloPV
	 wycwXoHX9M1lE9wBfZeYqiRlFeR3UOA2pf0z3iL0ff+JdZU2Gf+swyOVbCyRpApWUq
	 3i4Hy16UDEDLSVm9STAt/TynSCiFGJLOt5mXSZjLcqXk2LR5v2Xsv+bZ+CiIgCPFq+
	 7++UeBJbiI1sA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in
 vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806093519.2907771-3-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-3-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:47:41 +0000
Message-Id: <20260806094742.356B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete implementation and write-only dead code: the `dumpabl=
e` flag is introduced and set, but the promised kdump filtering and overlap=
 checks are missing.
--

--- Patch [2]: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in=
 vmcore ---
commit 873defcf6278254b5c39d8d3500f986e38a79da0
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: add dumpable flag to opt-in vmcore

This commit adds a dumpable flag to struct reserved_mem to track whether
a reserved area should be included in the kdump vmcore. It sets the flag
for CMA regions to true in rmem_cma_setup().

> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_=
mem.h
> index e8b20b29fa68c..55a67cee41ea0 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -15,6 +15,7 @@ struct reserved_mem {
>  	phys_addr_t			base;
>  	phys_addr_t			size;
>  	void				*priv;
> +	bool				dumpable;

[Severity: Medium]
Is the logic that checks this flag missing from this patch?

The commit message states that non-dumpable regions are later marked
MEMBLOCK_NODUMP, and that the flag is used to check for overlap with
/memreserve/ entries. However, this flag appears to be write-only,
as there are no corresponding checks or calls to memblock_mark_nodump()
implemented in this commit.

>  };

[ ... ]

> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index f754079a287d6..63ff134dadd42 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, =
struct reserved_mem *rmem)
>  		dma_contiguous_default_area =3D cma;
> =20
>  	rmem->priv =3D cma;
> +	rmem->dumpable =3D true;

[Severity: Medium]
Does setting this flag have any effect?

Since the promised kdump filtering and overlap checks are missing from the
code, this assignment currently acts as dead code. Were those checks meant
to be included in this submission?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D2

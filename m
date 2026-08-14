Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB782C027B
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697240; cv=none; b=kMsnMhaCa6bQyhiYLCwISXM8jt6JROGdjC/eQLZb65XL7+eQFA2SuKoKw4AprGkfmsd6btyaTe0rirSWXh1O3pK8Ynelyxa4XsVKlt8KG6yxSbxoiqUEfWdYsy0bHLv2BNISOTunia62cWfQlhdZ6JRgpzjCVyqL+IHOLjSWXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697240; c=relaxed/simple;
	bh=Vgd3Q44kqJRqgaBsQmuEsJJSs3Co0GBcE6V472jwNrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PHlSNqEyTifJZG6HVmkXUIgZvsVYwcmiqRZDtTZJYSe03wZCeQ/Q2s4X1qrSEpV2WfFqFhzsxM2kx+2ZXwgWYSKmeSCRMTOahCovdn2PMmHJbJrShNKIf+1PXNvBYMavqOSDWuOWi+KmcbIfyNqcACewvntZmLa+pdF2q0zfvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEYD5LhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEYD5LhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C341F000E9;
	Fri, 14 Aug 2026 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697238;
	bh=6VVSfKOP6djzlAvKGTsAM4uD1eL/c7zJjv1uc+YtnZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEYD5LhVVm5yKEbV+j2gwzD7m8EQRRhOakl52Mfh3Al0OYB3pY3HrXVB3m9YsCTDF
	 chcJ55I9uus1ABe+SYO84vleCeba0XBrVtPHYy7gviAVIsE5qV5pVEllTdSdwebXJV
	 sHAFNbs4c5n3BYDBVL0wKKiizkCoiqgZv4vRVBrCZfCkXg5ha/2eyZ20Rfe+zX4USy
	 zYS4gZwXf8rFBTBp0Y6clBHBtHTD78uuCTgkvik+FH+pond5cfHm5jl0gERO49Q4uZ
	 ZlUmkskUq4h4DwI30RNuV/3Px8umteFpKf1j+UF7U+ZDYVWQqttrlBI9RFZGAz8GWN
	 9VVMOD3cgZnYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] of: reserved_mem: reject statically placed regions
 overlapping existing reservations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814081443.1061046-3-chenwandun1@gmail.com>
References: <20260814081443.1061046-1-chenwandun1@gmail.com>
 <20260814081443.1061046-3-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:47:17 +0000
Message-Id: <20260814084718.29C341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Rejecting partially overlapping reserved memory regions without ca=
lling memblock_reserve leaves non-overlapping parts exposed to the buddy al=
locator.
- [Low] The overlap error message prints an exclusive end address using a f=
ormat conventionally used for inclusive ranges, and can wrap around to 0 on=
 integer overflow.

Pre-existing issues:
- [High] The patch fails to reject overlaps for 'no-map' regions, leaving t=
he memory corruption vulnerability it intended to fix fully exploitable in =
that case.
--

--- Patch [2]: [PATCH 2/3] of: reserved_mem: reject statically placed regio=
ns overlapping existing reservations ---
commit 5a1dc7b658795d38b565b07f22ac870257f66deb
Author: Wandun Chen <chenwandun@lixiang.com>
Subject: of: reserved_mem: reject statically placed regions overlapping exi=
sting reservations

This patch rejects statically placed reserved memory regions that overlap
with existing reservations. It prevents the overlapping memory from being
used concurrently or returned to the buddy allocator if a region's driver
fails to initialize.

Link: https://lore.kernel.org/all/20260806100605.2C2C01F000E9@smtp.kernel.o=
rg/ [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index f20747725de42..67cb60616fc69 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -146,6 +146,15 @@ static int __init early_init_dt_reserve_memory(phys_=
addr_t base,
> =20
>  		return memblock_mark_nomap(base, size);
>  	}

[Severity: High]
This is a pre-existing issue, but in early_init_dt_reserve_memory() does the
overlap check for nomap regions fail to detect overlaps between two nomap
regions?

Because memblock_mark_nomap() does not add the region to memblock.reserved,
a second overlapping nomap region bypasses the check. If the second driver
later fails and clears the flag, could memblock_free_all() release the memo=
ry
to the buddy allocator while the first driver is still using it?

> +
> +	if (memblock_is_region_reserved(base, size)) {
> +		phys_addr_t end =3D base + size;

[Severity: Low]
Does this calculate an exclusive end address instead of an inclusive one?

If base + size reaches the physical address limit, could this overflow to 0
and print a misleading log message?

> +
> +		pr_err("Reserved memory: [%pa-%pa] overlaps an existing reservation, i=
gnoring\n",
> +		       &base, &end);
> +		return -EBUSY;

[Severity: High]
If a statically placed region only partially overlaps an existing
reservation, does returning -EBUSY here without calling memblock_reserve()
leave the non-overlapping parts exposed to the buddy allocator?

To safely protect the non-overlapping physical pages from being used for
general kernel use, should the code still call memblock_reserve() before
returning -EBUSY?

> +	}
> +
>  	return memblock_reserve(base, size);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814081443.1061=
046-1-chenwandun1@gmail.com?part=3D2

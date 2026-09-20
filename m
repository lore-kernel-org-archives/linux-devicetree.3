Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE03F20F9
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898631; cv=none; b=SMW5uGCpC6mxKwpOPCUPxqXAKkBZ3+o67buNrNQxMBlBpKAsvzL69seuo+yx/PaEwppukb/UMJBwxFGFsp9hmmsLDvewa6Cv5lxA4B9El6BsjXsG2DW/Ot0eEhhwolZWcSQnNqhLw7aXWnpD0ii3msX48wGNxI/brSDpyyYf4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898631; c=relaxed/simple;
	bh=EnxpzJSEHXINI/wRnRyilLXIqawY0qL3ie093H9W018=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VH1aejuHQJPBYJaMrCD4DYmBlHKvf7QNaEVnJnu7k3TSZl2mjvasAFgXohtVTIJWq4MHzPAeWvnk7AFHgtvqIf9Mx4VDU1fSUkeJSo1nTGwHNleKpZe82EmkrruXnz1AH87tIKKMV6Ns6cllSNRFZFRol0+gUrIPv3knTjFvcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4f3Fxkp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4f3Fxkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D08A1F000FF;
	Sun, 20 Sep 2026 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789898627;
	bh=CE5rmOVNTyCjnBnZ80V/DqJobrrwhSTAG8KHTeesDyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b4f3FxkpSCqX/eMRsNsSiZwQXcJzdC1ttyJYA1vcmUYhw9xZfW7HZxhvcMJ5Tpmdz
	 WVDpc8m988eIw+JZrULC/ggqTe2AyEQiHjfu02Dsg+QXLyo6rWq5agjX2hcSbVqVpW
	 61mENtRsllluVualS3GtuoZa0V1WcAyNJrgYMOLQNgKoWmTOZ1sCTzsu8NG7WamtH4
	 3C1lQaVf5cCh21u9k1jyyE8/ydGwJI163V1PMqhGZFZYP4m3czZVALYRQhYno5hulJ
	 x5y14rB9ax+7UbmYOwcf5tj776CKtt3grEm9tqLwHObe/kl6KHrMiZ048TPchYuAhy
	 JrLIEDg+pRzVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] of: reserved_mem: reject static regions
 overlapping no-map memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920092852.614973-5-chenwandun1@gmail.com>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
 <20260920092852.614973-5-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 10:03:47 +0000
Message-Id: <20260920100347.9D08A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: reserved_mem: integer overflow in rmem_overlaps_check bypasses=
 overlap detection
--

commit bab4bcea3e71f149872f45d815c003c14a811a0a
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: reject static regions overlapping no-map memory

This commit updates the reserved memory initialization to reject static no-=
map
regions that overlap with existing reserved no-map memory. It also skips
no-map regions during the late scan if they overlap with already reserved
ones, preventing multiple drivers from mapping the same physical memory.

Link: https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kern=
el.org [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 3a6c6dbfd7b11..8d2057f2ac12e 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c

[ ... ]

> @@ -266,6 +267,20 @@ static void __init __rmem_check_for_overlap(void)
>  	}
>  }
> =20
> +static bool __init rmem_overlaps_check(phys_addr_t base, phys_addr_t siz=
e,
> +				       int start)
> +{
> +	int i;
> +
> +	for (i =3D start; i < reserved_mem_count; i++) {
> +		struct reserved_mem *r =3D &reserved_mem[i];
> +
> +		if (memblock_addrs_overlap(base, size, r->base, r->size))
> +			return true;

[Severity: High]
Does this code allow an integer wrap-around to bypass the overlap check?

The size variable read from the device tree is used without being bounded by
memblock_cap_size() before calling memblock_addrs_overlap().

If a crafted device tree or overlay defines a static reserved memory node
with a size large enough to cause base + size to wrap around phys_addr_t,
the internal addition in memblock_addrs_overlap() could wrap. This would
cause it to incorrectly return false, bypassing this overlap check.

The region then reaches memblock_is_region_rsrv_rmem(), which does cap the
size and finds the valid overlap marked by an earlier valid region, allowing
multiple reserved memory regions to be mapped to the exact same physical
memory.

> +	}
> +	return false;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920092852.6149=
73-1-chenwandun1@gmail.com?part=3D4

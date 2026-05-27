Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36679361DB8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779908682; cv=none; b=l43eIxMs3/9mGQ+8Vfeuj3xEAeI+S9FnVGFQysjmy64IIVZypN+GkaY67cMZGO/oYQGQWCwLeQfQmJQCFxj6E1Wl12OUmZJ3r31YS4XXH3xHAyPC6OU4vjGwI/gFg1kAbJzE9SkGZVr5Ger6oqT/xvWFF7h1EH/46sMtJhsRht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779908682; c=relaxed/simple;
	bh=xv3kbBvJlfxLmtEXUwoHSKNtOA4x2O9cqvK4hB4RvkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+v1HLNsdCQesbc8+ceHcZiJtNbZa8mfSa0WIvCk2H5RE83+kAI9QxmmfSba/iPhWr+xN0DdHk8pojM/y8oAyuEnac4NafY6p4juPNW/IZdAPYwphRHuDLnAnsiSqhk/7SeHnEJxSgSYrTgn8rCKusq3m8whQ+w9E2xAVeNTUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obWeDNQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obWeDNQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB221F000E9;
	Wed, 27 May 2026 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779908680;
	bh=Q4f+KPvnRuKDj0oIWjaKEbHc/baFu46qsEezs1WQ9Hc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=obWeDNQzkcKbv9GwBXc5Thq19boDPRMwsRPpbvQw9a/xujYevVgyO7Qa1kbl+hqLz
	 y8i40SpuIoXdTf+ualLzYeQUvaOhXHBnOytt6LLLxHGpbtIYbvupa87KpkTsPNm8GI
	 KglTtqohNsFNChunKBqKk+UR94oam8Y7mVqHRbJG0jQJCS0M+XWn5yV5OYeFLWQ1tn
	 3bZfrYLgW+ZICFcOqJobCTt4m8oQI339ViRlmvYdu36IFKxr9gq8w8KIfV3U6qRwiw
	 Ew2iIXUHiY/cgIkOr+gCZ1I7Ua/rWgQE088NJx9mUkjlf606oCKLVRSWTVpvWuOIRS
	 ROn2a2T5FWVzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/13] mtd: spinand: run PHY tuning after init and
 update dirmap frequencies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527175527.2247679-12-s-k6@ti.com>
References: <20260527175527.2247679-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 19:04:39 +0000
Message-Id: <20260527190440.9DB221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Mutating `spi_mem_dirmap_desc` fields after creation bypasses SPI =
controller hardware configuration and validation checks.
- [High] Validated frequencies from `read_cache` and `write_cache` are blin=
dly applied to mismatched or unvalidated secondary operation templates.

Pre-existing issues:
- [High] Teardown symmetry violation in `spinand_remove` leads to a Use-Aft=
er-Free of the `spinand` device and memory leaks if `mtd_device_unregister`=
 fails.
--

commit 82e2a165fb470e6047a759242be19d68a59ffe43
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spinand: run PHY tuning after init and update dirmap frequencies

This commit modifies spinand_probe() to run PHY tuning after spinand_init()
has completed. It then directly updates the dirmaps with the newly validated
maximum frequencies for both primary and secondary operation templates.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c

[ ... ]

> @@ -2050,6 +2050,41 @@ static int spinand_probe(struct spi_mem *mem)

[ ... ]

> +	if (!ret) {
> +		struct nand_device *nand =3D spinand_to_nand(spinand);
> +		int i;
> +
> +		for (i =3D 0; i < nand->memorg.planes_per_lun; i++) {
> +			if (spinand->dirmaps[i].rdesc) {
> +				spinand->dirmaps[i].rdesc->info.primary_op_tmpl.max_freq =3D
> +					spinand->max_read_op.max_freq;

[Severity: High]
Does mutating spi_mem_dirmap_desc fields after creation bypass the SPI
controller hardware configuration and validation checks?

The dirmap is fully initialized earlier during spinand_init(), where
controllers execute their dirmap_create callbacks to calculate clock
dividers and cache hardware registers based on the initial max_freq.

If we directly mutate the frequency here without notifying the controller,
will the hardware remain configured for the old, un-tuned frequency while
the SPI core assumes the new frequency, potentially causing a state
desynchronization or data corruption?

> +				spinand->dirmaps[i].rdesc->info.secondary_op_tmpl.max_freq =3D
> +					spinand->max_read_op.max_freq;
> +			}
> +			if (spinand->dirmaps[i].wdesc)
> +				spinand->dirmaps[i].wdesc->info.primary_op_tmpl.max_freq =3D
> +					spinand->max_write_op.max_freq;

[Severity: High]
Is it safe to apply the validated frequencies from the read_cache and
write_cache templates directly to these other operation templates?

The PHY tuning is executed specifically on the write_cache and read_cache
templates. However, wdesc->info.primary_op_tmpl is based on update_cache,
and rdesc->info.secondary_op_tmpl is used for cont_read_cache.

Since these operations utilize different opcodes and potentially different
dummy cycles, could applying the frequency of one tuned operation to a
different unvalidated operation cause silent data corruption?

> +		}
> +	}
> +
>  	ret =3D mtd_device_register(mtd, NULL, 0);

[Severity: High]
This is a pre-existing issue, but can spinand_remove() cause a use-after-fr=
ee
and memory leak if mtd_device_unregister() fails?

If mtd_device_unregister() returns an error code, spinand_remove()
immediately returns this error and skips spinand_cleanup(), leaking
databuf and scratchbuf.

Because the SPI framework's wrapper spi_mem_remove() returns void and ignor=
es
the error, the driver core will proceed to unbind the device and free all
devm_kzalloc allocated memory, including the spinand structure.

Since the MTD device wasn't unregistered, the MTD subsystem retains active
pointers to the freed spinand structure. Could this lead to a use-after-free
vulnerability upon subsequent accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D11

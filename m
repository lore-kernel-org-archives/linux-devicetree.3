Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FACE38BF9C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308958; cv=none; b=HIBNbzw54VpmPjivf2rLbW0jC3FNEOWSyaymLjhJWe02KzQ7v5WiTsJQH1ySRmz+gGtFJeh8+nYcy7Am3uNJuZjjU6Krlce4bbignbiF1UsdKmwkaB0+5g/h8nEsXXoN5/wFnoUoio6n1EWegMqZOijTxCVyMiltl8yMb98xW38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308958; c=relaxed/simple;
	bh=X9mKZdkXaI7yj5FqQXNqD24oS2TNmz52TUeY/sNBH3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I9em+JYthDZyzylq0fBp7UVO9wWbj0MNtJ6ApV2jeAmKBol+Kxi+XSGcvr/PrrCxk+eyPbZ5VgNYjWUXsGru/wxK3ExEvgS/tSxxdWkeS0rhB0cu0LJnEr3Ohl0XJxakY4E+ZRq1mseffDaZY0/RQ7nZzm8L9Tlp11Jo0mh/QNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExPZIAuB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExPZIAuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BF61F00893;
	Mon,  1 Jun 2026 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780308953;
	bh=RmUKldAJK+JDH7XdzzKlhAu5SsWar1/NaYKXDQVQEhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExPZIAuBWilMDADY3Je9rKZm4aAXdBQKE6Y60ZHRProrWHrAvc44+Hv1rDzvxTNRE
	 YJGjeo9+KoXFn89o+rxEyq6DUvdYPev8ALfGfAdtbHdpf1+AUNcYDcziQwYySamSmi
	 k1JzFBfXuDbWRQXfZjRrk3EJ24tE2lruS8Ht3Af2IzUKlGt7KLsdCFnlcpy95O2bDp
	 +FN+MTx+n0kBPxbOoeQ8a1uqkufJ1kEvChZqiUgknYqe7C/8UK9GMrg0fdfEryLnMW
	 /ZiLN7DzK5TFr2juaEqKOEMCJ5CQcW3sgoYbUwJ+gmNVknn961rao7/7/tdLpAeN2f
	 9ZH3yUydJuZog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 06/23] kexec: Extract kexec_free_segment_cma() from
 kimage_free_cma()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601094805.2928614-7-ruanjinjie@huawei.com>
References: <20260601094805.2928614-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:15:53 +0000
Message-Id: <20260601101553.93BF61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] kimage_load_cma_segment() leaves the trailing padding of CMA segme=
nts uninitialized, causing kexec purgatory SHA256 verification failures.
--

commit a9d6d83b4aab10c874e37c5a865249c7645d1e82
Author: Jinjie Ruan <ruanjinjie@huawei.com>

kexec: Extract kexec_free_segment_cma() from kimage_free_cma()

This patch extracts the single-pass CMA release logic into a dedicated expo=
rted
helper kexec_free_segment_cma(). It refactors the main kimage_free_cma() to
invoke this helper sequentially to maintain backward compatibility while
expanding single-slot flexibility.

> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index a43d2da0fe3e7..9195f81e53c48 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
[ ... ]
> -static void kimage_free_cma(struct kimage *image)
> +void kexec_free_segment_cma(struct kimage *image, unsigned long idx)
>  {
> -	unsigned long i;
> +	u32 nr_pages =3D image->segment[idx].memsz >> PAGE_SHIFT;
> +	struct page *cma =3D image->segment_cma[idx];
[ ... ]
> +	arch_kexec_pre_free_pages(page_address(cma), nr_pages);
> +	dma_release_from_contiguous(NULL, cma, nr_pages);
> +	image->segment_cma[idx] =3D NULL;
> +}

While reviewing this patch, I noticed a pre-existing issue in the related
kimage_load_cma_segment() function in the same file:

kernel/kexec_core.c:kimage_load_cma_segment() {
    ...
	/* Then copy from source buffer to the CMA one */
	while (mbytes) {
		size_t uchunk, mchunk;
    ...
		ptr    +=3D mchunk;
		mbytes -=3D mchunk;

		cond_resched();
	}

	/* Clear any remainder */
	memset(ptr, 0, mbytes);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this memset actually cl=
ear
the trailing padding?

The while loop terminates when mbytes reaches 0, which translates the memset
to memset(ptr, 0, 0). Because kexec purgatory calculates the SHA256 digest =
of
the entire segment assuming the padding is zeroed, could the uninitialized
memory lead to a digest mismatch and cause kexec boot failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D6

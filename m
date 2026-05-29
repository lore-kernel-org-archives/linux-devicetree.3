Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE041288B1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050093; cv=none; b=RaEbarBmpLUBpdLdn80qLs/zZ9dU6zO+uk98aqhOMRnM/2NOQfJ7sZZgFf1/h0eoCw7HV6/JPhOAZFSOhlivn0mWlN5JASto2Oft4fLkcLoo63cyLILn1DkfUaR35an/G7be3+usKrZWTIdDlHC5xK0rEhA6bh1CJtf7V9dOdk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050093; c=relaxed/simple;
	bh=4r7F8p1D1dshQf2R+Vl/kYg2GFb14SxAHMTMpm18un8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=higsiHjSWCs5C8F0Z9m7KAHDS1zeoHEH2yUaOfnrsPfkN8MkNbXrowNu12Bfrafxn6tsOZ95qBuKE9zBAqAf+3qf712HgoiVPE2828XloP4HjIpwZ7FKslaJgDSKsCdV1g9qjVwpC+HYmbs+CMMQgZBOKuq7tHEcyz8rDeaOeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu1/OFo9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu1/OFo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A3A1F00893;
	Fri, 29 May 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780050091;
	bh=U/ExPB57ltFByD0QzqPDgDg7H2JiggYzMtFQNveRyGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nu1/OFo9x2JHTKJC0GrRLm3a3EFkbHYBHNkhpuEYFij9WOMQonIdwMF1fWJVEK/zw
	 BLfeMbB1XFVT2clA0E6bk8nMWhbbbdQOVHJMtgSh6znAa1abJWRySa+Uz3kKVYMarj
	 lRGFD8hd7qcIIxzdKFHxrAw9k9uI60kzu3foeosVWQUfS16y9ThKavKubseLk4+Af5
	 2Ch//vKpZtMFfOCBdkJn7BDClW95qP6PuLdpPHRdsrriNxo8uxHa7ms9LaaL29WWiT
	 Z1Q8UKKJPHKVPn8NZARw+vnBZl5zoghcjVMkGdV74BTfFeBpKlniDPmF4guy0nEOTO
	 sWAc6tCwkTBWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/10] ACPI: APEI: GHES: move estatus cache helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-4-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-4-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:21:30 +0000
Message-Id: <20260529102131.20A3A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The macro GHES_ESTATUS_CACHE_LEN() can overflow when calculating t=
he cache allocation size if the CPER record length is maliciously large.
- [High] ghes_read_estatus() reads the CPER error status header from hardwa=
re memory twice, creating a Time-of-Check to Time-of-Use (TOCTOU) vulnerabi=
lity.
- [High] cper_estatus_len() integer overflow bypasses length validation che=
cks, leading to out-of-bounds reads.
--

commit f4f08f05fe70448a89bd543c421db6376b61be52
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: GHES: move estatus cache helpers

Relocate the estatus cache allocation and lookup helpers from ghes.c into
ghes_cper.c. This code move keeps the logic intact while making the cache
implementation available to forthcoming users.

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 8080e0f76dac4..0a117f478afb7 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c

[ ... ]

> +static struct ghes_estatus_cache *ghes_estatus_cache_alloc(
> +	struct acpi_hest_generic *generic,
> +	struct acpi_hest_generic_status *estatus)
> +{
> +	int alloced;
> +	u32 len, cache_len;
> +	struct ghes_estatus_cache *cache;
> +	struct acpi_hest_generic_status *cache_estatus;
> +
> +	alloced =3D atomic_add_return(1, &ghes_estatus_cache_alloced);
> +	if (alloced > GHES_ESTATUS_CACHE_ALLOCED_MAX) {
> +		atomic_dec(&ghes_estatus_cache_alloced);
> +		return NULL;
> +	}
> +	len =3D cper_estatus_len(estatus);

[Severity: High]
This is a pre-existing issue, but does cper_estatus_len() have an integer
overflow that bypasses length validation checks?

The cper_estatus_len() function calculates the record length by adding two
32-bit fields (such as raw_data_offset + raw_data_length or
sizeof(*estatus) + data_length).

Because the return type is u32, can an attacker controlling hardware memory
set large values that sum to a small wrapped result?

This small wrapped length could easily bypass the bounds check in
__ghes_check_estatus(). However, downstream functions like
cper_estatus_check() and apei_estatus_for_each_section() iterate up
to estatus->data_length without verifying it against the actual allocated
buffer size, which might cause the kernel to read far out-of-bounds of the
ghes->estatus heap buffer.

> +	cache_len =3D GHES_ESTATUS_CACHE_LEN(len);

[Severity: High]
This is a pre-existing issue, but could GHES_ESTATUS_CACHE_LEN() overflow
when calculating the cache allocation size if the CPER record length is
maliciously large?

GHES_ESTATUS_CACHE_LEN(len) adds sizeof(struct ghes_estatus_cache) to the
32-bit len. If an attacker bypasses the initial length validation, perhaps
via the double-fetch in ghes_read_estatus(), they could supply a
maliciously large length like 0xFFFFFFF0.

The sum would wrap around a 32-bit boundary, resulting in a tiny cache_len.
gen_pool_alloc() might successfully allocate a small buffer, but the
subsequent memcpy(cache_estatus, estatus, len) would copy a massive amount
of data based on the original un-truncated len.

Could this lead to a heap buffer overflow?

> +	cache =3D (void *)gen_pool_alloc(ghes_estatus_pool, cache_len);
> +	if (cache =3D=3D NULL) {
> +		atomic_dec(&ghes_estatus_cache_alloced);
> +		return NULL;
> +	}
> +	cache_estatus =3D GHES_ESTATUS_FROM_CACHE(cache);
> +	memcpy(cache_estatus, estatus, len);
> +	cache->estatus_len =3D len;
> +	atomic_set(&cache->count, 0);
> +	cache->generic =3D generic;
> +	cache->time_in =3D sched_clock();
> +	return cache;
> +}

[ ... ]

> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 6b7632cfaf667..1b5dbeca9bb69 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h

[ ... ]

> @@ -98,5 +101,8 @@ int __ghes_read_estatus(struct acpi_hest_generic_statu=
s *estatus,
>  			u64 buf_paddr, enum fixed_addresses fixmap_idx,
>  			size_t buf_len);
>  #endif

[Severity: High]
This isn't a bug introduced by this patch, but does ghes_read_estatus() read
the CPER error status header from hardware memory twice, potentially creati=
ng
a Time-of-Check to Time-of-Use (TOCTOU) situation?

It appears ghes_read_estatus() first copies the header via
__ghes_peek_estatus() to validate the record length using
__ghes_check_estatus(). It then calls __ghes_read_estatus() to copy the
entire record, which overwrites the previously validated header with whatev=
er
is currently in hardware memory.

Could a malicious PCIe device or firmware race the kernel, altering length
fields between the two fetches?

This might completely bypass the bounds check, allowing unvalidated
out-of-bounds lengths to reach downstream parsing functions, which could
lead to out-of-bounds reads and memory corruption.

> +int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
> +void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
> +			    struct acpi_hest_generic_status *estatus);
> =20
>  #endif /* ACPI_APEI_GHES_CPER_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D4

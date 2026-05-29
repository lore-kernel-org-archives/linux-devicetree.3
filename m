Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915B31578E
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051025; cv=none; b=Cg1VwUTg8o67IJPMW3TbwSzTIpXUWEv7lfhziP2kPxJbvVi8kPEuDMcvV40JbPBC0DsfpKEjMTplar8Vx3PA5JOEYnPdQWctqoDcgzZGa+Lqj3kEyFo8r7o1c1KtNNmW+7D9Y5Og0kXB5hs/SOQwBNOTY5iUomKUY0Rhas1ydsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051025; c=relaxed/simple;
	bh=krMyGA165pU/nGPZdK8rwDiqvewdUe88CjPyxDEdicA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a17tlq93TzPHLZRpsDndt8eqmVAtU1LIotaXILOrVZamxmJ+H0HyVVJu7uSNv9lykJDzJxbQclbmhcA6BaNBbPPYvsx1R4C/ak4wGPlHoTk6xbB6W7JzdWfKcrTolGdSh4hXYveopMLq5DFI7x+sX5YREZg6ZtYYfSpp/6LTA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT/qEJRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT/qEJRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA19D1F00893;
	Fri, 29 May 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780051024;
	bh=2Cty7MQyrzaNaooqIY2wQM3OIvpPKbKMd5YUgje+Hcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TT/qEJRQuiTUAkzc2+uKA4gw11nHxAt+FM8wjbLaj+INy0i+0rEwzFd0Raz2n+z7H
	 e/aBOarNk+sJJwqwE9SQdwPFqZHby7eJFnGrFxsUPLr9ypLzPCNDsLiVssitYVYZ4/
	 aMH//P+tS9QJdW6fAlK9//49xZbAKNRCUR0IxF+S8s9lX1q3+BOhfTg06VxmiUMDYp
	 gydgy0rGx000hZfh1R5cMVTFAJL0befW33Oy5uGaZeDQEF8EBee7LNo3xcJWDJnyag
	 PMsPhsVdKCiOIIaUbuVBxRboP77wtfSvWbpjxNl8qaNIDFmkxzVieKPYtZb0lUHePa
	 uglf6fQWZyTgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/10] ACPI: APEI: GHES: move CPER read helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-2-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-2-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:37:03 +0000
Message-Id: <20260529103703.EA19D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double-fetch of the CPER error status block header allows firmware=
 to bypass buffer size checks, leading to an out-of-bounds read.
- [High] Integer overflows in the calculation of the CPER error status bloc=
k length allow malformed firmware input to bypass length checks, resulting =
in a heap out-of-bounds read.
- [High] The `ghes->estatus` buffer is allocated using an unvalidated `erro=
r_block_length` from the HEST table, leading to a heap out-of-bounds write.
- [High] The read-modify-write logic in `ghes_ack_error()` incorrectly mask=
s the register, unintentionally clearing unrelated bits.
--

commit 17341f98c8d36be1c04bc4974f68881b7a10feb7
Author: Ahmed Tiba <ahmed.tiba@arm.com>
Date:   Fri May 29 09:50:42 2026 +0000

ACPI: APEI: GHES: move CPER read helpers

This commit relocates the error buffer mapping, peek, and clear helpers
from ghes.c into ghes_cper.c so they can be shared with other
firmware-first providers. This commit only shuffles code and the
behavior remains the same.

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> new file mode 100644
> index 0000000000000..7bb72fe578384
> --- /dev/null
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -0,0 +1,195 @@
[ ... ]
> +static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
> +{
> +	int rc;
> +	u64 val =3D 0;
> +
> +	rc =3D apei_read(&val, &gv2->read_ack_register);
> +	if (rc)
> +		return;
> +
> +	val &=3D gv2->read_ack_preserve << gv2->read_ack_register.bit_offset;

[Severity: High]
This is a pre-existing issue, but does this bitwise logic unintentionally
clear unrelated fields in the register?

When the preserve mask is shifted left by a non-zero bit_offset, it
introduces zeroes into the lower bits.

Applying this shifted mask to the original value using bitwise-AND will
unconditionally clear all bits below the bit_offset.

Could this destroy unrelated functional fields sharing the same register
during the subsequent apei_write()?

Additionally, what happens if the bit_offset is 64 or greater?

> +	val |=3D gv2->read_ack_write    << gv2->read_ack_register.bit_offset;
> +
> +	apei_write(val, &gv2->read_ack_register);
> +}
[ ... ]
> +/* Check the top-level record header has an appropriate size. */
> +int __ghes_check_estatus(struct ghes *ghes,
> +			 struct acpi_hest_generic_status *estatus)
> +{
> +	u32 len =3D cper_estatus_len(estatus);

[Severity: High]
This isn't a bug introduced by this patch, but can this length calculation
overflow and bypass the size checks?

The cper_estatus_len() helper calculates the length by adding
raw_data_offset and raw_data_length (both 32-bit unsigned integers). If
their sum exceeds 0xffffffff, the result wraps around to a small value.

If len is small enough, it bypasses the max_len check here, but a massive
data_length could still bypass the cper_estatus_check_header() validation.

Could this allow malformed firmware input to trigger a heap out-of-bounds
read later during section iteration in cper_estatus_check()?

> +	u32 max_len =3D min(ghes->generic->error_block_length,
> +			  ghes->estatus_length);
[ ... ]
> +/* Read the CPER block, returning its address, and header in estatus. */
> +int __ghes_peek_estatus(struct ghes *ghes,
> +			struct acpi_hest_generic_status *estatus,
> +			u64 *buf_paddr, enum fixed_addresses fixmap_idx)
> +{
[ ... ]
> +	ghes_copy_tofrom_phys(estatus, *buf_paddr, sizeof(*estatus), 1,
> +			      fixmap_idx);

[Severity: High]
This is a pre-existing issue, but does this copy operation write past the
end of the allocated heap buffer if the firmware provides a tiny size?

In ghes_new(), the ghes->estatus buffer is allocated using the
error_block_length from the hardware error source table. While there is a
maximum size check, there appears to be no minimum length enforcement.

If the firmware specifies an error_block_length smaller than
sizeof(*estatus) (20 bytes), won't this unconditionally copy 20 bytes into
a smaller buffer and corrupt memory?

> +	if (!estatus->block_status) {
> +		*buf_paddr =3D 0;
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +			u64 buf_paddr, enum fixed_addresses fixmap_idx,
> +			size_t buf_len)
> +{
> +	ghes_copy_tofrom_phys(estatus, buf_paddr, buf_len, 1, fixmap_idx);

[Severity: High]
This isn't a bug introduced by this patch, but is there a time-of-check to
time-of-use race condition here?

The __ghes_peek_estatus() function previously fetched the first 20 bytes
(the header) into the estatus buffer, which was then validated by
__ghes_check_estatus().

This call to ghes_copy_tofrom_phys() fetches the entire block from physical
memory again, overwriting the previously validated header.

Since the memory is shared with firmware, couldn't the data_length be
modified by buggy or malicious firmware between the first and second fetch?

Will the newly fetched, unvalidated data_length be used by
cper_estatus_check() and potentially cause a severe heap out-of-bounds
read?

> +	if (cper_estatus_check(estatus)) {
> +		pr_warn_ratelimited(FW_WARN GHES_PFX
> +				    "Failed to read error status block!\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D2

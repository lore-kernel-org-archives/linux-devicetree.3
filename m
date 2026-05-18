Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8B140B6CE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107823; cv=none; b=tvHRTwXOL1x6Jikec8v9qdtSLQqdIQUYxj409yztCkV+5MRAM+OFcXVQv7Bwb7q+30yvfYfgbQUuWKa1si3B9Yrwvs8OMhXS4y9YOcAhH90GMc5hFjPYEECWELBHchl7NFF32/P6YAYQKH7JNRFp3xxBdBMSmxsK1hqLltrUid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107823; c=relaxed/simple;
	bh=1+c9ZA5ejlifzJTJ0vnAnfvvjvEXqSotAk2fh6tMJ1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DvfInxg9BMzJB+Q7ESVFEjoAdGD16EofBxomOC8Ws5R7CsvwFBbAOltUG+Yd2qYMnscBKtnnizWh6n+ou2Kr7ZkVzzTKPXsfKZ4gBzGSggkyEoE64ZtTnf0QriEIzAZ+qwZK8VjahJHk1Sv8hMaSq9Ch6Y8MrShEnrLhYdegRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkltQgi0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkltQgi0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB50C2BCC7;
	Mon, 18 May 2026 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107823;
	bh=1+c9ZA5ejlifzJTJ0vnAnfvvjvEXqSotAk2fh6tMJ1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rkltQgi0sd7A7/K1+rkE/tkKS0eWlt0dJtHjwJMLwGSiPRMPrBNJpaZdu8lTfdfy5
	 qGVREuJ5GtwULY2xr3ghaXPMAcP5WxDNu4oOnGNIj1d+tYGl4ej42u+otjDbJhc7D4
	 wktCeeBayL97MVGUifH9Qkyvy3fDTxMhzyorxp9YPm/Lv8AO0y8alNhkfnckfpbBlG
	 bhRdSiA3vM2/5c2KvJwk9o3Y/Lb1cRX5fWLRabzX1gl3l1XzM7jmMYF1Pjj21sgjrJ
	 r1wojG9kkuxhtjWR+voy86MWcyfX/khoM6SUkIoRsmEQMcqwPl5usNDY3W0PzRWXQ+
	 vypHIVdD6OoOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/10] ACPI: APEI: GHES: move CPER read helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-2-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-2-42698675ba61@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:37:02 +0000
Message-Id: <20260518123702.BFB50C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Time-of-Check to Time-of-Use (TOCTOU) vulnerability in CPER error =
status block reads allows Out-of-Bounds memory access.
- [High] Integer overflow in `cper_estatus_len()` allows parsing of uniniti=
alized kernel heap memory.
- [High] Bitwise logic error in `ghes_ack_error()` unconditionally clears b=
its outside the shifted `read_ack_preserve` mask, causing hardware register=
 corruption.
--

commit ad41efb8414d76a40ca9ad3cfbaf742fd5748919
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: GHES: move CPER read helpers

This commit relocates the CPER buffer mapping, peek, and clear helpers
from ghes.c into ghes_cper.c. This allows sharing the CPER handling
flow with other firmware-first error sources. The commit states that
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

This wasn't introduced by this patch, but does this bitwise logic
unconditionally clear the lower bits of the register?

Shifting the preserve mask left by bit_offset introduces zeros into the
lowest bits. The bitwise AND will then clear bits 0 through bit_offset - 1
of val to zero, regardless of the read_ack_preserve value.

Can this destroy unrelated hardware configurations residing in the lower
bits when val is written back?

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

This wasn't introduced by this patch, but does cper_estatus_len() have an
integer overflow risk?

cper_estatus_len() calculates the total block length by adding
estatus->raw_data_offset and estatus->raw_data_length. Since both are
32-bit integers, could they wrap around to a small length?

If it wraps to a small length (e.g., 24 bytes), it might pass the
cper_estatus_check_header() checks but cause __ghes_read_estatus() to
copy only a few bytes, leaving the rest uninitialized.

Could the subsequent cper_estatus_check() loop then use a malicious
data_length to parse uninitialized kernel heap memory?

> +	u32 max_len =3D min(ghes->generic->error_block_length,
> +			  ghes->estatus_length);

[ ... ]

> +int ghes_read_estatus(struct ghes *ghes,
> +		      struct acpi_hest_generic_status *estatus,
> +		      u64 *buf_paddr, enum fixed_addresses fixmap_idx)
> +{
> +	int rc;
> +
> +	rc =3D __ghes_peek_estatus(ghes, estatus, buf_paddr, fixmap_idx);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D __ghes_check_estatus(ghes, estatus);
> +	if (rc)
> +		return rc;
> +
> +	return __ghes_read_estatus(estatus, *buf_paddr, fixmap_idx,
> +				   cper_estatus_len(estatus));

This wasn't introduced by this patch, but is there a double-fetch issue
between peek and read?

__ghes_peek_estatus() fetches the CPER header from physical memory into
the estatus buffer, and __ghes_check_estatus() validates this header
against max_len.

However, __ghes_read_estatus() performs a second copy from the same
physical memory, overwriting the previously validated header.

If the underlying memory is modified via DMA between the first and second
fetches, could the new header bypass the max_len validation and lead to
out-of-bounds reads in cper_estatus_check() past the allocated buffer?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topics-ahm=
tib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com?part=3D2

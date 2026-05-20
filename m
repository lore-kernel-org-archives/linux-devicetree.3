Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9583431F2
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293293; cv=none; b=rWnZpt1C1BetG9egVnenG1/OWcBSmjht/18QlQi1Atgn3LlXXtXE5esnwP33u6oLOrA2dxyqq6tqI0U+FZNyn0MKmlSb7TX6yZnzR3ByJMmrldS/r3X6mxk1IsUdNKW1bd8fuHc0vgX/WxAxEr2JedJWsYSOTZfCRfquALvGfbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293293; c=relaxed/simple;
	bh=Un2JkRzt/3Utv9l/X4ONPK2t0HZg1Oy6LZ/r0Uxj1/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SPJPmzbI3i+PLOBpK+RFX7PsYSVVOQoG90XrrJUL68+csCGwTiewo3hiv5gGRRwiyOmdT6Fl9fxVcsB8KF4jjDe4+/L+4EgqB1W9JLGh8zYJVol7KOetaAmg1nyROK+03yhsdV/c6AIyI0YKwocZJEg7xe5M9URxZ1XA5EdLTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS/Vwlvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS/Vwlvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AB01F000E9;
	Wed, 20 May 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293291;
	bh=ui1iMjrzzzuggV49+TmuauPNdcMmuOAYXZ5lVWTcYVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bS/Vwlvtcc93t/24bY82CfSywAU2okyrk6QbvAabC47rKz9yvuWR4MAQrjTG3o76u
	 M+cjfczNhHMc4SZJa5Q0K8i5a9bOtr87ZccpuPrjFVNa1aPnQ8qy45wriyp5vac/Ti
	 B7NlA/jNldvl+1AmgjPIjgLDsBoYn4WSP55e8MKEDFQ058BkMSzwKgUz1RMnlVlu2P
	 Doeio0n4BoYhYscNrQUgzkZD9/0K+axvFhQmOOkLNUvM/d1IAEMjb0T7nt4/XRXylO
	 5Z+igO3r03qc8Zwad0iO3wuHO2YQrkPTOJgAEgFafLAJNWzFsRwACACf4z9wwHxsqo
	 FAfGoMZ5gpUMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] nvmem: core: Enforce stride and alignment checks
 for nvmem_device functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520-rpi-otp-driver-v5-2-b26e5908eeac@linutronix.de>
References: <20260520-rpi-otp-driver-v5-2-b26e5908eeac@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 16:08:11 +0000
Message-Id: <20260520160811.99AB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unconditionally enforcing `word_size` alignment in `nvmem_device_r=
ead` breaks existing in-kernel consumers and backend drivers that safely su=
pport unaligned reads.
- [Medium] The `IS_ALIGNED` macro is incorrectly used with `nvmem->stride` =
and `nvmem->word_size`, which are not guaranteed to be powers of two.

Pre-existing issues:
- [High] Missing bounds checking in `nvmem_device_read` and `nvmem_device_w=
rite` against `nvmem->size` exposes the system to out-of-bounds memory acce=
sses.
- [High] Backend drivers perform SLAB out-of-bounds reads when processing w=
rites for bit-offset cells due to mismatched buffer sizes.
--

commit d59bc7c372de847ac014e9a361f8f7bf075ff75c
Author: Gregor Herburger <gregor.herburger@linutronix.de>

nvmem: core: Enforce stride and alignment checks for nvmem_device functions

This commit adds alignment checks for offset and bytes against stride and
word_size to the nvmem_device_read and nvmem_device_write functions.

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 311cb2e5a5c02..6b313f63d07ef 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -2068,6 +2068,12 @@ int nvmem_device_read(struct nvmem_device *nvmem,
>  	if (!nvmem)
>  		return -EINVAL;
> =20
> +	if (!IS_ALIGNED(offset, nvmem->stride))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(bytes, nvmem->word_size))
> +		return -EINVAL;

[Severity: Medium]
Is the IS_ALIGNED() macro safe to use here? Looking at include/vdso/align.h,
IS_ALIGNED(x, a) is implemented using bitwise arithmetic:
(((x) & ((typeof(x))(a) - 1)) =3D=3D 0)

This macro is mathematically valid only when the alignment is a power of tw=
o.
Since the nvmem subsystem doesn't enforce power-of-two constraints for stri=
de
or word_size during registration, if a driver defines a non-power-of-two
value, wouldn't this macro evaluate incorrectly and reject valid alignments?

[Severity: High]
Could this unconditional word_size check break existing backend drivers that
safely support unaligned reads?

Historically, nvmem_device_read() permitted unaligned lengths, delegating t=
he
read to the backend's reg_read function. Since the framework lacks separate
read and write constraints, many drivers specify a larger word_size to
enforce constraints strictly on writes, but gracefully handle arbitrary-siz=
ed
unaligned reads internally (e.g., using bounce buffers).=20

Returning -EINVAL here might break legitimate read operations for dynamic
payload lengths.

>  	rc =3D nvmem_reg_read(nvmem, offset, buf, bytes);

[Severity: High]
This is a pre-existing issue, but does this function need bounds checking
against nvmem->size?

Currently, nvmem_device_read() passes the unchecked offset directly to back=
end
callbacks. If an in-kernel caller provides an out-of-bounds offset, many
hardware driver callbacks lack complete internal bounds checking, which mig=
ht
lead to arbitrary out-of-bounds MMIO accesses or integer underflow issues.

[ ... ]

> @@ -2096,6 +2102,12 @@ int nvmem_device_write(struct nvmem_device *nvmem,
>  	if (!nvmem)
>  		return -EINVAL;
> =20
> +	if (!IS_ALIGNED(offset, nvmem->stride))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(bytes, nvmem->word_size))
> +		return -EINVAL;
> +
>  	rc =3D nvmem_reg_write(nvmem, offset, buf, bytes);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for backend
drivers to perform SLAB out-of-bounds reads when processing writes for
bit-offset cells?

While this patch enforces word_size aligned lengths on direct nvmem writes,
__nvmem_cell_entry_write() bypasses these checks and calls nvmem_reg_write()
with a dynamically allocated buffer that is exactly cell->bytes long.

If a bit-offset cell spans 1 byte, but the backend driver assumes all
operations are word_size aligned (e.g., casting buf to a u32 pointer and
writing 4 bytes), could the backend perform a SLAB out-of-bounds read by
dereferencing 4 bytes from a 1-byte heap allocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-rpi-otp-dr=
iver-v5-0-b26e5908eeac@linutronix.de?part=3D2

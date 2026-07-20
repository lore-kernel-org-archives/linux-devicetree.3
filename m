Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE88E25228C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556126; cv=none; b=AcDOBp6HyYnptR+w4A48XBYmfb18FNsOkEIi0mYcdbyeH2gG3rEu9MleY9RiitQq1wvL+ZFt0GretSQG0kB4P48wpedD1QwIc3wb322a6irh082OjwCqmZTjXtnBsZrydHVqkhUH4TRSlavOzC6rscEJ/Y9g5g6GcaJQKItdPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556126; c=relaxed/simple;
	bh=vshG6rw/KV8nGCoUokev8X5kpc1snRNk4hWysG3Mg5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BAyKYrIiuZ2vePFqZoAa0ZQMMrHoh0g1STW3Nry0F6IUOJB5ifIfV/O0d+2gQxK7/GLV/WAXUXUqrBu6n3M+EUEP+ABPnbbGnkoPk2nVh8ogX+1QB8gyLuzSAQ8Qx7AvVgAld71SudrVo8ZpiGCYgmGCBZG1bLrO30/Bmvq3eKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYo7KxMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYo7KxMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF91F00A3A;
	Mon, 20 Jul 2026 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556124;
	bh=FFeGKsMJIwaCMA6GYj+Vbf8t8Ga0I0QMBe17YUDXKLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYo7KxMqk5Pf67r3fW0SJXb3arckQr7NxlJASXR3NdxHWMJSMofbL4Lm8c5BbcUT8
	 DRhVfU3v2k3YbitLtRNObXukRX289xMLvfbZTU9Di34BFH2uVdDRKJ8mrhFAajQ7ge
	 O+FKVysW7ooKHoh/6PxQTrJnFl7nRhmu24qg+sNRS/AfJc+CLaa/LDKgAjS219KjG6
	 EVtZWwhmep0TdN9Hx5uBaFISVGEsZeYQlVtWThHxNWoil0z+Unx0Tg+Z545IglPF1E
	 GuwBu9hNVRvy9/LuyAZq/aoHuW7EaWLvq5XZk4Xin/gDASZtlP7drSOvt6dCCTXYjG
	 8Ad3NvNok8Czg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 3/4] crypto: spacc - Add SPAcc AUTODETECT Support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720113740.64960-4-pavitrakumarm@vayavyalabs.com>
References: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
 <20260720113740.64960-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:02:03 +0000
Message-Id: <20260720140204.91FF91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unkillable wait_event() in device probe can permanently hang the s=
ystem if an error path is taken.
- [High] Missing test vectors for 128-byte HMAC keys silently disable previ=
ously supported algorithms.
- [High] testdata for CRYPTO_MODE_HMAC_SM3 contains identical test vectors =
for 64-byte and 128-byte keys, validating non-compliant hardware behavior.
--

--- Patch [3]: [PATCH v17 3/4] crypto: spacc - Add SPAcc AUTODETECT Support=
 ---
commit e7cc55bd58c9e6a7c0c33295410fbd1d815c4aec
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc AUTODETECT Support
   =20
SPAcc is configurable and it supports the below modes:
1. AUTODETECT configuration - Autodetects the supported algos.
2. Static configuration - The algo support is defined statically.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> +	[CRYPTO_MODE_HMAC_MD5] =3D {
> +		.min_version =3D 0x65,
> +		.test[1].outlen =3D 16, .test[1].data =3D { 0xb6, 0x39, 0xc8, 0x73,
> +			0x16, 0x38, 0x61, 0x8b, 0x70, 0x79, 0x72, 0xaa, 0x6e,
> +			0x96, 0xcf, 0x90,  },
> +		.test[4].outlen =3D 16, .test[4].data =3D { 0xb7, 0x79, 0x68, 0xea,
> +			0x17, 0x32, 0x1e, 0x32, 0x13, 0x90, 0x6c, 0x2e, 0x9f,
> +			0xd5, 0xc8, 0xb3,  },
> +		.test[5].outlen =3D 16, .test[5].data =3D { 0x80, 0x3e, 0x0a, 0x2f,
> +			0x8a, 0xd8, 0x31, 0x8f, 0x8e, 0x12, 0x28, 0x86, 0x22,
> +			0x59, 0x6b, 0x05,  },
> +	},

[Severity: High]
Does this test data structure omit test vectors for 128-byte keys (test[6])?

For algorithms like CRYPTO_MODE_HMAC_MD5, CRYPTO_MODE_HMAC_SHA1,
CRYPTO_MODE_HMAC_SHA224, and CRYPTO_MODE_HMAC_SHA256, the lack of a test[6]
entry means outlen evaluates to 0.=20

Later in spacc_check_modes(), an outlen of 0 causes the driver to silently
disable support for that key size. This might inadvertently remove previous=
ly
supported 128-byte keys for these algorithms.

[ ... ]
> +	[CRYPTO_MODE_HMAC_SM3] =3D {
> +		.min_version =3D 0x65,
> +		.test[1].outlen =3D 32, .test[1].data =3D { 0x68, 0xf0, 0x65,
> +			0xd8, 0xd8, 0xc9, 0xc2, 0x0e, 0x10, 0xfd, 0x52, 0x7c,
> +			0xf2, 0xd7, 0x42, 0xd3,
> +			0x08, 0x44, 0x22, 0xbc, 0xf0, 0x9d, 0xcc, 0x34, 0x7b,
> +			0x76, 0x13, 0x91, 0xba, 0xce, 0x4d, 0x17 },
> +		.test[4].outlen =3D 32, .test[4].data =3D { 0xd8, 0xab, 0x2a,
> +			0x7b, 0x56, 0x21, 0xb1, 0x59, 0x64, 0xb2, 0xa3, 0xd6,
> +			0x72, 0xb3, 0x95, 0x81,
> +			0xa0, 0xcd, 0x96, 0x47, 0xf0, 0xbc, 0x8c, 0x16, 0x5b,
> +			0x9b, 0x7d, 0x2f, 0x71, 0x3f, 0x23, 0x19 },
> +		.test[5].outlen =3D 32, .test[5].data =3D { 0xa0, 0xd1, 0xd5,
> +			0xa0, 0x9e, 0x4c, 0xca, 0x8c, 0x7b, 0xe0, 0x8f, 0x70,
> +			0x92, 0x2e, 0x3f, 0x4c,
> +			0xa0, 0xca, 0xef, 0xa1, 0x86, 0x9d, 0xb2, 0xe1, 0xc5,
> +			0xfa, 0x9d, 0xfa, 0xbc, 0x11, 0xcb, 0x1f },
> +		.test[6].outlen =3D 32, .test[6].data =3D { 0xa0, 0xd1, 0xd5,
> +			0xa0, 0x9e, 0x4c, 0xca, 0x8c, 0x7b, 0xe0, 0x8f, 0x70,
> +			0x92, 0x2e, 0x3f, 0x4c,
> +			0xa0, 0xca, 0xef, 0xa1, 0x86, 0x9d, 0xb2, 0xe1, 0xc5,
> +			0xfa, 0x9d, 0xfa, 0xbc, 0x11, 0xcb, 0x1f }
> +	},

[Severity: High]
Are these test vectors for 64-byte (test[5]) and 128-byte (test[6]) keys
expected to produce the exact same MAC output?

Since HMAC_SM3 has a block size of 64 bytes, keys longer than 64 bytes are
supposed to be hashed to 32 bytes before being used. Producing the same MAC
for both might mean the hardware is incorrectly truncating the 128-byte key
instead of hashing it. Passing validation with these vectors could permit
broken cryptographic behavior to be used in production.

[ ... ]
> +	err =3D spacc_packet_enqueue_ddt(spacc, rc, ddt, ddt, proclen, 0,
> +				       aadlen, 0, 0, 0);
> +	job =3D &spacc->job[rc];
> +
> +	if (err =3D=3D 0) {
> +		/*
> +		 * No timeout, not interruptible: this only returns once
> +		 * job_done is actually true, i.e. the hardware has
> +		 * genuinely relinquished the job. That guarantees it is
> +		 * always safe to close the job/context and (via the
> +		 * caller) free the DMA buffer immediately below --
> +		 * there is no "unconfirmed" case left to handle.
> +		 *
> +		 * Tradeoff: if the hardware ever genuinely fails to
> +		 * complete a submitted job, this hangs here
> +		 * unkillably (TASK_UNINTERRUPTIBLE, no timeout) for the
> +		 * rest of probe. Accepted deliberately in place of the
> +		 * abandoned-job/UAF risk of giving up early with no
> +		 * hardware cancel available.
> +		 */
> +		wait_event(job->waitq, job->job_done);

[Severity: High]
Could this wait_event() cause the system to hang permanently during probe?

The wait_event() macro places the task in TASK_UNINTERRUPTIBLE. However, if
the job is deferred and subsequently fails to be dispatched to hardware
(for example, due to a DMA error in spacc_process_jb()), the error path sets
job_err and calls wake_up_interruptible(&job->waitq).

Since wake_up_interruptible() only wakes tasks in TASK_INTERRUPTIBLE, this
thread would never wake up from the error path, stranding it forever without
a timeout.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720113740.6496=
0-1-pavitrakumarm@vayavyalabs.com?part=3D3

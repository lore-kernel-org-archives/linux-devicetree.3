Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF839734D
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593135; cv=none; b=DOCN/ctETZgiqroqcF2N2lkWRSN7Gwxy+4d/+pqp/jy20FpIpRbigRU8+LTZmt1rgI5tThbdejPikezIQzVG4PH7fJaoSwnReyjI5uf3CQK3wKSerCblVHiSiujRWtrERpYgD8kCUg74MWdGHW1tZvKVjapMDu0vff3GgsKPaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593135; c=relaxed/simple;
	bh=jT5QETZLKk6jMQ9STiNQeeGAzjfnFXo/o+ugNycRl5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SzCCSRARrEghom4KQOJg62E8P5xJth2bNHbzdzWqmAPH6LDlOy4zCqdHKBUHOvEQ03nAAkcf2NA33MmU8nr1Op5qFXkehyjOjxP0cSgrtHmBqalGKcJLRiNQ0FobPSUZSxn4uFPlyLH9htDR399MG7RAJGJhWiOcC72oVlP9L0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcEudMZF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcEudMZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F301F00893;
	Thu,  4 Jun 2026 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780593134;
	bh=GAE/z30C5bdXf03EMP49wW8fFKcjLdwA01gbLssrE54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcEudMZF1EjECUuRI5itivl6lrESeyad8QQtdx76ROtHGRspfqXEwzTJfFgb0smho
	 NdgGLbm0nDHjaM6/IK+GvJbKUS1TtmRhHH6q8t7H5ffsiJR6d7P/Vu8YEKn6vB9E3k
	 XUD1MbbYduSCjA3vM8FxUH6AW4WGNEwwYBD2hIKPBYSfC5Ams5r1E4yK51eKzWbNjS
	 odYeMpO1OEKVErEo88xTL3C91udnJe/TlUyD0A6NVDls+K2NMKT2lPvRtJxqqWPV6R
	 k2zK7tVTk6Ubd7HjfUp051kaOHsrCGE40Vq3Rt1j6XEFqJiE19LbuOjtS4nS/4npdc
	 naAHnsYOtxZDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/4] crypto: spacc - Add SPAcc AUTODETECT Support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604165210.1141842-4-pavitrakumarm@vayavyalabs.com>
References: <20260604165210.1141842-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 17:12:13 +0000
Message-Id: <20260604171213.F0F301F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Ignoring the return value of wait_event_interruptible() leads to D=
MA memory Use-After-Free (UAF) if a signal interrupts the wait.
- [High] A stack out-of-bounds read occurs when configuring hash algorithms=
 with key sizes larger than 64 bytes.
- [High] Hash autodetection unconditionally fails and incorrectly disables =
all hash algorithms because the hardware is instructed to output a 0-length=
 hash.
- [High] spacc_check_modes() permanently mutates the shared 'key' array for=
 CSHAKE/KMAC modes, corrupting the key for subsequently tested algorithms.
- [High] Unbounded wait_event_interruptible when polling hardware can perma=
nently hang the kernel if the device stalls.
- [High] A race condition in the interrupt handler causes autodetect to rea=
d uninitialized error statuses, randomly failing valid algorithms.
- [Low] The testdata array uses sequential initialization instead of design=
ated initializers, making it extremely fragile to enum changes.
--

commit 76505a1d1e0cde015e1c2a3d87751c32da9ef277
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
crypto: spacc - Add SPAcc AUTODETECT Support

This commit adds an autodetect configuration mode for SPAcc, which probes t=
he
hardware to dynamically detect supported cryptographic algorithms based on a
statically defined list of test vectors.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -200,6 +200,882 @@ static const unsigned char template[] =3D {
>  	[CRYPTO_MODE_MAC_SM4_CMAC]      =3D 242,
>  };
> =20
> +#if IS_ENABLED(CONFIG_CRYPTO_DEV_SPACC_AUTODETECT)
> +static const struct {
> +	unsigned int min_version;
> +	struct {
> +		int outlen;
> +		unsigned char data[64];
> +	} test[7];
> +} testdata[CRYPTO_MODE_LAST] =3D {
> +	/* NULL */
> +	{ .min_version =3D 0x65,
> +		.test[0].outlen =3D 0
> +	},

[Severity: Low]
This isn't a bug, but could this array initialization be made more robust?

Because it uses sequential initialization instead of designated initializers
for the algorithm indices, any changes to the enum order could silently
break the mapping to test vectors.

> [ ... ]
> +static void spacc_check_modes(struct spacc_device *spacc, int algo_mode,
> +			      int keysz_idx, void *virt, char *key,
> +			      struct pdu_ddt *ddt)
> +{
> [ ... ]
> +	/* if this is a hash or mac */
> +	if (template[algo_mode] & 128) {
> +		switch (algo_mode) {
> +		case CRYPTO_MODE_HASH_CSHAKE128:
> +		case CRYPTO_MODE_HASH_CSHAKE256:
> +		case CRYPTO_MODE_MAC_KMAC128:
> +		case CRYPTO_MODE_MAC_KMAC256:
> +		case CRYPTO_MODE_MAC_KMACXOF128:
> +		case CRYPTO_MODE_MAC_KMACXOF256:
> +		       /*
> +			* Special initial bytes to encode
> +			* length for cust strings
> +			*/
> +			key[0] =3D 0x01;
> +			key[1] =3D 0x70;

[Severity: High]
Will modifying this array affect subsequent algorithm checks?

Since the key array is allocated once in spacc_autodetect() and passed
by pointer in the loop, mutating it here for CSHAKE and KMAC modes
seems to leave the corrupted key in place for any algorithms tested in
later loop iterations. Could this cause them to fail verification
against their predefined test vectors?

> +			break;
> +		}
> +
> +		spacc_write_context(spacc, rc, SPACC_HASH_OPERATION,
> +				key, keysizes[1][keysz_idx] +
> +				(algo_mode =3D=3D CRYPTO_MODE_MAC_XCBC ? 32 : 0),
> +				key, 16);

[Severity: High]
Is there a risk of an out-of-bounds stack read here?

The key array is statically sized to 64 bytes in spacc_autodetect().
However, for certain hash modes like CRYPTO_MODE_HASH_SHA512, the
requested read size can be up to 128 bytes. This looks like it might
copy uninitialized stack memory into the hardware context buffer and
cause the check to fail.

> [ ... ]
> +	spacc_set_operation(spacc, rc, OP_ENCRYPT, 0, IP_ICV_APPEND, 0,
> +			0, 0);

[Severity: High]
Does this correctly configure the hardware for hash algorithms?

The icvsz parameter (the 7th argument) is hardcoded to 0, which
configures the hardware to append a 0-length hash.

> [ ... ]
> +	/*
> +	 * 16AAD/16PT or 32AAD/0PT depending on
> +	 * whether we're in a hash or not mode
> +	 */
> +	aadlen  =3D 16;
> +	proclen =3D 32;
> +	if (!enc)
> +		aadlen +=3D 16;

[Severity: High]
Additionally, proclen is left as 32 instead of being properly zeroed
for hash operations. Will these values guarantee a mismatch when
comparing the output against the expected test vectors?

> [ ... ]
> +	err =3D spacc_packet_enqueue_ddt(spacc, rc, ddt, ddt, proclen, 0,
> +			aadlen, 0, 0, 0);
> +
> +	job =3D &spacc->job[rc];
> +
> +	if (err =3D=3D 0) {
> +		wait_event_interruptible(job->waitq, job->job_done);

[Severity: High]
Could this lead to a kernel hang or memory corruption if interrupted?

If a signal interrupts the wait, it returns immediately but the return
value is ignored. Once the function returns and spacc_autodetect()
frees the DMA memory, the hardware might still be actively writing to
that freed memory.

Also, without a timeout mechanism, could a hardware stall during probe
cause modprobe to hang indefinitely?

> [ ... ]
> diff --git a/drivers/crypto/dwc-spacc/spacc_interrupt.c b/drivers/crypto/=
dwc-spacc/spacc_interrupt.c
> --- a/drivers/crypto/dwc-spacc/spacc_interrupt.c
> +++ b/drivers/crypto/dwc-spacc/spacc_interrupt.c
> @@ -54,6 +54,10 @@
>  			/* mark job as done */
>  			if (spacc->autodetect) {
>  				job->job_done =3D 1;
>  				wake_up_interruptible(&job->waitq);
>  			}
> [ ... ]
> @@ -83,2 +87,2 @@
>  	job->job_err =3D ret;

[Severity: High]
Can this cause a race condition when waking up the autodetect thread?

The waitqueue is woken up before the hardware status is evaluated and
assigned to job->job_err.

Could the woken thread in spacc_check_modes() resume and read
job->job_err before it is updated, observe the stale -EINPROGRESS
value, and incorrectly register valid tests as failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604165210.1141=
842-1-pavitrakumarm@vayavyalabs.com?part=3D3

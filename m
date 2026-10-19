Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429169;
	b=NAkNRb70w+1kHxp29SvKF/UqsWaXguCAjejXtLQrrL6G7Ky+Smqt2yJGymIckRlldVU8
	 W+lcBqoHfd22DT3h8iVptPyEz8B1l8UtaCrxoOviovKO5dmJep93eavsjyEkstG4vKvhV
	 YM6bWxqfASyby35GCcd2vxDe+C9swk0LF8fVOBNvgsWHzV0TEm867GZuyPVnQ8UfuKmFG
	 sOQD8ANEZv0w75NYXFnOzYbhPKaNJeW3mu0/uUpmeHGUq4rPA+r6PtZ7ttn5/2F/69UvA
	 C/j4Q7Dt8+2dv78blz2vdf6JW52y2xQg1B+TLxFIVeSTthZow1V2hJx7ur670ngiI0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DqTojpNM4mWIpgEuZ6HPyN1JfLKUjhA3z51a+KL9o+w=;
	b=ITnb1aBQ9O0KTvraHVyHa+9CpN0dR3y5rp4F77OAdgYNQhnfeTFMxn6Y7+N6yYMZHPwP
	 85Ggo2XmPPrQCfKpo7AADv5kBXBzoOLhbhhQWQCSJxTxFOpushhC3XYjlnyGQP5ofR1AC
	 lqU/tN6nFpBcalG7eEHFUUCtFlJ+VbS5I85TTy6hQE4jbob4NyjtqsVliplePTwKKRTGx
	 2y/6Fn6xTtom+leguoPh7m3Hm9gszfPK8ugMf66tMxFHxyg/pwT1PH0KUTZgA9pB+8kIQ
	 6Ph8Xli/dPw2ThQAgdiF//KIQ2AC3E8FfEGtQyEmKwcD8ZrbjM8pG9rqbo5OsoiEhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeN7NssK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75894606A31D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeN7NssK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CA81F000C4;
	Mon, 19 Oct 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429168;
	bh=DqTojpNM4mWIpgEuZ6HPyN1JfLKUjhA3z51a+KL9o+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NeN7NssKv4NI8gUF1HStSoXhMGQj3h20pnt1WVhn6s/CMTrT29Uym3hyMcmPWUGbP
	 XQ9FMyyRCO9CAdXH0WT8lMxvamlmluGifQY3R1N9be0ltkGPhY5Gul30Vc4f1Zd847
	 ASHIHP6cKngpNd9+JhPKZ3Ogn64Qt1E4xtKaoo7BUt7oHaYTqDoJo+Yas12zHWfoi/
	 8jzJ1Ft+CFt+68QhLs2ZdZhp8WP6B96WYPrFIC8cVtxD2B3URhFm4emARacDyR29Yx
	 r1K63mTbufEUzYxBo3O52hFbkFaVVKPTv8LlgjvF/3eGOojCYHkjn/yA70rwup6MVN
	 QMuJLlrlzF1fQ==
Message-ID: <sashiko-outbox-177983@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019162457.1000115-5-pavitrakumarm@vayavyalabs.com>
References: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
 <20261019162457.1000115-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:59:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] crypto: spacc - CRYPTO_AHASH_ALG_BLOCK_ONLY inflates statesize pas=
t limit
- [High] crypto: spacc: unconditional setkey and OPTIONAL_KEY in spacc_hash=
_template
- [High] crypto: spacc: unhandled CMD0 IRQ storm in spacc_process_irq()
- [Medium] crypto: spacc - out-of-bounds read of version_string in spacc_in=
it()
- [Low] crypto: spacc: unused label err in spacc_crypto_probe() when HASH=
=3Dn
--

commit b1ae79ed84b1fd0d4c3074c2f6c722eb276a6755
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc Kconfig and Makefile

This commit adds Kconfig and Makefile files for the Synopsys DesignWare
SPAcc cryptographic accelerator driver and wires them into the crypto
build system.

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/=
Kconfig
> new file mode 100644
> index 0000000000000..82ea907a14635
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CRYPTO_DEV_SPACC
> +	tristate "Support for dwc_spacc Security Protocol Accelerator"
> +	depends on HAS_DMA
> +	depends on HAS_IOMEM
> +	select CRYPTO_ENGINE
> +	select CRYPTO_HASH if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA1 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_MD5 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA256 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA512 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SHA3 if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_HMAC if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_CMAC if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_XCBC if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_AES if CRYPTO_DEV_SPACC_HASH
> +	select CRYPTO_SM4_GENERIC if CRYPTO_DEV_SPACC_HASH
> +	default n
> +
> +	help
> +	  This enables support for SPAcc Hardware Accelerator.
> +
> +if CRYPTO_DEV_SPACC
> +
> +config CRYPTO_DEV_SPACC_HASH
> +	bool "Enable HASH functionality"
> +	default CRYPTO_DEV_SPACC
> +	help
> +	  Say y to enable Hash functionality of SPAcc.

[Severity: Low]
When CRYPTO_DEV_SPACC is enabled and CRYPTO_DEV_SPACC_HASH is disabled,
does building spacc_device.c trigger an unused-label compiler warning in
spacc_crypto_probe()?

In drivers/crypto/dwc-spacc/spacc_device.c:spacc_crypto_probe():

#if IS_ENABLED(CONFIG_CRYPTO_DEV_SPACC_HASH)
	rc =3D spacc_probe_hashes(pdev);
	if (rc < 0)
		goto err;
#endif

	return 0;
err:
	spacc_crypto_remove(pdev);

	return rc;

Because the only goto err statement is inside the preprocessor guard while
the err label is outside it, compiling with CONFIG_CRYPTO_DEV_SPACC_HASH=3Dn
fails under -Werror=3Dunused-label.

> +
> +config CRYPTO_DEV_SPACC_AUTODETECT

[ ... ]

> +config CRYPTO_DEV_SPACC_CONFIG_DEBUG
> +	bool "Enable SPAcc debug logs"
> +	default n
> +	help
> +	  Say y to enable additional debug prints and diagnostics in the
> +	  SPAcc driver. Disable this for production builds.
> +
> +endif # CRYPTO_DEV_SPACC

[Severity: Medium]
When CONFIG_CRYPTO_DEV_SPACC_CONFIG_DEBUG is enabled, can spacc_init() read
out of bounds of version_string[]?

In drivers/crypto/dwc-spacc/spacc_core.c:spacc_init(), version_string is
declared with three elements:

	char version_string[3][16]  =3D { "SPACC", "SPACC-PDU" };

Later in the same function, when spacc->config.version >=3D 0x48, it is
indexed with SPACC_ID_TYPE(id) & 3:

	if (spacc->config.version >=3D 0x48)
		dev_dbg(spacc->dptr,
			"   TYPE       : %lx (%s)\n", SPACC_ID_TYPE(id),
			version_string[SPACC_ID_TYPE(id) & 3]);

Since SPACC_ID_TYPE(id) & 3 can evaluate to 3, wouldn't this read past the
end of version_string[]?

> diff --git a/drivers/crypto/dwc-spacc/Makefile b/drivers/crypto/dwc-spacc=
/Makefile
> new file mode 100644
> index 0000000000000..b7125a7797ba0
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_CRYPTO_DEV_SPACC) +=3D snps-spacc.o
> +
> +snps-spacc-y :=3D spacc_hal.o spacc_core.o \
> +spacc_manager.o spacc_interrupt.o spacc_device.o

[Severity: High]
In spacc_interrupt.c, can spacc_process_irq() trigger an unhandled CMD0
interrupt storm when transitioning from SPACC_OP_MODE_IRQ back to
SPACC_OP_MODE_WD?

In drivers/crypto/dwc-spacc/spacc_interrupt.c:spacc_process_irq(), when
spacc->wdcnt reaches SPACC_WD_LIMIT, the driver switches spacc->op_mode to
SPACC_OP_MODE_IRQ and sets spacc->wd_cnt_limit =3D true. On the subsequent
SPACC_IRQ_STAT_STAT interrupt:

		if (spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ) {
			...
			/* re-enable CMD0 empty interrupt */
			spacc_irq_cmdx_enable(spacc, 0, 0);
		}

		/* Re-enable the watchdog interrupt */
		if (spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ &&
				spacc->wd_cnt_limit) {
			spacc_irq_stat_wd_enable(spacc);
			spacc->wdcnt =3D 0;
			spacc->op_mode =3D SPACC_OP_MODE_WD;
			spacc->wd_cnt_limit =3D false;
		}

The first block enables the CMD0 empty interrupt, and the second block
immediately switches spacc->op_mode back to SPACC_OP_MODE_WD without
disabling the CMD0 interrupt. Because the CMDX interrupt handling loop
later in spacc_process_irq() only runs when spacc->op_mode is
SPACC_OP_MODE_IRQ:

	if (spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ) {
		cmd_max =3D (spacc->config.is_qos ? SPACC_CMDX_MAX_QOS :
				SPACC_CMDX_MAX);
		for (x =3D 0; x < cmd_max; x++) {
			if (irq_status & SPACC_IRQ_STAT_CMDX(x)) {

won't SPACC_IRQ_STAT_CMDX(0) remain permanently enabled and uncleared while
in SPACC_OP_MODE_WD, causing spacc_irq_handler() to return IRQ_HANDLED in a
tight loop?

> +
> +snps-spacc-$(CONFIG_CRYPTO_DEV_SPACC_HASH) +=3D spacc_ahash.o

[Severity: High]
In spacc_ahash.c, does setting CRYPTO_AHASH_ALG_BLOCK_ONLY together with
statesize =3D HASH_MAX_STATESIZE break virtual-address ahash requests and
partial-block state handling?

In drivers/crypto/dwc-spacc/spacc_ahash.c, spacc_hash_template sets
CRYPTO_AHASH_ALG_BLOCK_ONLY:

			.cra_flags	=3D CRYPTO_ALG_TYPE_AHASH		|
					  CRYPTO_ALG_ASYNC		|
					  CRYPTO_AHASH_ALG_BLOCK_ONLY	|
					  CRYPTO_ALG_OPTIONAL_KEY

and spacc_register_hash() sets statesize to HASH_MAX_STATESIZE before
calling crypto_engine_register_ahash():

	salg->alg.hash.base.halg.digestsize =3D salg->mode->hashlen;
	salg->alg.hash.base.halg.statesize =3D HASH_MAX_STATESIZE;

	rc =3D crypto_engine_register_ahash(&salg->alg.hash);

When crypto_engine_register_ahash() -> crypto_register_ahash() ->
ahash_prepare_alg() sees CRYPTO_AHASH_ALG_BLOCK_ONLY, it adds
base->cra_blocksize + 1 to alg->halg.statesize, pushing
crypto_ahash_statesize(tfm) above HASH_MAX_STATESIZE. Consequently, any
virtual-address request (such as hmac_finup_finish() wrapping an unkeyed
SPAcc algorithm like sha3-256) hits the statesize > HASH_MAX_STATESIZE
check in ahash_do_req_chain() and fails with -ENOSYS.

In addition, spacc_hash_init(), spacc_hash_update(), spacc_hash_final(),
and spacc_hash_finup() delegate directly to the software fallback tfm:

	rc =3D crypto_ahash_import(fbreq, ctx->state_buffer);
	if (!rc)
		rc =3D crypto_ahash_update(fbreq);
	if (!rc)
		rc =3D crypto_ahash_export(fbreq, ctx->state_buffer);

	HASH_REQUEST_ZERO(fbreq);

	return rc;

Because spacc_hash_update() consumes trailing partial blocks into
ctx->state_buffer via the fallback tfm and returns 0 instead of returning
the unprocessed tail byte count expected by ahash_update_finish() for
CRYPTO_AHASH_ALG_BLOCK_ONLY algorithms, partial blocks from updates >=3D
blocksize are buffered in ctx->state_buffer while updates < blocksize are
buffered in the core ahash block-only buffer. Should
CRYPTO_AHASH_ALG_BLOCK_ONLY be omitted here since the streaming callbacks
delegate to the software fallback?

[Severity: High]
Also in spacc_ahash.c, should spacc_hash_template avoid unconditionally
setting .setkey =3D spacc_hash_setkey and CRYPTO_ALG_OPTIONAL_KEY for all
algorithms in possible_hashes[]?

In drivers/crypto/dwc-spacc/spacc_ahash.c:spacc_register_hash(), every
algorithm in possible_hashes[] (both keyed MACs like hmac/cmac/xcbc and
unkeyed digests like md5/sha1/sha2/sha3) is registered with:

		.setkey		=3D spacc_hash_setkey,
		...
			.cra_flags	=3D CRYPTO_ALG_TYPE_AHASH		|
					  CRYPTO_ALG_ASYNC		|
					  CRYPTO_AHASH_ALG_BLOCK_ONLY	|
					  CRYPTO_ALG_OPTIONAL_KEY

Because CRYPTO_ALG_OPTIONAL_KEY is set on the keyed MAC algorithms,
ahash_set_needkey() never sets CRYPTO_TFM_NEED_KEY during tfm
initialization or after a failed setkey. If a caller invokes
crypto_ahash_digest() on a keyed MAC (e.g. via AF_ALG) without setting a
key, it is not rejected with -ENOKEY; instead spacc_hash_try_hw() sees
tctx->keylen =3D=3D 0:

		if (tctx->keylen > 0) {
			u32 mode_id =3D salg->mode->id;

skips spacc_write_context(), and runs the hardware MAC operation using
whatever stale key material remains in the hardware context RAM from prior
jobs. Meanwhile, the unkeyed hash algorithms advertise a setkey callback
that they should not have.

Could CRYPTO_ALG_OPTIONAL_KEY be removed and .setkey cleared for the
unkeyed hash algorithms?

Base commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
--
2.51.0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019162457.1000=
115-1-pavitrakumarm@vayavyalabs.com?part=3D4

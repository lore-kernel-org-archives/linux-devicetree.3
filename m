Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A2234C9AF
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158891; cv=none; b=Dk+hJj1lqAMz8StcrP9AFNS7lUJSYCm6rEieamo4vkJIQA+5H/su/kXKGJB7/W7JZhrYzH1MvptU1nyZdZZNqXIKzcisgYS1KzKyyTOFs2kh7TpO6Q7B8WlyOcTA3hl1A2k7BZvCJOY27EHrU9PzAh3BCIk/dN6opEZDqHG4co0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158891; c=relaxed/simple;
	bh=lnEtyB2+EGeCBGM/A9JGWDYuV31/TvExPAxiJXUKQgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=out/XKzYoZJecN9l7tTeIeXvcVPD/mfJi9tmMWAymsyuuVDXh8To+rJgPp1231+zxS1uGRJaCA0JIOzDyIFCPFTrnWxy8F56nwPejIxafF2zcW99KRSoJVTq6cVC7ElA+fNE1sP/u4GQNdjiFThZmZK/9i1eEZwLKDLtrZ2MAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lihFaMuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lihFaMuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6391F00898;
	Sat, 30 May 2026 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780158888;
	bh=kGFy4okQfkyUC4Wx3W1YvSo8qF7guWARrxsEH+2Yrng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lihFaMufDEDjpKlnuAxGwC07oGH7xH1hKJl28FvlPi5wi2gakTS1ic79g0XN+74yw
	 +5hc637xILCu8GVnZlyF4CAH6f1bQL9PYegJ9GA5QSZlN1d9pHRywflOMdjn/OwtWz
	 6gH+8kQVnk95xpYGgQYRIW7dXkY3ttbEe5jxHgRSIdBhKhJGxRh76JCPQWJQ1j6jvI
	 tYnRVtGOnsirn4yhnNdZ0EguWQ6Qp9qZ5TE1syJpPknlKP0SomB8a5t8L1ig45B6aF
	 TEAohn8ZwIJYF7qIoLAmjH/5BUu8z8Or8zNgN0jk4vb5SjQ8FJwxMsenM6a62/r8Mx
	 1ESMT1fppvlJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] crypto: rockchip: Add RK356x/RK3588 cryptographic
 offloader driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530160704.3453555-3-dawidro@gmail.com>
References: <20260530160704.3453555-3-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 16:34:47 +0000
Message-Id: <20260530163448.9B6391F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Kconfig selects a non-existent symbol `CRYPTO_SM3_GENERIC`.
- [High] Incorrect IV offset calculation uses full scatterlist element capa=
city instead of the processed length, causing out-of-bounds reads and break=
ing cipher chaining.
- [High] The shared interrupt handler accesses hardware unconditionally wit=
hout verifying PM state, causing fatal aborts.
- [High] Device removal cancels pending autosuspend timers without explicit=
ly suspending the hardware, leading to permanent clock and power leakage.
- [High] Algorithm registration copies templates blindly without generating=
 unique `cra_driver_name`s, preventing multi-instance probing.
- [High] A race condition between DMA timeout handling and delayed interrup=
ts can cause spurious completions and memory corruption.
- [High] Hardware descriptors and parameters are assigned using CPU-native =
integers instead of fixed-endian types, breaking the driver on big-endian a=
rchitectures.
- [High] 64-bit DMA addresses are silently truncated to 32 bits, risking me=
mory corruption on systems with >4GB of RAM.
- [Medium] Algorithm fallback statistics are updated without atomics in hig=
hly concurrent code paths, leading to data races.
--

commit a4f5122cb83b084e2414510f88a5efed52b14807
Author: Dawid Olesinski <dawidro@gmail.com>

crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver

This commit adds a driver for the second-generation Rockchip cryptographic
hardware accelerator found on RK3568 and RK3588 SoCs. It provides hardware
acceleration for symmetric block ciphers and hashing functions.

> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> index d23b58b81ca34..47a891593814a 100644
> --- a/drivers/crypto/Kconfig
> +++ b/drivers/crypto/Kconfig
[ ... ]
> @@ -709,6 +709,39 @@ config CRYPTO_DEV_ROCKCHIP_DEBUG
>  	  This will create /sys/kernel/debug/rk3288_crypto/stats for displaying
>  	  the number of requests per algorithm and other internal stats.
> =20
> +config CRYPTO_DEV_ROCKCHIP2
> +	tristate "Rockchip's cryptographic offloader"
> +	depends on OF && ARCH_ROCKCHIP
> +	depends on PM
> +	select CRYPTO_ECB
> +	select CRYPTO_CBC
> +	select CRYPTO_AES
> +	select CRYPTO_MD5
> +	select CRYPTO_SHA1
> +	select CRYPTO_SHA256
> +	select CRYPTO_SHA512
> +	select CRYPTO_SM3_GENERIC

[Severity: High]
Does this select a nonexistent config symbol? The symbol CRYPTO_SM3_GENERIC
does not seem to exist in the kernel tree (the correct symbol is
CRYPTO_SM3).

Selecting a nonexistent symbol is silently ignored by Kconfig, potentially
leaving the generic SM3 algorithm disabled. Since the driver unconditionally
attempts to allocate a fallback for sm3 in rk2_hash_init_tfm(), could this
cause runtime allocation failures and prevent the hashing algorithm from
instantiating?

> diff --git a/drivers/crypto/rockchip/rk2_crypto.c b/drivers/crypto/rockch=
ip/rk2_crypto.c
> new file mode 100644
> index 0000000000000..df7dab4d7ca0b
> --- /dev/null
> +++ b/drivers/crypto/rockchip/rk2_crypto.c
[ ... ]
> +static int rk2_crypto_pm_suspend(struct device *dev)
> +{
> +	struct rk2_crypto_dev *rkdev =3D dev_get_drvdata(dev);
> +
> +	reset_control_assert(rkdev->rst);
> +	udelay(10);
> +	clk_bulk_disable_unprepare(rkdev->num_clks, rkdev->clks);
> +
> +	return 0;
> +}

[Severity: High]
Should this suspend path call synchronize_irq() before gating the clocks?

Since the device requests its interrupt with IRQF_SHARED, another device
sharing the IRQ line could trigger the handler. If the clocks are disabled
while the shared interrupt handler is running or about to run, could this
lead to a system crash when the handler accesses powered-down registers?

[ ... ]
> +static void rk2_crypto_pm_exit(struct rk2_crypto_dev *rkdev)
> +{
> +	pm_runtime_disable(rkdev->dev);
> +}

[Severity: High]
Is it safe to unconditionally call pm_runtime_disable() here without ensuri=
ng
the hardware is suspended?

During removal, pm_runtime_disable() will cancel any pending asynchronous
suspends. Without a preceding pm_runtime_put_sync() or explicit hardware
shutdown in the removal path, the hardware might remain permanently locked
in the RPM_ACTIVE state, leaking clocks indefinitely.

[ ... ]
> +static irqreturn_t rk2_crypto_irq_handle(int irq, void *dev_id)
> +{
> +	struct rk2_crypto_dev *rkc =3D platform_get_drvdata(dev_id);
> +	u32 v;
> +
> +	v =3D readl(rkc->reg + RK2_CRYPTO_DMA_INT_ST);

[Severity: High]
Can this unconditional register read cause an external abort?

For a shared interrupt handler, the handler might be invoked when the device
is runtime-suspended. Reading from the register without first verifying the
device is active (e.g., using pm_runtime_get_if_active()) could cause a cra=
sh
or return 0xffffffff, which might generate a spurious completion.

[ ... ]
> +static int rk2_crypto_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	rkc->num_algs =3D ARRAY_SIZE(rk2_crypto_algs_template);
> +	rkc->algs =3D devm_kmemdup(dev, rk2_crypto_algs_template,
> +				 sizeof(rk2_crypto_algs_template), GFP_KERNEL);

[Severity: High]
Does duplicating the static templates preserve identical cra_driver_name
values across multiple device instances?

If a second hardware instance probes (such as on RK3588 SoCs with multiple
crypto cores), submitting these copies to the crypto subsystem without
modifying their cra_driver_name strings will result in a global name collis=
ion.
Could this cause crypto_engine_register_skcipher() to fail with -EEXIST,
aborting the probe for subsequent instances?

[ ... ]
> +	rkc->tl =3D dma_alloc_coherent(dev,
> +				     sizeof(struct rk2_crypto_lli) * MAX_LLI,
> +				     &rkc->t_phy, GFP_KERNEL);

[Severity: High]
Is a DMA mask needed before performing allocations?

The driver programs hardware descriptors using 32-bit DMA fields and writes
the LLI table base address into a 32-bit hardware register. Because the dri=
ver
never limits the allocation mask via dma_set_mask_and_coherent(dev,
DMA_BIT_MASK(32)) during initialization, the allocator might provide physic=
al
addresses above 4GB on systems with large RAM.

If the upper 32 bits of the 64-bit dma_addr_t are discarded, could this cau=
se
the DMA controller to read or write random regions of low memory?

> diff --git a/drivers/crypto/rockchip/rk2_crypto_ahash.c b/drivers/crypto/=
rockchip/rk2_crypto_ahash.c
> new file mode 100644
> index 0000000000000..5aeff32d14028
> --- /dev/null
> +++ b/drivers/crypto/rockchip/rk2_crypto_ahash.c
[ ... ]
> +static bool rk2_ahash_need_fallback(struct ahash_request *areq)
> +{
[ ... ]
> +	if (nents > 1) {
> +		algt->stat_fb_sgdiff++;
> +		return true;
> +	}

[Severity: Medium]
Is it safe to increment these statistics without atomic protection?

Software fallback functions increment performance statistics directly inside
frontend operations. Since these fallbacks bypass the serialized
crypto_engine kthread queue, they can be executed concurrently by multiple
threads on the same algorithm template instance.

Concurrent load-add-store operations on an unsigned long might create a
data race, resulting in lost updates. Should these counters use atomic types
or be protected by locks?

[ ... ]
> +int rk2_hash_run(struct crypto_engine *engine, void *breq)
> +{
[ ... ]
> +	while (sgs && len > 0) {
[ ... ]
> +		todo =3D min(sg_dma_len(sgs), len);
> +		dd->src_addr =3D sg_dma_address(sgs);
> +		dd->src_len =3D todo;

[Severity: High]
Does this directly assign native types to __le32 LLI descriptor fields?

Fields in struct rk2_crypto_lli like src_addr and src_len are defined as
__le32. Assigning CPU-native values to them directly without using the
required cpu_to_le32() conversions will break the driver on big-endian
architectures, as the hardware receives corrupted addresses.

[ ... ]
> +		timeout =3D wait_for_completion_timeout(&rkc->complete,
> +						      msecs_to_jiffies(2000));
> +	if (!timeout) {
> +		dev_err(rkc->dev, "DMA timeout\n");
> +		err =3D -ETIMEDOUT;
> +		reset_control_assert(rkc->rst);
> +		udelay(10);
> +		reset_control_deassert(rkc->rst);
> +		goto exit;
> +	}

[Severity: High]
Does the timeout error path need to synchronize with the interrupt handler?

When wait_for_completion_timeout() expires, the driver resets the hardware
and exits. The crypto framework then submits the next request, resetting the
completion structure. If the timed-out request's interrupt was delayed and
fires concurrently on another CPU, it will trigger complete() on the newly
initialized completion.

Could this spurious completion cause the next request to return from wait
immediately, unmapping buffers prematurely while the DMA engine is still
actively reading/writing memory?

> diff --git a/drivers/crypto/rockchip/rk2_crypto_skcipher.c b/drivers/cryp=
to/rockchip/rk2_crypto_skcipher.c
> new file mode 100644
> index 0000000000000..e1a1a1a130964
> --- /dev/null
> +++ b/drivers/crypto/rockchip/rk2_crypto_skcipher.c
[ ... ]
> +int rk2_cipher_run(struct crypto_engine *engine, void *async_req)
> +{
[ ... ]
> +		if (areq->iv && crypto_skcipher_ivsize(tfm) > 0) {
> +			if (rctx->mode & RK2_CRYPTO_DEC) {
> +				offset =3D sgs->length - ivsize;

[Severity: High]
Does this calculate the IV offset using the full scatterlist element capaci=
ty
instead of the processed length?

The driver attempts to back up the output IV by copying the last processed
block. However, scatterlist lengths (sgs->length) represent buffer
capacities, which are often larger than the requested cryptlen or the
processed todo amount.

By using offset =3D sgs->length - ivsize, the driver might read uninitializ=
ed
or unrelated memory from the end of the scatterlist buffer instead of readi=
ng
the newly generated ciphertext at todo - ivsize. Could this corrupt the IV,
silently break subsequent chained block operations, and risk leaking
unrelated memory?

[ ... ]
> +		if (algt->is_xts) {
> +			for (i =3D 0; i < ctx->keylen / 8; i++) {
> +				v =3D cpu_to_be32(rkey[i]);
> +				writel(v, rkc->reg + RK2_CRYPTO_KEY0 + i * 4);

[Severity: High]
Does combining cpu_to_be32() with writel() incorrectly byte-swap on
big-endian systems?

The writel() function already performs a native-to-little-endian swap. By
pre-swapping the value with cpu_to_be32(), this code creates a double-swap
issue on big-endian architectures. Additionally, casting the key byte array
to u32* violates strict aliasing. Will this result in the hardware receiving
a corrupted key?

[ ... ]
> +		dd->src_addr =3D sg_dma_address(sgs);
> +		dd->src_len =3D todo;

[Severity: High]
Are CPU-native values being assigned directly to __le32 LLI descriptor fiel=
ds
here as well?

Like in the ahash implementation, these fields require cpu_to_le32() conver=
sions
to function correctly on big-endian systems.

[ ... ]
> +		timeout =3D wait_for_completion_timeout(&rkc->complete,
> +						      msecs_to_jiffies(2000));
> +		if (sgs =3D=3D sgd) {
> +			dma_unmap_sg(rkc->dev, sgs, 1, DMA_BIDIRECTIONAL);
> +		} else {
> +			dma_unmap_sg(rkc->dev, sgs, 1, DMA_TO_DEVICE);
> +			dma_unmap_sg(rkc->dev, sgd, 1, DMA_FROM_DEVICE);
> +		}
> +
> +		if (!timeout) {
> +			dev_err(rkc->dev, "DMA timeout\n");
> +			err =3D -ETIMEDOUT;
> +			reset_control_assert(rkc->rst);
> +			udelay(10);
> +			reset_control_deassert(rkc->rst);
> +			goto exit;
> +		}

[Severity: High]
Is this timeout error path subject to the same race condition with delayed
interrupts as in the ahash implementation?

Without a call to synchronize_irq(), a delayed interrupt from this request
could fire during the next request, causing spurious completions and memory
corruption when buffers are unmapped prematurely.

[ ... ]
> +		if (areq->iv && ivsize > 0) {
> +			offset =3D sgd->length - ivsize;

[Severity: High]
Is the IV offset calculated incorrectly on the encryption path as well?

Using sgd->length instead of the processed length (todo) can read out of
bounds and corrupt the IV for chained block operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530160704.3453=
555-1-dawidro@gmail.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927334C041B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783534437; cv=none; b=OM//LXkHcguXvWIPB0cmBYl1divkkeX76ci2RM/enDLRe59IWJhNFo+/NeJvvxbAtxpXRXRjlALi5WcEteisRFLhxR7HVp8oTxz0yzdoCDlK7PRB/RA7gfvtWhI+R3dRumOzGajCd9khmuDjT+8XOUn6Zb8KbF2ELIRcZylYajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783534437; c=relaxed/simple;
	bh=gOs/Vf4FY7FAeIjOKfX+ocxryp0eWV4kWD+WGnRT68M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JIinnNiacdJI/6+KwAgUzmNnr2kmPBQ6idWUqIk2moxT0xi0MtSDyKhuGpSDW5v3jDF2qgDTQm51KaDa38Wf3qS7NeuSkahVkMDnsap2hDReuS0ODBuGicTJq9d1xhntQu9+0uRdsoZeyso/2TNxeBG1ZDK5VOoivZV4qR57buQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWM/zHWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWM/zHWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF011F000E9;
	Wed,  8 Jul 2026 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783534434;
	bh=JNl0rDNmWFM4Tos3gEULCI9jiyiYD1qv3d+p9g9YbNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MWM/zHWCyyz4c7nA7sy+Ag5bOITgGuhZtRw8LctRKKdXMnI9iQP1adwgQsdd0LgWh
	 9i3QQUFCAmU6liVJzBDfGfeTU16dBKGfEH2sudjhqTHbxtzEOHq1lm3R6AQNhVlK2v
	 dy8HYC898u1WPAKz6XLQjsBJAp9/orCPCk+v5KksfsRfiedVLYqBMJQ1GNJFlbe8HA
	 htJ3PFd871+NLIefeUQBe2Se48FbepE5Bmgsc7maXz2XNWvEVjuEH80mnWRjLkXQK4
	 SpKDtotyp3XiJXpZDPFUAuJ93hEiQjaSyag5r/wnQLTWNKDkxbUi5f8RW42M9oYOMy
	 vdnylo+KZtQCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] crypto: rockchip: Add RK356x/RK3588
 cryptographic offloader driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708175837.1718437-3-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260708175837.1718437-3-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 18:13:53 +0000
Message-Id: <20260708181353.AEF011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing SYSTEM_SLEEP_PM_OPS causes device state corruption across =
system suspend/resume.
- [High] The interrupt handler accesses hardware registers without checking=
 if the device is active, leading to potential bus faults.
- [High] Driver structures managed by devres are destroyed when `remove()` =
returns, leading to Use-After-Free by active TFMs and background `crypto_en=
gine` kworkers.
- [High] DMA memory is unmapped before stopping the hardware when a request=
 times out, leading to memory corruption or IOMMU faults.
--

--- Patch [2]: [PATCH v2 2/4] crypto: rockchip: Add RK356x/RK3588 cryptogra=
phic offloader driver ---
commit 81281ac8d9ab85c86e6148fdf22fdc86a62ad727
Author: Dawid Olesinski <dawidro@gmail.com>

crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver

This commit adds a driver for the second-generation Rockchip cryptographic
hardware accelerator found on RK3568 and RK3588 SoCs. It integrates with
the crypto engine framework and implements automatic software fallbacks for
requests that cannot be processed in hardware. The driver also utilizes
runtime PM with an autosuspend delay to manage device clocks and power.

> diff --git a/drivers/crypto/rockchip/rk2_crypto.c b/drivers/crypto/rockch=
ip/rk2_crypto.c
> --- /dev/null
> +++ b/drivers/crypto/rockchip/rk2_crypto.c
[ ... ]
> static const struct dev_pm_ops rk2_crypto_pm_ops =3D {
> 	RUNTIME_PM_OPS(rk2_crypto_pm_suspend, rk2_crypto_pm_resume, NULL)
> };

[Severity: High]
Does the rk2_crypto_pm_ops structure correctly handle system sleep (e.g.,
S3 suspend)?

By only using RUNTIME_PM_OPS and omitting SYSTEM_SLEEP_PM_OPS, the PM core
may not suspend the hardware if the device is in the 2-second autosuspend
window (RPM_ACTIVE) when the system goes to sleep.

On system resume, could pm_runtime_resume_and_get() incorrectly succeed
without calling the driver's resume callback, causing the driver to program
unclocked hardware?

[ ... ]
> static irqreturn_t rk2_crypto_irq_handle(int irq, void *dev_id)
> {
> 	struct rk2_crypto_dev *rkc =3D platform_get_drvdata(dev_id);
> 	u32 v;
>=20
> 	v =3D readl(rkc->reg + RK2_CRYPTO_DMA_INT_ST);

[Severity: High]
Should this interrupt handler verify the device's runtime PM state before
accessing hardware registers?

Because the IRQ is managed by devm_request_irq(), it remains active until
after rk2_crypto_remove() returns, even though the device is powered down
via pm_runtime_put_sync() earlier in the teardown.

If a spurious interrupt arrives during this window, could this readl()
trigger a synchronous external abort (bus fault) by accessing unclocked
hardware?

Would using pm_runtime_get_if_active() here prevent accessing powered-down
hardware?

[ ... ]
> static int rk2_crypto_probe(struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
> 	struct rk2_crypto_dev *rkc;
> 	int err =3D 0;
[ ... ]
> 	/*
> 	 * Duplicate the algorithms locally for this specific device.
> 	 * There is exactly one crypto block per SoC (crypto@fe370000 / crypto@f=
e380000)
> 	 * so -EEXIST cannot trigger on real hardware.
> 	 */
> 	rkc->num_algs =3D ARRAY_SIZE(rk2_crypto_algs_template);
> 	rkc->algs =3D devm_kmemdup(dev, rk2_crypto_algs_template,
> 				 sizeof(rk2_crypto_algs_template), GFP_KERNEL);

[Severity: High]
Does allocating the algorithm templates with devm_kmemdup() tie their
lifetime strictly to the device's binding lifecycle rather than the crypto
API's reference counting?

If an admin unbinds the driver while a process holds a crypto socket,
crypto_unregister_alg() unlinks the algorithm but does not block.

Could this result in a use-after-free when the active TFM eventually
accesses the freed template memory?

[ ... ]
> static void rk2_crypto_remove(struct platform_device *pdev)
> {
> 	struct rk2_crypto_dev *rkc =3D platform_get_drvdata(pdev);
>=20
> 	crypto_engine_stop(rkc->engine);
> 	rk2_crypto_unregister(rkc);
> #ifdef CONFIG_CRYPTO_DEV_ROCKCHIP2_DEBUG
> 	debugfs_remove_recursive(rkc->dbgfs_dir);
> #endif
> 	crypto_engine_exit(rkc->engine);

[Severity: High]
If the hardware is hung and crypto_engine_stop() times out, it returns
-EBUSY and leaves the engine's kworker running.

When rk2_crypto_remove() subsequently returns, devres will automatically
free the rk2_crypto_dev structure.

Can the still-running kworker access the freed crypto engine memory in this
scenario?

> diff --git a/drivers/crypto/rockchip/rk2_crypto_skcipher.c b/drivers/cryp=
to/rockchip/rk2_crypto_skcipher.c
> --- /dev/null
> +++ b/drivers/crypto/rockchip/rk2_crypto_skcipher.c
[ ... ]
> int rk2_cipher_run(struct crypto_engine *engine, void *async_req)
> {
[ ... ]
> 		timeout =3D wait_for_completion_timeout(&rkc->complete,
> 						      msecs_to_jiffies(2000));
> 		if (sgs =3D=3D sgd) {
> 			dma_unmap_sg(rkc->dev, sgs, 1, DMA_BIDIRECTIONAL);
> 		} else {
> 			dma_unmap_sg(rkc->dev, sgs, 1, DMA_TO_DEVICE);
> 			dma_unmap_sg(rkc->dev, sgd, 1, DMA_FROM_DEVICE);
> 		}
>=20
> 		if (!timeout) {
> 			dev_err(rkc->dev, "DMA timeout\n");
> 			err =3D -ETIMEDOUT;
> 			reset_control_assert(rkc->rst);

[Severity: High]
When a request times out, does unmapping the scatterlist entries before
calling reset_control_assert() introduce a race condition?

If the hardware is merely delayed and completes the transaction during this
brief window, could it write to unmapped memory or recycle bounce buffers,
triggering an IOMMU fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708175837.1718=
437-1-dawidro@gmail.com?part=3D2

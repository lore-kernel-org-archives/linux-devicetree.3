Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801966;
	b=nyzmZ9U+EFQmWmiBWXFIn1AOllOjwEf5OWGC/J5lnsqxtsc8EgltLuD6elOmNnW1naR2
	 Y2iACZ3Y8yLiQHHdCe+Rul8WhyY0HRpHCfMx3d5D/P4KA4jQjBj0p6TVh4CB53V1UHUPj
	 bj9+Un+Juyt/zG6egPZ+vmTUb6dsTYLJZ85MZgdfbiZABm0QEsZas9jZwdaLmNpgOhLEh
	 Z8vr6pIT+M7Qv/Mc0Ihwt9c2B4k1fjXoQbsMmHCuw1TmOq49Hb9/m5ymLGW/Ni81aCxrG
	 eWbDnJjVlMz2JFM0LB+4Cb1bYOoL1v4xueEKahMA0R4KjSzHq94BHS1NmnyRo3a7mgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801966;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1hE/mMB3E3minuGTIErhAoOn9CwKv3qYlwTz7dUSxsA=;
	b=cK3lFGgAmZbMHwsZ/T1D/ndUWGr7uIgFcY3uQxNgRcVPVjyOM4XJ4rCuORl7ToOZXUKA
	 kuXkAhlsHUVzWRXzywtGn2duCoQ3WZeDTNX2lq/NALEG8ddtAHBVF4eJQa5IPVSS5uCaF
	 6og3GkpQitdlWoYY/Kh5xHQcsusYCHVF60Aku2n+Q+nXUQA6QgX5TsfujQkwAmLpwv4h/
	 2u845IiGJTH6M+VASIZ+Mmwn4OzEcLoiWQYAJEOw5V7bzXf+K+D6FWHAuaMB2GkwZMN0R
	 254/gSwjlt+LoFfYbSTt3VwFiCcLi41ijbIOm58htIbgqgeHXBGIYACNeRT1DjDAZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbGioD6l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C54D606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbGioD6l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FA41F00919;
	Wed,  4 Nov 2026 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801965;
	bh=1hE/mMB3E3minuGTIErhAoOn9CwKv3qYlwTz7dUSxsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mbGioD6lupVQf3Um+9+Z1b6JFPdG6fUDsZIUDfl+Dpl8bJb+AD5l5HxEG1NsQ1Dnq
	 QlWD9HW3Hqpb7eMHR5jcnUQBYztVUN2oTzcJgrWWn+kKyCW5ULTpZeiximjaWlIkBm
	 4jX1eLj/pCrO0MRtcxsY77SJl5SmsQ4aW+R3Z9T/XaCusQGvZ/yW2Z5+K+AVAvz7MB
	 TxHTXvaHmFLSMB3ADVlZd/Gmx2TSbmTf96ror+JWlG6wmkGu+lsoNqNPGWF6OTA9ny
	 sPZiKiP+T0UIeHVXM5NBehkMKTvEZg91/CFnakyFnxIVWj6cXEKneHV1B2maO+ibot
	 uCbyRDKvEyoVQ==
Message-ID: <sashiko-outbox-197422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
 <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:19:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: wwan: qcom_bam_dmux: race between bam_dmux_pc_irq() and bam_d=
mux_probe()
- [Low] net: wwan: qcom_bam_dmux: incomplete vmid validation in bam_dmux_as=
sign_dma_pool()
--

commit e5defad9cc621641da7903957a89aa1c3fa0145a
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

This commit assigns a restricted DMA pool to both the local and remote
execution environments via QCOM SCM when the qcom,vmid property is present
in the device tree, and reclaims the pool for the local environment during
probe cleanup or driver removal if the remote side has dropped its power
vote.

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..c9639474e58ac 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c

[ ... ]

> @@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
ruct device *dev)
>  	return 0;
>  }
> =20
> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> +{
> +	struct device *dev =3D dmux->dev;
> +	struct device_node *rmem_np;
> +	struct reserved_mem *rmem;
> +	struct qcom_scm_vmperm dst[2];
> +	u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +	u32 vmid;
> +	int ret;
> +
> +	if (!of_property_present(dev->of_node, "qcom,vmid"))
> +		return 0;
> +
> +	ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
> +	if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(u64))
> +		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);

[Severity: Low]
As reported by Sashiko on v2 [1], in Documentation/devicetree/bindings/net/=
qcom,bam-dmux.yaml,
qcom,vmid specifies minimum: 1 and maximum: 63, since 0 is not a valid
Qualcomm SCM VMID. However, bam_dmux_assign_dma_pool() does not reject
vmid =3D=3D 0 and passes it on to qcom_scm_assign_mem().

Also, when bam_dmux_assign_dma_pool() records dmux->dma_pool_perms using
BIT_ULL(vmid) and bam_dmux_reclaim_dma_pool() passes it as src to
qcom_scm_assign_mem(), qcom_scm_assign_mem() tests srcvm_bits with 32-bit
BIT(b):

drivers/firmware/qcom/qcom_scm.c:qcom_scm_assign_mem() {
	...
	for (b =3D 0; b < BITS_PER_TYPE(u64); b++) {
		if (srcvm_bits & BIT(b))
			src[i++] =3D cpu_to_le32(b);
	}
	...
	for (i =3D 0; i < dest_cnt; i++, destvm++, newvm++) {
		...
		next_vm |=3D BIT(newvm->vmid);
	}
}

On 32-bit kernels (supported by QCOM_BAM_DMUX), BIT(b) is a 32-bit unsigned
long shift, so vmid values in 32..63 trigger shift undefined behavior and
fail to populate src[] properly during reclaim.

Should bam_dmux_assign_dma_pool() reject vmid =3D=3D 0 (or enforce a tighter
upper bound unless qcom_scm_assign_mem() uses BIT_ULL())?

[ ... ]

> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
> =20
>  	ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>  				    &dmux->pc_state);
> -	if (ret)
> -		goto err_disable_pm;
> +	if (ret) {
> +		/* The PC IRQ may already have powered up the RX path */
> +		bam_dmux_remove(pdev);
> +		return ret;
> +	}
> =20
>  	/* Check if remote finished initialization before us */
>  	if (dmux->pc_state) {
> @@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>  	pm_runtime_disable(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
> +	bam_dmux_reclaim_dma_pool(dmux);
>  	return ret;
>  }
> =20
> @@ -879,6 +983,12 @@ static void bam_dmux_remove(struct platform_device *=
pdev)
>  	disable_irq(dmux->pc_irq);
>  	bam_dmux_power_off(dmux);
>  	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +	/* The remote side may still access the pool if it holds its power vote=
 */
> +	if (!dmux->pc_state)
> +		bam_dmux_reclaim_dma_pool(dmux);
> +	else if (dmux->dma_pool_perms)
> +		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>  }

[Severity: High]
Can bam_dmux_pc_irq() race with bam_dmux_probe() after devm_request_threade=
d_irq()
enables dmux->pc_irq, corrupting dmux->pc_state and causing
bam_dmux_remove() to prematurely reclaim the DMA pool or leak RX DMA
resources?

In bam_dmux_probe(), devm_request_threaded_irq() enables dmux->pc_irq before
irq_get_irqchip_state() and the initial dmux->pc_state check:

	ret =3D devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
					IRQF_ONESHOT, NULL, dmux);
	if (ret)
		goto err_disable_pm;

	ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
				    &dmux->pc_state);
	if (ret) {
		/* The PC IRQ may already have powered up the RX path */
		bam_dmux_remove(pdev);
		return ret;
	}

	/* Check if remote finished initialization before us */
	if (dmux->pc_state) {
		if (bam_dmux_power_on(dmux))
			bam_dmux_pc_ack(dmux);
		else
			bam_dmux_power_off(dmux);
	}

Meanwhile, bam_dmux_pc_irq() toggles dmux->pc_state without synchronization:

	bool new_state =3D !dmux->pc_state;
	...
	if (new_state) {
		if (bam_dmux_power_on(dmux))
			bam_dmux_pc_ack(dmux);
		else
			bam_dmux_power_off(dmux);
	} else {
		bam_dmux_power_off(dmux);
		bam_dmux_pc_ack(dmux);
	}

	dmux->pc_state =3D new_state;

If the remote side asserts the PC line right after devm_request_threaded_ir=
q()
unmasks dmux->pc_irq:

1. If irq_get_irqchip_state() sets dmux->pc_state =3D true and bam_dmux_pro=
be()
   powers on RX before bam_dmux_pc_irq() runs for that rising edge,
   bam_dmux_pc_irq() computes new_state =3D !dmux->pc_state (false), powers
   off RX, and sets dmux->pc_state =3D false (or irq_get_irqchip_state() can
   concurrently overwrite dmux->pc_state with false after bam_dmux_pc_irq()
   sets it to true). When bam_dmux_remove() later checks !dmux->pc_state, it
   will call bam_dmux_reclaim_dma_pool(dmux) while the remote processor
   still holds its power vote.

2. If bam_dmux_pc_irq() and bam_dmux_probe() both see the rising edge and
   call bam_dmux_power_on(dmux), the second dma_request_chan(dev, "rx")
   fails with -EBUSY and sets dmux->rx =3D NULL (leaking the active RX DMA
   channel), and bam_dmux_power_off(dmux) then skips
   dmaengine_terminate_sync() and unmaps and frees dmux->rx_skbs[] while RX
   DMA is still active.

3. On the new error path where irq_get_irqchip_state() fails and calls
   bam_dmux_remove(pdev), wait_event_timeout(dmux->pc_wait, !dmux->rx, ...)
   runs before disable_irq(dmux->pc_irq). If bam_dmux_pc_irq() has started
   on another CPU but has not yet assigned dmux->rx, wait_event_timeout()
   returns immediately while dmux->rx is still NULL, disable_irq() waits for
   bam_dmux_pc_irq() to finish powering on RX and sending bam_dmux_pc_ack(),
   and bam_dmux_power_off() immediately tears down RX without waiting for
   the remote side to drop its power vote.

Would requesting dmux->pc_irq with IRQF_NO_AUTOEN, reading the initial
irq_get_irqchip_state() and powering on if needed, and only then calling
enable_irq(dmux->pc_irq) avoid these races?

[1] https://lore.kernel.org/r/178996250389.2160803.17277339384338088713@ker=
nel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-qcom-bam-d=
mux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com?part=3D2

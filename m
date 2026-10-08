Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351A44AB9B
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456354; cv=none; b=U9s3S4Xl+HaQC8ao+ENBJSfIIpDja5284cp6sG9MVr24xoLWvgtvIG27wmkawOIFfQvr1vjmebbBgqFqYmo00/vemEtPrs37ccqhRKjp+UoL1INNBOfOtxNcALXZm6G3RWYxI7SkGb74AGusVjW+iCZbbgmbP0BBDhfDjc+JoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456354; c=relaxed/simple;
	bh=Cz9RQCx+BJwYU6iyYtm/K5+bu349dz+jUrTNiGHx06c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dPZLdbuRUXrKExetrlub9jkr522zZVndOJoPxEfltVbix7avO7CHtPPgfjZiS9shaobWJZbAkTy+rJC0UrDaPhCE3PBRYlbggJLqAlyxA3l4HUuLhp/CDhEugxx3rmnmMpi+YB66xqBbBCUVNGQlxndaJXZZA6OiLNiA81agXCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3e6PgEI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3e6PgEI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BFD1F000FF;
	Thu,  8 Oct 2026 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791456352;
	bh=/QJPum4Jr4eMMAFATOzNZO7XBiX9x93Qc+w/Hj7yfTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d3e6PgEIdGKH4tUNtKUCg5e79wbLfF0m0GQJPpFFaIoaYfbA7Adc6ClRP6pGtc9pn
	 5GQNLJSF+uzB/W/FZML9D9BkhBAZjKArvWYcDLrUVwy24J5PqwtQ6GEUzy5eOvWdGj
	 80KP/ghZIzrXLlMn2wqjJgri/hSzdD6zRr7+lHV1xPLShvLz91TRUvUsUu7doBf3f4
	 SYEqCtIvhMC+eIXgf2WNaVCIOB635EKDUgpo5j62wu8CHXRcSuz5pEJJJx4zm9eZxW
	 Kr9AIQhfoj++EglM3l06VCySXH69qFx6BfeP7tSKNsuk8V2BGu+nYT6+CS3iRxIDB1
	 1sm5y817FBjuw==
Message-ID: <sashiko-outbox-164040@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-mpp_bringup-v1-12-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-12-2c5797b5e4ac@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:45:51 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ath12k: leaked IRQ disable depth when NAPI poll is aborted
- [Medium] ath12k: NAPI netdev and MSI IRQs leak on AHB probe failure
--

commit 05cbf53b4f5fb7b0ba611762ab10f0a7205ad37a
Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

wifi: ath12k: Enable MSI interrupt support for DP interrupt
   =20
Configure and request external MSI interrupts for DP ring groups on the
QCN6432 platform. Create a NAPI context for each active external interrupt
group and disable the corresponding IRQs while NAPI polling is in progress.

> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireles=
s/ath/ath12k/pcic.c
> index fea284c3707ba..06178b4f20d17 100644
> --- a/drivers/net/wireless/ath/ath12k/pcic.c
> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> @@ -181,6 +181,112 @@ static irqreturn_t ath12k_pcic_ce_interrupt_handler=
(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
> =20
> +static void ath12k_pcic_ext_grp_enable(struct ath12k_ext_irq_grp *irq_gr=
p)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < irq_grp->num_irq; i++)
> +		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
> +}
> +
> +static int ath12k_pcic_ext_grp_napi_poll(struct napi_struct *napi, int b=
udget)
> +{
> +	struct ath12k_ext_irq_grp *irq_grp =3D container_of(napi,
> +						struct ath12k_ext_irq_grp,
> +						napi);
> +	struct ath12k_base *ab =3D irq_grp->ab;
> +	int work_done;
> +
> +	work_done =3D ath12k_dp_service_srng(ab->dp, irq_grp, budget);
> +	if (work_done < budget) {
> +		if (likely(napi_complete_done(napi, work_done)))
> +			ath12k_pcic_ext_grp_enable(irq_grp);
> +	}

[Severity: Medium]
Can this leak the OS-level IRQ disable depth?

If napi_disable() interrupts a scheduled NAPI instance before it runs, or if
the poll uses its full budget, the networking core (__napi_poll in
net/core/dev.c) observes napi_disable_pending() and calls napi_complete()
directly without scheduling the driver's custom poll loop again.

Because the hardware IRQ handler (ath12k_pci_ext_interrupt_handler) uses
disable_irq_nosync() instead of masking the interrupt via device registers,
this skips the paired enable_irq() call here, leaving the OS-level IRQ disa=
ble
depth unbalanced.

The driver's teardown path (ath12k_pci_ext_irq_disable) further increments
the depth by blindly calling disable_irq_nosync(). Upon resume or
re-enablement, enable_irq() will only decrement the leaked depth by 1,
leaving the IRQ physically disabled permanently.

> +
> +	if (work_done > budget)
> +		work_done =3D budget;
> +
> +	return work_done;
> +}
> +
> +static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
> +				      struct msi_desc **msi_desc, int num_msi)
> +{
> +	struct ath12k_ahb *ab_ahb =3D ath12k_ab_to_ahb(ab);
> +	struct ath12k_ext_irq_grp *irq_grp;
> +	int j, i, k, vec_idx =3D 0, ret =3D 0;
> +	u8 userpd_id =3D ab_ahb->userpd_id;
> +	u32 num_irq, base_idx;
> +	struct msi_desc *desc;
> +
> +	base_idx =3D ATH12K_MSI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
> +
> +	for (i =3D 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
> +		num_irq =3D 0;
> +		desc =3D msi_desc[vec_idx];
> +		irq_grp =3D &ab->ext_irq_grp[i];
> +		irq_grp->ab =3D ab;
> +		irq_grp->grp_id =3D i;
> +
> +		if (ab->hw_params->ring_mask->tx[i] ||
> +		    ab->hw_params->ring_mask->rx[i] ||
> +		    ab->hw_params->ring_mask->rx_err[i] ||
> +		    ab->hw_params->ring_mask->rx_wbm_rel[i] ||
> +		    ab->hw_params->ring_mask->reo_status[i] ||
> +		    ab->hw_params->ring_mask->host2rxdma[i] ||
> +		    ab->hw_params->ring_mask->rx_mon_dest[i]) {
> +			num_irq =3D 1;
> +		}
> +
> +		if (!num_irq)
> +			continue;
> +
> +		irq_grp->napi_ndev =3D alloc_netdev_dummy(0);

[Severity: Medium]
Does this dummy netdev and the associated MSI IRQs leak if probe fails?

For hybrid bus devices (e.g., QCN6432), ath12k_ahb_probe() delegates IRQ
configuration to ath12k_pcic_config_irq(), which explicitly allocates memory
for dummy NAPI netdevs (alloc_netdev_dummy()) and manually requests MSIs
without using devm_ variants.

If ath12k_ahb_probe() fails in subsequent initialization steps (such as
arch_init or ath12k_core_init), the error handling paths jump to labels
(err_deinit_arch, err_rproc_deconfigure) that appear to skip releasing these
resources by not calling ath12k_pcic_free_irq() or ath12k_ahb_disable_irq(),
leading to a permanent memory and IRQ leak on probe failure.

> +		if (!irq_grp->napi_ndev) {
> +			ret =3D -ENOMEM;
> +			goto fail_allocate;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpp_bringu=
p-v1-0-2c5797b5e4ac@oss.qualcomm.com?part=3D12

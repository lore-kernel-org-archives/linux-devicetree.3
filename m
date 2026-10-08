Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66138654F
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456094; cv=none; b=YMk4vOIIeexXNgMkSuq8OxZUWnUPEijpYo7lxxfNBDKtFKoUF/8mZYnS+zSZrpRrGumzDwD24IpjMcYELZfKE+C2to6PLx9AHHjdBcXfUKnAzkKyCIjmKp/XWrPXe05Xf6a+2dxmC8n22JRbDmtg3ePXjQ+d31pAgGN2g5FrMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456094; c=relaxed/simple;
	bh=vh9megH7Sj4pyMcijk8a/qAznKNprN+5HfTXfx+/7xg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=R1T5Cdgaeqh17qiNfURiYBCQq32skSTpSioEi8engnA00ho+w6VJwtgpfK3N/eJnhFVMubEhu9DS2XRL6jhtxluETFaOJoUIOH2cVbmSsk3IZRIhR5bwKVKxT6LRuRJXztt2lc640qWuHlnOJR63XvhLYXPRLfRWcaAHlQvwAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgUiZuAq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgUiZuAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7671F000FF;
	Thu,  8 Oct 2026 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791456093;
	bh=mOLEfweQC2q7qjJ2pDVMzshcbRalcNK71Utj3kk3aC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MgUiZuAqKdFDBGkvImoOBPHhElczRov8DrEpuDLbWAlfYhnEVORS0tHNFX9qu5+4U
	 xz0XEmygZkmKw8vlU0lr6c6umZyUoeWgyUh4Z/jFwSHCCwLMnoA9UrXmo6o/Invfkz
	 SwO41wQh8BQ0Umi2ioK6Wtjg2dfMAkNGQPEkxWZUEZk+wQwfe1o81bACAwSap2ZlN/
	 4e3E7P96EGLCbq7z8JCuU3zD6yv1m7FJaCgqQy5+GWqoMl5N6fPlpbmUFA6AeXlBif
	 cpkjPuRdXITFAjAVfEePLZGD52/o2JDu+gV5LOv0xgVH4ig7VYRf9wODn7CHLswmj9
	 NOCXFKCRR6+IQ==
Message-ID: <sashiko-outbox-164035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 11/17] wifi: ath12k: Add platform MSI support
 for CE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-mpp_bringup-v1-11-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-11-2c5797b5e4ac@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:41:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Resource leak of non-devm MSIs and IRQs on ath12k_ahb_probe() erro=
r paths
--

commit ad41050e8b81bf8d1dd6e4fe6253604d235fd347
Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

wifi: ath12k: Add platform MSI support for CE

This commit adds support for configuring Copy Engine (CE) interrupts
through platform MSI on hybrid AHB devices like the QCN6432. It introduces
an IPCI MSI configuration, allocates MSI vectors from the platform MSI
domain, and registers CE interrupt handlers using the allocated vectors.

> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireles=
s/ath/ath12k/pcic.c
> --- a/drivers/net/wireless/ath/ath12k/pcic.c
> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
[ ... ]
> @@ -154,3 +155,157 @@ void ath12k_pcic_write32(struct ath12k_base *ab, u3=
2 offset, u32 value)
[ ... ]
> +static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
> +				     struct msi_desc **msi_desc, int num_msi)
> +{
[ ... ]
> +		scnprintf(ce_pipe->irq_name, sizeof(ce_pipe->irq_name),
> +			  "pcic%u_wlan_ce_%u", userpd_id, i);
> +		ret =3D request_irq(desc->irq, ath12k_pcic_ce_interrupt_handler,
> +				  IRQF_SHARED, ce_pipe->irq_name, ce_pipe);

[Severity: High]
Does this leak the requested IRQ on the probe error path?

Since request_irq() is used here instead of devm_request_irq(), it requires
explicit cleanup. This function is called by ath12k_ahb_config_irq() during
ath12k_ahb_probe(). If a subsequent initialization step in probe fails
(such as arch_init or core_init), the error path jumps to labels like
err_deinit_arch or err_core_free.

However, the error path in ath12k_ahb_probe() does not appear to call
ath12k_ahb_disable_irq() or ath12k_pcic_free_irq() to free these IRQs.
If the device context (ab) is subsequently freed by ath12k_core_free()
while the interrupt handlers remain registered, could this lead to a
use-after-free panic if an interrupt fires?

> +		if (ret) {
> +			ath12k_warn(ab, "failed to request irq %d: %d\n", irq_idx, ret);
> +			ath12k_pci_free_ce_irq(ab, i);
> +			return ret;
> +		}
[ ... ]
> +int ath12k_pcic_config_irq(struct ath12k_base *ab)
> +{
> +	int user_base_data, base_vector, num_vectors;
> +	struct platform_device *pdev =3D ab->pdev;
> +	int ret;
> +
> +	ab->msi.config =3D &ath12k_msi_config[ATH12K_MSI_CONFIG_IPCI];
> +
> +	ret =3D platform_device_msi_init_and_alloc_irqs(&pdev->dev,
> +						      ab->msi.config->total_vectors,
> +						      ath12k_msi_msg_handler);

[Severity: High]
Similarly, does this platform MSI domain allocation get leaked on the
ath12k_ahb_probe() error path?

platform_device_msi_init_and_alloc_irqs() is not devres managed, so the
domain must be explicitly destroyed via platform_device_msi_free_irqs_all().
Because ath12k_ahb_probe() does not call the corresponding free routine when
it encounters an error after this point, are these MSI vectors leaked?

> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpp_bringu=
p-v1-0-2c5797b5e4ac@oss.qualcomm.com?part=3D11

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93DB3B5E10
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093667; cv=none; b=nRFb+B0a45hnUkAA9eZr1ohGKVyJ53/t8VE5lVxw8OKKkxh808syTk4AIm+WajuA/uf6uLV+MZV4nj2n9WrLnAuZtcPPH24E3AiPqOT7EsaQbbdqUaB8WhkBCu8iF+O395Kk1V01HsbYuBHWFIEUXoa70RpFeP5tdaY9g71YUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093667; c=relaxed/simple;
	bh=bZtQLV40RUeKOQCAHg+7/bjCEPh9GtuHq+8i5E2A4iM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TLHDbMrVqgUhWAJ9waeuaa3JFfaV9ilkg27xVJUNJNQd6caAeosUprijnky0v21hnazYC6sFf9nLbf7+Mmb929XMW+3PzXPTTlze3TDaSbnDMrwLbPK5iLIo+K0cZg9xVbC4gvSlcvxVTT0JlQw0Fv+5Xt2z/rM21qO6Jv9Zhf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0RUn+dz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0RUn+dz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB681F000E9;
	Wed, 15 Jul 2026 05:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784093665;
	bh=i/BBy5LGBxvU5+/W4fCJHRT7TU59bn+18JRGWlbg6YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h0RUn+dzfNgTHdXwWAWw5OG5WeqkcvIIhubmk7ShSYpRn4JgsZmPI9k7nF/mdKwuC
	 qZcLOEBbVfZKWPvFNraS2buXLvSjhJcjfj6jUyE//0pl92p3qWIo/OZot65jvaAJuI
	 NBJ6Q6TCe8i8ZtpmzRhasywvOWUtS8AKOJ1Pr+E4GfonVbN7B6jHuAkGPw3JOoPjA2
	 3qoLbNk67HWaCm5P+uxNg8RbC6LjkuZ77x0ATSBDuT1LsIt1EBT6UbwXm7ehkI8cJj
	 crfJdcUrZHgCd6dp6js1j3oBUTfhpQoVsbA0feBl/jZi7ZF1uCesA5sGLl9PYwRoWx
	 pMaZ/CtTvxhcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 05:34:24 +0000
Message-Id: <20260715053425.3EB681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Double fetch / TOCTOU vulnerability due to reading validated B=
AM-DMUX RX header fields directly from shared coherent memory.
- [High] The driver passes a `dma_addr_t` to `qcom_scm_assign_mem()`, which=
 expects a `phys_addr_t`, causing memory protection failures when an IOMMU =
is active.
- [Low] Unconditional 'select QCOM_SCM' in a driver that supports COMPILE_T=
EST causes unmet direct dependency warnings on unsupported architectures.

Pre-existing issues:
- [High] The probe error path leaves the pc_irq enabled, which can trigger =
unhandled DMA operations that continue running after the dmux struct is fre=
ed, causing a Use-After-Free.
--

--- Patch [2]: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a =
single coherent block ---
commit 1922e77e47093401dce237ccfcb72b740d813974
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

net: wwan: qcom_bam_dmux: Alloc RX buffers as a single coherent block

This patch modifies the BAM-DMUX driver to allocate all RX buffers as a sin=
gle
contiguous DMA coherent block on supported platforms. This reduces the numb=
er
of required XPU resource groups from 32 to 1, avoiding XPU violations on ne=
wer
Qualcomm SoCs.

> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 958dbc7347fa8..1b133c5623161 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>  config QCOM_BAM_DMUX
>  	tristate "Qualcomm BAM-DMUX WWAN network driver"
>  	depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
> +	select QCOM_SCM

[Severity: Low]
Does selecting an architecture-specific symbol here cause unmet direct
dependency warnings on unsupported architectures? Since this driver
supports COMPILE_TEST, building it on x86 or other non-ARM architectures
could trigger warnings if QCOM_SCM's own dependencies are not met.

[ ... ]

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..247230b720e60 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -499,9 +521,10 @@ static bool bam_dmux_skb_dma_queue_rx(struct bam_dmu=
x_skb_dma *skb_dma, gfp_t gf
>  static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
>  {
>  	struct bam_dmux *dmux =3D skb_dma->dmux;
> -	struct sk_buff *skb =3D skb_dma->skb;
> -	struct bam_dmux_hdr *hdr =3D (struct bam_dmux_hdr *)skb->data;
> +	struct bam_dmux_hdr *hdr =3D skb_dma->rx_virt ? skb_dma->rx_virt :
> +				   (struct bam_dmux_hdr *)skb_dma->skb->data;
>  	struct net_device *netdev =3D dmux->netdevs[hdr->ch];
> +	struct sk_buff *skb;

[Severity: Critical]
Is there a double-fetch vulnerability introduced by reading the header fiel=
ds
directly from the shared coherent RX block?

Earlier in bam_dmux_rx_callback(), hdr->ch and hdr->len were validated.
However, because the memory is shared and remains writable by the modem,
a malicious remote processor could overwrite hdr->ch or hdr->len after the
initial checks but before they are re-read here to index the dmux->netdevs
array and allocate the SKB.

Could this allow an out-of-bounds read or memory corruption if the modem
alters the header mid-flight? Should the header be copied to local kernel
memory before validation?

[ ... ]

> @@ -762,6 +800,71 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
ruct device *dev)
>  	return 0;
>  }
> =20
> +static int bam_dmux_alloc_coherent_rx(struct bam_dmux *dmux)
> +{
> +	struct device *dev =3D dmux->dev;
> +	const struct bam_dmux_data *data =3D of_device_get_match_data(dev);
> +	size_t size =3D BAM_DMUX_NUM_SKB * BAM_DMUX_BUFFER_SIZE;
> +	u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +	struct qcom_scm_vmperm dst[2];
> +	int i, ret;
> +
> +	if (!data)
> +		return 0;
> +
> +	if (!qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
> +	dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> +	dst[0].perm =3D QCOM_SCM_PERM_RW;
> +	dst[1].vmid =3D data->vmid;
> +	dst[1].perm =3D QCOM_SCM_PERM_RW;
> +
> +	dmux->rx_buf =3D dma_alloc_coherent(dev, size, &dmux->rx_buf_dma, GFP_K=
ERNEL);
> +	if (!dmux->rx_buf)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < BAM_DMUX_NUM_SKB; i++) {
> +		dmux->rx_skbs[i].rx_virt =3D dmux->rx_buf + i * BAM_DMUX_BUFFER_SIZE;
> +		dmux->rx_skbs[i].addr =3D dmux->rx_buf_dma + i * BAM_DMUX_BUFFER_SIZE;
> +	}
> +
> +	ret =3D qcom_scm_assign_mem(dmux->rx_buf_dma, size, &src, dst, ARRAY_SI=
ZE(dst));

[Severity: High]
Does qcom_scm_assign_mem() expect a physical address rather than a DMA
address?

Here, dmux->rx_buf_dma is a dma_addr_t returned by dma_alloc_coherent().
If an IOMMU is active, this is an IOVA. Passing an IOVA to the TrustZone
XPU instead of a physical address could result in incorrect memory
protection, potentially causing an SCM fault or a system crash when the
modem attempts to access the buffers.

[ ... ]

> @@ -845,6 +952,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>  	pm_runtime_disable(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
> +	bam_dmux_free_coherent_rx(dmux);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but does this error path need to disable
the pc_irq?

If bam_dmux_probe() successfully requests pc_irq via
devm_request_threaded_irq() but a subsequent step fails, it jumps to
err_disable_pm and returns without disabling the IRQ.

Could this cause a use-after-free if the modem triggers the IRQ before
devres frees it? The IRQ handler could run, start DMA operations, and
then have the memory freed out from under it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-qcom-bam-d=
mux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com?part=3D2

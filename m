Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F93932C6
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122089; cv=none; b=F/jw2OvSy03dtybj5MWuHbjwSW05YzokpadUxRl21Y2ggR1sap/dNx6KOhzg5JlMXUBQgSUxqFZsawhUTi/e0/ATEt9v2GKAYo5YkJb91kdEQAH2CnwLR+UlpXbkmn2A/ellPmgCyqQhVlKb/gJfFc7EH6F87JIUqCJtU0WC23g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122089; c=relaxed/simple;
	bh=OKsjifkHD+vQCQlsw2iPFhQoXMPE+kWVdDI+lGqK4EU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PRwG/VnVnm4t0rrLOYJR3hU9k2KA0XjB/Hpitm7InAriUer6SNEHP+2vkTQhpQl24o82kO85KBCbl2l8vgn4hijhia/kNn2Cv3EBFHrNvCmh4uJc4h3j++mtd2ctzOQk2Siil1PWVs8iVgEfxg2elXvwxjOBGwrImpyZJkLrmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVaQeEww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVaQeEww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972D11F000C4;
	Fri, 16 Oct 2026 03:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792122087;
	bh=befJ9uhAcgS7t8ZClvrKP8+bBTDKT4DZcgRftcUjRN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVaQeEwwmRruy4/qJrNeMwYy430YgMRqCUU1KSWKIxI1zaQszETNc9WRuyL14ld5w
	 VCe/W3+P+H5K88LBaVbC6NOn55J0KVvQhARqZxsdm8Q7Po4CDf0OngpzKOo8u0rqPn
	 NnQWajKArWRiScRKJW95k2BE8eeryALBPQ+knbrpbpZ57hfq0/UEScIJJ4hfh+HNhT
	 2/GN3qtszwveLRLiS8QqQG0E/WAHTF5DQ0j7PYxPS+BXf146YikcCnQjhhXm27Zi/0
	 PiTectT+FngXbRfe9REccq85g/SyvtjwnReN15E6J/QztCRXICfolVYoHmTiokwTgc
	 KZXTh7kWDNLRg==
Message-ID: <sashiko-outbox-173689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-mpp-bringup-v2-12-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-12-f510c33bfcf5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:41:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] wifi: ath12k: TOCTOU race drops edge-triggered MSI DP interrupts c=
ausing permanent stall
--

commit d922087bb1f873dbadddf00fcba276c1d612d2d7
Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

wifi: ath12k: Enable MSI interrupt support for DP interrupt

This commit configures and requests external MSI interrupts for DP ring gro=
ups.
It creates a NAPI context for each active external interrupt group and disa=
bles
the corresponding IRQs while NAPI polling is in progress.

> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless=
/ath/ath12k/pci.c
> index a26fdb3c0ad27..4bb14a95aec98 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
[ ... ]
> @@ -1118,7 +1122,7 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *=
ab)
>  	for (i =3D 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
>  		struct ath12k_ext_irq_grp *irq_grp =3D &ab->ext_irq_grp[i];
> =20
> -		if (!irq_grp->napi_enabled) {
> +		if (irq_grp->napi_ndev && !irq_grp->napi_enabled) {
>  			napi_enable(&irq_grp->napi);
>  			irq_grp->napi_enabled =3D true;
>  		}

[Severity: High]
Can unmasking the hardware IRQs race with setting the software flag?

In ath12k_pci_ext_irq_enable(), ath12k_pci_ext_grp_enable() is called just
after this block to unmask the hardware IRQs, but the software flag
ATH12K_FLAG_EXT_IRQ_ENABLED is only set after the loop completes:

	ath12k_pci_ext_grp_enable(irq_grp);
}
set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);

If an MSI interrupt fires immediately after unmasking,
ath12k_pci_ext_interrupt_handler() drops it because the flag is still clear:

	if (!test_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
		return IRQ_HANDLED;

Since MSI interrupts are edge-triggered, dropping the interrupt without
scheduling NAPI leaves the hardware condition unacknowledged. No further MSI
will be generated, which could permanently stall the DP ring.

Since NAPI is already enabled for the group before unmasking the hardware I=
RQ,
is it safe to drop this interrupt, or could the flag be set earlier?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-mpp-bringu=
p-v2-0-f510c33bfcf5@oss.qualcomm.com?part=3D12

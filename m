Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473199;
	b=1bNr2D+KBnJ4fFRjJWg9BITYA1xehyXOK/mLnQPpd4f1ohAKC5vu+KUHd+dPFM70f+qu
	 8168m6ygOfaJz9jTrLA6Riy7U/HtgbZ/+6UThMNOGqSWl1ihmJDJwl3V6xKiJ52GKBoVb
	 PJg8RO40+umPGvyEG+ZdYnn1mTiPAXkQRWmDhe4E7SCJGo3QELspDSwKyM7TfzW0vZ8Z9
	 on+lecy6nhdfaFxueQ8nF1aH4xOhlVjWzNAXXF/Pim0pv8jI/KqqGDw79nBI/FDFgP4Fy
	 BHrAWegRVgChPPF85BPbsfJqQPAPE3o4W2eImX2fk4TqonJbLn80YLTB+GqQmCnksLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473199;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=frZ5186c0l5kiib8DFEem1gf2suksLss9Pj5r4at/AE=;
	b=sLm4Xtb+1TOkrpaZaXyHBgsP2+RF5/fCBJpjO58epa/vMJmqERCbfxF3z3d6kryiM+nU
	 aoX16XGMxFozU7+MuJEVSuXwq/UhUm6fJgouel4d3j+yOOgyHPuplhniDsnkXRG0jVjcb
	 HBeKTsuXM8Jwa4Qn83AYxQGc2CUEDlVkLAE6/llbwyQKlZGBPTIEAcrrXkYXzV+Zl5CH9
	 C+MZRG0dVGg6SrMQz4+uFdwvwW+w6/2G7q5Av5B3f2/j2vK3c8l8D4nzSOIV3ZJIZ84VC
	 5a43t7/l1nah/GzW5aceIcL0GEyycxmwL+hJNSmHVAec0qxq8hB0vbPbzBQX/XPwSCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eW2vTj4X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F0606A8B1
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eW2vTj4X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045A41F00A05;
	Thu, 12 Nov 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473199;
	bh=frZ5186c0l5kiib8DFEem1gf2suksLss9Pj5r4at/AE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eW2vTj4XyVP4SYdvMTIUDLO8piyUU+U/RProK7PVbMER3GWU6lUSo3xC4pb3ibxC6
	 s+102DyIj4BBSI3oV0DKYsKsJ4CN5gMTOzS659ZEcvp661HQFnTl1TkEYr7Thu+dg6
	 ZH4qv38yGTcl7C5KBmxpk0sAZk4kesXfn+RV+GyoSY4kax4xhBDtRD0GUpnFWIfqfG
	 Z9X+BrH4ZvNoypFqujQD7Q4+X64HzlRaOTppS8ZP/+0JyohMOHCkMQVYiA0AOwY0gb
	 lqtxIPQBPlAHkqGewUnFguAtpnpBlwKyQ6XxCeRMkEq0eSFwek3hYgLTNx6TNz96iH
	 sC1r1DqcJccOQ==
Message-ID: <sashiko-outbox-210781@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-2-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-2-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:46:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] wifi: ath12k: hardcoded 0x3f window mask in
  ath12k_pcic_select_static_window()
--

commit bb1726c3a715437675ea3d3a7a6b0b741f959d92
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: refactor PCI window selection to per-device layout

This commit moves PCI and AHB register window masks and register offsets in=
to
per-device layout structures so device families with different window layou=
ts
can configure their own window mapping.

> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireles=
s/ath/ath12k/pcic.c
> index b6d306fd3b99f..cd04b9531d912 100644
> --- a/drivers/net/wireless/ath/ath12k/pcic.c
> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
[ ... ]
> @@ -32,7 +38,7 @@ static int ath12k_pcic_select_static_window(struct ath1=
2k_base *ab, u32 addr)
>  	const int max_retries =3D 10;
>  	int i;
> =20
> -	window_bits =3D u32_get_bits(addr, WINDOW_VALUE_MASK);
> +	window_bits =3D field_get(ab_ahb->reg_base->window_value_mask, addr);
> =20
>  	/* Update window bits [5:0], preserving other bits */
>  	new_window =3D u32_replace_bits(ab_ahb->static_window_reg, window_bits,=
 0x3f);

[Severity: Medium]
Should ath12k_pcic_select_static_window() use
ab_ahb->reg_base->window_static_mask (like ath12k_pci_select_window() does)
instead of hardcoding 0x3f here?

Leaving 0x3f hardcoded leaves struct ath12k_ahb_reg_base::window_static_mask
unused across the driver and truncates window_bits to 6 bits on AHB/PCIC
devices whose dynamic window field is not bits [5:0], misprogramming the
window register during CMEM accesses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-wifi8_qcn9=
575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com?part=3D2

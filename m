Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A04A92C1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166551; cv=none; b=hyVW7sQQr+blxSzpSAt91iwpr8XN/f9Dg+NEuH7nD6ovpaqCNYR0pdfTZdMrYRtF5pjaDuMGoiwQhoZkqmnEqCuOoNgJ+07JCrnUHZgKaS/uIWS5bUIjJX+LaaAaUxVLbXhs0IA6rBPACkLiIv17HQPMIayCoOWCvuC1EyhlhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166551; c=relaxed/simple;
	bh=i0JXI+PL7OJyNzgzug2EwJrVI5CK01AR4iAGhHTej68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UzX5zrKYmt03xr59ggtZDgiVACNfnWDPwNH/+YNs2yP9BuSnozR4iJ8P/ZL4wXUX9S6JXWl7x3BycjVCdGjSu9vYOCGUgOQr8sHf0SzfOSPKkwJMWYVCXk0WarXrCInLtOv7fh16i2uoRa8inkkVCulY0oGxKka6Mg5zcpRMO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhxYiSRZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhxYiSRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AE81F000FF;
	Wed, 23 Sep 2026 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166550;
	bh=88cFTx9ma+1QDm3ykVNT3jroBfuO09ttwTUFLg+1vTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nhxYiSRZdKYH45t0s8dOVljD5DlnkLaFzr/UPRkCbRU2b1lRgm8hjEYNJyWqVim/v
	 O5yly3/jPhbatyGZzjQzB7Lg6NZJSeC9xnbJJGtkHvEjvBkbPFoeCRNggbPjdHfKfG
	 5u0J8jkC91D8CqUU+YSKoa4JOSDssfCYnxLUvQIRxjMKlsXca83NtkE2OUeMvmsWnK
	 wUjYqyRhcljHXJsiz/hSxBmXJbrKuGOLFmoeqnjHOYG9p9z4+7MruidMvZ+fjqq/MO
	 2GcmfA29il6WMPx6h/5Du4TZE3NoDRoTqgN2lQYJ0Bt6hZHA1rRtyB6yOp79sNzqHm
	 7BZX+cp0+Fjbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 13/16] wifi: ath11k: add hw ring mask for
 QCN6122
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-13-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-13-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:29:09 +0000
Message-Id: <20260923122909.E4AE81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ath11k: unhandled IRQ storms/spurious wakeups due to TX ring mask =
mismatch
--

commit 3b2799aad0073fb22a0ae0ac93a828666b2e2126
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: add hw ring mask for QCN6122

This commit adds the hardware ring mask configuration for the QCN6122 chips=
et
and registers it in the hardware parameters.

> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/=
ath/ath11k/hw.c
> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
[ ... ]
> @@ -2070,6 +2070,43 @@ const struct ath11k_hw_ring_mask ath11k_hw_ring_ma=
sk_wcn6750 =3D {
>  	},
>  };
> =20
> +const struct ath11k_hw_ring_mask ath11k_hw_ring_mask_qcn6122 =3D {
> +	.tx  =3D {
> +		ATH11K_TX_RING_MASK_0,
> +		ATH11K_TX_RING_MASK_1,
> +		ATH11K_TX_RING_MASK_2,
> +	},

[Severity: High]
Does this TX mask configuration cause unhandled interrupts or spurious wake=
ups?

QCN6122 uses ath11k_hw_hal_params_ipq5018 which specifies num_tx_rings =3D =
1.
However, this mask enables three TX ring masks.

When an MSI vector fires for these extra groups and schedules NAPI,
ath11k_dp_service_srng() bounds its polling loop to num_tx_rings:

drivers/net/wireless/ath/ath11k/dp.c:ath11k_dp_service_srng() {
    for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
        if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
            ab->hw_params.ring_mask->tx[grp_id])
            ath11k_dp_tx_completion_handler(ab, i);
    }
    ...
}

Since num_tx_rings is 1, the extra rings defined in the mask=20
(ATH11K_TX_RING_MASK_1 and ATH11K_TX_RING_MASK_2) will not be processed. Co=
uld=20
this lead to an unhandled interrupt storm or persistent performance degrada=
tion=20
from spurious NAPI executions if the hardware actually signals these extra=
=20
rings?

> +	.rx_mon_status =3D {
> +		0, 0, 0,
> +		ATH11K_RX_MON_STATUS_RING_MASK_0,
> +	},
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D13

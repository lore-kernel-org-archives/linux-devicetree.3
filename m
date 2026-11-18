Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983473;
	b=lI4QLkpW08Lphf9vS97BuhVkWeW6F2YGf+OW2e1BPlZfEn8I5EAzm0szOEmGPcEqls28
	 fL9QJyn5kMfCE0nRca6ufE/xX2jW4d2xXUqBVgc8F22SM/s+stcQANif/tAFoCQsrFJAk
	 ylD3wy/yFHkR4ptRCAhu7Dim9vHdnYUXNXvF6jc3atcfnabCdwULKzNZ7wLeAPtcILka3
	 YgYPzuc2DS4ZqL6WLtve8c/yGlPuB2fQtegfxmAytOEGvqc473Voom/MfQHNl6ZuDima5
	 KUbtNCWcE5WXWKvAGqDaYM6kpl3jir/1kEv3SxaWZ6IT+yvOjajhvcgUjxCoaDTC9Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983473;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RG+oKWDqHOUU2z2Oa8p15IzPWRjq2q3DC1AuG4OygAU=;
	b=3J4k5/IDOBbe7BHzZfiIrd/50rxk+qXciQccOszgelqu8AJ/YfzAsiJNsvf6lVhyXKsg
	 Ct1WNg6uylmkv4zVfa1UVqQd8ekyARR7EAd/ZHKUhhQTcybSV3wnSOtQxxlk/QQBaYc7w
	 gK0sDo5hOTv5eY8zL9K3IDBWsbJvuJTNPU2OA4FIWDR8CZeORmY0Pzrm6luMqpzjE3VWV
	 mVId3y080dAm33JfLTwmwQHp214Wa3ROGZAxv+FMWJXK+QATTWTO5sRAwpCTi8XqWXM88
	 NMWsrpS0MJ1fotop946XFVFroSQvadY98//+rn69VTqHhS1AIlldDdTTgKUpmR+5vrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tq2gj3DR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE51606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tq2gj3DR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4089E1F000C5;
	Wed, 18 Nov 2026 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983472;
	bh=RG+oKWDqHOUU2z2Oa8p15IzPWRjq2q3DC1AuG4OygAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tq2gj3DR7XvbWwdselmWBDuuE1hr+GjdJyAlgRDsX1k1PzLZlJdn7GVDMvvTWNefJ
	 W7hD1HXqiaUCK/VoE+mWGqvEpaCDiEugFKG6WA/zwoJxlS8wTILWlMO/WprxeC2vhd
	 I9yNTFi57IpeCtTRzUxWuqgt3V/cLtQyDhF2JdoBqbd1+OVjLmkvKPKoiyu+ENYTqs
	 o9ZfjHzzMm2vx5R19VjArF1Kj1Uz4AlEOHEHpB3/P5W24b0Z+nJ1I7BQVMioQr13X/
	 k2J4hPB1OYIJ8Yh2TMy/vgfIgC0gs54jk+sk77rYqM7DHW+ltVVhokS/pOl4OMMpbU
	 DDDPrwHhr+7fQ==
Message-ID: <sashiko-outbox-220253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-2-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v2-2-d81a3046290e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:31:11 +0000
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
- [High] wifi: ath12k: runtime mask passed to u32_replace_bits() in
  pcic.c
--

commit fea0a3bf22c9a4872fcffbf9f6c11d790f370851
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: refactor PCI window selection to per-device layout

This commit moves PCI and AHB register window masks and addresses into
per-device structures so device families with different window layouts can
configure their own mappings.

> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireles=
s/ath/ath12k/pcic.c
> index b6d306fd3b99f..c10e21d688303 100644
> --- a/drivers/net/wireless/ath/ath12k/pcic.c
> +++ b/drivers/net/wireless/ath/ath12k/pcic.c

[ ... ]

> @@ -32,20 +38,21 @@ static int ath12k_pcic_select_static_window(struct at=
h12k_base *ab, u32 addr)
>  	const int max_retries =3D 10;
>  	int i;
> =20
> -	window_bits =3D u32_get_bits(addr, WINDOW_VALUE_MASK);
> +	window_bits =3D field_get(ab_ahb->reg_base->window_value_mask, addr);
> =20
> -	/* Update window bits [5:0], preserving other bits */
> -	new_window =3D u32_replace_bits(ab_ahb->static_window_reg, window_bits,=
 0x3f);
> +	/* Update the dynamic window bits, preserving the static window configu=
ration */
> +	new_window =3D u32_replace_bits(ab_ahb->static_window_reg, window_bits,
> +				      ~ab_ahb->reg_base->window_static_mask);

[Severity: High]
Does passing ~ab_ahb->reg_base->window_static_mask to u32_replace_bits()
break the build when CONFIG_ATH12K_AHB is enabled?

u32_replace_bits() calls u32_encode_bits() -> field_multiplier(), which
requires a compile-time constant mask to eliminate the __compiletime_error
call to __bad_mask().  Because ab_ahb->reg_base is a runtime pointer, the
mask check cannot be folded at compile time.

Updating new_window with field_prep(~ab_ahb->reg_base->window_static_mask,
window_bits) | (ab_ahb->static_window_reg &
ab_ahb->reg_base->window_static_mask), or masking static_window_reg
directly as in ath12k_pci_select_window(), would avoid u32_replace_bits()
on a runtime mask.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wifi8_qcn9=
575_bringup-v2-0-d81a3046290e@oss.qualcomm.com?part=3D2

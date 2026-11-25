Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647720;
	b=s+92Xe9Zt5lEbqIN6TCKqwyGO4B3eLzdyV1yjC8YumNhEz0r/AoHgfTcROHDt5nRV+0d
	 9L17vRLp8rfUf5vTyWivgpj9/jvnTKE7C0DKqOzaJ0m0YHyWoLMsR42c9y0wX0BW2gb55
	 mlpa7oOpS6ISTQvz4HhUz0xMyXJJkX50/hAPxLGbsWySTK0PBw4AACsHeXxsZZyEo3Epf
	 Q1A3soKX0xjUOO0sw6YM7zKbGdKnUSOxe6zQfFBnpMHYXthuYr3UsCy2Ox34KUgv2PurB
	 DWLu6sZ/R9Lk25MQUNvOY4hHtYwY0D6n/v6MuFhHaG+746/kBnuHzbqvMnUqHZ3st1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647720;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kHPJ+TLxOjSXf6f7RoPtw1EjznhVGTvvTv6FX4qChyo=;
	b=KdKs6dOrHKIS8dJqpBZQtyLwAZ3nOoYYrnAc79KukJMKABDOtH3k9CIrNRizL6apvNgL
	 kd0QVY0XokE1rUEKn8A+7xpn+tPfXn23WWg5PYbjZLDzxbymBqjobj0ZVvyYftnVbCdEg
	 J1RaWOPdJNRcQ4T2Jn3M2tVstD3HIgA0yNjE1lnyK8eSNqaNkcnLMfODY1nCOc/CfPmGi
	 dh5sc7XGSZv1OwULVgHwWACbIgIHrtlCX/LcARTvcrd+WI1QYQ6Ee8YQ0FzdhESonZuW9
	 AYmU95NFRhhWegO0rMSlTj5uk4XhcHXQPa3ONsbd/8pLZVb28ude7o/vqNpLuoHQ7jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oRq/t7MO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAC606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oRq/t7MO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC491F000CA;
	Wed, 25 Nov 2026 23:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647719;
	bh=kHPJ+TLxOjSXf6f7RoPtw1EjznhVGTvvTv6FX4qChyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRq/t7MOtHC1kPh5o3y4EMZaxI0es7nPpKs51f9EwQgns1Gy5mCaeyZDtCFoJQs/D
	 Rj2Jd3p1z7ShbL/HsV9DX/PPxKqWTCXTsj7xjbAoACLwzQoIY0ulWc829YDR186fBk
	 Sw7yV4NqhlDjjX/uqWb6b5Jpm1NOlTm1wxlI+Nw7DBHQNbPRugB4gPxZUh6A+zXcts
	 9zwxAgK67v8+3QxfthvdGfnQAMevtalnxrO2jqRmy2+jMq8oAi5saokYlQe5PwX6It
	 AJcXuI3wTt+rxwQcC9Y+9MD5T1Ax5QY3srH6/wVg6DFc34qf1HSoM5Rdn1o976T62q
	 xrIvKuDaHHlXg==
Message-ID: <sashiko-outbox-234345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: ipa: add IPA v4.1 register
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-2-48a889acbe6b@gmail.com>
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-2-48a889acbe6b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 23:01:59 +0000
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
- [Low] net: ipa: v4.2-only IPA_TX_CFG fields defined in ipa_regs_v4_1
--

commit d81fb1257ed5590836b5aee65b5b90db03d1f316
Author: Robert Ijtsma <robertijtsma@gmail.com>

net: ipa: add IPA v4.1 register definitions

This commit adds the IPA v4.1 register definition table and maps
IPA_VERSION_4_1 to gsi_regs_v4_0.

> diff --git a/drivers/net/ipa/reg/ipa_reg-v4.1.c b/drivers/net/ipa/reg/ipa=
_reg-v4.1.c
> new file mode 100644
> index 0000000000000..75f47b2f1a474
> --- /dev/null
> +++ b/drivers/net/ipa/reg/ipa_reg-v4.1.c
[ ... ]
> +static const u32 reg_ipa_tx_cfg_fmask[] =3D {
> +						/* Bits 0-1 reserved */
> +	[PREFETCH_ALMOST_EMPTY_SIZE_TX0]		=3D GENMASK(5, 2),
> +	[DMAW_SCND_OUTSD_PRED_THRESHOLD]		=3D GENMASK(9, 6),
> +	[DMAW_SCND_OUTSD_PRED_EN]			=3D BIT(10),
> +	[DMAW_MAX_BEATS_256_DIS]			=3D BIT(11),
> +	[PA_MASK_EN]					=3D BIT(12),
> +	[PREFETCH_ALMOST_EMPTY_SIZE_TX1]		=3D GENMASK(16, 13),
> +						/* Bit 17 reserved */
> +	[SSPND_PA_NO_START_STATE]			=3D BIT(18),
> +	[SSPND_PA_NO_BQ_STATE]				=3D BIT(19),
> +						/* Bits 20-31 reserved */
> +};

[Severity: Low]
Should SSPND_PA_NO_START_STATE and SSPND_PA_NO_BQ_STATE be omitted from
reg_ipa_tx_cfg_fmask on IPA v4.1?

In drivers/net/ipa/ipa_reg.h, enum ipa_reg_ipa_tx_cfg_field_id documents
SSPND_PA_NO_START_STATE as IPA v4.2+ (not IPA v4.5) and
SSPND_PA_NO_BQ_STATE as IPA v4.2 only, so bits 17-31 are reserved on IPA
v4.1.  Defining masks for them here prevents the zero-mask WARN check in
reg_fmask() and reg_bit() from catching accesses to these v4.2 fields on
IPA v4.1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-qcom-ipa-s=
c8180x-v1-0-48a889acbe6b@gmail.com?part=3D2

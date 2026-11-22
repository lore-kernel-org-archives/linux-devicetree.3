Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350905;
	b=bviq5rx43pM9AumudQcou6nMIf3P/CI+qdudtmF95Exc3r0yhDUDxr33LtkoS6Tt9Ck0
	 zvdp8iy2yU2F4veJuFRHThDM0qIQCLNszpf7XasSkehjJGBsZM43/eGU5g8khcIBOFbDy
	 +zv+aaqB0/a1VcLUUcS1I4MPYSRRWW/j+baxufGBR05lky1xE7shAQ3JxNkGdV+1TH5Tm
	 Vxcbcw6UYgRWElgffKRh6QDnDYVRXAvzJMO5zz6lkzhL8OFG0aWva5CddxReOrRo3c2AL
	 MiZamanwC9+sK3BxW8i0sANIWcEm7iuRk12ZE5o0OgQSe5GCRSv3vSpDFVmaZRG1oUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e3eNoEu3oTx8Qd50/LzyhLtinvLs9bgV0WkqOeE/PDU=;
	b=dn166Nv6y1IG8sCBkoiy19YvCEbLitLbme0mnR4owwAhrwTiYhVJS1r74ePHByENFq+/
	 NYP2nBwzZDJnMPbZ5247bllmtrl2Kib5xySyFIzs/IdLb9rBTECGaFe8iShYC7YGxIY5T
	 8WbR0f5yDgnXH5Ge6a0NKD8WIYcJEoemSNrO+b9X5BNXHrZukhOjKF+54/po+HVVHcTmL
	 JhtDWakJIJ/OYhT4w8MFMVEeGetZJ68yn/+xSEGM7xjYaQGD+jD9RqVweFjhoqL+Ml2K2
	 D3lWDWAwzAF/F9ensNHu28rFjrDwf1uDfuH5QqMh3ttK7Rb+oSK+tDnfPZqSpq6sYTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWNF2x48;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B54606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWNF2x48
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169DF1F000C4;
	Sun, 22 Nov 2026 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795350905;
	bh=e3eNoEu3oTx8Qd50/LzyhLtinvLs9bgV0WkqOeE/PDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QWNF2x48wj2RXAGfOVwyoel3fYl9DsBHH/NaqcaM3TKJoooT46pbvbCOB06wMgyqW
	 eqCObFjCBjc9u46nFGJKb/KNl3Mn3xlntaR3JPTndHafRKwcbPeqR9PzyHH4l6hiY8
	 U11e4OlWWm90+QUtbaxUTQTtEKgkJ0+PoTwK5wJMBMNucCgu/hKNVDdsG4Xaq7kzIh
	 eKC6eEgHF6KOkwIoIbOeY5MtBK0Bdk5lCT1OmmeTFn8wcYgyyva0kbZbLZjySlmSX2
	 JYAJgs9Wym/RRNq3juxnSfp+97+gnTzxwpFP9wc22A1Zw25/QNjGWxLujI55vEN2fm
	 8P7fg1zhMkI+A==
Message-ID: <sashiko-outbox-227926@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] phy: apple: atc: Add initial M3 series support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261122-t8122-phy-v2-3-8d5c8fdf31ba@chaosmail.tech>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-3-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 12:35:04 +0000
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
- [High] phy: apple: atc: duplicate
  atcphy_configure_post_tunable_t8122() breaks build
--

commit 58a76d7bc11875605ca0ba4c4a3ffac99ce93776
Author: Sasha Finkelstein <k@chaosmail.tech>

phy: apple: atc: Add initial M3 series support

This commit adds initial USB and Thunderbolt PHY support for the Apple M3
(t8122) Type-C PHY.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 45f1280a6faa3..398b2be5dd116 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c

[ ... ]

> @@ -1792,18 +1929,100 @@ static int atcphy_configure(struct apple_atcphy =
*atcphy, enum atcphy_mode mode)
>  	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_CLAMP_OV,
>  	       FIELD_PREP(ACIOPHY_CFG0_RX_CLAMP_OV, 3));
>  	udelay(10);
> +}
> +
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atc=
phy, enum atcphy_mode mode)
> +{
> +	if (atcphy_modes[mode].pipehandler_state !=3D ATCPHY_PIPEHANDLER_STATE_=
USB3)
> +		return;
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
> +	udelay(10);
> +	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
> +	udelay(10);
> +	core_set32(atcphy, AUS_COMMON_SHIM_BLK_BIAS_REG, AUS_COMMON_SHIM_BLK_BI=
AS_REG_BGBIAS_OV);
> +	udelay(10);
> +}
> +
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atc=
phy, enum atcphy_mode mode)
> +{
> +	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STAT=
E_USB3 ||
> +	    (atcphy->hw->dp && atcphy_modes[mode].enable_dp_aux))
> +		atcphy_power_on_common_t8122(atcphy);
> +}

[Severity: High]
Does this second definition of atcphy_configure_post_tunable_t8122()
belong in the later commit "phy: apple: atc: Add T8122 DisplayPort
support"?

Defining atcphy_configure_post_tunable_t8122() twice, while referencing
atcphy->hw->dp and atcphy_power_on_common_t8122() before they exist,
breaks the build at this commit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-t8122-phy-=
v2-0-8d5c8fdf31ba@chaosmail.tech?part=3D3

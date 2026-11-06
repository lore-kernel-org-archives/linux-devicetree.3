Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978259;
	b=MXPtfOHo/hk2DJR8cevB4M4njDNDerc4qtEDIYsHUBgzE+q+5duvBcXjx5Ux6x9Ai/OY
	 r+E6MCGAQzU/gA/LZm0gJ4uCd/cZ48RuieiLS/BCB9TmEIZvqj91WWuI0YvTD1dchTeMf
	 HOAouulPJwt9ktshtvsp8g2L6/ozUqFHlDI1DDgT3DmpRHnr+YNfPHCSY2NK9JayYMZ+X
	 kIxUSfiet17zp2Vwudx117e7pG45MoA5zNoB2WhQGTJSb1JMgmTLsYTNdxWJNAnQc2d2q
	 q7AdlCqRoDElGAd4Zz9kYQjyCXmNNRzUwJuoVcyCWqpfPwE1+BBRwppAEOba1n4/Ojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978259;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p/nuiejwzbuNdqG1S7CYo8b06UygXGfd6lMUU+TvJvo=;
	b=t0uOSkvbHwkhFQj0439e/JoIDEh6gaPVHVkZEDCobJ84eB9FSF/xoJzbiTcSzVS9oPog
	 zJ73puRGNUijv8Rz1wGEbF4NR01WkW4NhYhv9QAnD83OeEeJGi8NlLd1oxarnjzQXjulO
	 4zmo4y5GaB/OGIFMfDh7/FJcLGq9TtWQfQzL9frmV7QqV8ia30HLjFKc2TbS77044CrRU
	 5zrBsEtBpv527Mg6oN+ZuproabmybPTXktHghZRjpbFTC92HFwMcfWkZdycxzWIhvJDer
	 UggUjXM+MFcZ03VBtMMXpjWq/wEx3U6ow7RBIn90vMV1LvRnV6wh4pRB/T7WkHya7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6rg1+C7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D6606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6rg1+C7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96AF1F0089F;
	Fri,  6 Nov 2026 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978259;
	bh=p/nuiejwzbuNdqG1S7CYo8b06UygXGfd6lMUU+TvJvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6rg1+C705WrADK4VZpmsTxg2hbdaMPKfU1OemL6+WzzquzZCMBlbCq8NvfO8CedX
	 Ey19DQPEYK0F0AE7EL7mwUz13FW9/b3vqFnhOCk6khnDIBkqN2m3LTP1JjLGRnNhti
	 vMaQ0wZlydG8wcR6QajoPGB2HHs1BjhkcR5ew8epf5jxJUlUOr3UJdLUnAflvq63/Y
	 OT7FFaJgXd40b2pO2fusQUv9yYKfUNAce1Qc8vT0x5Byw34VvDFctrm/hRQlrcQC/b
	 pNCroRqvrodiruvJRdOxmVlVjwAq+6kJYwA1Pk+xnheiTCMqsxaUKetjHI/A29xKKY
	 P/r4idWynl9ow==
Message-ID: <sashiko-outbox-201655@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/19] drm/bridge: inno-hdmi: Make the PHY
 configuration table optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-jh7110-clean-send-v7-12-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
 <CGME20261106135912eucas1p182016acc39d162adfbb9cb598ed7ca1c@eucas1p1.samsung.com>
 <20261106-jh7110-clean-send-v7-12-68f7ea9913db@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:17:38 +0000
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
- [Medium] drm/bridge: inno-hdmi: unguarded integrated-PHY writes when
  phy_configs is NULL
--

commit f1f2bae7d85c6c615ff85796724277a1cd86c36d
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Make the PHY configuration table optional

This commit makes plat_data->phy_configs optional so platforms with a
separate PHY device skip the integrated-PHY register writes in
inno_hdmi_power_up() and the table lookup in inno_hdmi_bridge_mode_valid().

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index 3219558d6ef41..84d00ee52b732 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -534,8 +534,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdm=
i,
>  			       unsigned long mpixelclock)
>  {
>  	struct inno_hdmi_phy_config *phy_config;
> -	int ret =3D inno_hdmi_find_phy_config(hdmi, mpixelclock);
> +	int ret;
> +
> +	inno_hdmi_sys_power(hdmi, false);
> +
> +	if (!hdmi->plat_data->phy_configs)
> +		goto out;

[Severity: Medium]
Should inno_hdmi_standby() and inno_hdmi_config_video_timing() also skip
the integrated-PHY register writes when hdmi->plat_data->phy_configs is
NULL?

inno_hdmi_standby() (called from inno_hdmi_init_hw() at probe and
inno_hdmi_bridge_atomic_disable() on disable) still unconditionally writes
to the same HDMI_PHY_DRIVER, HDMI_PHY_PRE_EMPHASIS, HDMI_PHY_CHG_PWR, and
HDMI_PHY_SYS_CTL registers that inno_hdmi_power_up() now skips restoring.
inno_hdmi_config_video_timing() likewise still writes to
HDMI_PHY_PRE_DIV_RATIO, HDMI_PHY_FEEDBACK_DIV_RATIO_LOW, and
HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH on modeset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-jh7110-cle=
an-send-v7-0-68f7ea9913db@samsung.com?part=3D12

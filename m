Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365F35201D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462628; cv=none; b=N85Ojwz2cwq6lyA26fqvoU0pQJ65qKJ2hGw8czsRto0TkkFzo/0cngmfOoGuzBDGuudOvb4XSxOfnM7XlsQ+1T62HyIzi9XTJUki4g40lhzrnTcaoFvNZ0JoArm3CowNND/80q7qMYAcUo3cOJJ8aDQHkgKf5Xp7KNmhIQHcfVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462628; c=relaxed/simple;
	bh=lAueQt378kI6R0A3MP+AJEYAXBeSg/MmlHpVRL3z6AQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lWIUf0JH59OEb530EL6vcrqb/xhjODZbQWoIQDZwJEpVndl6RXuzOOHUpDUfj+UWVEwXzuIDQV0u17kHhxUcvH5pQ3wa5bBg7szM7xtIR65OB2WEtMbrYmUBwZWUjuz4XCWKSZd3m86GuhPo23ZUGKRLb36NkG2O92ozxWL1bWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8bN45Sr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8bN45Sr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0451F00893;
	Tue, 15 Sep 2026 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462626;
	bh=b/1BTnO4t78KaoVq7MSnPrHktwmGY2LxhAV4pppAx5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n8bN45SrcnCz5dn8GgMBRs0IEABUj/QBx+qZIjc8RYCD9VQJAQuMhPenIw964cj1T
	 oYQ72D/iLYplaXc5HCE2N8BrQhpBaj477FSQJzcQdVUsf9YZTRXevTQdWfP2enEq5T
	 FISkmJGg4J7nzrC7rYkgud55/IDRccns5+9wdFv6C9AP/nFeF/M9vEwueX3HNEMF4d
	 7L/Tn0X5jCpw/z7bw0Zo5G8xgdOtaWoQCbHgo1Sm1OG9ElUWeU5rt418Gqo9VWUV6D
	 AXtT7qYGhwDaTGundWXFWP8eA/1N6mpQ8gGMEh7DKdf7waFt8UogWOlbfgfhfqaitm
	 mtQJY/BEwFYvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/13] drm/mediatek: mtk_dsi: Add support for MT8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915084148.11385-11-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
 <20260915084148.11385-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 08:57:05 +0000
Message-Id: <20260915085706.4C0451F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/mediatek: Incomplete initialization of DSI QoS parameters (m=
issing PREURGENT)
--

commit 2eeb791791ca07e53d5c59d273b7795e846f2238
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Add support for MT8196
   =20
Add support for the new DSI IP found in the Kompanio Ultra MT8196
SoC and its Dimensity and Genio variants.

Differently from the older DSI IPs, the one from MT8196 requires
the initialization of all of the QoS parameters and can make use
of a DSI SRAM reserved buffer (present also on older SoCs but not
mandatory on those).

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 16bf08bee38e3..6f176515e2587 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -373,6 +373,59 @@ static const u16 mtk_dsi_regs_mt8186[DSI_ADV_REG_MAX=
] =3D {
>  	[DSI_CMDQ] =3D 0xd00,
>  };
> =20
> +static const u16 mtk_dsi_regs_main_v2[DSI_MAIN_REG_MAX] =3D {
[ ... ]
> +static const u16 mtk_dsi_regs_qos_v2[DSI_QOS_REG_MAX] =3D {
> +	[DSI_QOS_BUF_CON0] =3D 0x300,
> +	[DSI_QOS_BUF_CON1] =3D 0x304,
> +	[DSI_QOS_TX_BUF_RW_TIMES] =3D 0x310,
> +	[DSI_QOS_SODI_HIGH] =3D 0x314,
> +	[DSI_QOS_SODI_LOW] =3D 0x318,
> +	[DSI_QOS_PREULTRA_HIGH] =3D 0x324,
> +	[DSI_QOS_PREULTRA_LOW] =3D 0x328,
> +	[DSI_QOS_ULTRA_HIGH] =3D 0x32c,
> +	[DSI_QOS_ULTRA_LOW] =3D 0x330,
> +	[DSI_QOS_URGENT_HIGH] =3D 0x334,
> +	[DSI_QOS_URGENT_LOW] =3D 0x338,
> +	[DSI_QOS_PREURGENT_HIGH] =3D 0x33c
> +};

[Severity: Medium]
Is the DSI_QOS_PREURGENT_LOW mapping missing from this array?

The array maps DSI_QOS_PREURGENT_HIGH but completely omits a mapping or enum
definition for DSI_QOS_PREURGENT_LOW.=20

Additionally, the commit message explicitly states that the MT8196 IP requi=
res
the initialization of all of the QoS parameters, but it appears PREURGENT
is skipped entirely.=20

When the DSI driver probes on SoCs using the new HW buffers and calls
mtk_dsi_config_hw_buffers(), it programs all other QoS thresholds (SODI,
PREULTRA, ULTRA, URGENT) but omits PREURGENT:

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_config_hw_buffers() {
    ...
	/* Write all QoS parameters: Screen On Deep Idle, (pre)Ultra, Urgent, RW t=
imes */
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_SODI_HIGH], BUF_THRESHOLD_PARAM, sodi_hi=
);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_SODI_LOW], BUF_THRESHOLD_PARAM, sodi_lo);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_PREULTRA_HIGH], BUF_THRESHOLD_PARAM, pre=
ultra_hi);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_PREULTRA_LOW], BUF_THRESHOLD_PARAM, preu=
ltra_lo);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_ULTRA_HIGH], BUF_THRESHOLD_PARAM, ultra_=
hi);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_ULTRA_LOW], BUF_THRESHOLD_PARAM, ultra_l=
o);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_URGENT_HIGH], BUF_THRESHOLD_PARAM, urgen=
t_hi);
	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_URGENT_LOW], BUF_THRESHOLD_PARAM, urgent=
_lo);
	writel(rw_times, dsi->regs + reg_qos[DSI_QOS_TX_BUF_RW_TIMES]);
    ...
}

Could omitting this parameter lead to suboptimal DSI FIFO scheduling, displ=
ay
artifacts, or underflows, since the hardware configuration is left incomple=
te?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915084148.1138=
5-1-angelogioacchino.delregno@collabora.com?part=3D10

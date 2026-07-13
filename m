Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99A343896
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937251; cv=none; b=QOFoSZlhR5c1yv5YT1Hju1zj4i7hOOb523bImF5QzFzULZxywHt36npfFuohcO4NdN2ACd5gjJ5fgbQliLkaC5wgYV5zVIRV/TJWjs/LMV0CS9l1C0pKq0Iz0ZXoBs1NcaSBch38m+Rj+G+RknJCXIgzZ4RXTHEexIql9r2hLNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937251; c=relaxed/simple;
	bh=BS1Gu/ZIU0cssSFMj/XDnOQoiU1B8MFbEia9q65aaqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G0OihwdiCwxC55fI3x6qYIe4S0/Rrs4zAzKbOGFxlxkJB/zffwSYtU+FeNWu3r+UDdopeVb0pfa79IUq4dfBwbI1cxoKlihC1fNoP7RGCNxUx+ZAoRzZEc/c7rLodCS++8sRlMsekVD8Ok9QyYOjqYKRErWCglqQkDvvgLVzZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASx7LbFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASx7LbFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607151F000E9;
	Mon, 13 Jul 2026 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783937249;
	bh=dDzfYof70ljUNHuLry4Fi5f1sDYBScDeZGbh7HflqXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASx7LbFTAYU/Tf/TIOiVh+8EccB7uWXEF8VryO9iMhmv9MYL78zXpfS11ZB7HSw7T
	 3VP9exWopeHyjvvwfmTtV6dbKfm32NsykQk76g7l7+M9qC5FaFN0zobdKlu2tzd2XP
	 aAkDETzzlCznUAmwpAIXGl7PWgvT4yrs+0UPySYHcAAc2v6y80Cu73f6PBZL5+VyDw
	 CZj5+2vRsiRVDAp1tWHOzZyIHppMGD50JKa9QYCUyqgnX3N+Uq1FFU8NDG/hFbzI9G
	 n2PK3MscrCDeZ2ROAoHtp+S7bQS8nXNVxvG4++uLRNAH5iIblQRn3nETYvTJe0TyY1
	 tje1ovhXP9VUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/10] drm/mediatek: mtk_dsi: Transfer register
 offsets to per-SoC const
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713095837.16590-6-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
 <20260713095837.16590-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:07:28 +0000
Message-Id: <20260713100729.607151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The loop reading DSI RX data in `mtk_dsi_host_transfer` incorrectl=
y uses the loop counter to offset the `reg_main` array index instead of the=
 MMIO base offset, causing out-of-bounds array reads and accessing incorrec=
t hardware registers.
--

--- Patch [5]: [PATCH v2 05/10] drm/mediatek: mtk_dsi: Transfer register of=
fsets to per-SoC const ---
commit 43b878ef0a8fe56d80e1c26ea5be280083d3ccaf
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Transfer register offsets to per-SoC const

This patch refactors the MediaTek DSI driver by moving register offsets
into per-SoC constant arrays. This separates the main DSI registers from the
advanced and SoC-specific ones, preparing the driver for newer hardware
generations with different register layouts.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 284dae372c7c2..6a77ce8eea91f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -1259,7 +1394,8 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>  	}
> =20
>  	for (i =3D 0; i < 16; i++)
> -		*(read_data + i) =3D readb(dsi->regs + DSI_RX_DATA0 + i);
> +		*(read_data + i) =3D readb(dsi->regs +
> +					 dsi->driver_data->reg_main[DSI_RX_DATA0 + i]);

[Severity: High]
Does this code read out of bounds on the reg_main array?

The original code added i to the DSI_RX_DATA0 offset to read consecutive by=
tes.
In the new code, DSI_RX_DATA0 is an enum value (17). When adding i (which g=
oes
up to 15) to DSI_RX_DATA0 inside the index, this accesses reg_main up to in=
dex
32, but DSI_MAIN_REG_MAX is only 28.

This means for i >=3D 4, the code will fetch unrelated register offsets (su=
ch as
DSI_RACK or DSI_PHY_LCCON) instead of the expected RX data bytes. For i >=
=3D 11,
it reads past the end of the reg_main array, which could cause MMIO reads at
unexpected addresses.

Should the loop counter i be added after the array lookup instead, such as
dsi->driver_data->reg_main[DSI_RX_DATA0] + i?

> =20
>  	recv_cnt =3D mtk_dsi_recv_cnt(read_data[0], read_data);
> =20
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713095837.1659=
0-1-angelogioacchino.delregno@collabora.com?part=3D5

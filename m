Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD642C15BE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388167; cv=none; b=u4x/TBcg23YCEppdG9lYE8LJAUqAMI8UqDYzBS+ELKTn9xw13Sgsc9a6KFopRhN8BPAndao7DG4bM/ELruf2SaQBfDKzUS8GdtBWBjMWc4mCnZlDft5a2hRF++sWa5n57GvHFHps5qyROtSMqA4D9CiI+wvlczppDp0c4F7Zo5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388167; c=relaxed/simple;
	bh=wSpzwBigUXcBmhStRiKIe5UCX/SlnEtz1biM5fxc3qc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VnygP/a/p4BBpWIFhXgq8K2IUD5tzVGIO/DjmxiaqBggh/vBnIg1dydHuiZgQyZijMd9dk9q7++0Xuk/akRSrP8qjbdZjNiCkvcwYV3hKl82ifMrFUFNi0ItYuGutRkT0KH0A2qXA+JJPuTt/568uCtd9mDAExC9w9jqBPtve7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APFa41OP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APFa41OP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528941F000FF;
	Mon, 14 Sep 2026 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388165;
	bh=G9j8P16ohM1dtXdGttVWFduSxmI/IRnk9KK7+T7DMvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APFa41OPauSGU1+OyFwp4i9Ti0M3TdOiJ2Owl69DwPA2TEXR3SC00KJs1lkL4yAiP
	 yppwx8iyM7bqIe5LNcsm/x2R7wwLMUKruEmwOx5JsemcJOHwMEvvDZDT/nftjkEX+1
	 RE3jQ0zBYWqA+USn3vdiKT+qfXXKNqz7xCwChQ3V2uZP2k72tTUg1eXetey03OIChY
	 M1G5e1BEmVxez6fY6kDH8cB0438mGo2BXaapMEbUbPbfvSUw9JSEqrD6GuBlt7rNSh
	 mXt39isQhkCAYwZ0x9hPVvmMhRH1o9gx6gQ1Lt/y5+baqrotgBNcbtSNRVK7RXVsgG
	 jYTNW5Boy99Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/13] drm/mediatek: mtk_dsi: Move max link rate
 parameter to platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914115812.22751-8-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
 <20260914115812.22751-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 12:16:04 +0000
Message-Id: <20260914121605.528941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] mtk_dsi_bridge_atomic_pre_enable ignores mtk_dsi_poweron failure a=
nd accesses registers without clocks.
--

commit 5b6418994a183b2b2cc5727632b7cacb276f50a5
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Move max link rate parameter to platform data

This commit moves the max link rate configuration to SoC-specific platform
data to support newer MediaTek IPs capable of up to 2.5Gbps. It also updates
the data rate calculation to prevent integer overflows at higher clocks.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index fa0f404bc7add..6e92e4e1586f7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -921,7 +923,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	}
>  	bit_per_pixel =3D ret;
> =20
> -	dsi->data_rate =3D DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> +	dsi->data_rate =3D DIV_ROUND_UP_ULL((u64)dsi->vm.pixelclock * bit_per_p=
ixel,
>  					  dsi->lanes);
> =20
>  	ret =3D clk_set_rate(dsi->hs_clk, dsi->data_rate);

[Severity: High]
This is a pre-existing issue, but does mtk_dsi_bridge_atomic_pre_enable()
safely handle failures from mtk_dsi_poweron()?

If mtk_dsi_poweron() fails (for example, if clk_set_rate() fails here, or if
phy_power_on() fails later), it rolls back the clock state and returns a
negative error.

However, the caller in drivers/gpu/drm/mediatek/mtk_dsi.c:

mtk_dsi_bridge_atomic_pre_enable() {
    ...
    ret =3D mtk_dsi_poweron(dsi);
    if (ret < 0)
        drm_err(drm, "failed to power on dsi\n");

    mtk_dsi_lane_ready(dsi);
    ...
}

logs the error but continues execution instead of returning early. It then
immediately calls mtk_dsi_lane_ready(), which attempts to access DSI hardwa=
re
registers (such as DSI_TXRX_CTRL) while the DSI clocks are disabled.

Could this trigger an AXI bus timeout and cause a hard system hang when the
unclocked register access occurs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914115812.2275=
1-1-angelogioacchino.delregno@collabora.com?part=3D7

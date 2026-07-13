Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A438417367
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948051; cv=none; b=eB8gNbLT8RxhkixRSSWqMGemouh5BDPTKOgka5dADNoRiuj2NIB0vc119Ab0phYXAv95JrGf+CLBqaH6LSakICW/hrK7qETRFd5MggOm4JCl4r4U6zSjkY3bxEzZaGQvN3mlWa+psMTsIXLeV1xofWWQsiA244uid01ee2RSwDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948051; c=relaxed/simple;
	bh=UXxqxubCtF5hqJO6MSHLK8ybhX7EAsSI6/StM2xsfQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iCMoUjKbt3v3iqmjduo7WNBEagfLu+kXqLYvcgnetbP+Q0jGDLEVMTjU1Lnl+x3KWu+Ql7u1mN2S1XwKCqT+29YaCz3ZMslWwwZBiTFfWqHUg9HhfKRyMVvVMqf4CxFMm4uaGQJ2OIkKT+q+lElytugHCbe316V6shRpqyVonqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol29E5aG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol29E5aG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44A91F00A3D;
	Mon, 13 Jul 2026 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948050;
	bh=UTOfQVyoSaNNp8kRqF4v3J1WE1kp20ix5FCDOhfJqwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ol29E5aGJPfkNvdI3Pm9yb0e27XtygfR1YxGb7ek7ddLug+PJwWBuDBF8oemwoHsP
	 +RVSIkF0Oq4OSTXxUK1HViYGFLXAQKwyy+dMflW5/ru9JKr1f/PkCq9uhUkGjZ0lbi
	 dNuSQYHhdQZu96yvZFTpSAMZ4OFKnVhKtKHCeEPB6jAoe49ym0cACAjt6ObaLi1fgO
	 5Eyy5IhLarCDM472BttHf+uwUiGenzVOuQR1a+/gT5EKrtZXyG9MbLvawUxFvZf2nm
	 hg2YPXgW21EDfM7PYxmHIO1E7pUdJ37iLzKFTxi020YaK42DLyPKyutUP7sJyBd677
	 Qudyp4+tSvueQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] drm/mediatek: mtk_dsi: Transfer register
 offsets to per-SoC const
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260713130103.34654-6-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
 <20260713130103.34654-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:07:29 +0000
Message-Id: <20260713130729.B44A91F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] In `mtk_dsi_host_transfer()`, reading from DSI RX data registers i=
ncorrectly adds the byte offset `i` to the `reg_main` enum array index rath=
er than the resolved register address, causing out-of-bounds array reads an=
d invalid MMIO access.
--

--- Patch [5]: [PATCH v3 05/10] drm/mediatek: mtk_dsi: Transfer register of=
fsets to per-SoC const ---
commit a32b9a7c67e660488b31bdcea6dd9055c83b92eb
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Transfer register offsets to per-SoC const

This commit transfers DSI register offsets to two const arrays to support n=
ewer
generation DSI IPs with different register offsets. It separates DSI IP
version-specific registers from SoC-specific ones.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index bdb9ea2e7b6f6..4d5cb91c788f6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c

[ ... ]

> @@ -1297,7 +1432,8 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>  	}
> =20
>  	for (i =3D 0; i < 16; i++)
> -		*(read_data + i) =3D readb(dsi->regs + DSI_RX_DATA0 + i);
> +		*(read_data + i) =3D readb(dsi->regs +
> +					 dsi->driver_data->reg_main[DSI_RX_DATA0 + i]);

[Severity: High]
Does this code perform an out-of-bounds array read?=20

Since DSI_RX_DATA0 is 17 and DSI_MAIN_REG_MAX is 28, the loop will read pas=
t=20
the end of the reg_main array when i >=3D 11. Even for smaller values of i,=
 this=20
will fetch the base offsets of unrelated registers (like DSI_RX_DATA1,=20
DSI_RACK, and DSI_PHY_LCCON) instead of consecutive bytes of the RX payload.

Should the byte offset i be added outside the array subscript instead, like
dsi->driver_data->reg_main[DSI_RX_DATA0] + i?

> =20
>  	recv_cnt =3D mtk_dsi_recv_cnt(read_data[0], read_data);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713130103.3465=
4-1-angelogioacchino.delregno@collabora.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30287314D1F
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991432; cv=none; b=DDg4KDzNFhaMdWkx+SULqE69t/3a/kLQWEjYo0kNgAjlt1GSfndSnxHHJmdKQ81nuqPhs8NhVRcGT8VDDY+uhM1aFZIOCGYG3dZQilpTuD3sdpFea1pzPlN6JnqPbf6h+LlLbI5n7z2rGjK09jUus3YDOoR2xUfQp3X78QS8y9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991432; c=relaxed/simple;
	bh=WDUooRQR9Ss2vkdVSiPyyTYc3b6l5LPuWnkY82GXnAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M3Lh9WxKZG7MFQhy4TXuPXw/DVqfYRyCXr4bwgQmlpnrpc+CvYdiI9yeQY/pQXD7CSOPUX+ZWkIV9wUBEzr0PoAgfOp2EcPxYpqGLUbVGq+6DPX82CVu88Up+WHTEuvFY/yPfPu7yHJmcCGkxq2wZGlVTvz/2Zqv2xqXhACivwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw8aYA0n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw8aYA0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFDF1F000FF;
	Mon, 21 Sep 2026 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991430;
	bh=uMNo+W7eeEQLJwnzZvEaZJQy4yg6U6SXNwHqFT59FwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fw8aYA0n1E5v3ptknTslf1AyKASp5wZ8YYfPLWx5d882fOQ+AxzOtHzkHmxpJv2np
	 uHvvPz6jWle47KWaIWzd60ftnVZgXUP8JU+l5B14M0AyAdrtE2by1Qjkk9tiloiKzH
	 EQBMY8mD+qMid0k1khc/H1Yty+djap4ziGip617OEtTlDP8MayXshq7zCQLbt0v34i
	 CoajZQnqNp7gplOzqOM5EtmA8PX9dywKIE8T3KTYKc2qSydIG6/W8YilCVeFFFYpB4
	 nT7XpH5mNxFklfybtX9lTHk5NaI20QTaAvs4NjuauDnVtHeBhXFePQPQ3ujVysU0jZ
	 gJIGfZpIQFsmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] soc: mediatek: mt8167-mmsys: add routes for all
 display paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260921113914.779393-4-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 11:50:29 +0000
Message-Id: <20260921115030.2DFDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mmsys: concurrent MOUT outputs broken by full bitmasks
--

commit 8ae801c4ff167fb410aace262b9f0eef4667f2c9
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>

soc: mediatek: mt8167-mmsys: add routes for all display paths

This commit adds support for additional routes according to the SoC data
sheet and Android sources. It redefines existing routing table entries to
use full masks and adds new concurrent display output configurations.

> diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/m=
t8167-mmsys.h
> index 001379373507a..7da81b6688715 100644
> --- a/drivers/soc/mediatek/mt8167-mmsys.h
> +++ b/drivers/soc/mediatek/mt8167-mmsys.h

[ ... ]

> @@ -34,16 +78,162 @@
> =20
>  static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] =3D {
> +	/* OVL0<->COLOR0 */
>  	MMSYS_ROUTE(OVL, 0, COLOR, 0,
> -		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
> -		    OVL0_MOUT_EN_COLOR0),
> +		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
> +		    MT8167_OVL0_MOUT_EN_COLOR0),

[Severity: High]
Does changing this mask to the full MT8167_OVL0_MOUT_EN_MASK inadvertently
introduce a regression for concurrent multi-output pipelines?

Looking at mtk_mmsys_ddp_disconnect(), it performs a read-modify-write
operation on the register using (tmp & ~mask) | (val & mask). When
disconnecting a route, val is 0, so the register is masked with ~mask.

By using the full bitfield mask instead of the individual bit mask, does
disconnecting one route clear the enable bits for all other active
concurrent paths originating from the same block?

> +	MMSYS_ROUTE(OVL, 0, COLOR, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MA=
SK,
> +		    MT8167_COLOR0_SEL_IN_OVL0),
> +
> +	/* OVL0<->WDMA0 */
> +	MMSYS_ROUTE(OVL, 0, WDMA, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
> +		    MT8167_OVL0_MOUT_EN_WDMA0),

[Severity: High]
For example, if the OVL0-to-WDMA0 route is active alongside OVL0-to-COLOR0,
does disconnecting WDMA0 here clear the active OVL0-to-COLOR0 routing
bits as well because of the shared MT8167_OVL0_MOUT_EN_MASK mask?

[ ... ]

> +	/* DITHER<->UFOE */
> +	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_=
MASK,
> +		    MT8167_DITHER_MOUT_EN_UFOE),

[Severity: High]
Similarly, does using the full MT8167_DITHER_MOUT_EN_MASK here cause the
disconnect of the DITHER-to-UFOE route to accidentally break concurrent
routing to RDMA0 and WDMA0?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921113914.7793=
93-1-l.scorcia@gmail.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2E51DAE5
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754643; cv=none; b=CJX/j7HlVkwFLotIYsBB+yfpFyCX9j+eUwznjgSVNQcfZY0fLgwxkS4UUEei1Ui05+BMZWbJGZG4oVjkIYGQV+bCHBiXSl7UBxhY+ghWFE9458LLUZ8w+CKJWI0M928ZuxGIl6s4ZsUgex6Dlw53HWe5PCTS6tfrgat6vm62gcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754643; c=relaxed/simple;
	bh=2JBs3gZjKBjiG4M8/behSVC3couDOcgrbVtbCahVAuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SujazE6G5Hagdquvq+n1d24oUMpdgcaiAFBN5mKRvx2FQdF3wBrNLpfjL3EuNwnTm5WRD7rlVhT7oGOqRHSj9NChECq5g2K3mhzvyph6f2YAT/RN7/s4htF2DSBLigi7/5125fPK99dYloMaJXOsuULex1KtMo47IHx9c4dLSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9fjjik/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9fjjik/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A1D1F000FF;
	Fri, 18 Sep 2026 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754638;
	bh=s+x1IPk3AWyvH4YHoX99jdBITFypxN8koV2wYdoKFu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m9fjjik/RQVQTb4VApNZjH3ZHN0l4oepG0HSW8d+1bctKusXy92Wa9c7XWU1qVzZV
	 DaApvebw3vE1ko7NCkPr8UVjbzXrhmCo5CjGZIeb2I4/AONnl3LQ6O3o/WFWDBAk/K
	 EXmdXX1FHaChMJa6pUiuz+w+S+aNEr+Ps8L9VgIQAELfJz9rtjiB/gmiJkWUFCS7QS
	 WMDHltUA/Hi+kp0xlYfOP1f3vSm96DM1eNyWRCSaYBjL+P2zuIxyfVpCcj9bZ0nWCh
	 /HGhsr4NJN10eTDoWGFNSm+rF7UY/C7A/2CXiAgONNViDCTCZalf5wWgmp+A9W/70L
	 IigREl+heJFUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all
 display paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260918175736.355305-4-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
 <20260918175736.355305-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 18:03:58 +0000
Message-Id: <20260918180358.81A1D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mmsys: incorrect register for OVL0 to WDMA0 routing
- [High] mmsys: missing SEL_IN routes for DITHER to UFOE and WDMA0
- [High] mmsys: incorrect tuple for RDMA1 to DSI0 SEL_IN routing
--

commit 2f4bc4d4c245498df33e07567c376707ba880cbe
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: soc: mediatek: mt8167-mmsys: add routes for all display paths

The commit adds support for additional routes in the mt8167 display output
pipeline, aligning with the SoC data sheet and Android sources.

> diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/m=
t8167-mmsys.h
> index 001379373507a..aab1774152c57 100644
> --- a/drivers/soc/mediatek/mt8167-mmsys.h
> +++ b/drivers/soc/mediatek/mt8167-mmsys.h

[ ... ]

>  static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] =3D {
> +	/* OVL0<->COLOR0 */
>  	MMSYS_ROUTE(OVL, 0, COLOR, 0,
> -		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
> -		    OVL0_MOUT_EN_COLOR0),
> +		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
> +		    MT8167_OVL0_MOUT_EN_COLOR0),
> +	MMSYS_ROUTE(OVL, 0, COLOR, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MA=
SK,
> +		    MT8167_COLOR0_SEL_IN_OVL0),
> +
> +	/* OVL0<->WDMA0 */
> +	MMSYS_ROUTE(OVL, 0, WDMA, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
> +		    MT8167_OVL0_MOUT_EN_WDMA0),
> +	MMSYS_ROUTE(OVL, 0, WDMA, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MA=
SK,
> +		    MT8167_WDMA0_SEL_IN_OVL0),

[Severity: High]
Does this route mistakenly use MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN
instead of MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN?

By targeting the COLOR0 input selection register, this configuration might
corrupt COLOR0's input selection and fail to properly configure WDMA0's inp=
ut
selection when establishing a route between OVL0 and WDMA0.

> +
> +	/* DITHER0 outputs */
>  	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
>  		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_=
MASK,
>  		    MT8167_DITHER_MOUT_EN_RDMA0),
> -	MMSYS_ROUTE(OVL, 0, COLOR, 0,
> -		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
> -		    COLOR0_SEL_IN_OVL0),
> -	MMSYS_ROUTE(RDMA, 0, DSI, 0,
> +	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_=
MASK,
> +		    MT8167_DITHER_MOUT_EN_UFOE),
> +	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_=
MASK,
> +		    MT8167_DITHER_MOUT_EN_WDMA0),

[Severity: High]
Are there missing SEL_IN routes for DITHER to UFOE and WDMA0 here?

The patch defines MT8167_UFOE_SEL_IN_DITHER and MT8167_WDMA0_SEL_IN_DITHER
constants and sets up the source output (MOUT_EN) routes above, but appears=
 to
omit the MMSYS_ROUTE entries to configure the destination input multiplexer=
s.
Without these, UFOE and WDMA0 might not switch their inputs to accept DITHE=
R0.

[ ... ]

> +	/* RDMA1<->DSI0 */
> +	MMSYS_ROUTE(RDMA, 1, DSI, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_M=
ASK,
> +		    MT8167_RDMA1_SOUT_DSI0),
> +	MMSYS_ROUTE(RDMA, 1, DPI, 0,
> +		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
> +		    MT8167_DPI0_SEL_IN_RDMA1),

[Severity: High]
Should this tuple be (RDMA, 1, DSI, 0) instead of (RDMA, 1, DPI, 0)?

Because the destination is specified as DPI instead of DSI, this route
appears to be applied at the wrong time (when routing to DPI0) and missed
when routing to DSI0. This could leave the RDMA1 to DSI0 route unconfigured
and mistakenly corrupt the DSI0 input selection register when routing to DP=
I0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918175736.3553=
05-1-l.scorcia@gmail.com?part=3D3

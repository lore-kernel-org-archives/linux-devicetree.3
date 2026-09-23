Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50E43DA3C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147376; cv=none; b=H18eub9CskwoDjra9FNW11PhhbRmP7nAS7XHPA+B+vyQ9m5/c+I5B6ME9is+LnsY02o3hqo8cjpPDQswrnmp1IeHgn9FGtd0iDHDgXsUAQsywHl8DZlys9NsNz/3KTQQn2hoX5Svvm0snPD55WD0ggq1/eNjQIebwwtc9NkoWs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147376; c=relaxed/simple;
	bh=Rl5L1ZY9XmSnnsjctz/ZJncqAyzJ620lTI/YqgOXQvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VIn1yUeSHgA6TZeukaEXXI0cyOD7ztZMdmWzMAha+iHHDlF9C6jRTYnvqhZt+8zRlQxrQXTSubhIwExX993CQ2e3Ifw2vlsCv9GP0C2e1yh2/aOpM2JifH3AQ2G6P+Ggp8QJNhbJPomfX6Psdkkf8V2jKziknMOtEqKC2Hq1J4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvAZ87Mf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvAZ87Mf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE3E1F000FF;
	Wed, 23 Sep 2026 07:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147370;
	bh=7s0aNz3ugd9AHWUSgJthdieQ8CGDS2UokSpx1oU+KsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EvAZ87MfsawVMMX9eNYFbA7u9DZSlG8Rmi6Y3Z2mUC7WPFblZuV+tLs5s89UIiqDC
	 7xvdsxFzKjwhLVRGRR5BxwpjZFCG0VyqMfngewgh3UFTN8r0P7XvTj9rVcyxkA/xEd
	 ltGVVnISbzKPjI5rZMqDTcgYGffRaB/xmbMvK0JoKOnCv9BQsm36EzzpNA3gxfVwJ3
	 qolSxDhoTeZVJS7f+jB1ptcJioI7+jfQo2Qqkce6rRb0O49rvul9Hnl2pfQLLad6nH
	 /HM+107VmCAQC5T4Jj6CL+z1bVJLduPL5CarcxhFizH9b65ceR5MD2wwSbB9BsjdyZ
	 lsmKfL0w+qpFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/10] ASoC: qcom: Add Shikra QAIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-9-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-9-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:09:29 +0000
Message-Id: <20260923070929.CFE3E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Logic error in shikra_qaif_get_dma_idx due to contiguous DAI ID =
assumption
- [Low] Build failure due to undefined AIF_* constants
--

commit 8d479b4be68dbcc2201e8313200c13e70d03bca1
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add Shikra QAIF support

Add the Shikra variant data for the Qualcomm Audio Interface driver so
the common QAIF code can bind to the Shikra QAIF device and expose the
SoC-specific DAIs. This commit provides the Shikra DMA-to-DAI mappings,
layout, clock names, DAI driver data, and PM hooks required by QAIF.

> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 0000000000000..0d5c2baade28f
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
> @@ -0,0 +1,447 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> + */
> +
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include "qaif.h"
> +
> +static const struct qaif_dmaidx_dai_map shikra_mi2s_dma_dai_map[] =3D {
> +	{ AIF_MI2S_RX_0, QAIF_DMA_IDX0 },

[Severity: Low]
Are the AIF_MI2S_RX_0, AIF_TDM_RX_0, and similar constants defined anywhere
in the kernel tree?

It appears their definitions might be missing, which could cause an immedia=
te
compilation failure when building this newly added file.

[ ... ]

> +static int shikra_qaif_get_dma_idx(unsigned int dai_id)
> +{
> +	const struct qaif_dmaidx_dai_map *map;
> +	int i, size;
> +
> +	if (dai_id >=3D AIF_MI2S_RX_0 && dai_id <=3D AIF_MI2S_TX_12) {

[Severity: Medium]
Could this condition incorrectly classify non-MI2S ports if they fall
between the RX and TX ranges?

This logic assumes that AIF_MI2S_RX_0 through AIF_MI2S_TX_12 form a
contiguous block of IDs. However, in the shared header,
qaif_is_aif_mi2s_port() treats the RX and TX ranges as distinct:

sound/soc/qcom/qaif.h:qaif_is_aif_mi2s_port() {
    ...
    return (dai_id >=3D AIF_MI2S_RX_0 && dai_id <=3D AIF_MI2S_RX_12) ||
           (dai_id >=3D AIF_MI2S_TX_0 && dai_id <=3D AIF_MI2S_TX_12);
}

If the underlying enum places other IDs (such as TDM ports) in between
the MI2S RX and TX ranges, this function could misclassify them as MI2S
ports, fail to find them in shikra_mi2s_dma_dai_map, and return -EINVAL.

> +		map =3D shikra_mi2s_dma_dai_map;
> +		size =3D ARRAY_SIZE(shikra_mi2s_dma_dai_map);
> +	} else if (dai_id >=3D AIF_TDM_RX_0 && dai_id <=3D AIF_TDM_TX_12) {
> +		map =3D shikra_tdm_dma_dai_map;
> +		size =3D ARRAY_SIZE(shikra_tdm_dma_dai_map);
> +	} else {
> +		map =3D shikra_cif_dma_dai_map;
> +		size =3D ARRAY_SIZE(shikra_cif_dma_dai_map);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D9

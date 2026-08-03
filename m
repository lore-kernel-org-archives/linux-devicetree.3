Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24364137A7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770195; cv=none; b=Y+EBeCc9RszOImyHhrySve/oc20qdLpZJj6VvmoYMz/+VfAtquwkRQPZFP7sUabQh5VOuVKkr2rMhp6KNBKebQ7/XG5yZdxuHQu4BEw2cKm7se5KB4w5YmrEAE5uGUVsqeLN4hDARIV+qr7Y3HG8ZSjZxfjHUpKEpXAmWAQSAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770195; c=relaxed/simple;
	bh=ryf0iFj9gPEiTE5nfUzCyEHn3MXXGaHhAdPI4KW+ekw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3Z4UVdom3sLWJak8e/XpKBE8sLg1A+8u+CC5f2dTWc8Ei3f34/n3dxar4eDDZPX7VxurHoVnNDqZyIGxgx0HBNtTBY2UAlV0MzYE3WbxnbPX6GbnPgnZY9NYyZrzsjniqVIx04MANP1KUr+JaIx8BIs/AfgijTsq8qTBUDZNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbaSTxzd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZtt2opa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbaSTxzd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZtt2opa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
	b=hbaSTxzdlWASIJspFjEf8/p0QAN1NRb6vYuRv6ZFAIwZ8T2bKgNu1eCGywGn46XbR6qNUP
	Yu7+yG2eUU+rrWhv7Jw9lJTn5Eb/UFCpeCq3SX/SjA0N4FihUnSRf3RDBzfcdJzCZRda1k
	V2V3Pg/L5WMKVxH+4H6tVRw4GGrHmQ8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-MNd70zMCPWe5GrSSLXPkNQ-1; Mon, 03 Aug 2026 11:16:21 -0400
X-MC-Unique: MNd70zMCPWe5GrSSLXPkNQ-1
X-Mimecast-MFC-AGG-ID: MNd70zMCPWe5GrSSLXPkNQ_1785770181
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81ebb5e11caso115622727b3.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 08:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770181; x=1786374981; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
        b=KZtt2opatfhOSIyPOnGfeaReriyRNyORmuT8wr1465Qr1+duKTiEhgBvZrhoi+tfYW
         laDzro0cwH226DWaxvLYxrXyKjuHtim0UylC98fDfWtPotJ7OJ/CKhdYu5nhi9F7xfzN
         J7ZBRnMdRoZe4XhzU635CbPuFESDoaKcNVdxiOH/GeXk7EV6AKl6RRuC9yXAnVS5gmQ3
         IryMvIjxa40Ik+WW0s0XF38qmB0rebnuFG1TEEo5wF22WRaFlHG3CNz4l+Le8HeM+yfw
         kXAqww5HL0YZbS5eD8cY/AlESnNnTPWaBSbRw84u2gxlEcwZu6woOhZVMGCq2SR0VyB6
         CRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770181; x=1786374981;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
        b=NdY0jtu4RA3Qxc2XoW21i9ti/6Zsc4vUb9k3IPHh3OUvob+1kMOrR1L7+2q5fKuKKm
         dREoetvgLVQA+j7Q7q566pGS21K6aDzhU3xRsmiCYXNz78T9jG9wbu/tf6DZmKXMhp6A
         2YEfIz7CAg0chf42xfjDkG2nZ4xpM6td/NFYw84WTr8TM9U/YSKkgyDVwdYozw6iL+Kt
         aFbSnVOkIH6e9DMID4mCNGIGqEb507vMcCgO47YUOO9o/dchCkqxv188rjTcWPpQR2ii
         5gb/xWD9j1RsAydojfx1t1HHcWDcQWBAFIc+WcMTvCitX6JhwS1TCquNVlKTnu23j6/9
         iS1w==
X-Forwarded-Encrypted: i=1; AHgh+Rooqa0dnguJk1dPHLGhPnCypxHCTExi/HqaHjw+5iUfQG5dXZGEQTYD/EtGVEluEKDb1rJxHIY/+gqT@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVhzwfLPNKKG1u1+1c7VkluDe/bjNXDpXF2wXGYuQ5V8gYeyA
	r3wAwVtiihtsbLKy9u1pNODlLq+252DR3Y7bMHQtXk51oeFgqRTOWwXwnVqoBd2fYVAuv1qGXTW
	1HzgQTJw9YFKUrm01GD7JuYG6d0zp+BP2htLcpKWl8+YzcHOdLYxm1CtwXSYebJQ=
X-Gm-Gg: AR+sD10E8+FxxTd8bTik03zsQp4+vn6HgtF8CI8d5lLXbX6BeafrWeY/6rC6P61bng7
	4+1SeRJISH/viGdSK076Cqm4dk7C2l+meagCZ1+4bSo2khh4GvYWhHKpLGo1O+IDp61xp5Z2A32
	kkm362uq5nwWunl42q3QqFC8lVFNqYwViEFFoBVz9r/V9tRQqPOUP5dATGcRo+0gb2/tqnmSbo0
	+NfpKBfx0Ec8k451aBc5fZjsjaOEIav6RqW0aCUYmU4FKezXVSv2T2B84xXU/AMjV8PW8alPzo6
	5UQrbx+qON+E882AjBzddPzaN+ug3E+xJOSB3d8zX6vlnY/lbfoDvhu3bsaaAbceMIQm1gYEwrh
	vOF73YeGXl1ysY2SbimnSK1BPgxsT3xxCXe0=
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326947b3.11.1785770180469;
        Mon, 03 Aug 2026 08:16:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326267b3.11.1785770179868;
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm56520997b3.39.2026.08.03.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:16:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 17/25] clk: mediatek: Add MT8189 topckgen clock support
Message-ID: <anCwwMRMYex2_eSN@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:03PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8189-topckgen.c | 1025 ++++++++++++++++++++++++++++
>  2 files changed, 1026 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 66577ccb9b93..9d3d2983bfb2 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 000000000000..f25c0711512c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> @@ -0,0 +1,1025 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Are these two headers needed?

> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

And this one?

Brian


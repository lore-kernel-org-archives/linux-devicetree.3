Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB95412BF0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770249; cv=none; b=hT4iuLjKjOhqaYHDXlKhmGQF8Evii5Vt4iXvf/wV/HUfsCiKRnWgWbGT9XQcZig9ki84TsWQS2vpORU/Ix6AQgJ7apOK6NWkHyUBnKbY+g53PGGlnrYF0yHPQyVrLb13mdqgnHvv/p1qzszf+KRUFpQNTjGerhSdeiZwAY+sEYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770249; c=relaxed/simple;
	bh=Tg2c5hSCmf4R8GHhniWyNjrjuYL6rS8mvKvO0Rjnhuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnzRP59H5RAQS0m3KR4o7FY+dxOtHdRXYT+x62qhChMH39VRqQQHH0m1MTICxoeFRxsRA6wumHCiPHXyClBZ+xNacg4mBzGvjUBvUNGTcPWgolmqPcvw6HGadIV003V7KhSktpxRTJ86uFCHNT6IOqnlTnXoS7+JVYKAN4pQbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zz4SWlT/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mXU3yDj8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zz4SWlT/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mXU3yDj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
	b=Zz4SWlT/Ho4Ro80EfMM4dWEGc0lLq3zukxv/YKRmvp+3sAoZ4LE/Nyb3zEd29BJnLZz5Bz
	vlh9+PXYkzFQQzmHQf/nAZpH0iH/GiLhdTCDvuep6uHJgPB9MqIZGlZRybSxW2bODA19RY
	+vnftvrkM5QMdSa+xkEr82IT/CMs/GM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-XulfJc5WOcGFGLom-8HhRg-1; Mon, 03 Aug 2026 11:17:19 -0400
X-MC-Unique: XulfJc5WOcGFGLom-8HhRg-1
X-Mimecast-MFC-AGG-ID: XulfJc5WOcGFGLom-8HhRg_1785770238
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81ec0eb032aso115993907b3.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770238; x=1786375038; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
        b=mXU3yDj8sgvW1Lz2y0uH3xGhrctJRqqPSLaZfb+GkguOPtEFs6GQWVeKOOyxzcZqnt
         wsSSxVcw595yPKu/cwJNHNrLr/9aScc4zZDOoalXviSj/zq0U7yvUg2jXeuRF/weLKSD
         II3tFVp9zhZs8eKOw8Xm5zfTG5yJoqIfCJTrkBv6oVAMJcTDsTDxaGvYsEKsJVh8ixKa
         +GNiv1yKmGPTdnICLq+Wt4fwPb/NJA0uNt6ntqQYfU2v2b571lRE9hlNbuTPtkbjxiTr
         r34uvbKP1F9WitGVan/aCGoJwLgpYKxbaJ9FFJRlAa6c5SC/ciLtuFau26pLhH8x0R0c
         l0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770238; x=1786375038;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
        b=aRIdsdOyzflIwx8LHKfT5JQf3rKJv2i5M3cPUslJbiXSBfxalAaa0NCAkQueMb6Vr1
         dxt5CZWFOuGy+pjDvcsIdgOMehkx5KtvM2aChWPxpbNZ/10JFzcO5m1zGCUa3odoxQzZ
         C5AHH7XuVRGJdLJM+aHvsJ/odZe+qPfHAMBftoAkukHlMbba71T8kU0C/EoVL0Ar3xv2
         ryC7n6GB9IlobDgVanCWQLi6IWBYQWhTEdk5l9t7ypXs8Eir61X5U27F/QLutetnWT3U
         smbliRl1Qto1OpJIKyKvqw0ZrzYcfkafK1b8LqkkSOcyoqT2mYfBsgaTPRHE77WHi3vD
         /Y7w==
X-Forwarded-Encrypted: i=1; AHgh+RpB4I90Hok+9LJHy7dxfLC0GBNgt2eAmnub4Pxd+fa8h6w98nwwmCZ1UWUD4OPe0CUNqA6HZmUu89Ot@vger.kernel.org
X-Gm-Message-State: AOJu0Yx56sCoSdaXUN1jeCS6z5kzG/kHlYIit/nncHaWs/+6CDoA6UqJ
	02siA7fVvv+A0XT1+umFmyDqE0VWEHpwJG8vf7dzylR8m/tSAWf/P+Fhxb017kpLg4TZVoM07Vd
	1HjJHH4phPFuxhnfRIL1I2o0mYN74Cnfrs/xktLXfJoLU1Ic0A5FubgcAFNNwJZI=
X-Gm-Gg: AR+sD11v/VhGUoT1EB2myfKXo5Ew6TV/rwCHGtxL9ZLLFaLgb2TOVJu3F6v2319AfyK
	phB7ohfSwEyJBVNdsVX9ERJ79/lRpV2FtSOVD7rhLAC8TZ+vGJ4LVgQawDb6yA+WKrPXbxqPSB1
	Fvj0TifSHcoKLcr6hULt42q9N8irbpRYPGjcB/XKyXdPoIaVo7toaXTJqurWWKGU5y/JdNGw9cl
	wTagIUM1fNFQENp8IN6K2jsyngXdsgwfJ4vm4ZeVlpwTXCXEP+ebhJRLdiGoFLX0a8J+R9GoCaw
	P5Bit2zdJMY634kXqLnfkZf9YVk+GrFRfZgeoHcXpj6KOqCrGD7hCKG+z1oquXoZcNBkXPh9q3V
	WOC+ROtj20E3cJXHwT22k8+fuMjyeKkmZ/p4=
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136703307b3.23.1785770238441;
        Mon, 03 Aug 2026 08:17:18 -0700 (PDT)
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136702797b3.23.1785770237899;
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm57358447b3.5.2026.08.03.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:17:14 -0400
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
Subject: Re: [PATCH v5 18/25] clk: mediatek: Add MT8189 vlpckgen clock support
Message-ID: <anCw-ozpIjYfan5O@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:04PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   3 +-
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c | 285 +++++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 9d3d2983bfb2..3b25df9e7b50 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> +				   clk-mt8189-vlpckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpckgen.c b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> new file mode 100644
> index 000000000000..8eda5331972e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> @@ -0,0 +1,285 @@
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
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

There are also some headers that can likely be dropped here as well. I'm
not going to comment on this on any other patches. I'll just list any
new issues I see.

Brian


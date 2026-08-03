Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853D40927D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770380; cv=none; b=URYSV/O/Av71zAkdyn8DXDTgm9c4f04Vcwd5PFEfLm1u8e4YbgFXpJ9UbqKMWwy9nh6ERe3zAL2qiePame6LKFA+7CFKz9Ff8KEzuKA1SYmknSRQeNXCFkfAoR0AnW7baCtaZwDv6mV38DyR0WLegFvo/NExMt/+TuUXIQQuml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770380; c=relaxed/simple;
	bh=S4/lIw01byCzq07ylvrJS1kUmYO4YWq751Wf1CZYFTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIiGuok+xCq+E9p2Tfbd+PwvG+wKjTHWxprYcFfV/WEntOGzUQoP/XQHNi0oOlkgO1fvfVhvzGZYKYxjVroqKiCry6J8zAZABOacOFbwP3UzYhbNBCoiRZ9pFmbcw7pDbnrRVt1YctdEYfGjb6RZ/5SX7RuYdvVObu4RznCkbzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZd8vrT1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nPwplC0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZd8vrT1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nPwplC0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
	b=CZd8vrT1OW76+k8W/aAdKbpAxy90VbE/IAqs6DN/LZXg65RmnGTxDruoiauk7i2pqIm6U9
	fRslYLtpfxTJOfrcvYFk7+qf94FoRcObMojnKLDZ1W5eFYZjj+YiWSsAFV69Fs96VXA4+r
	4XOamNY2zVifo+gyhWcv/4VzYIJfhwQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-2fLTT2kYMbaYsQ4nesSO9w-1; Mon, 03 Aug 2026 11:19:37 -0400
X-MC-Unique: 2fLTT2kYMbaYsQ4nesSO9w-1
X-Mimecast-MFC-AGG-ID: 2fLTT2kYMbaYsQ4nesSO9w_1785770376
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81bee860fb7so133697727b3.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770376; x=1786375176; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
        b=nPwplC0GcADwh1aH7FNsy3ba5gPfSbWpgedP/ToQubNjlXEnl9X/HMMkndffhiLNcX
         ME1WfbG+Uw1S/8iALvtduixOtMGGp4ETCDP7WnjGh8QvEgNaFNIzQNB6jJ1InqGSYyof
         Ji2Z5m0BlrBh1mnVmFHW2wfjJv1Sug1ygt89aRoZxBZGPVqJX7VlcL3yokI2cJxgqnM6
         kFyMnvrl6wJED9SvcLEz2ZFOLtbKY7OcDQfnQGjEGizCW30sptDU8RtzfSHSTbQX0QdB
         uooFYd8b4YPZ1cUrBMyT9dLeqanKQ/jY6/pz68ZQehRom+Tug3L8AgNrHo4s1fIWo5PA
         C6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770376; x=1786375176;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
        b=TfbP3XR9urak+iyuC25oRFssDFSE6L89NuCb441PYnfJW2EEx9BrVmOk6kxG0QtXRr
         7yDtNKcrJriCTFC2kXdUgTHsBwlgYthFwiukapEYT+m+/MEJd1FVqUrrVKDEN2OJZ2JQ
         HbosGVxbJQEs1nGLNpUgaJMDpIxpUcSxPWNQ8rbRGmRYbzKzyXhNkixl1kv/JXAuP/iu
         DJooTzR6hxk1cwzfW9OrMsRDXWAzyM7g0aJeaCPaGd9JYUsvTHe2OjeyITum3HHjwHi2
         W/QnnxX6ROy6Md8aSCBJofz3XTG735CdH6rHknYCtY634EPgCf1vBy7wTG22jx5pmOQD
         Sqqg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Ug846T3uzqTDg6lypWAxRkqq0juvDuiXzNmV0WQHMO2FVWmYKR+AtFXVIiNfhm6dfnAXX66GPqRM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2RYntTayXOwtFuqzyk664PM2AxBWUBAClgCLEib3AsKp+z6Qb
	8o0bVfbLyd56uUzONSoi5urfAOKK1ZDmkzuZcdau/cHXut2Hf6lkAEv4L1BsbhVT1xpyt9cJxqG
	RA5WASEr4iqnsB2Ir1lwF8vjaW1sScgKOTR2sFDSNf70uT+bFUamKCeznkXRx5vo=
X-Gm-Gg: AR+sD12UJeyJyOMKby+R0SR/ohytAcIa0dnrPEH1p2tDk93LLc3JsMk3q3Z+EMa/Jp3
	FpCcGqUvwpDDRjFVQ/YYU9OUlwd+B9/gN8J1Ntpn9yKrBKD9fYVQorilQKMlT6Yv152ZN7CXpGV
	AqBGEbvMSXqK4yTe238qUjyPYAJ5p8qgNmXQjUXccgbLqeLtD+HsjAdgzJ8Z/4yyWUtb7W9GEW+
	OL0RV8Fl/7PVqzSYB3GjTbgcLrP3n6daDAjAKIKBspazoO4NEbt1mqbGjkUXrVi55bfqhQxD7PF
	/UEOqRxE8NQ+v0jd/unQWVbUL457e18l8F0LyLysNzEV62CDEYpUoYPDk87C94cQ1+vB78DRBcN
	cVrwRr/IMQk6dRrmYX0FQDXRFeT91eZiBD/Y=
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566997b3.32.1785770376562;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566557b3.32.1785770376131;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2b0sm55932967b3.8.2026.08.03.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:19:35 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:19:33 -0400
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
Subject: Re: [PATCH v5 19/25] clk: mediatek: Add MT8189 vlpcfg clock support
Message-ID: <anCxhZEK9Rh1H4U9@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:21:05PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile            |   2 +-
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c | 116 +++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3b25df9e7b50..d9279b237b7b 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -124,7 +124,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> -				   clk-mt8189-vlpckgen.o
> +				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpcfg.c b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> new file mode 100644
> index 000000000000..cc4ebfd46a6f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> @@ -0,0 +1,116 @@
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
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

of_device.h is deprecated. You can drop this one since what you need
will be provided by platform_device.h.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


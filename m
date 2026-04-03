Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48993C5550
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228057; cv=none; b=oshF0uxg5B4lmbC0fUKZ2wlWR4bJrua/fIhkaKmsmN5d2SJKMRsJ4YmKclGqJFhsAp941cmpZspX/cT2C1WNzKx81NXyqwYRayNI1uokYHQcdJ9xHKCiANSHi3UBylUS1yS5s7giNkmFq7XIHjV4XpBknWjWoh431SsYCCVoNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228057; c=relaxed/simple;
	bh=7PUBIgjHZ5FhHvfdpZSXiFD5EOe9PjvrkPuWk/Vegjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQx5D0y/a3qMsO4XDaOwT10EarpIfVhwr0uDYhiU1V+9Q0/YyqTnWcQG96dsDfktb1HbxY6YaADgtudzWPxfL4kvgfW7YRoB9KIYadWfU0E1C6jg+twEV6Fvytwwa67YDhWw9l0UTX0l5OHk4L7iwTDeCUuFJh8/nRRS8bFNjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SIQyAI7p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=seoVZX0j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SIQyAI7p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="seoVZX0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775228054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
	b=SIQyAI7pusr2S9yffscXzx4h456ryAllUv3iPfqeFOepZgsqr2RFyGbFGCVoiFOmRsfeu7
	aqVvjoGc4CpOj5lOaU+5SDfVZiX56Yd2oap4wJyU7oID6o05iK0iTgHYhN6f8znJqHTlIy
	AQK48KU3JtXNZkmhJXbGBgyTiANIu18=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-DHgMp1jVN7CEJtTTvYxDCQ-1; Fri, 03 Apr 2026 10:54:12 -0400
X-MC-Unique: DHgMp1jVN7CEJtTTvYxDCQ-1
X-Mimecast-MFC-AGG-ID: DHgMp1jVN7CEJtTTvYxDCQ_1775228052
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89e56a8c863so81808426d6.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775228052; x=1775832852; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
        b=seoVZX0jmxVoFjHQS8P3l2gcnociwp2ylAe5F9CvBlUO6R9MSvjgPes81k0eE3HxsB
         bDH0mu9XT9DjyUf4HBefwVCPAwNtNvTF6P9bOj1uqc3nN+R9fhKipRWguEgE2fVLdQ8X
         Is6EWFDWwtEGnEeiaeNR6i7y7TV5PM83hEwS5tPsi+L8Fw3M8l1HUUryPKkXZT7OOLSe
         ZR9cEhicgWqrcRspE8J8wSRrIj5r7GnLVZI34Eeye7LkcYvwLmKS3o0bGybjh0auAjkB
         ek8wQ04MNa34a2vediNqKut7R6hrBFAmSyprzRTdKMwUOBWvm5zwbnIN5t9MCFs9NhzR
         7vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228052; x=1775832852;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
        b=KC8tSnb7SSSKWJ4gpz9a/X2Qodo2BHKtGpZ3GkkrRHy6eyt0tyHYel3CgoZOvO4uEl
         wRW0nsm4i1c3/imnVBSr9OEGyPTgoUCYTElZQxoboRmS2jrtTpoIW4glhHenJIr1HCII
         o1K0rYnxfyl5ZaTM2VWp0PRp5vVmkKkI7hdiX1kO42Re577Wdky/ERXkEw44t96pqWEU
         eS9PvA4cC2MFiSpsiYqv9VVYFWIPi2kJnBu84G395hH1y7xD5fGvrSA2lDW7iHElqGkf
         3BCOg1g+cD/Gg0WAZ02sppEVQT5NnMcUGdxuJKvuieynGnlAA1YsB7GEkWU62E7fWpUc
         8Yew==
X-Forwarded-Encrypted: i=1; AJvYcCWQ69dlUstjCj/jRyRzTP4lCm66Ivkb4GZuhBf74tRiggDr0Ij5JoKNany/9GnmhXSC8MMI/xcSYaPt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EO3V7p0EiTrAgPsAljwDjt7Bw+Uu5jwfqNs96BoRA8ByTfa5
	8a4qo2CQNeIdpT2ALi8x1cB1zPqLKlm4Xz3OROMj3255a9oNQcVsGozBV/UKQ2FW2KcwYFk9KvB
	GDzBT6px4wk6zsc4JlDJNuO48RZHN3+CwVoyR+X6CNNuNTBsEFbs9VZE3+gX97r4=
X-Gm-Gg: AeBDiev3LCwK9/QqfJy8QQXtosVV3gQB+pP36CSsM9N2g1TpnmrO+tHbJHAmgYgr/dW
	Rh3PFnebXVkXPG51dBPkD8ryXUWYNsD2aiCp8xlvAr1VeUpt6WIPUnlQsu83cfvsd2sWPHPzEpi
	KJCZGphef8ykDlYHrP1hJUN7n1urf40WpZDwfo3x91G/IAHI2aCKMKOFBDXxkKlYifzLXXdTuSU
	ZJOTcwR7ZXshoMNGu2IXiw5FH15Y+3AXl8IbyS769QOSoIQhrDAJaurQkkIl4QKKlRoYD72AK3A
	eaBspOC7JOxmTkT+gJr87bBFiEyHNMCTwe8yRe9tEt4tiNoqKqTUrvXKrO/95Kuyl4tpNNljQZP
	cpecfopJCYZ/v9+8sH5HLUnbwD311qyrHDrSVisMTbn3EU32qmWYBLVF4
X-Received: by 2002:ad4:5961:0:b0:8a5:104b:e390 with SMTP id 6a1803df08f44-8a7043ee428mr55704456d6.32.1775228052331;
        Fri, 03 Apr 2026 07:54:12 -0700 (PDT)
X-Received: by 2002:ad4:5961:0:b0:8a5:104b:e390 with SMTP id 6a1803df08f44-8a7043ee428mr55703896d6.32.1775228051814;
        Fri, 03 Apr 2026 07:54:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593330a98sm50899396d6.2.2026.04.03.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:54:11 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:54:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Message-ID: <ac_UkRiqWb6fSc1I@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-7-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-7-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Yu-Chun and Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:53PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> ---
>  drivers/clk/realtek/Makefile         |  1 +
>  drivers/clk/realtek/clk-regmap-mux.c | 48 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-mux.h | 43 +++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 74375f8127ac..f90dc57fcfdb 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -5,4 +5,5 @@ clk-rtk-y += common.o
>  
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
> +clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
> new file mode 100644
> index 000000000000..068b056d61f0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/clk-provider.h>

Sort the includes.

> +#include "clk-regmap-mux.h"
> +
> +static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
> +	int num_parents = clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0;

This is another case where it'd be nice to get the get_parent
declaration fixed. Stephen recently linked to some work of his from 2022
here.

https://lore.kernel.org/linux-clk/177431305509.5403.15386021337517970667@lazor/

There's nothing for you to do right now.

> +
> +	val = val >> clkm->shift & clkm->mask;

I know there's the order of operations, however for clarity I would just
include some () here to make it clear the expected order.
> +
> +	if (val >= num_parents)

Remove newline before if.

> +		return 0;
> +
> +	return val;

Or you could just use a ternary operator:

return val >= num_parents ? 0 : val;

> +}
> +
> +static int clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, index << clkm->shift);
> +}
> +
> +const struct clk_ops rtk_clk_regmap_mux_ops = {
> +	.set_parent = clk_regmap_mux_set_parent,
> +	.get_parent = clk_regmap_mux_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "REALTEK_CLK");
> +
> +const struct clk_ops rtk_clk_regmap_mux_ro_ops = {
> +	.get_parent = clk_regmap_mux_get_parent,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ro_ops, "REALTEK_CLK");

rtk_clk_regmap_mux_ro_ops is exported, however the declaration is not actually
declared in any header files.

Brian


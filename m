Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B04334C9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970648; cv=none; b=UPk8LRW9XPJjaLfbIQoSIF0xXv5KXcRj6q8jQ+h3K3mVWIJh9Wlnqbdcqw8T/FlvPNj879S2BKWWBx4iOeThkEm9lOtTZx2j6z++Syz7/PpYpQbYY/YqRUPPJ6+shDj6mfxY8W3GL9kU/x1bUubq35WwSQwbgUZjixt55/ti06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970648; c=relaxed/simple;
	bh=Nq7Fx9cW/yMMojiMbMsDPveLjNjnf6n6z2l3LEZbbFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHPKMe4m0J8dE76CSk7MK1A36DLBAWYYtiYxuFdN4g9P+/R158Cw1cMxk0VgciQWY9Rh0LmDejg6ktCHrN7/V8uLPnJJYSEmLTsipTUoMD+ftBUpMynGx05hPT7ILVuo/GPxEij57f0MeqcQ0JD7lsBbcHhQ/IdB5PItaGwPsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8CGEv0+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NawNL/0R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8CGEv0+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NawNL/0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790970642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F25QBZ61ZmBrTf7fU7xFNKMRCKDf4lsr8/BxhtCtQxg=;
	b=a8CGEv0+VMJkhX508rPGSM76LOAUdg0nnSCs+uIsaKj0BhlStA4sRyctlsazkx8xVjYNkH
	fwXEQJvWVfMUaKd01tDWdo/61IlwUlhglE90f1uutXMoInHorW+Abg1wsgn4+4+8TXrroQ
	vuQ9OXPzRRX3xZtl9yXGgrokjStpb3I=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-UJ8z5NX1NCCYARB3JrX-MA-1; Fri, 02 Oct 2026 15:50:40 -0400
X-MC-Unique: UJ8z5NX1NCCYARB3JrX-MA-1
X-Mimecast-MFC-AGG-ID: UJ8z5NX1NCCYARB3JrX-MA_1790970640
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-895241d7405so125906377b3.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790970640; x=1791575440; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F25QBZ61ZmBrTf7fU7xFNKMRCKDf4lsr8/BxhtCtQxg=;
        b=NawNL/0RtDRb6R02vo9so4pmLT1u7I4tX9TCa5R8B66YZ4lA9X9OVBBcU6fzqS0dmq
         An1b6UWwRXVCO0N4n1kfySq3sb5rEbLKpSIAL/tPRrB4LSmmsvdrm+W3IWb9ekFyUVQY
         vMSRa3vs9yr2XB6zs4T6PDAQ0JIgpED0xAQ9IhBl74e9DTrOjnsvIVnlxysYLS2U9mA0
         OuwHIL4NepaCmDjC7jpIy/1PyV+RL2aO4GhIJysrjEGr9OVyqQpaaAq8wi6ESs+VB71h
         xeUV7GiolbSGAhnJjFCIFRP4L4xms/V1rS+3X4iy+WCaiYEbXr9Fwg1dlKNNUFdzdjQ+
         kgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970640; x=1791575440;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F25QBZ61ZmBrTf7fU7xFNKMRCKDf4lsr8/BxhtCtQxg=;
        b=n6UBy8ugjWKG9lqzSRZQJR674t34sZeDXCCBp9cKcUFxTHstojAibpAhxs9W7x2e2I
         w8faexDm++UsJpC/jdq4l0tmFk8WpbgF3T8M2Zw1Muc2lM6yAmGKtkCtS1uqRZoWVh+/
         gu56mXP+lSjoxIqJCPpE3BaqUakj2P+YCH5PrPc9nO/oOlmngEX9UjopNx4Krz8ipN9b
         AXgsApcFcytPc8kFUeKsUC+4rEL/4x+WUR5ogL3rS23j79fqYMVIelvpEGNJe+YaE006
         OqktAcI79QDd7o5+JqT9TP93Hce8nloFyHlkWAmchriaQAS702IlfllHj4+tsFCK4Zvg
         4SHg==
X-Forwarded-Encrypted: i=1; AKwUvBzRbMCKnGOULRThFLXmNbW1f7s04pRQaf7DnoTEjLInMkRWvgqX9lJ7MqCOGxXYJDhQ2W8MUgB3o3bH@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+05qhDQ4wSc4OEAHMaXo5fTNfnlneoIDj/fQelCdBRJsk/bgM
	cjBAeWet8kMSexFKK7QF5sdo9NyG3QZUpagAJ+jtQId4qvcIuPFLtzULQ1gVI5waptpHjAb/6Zn
	snHC/2IxFilFFqxCi9s9wARey+hzWpwp/fJ9fMfY/axRgEd+euzu+Dha4j9KsCjE=
X-Gm-Gg: AYBFou3+K7FFsjZU+/WU7gTZsQdMDBlJto/gRIX3Wc+p2wt5sQ+Styd2jY77ctZyXjd
	bGj7eB15LmKQ3vudVJzWcRpTKFI1LqJXsHH8wXhOsp3Fl0rFlYNOxKdp0BMKx2qlFGdHGvEoc4c
	MhDmb+Ja6bX4KZW08zAE9eiCkbL5OdmcrXnCkrKzLXqmAKUsxbq4RL3bvRsj+JRZ7h+5I8TZ135
	PUzyezGUonUFqy0SEtAND9Ic+BLe+ZGKdAHjDk8FYf1HlGCoNEMF/uOFV3h60Cx3QqvdQQl245B
	/fT/9/Et3JyzPjP2Zu1BhZugeth/MQW+z+VdfuIvEj0E1uWh9sBQjzdfFKuC7PcmfW+ZWK8T7A=
	=
X-Received: by 2002:a05:690c:808:b0:894:4ded:2746 with SMTP id 00721157ae682-8ae39bc3a5emr15283787b3.36.1790970639966;
        Fri, 02 Oct 2026 12:50:39 -0700 (PDT)
X-Received: by 2002:a05:690c:808:b0:894:4ded:2746 with SMTP id 00721157ae682-8ae39bc3a5emr15283607b3.36.1790970639475;
        Fri, 02 Oct 2026 12:50:39 -0700 (PDT)
Received: from redhat.com ([2600:382:850b:d4de:3546:fbce:3693:8762])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae32cf2f27sm13728657b3.26.2026.10.02.12.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:50:38 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:50:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 10/23] clk: starfive: Add JHB100 System-2 clock
 generator driver
Message-ID: <asALCsosWkutrwUK@redhat.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-11-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930124317.5648-11-changhuang.liang@starfivetech.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Changhuang,

On Wed, Sep 30, 2026 at 05:43:04AM -0700, Changhuang Liang wrote:
> Add support for JHB100 System-2 clock generator (SYS2CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-sys2.c   | 129 ++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 11da8bcc4046..cfaac934a8e0 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
>  	help
>  	  Say yes here to support the system-1 clock controller on the
>  	  StarFive JHB100 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS2
> +	bool "StarFive JHB100 system-2 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-2 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 0061550e0f7e..29cdef20575e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> new file mode 100644
> index 000000000000..a2c7e8eba9b6
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-2 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +#define JHB100_SYS2CLK_NUM_CLKS			(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS2CLK_OSC			(JHB100_SYS2CLK_NUM_CLKS + 0)
> +#define JHB100_SYS2CLK_PLL1			(JHB100_SYS2CLK_NUM_CLKS + 1)
> +#define JHB100_SYS2CLK_GPU0_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 2)
> +#define JHB100_SYS2CLK_GPU1_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 3)
> +
> +static const char * const jhb100_sys2_ext_clk[] = {
> +	"osc",
> +	"pll1",
> +	"gpu0_ncnoc_init",
> +	"gpu1_ncnoc_init",
> +};
> +
> +static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
> +	/* jtag mst*/
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_ATPG", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_ATPG", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG_TCLOCK, "jtagm0_atpg_tclock", 2,
> +		    JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG_TCLOCK, "jtagm1_atpg_tclock", 2,
> +		    JHB100_SYS2CLK_JTAGM1_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_HCLK, "jtag0_mst_wrap_hclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),

Can you leave a comment somewhere about why CLK_IGNORE_UNUSED is on some
of these clocks? We may be able to deprecate this flag once some
variation of the clk sync_state support lands:

https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/


> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_CLK_JTAG, "jtag0_mst_wrap_clk_jtag",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_APB_PCLK, "jtag0_mst_wrap_apb_pclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_ATPG_TCLOCK, "jtag0_mst_wrap_atpg_tclock",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_HCLK, "jtag1_mst_wrap_hclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_CLK_JTAG, "jtag1_mst_wrap_clk_jtag",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_APB_PCLK, "jtag1_mst_wrap_apb_pclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_ATPG_TCLOCK, "jtag1_mst_wrap_atpg_tclock",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
> +	/* hostusbcmn */
> +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSB_NCNOC_TARG, "hostusb_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSBCMN_CFG_500, "hostusbcmn_cfg_500", 4,
> +		    JHB100_SYS2CLK_PLL1),
> +	/* bmcperiph1 */
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_NCNOC_TARG, "bmcper1_ncnoc_targ", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_250, "bmcper1_cfg_250", 5,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_143_DFT, "bmcper1_cfg_143_dft", 8,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_BMCPER1_CFG_143, "bmcper1_cfg_143", CLK_IS_CRITICAL,

Also please leave a comment why CLK_IS_CRITICAL is needed as well for
these particular clocks.

Brian


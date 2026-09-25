Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B004CB8CF
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349995; cv=none; b=QGbuuaHGe/ggYcL9rYDIRKBLZknN3uYPPlIMyZgV+uHRqvSEelO4qRcD/bEvpYP0W0AOjYDtlgQCZWUhg0H3iINnw7IEEjEavlqhvjieIkJd32YBuFCnGvD90Q5oJ2xV4cqj0dQ3PP43dfV4gI/W6WCiHhc8D71SxyC5ZAuTVWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349995; c=relaxed/simple;
	bh=wk49+cAl8PXGjwTyGFaDmBGtdgnuazbb8rirbbNIRgo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gZ0TmzHgHrXJeCs2OtlXn2slCgNxZcPCZUILJvyADzhFD4dZzUsPntJwp+5IFlvaJwrhmsbcXE0sc/Dv8XToLb1adWMaE7IDSUAmxPd2AHisTl7HYBn6bLs8WSvP3ji+exaJBADDbUr5RxKa0YTV20Sv1CpZf5q8xKGq4ysTj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BvQNEnfD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BvQNEnfD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so8597205e9.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790349990; x=1790954790; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaDR7gLTMcuaZYjvT6IfS3NURHPj6dBBuLJSgRQzTEY=;
        b=BvQNEnfD958U/VGOXwd3y7faYpQeCuhQW/3OcpIgXPi2W8Pt4+jzGYd5A0VHOt7Uix
         tpzB8iHuQMfoW1VLJt7IGysa94C2Nh4ux75RhlRYiKmoh0F3aI4AvgBOFDeyVPGxqrPo
         hbvZ9smUbHjA5YM1YmaBkiOtzwD/s1P4AdLPlVQ47IEmYSNOQHsuJk9A46CEoKMTwCmg
         g9Vcw7daIhY9hVhEPw1EDYOm84MS079ANDTlvso3GqozEJ/RI2cevPddy7criCss4wcO
         zxmauucEe3aQ6irTvri0+SzmkCBIvyM43b2JdukeFDvUg/3VNGTZu1BM+0HsU0LUduLC
         Wa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349990; x=1790954790;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaDR7gLTMcuaZYjvT6IfS3NURHPj6dBBuLJSgRQzTEY=;
        b=hS2KXpuMaft/yjCDQagl+t9isKQnUrt1/6KgcbjxarSxH4l9x2FkEKwtgPhIj4Yp4a
         +04fUQuKwvUdL4b5/cevHvP45MMdfuCp2ekQXxP7jQnNpTEVTIIuneRm1tRh4Qc/JNfR
         KBiOEhEkGBbF+6zPkEi75dA8I8ZRzcZckC+td9yIc2m5KS3T1aRDVYtTn5iSmcUQc87O
         NmAqrJOqFrLuTjG7A9CoPyYF/yu9maOxBFhpCCoU0A1o01dNfkOhF0VMkbLqTCenuSL7
         FnkWjELabdWEdT4q4s5m/UmWMQwidvsRxdxZGzSJdlthbFECbWcVO1TWnj3+H6sa/vAQ
         +ZHA==
X-Forwarded-Encrypted: i=1; AKwUvBy3vzNj/dRb82M988vnA36g5hCAxMGKyvwL8Xk/z/1EDEV9IWbwc0DUn90jLWWiOuWFv6Qc8MQc2vEd@vger.kernel.org
X-Gm-Message-State: AFuF++mX/uIPTLWlLMd26HXiCZcrRjTLD9jeQw0McZx64IWiyJCVlA6A
	jWnMKF1taXLSCglpxxDKcEVkOdYnlhm+FwGzIjrdMXXj++nUxExVR5XLu8d8i1RdBns=
X-Gm-Gg: AYBFou3KajMkfZ5UZ5Mi0+v8iMBZ6yu66uMikHnYG5dIiXLGEjFiQhHp5ssDPk3ORbJ
	REQjlDnIEVcLAjdxQNiO0Iy2u10KMflWKsQZ3m14+9BTaXt22vGAAhv6j4InR4IIVk7CA207Q8x
	hJHnRfZGnbV168ZIqJ8fCBPl9+g/q/nr5/Wru/nMN/5Zv1r8kdJn/us35Y3gfSW8igM7xlhZBPH
	JD6ViVQEPo7ua6PkCZqMK9INBub3W7ZefdfYYG/fQxvKUc+/CK0kFNTFCN/VPTSLG6Y1UHxWKHx
	MT8kYOHv0sg6iiQlrcs1BUnJJt39obDirXqS9n+ooBf1hHXBf6nVvDNAREaF/OxH6HJE4yGhGh7
	VnalBg3tA90A+2bAufz8MauR+Hi0U11QZiEosQRAoqG49dhyTIWnfB1cDFrq8QX7U/dqcGVA2pf
	F4AzrPJcYkw6aZ3/E/AuId+ygiYtych/Zf9f3kyWZWFz3wBFiRtluqQMtRUQ3nAV9F2NhkhisLu
	IHItkcioJjPnCMQnA==
X-Received: by 2002:a05:600c:8b26:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49fe66d83camr120484355e9.15.1790349990326;
        Fri, 25 Sep 2026 08:26:30 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0f1f2e3sm109952885e9.0.2026.09.25.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette
 <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org, Hal Feng
 <hal.feng@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v4 03/22] clk: starfive: Rename file name "jh71x0" to
 "common"
In-Reply-To: <20260920120044.194901-4-changhuang.liang@starfivetech.com>
References: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
 <20260920120044.194901-4-changhuang.liang@starfivetech.com>
Date: Fri, 25 Sep 2026 17:26:28 +0200
Message-ID: <1jqzih73ob.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On dim. 20 sept. 2026 at 05:00, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>
> StarFive JHB100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the "jh71x0" naming convention are renamed to use the
> "common" wording.

Is this really necessary ? Rename are generally not recommended.
Do we really care if your new soc use something named after the older
one ?

You are naming it common now but how long is it going to stay "common" ?
If your next SoC does not use this anymore it won't be common for long ...

>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                              | 8 ++++----
>  drivers/clk/starfive/Makefile                             | 2 +-
>  .../{clk-starfive-jh71x0.c => clk-starfive-common.c}      | 4 ++--
>  .../{clk-starfive-jh71x0.h => clk-starfive-common.h}      | 4 ++--
>  drivers/clk/starfive/clk-starfive-jh7100-audio.c          | 2 +-
>  drivers/clk/starfive/clk-starfive-jh7100.c                | 2 +-
>  drivers/clk/starfive/clk-starfive-jh7110.h                | 2 +-
>  7 files changed, 12 insertions(+), 12 deletions(-)
>  rename drivers/clk/starfive/{clk-starfive-jh71x0.c => clk-starfive-common.c} (99%)
>  rename drivers/clk/starfive/{clk-starfive-jh71x0.h => clk-starfive-common.h} (98%)
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index bd29358ffeec..ff8eace36e64 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -config CLK_STARFIVE_JH71X0
> +config CLK_STARFIVE_COMMON
>  	bool
>  
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select CLK_STARFIVE_JH71X0
> +	select CLK_STARFIVE_COMMON
>  	default ARCH_STARFIVE
>  	help
>  	  Say yes here to support the clock controller on the StarFive JH7100
> @@ -15,7 +15,7 @@ config CLK_STARFIVE_JH7100
>  config CLK_STARFIVE_JH7100_AUDIO
>  	tristate "StarFive JH7100 audio clock support"
>  	depends on CLK_STARFIVE_JH7100
> -	select CLK_STARFIVE_JH71X0
> +	select CLK_STARFIVE_COMMON
>  	default m if ARCH_STARFIVE
>  	help
>  	  Say Y or M here to support the audio clocks on the StarFive JH7100
> @@ -33,7 +33,7 @@ config CLK_STARFIVE_JH7110_SYS
>  	bool "StarFive JH7110 system clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
>  	select AUXILIARY_BUS
> -	select CLK_STARFIVE_JH71X0
> +	select CLK_STARFIVE_COMMON
>  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
>  	select CLK_STARFIVE_JH7110_PLL
>  	default ARCH_STARFIVE
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 199ac0f37a2f..012f7ee83f8e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_CLK_STARFIVE_JH71X0)	+= clk-starfive-jh71x0.o
> +obj-$(CONFIG_CLK_STARFIVE_COMMON)	+= clk-starfive-common.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JH7100)	+= clk-starfive-jh7100.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)	+= clk-starfive-jh7100-audio.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-common.c
> similarity index 99%
> rename from drivers/clk/starfive/clk-starfive-jh71x0.c
> rename to drivers/clk/starfive/clk-starfive-common.c
> index 80e9157347eb..4aecb65e9fd7 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-common.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * StarFive JH71X0 Clock Generator Driver
> + * StarFive Clock Generator Driver
>   *
>   * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
>   */
> @@ -10,7 +10,7 @@
>  #include <linux/device.h>
>  #include <linux/io.h>
>  
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>  
>  static struct jh71x0_clk *jh71x0_clk_from(struct clk_hw *hw)
>  {
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-common.h
> similarity index 98%
> rename from drivers/clk/starfive/clk-starfive-jh71x0.h
> rename to drivers/clk/starfive/clk-starfive-common.h
> index 9d5dec1d5cd1..f634c62c196a 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-common.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __CLK_STARFIVE_JH71X0_H
> -#define __CLK_STARFIVE_JH71X0_H
> +#ifndef __CLK_STARFIVE_COMMON_H
> +#define __CLK_STARFIVE_COMMON_H
>  
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100-audio.c b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> index de1cf717e391..0e363b971e9d 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> @@ -14,7 +14,7 @@
>  
>  #include <dt-bindings/clock/starfive-jh7100-audio.h>
>  
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>  
>  /* external clocks */
>  #define JH7100_AUDCLK_AUDIO_SRC			(JH7100_AUDCLK_END + 0)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 761e46ed0ffd..ca81ccb5af94 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -14,7 +14,7 @@
>  
>  #include <dt-bindings/clock/starfive-jh7100.h>
>  
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>  
>  /* external clocks */
>  #define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + 0)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110.h b/drivers/clk/starfive/clk-starfive-jh7110.h
> index 0659adae4d76..6b1bdf860f00 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110.h
> +++ b/drivers/clk/starfive/clk-starfive-jh7110.h
> @@ -2,7 +2,7 @@
>  #ifndef __CLK_STARFIVE_JH7110_H
>  #define __CLK_STARFIVE_JH7110_H
>  
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>  
>  /* top clocks of ISP/VOUT domain from JH7110 SYSCRG */
>  struct jh7110_top_sysclk {
> -- 
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Jerome

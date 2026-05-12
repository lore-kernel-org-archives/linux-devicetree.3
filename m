Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214313C76A0
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600726; cv=none; b=k4S01gZadBJy21FDjHdrpYFjQnq/saToLuMbCLvrCLDDhmcL8hIdT05mTrGsrlHbjhYsoDfYhJB+GjQZBKLoMDzhtq18B57x5SCjvok8uLGYqYDAMUfxCrpKV7PDrBxJh51onLiIl90FLd8emu3y4th6u8F+vDo+Zfm4LneDSbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600726; c=relaxed/simple;
	bh=29A/M4xYVUS372XJHCDISmn4w9ov/gKfjHEVp9qR1aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGax+XDhtEWuy4j9qerG/ip1Ph+Gf1mScW5dsPdHYlLsVBmWJfdh+N9oNaDZCNPE7Lkv1QYXk9vjRyIvsI7+pDn+pQGtU+WNXz7kNHnDM0YXyHrB5mVaqjTzp3CE3wxVLsaRQQcbPGWL4Wl3S942D3w7tPxySVauGpwoce45FsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ck4EIG2J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQDQBi/r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ck4EIG2J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQDQBi/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778600724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F/Rj20yJzwwrc5IUSlJqObsXWAOLzLYrlkLUj5Fyb3E=;
	b=Ck4EIG2JWcczTpkqGjOWY8avQ173Fv16SleMpSXAL4ajVVUTWDnOi6xXBEQqYvs+XL+gqr
	xeJ+s6pS/ScMMOGjIvL4eR9YDVtkWo87hA+8P1drrD12ydANnk+sAC4+g/otTOhKSCMob9
	4ttGbf2HaufuOL/bvuzTVvMeiTLa1lA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-Ze_kg311Op2nwWnwghPdHw-1; Tue, 12 May 2026 11:45:22 -0400
X-MC-Unique: Ze_kg311Op2nwWnwghPdHw-1
X-Mimecast-MFC-AGG-ID: Ze_kg311Op2nwWnwghPdHw_1778600722
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90c991bfcc3so357043985a.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778600722; x=1779205522; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Rj20yJzwwrc5IUSlJqObsXWAOLzLYrlkLUj5Fyb3E=;
        b=bQDQBi/rcQGU3rwhCC9Q0IWh8Uq123zdU0XsfZKJCJWEJhhZqEnOIiTWOnf/nl0NI9
         uZVP77Jmj68eQFbXu36zSGHSqS4lYFFjDkpnfKL/++qg5rcF9N2qtrlhGH9laiU+5Da0
         3DiS9AuVLLqhq6+USAYd1hRXM7BBxgSH+LyBqiVuOWBdJQMOSaTyr8xoi2r+Gqe5ViRA
         BxcjSQNSCYXGIfe+EBV3OiZVPcanlfwOH9f4DiYEm8q++JHpunpIjv2aDA3SR1ueXNJp
         XkUEPZyKOjxR4JxKmrYkHeT+ntLL51BONLEIlnIv4n+b1NU9VEPToA8apZf6SUYHvyqh
         TOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600722; x=1779205522;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/Rj20yJzwwrc5IUSlJqObsXWAOLzLYrlkLUj5Fyb3E=;
        b=H2EN4xPjbe7HS6bqiD4LXQJHiRHWt0s1/z0kokLqJYSgDyFXZO8sI06Xvb9OFVBPMp
         6kndruKsTKBNRul60U0o/HI1ueuCBuD94sjNu9iJ9NV9n7cfz4YFJBAKIAQgTh1Iva6C
         DaiSslgxKdU9m6e5oM4qjyL5hHYPEDvVhru+JQZpyD7PkPDrjCB4L4LXpb6glU70vbuV
         CHH04r4e60awlp2cR2RIn0V5q73rwtalzAu9KLPj6/ETybN0NfcGGsMUUoXI9f2N4c5I
         vb/v+8Kaa0Zcrp/m6po5fVO6JRYpbibjH4qNqrKaTspNQfp7tJKbl6S+EgTwBwKgr4CH
         pYoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Byhv+1I3aNo1NCa7jd7cN/0T/HQ9j2fnLdlgsuxUwqA2yiiqhuAPTX6eRFeaTijUYKkeOkq36A1eO@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcFr6vjFZA/tWFd5b5z5Mr5Mo5r7kLVhjeDYeoaSH5o66aI1A
	9T/0hHdgBqB5IRwidHvcNVqCVFX7taFACO0YOBx0WEqC7nojb/r/UrteHQxuDzVcMnSfPs++uiV
	ekf4gGi0Y8PWRJ9KuJBGwbG+qRJ4Q3VVJR7f7T7q+NqzaGn3MLI22rl0Rzs3GuGI=
X-Gm-Gg: Acq92OHr3qY6UcniDktmzx7mOryDQ5GyN4eX7QNDI2Eeep5cpRYiISZ/mt+XOSHNAJk
	t8MCaw8f/1kJvYUCW2J148S/E8t6G26qKMLoUcLf+32fb/YCepy/c7GqBaqt4vjlGHoatMqB9QP
	ZUCxcuogZ0XstyWy8a+VlPH+f8IPMMZbSSpnA9U/bf9xYTwZT2ZipjRi+kob6oEyntwZVmm794S
	rLKJCNd6CCezA+3n6+6QPht5/QLxsLJ60JQFfn7hJKnHL4TmNXulzhLokNSunPU1OJZ5Im9X7gP
	+0owSVU3vXCL6m+T7IWOK5QIQ2QN2cMbsEmqcXeVzxLSWWX/6gY88ZIpq5Bw6PaNQw5MwccteYw
	08InIr3uJf7F2hxM0QYQ5nKIes5Bn+eGVfx9Aqjh6Fm9CCgA3t/bdQ/63
X-Received: by 2002:a05:620a:370f:b0:8f2:31f3:975a with SMTP id af79cd13be357-90cb6efb828mr596037885a.18.1778600721818;
        Tue, 12 May 2026 08:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370f:b0:8f2:31f3:975a with SMTP id af79cd13be357-90cb6efb828mr596027585a.18.1778600721164;
        Tue, 12 May 2026 08:45:21 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91b976sm3502993885a.39.2026.05.12.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:45:20 -0700 (PDT)
Date: Tue, 12 May 2026 11:45:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v4 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <agNLDkz0L67lL0_f@redhat.com>
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
 <20260512020747.993-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512020747.993-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Xuyang,

On Tue, May 12, 2026 at 10:07:47AM +0800, Xuyang Dong wrote:
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
> 
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/clk/eswin/Kconfig           |  12 +
>  drivers/clk/eswin/Makefile          |   1 +
>  drivers/clk/eswin/clk-eic7700-hsp.c | 338 ++++++++++++++++++++++++++++
>  3 files changed, 351 insertions(+)
>  create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
> 
> diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
> index 0406ec499ec9..e6cc2a407bac 100644
> --- a/drivers/clk/eswin/Kconfig
> +++ b/drivers/clk/eswin/Kconfig
> @@ -13,3 +13,15 @@ config COMMON_CLK_EIC7700
>  	  SoC. The clock controller generates and supplies clocks to various
>  	  peripherals within the SoC.
>  	  Say yes here to support the clock controller on the EIC7700 SoC.
> +
> +config COMMON_CLK_EIC7700_HSP
> +	tristate "EIC7700 HSP Clock Driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select COMMON_CLK_EIC7700
> +	select RESET_EIC7700_HSP if RESET_CONTROLLER
> +	help
> +	  This driver provides support for clock controller on ESWIN EIC7700
> +	  HSP. The clock controller generates and supplies clocks to high
> +	  speed peripherals within the SoC.
> +	  Say yes here to support the clock controller on the EIC7700 HSP.
> diff --git a/drivers/clk/eswin/Makefile b/drivers/clk/eswin/Makefile
> index 4a7c2af82164..21a09a3396df 100644
> --- a/drivers/clk/eswin/Makefile
> +++ b/drivers/clk/eswin/Makefile
> @@ -6,3 +6,4 @@
>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= clk.o
>  
>  obj-$(CONFIG_COMMON_CLK_EIC7700)	+= clk-eic7700.o
> +obj-$(CONFIG_COMMON_CLK_EIC7700_HSP)	+= clk-eic7700-hsp.o
> diff --git a/drivers/clk/eswin/clk-eic7700-hsp.c b/drivers/clk/eswin/clk-eic7700-hsp.c
> new file mode 100644
> index 000000000000..0d5bd5b705dc
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700-hsp.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * ESWIN EIC7700 HSP Clock Driver
> + *
> + * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/eswin,eic7700-hspcrg.h>
> +
> +#include "common.h"
> +
> +#define EIC7700_HSP_SATA_REG		0x300
> +#define EIC7700_HSP_MSHC0_REG		0x510
> +#define EIC7700_HSP_MSHC1_REG		0x610
> +#define EIC7700_HSP_MSHC2_REG		0x710
> +#define EIC7700_HSP_USB0_REG		0x800
> +#define EIC7700_HSP_USB0_REF_REG	0x83c
> +#define EIC7700_HSP_USB1_REG		0x900
> +#define EIC7700_HSP_USB1_REF_REG	0x93c
> +
> +#define USB_REF_XTAL24M			0x2a
> +#define EIC7700_HSP_NR_CLKS		(EIC7700_HSP_CLK_GATE_SATA + 1)
> +
> +struct eic7700_hsp_clk_gate {
> +	struct clk_hw hw;
> +	unsigned int id;
> +	struct regmap *regmap;
> +	unsigned int reg;
> +	unsigned int ref_reg;
> +	const char *name;
> +	const struct clk_parent_data *parent_data;
> +	unsigned long flags;
> +	unsigned int offset;
> +	unsigned int ref_offset;
> +	u8 bit_idx;
> +};
> +
> +static const struct regmap_config eic7700_hsp_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.max_register = 0x1ffc,
> +	.reg_stride = 4,
> +	.fast_io = true,
> +	.use_raw_spinlock = true,
> +};
> +
> +static inline struct eic7700_hsp_clk_gate *to_gate_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eic7700_hsp_clk_gate, hw);
> +}
> +
> +#define EIC7700_HSP_GATE(_id, _name, _pdata, _flags, _offset, _idx,	\
> +			 _ref_offset)					\
> +	{								\
> +		.id		= _id,					\
> +		.name		= _name,				\
> +		.parent_data	= _pdata,				\
> +		.flags		= _flags,				\
> +		.offset		= _offset,				\
> +		.ref_offset	= _ref_offset,				\
> +		.bit_idx	= _idx,					\
> +	}
> +
> +static void hsp_clk_gate_endisable(struct clk_hw *hw, bool enable)
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +
> +	if (enable) {
> +		/*
> +		 * Hardware bug: The USB reference clock must be 24MHz.
> +		 * The default register value after reset is invalid.
> +		 * Workaround: Rewrite the correct value before enabling
> +		 * the USB gate clock.
> +		 */
> +		regmap_update_bits(gate->regmap, gate->ref_reg, 0x3f,
> +				   USB_REF_XTAL24M);
> +	}
> +	regmap_assign_bits(gate->regmap, gate->reg, BIT(gate->bit_idx), enable);
> +}
> +
> +static int hsp_clk_gate_enable(struct clk_hw *hw)
> +{
> +	hsp_clk_gate_endisable(hw, true);
> +
> +	return 0;
> +}
> +
> +static void hsp_clk_gate_disable(struct clk_hw *hw)
> +{
> +	hsp_clk_gate_endisable(hw, false);
> +}
> +
> +static int hsp_clk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +	unsigned int val;
> +
> +	regmap_read(gate->regmap, gate->reg, &val);
> +
> +	return !!(val & BIT(gate->bit_idx));

If the regmap_read() fails, then val will be uninitialized.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


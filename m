Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69650AC20
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570601; cv=none; b=HvIkHGbn4fjW5ox+gHcKY/HPZl8PkbPmXYNoEOWqeBdQ2AsjwI0Je4eZGh6FRM5RBIEiZbzC8jri7CnMlD4+YONrJxL1mj5G/Jv24d75xLPoVfzrCr85cp7G77XceBr2ZJNr60LtPq0Rt2IS8+Xna4P2wMJl4EM9OpDuJdBUqN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570601; c=relaxed/simple;
	bh=809ruaTMybxoBOwSxW5LNdKvnaeznfCg43/YlBzIRDs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KwUMK5P5yDlcayRO8Abfm6otIW7XM+Jdbdx+OaUP2N9dJoMH5tm6CfvAeX5CNXdBYqO3V1Bj39av9AGylB4gxZZPYcBS9PoCxWco4Ux+hkTPhv7ADpNRCfx1eHmiO6JLZ3fbzC574zCQOB7OPoIhihDf5dzAffxtobqwoMKOr5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=olu8H1ZP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="olu8H1ZP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso722295e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570589; x=1792175389; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=;
        b=olu8H1ZP2F9ofx8bANTSZ/xbDwAf/R9DqO+PpJjuN/+ah3QNpCe2FZ6MbJ7rzLb+fW
         bmC2XdNtFNVqdX7oSLwg+cgFoA37PmlXrcgsVNjyVCzz56IFnDQESpyPsNiG8VRdxGH2
         H5CNS0QkD63LgLBDZzXybnyBrzaOhcHBv3ICRYAGGfActagZGlwrIPBkB4XiV35rEq88
         gSRMHQCSU6Ww2L7ReP2cMgn6tPyahzjXUJ9dfymBrlvuCDIAIMn7+sO9YNNPhsD/hQMu
         FZoDsV2B2pG60y+OZkjjCVINFXyPjE8fWIMxpkgS/j55cnV3rhc3p8ZExonea0ocF08y
         EvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570589; x=1792175389;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=;
        b=r46V8bQErjp7fBOcVN2sqMhmNgGWNzFalXbr2vt+KIEWTvnhHl2cXwHNY79oA3sW2H
         7HIvoQdB+jekDolKKN5wreFIwqv73ESqOc5par6sxc4cTVddltuwqubObMZld8FI08QY
         UdZ+/2QwDpvt62zpeFdcnP8WzhVKNBrfmILJQaVvNDqdzhFTjFi4/xTMpYivMHWQp7oq
         gO6FSSLQCFsAZJJ9htb3wUdiAp7YoipBILd9w4C2Uhe187ZwPEZ9ckHdjA3c591wWmia
         +97GI/jIXUrXyd+a2w/r2i+qeeFQjILTVkgb/C3XkgqyKWSMxb4KbOZb58OrkSywivhm
         nH8g==
X-Forwarded-Encrypted: i=1; AKwUvByQzI1bwBGeoUpMjYXBegH91JX1AWSu9bUHo5vKl2WvWD2Dgmc5UGvQomNL/wzeXCwQrck2oO9/Iply@vger.kernel.org
X-Gm-Message-State: AFuF++kBM4Ma/BoxMNU5HjQ4FpI/enDzqJWeRvXvnMeG2ldPb41lwR1e
	3T8pQNWPi6uJhQpE6TPYWCR4tupbDJ0ty4t2iZVLTDxTJzgoFh3VcNXB2OAzTqkadDQ=
X-Gm-Gg: AYBFou17H7sp3LGNZPPGZrFW5s0imglHErKMU12EtbPIZ2CSxdydzLPAm68vqZqqqKU
	kzFIIhd7EYHmGztM0/WnYV2LsJsAcvzrfk0TBMM/j4ATM+AlNX/XY5qMhYZgDXMH7bBJBsfg1Sn
	A8H3+adGJW4XmfC8BfoQaXSwfbsVkUVxpqKksVPPiRdxVdK918SHbIThLDimCGq9cy2i1pCsxba
	37Rk/B9d1UejlHKQA0Kucl7CLjPqrTJ355IKWuPHhR48RjsedTEvpLJYuZvC9oHAFhaOn4ShS66
	5Sz1VPUqzczDX04FYY8Pqj8zf6scwYjyYRHEda6J1jNEfevGjS1JvOTotQbsrSSPwxpx5gRtU6t
	RRbTWVe9hWr4xQmdMTuiUwgjBOursEZPx7z+zckwOTvr2kg3ezIp/gxhLpFrmzzuYGyAgK3aTqz
	thZp/J3Fu8di1DkuR2L2KYEw89Mtl+9yhqrBJwP8F0EruGquEplQZLWkwa4MkTY7kaf3ltJZB7E
	a8r1S/saiTo0CB12A==
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id 5b1f17b1804b1-4a18e4b15e5mr55128945e9.35.1791570589461;
        Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm114582245e9.9.2026.10.09.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-11-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-11-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057525.266328.2342228871690409432.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=809ruaTMybxoBOwSxW5LNdKvnaeznfCg43/YlBzIRDs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaalPH3NE2e0yVH3ywbj/cU+LJf2Wv+Lbl9w5tQLk
 95SgX19HaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIq16GP7zHCkMuaij6vE4R
 b+Ccd8/F7X+5hcDml62ex02ePJoewMjwT33THh+p0KV5z6X4exWsLCetKYj4Unk0aG+CsF1j3Bo
 eRgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 52d5d1b18104..e8d9017098d3 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -9,3 +9,4 @@ clk-rtk-y += freq_table.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
>  obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
> new file mode 100644
> index 000000000000..cd520c6e1259
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_S_CLK_MAX	5
> +
> +static RTK_CLK_REGMAP_GATE(clk_en_usb_p4, "clk_sys", 0, 0x8c, 0, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_usb_p3, "clk_sys", 0, 0x8c, 1, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x8c, 2, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbusrx_sys, "clk_sys", 0, 0x8c, 3, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbustx_sys, "clk_sys", 0, 0x8c, 4, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbus_sys, "clk_sys", 0, 0x8c, 5, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbus_osc, "osc27m", 0, 0x8c, 6, 0);

You are requesting your input by global here. This is wrong.
DT names are stable, internal CCF are not. You should not rely on this.

Either give it a name in your bindings and use fw_name or use index

Same applies to the other controller

-- 
Jerome


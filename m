Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574470;
	b=0C5BIxsdLO9iXYuw5o4guETmJTp1MnvOp5u7FMo12VbjodIh3g9Qyli0q3Z7T69ocbHa
	 ftje0aW7gSvrzpzI9n0g6sW5jEYPVMRRE2u6tkopr9GYR9r8WziUZLZjAkpbgmiA2Aqg9
	 Y8AtNeOlTWNWb+FL//lUEx+rWPa2TBSTEnqpR7Xn2UgDucfCi6OzO6u0+QS+Vf8lIqpiR
	 UCwXhLgimIKpfPWYC7oxhCH1s6H75yTGQIiiB9PL8PphLT3RXTzwX1BRPmWgh1dLI2L+a
	 Y/fDSQ3xa1qyNZRPWrp32W00AIdgigyJR6cKtRzSRYZVt0ERT3QeiGVtUzocqATgjmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
	b=jolXSI2gBYyQYDWooh85fWew5wCsedRBFudi7HZtK4qG34zbE5HgP1mPfumnQhOuHuag
	 62tXmgrEIdie9k/UD4lC2XE0lM2KcxfQOebCygNmzWKMPZqFFoNXU8ttvmTZGgnYfFCFy
	 BN9GAv4LHTnrkbkB5wK9W4/Rt4SHql+QuUVd/Np2JM6FvPtmVK77UxC7PgyyKVBczz4hq
	 9xkCyFdKz68tr63rc8Yz8M4tmIYTR+QXpiet0IETE2kyhfnEfX9KPDyxnLstxKVh1wu8O
	 sDXkucng7edekbWJ/nofzjbso1/l3+oF2vTyaR/nNQTni2y5KuSaq+71tu/F9Fu0MQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B832606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B832606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1759977a12.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574467; cv=none;
        d=google.com; s=arc-20260327;
        b=bp7pKxxhlXplaISTitjLRKdMQMi2492VH1keLODdQmBkwT5Abqnu14tzH4BFcnl6zh
         4znmXwZrvsMnDkJLu1WV4rKThxukigpPzMo81L6Gyl5gDjYMM7a/zJHr3ocjHp4k6R+K
         gC7Newd7Nio1tBvad1GKwjtem+gp4ZjQg+78vEqw+CvoETYVhkxYBhnP4pYlmknrV1Nm
         GTb+LFPUz4ewngHyoahDWG5yQpSL70mgfz/8Wry6VRLqjPT1wu8LlNORTftl5mqE4Us5
         5l2Fv9Ba3uBYF3ItbsHQ7DRfTy4LCfrHy0D4JPajy1gE6E3Jq/otShxhhrwC7m500yXl
         XZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        fh=McO4z2lH5adk47Jiqb97vzC2J78mTJs9A1eNMQYB92w=;
        b=Z/4hnQJSL0T4Ml8W5YLz9Lsu/toy73XafUg5hxmo24nURU0x5+T6nxF/sCj0BXfRWP
         lv7qQ5XvgNiy0N9ITXhdyb/eTXSMI8UwN047r2NzGcy8xp+A7hRdD4e383boSpCxAHqt
         Jd9AKWV2SGya61MpyElMECKe4pOOyTyOjKL/cLDsNm40Stqb4HcYb7RwxPwZfT5TXAmZ
         OmR3m1JOAvrpY/pWZfIi+6Pxw2gBEtKFVBv/tw7mj8qYwATPKBJWZU4JOifa4PAmLS6Z
         GIaup77bkSjyanKIUctmsZuIu8JGe7WGX9OysXPqUnPdfw/Ark2vISx8P1uHhYOlSzLj
         s9+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574467; x=1795179267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=WKaeb2l4pVzBS87XlMfPO1VmDqptC/3pLusWhgieqeXXXbpQOD/MIp0MA41pPGaSFE
         UGPcR7i6V3UxRV/TUJfwrRDVWP1rRhkfW2bv5f3NKIh7u65gSoBnWc3Smn0ZYEC1mG59
         9c6J0EwwIbANh6fVCNqaE+Sh+OrShJvWjxXx6MXf+bORf3/36vfNUdBbbOHoGqqHfsEC
         sjhXCaXM03ov3jzCLS+fNlnP85J/nu4r9Jy4UZgLRRt4sSmQTCKs9VTP14lzhYH0OT5X
         XIqDjGH1/R319J2ZswfccQWGwNAO+p9bfzHnzjuzlF/O/NaF7SFfrUot6bmtetdPzbED
         pgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574467; x=1795179267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=jek2hOPr3I9wd3zTUKP5VB2X+NG2C4JGilCzJT30TOmwOnFsg+FI3Wkyc/8HRamJJ8
         I/+x5wKuLkE0DQYKg50oJZu6OziCxIrHzHYuxmCdthj6SUBo9N6MtuobnRA5wJtlJt/R
         b9F5ys+rW0XPZxjQTnpPWdklr6Kx8ukltm97JRUDCFzTFKIF6XZzyR5CiA4JmFkmAefv
         5+Hhf0CIv/FQubSjy2n1aQl0+aUY7ZjdJXpXw7SIhtJPmy4kz+bJty5QK353Ny7H7tVA
         nYh03mZ0ii9gJNw5Bx/u+I/raLTu4q1oUlJyuaw4bKyxcXccQb5Nh7Skcgl2MnxdBDgc
         bRBQ==
X-Forwarded-Encrypted: i=1; AL+hErHR6JHboe6MhnkcJWAxNhZ8OnZ4MpPqPhIRHB95NBSY6aNIZftJnFtRB3IGD7ZRThGydwaqnJ1S21mP@vger.kernel.org
X-Gm-Message-State: APuU4Z+twupVlCPE0UhZd0qV1BWV/GczPhwVNA7C1bkAt/CLjP5G9WXR
	HQlcFF9LuyL5YgaHqToKPgB5R5VpTbD6QYPZ6HlpW6ZexTBYzwi1AOoTeIK5sxeJQjpvo7pbgYI
	s2FVuoRXy6nExGirBy+XY8ON75nGFxV8gVNLJxHYP0A==
X-Gm-Gg: AYBFou1WBAkzwGM3DSVN6LOpIvbyc8WQZWFPX1BWi+rY14j9I5IaAnYxs8IUn5pEdwU
	EQb31LrQNG+USFhvjV/xwWAV6AMO8Wfko64nd0DuzMkpU8fFoQrt1GJ9OfHJcpcQWzd9BHUy7Fd
	UgITLKmAngTbtFLNl/cRvDST2gx3jOl9V3DG2xrKFTW2n+mN4gFlimGTmM++V5jj4Lg9brrAVxu
	yBSe11aLNQpRC9YPkfuuAeA5MYwSbJWvjbNp96clmxebbmpmaJlej+PUkfIlmDKWop7fRiKmI50
	euQ2PORyOH2jGkMw3LkamOl1CPjlqi7uBxXSeZiBil6o2QmaVLUC7ZLAVfA+Ii/aU9sbZblSnlE
	sKRpftIYbssaCxdvSbvy3sdiVqsale/tLv0T5q91Z3zilXjrlZRi6P9MMQ/NWAra2g8kAcg==
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6b7c0d166cfmr1777902a12.40.1794574467313; Fri, 13 Nov 2026
 04:54:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-9-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-9-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:54:14 +0000
X-Gm-Features: AclHuK9WcGq9tEUmProC1B7yOVe2Lz9yBCRU5dHo1y04eEg6YkemqWw0onfqCbI
Message-ID: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block peris
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_PERIS, this provides clocks for PERIS
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> index dcf58f2459b0..12b5ae54b560 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -18,7 +18,9 @@
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
>
> +#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
>  #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
>  #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
>
> @@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
>         .memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
>  };
>
> +/* ---- CMU_PERIS --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> +#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
> +#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
> +#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
> +#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long peris_clk_regs[] __initconst = {
> +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> +};

Same comment about preserving register state from the bootloader when
powering off/on PERIS block.

> +
> +/* List of parent clocks for Muxes in CMU_PERIS */
> +PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
> +PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
> +PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
> +
> +static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
> +           mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
> +           mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> +       MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
> +           mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock peris_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
> +           "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
> +           "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +           0, 4),
> +};
> +
> +static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
> +       GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +            21, 0, 0),

The Linux clock name strings look wrong here. It looks like you've
generally followed the clk-gs101 clock name mangling in this series so
it should be "gout_<block-name>_<IP-clock-name>, but you have
"gout_IP-clock_name>-<block-name>". I know there is some "name
diversity" in-tree for various SoCs, but with new SoCs using auto
clocks I would like to keep the naming scheme following a similar
style to clk-gs101.

Also I guess with auto clocks now enabled from the start you may never
need to expose all the CMU bus clocks, but I worry a bit you may have
mangled the names here a bit too much. If you do need to expose extra
gates you might get name collisions. For example in clk-gs101 we have
both

gout_apm_apm_usi0_uart_ipclk
gout_apm_apm_usi0_uart_pclk

So we kept the _pclk suffix in the Linux name to avoid a name collision.

Thanks,

Peter

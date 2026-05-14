Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A80C42B725
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771803; cv=none; b=OTGfHgUhJvCOfSDCrLTXbIW8O7UoCB4lZJ/EzKUCO2fNrL7gjj0SxF+1Ap5xZABRNzuD77p2IXHAVL/Ulgv7/kvJ43F/lm0fuRTtl9zJr63xv79MbUOcDcfXwXQbSk+RKHfsnwhC4Z1GcIXfmW7SvjDRedDBczq5Y4Q63EzFyEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771803; c=relaxed/simple;
	bh=JlaLnqKqVzBlBbR/m2iNu+c+iF0VYSNWB0X6/Lp/f6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X6vxq8e28rcnRHRfBU1rdI6GsDBn2RblsJl56NP6kkGShl6oTYbV+U20nHo1yC0N0TtKW3GAShD4CtLrd2DI4eZH06CAkBDDW5lID78ERvaoEw++ZNr6+SE6kIO3lwd99NI/GWcSB/Zq/5Uazmt4YYFwDjXSxaLqT+ubXn+ztR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=mNCTZR8C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="mNCTZR8C"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso86829815e9.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771799; x=1779376599; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx8lC1fUKhwWFd1n2FvjAaQKoQIAt3R5OYaP0iJN8Cw=;
        b=mNCTZR8CCH/KaavB2m26tr4APcOER8ign2lX4g94xRkckFX5UjzrbBzmTGtKcct2dF
         LYVquwZChJ24bnHqJHimy+N4GX9A/HKJl6HyNz1Lxi9jdirPfNAHQgbCDROrGDGgXHFV
         s3eC2Aj7NVhhu2+e6d0og6zbYCCQ3dgEn0Y1fH19nfztJv0zehENkVBXuDYKcG2PzlIu
         lG06BMaZVpcF53CdYQKUmidTe7v2mopAWBuOkr5ddCq/A1lRSzZzwcpbSRMdy0JLSumZ
         nfddTw+dckyZw5IkPMLcZ0SYJ/kkvXxuptr5hGJNvyJKKRXHltdDHYa6PL8lm1db1gR0
         U6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771799; x=1779376599;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wx8lC1fUKhwWFd1n2FvjAaQKoQIAt3R5OYaP0iJN8Cw=;
        b=qGfz9Un3xjmDrkIFGsLNkELVDlgoc3Z+XNecMf2aHxPe4LSzPJX9/YI86mWVh2I3fN
         WxKqFeFohYuy8jir9MJkpUIt31BgveTt17S9BdCUxgVdW/xwYMPbYqylN3Hmijdw1MrZ
         NqPJ+yjFh9K8dByamMWZ5xp2GLf5LI4DZ9KcUL5QiNRZuCVhN8e/SZldNOnZaICqEL+V
         fvmCBgFdQoROB1YwbugHlcVrprcYyUgWZpNGZp3ZMFcDojqM8pZ8p4Yf2ukpiiLyCvvk
         VbXrEWiCmFAKG5TO06PJSsBvaB1PbdmaEQRYtp539T8kgDfyo6yPc68HyahkAOT0LNnm
         ZJMw==
X-Forwarded-Encrypted: i=1; AFNElJ88uMWqTHYGsG/Ti00wBOdZrygTEmCQ1oj6ar8LmPjDp5SmnC7XSwB+RWXRw/2exyXEscZbw5MSsGup@vger.kernel.org
X-Gm-Message-State: AOJu0YwLouOdOo3m6CeY01xw9Gw9LAYf9FU+dL45CKeOuOL36h/kfJ1C
	jmM+LYYEi8M4PCjgUKtg8PrkeisciLtQK4BTaFS+ChWkF+TaHRaN6Qb0/RHcjlUB5VQ=
X-Gm-Gg: Acq92OGHV9DOtqv+r2LOndz92hX/v+LLn1LrUB0A2H0Psqha0r2okAhGa+CDcqjoWbT
	gwGhqsusgz11IGDNO4UeRNQI9kCPS7367Cn2heqBAAuE04PW8sYbpKfwrpTuMlVD8kQNcapwwZA
	lSqJYPdrZsHRWf9LXASjeEHdpMZAf2LfhWQQdcbMnVUiKl2a324W919I7xDS/MRgrQBnnCheEV7
	/hyjmDDEdz9mxKmzaxzPjNvTJ6xf+4TNfsL1xZdIK9e4ZQpui1S+mjt+GBMbEDvUtKFECCKMIW+
	pIzbw7u0msJBXZmhcVpzweIjNWIxtMnO/2X8RWzQQeooaoAmEX1gvCkgZwdUMRuVTWXQ/60eHES
	a9hzkAAqGJazIcntOWqLifyP4VoC60Obz/XtO1RhMSp4Y+8+b2+ztlUqypILc2oElKDeRdH5efe
	z3fB+wciIKHplrjDajaJA=
X-Received: by 2002:a05:600c:154a:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48fce9da5e0mr109291805e9.18.1778771798692;
        Thu, 14 May 2026 08:16:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fd7290007sm31793235e9.5.2026.05.14.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:16:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports
 active-low configuration
In-Reply-To: <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:28 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:16:36 +0200
Message-ID: <1jmry26my3.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> In the A9 design, the PLL reset signal is configured as active-low.
>
> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
> is active-low.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 5a0bd75f85a9..8568ad6ba7b6 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +	unsigned int rst;
>  
> -	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> -	    meson_parm_read(clk->map, &pll->rst))
> -		return 0;
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		rst = meson_parm_read(clk->map, &pll->rst);
> +		if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
> +		    (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))

Again not a great usage of binary ops. What you've written above is the
verbose version of a XOR.

The code duplication remarks applies to the rest of the patch too

> +			return 0;
> +	}
>  
>  	if (!meson_parm_read(clk->map, &pll->en) ||
>  	    !meson_parm_read(clk->map, &pll->l))
> @@ -326,14 +330,22 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  		return 0;
>  
>  	if (pll->init_count) {
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 1);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +		}
>  
>  		regmap_multi_reg_write(clk->map, pll->init_regs,
>  				       pll->init_count);
>  
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 0);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +		}
>  	}
>  
>  	return 0;
> @@ -363,15 +375,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		return 0;
>  
>  	/* Make sure the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +	}
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  
>  	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +	}
>  
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 97b7c70376a3..1be7e6e77631 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -31,6 +31,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  /* l_detect signal is active-high */
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
> +/* rst signal is active-low (Power-on reset) */
> +#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5E4279E1
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771469; cv=none; b=fLj2s+faAJ+Y+/X1pE6MyEiu7ViPymODn7NLszQJ4FQdc23hgLkPUc1bdfzGgpWVycjgKXkkdi6I43u7RDPUJY4T7X8wCOiudo6iRRvcgLykCe8J0f42KHVoqIurxeFJmuq+MD9vMHH8GiT7vfPEgOEbXI35e7UTuzmI2IMUwpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771469; c=relaxed/simple;
	bh=X29Tb+mU4TU588xEduaIV39ZONcE1lEFKkviuT7INIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sDAqOlPxPuLnTSA2tJ82j1GpDTizOVE+O+yjjW4UvElHvrQ9BfP+g/dEFc4hi2B/k5ATykqDT+hm04H2NfYNfyelKyM8kuJQDqPuUtnCgjuyrPPb/CrasN6WX6kGWB+0yrzeVe+oejettYdvFNmduVlf5Odu87sHmGYsDAXfhU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=f+Jhf3rI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="f+Jhf3rI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44a74032ff8so6042331f8f.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771464; x=1779376264; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02NHwmt4Q/1Wwv24vtMYzG1XiCeSXVTnDMbrgdzumy0=;
        b=f+Jhf3rInAWJISlES/J2HSya/j83Xk83OmQUGQ0ULbRay7TjVRKSXlzWlhLlkCP/Bm
         bxo50zm4ECPlqq1H/0fUiOsf0JeWfxfkAWyzzYwTCHbJlGWEeAaRSVEDjdoPWIEGY91M
         9ATApBtJOmVIfmfs7EciJ40Sj3a8ONF3XqVFHF4ugLxosnwPDQmg7xKL3dO6lnb9LwN4
         8ZAGavnrjm31qOQYoM+N0Aw3bE1KaWtgogZZCFIgSN8zldjSZRGkjJAM2KRlKTp+6ziQ
         +zKwkmn7/Gquk/0mMnRc4iVeZtlfVCyvCVUsVMI7boI4N9X9r1Ed70skucDH7fuGbMgY
         9Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771464; x=1779376264;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=02NHwmt4Q/1Wwv24vtMYzG1XiCeSXVTnDMbrgdzumy0=;
        b=PaD2/8CcrAUuUd8I+2MP0WJRvALXSMBf8e0wPQlxLpDiYt57NdTZ+G0KlUhyxNsTi0
         eAGWPHx4lJfrZtqQa8JBAmglD/MpGDq7YhTA/N5i6Q5Vo1DgW1Q20yU3DNU//pCEs9VM
         helxxw7dbwMk9k23qUBUT8qYlgj2PchWuEj22j6mGDDnDjmx9HxjKRBNrrEHdxsoxZ4g
         L9I4OyPRNfM0j3aa/xE+QnRIcZcGan7rWQ7p4t2Wi3yGI+VL6GmX8TqsrXl6Nl4XmqQM
         ZBvXOyebIturbtgDgXnDQcWJCFvRns4R9K/3w+lBocwGJxBk1Qn+gmBb4f1aSRFYpeIj
         xfhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dqSMSj5U0QbV70QLXFbrkUoKfz/MbQK+RCpUebbbr88m+13EVD1A3urannXVkmRp/gugsSEQBv/0E@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaCsDtYwjfYuNrY7aEmZ6NvFIdIBk96UidJ7BriE0H3dlo+xo
	lEfDu8Uf6PoevMKCwkaOs0QI7bl0nZ9nWP4bdcD5yMMvBdO5ODd+puqZuSZjIbiMhLc=
X-Gm-Gg: Acq92OGtE/LcLNPcHqN52qpBD/lHWcNSJioATi5RyG5giEdrzG48RULI4trS5mne4AP
	eNWAeKfVn+g8jzuEApXVtSUO3EMjg5ezDaY0OsaSu7aZX0IkrdfeaMKs8dQ5cV6HeU5u6WRJ8aN
	Dj5xdM9p4GX7kP78BTAJQkZ2xIVhgI/ylwmKbwHSjgF8WeqINC/G5FSj/h1XpUQIdugPS+LR8Dq
	0xMCVqyiSG0Psj2PQbf10uhxuzVy9MXSKogSDXD26m/AbE2+2OSFSw7ewQm/vrpyfqq04NAl6MO
	hFKJiu478mH0drNw/4uyLCg41QLNDum454XoR136dJYIcNlK3DAJYltV/OtPb1UU1APri44po5g
	U3qgBqL9JAjSRQvNG2CdpANhLoejvtSO6jf8ltEOe37TH8UXBP9itV/2ESQNiabl4SUqquWUYxj
	QXOZtFDgMZvW+NZIge3BOWeIkJ8WTY2w==
X-Received: by 2002:a05:6000:26c1:b0:439:c62a:6dc2 with SMTP id ffacd0b85a97d-45c7bb4a90emr12856516f8f.41.1778771463953;
        Thu, 14 May 2026 08:11:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ed30110sm8047555f8f.13.2026.05.14.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:11:03 -0700 (PDT)
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
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:29 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:11:01 +0200
Message-ID: <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
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
> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
> duty cycle of 50% after predivision.
>
> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
> pre-divider division factor is 2^n.

I understand what you are doing here but I have to ask why this can't be
implemented with independent dividers that already supports power of 2 ?

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 28 +++++++++++++++++++++++-----
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 8568ad6ba7b6..49483e431d44 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -66,6 +66,9 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>  		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>  	}
>  
> +	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
> +		n = 1 << n;
> +
>  	return DIV_ROUND_UP_ULL(rate, n);
>  }
>  
> @@ -83,7 +86,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>  	 * it would result in a division by zero. The rate can't be
>  	 * calculated in this case
>  	 */
> -	if (n == 0)
> +	if (n == 0 && !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
>  		return 0;
>  
>  	m = meson_parm_read(clk->map, &pll->m);
> @@ -103,7 +106,12 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>  {
>  	unsigned int frac_max = pll->frac_max ? pll->frac_max :
>  						(1 << pll->frac.width);
> -	u64 val = (u64)rate * n;
> +	u64 val;
> +
> +	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
> +		n = 1 << n;
> +
> +	val = (u64)rate * n;
>  
>  	/* Bail out if we are already over the requested rate */
>  	if (rate < parent_rate * m / n)
> @@ -142,7 +150,8 @@ static int meson_clk_get_pll_table_index(unsigned int index,
>  					 unsigned int *n,
>  					 struct meson_clk_pll_data *pll)
>  {
> -	if (!pll->table[index].n)
> +	if (!pll->table[index].n &&
> +	    !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
>  		return -EINVAL;
>  
>  	*m = pll->table[index].m;
> @@ -156,7 +165,12 @@ static unsigned int meson_clk_get_pll_range_m(unsigned long rate,
>  					      unsigned int n,
>  					      struct meson_clk_pll_data *pll)
>  {
> -	u64 val = (u64)rate * n;
> +	u64 val;
> +
> +	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
> +		n = 1 << n;
> +
> +	val = (u64)rate * n;
>  
>  	if (__pll_round_closest_mult(pll))
>  		return DIV_ROUND_CLOSEST_ULL(val, parent_rate);
> @@ -173,11 +187,15 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
>  {
>  	*n = index + 1;
>  
> +	if ((pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
> +		*n = index;
> +
>  	/* Check the predivider range */
>  	if (*n >= (1 << pll->n.width))
>  		return -EINVAL;
>  
> -	if (*n == 1) {
> +	if ((*n == 1 && !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)) ||
> +	    (*n == 0 && (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))) {
>  		/* Get the boundaries out the way */
>  		if (rate <= pll->range->min * parent_rate) {
>  			*m = pll->range->min;
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 1be7e6e77631..60b2772a54c8 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -33,6 +33,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
>  /* rst signal is active-low (Power-on reset) */
>  #define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
> +/* The division factor of the PLL pre-divider is 2^n */
> +#define CLK_MESON_PLL_N_POWER_OF_TWO	BIT(4)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

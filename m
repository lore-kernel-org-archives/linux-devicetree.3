Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1128E42B73B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341411; cv=none; b=MiMsA958ws42w8jUm9eMuxZHQgXsr1Vs3SELkVkr3hvw1oBu8eI5mXtJbMvwLoiP2IBBvcqtv4xpHNK+WgOYMzfdAQcF6C3t80VM5U6q0ooh5NBe+vMA2RughUh+ofyEPZ3OdZMen9KrRQwnxo/CQKAoCdy6EM1IY3W0Vu+yFr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341411; c=relaxed/simple;
	bh=rra+HC6UW8ngg1M+w7ntsNH71CV+8l9s2Aq1rHgxNRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rX8ZYlNVp+PSwAvKUe0j6jeXCl5ZsfkNjAXuk0WPP/7JF/+oUySyzpMb/lMxFpALexCZFfU4Fh0eJVBs/ojnQB3W/wxVAZIgudMDdHqpNsxwozz1X6EsDQuCV2ipCOy9eOeJfIWKY3BYyX0sin6WRf4/HqksJL6HjIRjH0C7+IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l0lhylyf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l0lhylyf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d28b1930so22457205e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783341404; x=1783946204; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3nillUBzOVKmupjRSjEGs6YGga/o/TlBfybdbWa9Q6w=;
        b=l0lhylyfDBK0V3kS1BnCsG69PemtJ6uJDAgeDa17Cm/CwDBYWAL1ZJtDRCvbtU2elP
         4fI8s9kurynv7u7DCxEAjPtNZHwWrx/hVY29opwOjAdgte400NSDnNEVa10TBPdapLah
         DYyBerPVmyU17mHMvnv1MOQmcXYJc/cPjhBpA3Px5ufTo9EjLLn75cwmv1VHrt4QiRdp
         vWdGevZd4EIW2DATDwJf4hYqpEclC1abd0U6YzBXN5g8inSJAQ5hJgeZewOg5ziRuqcj
         Z+0+ea/t7z78ezFU07GflcgOVmOvfAAGtecRA8i1SV7ye03W5aUPNuZdPWof7/kt3IEQ
         Mtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341404; x=1783946204;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3nillUBzOVKmupjRSjEGs6YGga/o/TlBfybdbWa9Q6w=;
        b=EcHfUloaIzxOx6fA3SdRezPa6kn50R86rj8erHPl8B9N9Sff7Fo0tFLHqgUKrZb3yp
         QNmlgeqQxAvVgC4epVhIMgDhM1/u3Y0XZ2MmU+7gKu9newCGznTr2Uo4n6fhuXuTfzLC
         s43rv1FDAeCgeuRXAPXgeV+Y++rhrGN587LjXYmDQjHA+R0bc1fyoR/eHktPu2G7MKk+
         8w/WK3Qd/zZ1ECR3kV2TSQ9sZT4Rklw1tHi+Jjj5nA72e9J1aeRrt+QAPqPBWQJm2CXG
         iYR1PxeMalS5W3oM6NKiqdpRijc4JaxG78jgbU5dV7wS14AZDQC8Hka5Kc4s+oBUiW18
         w8Ng==
X-Forwarded-Encrypted: i=1; AHgh+Ro+IE4MtzLXMiYAfnXUJYIHgI31IY8gk/ayKRa5xuDO6LVWYaU9VZKdaBevTuuiX7t6n0lZCoBebl+F@vger.kernel.org
X-Gm-Message-State: AOJu0YxBE4O4m28DStXJgk+oEe10q91kL72GoQJrKwDlcA6yyLccuEb5
	TUGbdbqB4z/sjg49z39bC5E6yeqao+Y7b/u1piJVhJd/9FV5YltDkOXEyvnnxNAChnY=
X-Gm-Gg: AfdE7clCmHkGZkGXNzXUSRTaxGksjPiTI1W6Y2mzAuWmFF+4uT76JIFP6ID4FFMoHIA
	Lrz7vVXnmvt1xgMJ0hWgTtyDDnSbV7ytgCrHu7kVF/c/e0d1iWBM9RyM1DfYxQ3HOqdpm3WROZS
	JUB6AQ4byR0Xqaaj9B4mXNzlxzhpAZ5vmmlDu6hNQdP2aKJC1Di7OFQReJf4ocWJUWp2wrSd119
	DzPqH5gD3+dZUh6jF0aPsRtSBAcI26O3+1Jh/Qv2poYjZYsc9dCDh2vmF0mSRDtQOOovinj5a//
	E0sqNL8Wk7OKIW/++jzbEozRvpdm8kMG6rfZS5ij4R2ZZUt3x71wUnOvXltRCiitdW3MN3S9H+4
	f6XQiUNPjjvWEQALX4uxjzASQyYkycSV8IYLvDsDICgnfmwr4iZnH5LR4a/R0MWsgOW0CNT8TCl
	r4Tt3XJu9EhO8=
X-Received: by 2002:a05:600c:828e:b0:493:b6d5:72df with SMTP id 5b1f17b1804b1-493df090d47mr3392275e9.35.1783341404120;
        Mon, 06 Jul 2026 05:36:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c637bc21sm660820945e9.7.2026.07.06.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:36:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,  robh@kernel.org,
  linux-rtc@vger.kernel.org,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  devicetree@vger.kernel.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <20260706100635.E5DC61F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 06 Jul 2026 10:06:35
	+0000")
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
	<20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
	<20260706100635.E5DC61F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 14:36:41 +0200
Message-ID: <1jv7asguqu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 06 juil. 2026 at 10:06, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Inconsistent rate calculation between `determine_rate` and `recalc_rate` due to division order.
> --
>
> commit 39f872462c04ad724c3624b152234160de56a47e
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: div: add read-only operation support
>
> Add support for sunxi-ng read-only dividers. This will be
> useful to the a733 oscillator detection logic.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
>> index 62d680ccb524b..d1c8c7baa12dc 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> [ ... ]
>> @@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>>  					     req, ccu_div_determine_rate_helper, cd);
>>  }
>>  
>> +static int ccu_rodiv_determine_rate(struct clk_hw *hw,
>> +				    struct clk_rate_request *req)
>> +{
>> +	struct ccu_div *cd = hw_to_ccu_div(hw);
>> +	unsigned long val;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	reg = readl(cd->common.base + cd->common.reg);
>> +	val = reg >> cd->div.shift;
>> +	val &= (1 << cd->div.width) - 1;
>> +
>> +	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
>> +						  req->rate);
>> +
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		req->rate *= cd->fixed_post_div;
>> +
>> +	ret = divider_ro_determine_rate(hw, req, cd->div.table,
>> +					cd->div.width, cd->div.flags, val);
>> +
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		req->rate /= cd->fixed_post_div;
>> +
>> +	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
>> +						req->rate);
>
> [Severity: Medium]
> Will this division order cause inconsistent rate calculations compared to
> ccu_div_recalc_rate()?
>
> The divider_ro_determine_rate() helper applies DIV_ROUND_UP() to the unadjusted
> parent rate, and then this function divides that result by fixed_post_div and
> prediv.
>
> However, ccu_div_recalc_rate() applies prediv to the parent rate first, then
> calculates the divider rate, and finally divides by fixed_post_div.
>
> Since the Common Clock Framework requires determine_rate and recalc_rate to be
> mathematically consistent, could this discrepancy cause rate mismatches or
> warnings for clocks using a pre-divider or fixed post-divider?

I think the RO side is correct and RW one is not.

The RO part correctly walk back the tree by un-applying the predivider
so, whatever CCF does with the parent rate value will be correct.

The RW part query the parent rate then applies the prediv. This
will be thrown away when/if clk_divider_bestdiv() calls
clk_hw_round_rate() on the parent. If that happens, the subsequent
un-apply of the prediv would make the matter even worse. So (if I
understand all this correctly) this case does not happen yet, otherwise
we would have noticed, and it can be fixed separately.

Side Note: I've not followed the sunxi history behind all those
prediv/postdiv but I find them a bit confusing. It seems like inserting
some fixed factor clocks in the clock trees would accomplish the same
thing while simplifying mux/divider quite a lot by droping these quirks ?

Side Note #2: I feel that while sashiko is pointing out valid things but we
are slowly getting off topic and down the rabbit hole with it ...

>
>> +
>> +	return ret;
>> +}
>> +

-- 
Jerome

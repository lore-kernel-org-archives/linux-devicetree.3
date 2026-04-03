Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE03AE191
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775229060; cv=none; b=mTHgFu1/bIHc3+5CHjYoaKZk8E2igKIgV+3183hU8BI+V4qPp07T5dYsnYErNtEiL/67Td1x85EvnDY9E1h/4qovq6TzHBA5PkieIZO/6PbLQCu1GbRxaBLYg0Ge5Yh0sipcB0f/SMSArq/AU3Rpj3WuiDGuFbdksIANW850BA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775229060; c=relaxed/simple;
	bh=9I1I/BIyjb9Nx0MjMIMlzcmDOLFfYlve50gfaKykPKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlLrJE4d60rghYauoNW+lyQ4B9+5/BkRJ41DBYrpq2pMQ7Vlgx0HtDisp6GU70j06RTtYES2Bo0XepK3fVmxi6zq6lGE641eMAfcUtdrj7fa8FL1EqD7fCxE5FseJKVqNDWpQpgbnkgAKW9o9OWAJICSeuuHs/R93iDmRIr47co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N0ZectZJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tu/X2Pqv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0ZectZJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tu/X2Pqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775229058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
	b=N0ZectZJhoUu+P35J7SiPhC3kEUMOxofbMpyQ+epCQ9B8fI0hekzhPoZTi3dBmFVudfw5E
	IbPlWwi1J/Ocz514QtztXthUecwDy2QwWrOrZf+/1vNAOGaElfkdscbu9/dSQue7/XrQYW
	HcM4SoNnT0+b6sOv/39JD8D65IYX7KE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-UhYvn-wDPMmx2DCIDtcoYw-1; Fri, 03 Apr 2026 11:10:57 -0400
X-MC-Unique: UhYvn-wDPMmx2DCIDtcoYw-1
X-Mimecast-MFC-AGG-ID: UhYvn-wDPMmx2DCIDtcoYw_1775229057
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso27377121cf.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775229057; x=1775833857; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
        b=tu/X2PqvUsRhFwPrh7X4u6No76SFs2wpm0UqjBMcOSOhrQGfDoTrEprBl9YX4N19nS
         hBU26+7d2y1WywtWYH2GwFKDqCSSHEhlWaRRRQ8cigoM99+Mip4MHWnDYzzRwU+XCePl
         neaS99HMjFd1iAlGCQ2rz5fv0O7uyeETuq39vy5Bcd99+gzKspWRPG1w+FptXd/3Fi/M
         F4QMMjKHTGOCIQFp4G+6TKLPu5tjsERwhm3XxoO5hThmlb1w/rMRPaejXf5LeDuZUw+5
         JUUHB5AFRopdCcJ1yqO8iuZgOQ9Q/uRDJrryyAsdk7GlNGT5KlUPCzTWtVuGoYkzPbQ3
         bZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229057; x=1775833857;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
        b=MKSUQKzOsPG97fCUhWAz4W9TxgieMSeTUbNBrcdbQ25wWKSWlUrDAR81q2OoyBaTK5
         4SZZTC3Ik49wliNOD50gPW5UF4hNLbx5CJRriFiSfHqvzw2TsJiGGyQn2fXI+I0A7aJp
         G+eLz9gJ+/ZqcVdmeBhEghKNcl2FaurClc7oMwPTyisNmBtK5ZGOakKddXRcEq1leH0h
         TxgPga6WCpy513Fizm3fIon/DHQo5yFuoND/rdTszXj/0hhpyt7Ie2uvF9pYdjbXdjrq
         FUTt/Td54N+hNQihJzeMOwTW5WgmPDVi9EqEWcLzjuE+KfxWzckOVEVVfLS/BVPIKHFy
         M0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSBPYgZl70ZGjDww2tCX25tsKR4kpQ9QXNnSmOEH2FVgJ0yRO1sNPHL3xtImO8BOBn8a5heLj2ki2b@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCEx8LmO3SE13aPBRqXNMt8r1hdBiBHFwG1SGpjiRUVJckmFt
	ylVf42lm5UuzK9bKy8ANluzib0c3iH4kIZW4hsBkLBlGEkvxhwUxF1li/bQzlRGQp9f4FwgLiqm
	2/uqxQKYoNfoUoe2aitzQ20vVHGeARZs7wR+Ag3VHUxYNsvzVI+rWNF0i/yrrEHk=
X-Gm-Gg: ATEYQzyJo4vxBZdnMtQyfSCAiKCZ0MU+t+nA6Et2mAXu6k9B2v803TKowDprIvfu7lb
	IeCCi/32HOfR4tiCYb1FFpXxPmV2R6Dxdyyei5lTaCeRuXuO25QlvrN665jR/Hf5RHux7Atqgcd
	b2ipC4I6fCRfdGUcmStvI6Mecv4Yk8YRHLkkdOClfy/h34T2ks7n9pcCNCai3GXF3thpA309Xm+
	N4AVGhB1iMQSf3pOc56Ils1AeJTrEFAyn9bcyUklud9095glLZhsgfX+t08o38M2c6NAG3eNrlf
	qdAfLnDeoHTC2/ykW7WwkygBGewui2qXUp+zqsjTkKfneFz20ydTD7LYvguLLt/7TaomyTw0gMm
	TbHuS4IDgMYBnJgufvTmftuz0GjVk/NCxptTlX+yQOlDylFqmZpT5CWES
X-Received: by 2002:a05:620a:44ce:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d419284f7fmr493255785a.25.1775229056562;
        Fri, 03 Apr 2026 08:10:56 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d419284f7fmr493247485a.25.1775229056024;
        Fri, 03 Apr 2026 08:10:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596a0a655sm49296476d6.29.2026.04.03.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:10:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:10:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <ac_YfHe0dscb3MPw@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-8-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Yu-Chun,

I should have finished going through Sashiko while manually reviewing
your patches.

On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_n(clkm, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_ext_f(clkm, 1517);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 31 ... 46:
> +		ret |= set_pi_ibselh(clkm, 3);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 2);

Sashiko reports:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    Is it intended to use bitwise OR to accumulate these return values? Because
    these hardware operations return standard negative error codes on failure,
    performing a bitwise OR on multiple negative integers will merge their bit
    patterns and create a corrupted error code.

> +		break;
> +
> +	case 20 ... 30:
> +		ret |= set_pi_ibselh(clkm, 2);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 10 ... 19:
> +		ret |= set_pi_ibselh(clkm, 1);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 5 ... 9:
> +		ret |= set_pi_ibselh(clkm, 0);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 0);
> +		break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << PLL_NCODE_SSC_EMMC_SHIFT);

Sashiko reports:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    Are the mask and shift values mismatched here? PLL_FLAG_INITAL_EMMC_MASK is
    defined as BIT(1) (0x02), but PLL_FLAG_INITAL_EMMC_SHIFT is 8.

    When regmap_update_bits() applies the 0x02 mask to a value shifted by 8,
    won't it evaluate to 0 and fail to set the intended initialization flag?

Brian


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2E35EDA4
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775685534; cv=none; b=G/ZxZjPz8SOuZvkjKSKzAwJUuW4x9rd/ZdnmsaXaLIobMbIAkC3eDrwnyyVopLqIZLT5yEtYT1OoqKytjvbPPhIsWqxDccBirivpxAas5H3iDMrluSeUOY/FxfG4wS2rdgyI2DDQMd0pd3ME1d3VYsfd1vf9bkGcxTPuUDujFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775685534; c=relaxed/simple;
	bh=tjE9SYROPRJSd2mp6Br8BoEwlJBxJDWqw7W6mx+PZCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHFWptxa9STjbQHpWEORyf9tyHSadjcsu+oUAgRooYaiMgC+M1mYEu5qu+NeAivo5yBtHwNxMElDSECrQ8/dps3zbr9xbjre13YSjp7n7/PMe710A06iwoFEj8oik2KqsXLkvhJE4CxcXvp+O9wnBhs9TDTRwV0YrlKUYUilPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FGq6an/H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OXTxlhze; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FGq6an/H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OXTxlhze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775685532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LOm+wk33ypCInDRQOH/vSQahWXyPcA6BwjaghqFQOQw=;
	b=FGq6an/HBkDGQufxQ968eeGBiGeHHm79cUM/QsZsC5n99c4gIozd2sqL4Ou58vCD7YLnvB
	GbX/k24jaHXDrjdTWbYyJEKUcSSg+NaTa+pKm2hbdZtbdyCt24LZuSTmAl2El+/NDsLJm/
	EVHAC1AZbwM+JOw4XJDgCK/zh69PxxY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-OuC4CjZpN3qxUrt2x1h4OA-1; Wed, 08 Apr 2026 17:58:49 -0400
X-MC-Unique: OuC4CjZpN3qxUrt2x1h4OA-1
X-Mimecast-MFC-AGG-ID: OuC4CjZpN3qxUrt2x1h4OA_1775685528
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d984c74a8so10665371cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775685528; x=1776290328; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOm+wk33ypCInDRQOH/vSQahWXyPcA6BwjaghqFQOQw=;
        b=OXTxlhzetlt95MyggV4mJW6NY+9gw93BM3nrzGVIiAx3pXBdCpmECejojg6H2+peIQ
         /4DR9t1skbSlJv5VeC57VZfwuLbd2kb31nzr2sv3Lz+S2x2UqX+zLy/Euun0qVY5GZds
         mXvDl8xO4SZqi1GKQKQmDQGjX5j45pfnr0QapTCU6aHREJCJQSLQMfw/DRdQwPIRWW2K
         Qw/iPLh3wL7aJ7eWlCnx/SUxVo6bazbYjC4ewHpTk0ytANhP/DH2NFMaz3OhqVpksE05
         LMI3kYPK5RgJ4YANAGqY8UsYRMOdzRl5kAUQwm72F4GspX1V+HuNOYQ9dgcc2vLYdoWj
         9/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775685528; x=1776290328;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOm+wk33ypCInDRQOH/vSQahWXyPcA6BwjaghqFQOQw=;
        b=IaaJncodhFz8/p3l3qMAsrxqIDa7SOrc5LTUSXIUmSxFWWJAcoRGu8QiGSxK2P1WW7
         B+2kdDTnkwed91USIHjW88PA+ypTzecKerp9yKe8MSbAJIBVUt9pKhPT/Co72Qb9JPCW
         Qs7csl1B2SJKEC4GFi3Xg5diX1MPRVLEbjybNi9eEKfcNro2oSHPuQ42BIV6LVrCrUGs
         YbuKdRkYa3lYBAtj3g/0iDdLMw4lYK4u+S/PtdXEQ/HmT9J66rfcHZQejKK2uQLkGva/
         gczJtoEd4TtJRLM9kdlBz0IU9jXybjU9k6bCH8FyfTrnSwD3HvtsqGf1nMKiNzTfbbDq
         HHYA==
X-Forwarded-Encrypted: i=1; AJvYcCUKvZ/LcOFqQZASLifZotJ5FWwxDKSl+oLksCOcoknJnzsEbULyLDnqB597tidpQ0ubtYaxS0AFXsJQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5YpOsm+qfpbsNdEAuo59bS035ofyOEJ6G8+BM/IsjsnUuo4W
	jC8D7Uml5xiu4gxSAnhQTB/fcB+F8eAOeYZmnE9c6kpJodhn7/j2aULADYZoweVGjnUISJJrEO9
	lBSW7Y9XWc+BmTrjlVeSdMv7MjNy0Twaty/gPs/+kbgGdNPYm2Y7ZFGsdqEZUysc=
X-Gm-Gg: AeBDietheb0ojY6A++AvqUymHedNAVpWIiVPY4++j4QSDSHXWgzjPg1456QsLqbUYjL
	6IXdw7YVtw6gpEQWdkIVpCTknfibA0nQ/jKFmfqlKJs8LcxZ7SriBb3LpBzVloS7Sf3Icsz64sA
	eE8+8qc5Q5PhSeoBw/nNmu6Z3gvPuPvBb1alO+3sfkknHZ95AfM4aJf5d0Tq+soJ5BJAuWTc9rZ
	1OLm4rifwoseCpHgz/NptWtyhL4MMxtRhkjpASvLrILete34Cqs5sSojeUsyYUWnKccAq0TIWAs
	MSoAf2sbc02YEPRy6+TNDc3L4vmKKIRwo7ofd+kRABP33IABFPU7QsSW+hwmxod2TpkP271jRn2
	rKtoPsXytNwdLM5M0LfuuNXLz1k95urviZkz4hf/FZI+ERTm0FdH1dahx
X-Received: by 2002:a05:622a:514b:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50dabc3f68bmr101178231cf.29.1775685528594;
        Wed, 08 Apr 2026 14:58:48 -0700 (PDT)
X-Received: by 2002:a05:622a:514b:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50dabc3f68bmr101177901cf.29.1775685528034;
        Wed, 08 Apr 2026 14:58:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b8d0904sm170469051cf.29.2026.04.08.14.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:58:47 -0700 (PDT)
Date: Wed, 8 Apr 2026 17:58:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
Message-ID: <adbPlFzI7jrU9pCq@redhat.com>
References: <20260407211123.77602-1-marex@nabladev.com>
 <20260407211123.77602-5-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407211123.77602-5-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Tue, Apr 07, 2026 at 11:10:02PM +0200, Marek Vasut wrote:
> Create helper function fsl_sai_clk_register() to set up and register
> SAI clock. Rename BCLK specific struct fsl_sai_clk members with bclk_
> prefix. Use of_node_full_name(dev->of_node) and clock name to register
> uniquely named clock. This is done in preparation for the follow up
> patch, which adds MCLK support.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V4: New patch
> V5: - Include fsl_sai_of_clk_get() which returns only BCLK in here already
>     - s/hw/chw/ in fsl_sai_clk_register
> ---
>  drivers/clk/clk-fsl-sai.c | 90 +++++++++++++++++++++++++++------------
>  1 file changed, 63 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index 27925893c4c27..01c5e26f55517 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -26,20 +26,71 @@ struct fsl_sai_data {
>  };
>  
>  struct fsl_sai_clk {
> -	struct clk_divider div;
> -	struct clk_gate gate;
> +	struct clk_divider bclk_div;
> +	struct clk_gate bclk_gate;
> +	struct clk_hw *bclk_hw;
>  	spinlock_t lock;
>  };
>  
> +static struct clk_hw *
> +fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct fsl_sai_clk *sai_clk = data;
> +
> +	return sai_clk->bclk_hw;
> +}
> +
> +static int fsl_sai_clk_register(struct device *dev, void __iomem *base,
> +				spinlock_t *lock, struct clk_divider *div,
> +				struct clk_gate *gate, struct clk_hw **hw,
> +				const int gate_bit, const int dir_bit,
> +				const int div_reg, char *name)
> +{
> +	const struct fsl_sai_data *data = device_get_match_data(dev);
> +	struct clk_parent_data pdata = { .index = 0 };
> +	struct clk_hw *chw;
> +	char *cname;
> +
> +	gate->reg = base + data->offset + I2S_CSR;
> +	gate->bit_idx = gate_bit;
> +	gate->lock = lock;
> +
> +	div->reg = base + div_reg;
> +	div->shift = CR2_DIV_SHIFT;
> +	div->width = CR2_DIV_WIDTH;
> +	div->lock = lock;
> +
> +	cname = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
> +			       of_node_full_name(dev->of_node), name);

Sashiko has the following feedback:
https://sashiko.dev/#/patchset/20260407211123.77602-1-marex%40nabladev.com

    Does using of_node_full_name() break debugfs directory creation? 
    
    The full node name usually contains slashes (e.g., soc/bus@1000/sai@2000),
    which causes lookup_one_len() to reject the name with -EACCES when the CCF
    tries to create the directories.
    
    Also, if the device is instantiated without Device Tree, this evaluates to
    "<no-node>", potentially causing collisions if multiple instances exist.
    Would dev_name(dev) be more appropriate here?

> +	if (!cname)
> +		return -ENOMEM;
> +
> +	chw = devm_clk_hw_register_composite_pdata(dev, cname,
> +						   &pdata, 1, NULL, NULL,
> +						   &div->hw,
> +						   &clk_divider_ops,
> +						   &gate->hw,
> +						   &clk_gate_ops,
> +						   CLK_SET_RATE_GATE);
> +	if (IS_ERR(chw))
> +		return PTR_ERR(chw);
> +
> +	*hw = chw;
> +
> +	/* Set clock direction */
> +	writel(dir_bit, base + div_reg);

Sashiko also has the following feedback:

    Is it safe to initialize the hardware register after registering the clock
    with the CCF?
    
    During devm_clk_hw_register_composite_pdata(), the Common Clock Framework
    inspects the hardware to calculate and cache the initial clock rate based on
    the existing divider value.
    
    The subsequent writel() completely overwrites the 32-bit register, setting
    the direction bit and zeroing out the divider bits. Because this occurs
    after registration, the CCF is completely unaware of the change, leaving its
    cached rate stale and mismatched with the hardware.
    
    Additionally, since the clock is already exposed to the system, could this
    lockless writel() race with concurrent clock operations like clk_set_rate()
    and clobber new divider configurations?
    
    The original code safely performed this initialization before registration.

Brian


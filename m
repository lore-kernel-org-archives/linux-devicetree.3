Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03C434E50
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442143; cv=none; b=gLUCxgCrMKu/fijJAiJwySHy1ydikANcm2wHbgrhE92f6h6+aOBrCoF3u4Wbcjpoi2mRu1BkFjiY0pZKxSV8dT9mpw0DV+NekuWGfJoWRuZYHtrEZJTncqH43a+vV58KSrw/cYZpMUoIlJTakkI3NZAhJ+tVBZEga5NW1UTMe2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442143; c=relaxed/simple;
	bh=eLxLdQLsu+iaBBH+wLafSl6Y8TnZpHdXc7NJlDA1zv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjkXQneagsLt76iGviDqkZtK/+QlNzLV/wY3tc+Q+gl7CANTV/Sk3aEC1Bl0vieGtPa+nK0hQoyIH2ROmtr5Ianb6vQWwzok7Klkc3k6ARVVEnx9gD42VXcUgZ84pGwjXwBH1s7fc5B01afhyPzfw12LW8wBObBWzrLKByyl9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBYc/B0r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HlmTZxuU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBYc/B0r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HlmTZxuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783442141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hLXdUDx40KUl+OrKm3kL+rKhY0e13ruPLiiJQQF/qN4=;
	b=BBYc/B0rNu8GxNCId4QapsYJaW+7YVC2Sk/YMww6EWZP5GsvDbpqj0dOcAhLj0KrrF7DVZ
	TefbmDEDEmDoDwAYlDR86kPOJq7XL1nX8yDwQ8VUmIQ/pJoQAxXBiYGkkd7Z8UBNH0xxXB
	Rqt1GZx0Ng3KxU45X3kK0IfpoFBskc0=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-DqLj9K88MQidw8h9BMx9JA-1; Tue, 07 Jul 2026 12:35:40 -0400
X-MC-Unique: DqLj9K88MQidw8h9BMx9JA-1
X-Mimecast-MFC-AGG-ID: DqLj9K88MQidw8h9BMx9JA_1783442140
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bebeb08c02so543656e0c.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783442140; x=1784046940; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLXdUDx40KUl+OrKm3kL+rKhY0e13ruPLiiJQQF/qN4=;
        b=HlmTZxuUJHUadjmctAtM8w7tMlyhluR8yZiEPO4tRUurvZDgQjWcAJ9i+GIQ4i9MJ5
         qIIZqIarYFczxZVMNZ6S4HwNqBpEsthqRpi4g1h4GTeMxl4+Y/2f33rCVILH9QqWngJd
         rH6Sv7m42R9cGHXdtqPKNxLQNzsH6xzHbP1KmImnhmB4wUVWg0gKkZ4QMveJ1eubIjrR
         CQ6SPlJEHs1ed9jx91b2UAA39F8tkYmzU+iytEZXhcr47r/fNfz8S59XMlDJ82YVjf2l
         KzefTNgw4TGOVsNlZ/5SQK/UVv6dYtiESb1Sd+g9xkPY+AhW6ibu6qSHqwgbrQwg3Oca
         oYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442140; x=1784046940;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLXdUDx40KUl+OrKm3kL+rKhY0e13ruPLiiJQQF/qN4=;
        b=BKzCkqcVa+7EBFezzuEeNFb3xfjXThyLsEjQHGVzZedEJnGiUNBwyMUardwvFDQDac
         +dKZN2qvoN5yf7i3RHLR7rckUOHS033FXRD9TQCnCgGp1/YmKyBAUS4kgSkES/GK1Yhi
         /IkG+P2THQNkAQJsd55M61TBsUwTdlvDdnQ0EPKcKuPtlhx4C28VGMr5pQcxvuUCb06r
         PzgqFpOqIcJt0W/gxaBCE7vqGtKhXfEObpvZtV/dvEtcV6NIKiImSc9aG1kmMdKvKmmr
         8/PJTMqpZVaFGUUWD/70Wn/h4aP9xoF3M025QvPvMxarlO4SR7fxlFvZwYZEZfS38jN/
         nhzw==
X-Forwarded-Encrypted: i=1; AHgh+RomNN8XAr5/359YrBcUp5qy5YSqVzpRCVvwCrzgp6yTdc64prEXfdi74o1BpdiKyOuAB+JagxDCgZSw@vger.kernel.org
X-Gm-Message-State: AOJu0YwABPs1cAqa88bozlP4QSw53lVhYDg21ZQhpRQFCoCBTBibjwP/
	a+3iu/CgeD9chLEezxWmHCzzwW8GzKXwI4pX5nAmP08Djr5i+xbRVdIzZnW+ocBkWwcGpwB8Ykz
	CXBIBCI1Q0yft/xyQolu6IJ5PXILatsUzBjXNMV/EBzKPrLW/+SHhMHiXhuVr6uE=
X-Gm-Gg: AfdE7ckHMVPPKXsyRqpik7KvfMs5UPiFTz/gs90aK1ZJ2J5bUJ4xFIDbM1PxLLCMMQC
	ZYiPQIoxIpXMI0qV/qzlQXX9ROp6ILZcTsEKZUxzovk+F8/I1HDngXINYoiVIx9smULGTVqAjlT
	GU2Vsz03Hv7ZQB99U7cx/FV6TYwkyYHs11RT8FxUi8sv3CgsFrnX2h9urpbL61fPuWadnSq+opc
	hKyHvKboPXMRHeL5nCgVWDmgBHNLY1VfKcDnlTPwkwx9BVyfPNIuwk8wdGgFsJjCUWD5pYlWEoO
	UfLSqQ7xN+2iG5XL0HwktgZOSwGXurLRf+CXsJB7MzU6MXLIL+0Idvz5ARy7n6P+x8WaoY5bi4s
	0MBQ9Q6WV
X-Received: by 2002:a05:6122:1c84:b0:5bd:b2d2:a1b9 with SMTP id 71dfb90a1353d-5be9076525emr3484139e0c.5.1783442139581;
        Tue, 07 Jul 2026 09:35:39 -0700 (PDT)
X-Received: by 2002:a05:6122:1c84:b0:5bd:b2d2:a1b9 with SMTP id 71dfb90a1353d-5be9076525emr3484104e0c.5.1783442138832;
        Tue, 07 Jul 2026 09:35:38 -0700 (PDT)
Received: from redhat.com ([2600:382:7726:2cb:ada8:1d9c:fd6a:977e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96983899f28sm7201271241.3.2026.07.07.09.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:35:38 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:35:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <ak0q1pWZREYsvJ4f@redhat.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
 <20260630124413.1814379-3-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630124413.1814379-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Joakim,

Thanks for the patch.

On Tue, Jun 30, 2026 at 08:44:11PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

[snip]

> +static struct clk_hw *sky1_audss_clk_register(struct device *dev,
> +					      const char *name,
> +					      const char * const *parent_names,
> +					      int num_parents,
> +					      struct regmap *regmap,
> +					      const u32 *mux_table,
> +					      struct muxdiv_cfg *mux_cfg,
> +					      struct muxdiv_cfg *div_cfg,
> +					      struct gate_cfg *gate_cfg,
> +					      unsigned long flags,
> +					      spinlock_t *lock)
> +{
> +	const struct clk_ops *sky1_mux_ops = NULL;
> +	const struct clk_ops *sky1_div_ops = NULL;
> +	const struct clk_ops *sky1_gate_ops = NULL;
> +	struct clk_hw *hw = ERR_PTR(-ENOMEM);
> +	struct sky1_clk_divider *sky1_div = NULL;
> +	struct sky1_clk_gate *sky1_gate = NULL;
> +	struct sky1_clk_mux *sky1_mux = NULL;

Reverse Christmas tree order please.

> +
> +	if (mux_cfg->offset >= 0) {
> +		sky1_mux = devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KERNEL);
> +		if (!sky1_mux)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_mux->mux.reg = NULL;
> +		sky1_mux->mux.shift = mux_cfg->shift;
> +		sky1_mux->mux.mask = BIT(mux_cfg->width) - 1;
> +		sky1_mux->mux.flags = mux_cfg->flags;
> +		sky1_mux->mux.table = mux_table;
> +		sky1_mux->mux.lock = lock;
> +		sky1_mux_ops = &sky1_audss_clk_mux_ops;
> +		sky1_mux->regmap = regmap;
> +		sky1_mux->offset = mux_cfg->offset;
> +	}
> +
> +	if (div_cfg->offset >= 0) {
> +		sky1_div = devm_kzalloc(dev, sizeof(*sky1_div), GFP_KERNEL);
> +		if (!sky1_div)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_div->div.reg = NULL;
> +		sky1_div->div.shift = div_cfg->shift;
> +		sky1_div->div.width = div_cfg->width;
> +		sky1_div->div.flags = div_cfg->flags | CLK_DIVIDER_POWER_OF_TWO;
> +		sky1_div->div.lock = lock;
> +		sky1_div_ops = &sky1_audss_clk_divider_ops;
> +		sky1_div->regmap = regmap;
> +		sky1_div->offset = div_cfg->offset;
> +	}
> +
> +	if (gate_cfg->offset >= 0) {
> +		sky1_gate = devm_kzalloc(dev, sizeof(*sky1_gate), GFP_KERNEL);
> +		if (!sky1_gate)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_gate->gate.reg = NULL;
> +		sky1_gate->gate.bit_idx = gate_cfg->shift;
> +		sky1_gate->gate.flags = gate_cfg->flags;
> +		sky1_gate->gate.lock = lock;
> +		sky1_gate_ops = &sky1_audss_clk_gate_ops;
> +		sky1_gate->regmap = regmap;
> +		sky1_gate->offset = gate_cfg->offset;
> +	}
> +
> +	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
> +				       sky1_mux ? &sky1_mux->mux.hw : NULL, sky1_mux_ops,
> +				       sky1_div ? &sky1_div->div.hw : NULL, sky1_div_ops,
> +				       sky1_gate ? &sky1_gate->gate.hw : NULL, sky1_gate_ops,
> +				       flags);

Please use devm_clk_hw_register_composite_pdata() to make sure that
everything is cleaned up in the expected order relative to the other
devm_*() calls.

Please go through the Sashiko feedback at 
https://sashiko.dev/#/message/20260630125936.E186A1F000E9%40smtp.kernel.org
and I'll do do a thorough review on the next version.

Brian


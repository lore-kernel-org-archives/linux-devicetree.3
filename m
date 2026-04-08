Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3C63A0B05
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686352; cv=none; b=qd+V6MM1PqYsAGegGo0LgFduNsDxc2Agym6m8jdll9m6QFBQP0elxxh0FCmJtb0JXnAH7IJxVG62TYqMArD+FEwijkNA9ka/f+fJ4Sawd3QHoXsoqkijwbJFss5gq+0U8aHntyOEvrOqnKGNAjDzkKHqCf3o7ETtNEVFeW8O5Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686352; c=relaxed/simple;
	bh=aYvZiUL14h1TcpUOmtaLqfZqQc3dSmjKk3UM+S590C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHkMkiZHoCxSMtZPHoKNwBOTqXreW1pvWT+mjzTqzTlm2WdUCoVv+e8GuK7DvTUPXPnvQgsrnFnvYipDo74lpMHFw+lsf9rXUXTKJ13UfPCf9UhMkNr/oNplSvgYBvMeb2J0IfIeVyKjLVyj12xZ6jajjw6O1oHk3XuH8zcELwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YfuR+ouq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDuUElIN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YfuR+ouq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDuUElIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775686349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fym2LzOOWtP3DEfhBZ50aXf6HMqAJm+7igjBImlFTbY=;
	b=YfuR+ouqdXc5pTOI9qrgS1tQXIZuzWY2znzS8NJ4neDi4A9WdpgQetT1o/ieWsvxWLjBE5
	PlE5z3WLepZ/JqIKaG+LDwF73YI814J1WNDnti0Ds7F8x4tOO/b32/F33Yoc36OsZz37jv
	6SN3s2kcWNPmMW+dwrDZ+Bz9pFo91DU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-k-jl5c7_Opecf7ahu4Sw1w-1; Wed, 08 Apr 2026 18:12:26 -0400
X-MC-Unique: k-jl5c7_Opecf7ahu4Sw1w-1
X-Mimecast-MFC-AGG-ID: k-jl5c7_Opecf7ahu4Sw1w_1775686346
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso6753081cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775686346; x=1776291146; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fym2LzOOWtP3DEfhBZ50aXf6HMqAJm+7igjBImlFTbY=;
        b=bDuUElINiZxXQxTT2GuxJOXQBPc6kRBq3+1ogURKPvHR7WCh/DZPqSIIqr04qf/7dl
         kGBYsA+NwX5qAcjvuj5Eg9YNlQIcWZK6BuMXITtr2KbSGFElf+VRaUf3XBjC9VKyBYzA
         DZuTelt3lObSWSYbOLfHvzo0C/kKH7xEAeAA+XfevOk2apmNiwpohcEgbIQt1qMZ5SUF
         v/eumcKXadMqOv6jXDSrp1h2355hUYzT/iqsmBjg2MbbXNNdTY8Y/m9efeNRgir4OgXv
         5IG/0d1ejmqiZsU+zKd9PXIYYRE+BdiVJHBaKHJERuV4sc21n76KWwuyuNuax+T4yFQ9
         oW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775686346; x=1776291146;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fym2LzOOWtP3DEfhBZ50aXf6HMqAJm+7igjBImlFTbY=;
        b=oqHc6hkAy01KF5Eh5OTflqG82XDcZGEhsX3l0WoD+tT4QhLfi8BagW3l8ySYMV3M/N
         pWhEl0E3z+k+lcStHxEWnKIo0CuQrgtYKW+aZ2R8/UyKvLGPiIdkcfejUu52gJfiDkZQ
         Zjbz+kFOAHqzKM7C6Ryjye8yEi70/QHHOWmJG9wktxXvaI+hbTu53L61P2EaDLKzd4CT
         1hcbNvHTwYng+ovyvKg/zGVzXq6N9zlQiQ7Oy8KRRKyCMJX6vvqFsWUT0b7qbAqmIVwA
         HdshyJvKpUWaRmA1+N47SZTTH4coKxM0tLseSzSYFNtWmrzwU3gs+WM+S0+EtT3j5cDv
         T1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU+PBkUgOcXPc747ucHqoW2I1AaBVqsZPkIuNh8vlmNRrSS/RFHhBzF1gldXTzW/G8OFARFkEw+BLc0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64YlorKEPB6VYDOFEszUWUlnAwPlKpG6K5fMt6EgWmVWVuSLy
	r8g3sVN2YkNRnDOdcVdFB4SIUlgIIdvAQFt8Uk1t8qQIkZiLgpBNl7TQMqP5f9BJ3D0mDXNufPd
	r0PHrj3qrnm45EK0StEQ/o3e+Kk1Y8TlCeWY2EpGGnCid7Q+vxn15VUuE+Km82LA=
X-Gm-Gg: AeBDievJVdP5UZe12gYenR1f/dt8laqGoFQMMoCU1P7xusKRrxRuLiujrDfknDZJPi5
	3vHiO5mdL2zibPYfXx3G5rNvZhJQcQr5F3Qt26vTrXn3ZB2GvJx6mSxq2y6qvjjAkJVT8g1Gfy4
	e212jokyBgzTyYOBCAZ8J9nZ4I3VJPltz4LeToNQgidIpMyqH6lwvb52h8SEoaJXUQVpOICSzqK
	r0nk5fjB5p6S+aOUdje7sdqdaCk1/JPokt3svo3EJ/5PZJgOl+BtCrwlzpv4WxK3UibRHEahs98
	AuLVFXT+8TPxuZL5MX27UTFe6iZTqh55i8m9WeZ4s6Co27z5gZd14CaXIfUkbzb4a8rTmkEW1dM
	2K3LrxsX7Zqfolg39lmFfppsN8VvxE42189jcv544PIg/ylxuNvBb0UBO
X-Received: by 2002:a05:620a:28ce:b0:8cf:c218:739b with SMTP id af79cd13be357-8d41c6abd7dmr3111687885a.18.1775686345850;
        Wed, 08 Apr 2026 15:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:28ce:b0:8cf:c218:739b with SMTP id af79cd13be357-8d41c6abd7dmr3111683585a.18.1775686345273;
        Wed, 08 Apr 2026 15:12:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d526e26c19sm1271366585a.18.2026.04.08.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 15:12:24 -0700 (PDT)
Date: Wed, 8 Apr 2026 18:12:22 -0400
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
Message-ID: <adbSxmeJDf14EtS0@redhat.com>
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
> +
> +	return 0;
> +}
> +
>  static int fsl_sai_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct fsl_sai_data *data = device_get_match_data(dev);
>  	struct fsl_sai_clk *sai_clk;
> -	struct clk_parent_data pdata = { .index = 0 };
>  	struct clk *clk_bus;
>  	void __iomem *base;
> -	struct clk_hw *hw;
> +	int ret;
>  
>  	sai_clk = devm_kzalloc(dev, sizeof(*sai_clk), GFP_KERNEL);
>  	if (!sai_clk)
> @@ -55,29 +106,14 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&sai_clk->lock);
>  
> -	sai_clk->gate.reg = base + data->offset + I2S_CSR;
> -	sai_clk->gate.bit_idx = CSR_BCE_BIT;
> -	sai_clk->gate.lock = &sai_clk->lock;
> -
> -	sai_clk->div.reg = base + data->offset + I2S_CR2;
> -	sai_clk->div.shift = CR2_DIV_SHIFT;
> -	sai_clk->div.width = CR2_DIV_WIDTH;
> -	sai_clk->div.lock = &sai_clk->lock;
> -
> -	/* set clock direction, we are the BCLK master */
> -	writel(CR2_BCD, base + data->offset + I2S_CR2);
> -
> -	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
> -						  &pdata, 1, NULL, NULL,
> -						  &sai_clk->div.hw,
> -						  &clk_divider_ops,
> -						  &sai_clk->gate.hw,
> -						  &clk_gate_ops,
> -						  CLK_SET_RATE_GATE);
> -	if (IS_ERR(hw))
> -		return PTR_ERR(hw);
> -
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
> +	ret = fsl_sai_clk_register(dev, base, &sai_clk->lock,
> +				   &sai_clk->bclk_div, &sai_clk->bclk_gate,
> +				   &sai_clk->bclk_hw, CSR_BCE_BIT, CR2_BCD,
> +				   data->offset + I2S_CR2, "BCLK");
                                   ^^^^^^^^^^^^^^^^^^^^^^
Sashiko reports the following:
https://sashiko.dev/#/patchset/20260407211123.77602-1-marex%40nabladev.com

    For MCLK, this evaluates to writel(MCR_MOE, base + I2S_MCR). Does this
    overwrite the entire register and clear all other bits to 0? This could zero
    out fields like the MCLK Divider Enable and Clock Source Select, breaking
    the MCLK hardware divider.

It's the same behavior as what was there previously. There's a lot more
to the comment. Can you look and see if there's anything else valid in
Sashiko's comment that should be addressed while changes are being made
here?

Otherwise, based on what was there previously, this looks good to me.

Brian


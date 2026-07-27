Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B741D629
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169026; cv=none; b=rlVl6VCBTCv7x3W7/9yeqEUqQiMJZMYhbh9bjrPyPzn+Z8Sxc1pB87f+qDglVT8uuZNEQcIG1ha2W3vRmHiM2Ko5jKbn2V5JyH7Y10fv/QWhd1H6kaGGU+8QSOxgcojkbGs8BoW6ZxOtYLWxVQ3mnZavMgQOhPoBvJ+0GxTJqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169026; c=relaxed/simple;
	bh=tlBbX7IaY3LZJP0Qn7twE6c8nAF7/HTq/drK110qv9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqz4jDW5DmR/HAQ2622r1ffjGyjd4biYUwymnDh2tBeyLTcJnSz8xxW55XtikGltuihgRFv8DIHKnJdSuB2rGCgYQensqIs/oQ++Brf5m4HjLIKI4IISE6OUJhnJFn/tMUUBLSM3xHl0YIjwd88vETnYQJF5WzLeZc8KIqvJfwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jM/Lxbjw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8YA2RRe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jM/Lxbjw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8YA2RRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QW8PobFLl9VuSJ+iyJKGdmgP3JvFIctsAQhl5gtsCFo=;
	b=jM/Lxbjwu/Ee54X3cGlE7hStQEnDmOrh5cjGlV2ZHnQw1s8VhY/WKer9bBL/pJRQ+Lttff
	RIk3N3zLXeoNROFXdiTT4wfegim2RjxdYw9YmlhLaBRMN79ryezbKJNF4qnukSgRn7xz9B
	f4MZn90ufHsSvEHP+UV+s/z7HXmPl9E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-l87a5RduNdSuxSXdEpZOoQ-1; Mon, 27 Jul 2026 12:17:02 -0400
X-MC-Unique: l87a5RduNdSuxSXdEpZOoQ-1
X-Mimecast-MFC-AGG-ID: l87a5RduNdSuxSXdEpZOoQ_1785169022
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so287229285a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785169021; x=1785773821; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QW8PobFLl9VuSJ+iyJKGdmgP3JvFIctsAQhl5gtsCFo=;
        b=a8YA2RReNg7KdnWSWLB9QPR40Lh4g2ajxbkNL1RvbM9MNBHOVefkB8nTFcpdYMuHVF
         rv6hrE7SaQdVEA5sezjBUil8VnIk75k/yDtNpyMNr9b737grw3ORuE0XMcUq97oHtT1m
         /M9VDMIVm2dDE+o4HzR2ffRfn/fRiSE4uhT+ueXGUz1/CnfBG7QdT2Weq/d0Tk5XmWcy
         b2oHg+XQx1qmfiKtsMGDtyn1BjxIM7KKfDAIGfjRqqtjX0+v0jXPJl3wqOo2rrWZPX+l
         xPkZWBB+/zTqxgU5bJjSYBVOwX8Twn93l9+ge10Gf7k6/83munm3rjPshy9TKtGnGuhJ
         3yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169021; x=1785773821;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW8PobFLl9VuSJ+iyJKGdmgP3JvFIctsAQhl5gtsCFo=;
        b=fIGdaw6hmTiv0UTVL95xJSLFvNAyoy3u3xPkodQKGVnfDHgLJbzLiTPoJWZ7/yaxE4
         L7QsHN3jRSglW0V6/ZIvEdNwpD7oucbYClvqBgWoPnPJ+YXOtKHdQl+ywmHBKLxmP2Nu
         BPEkzOND97aYR1Indvm4jY9o8pwCkyMRfxmbYcJCmMPequhR9GHerDe22SVelnSds4Ew
         64wtWz70bmpyYUjP7Rx01ek+9JM2hAltajsLmkc2BRkVX70R/AKzrQXL4T7HkrtpqzGy
         p4jdHjEzwDG92J/sN0S+eccwm1GDmQXl2hgcjGFsvHLBSbPfqHMDkSBj7yK+s8TkUqjQ
         sHkg==
X-Forwarded-Encrypted: i=1; AHgh+Rr55Lu4txclcZ9sVxHHu+sGSPWHDj8ReD//tIaWt8pYZWEFZP7ooarwLnWXuoyaxgghqwTGYqDV1Hbs@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJqXSC9/t9KJtDvWda649pYfSatPDHreifuOIVwZd5rHGjzRH
	XbyMGoenLvv7ISHG7YNRJRcILaWeqPxln9PFVUzIIho4Sja1HsmL/uic68xvkNMToBvZuAhYL+o
	tXu4D6dYrkxEsG2pH49FDdZTYQmvYLy1OFlTY7KYe84vORHYfI5WW1EUV36YHqLk=
X-Gm-Gg: AR+sD13TvrKBFsZYkp0t0iAKSZb+wa8bRB6ab+02+PpUmXZwn4SV+8nOPupb0pFmhUn
	qjwxvMONgMMs+OOUD1SKT4kdA96J7m+aXFTWkCp7u6YBrLO2ipAX+iusbQVkT2N8A5bzGzEDLhF
	eszKsqbpmxXoAD9Yz1Tvm/7fA0PYFi/Ak6Dw8Q7+3Z4C7pHDxaXfYz3pemNp4BTst48zqVGKDFC
	xa5sItfdOocUTDT7MvtfgmJiBDVavJNLDABtbvhtjICPCCFN8g7lTx6TvNaG1u48MucVZ552CyE
	uU9/ttRnXgC6M1Zgj3jYSV9Nw78oJzybk9jTuUbcBaFoGfe6q2buCuveZdHVeJc6drUfUSeuodQ
	LjxvbOUN54orGNWmJKffc2I2zYZbuJR2K7p4=
X-Received: by 2002:a05:620a:2691:b0:915:83fa:b3e0 with SMTP id af79cd13be357-932df627547mr956642385a.5.1785169020652;
        Mon, 27 Jul 2026 09:17:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:915:83fa:b3e0 with SMTP id af79cd13be357-932df627547mr956637785a.5.1785169020166;
        Mon, 27 Jul 2026 09:17:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de6724a4sm641575585a.43.2026.07.27.09.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:16:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:16:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v3 2/5] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <ameEd76Flq7_eUMy@redhat.com>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727091555.1023910-3-wenst@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Chen-Yu,

On Mon, Jul 27, 2026 at 05:15:51PM +0800, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
> 
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
> 
> Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
> ---

[snip]

> +static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct mt8173_mfgtop_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
> +	if (!data->clk_data)
> +		return -ENOMEM;
> +
> +	/* MTK clock gates also uses regmap */
> +	data->regmap = device_node_to_regmap(node);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
> +
> +	data->child_pd.np = node;
> +	data->child_pd.args_count = 0;
> +	ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
> +					 &data->parent_pd);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
> +
> +	devm_pm_runtime_enable(dev);
> +	/*
> +	 * Do a pm_runtime_resume_and_get() to workaround a possible
> +	 * deadlock between clk_register() and the genpd framework.
> +	 */
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to runtime resume device\n");
> +		goto put_of_node;
> +	}
> +
> +	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
> +				     data->clk_data);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register clock gates\n");
> +		goto put_pm_runtime;
> +	}
> +
> +	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
> +	if (IS_ERR(data->clk_26m)) {
> +		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
> +		goto unregister_clks;
> +	}
> +
> +	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
> +		goto put_26m_clk;
> +	}
> +
> +	data->genpd.name = "mfg-top";
> +	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
> +	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
> +	ret = pm_genpd_init(&data->genpd, NULL, true);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add power domain\n");
> +		goto del_clk_provider;
> +	}
> +
> +	ret = of_genpd_add_provider_simple(node, &data->genpd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
> +		goto remove_pd;
> +	}
> +
> +	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to link PM domains\n");
> +		goto del_pd_provider;
> +	}
> +
> +	pm_runtime_put(dev);
> +	return 0;
> +
> +del_pd_provider:
> +	of_genpd_del_provider(node);
> +remove_pd:
> +	pm_genpd_remove(&data->genpd);
> +del_clk_provider:
> +	of_clk_del_provider(node);
> +put_26m_clk:
> +	clk_put(data->clk_26m);
> +unregister_clks:
> +	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
> +put_pm_runtime:
> +	pm_runtime_put(dev);
> +put_of_node:
> +	of_node_put(data->parent_pd.np);
> +	return ret;
> +}
> +
> +static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
> +{
> +	struct mt8173_mfgtop_data *data = platform_get_drvdata(pdev);
> +	struct device_node *node = pdev->dev.of_node;
> +
> +	of_genpd_remove_subdomain(&data->parent_pd, &data->child_pd);
> +	of_genpd_del_provider(node);
> +	pm_genpd_remove(&data->genpd);
> +	of_clk_del_provider(node);
> +	clk_put(data->clk_26m);
> +	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);

Looking at the error labels in the probe, does the remove also need:

    of_node_put(data->parent_pd.np);

Otherwise this looks good. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


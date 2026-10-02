Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA938E135
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967113; cv=none; b=IIlV13COAXbStxMv+ni7Oa0CZ2TWlL0yyy7fLvVgN6ZPFAipCG8GXkXJgOB611Hz3i1T/koomUqe9i6L/iMyXopXotyJCU4eTEMySBXPZrId5xZX0fHH9KuMu7ztpUdfgv9Y1aNyXobXRxZXrbttpngkkDeKLBuFfTEkYFd+D3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967113; c=relaxed/simple;
	bh=QDX7lQ1hmHgJ9y3o5Z/Hm00xEaK1qYts6FM/BQ1Nm/Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BrKImth3K57ib6zX3o1QhaNkGDlqAOS2suK1UXMhlCTqKwF8+qDO8jAkQ5SluEs9jNtUmQBIvrmSuuHOrGWNbASgI6+J1zOIPDJxSKRSAtsd0jyzuZWnUgj4sgAu9vK3EEj9DpJqHOJTwQ7vA3q1migtiNH0+hcuB5OkoDDJX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M21N2oiG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jj7ZH8NY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M21N2oiG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jj7ZH8NY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
	b=M21N2oiGn16sQ+orUS/2ywH3MdJ8kJbIU+UnGDdZ7ONvM2WZRbsDJcf3eZcXJvAnFAaB5X
	F3sLURz5fNQC8640DlHcrVLDWM583hljopts0sXYihsrARFBAd99HpqwPcNsEGiZ5Ro+65
	fwV3eGtSfYOgc9bn/pEelP0egtGusog=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-1bIJSSIcNG6UwTwzyd61Aw-1; Fri, 02 Oct 2026 14:51:47 -0400
X-MC-Unique: 1bIJSSIcNG6UwTwzyd61Aw-1
X-Mimecast-MFC-AGG-ID: 1bIJSSIcNG6UwTwzyd61Aw_1790967107
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso520975085a.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967107; x=1791571907; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
        b=jj7ZH8NYVEdrxdyXvrrUVICgkUNovrKhQx+jcTeFBx5OkC9wtNxlui6CAFLwIhpTXH
         Q4WMOn2oN8HgJpJOQ31tQLG+DuZW0PeBib1ixm18GMht/xVFQH4+IFh+ZrmEgFWTqbt9
         yd0RVLz5XVElEu+zZTC+52DGvV6pHZhGuZazaZ9zyrgMjcYkt/yE6lWJyf8gsiLpfya0
         J7JBbMOEpCXcweTfK49rA5pMYf/EqecurRHOphKhFxafpGxewjKX2YhTKBOeIAGyGDqy
         OguFx7j0Fqtjscv1zFRp2HurZb1GLlp3zayaiFVAaRSftMJt/zOY84pIUNKhJGsMwpbB
         4JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967107; x=1791571907;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
        b=Sus8PIAhgQFA0D0J3i1dcoh0pRR4FT05g+geX3R2BhXoRUSoKAALbbvXPP0ELZdEvi
         +zTqyF8avI8/TB7ZTKs3kjnr2hXExexjYudbdn9mwgRom59zuqucCyFFO7yTNy0VxcAO
         oSuFZXqP/NJJvyoUBEFlbhJMBbw8V0RgD05D/lIxnaZ3+kjOBn5nb6VBtExGB9mtxJOe
         5kktof1iB/DHI5rrdctqd2jSSrYRKyzl69aEaoVPNSyGIvR1fGqadZIYrswq3+BYgkxM
         9VDjlRvQ7eS6FVl/vx0xqaHRimbZeGYl5YY5bpDpuS3YHDBt5BnrRW+b5Agkd/xUcrQK
         2Opw==
X-Forwarded-Encrypted: i=1; AKwUvBywwWWj8yFxMPyjcV/Tna1S+5XajrG/d8XqGriTFeSVzlBDs8yRIa+gK79a5D2CAv/mWBgWleJApZgq@vger.kernel.org
X-Gm-Message-State: AFuF++mDP+p9g7bvE5tTmM2C1vyz7MI2TVQWO3WR2eUM/BhIRu/jErO6
	dJwI98sKqOnfBjmqOmfQa8RP3PZUTZBZ4DK7/nGF++OwEFhM/nKvsmwPzCmCGOQgClttg3tg2Xw
	guqUBCFbfP+qsfIG+/LTLLMAYz0FSY39y/OsbpPUXUZoHxp5UTWoEd5afxilpW0Q=
X-Gm-Gg: AYBFou0cdou095+yuhJZ7mnXKvsX0JJlfkMrO+pxdvsKV/5dZdZ1L9N+uPgFr3OTrDJ
	qx5SsxvoEC8RSv2qzF4xMJnQ8VdG5Aa2ut0SaTcFowjsmK6Im9LvZO+J239lUCCLbXg+pGNWyE2
	uC4tkEYzL3hYgj0m6RFTLB1BC/tRSeXNwFxmfpFIzLRo1Kjt7H/WssNKtLFz4qlQNQu+M6ym/He
	HgqYG3im5sJe1igByH7neCZV4rkEsXpXBAfvOMzKvPyYmmgu8GNKtkEckeVRgP5uXjob7nd0QYQ
	2BaT7dGjK2MDi5whp9SIcwboGut3DgnlGjU9xiTEaLkjjdBnemPvikz8mvYYwjapoIxjugtxpG3
	Uss4hp6PhXVfTag==
X-Received: by 2002:a05:620a:172b:b0:93a:32e7:bbe with SMTP id af79cd13be357-93cf177ead7mr639037185a.21.1790967107005;
        Fri, 02 Oct 2026 11:51:47 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:32e7:bbe with SMTP id af79cd13be357-93cf177ead7mr639030785a.21.1790967106284;
        Fri, 02 Oct 2026 11:51:46 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 04/23] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260930124317.5648-5-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-5-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707363.821688.2728247121300145722.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4235; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QDX7lQ1hmHgJ9y3o5Z/Hm00xEaK1qYts6FM/BQ1Nm/Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/zV1zvtv7+SlXtHBUHFGbF2avMt2pk/9ujcLTCxi3
 ln8f/y5o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlkT2L477RhtiqP0LV1IWGM
 ZU1dt/UfT9fN8wuQLvAMmf5nqsZPDYb/SZGX7zI8PTwx9kJQFcftAndb56ryh2camk4sv/s3O1S
 VGQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table, external
> clock names and reset auxiliary device name. The reset auxiliary device
> is registered with jh71x0_reset_controller_register().
> 
> The clock index space of these CRGs is sparse, so also make
> jh71x0_clk_get() reject indexes that were never registered when the
> domain info is available.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 2cc71f49ddee..bb7706ede1a6 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>

Add #include <linux/property.h> for device_get_match_data()

>  #include <linux/slab.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
> @@ -334,10 +335,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
>  	struct jh71x0_clk_priv *priv = data;
>  	unsigned int idx = clkspec->args[0];
>  
> -	if (idx < priv->num_reg)
> -		return &priv->reg[idx].hw;
> +	if (idx >= priv->num_reg)
> +		return ERR_PTR(-EINVAL);
>  
> -	return ERR_PTR(-EINVAL);
> +	/* Index space is sparse: reject holes that were never registered. */
> +	if (priv->info && !priv->info->clk_data[idx].name)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &priv->reg[idx].hw;
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_clk_get);
>  
> @@ -391,3 +396,87 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
>  					jh71x0_reset_unregister_adev, adev);
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
> +
> +int jh71x0_crg_probe(struct platform_device *pdev)
> +{
> +	const struct jh71x0_crg_domain_info *info;
> +	struct jh71x0_clk_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	info = device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->rmw_lock);
> +	priv->info = info;
> +	priv->num_reg = info->num_clk;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	if (info->power_domain) {
> +		ret = devm_pm_runtime_enable(priv->dev);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to enable runtime PM\n");
> +	}
> +
> +	for (idx = 0; idx < info->num_clk; idx++) {
> +		u32 max = info->clk_data[idx].max;
> +		struct clk_parent_data parents[4] = {};
> +		struct clk_init_data init = {
> +			.name = info->clk_data[idx].name,
> +			.ops = starfive_jh71x0_clk_ops(max),
> +			.parent_data = parents,
> +			.num_parents =
> +				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +			.flags = info->clk_data[idx].flags,
> +		};
> +		struct jh71x0_clk *clk = &priv->reg[idx];
> +		unsigned int i;
> +
> +		if (!init.name)
> +			continue;
> +
> +		if (init.num_parents > ARRAY_SIZE(parents))
> +			return dev_err_probe(priv->dev, -EINVAL,
> +					     "clock %s: too many parents (%u > %zu)\n",
> +					     init.name, init.num_parents, ARRAY_SIZE(parents));
> +
> +		for (i = 0; i < init.num_parents; i++) {
> +			unsigned int pidx = info->clk_data[idx].parents[i];
> +
> +			if (pidx < info->num_clk) {
> +				parents[i].hw = &priv->reg[pidx].hw;
> +			} else {
> +				if (pidx - info->num_clk >= info->num_ext_clk)
> +					return -EINVAL;

What do you think about adding a dev_err_probe() here as well to make it
easier to troubleshoot any failures here?

Brian

-- 
Brian Masney <bmasney@redhat.com>


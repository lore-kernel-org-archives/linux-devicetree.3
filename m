Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE778415F39
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768263; cv=none; b=kg/l4POgHPdQmd7o22ergnrT2W6gyyPg7CyNBaZQBCvX1zAGgtGhg8QwyO6rCV7J+9oQX/JSAR88zcmrmk1vcFLRPFwRmUp5tXE73+ALtRifm6q9Im7HRMU+NSrsOkWBcm3Frc6vPZdGu2h2N2K0ifxubabeaJjgV0ePsIxnXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768263; c=relaxed/simple;
	bh=TPNhfpCjJ7K9BIQKoO6eafvRbdeq9bSuqGX5iRJjLwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYmZqZmmqDQJ8c6lTCE6Epv2lNfeS5d7SceI9eRW2AYGqZno/YGoZUBoMbUoV6cFVT/hsYVgNrOPHu9EJbVK1+eZX/OACJOaZWLoIozboDivRi9w8YKqslSjjpJOc+uwL2Kpcqf7bR6c68ts8oxGmk4ewgMLPe+7ovbnO/mADy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ISvwtKgb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h4uob3ud; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ISvwtKgb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4uob3ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
	b=ISvwtKgbZpBhvK/UiLeEgpRKrxDwXilZzTvtnRwep+ZM0hgqOfoYOwLvC04eKPF3xqKgb5
	KPSKgNYkpSPSY4mj2KPKKzaGUd7dgwyA2r/XNlodiTv4wucErkeJ1q3JWIl3yMIhLjNSbl
	jOgmcjbDGVk0LD8CMH64W/V/Mc6b+NI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-b8tts6qgMt-bjrjH25-VlA-1; Mon, 03 Aug 2026 10:44:19 -0400
X-MC-Unique: b8tts6qgMt-bjrjH25-VlA-1
X-Mimecast-MFC-AGG-ID: b8tts6qgMt-bjrjH25-VlA_1785768259
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81fc0232d42so104309617b3.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785768259; x=1786373059; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
        b=h4uob3udm9e2cIOawsFZOSgPzktjbGatUirDt107Qlh0flnOB5zgtGlr/ZVdDhUhWg
         NgrFUeH9zrxUAnT0tqHy2tq5t4/ki/IKJq0kHt/apqZHnoI3S7bm70H26mZHy/z07ZlR
         HHi7YPEXEsg/ndNm6F+BwYNefyiiMb+3fosPh9xl+xYA5kbic6sBjXsy9wVsygo9/QRW
         c0E/F9+p6ivmcRAsh/H/rmwT37UKWjCOfcpo8KxFRcBNnjoJKVZci+2Sjnt3irJq1JfZ
         bBJsVMCRCirR+2xq1+60FLOSXY4A9jxtOltTjEilR+sbvzLPPF7WmzFfTW/OqXEPYpbK
         cazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768259; x=1786373059;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
        b=bdD+70VyIGmePIm6bvrZ5RYJT+4fS4ugiTVWoW0Eucbp1jmWet95TEECJFqxuIOJd/
         tNy6XKlP2Qa+u4l4gC5GovZa7JLzm8m5ta4b1OZU4XzDgMxO4ajIL5KVgfptQmnDrCcb
         uRBNWWW4zPpXo0aNDPtiKtwb6Y0hjryPVeJh8v00PlgZ2beQFrLeAbtGkUiL82qaT6XC
         GZV73KKgrmp2ILi8axZduG6aqqDvr9eOgEGj2SyvHaXVhh0OXUz9YTf2VHNmhsWIF4eG
         QdyQg53k/6XjW/3tir8ol4FfKkWZ06FSe57vPGJrpT5CjHMQdOFGA95GY5BWiapOUjdn
         c+3g==
X-Forwarded-Encrypted: i=1; AHgh+RpVSbgZuOobmyePQ46I5ZZ0PYeteEFQkWACCL5U1nZyxFnLNPTYtq/mNk55Foqoa+Z1sycjYNUnGK5T@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYt2kdOJplGkvW2vaOPgh2UJcXX3rNZ83MoRPBqibXKPeqTkU
	nq+giLtb7dgHcD9eeq7dmgnW8DTr8vALLJ0XVZod9C3QlmIgpsikZjvJ6FnbUSTze/k1QsknHpx
	vBTkUJWJkivB0TqhEYcGSqwcMz3GjZSx8eJlbSCDwwWRQN7+8SIhGILbCQ92r15A=
X-Gm-Gg: AR+sD11PH25caES2E0/pxVPE/Eg2GOk431vOBv7E92RgI4WPPgFPOmR+uWcXhqXy7UU
	ps3XYqShUgr2oQEWMjLMNzeR9srE+UnspMTgFHf/fPipOIanWlCm0Krr/zf4KsbZaNB8SLJYGSr
	jmKiUCpmMmawu79u1UpVZrGg7ZqlLKpTT+kFQMxokH/BlbckOaiWKWm0gmcKKb8OzL8S0aat/Al
	3yUCxNmJGVjZ8Rw+5t4QxMIyu5daLVh3P5e9ET1ugBMFPkFHyySET+5Ei5UqNZdX+r6sHn3ey3k
	z64JF808cRR6v+YYcCPup1edmo73nT9+eIbWSbaPvHm9xAag6HIseI8r7WkWcOF8+X8+naRS79r
	K09UAhGWyqPEyJNlV62TMrNZpfauf2svxJTw=
X-Received: by 2002:a53:ef09:0:b0:664:e66e:f955 with SMTP id 956f58d0204a3-6694efcd46cmr9652589d50.4.1785768258657;
        Mon, 03 Aug 2026 07:44:18 -0700 (PDT)
X-Received: by 2002:a53:ef09:0:b0:664:e66e:f955 with SMTP id 956f58d0204a3-6694efcd46cmr9652545d50.4.1785768258248;
        Mon, 03 Aug 2026 07:44:18 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948fcb3acsm5643561d50.10.2026.08.03.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:44:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:44:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 13/25] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
Message-ID: <anCpP0FlwHdomb_e@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:20:59PM +0200, Louis-Alexis Eyraud wrote:
> MT8189 SoC uses a new combination of status and set/clr registers to
> control its PLL enable state and perform BAR reset, that are different
> than the current default clock prepare/unprepare operations are using.
> 
> Add new set of PLL clock operations to support this logic that relies
> on the following registers for prepare/unprepare operations:
>   - en/en_set/en_clr, rather than en register, for PLL enable
>     control
>   - rst_bar/rst_bar_set/rst_bar_clr, rather than default rst_bar
>     register for BAR reset control
> 
> Also, handle rst_bar register setting/clearing with a timeout, to
> verify the operation was correctly performed.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 66 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-pll.h |  5 ++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 9a197a657dce..3118f68aa9ac 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -9,6 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> @@ -32,6 +33,7 @@
>  #define INTEGER_BITS		7
>  
>  #define PLL_STABILIZATION_DELAY	20 /* in us */
> +#define RST_BAR_TIMEOUT		20 /* in us */
>  
>  int mtk_pll_is_prepared(struct clk_hw *hw)
>  {
> @@ -301,6 +303,60 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  	mtk_pll_power_off(pll);
>  }
>  
> +int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +	u32 val = 0;
> +	int ret;
> +
> +	mtk_pll_power_on(pll);
> +
> +	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> +
> +	__mtk_pll_tuner_enable(pll);
> +
> +	udelay(PLL_STABILIZATION_DELAY);
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
> +
> +		ret = readl_poll_timeout(pll->rst_bar_addr, val,
> +					(val & pll->data->rst_bar_mask), 1,
> +					RST_BAR_TIMEOUT);
> +		if (ret) {
> +			mtk_pll_unprepare_setclr(hw);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_pll_prepare_setclr);
> +
> +void mtk_pll_unprepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +	u32 val = 0;
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
> +
> +		/* ignore return code to continue unpreparing the PLL if
> +		 * a error occurs on register read poll.

Use proper kernel comment:

  /*
   * Ignore return code...
   */

Also s/a error/an error/

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


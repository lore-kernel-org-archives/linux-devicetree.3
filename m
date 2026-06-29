Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F0F3CCFD0
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718071; cv=none; b=iPU7mGGI1ZRj6onHfkhIMOoJ4ttk4k8Dz4q07lrmH1dXFhi2VCl+Wt9kGKNrVIIteUSwGJj3YmA/I7fQP8Bm5McX0Hf0nImsFzo4s+mFMNmbjzFaq6RYo4crnvMSLXR9giHSiJXsfiUWRTSfnCb4p0vFoKwKsYSiF4DaqAqbQLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718071; c=relaxed/simple;
	bh=Y/HfCNCRUg9RLoYb4CuHK8wg90NBmdpKZjXTXnDvd+Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOZmcaD4U9nST8bGB8wZXNgNJoBnWv+fm4yRwnr3ZnZmTyoNIJKi0vhtdHcA2akOJ2KQsh9wmksLdKzTW2oWnfry4Ch0RpAePxVTzlfA8RtlHDuKLGhc7zkmzweVAaHjjhv4z6kuPUW8D07OCQDxm3NYcTHLvDNYIvvKbsTCc6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7+xRpGt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7+xRpGt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso15059835e9.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782718067; x=1783322867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=;
        b=E7+xRpGtRu7dSjhFPn9FyBhPLhGCoJhqvwq0JPQ05G7Y1BTzKZYoGetL3Y+2Lq+DGT
         iOz3BojVYQ3IUij9omW9xmvfF7pP3V/P9/BsOArE6Sdy0jk4/mxkUK/FI4qUeyZE585v
         rXhCoTAtbAMeF0GVKKW2wW2BpoIkV7ZF4xIuFwpa2aaLPhsQpoMQXnLv3/2uRY4SI3gv
         mMPVdBiDKl6ca3yOmhzHq2KCXT8bcewyuDRqYPBMS2qYruNFjQYLlSysoQBHMm1HiX4D
         m1jVg6EIyUsNv16dKareDhkvjxgCImTqsJgHukAM6hlX9YJe5XIF4gEn05qzainzNoQT
         rqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718067; x=1783322867;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=;
        b=Witqp9TgfOd6/YxV+8xjAf9CWkrrBEjay0Naw08pVP0+MhZWlyP8NQgo53OKTYNxVG
         Y3646JgwOoE2dXL3cPem+zdY5YJnwWcarLpZa+GrQU1fmb92mZrL357HhWtJpM551bbZ
         X6uR+ZDxc6bIkwAgPL4H3owtSKAqgUa8jnNr9OULAZNI5tLCkRDVcA4R91gQu66VLrIm
         Es8uSBjO5vne+GSSJz79sTv3+ONj8aH8cbo7bwS3zpAh+Dv38ds5qFTqh98OJ1PS4vF+
         MhHy1eMx6L6kchSccNnxCx4nzBQ178Tv876IICjFSdrJt8klRBA5jN32BrrLVYmz51HA
         cqxw==
X-Forwarded-Encrypted: i=1; AFNElJ/N5AL9u0A8wU///HpCOugTT0V6khrkN6K/LpJhtzfXJyPG3VoiLoGXwcqOdLuZDQgDDOBgYVbSGoRY@vger.kernel.org
X-Gm-Message-State: AOJu0YzMJR361c5As6U1ozJrv1u2KZUqPenbTO3aSQLPKn3KAHYGhKtU
	jNieMbNNo3BmFuoYWDTgiz0nHijj7UnDvSlTUFxVHBoB0CPgEolrasi+
X-Gm-Gg: AfdE7cnS/IebT61LGsgMfEdTlZ1N1p4QA7QQ1xTcU9jpoQzAW2982KroNfGHwZ6YKgv
	PYlN2de83ZYFY5kvW/AX6AdKH/Zxqf+8tE4YxlY1IPRKWE2rGNQaopVbVekt373DQGfefDZ8k2N
	QoEXUB20NzYYiz7OpEIDjMbvPHzEcXWvUTvXSCv3hmrKPrANtvGq1zIZmJkEpuk7obRoTHgnCkN
	u0CuQOKvB1E498j6asSWEQ/6FITkE+S6AD+DjHQIWBJYbA9gYishL4iXVkkoCh6PTTUXLm85izm
	mVav17wjEYbgl+4OGbKHD/38Fb6XfRmmxYWk0TDltnbsHjgqWATODVfcimoFD9HukkLTyYML/fC
	OOiS9oJ+z6vI8vJVEyAAH7abBxTfOJjoVPAzx96DsLQd4kRealJmvfa4N7q8TAH4xMP1ZMM+uXc
	CZreuhFBU173tgEJJ8t+xo3e7k/fbM9AQAGquq8gRNijgmMCRw2UXZ9/D1XdCCEoKYejo=
X-Received: by 2002:a05:600c:8b14:b0:493:b2e8:637c with SMTP id 5b1f17b1804b1-493b2e86404mr14198305e9.1.1782718066323;
        Mon, 29 Jun 2026 00:27:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472c7bec9c2sm12681213f8f.12.2026.06.29.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:27:45 -0700 (PDT)
Message-ID: <6a421e71.39c9bec7.1462ca.d6ce@mx.google.com>
X-Google-Original-Message-ID: <akIebr33n_BgDL7X@Ansuel-XPS.>
Date: Mon, 29 Jun 2026 09:27:42 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] clk: en7523: add support for dedicated PCIe
 PERSTOUT reset
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
 <20260627121450.3529133-3-ansuelsmth@gmail.com>
 <68b43224e0a124c055fc228b3a254fc7908dbcdd.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b43224e0a124c055fc228b3a254fc7908dbcdd.camel@pengutronix.de>

On Mon, Jun 29, 2026 at 09:07:22AM +0200, Philipp Zabel wrote:
> On Sa, 2026-06-27 at 14:14 +0200, Christian Marangi wrote:
> > Add support for resetting the PCIe lines with the PERSTOUT reset. These
> > special reset are controlled by the PCIC register and are specific to each
> > of the 3 PCIe lines.
> > 
> > Notice that reset logic is inverted for these bit where 0 is assert and 1
> > deassert. This is intenrally handled in the reset function.
>                         ^^
> typo: internally
>

Thanks!
 
> > PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
> > reset handling.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
> >  1 file changed, 28 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 1ab0e2eca5d3..c9b21d9bf2f3 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> [...]
> > @@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
> >  			       unsigned long id, bool assert)
> >  {
> >  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> > -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> > +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> > +	void __iomem *addr = rst_data->base + offset;
> > +	bool inverted = false;
> >  	u32 val;
> >  
> > +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
> > +	if (offset == REG_NP_SCU_PCIC)
> > +		inverted = true;
> > +
> >  	val = readl(addr);
> > +	val &= ~BIT(id % RST_NR_PER_BANK);
> >  	if (assert)
> > -		val |= BIT(id % RST_NR_PER_BANK);
> > +		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
> >  	else
> > -		val &= ~BIT(id % RST_NR_PER_BANK);
> > +		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
> 
> You can simplify this into a single (assert ^ inverted) condition.
> 

Yep I know but I feel this would decrease readability of the logic. Do you
think it's worth it?

> regards
> Philipp

-- 
	Ansuel

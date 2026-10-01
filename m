Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BC4ABBD6
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847878; cv=none; b=KcVb/88doaQYFfdxp0ysl1xqfrMqusdkzNrx5GfiqI7HOCFofFLiCIKqFJA1VGq9+oQzcNL3mzS+tBn1Sr5L3i/e6Xp7s+VUwoG27ddl0ihf4uye0xBw4JkYOxyzCcQruvYiiwaiAiTwufA+iV74vbZhGKl+A+8ZpyC6h+i67Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847878; c=relaxed/simple;
	bh=uM1dQUiN6LEEGAM42Uvfmozwbcyiv6F9zdNRKF0DmhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qMDiKbimry2srp4uwltxX0CTxDp4qbybQuvaTlocKDEFP8sX1KwCeKWzpLQx7OcPdq+Fgxlcc1p3dgECL/0fcrrcKwv1u9tFYa9i3W3v7id7dMwrmX79PvxcfJzaIu3IiqEj7hD/WQLLuz85mjAI/1L6iM27waV+LjjWJ+JNeTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dlIke/1u; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dlIke/1u"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so3872052f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790847874; x=1791452674; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zH7V34OXWvQCWyssKCnOpja/kvoTZzJKQy/F14al/1M=;
        b=dlIke/1upn+MP2ZCNDKULlv4Yd9bBxmJs9HWWetjy48nYTCXGx/ERhVS4RqMzyhv0m
         NhO+3ahojvZW+JIXOJcy97ZswgPKRwmm5XstGvWJGfSPj1gkcVBzgaBa9BQrHk22D348
         SD02fIFE4w35/f5ZCYALnBCnNQvitigKXhdR3syx/wNCgDUCyLdka1onLZ9tHl8JUpj3
         3S037Bj6PwEOUV3S4hwy8ZqaaJtSorTTA4PklZpFV8Wnt1fN7U85qTu2b8Wcken9WRW6
         x0mIYVpk2gdV3ygRnR1Al2Ra7TFmY+IjWpmkcJFZlxzbXWqiv+8sLXb7jPATdlzOCGdZ
         JgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847874; x=1791452674;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zH7V34OXWvQCWyssKCnOpja/kvoTZzJKQy/F14al/1M=;
        b=fiKk3iUMEjJxvMBVfzS5cOo91LkROAqriPQ5F87MlxQLQE+lOTFFjSqxSef8WJOwYb
         0eNOH6QLNKxtLZfcNlvTSffvvNlx9I0vP5rPjacN1+VdrmJvg9DOKmdDLLH3u+VfFO/g
         rQDcOfNNd62I5sj3EWV7PJY1VbBL8gXTCFXZZNEwq6AAqD8fDnJzjH1kcxQ/sLPw7Wi7
         mFOKEfsHwEtC5tJZmCzfTHFmweG4Ir82UKOlKtkg2Sc+Uz0cPJjRlCdAUDzxgXaTLkfA
         MteVF6UmJj+M6R4KtBqelFlfoR0Fxf1eUGUICFi4tX/dxxZRz/NKX6H1GP9kBAR1iU9X
         67Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxJ44I7cEj9czaZN2Fq4wUVuQFQJSU08q7OSQJouSwiCAgslieQT3VhUfEG8EZJgfdUeTltJ50+VKuP@vger.kernel.org
X-Gm-Message-State: AFuF++ktW7huoz2H8HbL+5FLD/U6WhDZXad4sS/FvFstWU+SOhFFzVLw
	L5i9vSBIdz+eR9P8jdfTgKHbq5kLcNtTyaoLZOXmJGAKGO0JsnP7hIRj1OcR7X0Xhvs=
X-Gm-Gg: AYBFou3KfFi3wmpm0jiDDJWaCquIEyzNiB8EzwvtL2GsC3KMStWSzcwGRoSrcUD0xBl
	1N3cmpipLzMXHXzcxDULh6vjA0VRgqykdRLi/2NdOwqLc0hB0dtHM1HcUcrbt4wxXFjccHZ9RU5
	iz5TAGu1kSQ6PXHXIsqLZgzYicNB2QqjwzgsTy8+gb2PYIvGlXN05mIVzNYz/l1x6k/ugSSWe38
	BwnA23q+cxEUP5nLwsxkHTQb7DKf7zaQXzS4D8hUSdKid8Kkqwoq8MbqiRAJmI3kzwydHn+UKUB
	hhp5JzEdKLQiVfp/fhG2erOLyngfgHz/4VOxM94lVQlx+HOQhIQgYXoQYz02JNCWiA3uRmCat35
	q8axMWMDtHdCN4OF0oqYrUkJyr0HHbkAQ+SScyuXry382YeJAo2CIdIn2c5Pt0Qqu30+0gIHA1P
	J4TWBpqeXWuCtOP2yoiGw6MpjScRnYUETwir8/PSQIr7cqi0jttWHFwQuSClnZJLF59AtvGtugr
	sLWLj8POOUIIq8Ff8i0S/p3f2v8
X-Received: by 2002:a05:600c:a015:b0:4a0:22d5:9087 with SMTP id 5b1f17b1804b1-4a022d591e7mr16229865e9.31.1790847873729;
        Thu, 01 Oct 2026 02:44:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01fa137basm53110945e9.1.2026.10.01.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:44:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Jacky Huang <ychuang570808@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 05/12] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-5-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
 <20260930-perso-ma35d1-upstream-clk-v6-5-48937ee6c9bb@bootlin.com>
Date: Thu, 01 Oct 2026 11:44:32 +0200
Message-ID: <1j4if53gcf.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 30 sept. 2026 at 19:24, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
> possible parents, but the driver never registers the corresponding
> clocks, so these parents could never be used.
>
> Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
> and pclk4 and expose them through the clock provider.
>
> Reported-by: Jacky Huang <ychuang570808@gmail.com>
> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/

Is this is a mistake ? We usually add this when applying 

> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index 6aa42a3e1be3..c914079cee2d 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -17,7 +17,7 @@
>  static DEFINE_SPINLOCK(ma35d1_lock);
>  
>  #define PLL_MAX_NUM		5
> -#define	MA35D1_CLK_COUNT	236
> +#define	MA35D1_CLK_COUNT	238
>  
>  /* Clock Control Registers Offset */
>  #define REG_CLK_PWRCTL		0x00
> @@ -544,6 +544,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  	hws[HCLK3] = ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, 2);
>  	hws[PCLK3] = ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, 2);
>  	hws[PCLK4] = ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, 2);
> +	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
> +	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
>  
>  	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
>  	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
>
> -- 
> 2.55.0
>

-- 
Jerome

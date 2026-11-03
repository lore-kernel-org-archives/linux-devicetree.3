Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707933;
	b=f1LJlCuhqTrtGEPlHsX1Llsm51pif++b32px57+A77soAceI85tX48Yl27RVFLvXWBEx
	 18K0UL52M9hYpMTqUXs3K1RhM3svUtdZY5bhVPr2eIknZX1sV11JLMO6gyTysQpCcls9X
	 Dh7ojXHMeMScnyArYl0JTrYxZzmJO5uu4fnZvN9KC2Cgxc/ri8eRxmOC3mBr4QmVg/8AR
	 Ul/8Znr7WdFAcRg+ZmAcdDyPF8yVK08L/5BjW5kr6104xC84anYmDvpRLK7dnPMwEPU2Y
	 UUh22tMjLQzlzfA46vQTzTPwLXPjilE45zv7VYKewoN5Pd17CsWZEqp/TKv2gRKlffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
	b=iHtFk7YXhL0fvKQH7b2wnxSvJlqFL48QstcUTEEpHmcvX8MJ9B6g7TqcuZT7Xo2pDTnq
	 kkcBS/YyZY43oM9tCfujYCSNG8vhNQcL1lqGReiYqYeqsOVO1x3cLScreRh4fGZsRt7u4
	 eTijfs90bU3CEQeTeru9Q/pPo1V8sz6X468hkLxFaMCtcv22pMcLKoMyczY9c+FPd8emt
	 moEbDOf9MHo3YQVOZhRIDyCA8F3E1OMZONT6hXjv/5hl75MfBe/0VN4Q8v+kE67j2pCuj
	 oeVtVsopHgzAOtd7G15K1E79PpX8r4tDKxdtIvLJ4VP65sveLr2yUrwO+sjnThxyM2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGkxPCLX;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08160606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08160606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGkxPCLX
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so2593815241.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707932; x=1794312732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=DGkxPCLX5GXvmx7M8dJnArR00vt8VtdGbHun9M0TeHbmz4k8r8YkOtmJx2Ok4rPPHu
         +IyyaebAkT0PCI9hcq6wWzwfa4+Ir39EyF1hBUB/YTm2aqp/Od1kw10j98TRkpxAOopA
         /YpE4umx9UMpsxEa3EJScBaoG7kCMx9RaFx0J50OYl0Ug5qm1Iu3MyvpXCjT70amlUX2
         eF8iQyRRquy4+y3XIOlPL8Ompve33U3UDw4XHE5tjYNsw/J9X0bTDrlWIohLLzjCeAvk
         g2lrhjn6EqumWcrGC/u0MrminOOvZ+mrLuaBfCngZZajxspfBocPmHuNRO1M1AD2OptY
         aUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707932; x=1794312732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=j+xKg5fM7ylmU8dqcQJuDQYzGnBL+Sm0wl8z6X4fNafv6JWla/ow7N0x63SDD51Y4Q
         hrXsiupG/qtCgRbWWZFe9vKoE0t3ZwP651FkygAEg7HvTnBSij0WGutoqw2R2nkzEQt/
         qgEb9h2danO1+qWggpH6yiaAXLgVyNs6LUxm+bcdk7VOk1M9JP+FT48Nzwmp4AEop5+c
         fhilGfmofLHZ/vqC67LsDgRDadJPGsj9YPwFDDkG6ZVwOWqR3RfZvnlOetNbP/o2PnbV
         UCOQuG3BoLPFlA2AyJciobR56qlxbXq4E/CZMm8DgLuoMdj8jC+kvWOm/KtJbsc+S/DK
         icBA==
X-Forwarded-Encrypted: i=1; AKwUvByNqm0ji28ZdbbfwWDlyOEj3Zj6UKaK53Mpsx6rWY+FRVouqKNQpM0ajuyqlgkj2dJDaAQfzc0+BYtn@vger.kernel.org
X-Gm-Message-State: APuU4Z8G20/V8tOAMzFHl1ZWGD1/8fhg1aJ97y3uCjdFUa7hwW9uRnTv
	KGxKWxmI1nqD5//H4xGn4P1TfoUGrpUvKFLotPfs4rH9dQYPwsa6fOlm
X-Gm-Gg: AYBFou1RoDC0WM/u1diEo5gSCR94RLSgcJiaQwT/0teINJA8QpIhsi0tepnjy90JSr3
	Ws+k0fjQ9Uamk7VTeFcFiHI3pij1ELxjYBlljTm9inN6lv2YMzIHdD9bH+oWOTDUQCwWADemij4
	TfdcKQpPS6APk8+UnqtPQpnzEIO6/DlY1rB+AveQAMrgzMAOLw6Z0RkhQ3X/NZm/J+/L/L2qLPJ
	4JsZwAdP4i3wiTv6BveEqBqzXk2L0rzlmt2E9u4eGPQGTgHvnWL81srh1mEuB7B0iVoe9kjZbfx
	Hz5fKOb9HrHnlpWABFdnoq7j8B2GPRxNkBuuAnjObRdp5osm4hzLP2mo9EcKEwC/X9zyX215ukS
	+U0FrASspOqt8HUjWFnGKKmGjyL/Bx9vywro72fXa5HyJTKoSKaxYo91xZ5MmYk98986gm8hHjx
	xLEqsW/4QWpS1/LwpA/Rdq1RQMCOYZ2M1VpMjgxIvW5weYcF4qXgM09LvyH63HU1OdB5lEqUxq9
	nmPfjL0JqUUUAAZE7gefGSAwuPzlsFTnFZFYeLSvE85uiPQk/DT9A/oGvJJDPGg/QlPT/JS4H+H
	Sk86btO65qYgsFdLR8UPCG1N36TWOZs1ZsDOhR8p7UTeNLro5Ns2BmUraOaKF6uqBEY3ORLH6BL
	xwsu/nNrnUDJSvY6jWieP4xitLH0gx9aFvmjx
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5461054137.16.1793707931886;
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm12606282137.6.2026.11.03.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Tue,  3 Nov 2026 09:11:49 -0300
Message-ID: <20261103121149.33238-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech> <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On 11/2/26 16:32, Andre Przywara wrote:
[...]
> > +static const struct clk_parent_data usb01_ref_parents[] = {
> > +	{ .hw = &sys_24M_clk.hw },
> > +	{ .fw_name = "hosc" },
> > +};
> > +static SUNXI_CCU_MUX_DATA(usb01_ref_clk, "usb01-ref", usb01_ref_parents, 0x1340, 24, 3, 0);
> > +
> > +static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
>
> Don't these two clocks miss the gate at bit 31? So it should be
> SUNXI_CCU_MUX_DATA_WITH_GATE instead?

Yes, both have the gate at bit 31 in the manual, and the vendor CCU
models 0x1340 with it too. usb2-u2-ref resets to off, which is the one
I hit on my board. usb01-ref resets to on, so nothing breaks today.

With the gate added, clk_disable_unused would switch usb01-ref off
unless something claims it, and in my local DT nothing does (the
USB0/USB1 PHYs take osc24M like the A523 ones). On my Cubie A7Z,
clearing bit 31 of 0x1340 at runtime stops the USB1 Wi-Fi traffic, and
after rebinding EHCI1/OHCI1 the device no longer enumerates (error -62),
4 out of 4, while it enumerates again with the bit set. So at least USB1
will need CLK_USB01_REF kept enabled once the gate is added, likely
through a consumer in the USB controller or PHY, as suggested by the
vendor DT. I only tested USB1, by writing the register, not the gated
CCU itself.

Thanks also for your guidance throughout these discussions.

Thanks,
Vinicius

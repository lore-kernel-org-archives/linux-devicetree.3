Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D900349AF6
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013705; cv=none; b=MkGxGDbg0L9rccI3k+ExDMBhG1KrrrTRrayQhW2YgReJwoJo5i3CdlddKrEev3Sufo7KSiXb0ItM9J1O9S51vIWn2Hnkc5lwTGGeA2x1nQuynlZj48/TfBJpg15rpO3Dd6B0VBeaRDmrSzHxmihMKofa9cGZSUXXAg0vPyZFzFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013705; c=relaxed/simple;
	bh=hEhWSLr++Q/ZGR1Ejsv0vtyDLrUAeGLaq6Kk+8WBNuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+wGJsqZ3KpvM5fHIB2M+NlZZP97OVwPL+66Erk4+GtcQMdobC+XlsNj9gt+T4HIqMOrCyfq8fqHvW55CkjHPLHM0CGeaF2GGz+waZUfUvs4Rt3mrSb3hdNzoPHBHaKqPzl/Tl0DbVzIuP3mvA7CxsXoRXVdEfwAnZduNzF0KKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQm1+0LQ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQm1+0LQ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e50979c71so204462885a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013703; x=1783618503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=nQm1+0LQyM9vEm9n2kCqV1hHLXUq0Suz+isMNUytI1vJ3jpuJtUK/xZBo/CqjkO1lR
         Ylj7hz28FvAOAaiFEopghyY//q5B5FGxDyXahDIQqgouGXDOmqlruLORcb8co+jy8OAQ
         DeRYVhLI7qurA8FSsjwcat9N6dmKpKuAw9L1VOt5gRj0E+li5HUi5V4BeIV2Hr4FJifB
         E6NPX9hKQT9iCrkl2ot2N6x+qgO1B4vQr+G2XHlcPlizBy6NDL7MJ/ltOa+GoBjJOrQH
         4qrx6Ex8rt/Owk3oGNGFpTqzqdvzOLMSo+jb7SNe8gEUuGugn34LVLDkMUD2hw3pcAw0
         zWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013703; x=1783618503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=bZwgDxX7oxA8I1FelNNufENYawczW5R6sC0ASQysJdLdAhjfKz4U3bWADWNYZJ8q3b
         0Hq2/E76X60oCx6JMJiJoEuFyY2Qf4Lr3p7+8Zso++PkumsABYQm8xTqc0ruH5ZFDdbj
         89oAhwLXkoQ5p2xRCbIx7XG5a6UrBr4YC+EV0ndli9byyZzXim6DJsqaUD1610yNjtsa
         /cccPxXOso3lR8FtAc9lnseUU+AFnW1x5ECzkQRnc4oOGc0c3fmEIXOMLqMHGlh9xbmA
         E0l44CTPL3Lzz55JszWJiGjpjNjLp98SjiYBfVwkyS/H9zMxsJcl0xSa3VPZjrbbUB2m
         8U1A==
X-Forwarded-Encrypted: i=1; AFNElJ+G9XMZIWjiW08J8AHKqwWEIjTPQ6LZHPTWmYo0BXmQoGLsA7TZ0sSezM1KCjnygnG2QSHIqUJKPfKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YweknkfqPwiLfFu+D+xmyVFz364QBpnqvXCxbP0uLfOUAC5h0zD
	B5WD13Xr1YpzkBWrKG+TA1/YWJ0it3RPLk35YvUbenOf3LaGFdH/gQm9
X-Gm-Gg: AfdE7cndvWasEqPRyCmoh30SHJ8gDdGTOjPZN+7l/XPSZhUaD/P8XCNOKbvE5RZco/S
	5zSaP4BMJmbfRTvXp6xzWGxILRGr/xDs4q8yhsp9Ms5X0lGW23je0FCoUnYP6mT20WEffQYTSTE
	K4USBSOiiyqqTpKRKr09i4pQFdIQvwS+8j+ykdvm7fO8TZlJ8DR7nVc3Bm0sMLW0nYWGrntttrz
	SXlAzZk52MW4BMgA/lB+Z/BE+lgJ61wi7xE3yZixRRcJ1RAZUjxCj7WoK6VfphHjy2hxWHsjyAD
	dXYpUFoqkM+P+jw58L9l/+yzuK6Pgfiocs2ifFcIxd3ylf8f1HtA+4l2OYVryXgYmpF8zSf3U/C
	ZDEO/SqgA+OCkA4mJRmXl3i+azhSgXIlvbdPO/4otYRWeiuav03y7VwB3zZTDRNqaNMjZdUrcnK
	CXmy4HjntMod2FTYsz8wzIu3uP1BisEeCfkBTq68DeWg1Dodnxd3HbjL7vAxUB
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr907524385a.18.1783013698575;
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80162220sm268889985a.25.2026.07.02.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Thu,  2 Jul 2026 13:34:54 -0400
Message-ID: <20260702173454.855897-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Following Andre's suggestion I went through the bus gates in this patch
and compared every register offset and bit position against the public
A733 User Manual V0.92. Findings below; everything not listed matched
the manual (122 of the 135 gate entries verified clean).

1) UART1-UART6 gate bits look wrong:

> +static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb_uart_hws, 0xe04, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb_uart_hws, 0xe08, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb_uart_hws, 0xe0c, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart4_clk, "bus-uart4", apb_uart_hws, 0xe10, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart5_clk, "bus-uart5", apb_uart_hws, 0xe14, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart6_clk, "bus-uart6", apb_uart_hws, 0xe18, BIT(6), 0);

Each UART has its own BGR register, and in every one of them the
gating bit is bit 0. Manual section 4.1.6.141 (0x0E04 UART1 Bus Gating
Reset Register): bit 16 "UART1_RST", bits 15:1 reserved ("/"), bit 0
"UART1_GATING - Gating Clock for UART1, 0: Mask, 1: Pass". Sections
4.1.6.142-4.1.6.146 have the same layout for UART2-UART6. So these six
entries should all use BIT(0); as written, enabling any of bus-uart1..6
sets a reserved bit and the UART clock stays gated. (bus-uart0 at 0xe00
BIT(0) and the uartN resets at bit 16 all match the manual.)

2) SYSDAP gate offset looks wrong:

> +static SUNXI_CCU_GATE_HWS(bus_sysdap_clk, "bus-sysdap", apb1_hws,
> +			  0x88c, BIT(0), 0);

Manual section 4.1.6.92 puts SYSDAP_BGR_REG at 0x07AC (bit 16
"SYSDAP_RST", bit 0 "SYSDAP_GATING"), and patch 8/8's reset map already
uses { 0x7ac, BIT(16) } for RST_BUS_SYSDAP, so the gate here presumably
wants 0x7ac as well. There is no CCU register at 0x88C in the manual.

3) Gates without a register in the public manual (V0.92) - these could
use a short provenance note near the entry, as discussed for other IDs:

  - bus-spi4   (0x0F2C)
  - bus-sgpio  (0x1064)
  - bus-lpc    (0x1084)
  - bus-gmac1  (0x142C)  [same question as the GMAC1 clock IDs]
  - bus-tcon-lcd2 (0x1514, and the tcon-lcd2 mod clock at 0x1510) - the
    manual documents only VO0_TCONLCD0 (0x1500/0x1504) and VO0_TCONLCD1
    (0x1508/0x150C)
  - mbus-gmac1 (0x05E4 bit 12) - bit 12 is not described in the MBUS
    Gate Enable Register section

The remaining bus/mbus gate entries in this patch all match the manual's
offsets and bit positions.

Thanks,
Enzo

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876947;
	b=iw2ZpK5Vs5/LzL6pFl2fBr70sDxyeCw1RJO4HlHv2ZRsFeWSN4lJKLjEnsX1LZEQOA8C
	 63zM3tuHzzDMenkZe1QODTg5JvMT9wkSMlPoypX+veLkD1eE+Z48BtQlPpJQUitIrFfuY
	 UPAxEBAl2q2Pc0/W9ONg4h7wSTRK1WBUc18YSKkCy+8H3CKgPr+FFbYgE/cqUn3ojGajE
	 w5swGMo7XL/KrkYjXv8RDkK5l7LW58ZUk73O2nORzg7Dj1UXLNJ9mubhbP6Bzwnwn9fD3
	 HKh/r5m+MOHLlc4fw459RraA1sqGTBicf8/612oElEtX+LIsN28SY9XE9l5HBF5ifdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876947;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1DK4LwmCNpd1ho+cSH+5j9wFPzA55uu7znxxaqB/BwY=;
	b=D6H8RPkoXsLo20aoyUYJf+j8hlfXdDY6jCC9qL5RJ4S82k9xz04SNs6RYJD5FiGnP1NC
	 KipA9BZVhG6p3+HxpfbGCmS2+q/ICfOuNAX0DFuGhTOh/DMnqEsTL36VGX7FQJEWJh+AU
	 03kflJlQ7ATMQQ38jY7Rp3cxf5uQa2smh2gMM5HHO/XZe7v5P0U6FbI4D933iSxfw4Svu
	 egX1kFZy/aYVabCB8bmskw5Dh++IGgV9a/fTEVkzsJbUJ6MWaIRMWeYTx1s5XfS4yfrKd
	 eqCuxLEk7nKCLxOQ064x4YiXijcxFxNA9j1K8NmjgiZrNZ7LRG55UH6em7d/D0jeUjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B9606A31F;
	Sat, 28 Nov 2026 14:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xXJcv-000000003a7-3taX;
	Sat, 28 Nov 2026 14:42:10 +0000
Date: Sat, 28 Nov 2026 14:42:06 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
Message-ID: <awroPiqKWB6Wl7yE@makrotopia.org>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
 <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech>
 <20261125115320.3692954-1-alastair@d-silva.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>

Hi Alastair,

On Wed, Nov 25, 2026 at 10:53:20PM +1100, Alastair D'Silva wrote:
> While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
> link-up and DMA broke as soon as clk_disable_unused() ran.
>
> ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
> the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
> bus-msi-lite0 is only its register configuration clock. Referencing
> ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
> shared fabric, and gating them off breaks GMAC0 DMA.
>
> Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
> CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
> driver?

I see the same on the Orange Pi 4 Pro, but I would rather not make
these two gates critical.

A gate in front of a shared fabric is still a gate that each master
behind it depends on, and the clock framework already handles sharing:
every master that needs the fabric lists the gates, and they stay
enabled as long as one of them is in use. The A733 USB hosts are in the
same position with mbus-msi-lite2, which both EHCI/OHCI pairs and the
DWC3 controller need, and listing it in those nodes is enough there.

Which masters other than GMAC0 sit behind MSI-Lite0 is not documented.
The vendor CCU marks both gates CLK_IGNORE_UNUSED, and no node in the
vendor device tree names them, so the BSP does not tell us either.
CLK_IS_CRITICAL would keep the fabric clocked on every A733 system,
including those without Ethernet, and the next master that turns out
to need it would work by accident, with nothing in its node saying so.

So I would suggest letting the A733 GMAC binding take ahb-msi-lite0 and
mbus-msi-lite0 as two additional clocks, with GMAC0 in the dtsi
referencing them and the glue driver enabling them, in place of a CCU
change. Any other master found to depend on MSI-Lite0 can then list
the same gates. As you plan to rebase the Orange Pi 4 Pro Ethernet
support on Jerome's GMAC210 series, I will raise the binding side in
that thread.

For transparency: an LLM coding assistant helped with the analysis and
with drafting this reply.

Cheers,
Daniel

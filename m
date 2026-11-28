Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795891262;
	b=sm/x5fyFFEh1yklzewJharT+MtKo9JmDyTSCRr7TG5jmH4bxASRCorr10cufzlhD0MMl
	 NUX27Sn1ODcIgzp8ENI3QbIIszmaLJUe8ubnyVuc109hDTuLOPiBqBhsCQe1d1X0QNdJn
	 JTF8cppjNUBPqbuqHRuIeyeagiCq0l7CegqVG/rZtaMnY2e/N6ONdTZCEqEI2Kokrs2xE
	 C3VVrPFcUoxcTjsF3WufyQA2iFuPhBsaoyk9CklM6F0QiQntLynHMqPZ/LIzlAObl2ryf
	 E3lXhhW8jnzcSOZCZ0c4+7IuWLTC9mLW97VV7fkJ1y+u6W+cIGRMxRAP3H5zyZL2dfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795891262;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=bD+u1GSoGUo9De3k7P6T7dy69rP9VHGiIPN7UvmwbWA=;
	b=f7II+OGa2ve7FtiSjMrGs+E8EZIyNoJ/MdKGL6Nm+1u5nAzA5f0EQQ+8xUpvdGL2sghB
	 8Tg/h8DHX7OYy4BgXMHm8w+JrABwDq/UMkmu+ZXES8KjI5diT9JlitKoWOcNFQJ0rBsnJ
	 jJWI4a2aed8icK87VT4z3yCr6BM6G2Jlbn1UKKR9y3lvwpyb7EsinvaewLpmWSNPCHyZO
	 2lohl1JZ690AIqGIbnLmDk6nXGgeeMJqcK1T6QUO6id/xf9igZjwPZ0GLJtxhmW3tQNUR
	 OfBLxXrcp4J0eSykklcOS1aUoM1Ygr1n0ei41BBHBXgQa1LFj9Gvu1hWt3nwVQ9wFbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RbwgLavl;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6541606A321
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 18:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6541606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RbwgLavl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795891258; x=1796150458;
	bh=bD+u1GSoGUo9De3k7P6T7dy69rP9VHGiIPN7UvmwbWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RbwgLavlkVS0/L0ruPFWmBOTig4e8iD1a5xVR9C5+s4rIkNpIoUglBuN4u/D4flSg
	 xIkUh1gs6nxWjsyn7GhzR9m3P3zU7om0+Hv+qdRXbxzzb/js8wWntiKOHYP4dWuY9b
	 vcD9YFFGIABWE6vO6EmbW/GfhfuwVCsvGdWrd7mV5alaXUNop5NJJOkzmSXnSZyyTn
	 MmHToCCZ+7B7DcaT9SISvmysFETFUu9X8trbjBGGG0RkMIS4VtzFAIOHTEY/UsRuid
	 FDz/7HX4LJhJOHM10x08PMCyzRuLeaIeJ5j+/J07PjT2kcjNjBbi1rqXVij6TpQew5
	 pti8+/owz7BNA==
Date: Sat, 28 Nov 2026 18:40:46 +0000
To: Daniel Golle <daniel@makrotopia.org>, Alastair D'Silva <alastair@d-silva.org>
From: Norman Herms <dockseed@proton.me>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
Message-ID: <3226b5c8-c10b-457f-85e4-a3dc43d31d1f@proton.me>
In-Reply-To: <awroPiqKWB6Wl7yE@makrotopia.org>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech> <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org> <awroPiqKWB6Wl7yE@makrotopia.org>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: d272de9c8153ee5d3cbf5de6e19d8b3b21a01606
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 02:42:06PM +0000, Daniel Golle wrote:
> Which masters other than GMAC0 sit behind MSI-Lite0 is not documented.

The A733 User Manual v1.00 groups them in its memory map (chapter 2):
under MSI_LITE0_SYS it lists GMAC0, DMAC0 and the crypto engine
(CE_NS, CE_S, CE_KEY_SRAM), together with the MSI_LITE0 registers and
SECURE_DEBUG_CFG.

I checked this on a Radxa Cubie A7S from userspace with devmem, clearing
one gate at a time and restoring it right after:

- ahb-msi-lite0 (0x5c0 bit 16) cleared: the GMAC0 MAC_Version register
  (0x4500110) reads 0 instead of 0x2053, and a value written to
  CE_TDA0_NS or to the descriptor address register of an idle DMAC0
  channel reads back as 0. With the gate set again, all three read back
  correctly.
- mbus-msi-lite0 (0x5e0 bit 29) or bus-msi-lite0 (0x594 bit 0) cleared:
  register access to all three is unchanged.

So DMAC0 and CE need ahb-msi-lite0 for register access as well. If the
gates go into the consumer nodes, the DMAC0 and CE nodes would have to
list ahb-msi-lite0 too, not only GMAC0. Whether they also need
mbus-msi-lite0 for DMA is open; I did not test DMA with that gate
cleared.

The board ran a 6.18 kernel whose CCU driver does not touch these gates.

Measured and written up by AI agents (Claude) on my board.

Norman


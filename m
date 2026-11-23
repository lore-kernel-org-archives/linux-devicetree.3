Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428804;
	b=wCTZ83uSpHBDi4Njyh3HyQfgMrVqWuWNEutzdzk424o33UzzmftutKVWkrZwUHmTQnQp
	 U4GsoQ+pJz3TjPsdNvEL52QCezXNZSj/EVUgGoe7sH53joZdWiZW1/yEf5yNdXeXrQYyY
	 smJgoHNB/tkKO3LOeuVcz3iD1dC7j+RDyIyilsYHJiXC8GygYYByOx05uXt5L+opoMZms
	 2kTujRKVFWPjyjuGkCl2YbtalnoZxqQKBxHqaEYedJi1dH1yxlttKeuzNI55yMXXvNVkD
	 n4QiU9Ch30/OdxkMvkXKywJiNeZb4fkFSsV2+KFCZ/234h7ngxP8eFX8W3wRznq/d4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428804;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=I5esF62Nz8TTogsjEuHpbzKKyeh5/z5wlmQTUXgW3qM=;
	b=ymf+eksn5yT++r4dVo+tyFSxujiTrzcw4TxSqKBS7+mHLvHT3OOFqPfVtuottmpZHDQm
	 qYf/8+OAYGSkm+CttoQ+wvk9HHqLTcCWS/EkqhwyqbDbVO39JPnibqZGNqzD6IMxp2UIJ
	 0IYH79g9SsLm7/pQHEENZ18xJARtXRtM1c2PPJaPt3cjd3cdunrh3mkIoTDKBQjQIUBRY
	 nixxGL1dy8bBIeKAtsCP2HH430r7TZvZAbMW4Acur3m+jI7CJq3QdYy452bz0Hp2gDdFf
	 ZslKyBvbzPlArfX/uSKp4GB/3jm7RTP+zqDQCdaVTwg/VR2buWx1kWaBQ5D/WUMie5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guzBRXk6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D642606A685;
	Mon, 23 Nov 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guzBRXk6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE651F0093C;
	Mon, 23 Nov 2026 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428803;
	bh=I5esF62Nz8TTogsjEuHpbzKKyeh5/z5wlmQTUXgW3qM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=guzBRXk6OIZeQxvabaI0poa/i7R7aIVKP7azlVKghJ/8Q1T/9MPmdzC+HNyYaBVQw
	 qsaAAmJvpriArycef4t94+TxfzZCwoQNKSif8nmz3P5w3uTyMvfoitLWPDROcIQM3F
	 eZsmtRZ2SCL/6uWT42VKeAW5v3IgjnY/pDYKSptSu66R4hJWht/XwIs110KcVR0MM7
	 eIJCBTBJ/Kp0dr/+EAo0/oO7AuAiALy73j8aSYpgcw03fOc3ZvyJheWNNudwQaC7wJ
	 8dGuFaLlBXOyADibkkhvWkC+CTvp5U6m/GBWvz1+A5vtzZnvH3vt66fi3YxP4roT52
	 D2liqc5iiryGw==
Subject: Re: [PATCH net-next v7 7/7] net: ftgmac100: Allow building on ARM64
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:22 +0000
Message-ID: <179542880231.3135.3272879516767831505@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-7-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-7-33c8ca2d0dd7@aspeedtech.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This commit removes `depends on !64BIT || BROKEN` from
  FTGMAC100.
- [Low] The new MDIO_ASPEED help text in drivers/net/mdio/Kconfig reads
  like a changelog and is imprecise.

--

net: ftgmac100: Allow building on ARM64

This commit lets the Faraday vendor menu and the FTGMAC100 driver be
selected on ARM64 for AST2700, and drops the !64BIT || BROKEN dependency.
It also changes the MDIO_ASPEED select condition from MACH_ASPEED_G6 to
ARCH_ASPEED and updates the MDIO_ASPEED help text.

> diff --git a/drivers/net/ethernet/faraday/Kconfig b/drivers/net/ethernet/faraday/Kconfig
> index 474073c7f94d7..9acc2d260c1f9 100644
> --- a/drivers/net/ethernet/faraday/Kconfig
> +++ b/drivers/net/ethernet/faraday/Kconfig

[ ... ]

> @@ -28,11 +28,10 @@ config FTMAC100
>  
>  config FTGMAC100
>  	tristate "Faraday FTGMAC100 Gigabit Ethernet support"
> -	depends on ARM || COMPILE_TEST
> -	depends on !64BIT || BROKEN
> +	depends on ARM || ARM64 || COMPILE_TEST

[Severity: Medium]
Without the BROKEN gate, RX buffers on AST2700 (FTGMAC100_QUIRK_DMA_35BIT,
35-bit DMA mask) can be mapped above 4 GiB. Has it been confirmed that the
MAC never writes RXDES2[18:16] when it completes an RX descriptor?

The driver header says that RXDES2 is written by hardware on an earlier
Aspeed MAC:

drivers/net/ethernet/faraday/ftgmac100.h:
struct ftgmac100_rxdes {
	...
	__le32	rxdes2; /* length/type on AST2500 */
	...
};

After the MAC hands the descriptor back, ftgmac100_rx_packet() rebuilds the
unmap address from RXDES2:

	map = le32_to_cpu(rxdes->rxdes3);
	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
		map |= (u64)FIELD_GET(FTGMAC100_RXDES2_RXBUF_BADR_HI,
				     le32_to_cpu(rxdes->rxdes2)) << 32;

ftgmac100_free_buffers() does the same thing at teardown.

Fragmented (FRS/LRS) or errored frames take the drop path in
ftgmac100_rx_packet(). That path gives the descriptor back to hardware but
only rewrites RXDES0:

drop:
	/* Clean rxdes0 (which resets own bit) */
	rxdes->rxdes0 = cpu_to_le32(status & priv->rxdes0_edorr_mask);

The upper address bits are only programmed in ftgmac100_alloc_rx_buf() and
during ring init.

Suppose the AST2700 MAC writes length/type, or anything else, into RXDES2
bits 18:16 on completion. Could dma_unmap_single() then be called with the
wrong address? And after a dropped frame, could the MAC DMA the next frame
on that recycled descriptor into the wrong physical memory?

If the hardware can change those bits, would it be safer to keep each
entry's full dma_addr_t in software? RXDES2/RXDES3 could then be rewritten
every time a descriptor goes back to hardware, including on the drop path.

>  	select PHYLIB
>  	select FIXED_PHY
> -	select MDIO_ASPEED if MACH_ASPEED_G6
> +	select MDIO_ASPEED if ARCH_ASPEED
>  	select CRC32
>  	help
>  	  This driver supports the FTGMAC100 Gigabit Ethernet controller
> diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> index 6f272fae4bb55..ec1794cc64b09 100644
> --- a/drivers/net/mdio/Kconfig
> +++ b/drivers/net/mdio/Kconfig
> @@ -50,12 +50,16 @@ config MDIO_ASPEED

[ ... ]

> +	  FTGMAC100 driver continues to drive the embedded MDIO controller for
> +	  the AST2400 and AST2500 SoCs. AST2700 has no dedicated MACH_ASPEED_G7
> +	  symbol and is only gated by ARCH_ASPEED, so FTGMAC100 now
> +	  unconditionally selects this driver on every ARCH_ASPEED platform,
> +	  including the older AST2400/AST2500 SoCs where it has no MDIO node to
> +	  bind to.

[Severity: Low]
This isn't a bug, but is "unconditionally selects this driver on every
ARCH_ASPEED platform" accurate? The select in FTGMAC100 is:

	select MDIO_ASPEED if ARCH_ASPEED

That only forces MDIO_ASPEED when FTGMAC100 itself is enabled, and only to
m when FTGMAC100=m. With ARCH_ASPEED=y and FTGMAC100=n, MDIO_ASPEED can
still be N.

The new text also reads like changelog history ("now", "no dedicated
MACH_ASPEED_G7 symbol") rather than guidance for the user. It also drops
the old "say N if AST2600 support is not required" advice.

Could the help text say when to enable the option instead? That would keep
it from going stale if a MACH_ASPEED_G7 symbol is added later.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428802;
	b=Pog0L3eRYGESrlh0wyNohsGAWhRWtvVQ94YKxrJnyI9+sHn7oob3OVMpQlZXt5yrMw/e
	 W0YXKyr5sKbWMGnE3KsRfG3GQzwx6yTGOtJwZ8VNA+Wf6Oafi8XXH3y2mwKt6hjlZWeHD
	 iusYaKWZjoifkg59EZrepjVtYTONQvl4iHX2iPIKPVsDC+XV43qClG13/zPhHmGb5bgfU
	 SYxClEMNdu3+RoV5k3glzMh1efuo8UMtPUuzZP3e5okOIeqf5rNdnLWMefvWmkkcrjZZt
	 +8CF6JTE/B52k134goXCg8AReWKGjAZR8BycFi5GHacSK+qJv9bAW3MkA1dll5IwdFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428802;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5hbPhvThg+Q3p4Km3QBkH8d3rYKVBP2/SvqjqSd09ek=;
	b=Q0lUGXznnMh0CT4SyHgSThvnQvu2ZKz26OCh9A5i+tdqnI/6XCdAZWL04Wz6lhLqSMqr
	 FzSizs5pEMraNZbMsK1J6sW2B77eQYLK1p30qyEDegirCBZ+EhZxQ79+2x5+CLBj7mKE/
	 a97F920uGe8YskRnaZO81eSsg9IAjQhQ9B2+0GMNm36MArRo6vHueZdqTa+ar1E5jJpXf
	 gikFZHmJ2cBbzTvY2ZC+1yoAHGSKN3TANfG8VWBcuvt8L7VaNjnk3Lu3phPQX6yMqETSh
	 fw/UKFiu5vHWQuNgHgFDx5psHFe9TJx/ddqn9XIDnc85qfwRkTvNOdOx2Xd+oD01DnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTTPB2g+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D2606A338;
	Mon, 23 Nov 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTTPB2g+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDCA1F000E0;
	Mon, 23 Nov 2026 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428801;
	bh=5hbPhvThg+Q3p4Km3QBkH8d3rYKVBP2/SvqjqSd09ek=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZTTPB2g+0kPpH7i4snptX6IWKyJkv+HdLrIsE4msIQtFyGAsfrC9U/CWtxo5lhSPa
	 oknpcbn7MttqC+IXx88bIYHNVs1mkGSoyyBBBPU613dVELSQ5icJfmtxzt9HA/Bmf2
	 ltyqFlFTbmpcV1HyrfCoExoQlyd0QKGEHqJPdoalAYEUpiooPDiQxaTUXY/SsluJLP
	 mgWt/WvgmQlDG1TIB6LhObd3taVDj5aBhtkRbnb2p4i4QD0IaZl6G2+GkDw/UimxAV
	 VtKXh3r7dm/woLmXhAqWT7fiajyxAWognVtYjSRTtYYjJkFXJBCHgPTRO1QnXrvMLG
	 RJ/BweAEyHhBw==
Subject: Re: [PATCH net-next v7 6/7] net: ftgmac100: Add AST2700 upper DMA
 address support
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:20 +0000
Message-ID: <179542880047.3135.13258165085711599944@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-6-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-6-33c8ca2d0dd7@aspeedtech.com>
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

- [Medium] When FTGMAC100_QUIRK_DMA_35BIT is set (AST2700),
  ftgmac100_rx_packet() (drivers/net/ethernet/faraday/ftgmac100.c lines…
- [Low] This patch gives txdes2 and rxdes2 a new role: on AST2700, bits
  18:16 (FTGMAC100_TXDES2_TXBUF_BADR_HI /…

--

net: ftgmac100: Add AST2700 upper DMA address support

This commit adds 35-bit DMA address support for AST2700. It programs the
high RX/TX ring base registers and stores buffer address bits 34:32 in
bits 18:16 of txdes2/rxdes2. It also rebuilds the full address before
unmapping and sets a 35-bit DMA mask, all gated by the new
FTGMAC100_QUIRK_DMA_35BIT quirk.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 5a578a62df673..263594de0e072 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c

[ ... ]

> @@ -601,6 +612,9 @@ static bool ftgmac100_rx_packet(struct ftgmac100 *priv, int *processed)
>  
>  	/* Tear down DMA mapping, do necessary cache management */
>  	map = le32_to_cpu(rxdes->rxdes3);
> +	if (priv->quirks & FTGMAC100_QUIRK_DMA_35BIT)
> +		map |= (u64)FIELD_GET(FTGMAC100_RXDES2_RXBUF_BADR_HI,
> +				     le32_to_cpu(rxdes->rxdes2)) << 32;

[Severity: Medium]

Is it safe to rebuild the unmap address from rxdes2 after the hardware
has completed the descriptor?

Before this patch the driver never wrote rxdes2, and the header describes
it as a word the hardware writes:

	__le32	rxdes2; /* length/type on AST2500 */

Suppose the AST2700 RX engine writes rxdes2 back on completion and does
not preserve bits 18:16. Then map would end up with the wrong bits 34:32.
AST2700 DRAM is above 4 GiB, so those bits are non-zero for every
buffer. dma_unmap_single() would then sync and unmap the wrong address.
ftgmac100_free_buffers() rebuilds the address the same way.

The drop path in ftgmac100_rx_packet() also hands the descriptor back to
the hardware by rewriting only rxdes0:

drop:
	/* Clean rxdes0 (which resets own bit) */
	rxdes->rxdes0 = cpu_to_le32(status & priv->rxdes0_edorr_mask);

If rxdes2[18:16] was changed, would the next DMA into that slot go to
the wrong physical address? Frames with RX errors or missing FRS/LRS
take this path, and they can come from the network.

Does the AST2700 documentation guarantee that the MAC never writes
rxdes2[18:16]? If it doesn't, two changes would avoid relying on that:

- keep a per-slot software copy of the dma_addr_t and use it for
  unmapping
- rewrite rxdes2 on the drop path

>  
>  #if defined(CONFIG_ARM) && !defined(CONFIG_ARM_DMA_USE_IOMMU)
>  	/* When we don't have an iommu, we can save cycles by not

[ ... ]

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
> index 8c35c895b1465..0c244b1c0a351 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h

[ ... ]

> @@ -226,6 +229,7 @@ struct ftgmac100_txdes {
>  #define FTGMAC100_TXDES1_TX2FIC		(1 << 30)
>  #define FTGMAC100_TXDES1_TXIC		(1 << 31)
>  
> +#define FTGMAC100_TXDES2_TXBUF_BADR_HI	GENMASK(18, 16)
>  /*
>   * Receive descriptor, aligned to 16 bytes
>   */
> @@ -272,4 +276,6 @@ struct ftgmac100_rxdes {
>  #define FTGMAC100_RXDES1_UDP_CHKSUM_ERR	(1 << 26)
>  #define FTGMAC100_RXDES1_IP_CHKSUM_ERR	(1 << 27)
>  
> +#define FTGMAC100_RXDES2_RXBUF_BADR_HI	GENMASK(18, 16)

[Severity: Low]

This isn't a bug, but the struct comments for these words weren't
updated:

struct ftgmac100_txdes {
	...
	__le32	txdes2; /* Reserved */
	...

struct ftgmac100_rxdes {
	...
	__le32	rxdes2; /* length/type on AST2500 */
	...

With this patch, bits 18:16 of both words hold buffer address bits 34:32
on AST2700. Could these comments be updated to say so?

> +
>  #endif /* __FTGMAC100_H */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com

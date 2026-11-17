Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945186;
	b=0XfxTgjaPTmyjX9nAaH6i2FsrWqokwIEisTnP+DaxCV9LADau6yb+im/nHqVQSnTpSYO
	 yOj6ygbV3A964vLFSdB/GejNQGOJ4wiHSP8kZcdVWZsqyVpiii+bosvwqhsPy4jOArjhn
	 JyV/hqU1QawyB9beo42SEoizqD0bXhGmQeirPFf5sqRzJY+tA7UJ6EG+OxrCzcvxGdqyu
	 oGCt2A7fd3cZF1ScmQ3udnKT16S4ilOqNdjjP8/iJ2JZDL16afOhVC3C3/VJYGhjuN8nT
	 YniPO2ZBUUfQTiYgFGWFDXWZfOY+WJFY4X/Ml7V1eoXX4rNo9iUmkPEz6m+UijD18jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945186;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uhe4pcuFQQBrgruJxfFIvK3IwTRis9Cusm7BBq0QP3E=;
	b=CfixcG94Dno+JLAkAk0UmOOjVlfu5T00r9nPS/BQs+Ynt/I4JCLUataOU56ACyXDwbWN
	 w6OIt28i631DsJsmmXbPZbd4Rk3xmlui3Y6Gvq0mKYjLpykkDFCI8Mm+3Ts84Tt8zTfEh
	 dbRQ6O7K5wDWU+Gzu0W6MdumeRv06h64/SYf3iOmw36ZbjIRJRk4RvhEfRJ4UZZu2wX/G
	 78tx0xbWVlHVD0IHHir81agBv9eY8P5+NQakfLEYSKY/anIyad1dd8RP08/kZhZGc48u6
	 AEMTmpt8U+8sA1Yq4zWVteTcRaE/jS0lDDlUV8NnhOjnWRV6zukrpvr/BiptZP1/H9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyJtv9gO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BD9606A33F;
	Tue, 17 Nov 2026 19:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyJtv9gO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F691F000D0;
	Tue, 17 Nov 2026 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945185;
	bh=uhe4pcuFQQBrgruJxfFIvK3IwTRis9Cusm7BBq0QP3E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OyJtv9gOyihBHYWaFzM3POKGEme/NSpQ51NsbjMjecngK56HkQzdZsy2Nj6vr+lRF
	 S7kG/gdnltYadG9PVfHFFVSRzlQjF5H+Djl7ZZPJtxo1feu8Y2g6wA6OmxWYjT8MLt
	 XUq9g9+o26wdR8Eqr28Z1VQi19WgovElhzhBxswyOlJqF+vavWMBuetZ7E5xFk8OAJ
	 ndxvIOw2btQQ/CIWmmGS7uoqXzDORmjB+GAcIq2UtQQXEBBN9rtdPZu+7fXZfcGBX2
	 CKx4MBsbO+5A7zRO+DQ0ysEE29YLuTY4+UABFKc2agP5VSj0b+FFfPwVmvWKqTOjlm
	 3x3gbKoCXabNg==
Subject: Re: [PATCH net-next v11 08/14] net: ethernet: oa_tc6: Drop frames if
 footer has FD bit set
From: netdev-bot+sashiko@kernel.org
To: Selvamani.Rajagopal@onsemi.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 parthiban.veerasooran@microchip.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, richardcochran@gmail.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 edumazet@kernel.org, piergiorgio.beruto@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, jerry.ray@microchip.com, ciprian.regus@analog.com
Date: Tue, 17 Nov 2026 19:53:04 +0000
Message-ID: <179494518411.3136.11012925273881298159@kernel.org>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-8-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-8-7a186141952c@onsemi.com>
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

- [Medium] In oa_tc6_prcs_rx_chunk_payload()
  (drivers/net/ethernet/oa_tc6/oa_tc6_main.c), frames the MAC-PHY marks…
- [Low] This concern is retained only because it requires validation.

--

net: ethernet: oa_tc6: Drop frames if footer has FD bit set

This patch adds handling for the Frame Drop (FD) bit in the receive data
chunk footer in oa_tc6_prcs_rx_chunk_payload(). When the last chunk of a
frame has FD set, any partially assembled rx_skb is freed and the dropped
frame's data is skipped. If the same chunk also carries the start of a
new frame, that new frame is still processed.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> index 2b31370da2d2b..5d01ef5a13ad0 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c

[ ... ]

> @@ -1159,6 +1160,25 @@ static int oa_tc6_prcs_rx_chunk_payload(struct oa_tc6 *tc6, u8 *data,
>  	if (tc6->wait_until_start_valid)
>  		return 0;
>  
> +	/* Drop the frame, if footer sets FD bit. Checking FD bit
> +	 * becomes important, when cut-through operation is enabled.
> +	 */

[Severity: Low]
The only scenario the commit message gives for FD being set is RX
cut-through:

  With RX cut-through enabled, the MAC-PHY can start forwarding a frame
  before it knows the frame is bad, and uses FD to tell the host to
  discard it.

At this commit nothing enables cut-through. struct oa_tc6 has no
cut-through state yet, and nothing writes OA_TC6_CONFIG0_RXCTE.

The later S2500 patch in this series adds ctc_capable,
oa_tc6_rx_cut_through_enable() and the OA_TC6_CONFIG_RX_CUT_THROUGH
quirk. That makes this patch groundwork for that change, and the ordering
looks fine.

Can the existing MAC-PHYs (LAN865x and others) also set FD in their
default store-and-forward mode? If so, frames marked FD would currently
reach the stack through oa_tc6_submit_rx_skb()->netif_rx(). Should this
then carry a Fixes: tag? If not, could the commit message say that
cut-through is enabled by a later patch in the series?

> +	if (end_valid && frame_drop) {
> +		oa_tc6_cleanup_ongoing_rx_skb(tc6);
> +
> +		/* Full frame in this chunk. Nothing to free. Move on to
> +		 * next chunk.
> +		 */
> +		if (start_valid && start_byte_offset < end_byte_offset) {
> +			tc6->netdev->stats.rx_dropped++;
> +			return 0;
> +		}

[Severity: Medium]
Should frames with FD set be counted in rx_errors rather than only in
rx_dropped?

For a frame that fits in one chunk, this block increments only
rx_dropped. For a frame that spans several chunks, the
oa_tc6_cleanup_ongoing_rx_skb() call above also increments only
rx_dropped:

static void oa_tc6_cleanup_ongoing_rx_skb(struct oa_tc6 *tc6)
{
	if (tc6->rx_skb) {
		tc6->netdev->stats.rx_dropped++;
		kfree_skb(tc6->rx_skb);
		tc6->rx_skb = NULL;
	}
}

The kernel-doc for struct rtnl_link_stats64 in
include/uapi/linux/if_link.h defines these counters as follows:

  @rx_errors: Total number of bad packets received on this network device.
  @rx_dropped: Number of packets received but not processed,
    e.g. due to lack of resources or unsupported protocol.

The commit message describes FD frames as frames the MAC-PHY "knows the
frame is bad". These are bad frames from the wire, not host-side drops.

With cut-through enabled on S2500 later in the series, would every
corrupted frame on the segment show up as rx_dropped in ip -s link while
rx_errors stays at 0?

> +
> +		/* The chunk carries only the end of the dropped frame. */
> +		if (!start_valid)
> +			return 0;
> +	}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-s2500-mac-phy-support-v11-0-7a186141952c%40onsemi.com

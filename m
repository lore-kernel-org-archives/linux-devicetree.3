Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDD39B497
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301364; cv=none; b=HiTRQJBG7Z5NXeojfNsyzslFhbSxILVMchvPklMSN3AxsDYnJKDoSSgpaorpFVFcjhB/E/nOWq+YVO04AO1mxiaVSTIIJseLJ3tKJ7/eAhPw8Cjpcbiif6ZVUHbyfpiJMcdWmSPVAMBrRSzoJ96l/tf6/eUUKqBC2lWNwlhLlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301364; c=relaxed/simple;
	bh=ywzCDqa9gU6auvI4gYOj8pcNZtEeFnqjjWzNBLG6W9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sLXVUiKD8/Ew34wSesNxeV35XAgGdmSCenwPqraJb7PxkaeguuyHYbKvEk2GD7uVKXlvePTZ18p2e4BL5vaGrHFBE4Yz57KQVK6ciRYDiIOadrCmWyfjYoNcQ1RBFYdxCONLfXkMaa/E/zFYmxvYnTOmzuDcCaWq72R4Agh6u/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jot4f1dR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jot4f1dR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B7E1F000E9;
	Fri, 12 Jun 2026 21:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301363;
	bh=vjGox7X9FvKEjR/2wnffc7dwCGlIJqJ6Cdk2RMS7YAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jot4f1dRwpt+7C8l39RIj1y7Glw7Hm9Zqv7aov/lk8zpthmowB+RrxdB5ZOffOI7b
	 Sa3ev4WsbWwjeNTAyRCES5OlVHiLnfG6hGBAnBuzdL9ejYis3nlsHAM9Ifvy/fwjGJ
	 Eh3BiQDNq0ssycS6mgYIFYAay+r9IAGB0ehmMxNATJw2UXLxy1M5P7h2mZs4JzR8sv
	 El52IsQSsnzP5DfwYzDixhYcjccuqWYznM34HWe/bObc1lMe9V2aUGItevTcyh+0+s
	 8XmA0DTCS7G8+bYwr5WBnmuZuSWTlm2IC86smhY8Uu4pbx+RXNpbG+pEE2cI6qjeJ2
	 0xJ6XypxS+wGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v5 3/4] net: ethernet: oa_tc6: Remove FCS size in RX
 frame
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-level-trigger-v5-3-4533a9e85ce2@onsemi.com>
References: <20260611-level-trigger-v5-3-4533a9e85ce2@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 21:56:03 +0000
Message-Id: <20260612215603.79B7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing check for `tc6->rx_skb` leads to a NULL pointer dereferenc=
e when processing orphaned ongoing or end chunks.
- [High] Missing size bounds check for received chunks allows the MAC-PHY t=
o cause a kernel panic via `skb_over_panic()`.
- [High] Unconditional SKB allocation on RX frame start overwrites existing=
 SKBs.
--

commit 47aca7211ccbe61f3e2557dd3549950a622fcf9d
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Remove FCS size in RX frame

OA TC6 MAC-PHY appends FCS to the incoming frame. It must be
removed from the frame before being passed to the stack.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 477ceefde2c54..0727d53345a33 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -785,6 +785,17 @@ static int oa_tc6_process_rx_chunk_footer(struct oa_=
tc6 *tc6, u32 footer)
> =20
>  static void oa_tc6_submit_rx_skb(struct oa_tc6 *tc6)
>  {
> +	/* MAC-PHY delivers each frame with its Ethernet FCS attached.
> +	 * Strip it before handing over to the stack, unless the user
> +	 * has asked to keep it via NETIF_F_RXFCS. Keeping the FCS
> +	 * in the frame is harmless for IP traffic, but is parsed as
> +	 * a (malformed) suffix TLV by PTP, which makes ptp4l reject
> +	 * every message with "bad message" error.
> +	 */
> +	if (!(tc6->netdev->features & NETIF_F_RXFCS) &&
> +	    tc6->rx_skb->len > ETH_FCS_LEN)
> +		skb_trim(tc6->rx_skb, tc6->rx_skb->len - ETH_FCS_LEN);
> +
>  	tc6->rx_skb->protocol =3D eth_type_trans(tc6->rx_skb, tc6->netdev);
>  	tc6->netdev->stats.rx_packets++;
>  	tc6->netdev->stats.rx_bytes +=3D tc6->rx_skb->len;

While reviewing this patch, I noticed a few pre-existing issues in the
same file:

drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_rx_chunk_payload() {
...
	/* Process the chunk with only rx frame end */
	if (end_valid && !start_valid) {
		size =3D end_byte_offset + 1;
		oa_tc6_prcs_rx_frame_end(tc6, data, size);
		return 0;
	}
...
	/* Process the chunk with ongoing rx frame data */
	oa_tc6_prcs_ongoing_rx_frame(tc6, data, footer);
}

[Severity: High]
This isn't a bug introduced by this patch, but does this lead to a NULL
pointer dereference?

If a MAC-PHY sends an ongoing chunk or an end chunk without a preceding
start chunk, oa_tc6_prcs_rx_frame_end() or oa_tc6_prcs_ongoing_rx_frame()
will be called.

Both functions unconditionally call oa_tc6_update_rx_skb(), which blindly
calls skb_put(tc6->rx_skb, length). If tc6->rx_skb is NULL because no
start_valid was received, skb_put() will crash the system.


drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_ongoing_rx_frame() {
	oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);
}

drivers/net/ethernet/oa_tc6.c:oa_tc6_update_rx_skb() {
	memcpy(skb_put(tc6->rx_skb, length), payload, length);
}

[Severity: High]
This isn't a bug introduced by this patch, but can this cause a kernel
panic via skb_over_panic()?

The driver allocates the SKB with a fixed tailroom
(MTU + ETH_HLEN + ETH_FCS_LEN). There is no bounds check to ensure the
accumulated length from ongoing chunks does not exceed the allocated
tailroom.

An endless stream of chunks without an end_valid bit might cause skb_put()
to exceed the tailroom and trigger a bounds check panic.


drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_rx_chunk_payload() {
...
	/* Process the chunk with only rx frame start */
	if (start_valid && !end_valid) {
		size =3D OA_TC6_CHUNK_PAYLOAD_SIZE - start_byte_offset;
		return oa_tc6_prcs_rx_frame_start(tc6,
						  &data[start_byte_offset],
						  size);
	}
...
}

drivers/net/ethernet/oa_tc6.c:oa_tc6_allocate_rx_skb() {
	tc6->rx_skb =3D netdev_alloc_skb_ip_align(tc6->netdev, tc6->netdev->mtu +
						ETH_HLEN + ETH_FCS_LEN);
...
}

[Severity: High]
This isn't a bug introduced by this patch, but could this unconditional
allocation overwrite and leak existing SKBs?

When an RX chunk with start_valid=3D1 is received, oa_tc6_allocate_rx_skb()
assigns a new SKB to tc6->rx_skb.

If the MAC-PHY sends consecutive chunks with start_valid=3D1 (or leaves a
previous frame incomplete), the prior tc6->rx_skb pointer appears to be
overwritten and permanently leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-level-trig=
ger-v5-0-4533a9e85ce2@onsemi.com?part=3D3

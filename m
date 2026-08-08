Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67F3D76
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186009; cv=none; b=A0mR+VSxhrx7Eho1RPtsx0tGVgFIXIcq37DDV8GpNmaqKsKnXXsLtG18tGZHfoHT5dsCrqec7/2+kao1btDk9YgrW5kSm2GIwFjGOtqeJi8t+pdsY95SPVyA+Fs6CVYg7pjjdRDgySfRXY+Kbg/bEE0GoVfOJRzV5TRgOYnrfyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186009; c=relaxed/simple;
	bh=PdUAbK224tyR+ApKMjfQ4Kc5tpCSEKiGD/FjdYIJ4Mc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QFjbwknvAfE/ULa2tV+m9ilwswXck70gzf+X/dFBPE9ax3m9umIG1sLBgagAcF62+sHDlBqulREmrvLNertIPWSzVMdptB0QWY82NBh3nz22tyGn1tsl41Jh00IaWLtLyuY+uILwdAgZCRECS/5QQwu6UCWHYTjPoXPgfM9XLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcn70Z2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcn70Z2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6CF1F00A3D;
	Sat,  8 Aug 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186008;
	bh=+PxPdnibjczNLCGav49ocX9zWDcoNzLmUU4V15GzUTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fcn70Z2qxgs9cK2YMqzHWrI9up+hva7GNZrkn6VPixxKvbvCSKUyfzX+g4V+D0dRw
	 vPsRe/aPaPhr09WixT4Kw2NNreEBdrhee8mfPFIhr8/ztx2BXTDiUD2xtpPVFGWdsu
	 SoWjRCZUToY9a1OeR5NcLoE89zrxOEIy1s+zOA7bsKpCRqmElvsLDEac0NHjK22lne
	 BTm9h2eAu+FR8VlRx7j+gdjueVbSc3LRQb4Tr1LZkTlDG0knnuPle/aqSL4I1ed3V/
	 MRZysdLxXcdZfdRr7oUOGTKCisCoyzBW+vYcOpWqtSlrGI9RRl/2+5ZS9LSYNXp69o
	 SAjGayJZ1h24w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/20] net: xilinx: tsn: deliver endpoint RX frames to
 DSA user ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-9-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-9-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:47 +0000
Message-Id: <20260808104648.4D6CF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free due to unconditionally freeing a shared metadata ds=
t that can be refcounted by the network stack.
- [Medium] API Violation: Queuing an SKB with a `noref` dst asynchronously =
via `__netif_rx()` allows it to escape the RCU read-side critical section.
--

--- Patch [8]: [PATCH 08/20] net: xilinx: tsn: deliver endpoint RX frames t=
o DSA user ports ---
commit 0c90a3d99f1bcc8cd94ff937c6565b0da39afbe4
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Date:   Fri Aug 7 10:44:19 2026 +0000

    net: xilinx: tsn: deliver endpoint RX frames to DSA user ports
   =20
    The DSA core routes an RX frame to a user port from the port metadata
    attached to the skb. Without that metadata, frames from the two MACs
    cannot reach their swpN netdevs.
   =20
    Allocate a METADATA_HW_PORT_MUX entry per MAC port at probe and attach
    the matching entry to each RX frame by its TUSER port_id. Frames from
    MAC1 and MAC2 now reach the correct user netdev, which completes the
    conduit data path.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/ne=
t/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 7615d27f3b360..051285b47ddbd 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -254,6 +262,7 @@ static void ep_dma_rx_cb(void *data, const struct dma=
engine_result *result)
>  	}
> =20
>  	skb_put(skb, rx_len);
> +	skb_dst_set_noref(skb, &ep->port_md[port_id]->dst);
>  	skb->dev =3D ndev;
>  	skb->protocol =3D eth_type_trans(skb, ndev);
>  	skb->ip_summed =3D CHECKSUM_NONE;

[Severity: High]
Can this cause a use-after-free if DSA is not configured?

The metadata dst is attached unconditionally to every packet here. Because =
there
is no check for netdev_uses_dsa(), non-DSA packets carry this dst into the =
IP
stack, exposing it to skb_dst_force().

If the packet is bridged or queued to userspace (e.g., NF_QUEUE), the stack
will call skb_dst_force() to upgrade the noref dst to a refcounted one. If =
the
driver is unloaded and frees the metadata dst unconditionally, any packet s=
till
in flight will trigger a use-after-free when dst_release() is called.

Should this check netdev_uses_dsa() before attaching the dst?

[Severity: Medium]
Does this violate the RCU and skb_dst_set_noref() API contract?

This code combines skb_dst_set_noref() with asynchronous queuing via
__netif_rx() (called just below this hunk).

__netif_rx() places the packet on the per-CPU backlog and defers processing=
 to
a future softirq. This means the packet inherently escapes the driver's cur=
rent
RCU read-side critical section without being upgraded via skb_dst_force().

Other DSA-aware drivers avoid this by using napi_gro_receive(), which proce=
sses
the packet synchronously within the NAPI poll loop's RCU critical section.

[ ... ]

> @@ -771,6 +780,37 @@ static int ep_count_dma_queues(struct device *dev, u=
32 *out_tx, u32 *out_rx)
>  	return 0;
>  }
> =20
> +static void ep_free_port_md(struct xlnx_tsn_ep *ep)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XLNX_TSN_EP_PORT_MD_SLOTS; i++) {
> +		if (ep->port_md[i]) {
> +			metadata_dst_free(ep->port_md[i]);

[Severity: High]
Is it safe to unconditionally free the memory here?

Since the metadata dst was attached to packets that could have been upgraded
to refcounted references in the network stack, calling metadata_dst_free()
(which calls kfree directly) bypasses the reference counting.

Should this drop the initial reference via dst_release() instead?

> +			ep->port_md[i] =3D NULL;
> +		}
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D8

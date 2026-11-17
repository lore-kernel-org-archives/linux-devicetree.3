Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954838;
	b=UNDcYpnS1tgHfLYXX/Bh+ewM3fBAXmpy8YhE+Fy2DHwPMv0ItE5AlCl+Ybyr5HmZg0Pk
	 u5mJdXL7qobqOuKnfFrJjuLUcz1nFH6gz7V67ecv/0o+YC9nLzQuGa6TptbpCivKm99Fy
	 7X2AIdlSrzWrHdm2dXxsTmqtLOiSfMRiK58b9mXpPCNAnUdBupusni+O1WNfZrQodiKd/
	 nBxf5VNaTOAvCX8GAJ8MJofBWnyrCi+PV/Y0L+p0T+wmd6emYnKSdzu6cutW7SrArhgju
	 Selqe32PPTZEzzLL0xa1Tp1eFrV7SaA8HokrG0xH/H4s5waGM8D4C4uwzSkH6LdHXzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Gud+W9G6jvZ6kYgt9KC0crblnlBv5J7633jR4SFHHEM=;
	b=wC1fg/UUvfF3hDdANZoaafCV5qLirv9FJcDWCjhFFPHiyyR/qMVM78qyQKPhQ8/derKA
	 HxpCvE5s34eKrBt0HZkB/dsHDGKVFkA3UNTnXUn5/zbM/PNUjzUzSs3RoFZz9dmc8CjRP
	 yjv+zfKpMPwxpzXm6GWMgwMxdLoyXCHMt6V6XJEYqH1XS4fDmrKuRRz7t0bHdKN5nclIO
	 nkDyJi06FMzzF0aH3yL6oTN3Poe7G6DAw27dDPN8zJbFpUgxz8sxPzKpACtuB+inlR6Wb
	 vluGkEpnANqpYQAUUc8eqPmdwSQFTLoU4E5qgYOF9x2AP8MZD3lg4S2uxxyBs1BSlxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGdYegrd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2A606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGdYegrd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED4C1F000C4;
	Tue, 17 Nov 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954838;
	bh=Gud+W9G6jvZ6kYgt9KC0crblnlBv5J7633jR4SFHHEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGdYegrdlZV+73lszD/P4gPCZbbNNlofC8993p2F0+ozBPd3yXjMjZo6G3NyHCdw+
	 JJANkASwgLEQFZFyfCMj4g980ad795fW/2wNRXiO8t5nP4Kck05KrKTVJp8nUDewxo
	 xjvS63m2lm/M+v5PLiehMR9H41sO7Te/AozMt1c/QRb1pSXPeI6Zz0hfuQPpcTihVO
	 +dK4hOf+qYnkgmQRGY/M9gt8kUkuG1WRI+XtC4CsBIy8Aiv/I+jtwxrDptCA5DS1VA
	 cJK0BkjCHTysMl+I01vUUDmW6jqXkcFx245uN97VcjATUH4iEUwXJ+2Zg7486iHqnz
	 +TLsUcs/mV7Gg==
Message-ID: <sashiko-outbox-219750@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/9] netfilter: flowtable: reject non-host IPv4
 packets before lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116222519.1416501-3-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-3-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 22:33:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] netfilter: flowtable: pkt_type check in
  nf_flow_offload_ip_hook() breaks bridge and VLAN offload
--

commit 2c508624181706744cfb38cdb730adaefd3aea13
Author: Florian Fainelli <florian.fainelli@broadcom.com>

netfilter: flowtable: reject non-host IPv4 packets before lookup

This commit returns NF_ACCEPT before the flowtable lookup in
nf_flow_offload_ip_hook() when skb->pkt_type is not PACKET_HOST.

> diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_tab=
le_ip.c
> index 19cafae748abe..98bade1b82994 100644
> --- a/net/netfilter/nf_flow_table_ip.c
> +++ b/net/netfilter/nf_flow_table_ip.c
> @@ -911,6 +911,10 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *=
skb,
>  	};
>  	int ret;
> =20
> +	/* The ingress hook runs before IPv4 rejects non-host Ethernet frames. =
*/
> +	if (unlikely(skb->pkt_type !=3D PACKET_HOST))
> +		return NF_ACCEPT;

[Severity: High]
Does this break software flowtable offload for bridged and VLAN interfaces
whose MAC address differs from the underlying physical port's MAC?

When a flow is routed over a bridge or VLAN, nft_dev_path_info() binds the
flowtable ingress hook to the underlying physical port.  Frames addressed to
the bridge or VLAN MAC arrive on that port with skb->pkt_type set to
PACKET_OTHERHOST by eth_skb_pkt_type().

In __netif_receive_skb_core(), nf_ingress() runs before vlan_do_receive()
and br_handle_frame() promote skb->pkt_type from PACKET_OTHERHOST to
PACKET_HOST:

net/core/dev.c:__netif_receive_skb_core() {
	...
		if (nf_ingress(skb, &pt_prev, &ret, orig_dev) < 0)
			goto out;
	...
	if (skb_vlan_tag_present(skb)) {
		...
		if (vlan_do_receive(&skb))
			goto another_round;
		...
	}

	rx_handler =3D rcu_dereference(skb->dev->rx_handler);
}

Because skb->pkt_type is still PACKET_OTHERHOST when nf_flow_offload_ip_hoo=
k()
runs, every packet on these flows bypasses the flowtable and falls back to
the slow path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222519.1416=
501-1-florian.fainelli@broadcom.com?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336033;
	b=vNkluO075FYCEw0CLObFFfRP4bv1lOmu9ZbJZmhvkc0IcjFgb4a5iCGqaFLV+whiko11
	 pbR1o52RXdNC/H7sseY2/75SpGwWiBRoyjZQEBpXgjgnFEF24P56QfiCEsdyT9KxX7fIE
	 z2SkkU1AfLooUyk54uR3eOky/hqzG2V5hq5KOVFPiqmbJBd7On0h4cweNiXxo6wpEIOcd
	 yxHdLTrt6kG2PqHNoHbMvUjWVyKiXfaoBOddYuI2mOo9DYucnEnh0CHnsR4+akS1up3Qf
	 Ehryu6pg6zG7ATQRzTsjXpsxbuZSKVwORXUDkEaGS/Mocd/9099XIB0vVaPae2Iz2+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336033;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=55BygWfFpoGcS4Oq2qFO5WtAdBrjCbe0LkrTWqHIkG0=;
	b=D6VEkxONQjPqP8la/U5c4oVeTQQxQeyPAxV52BTbTz18//j9dABCaCRruiGj+sKTY3mR
	 n4fgEo5gmLTwYZbJKd3TybrEYVTzl+dxj4u6bFWjCP4HPLA5QtS2wd2+SvKEpHtDmN6hN
	 KSYc4Rly2fgJzto034b5nQ2h3YSD9PfTJeln8kh+0kyKfeFh1XJMWmm4yDWsWOIvs+hc+
	 TXvLAshP2G9i+7CJRjgAVsmcP3BQZfSUHYp8UTaP8AUCb+0dllPIdk9RNcHC6N1HbPuJm
	 DEs7pO+U1hnLGCKWwF/weKrU2n9A2pFFwvWA3A/BFDxeictxIh6kevDLqRDdCWYieWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kldn1+7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89672606A324
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kldn1+7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5701F000C1;
	Fri, 30 Oct 2026 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336033;
	bh=55BygWfFpoGcS4Oq2qFO5WtAdBrjCbe0LkrTWqHIkG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kldn1+7vPc5dD9tgG+Eppn00Eze70uItnc44Rdv23d00trX9+QTdSQOB4KdY1TdRn
	 5ATfBokVQMNqrFhQgncClk/M+250DqtarCmmszrmusj3BUHBi8m/utmhMGMD3TdUaX
	 /FSyE92GUzKh7GGQlD3QeYgfiX9HGOyMIsTkG1j5wBJSzIYdQntL8Ho6T2LNy1BNBP
	 mfhx4bi4ZAOLZwtqqvAGlUDwjExZSWQ7/XgQ0+kKjjJR3K90muuQmG8EYAVpWnrrD8
	 PAPOcine8bfvMDaVm5PnfsDpdCVjynRNX3mcJg+lentBf8aUa+IwZ7dXwRPzkIKcYZ
	 r8pou2daeFMgQ==
Message-ID: <sashiko-outbox-190366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/10] net: airoha: Move
 {cpu,fwd}_tx_packets in airoha_qdma struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-6-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-6-af613b61ae02@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving the QoS statistics state variables to the shared `struct =
airoha_qdma` introduces a data race and stat stealing between multiple net_=
devices that share the same QDMA block.
--

commit 2720c71ea5f619161a97aa19abf7284ceb47f61d
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move {cpu,fwd}_tx_packets in airoha_qdma struct

This commit moves cpu_tx_packets and fwd_tx_packets from the airoha_gdm_port
structure to airoha_qdma. This is intended to fix overwriting issues when
multiple net_devices on different QDMA blocks share the same GDM port.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2306,19 +2306,18 @@ static int airoha_qdma_get_tx_ets_stats(struct ne=
t_device *netdev, int channel,
>  					struct tc_ets_qopt_offload *opt)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> =20
> -	u64 cpu_tx_packets =3D airoha_qdma_rr(dev->qdma,
> -					    REG_CNTR_VAL(channel << 1));
> -	u64 fwd_tx_packets =3D airoha_qdma_rr(dev->qdma,
> +	u64 cpu_tx_packets =3D airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
> +	u64 fwd_tx_packets =3D airoha_qdma_rr(qdma,
>  					    REG_CNTR_VAL((channel << 1) + 1));
> -	u64 tx_packets =3D (cpu_tx_packets - port->cpu_tx_packets) +
> -			 (fwd_tx_packets - port->fwd_tx_packets);
> +	u64 tx_packets =3D (cpu_tx_packets - qdma->cpu_tx_packets) +
> +			 (fwd_tx_packets - qdma->fwd_tx_packets);
> =20
>  	_bstats_update(opt->stats.bstats, 0, tx_packets);
> =20
> -	port->cpu_tx_packets =3D cpu_tx_packets;
> -	port->fwd_tx_packets =3D fwd_tx_packets;
> +	qdma->cpu_tx_packets =3D cpu_tx_packets;
> +	qdma->fwd_tx_packets =3D fwd_tx_packets;

Will this cause statistics to be stolen between net_devices sharing the same
QDMA block?

When multiple net_devices share the same QDMA block, they now share the
qdma->cpu_tx_packets and qdma->fwd_tx_packets baselines. If userspace polls
stats on one device, it will compute the delta and overwrite the shared
baseline.

A subsequent poll on another device sharing the same QDMA block will compute
its delta from this newly updated baseline, missing the packets that were
already accounted for by the first poll.

Does this introduce a race condition where the total QDMA traffic is random=
ly
distributed depending on the timing of userspace queries?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-airoha-eth=
-multi-serdes-v4-0-af613b61ae02@kernel.org?part=3D6

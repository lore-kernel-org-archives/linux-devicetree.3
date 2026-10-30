Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336030;
	b=v0u7Tyny4+1MpVMkmssONS75MKRA6yWZ8w24oIxOuJy+1RPOJQYwPaBIZwHVUQB2jhRp
	 T3mbK/lAbdhZw6/WZjOiSitWUkmZ/slVUSfcVrbSQRfwAc26QQv7cVzTiNE5wct4eauEZ
	 F9Hrh7hISy0L0C95+Q5FopWJOlDPHsp/51L9F6D+C43DcjZbq1lAx2IX5jmRdXGnDcAU2
	 mYGdnNbLN2VvpYA+lds1hOUZA4jDEmefE4El2J+BRtiXAi9ygyJQ63MALd9vl/wHSvz2u
	 QRCO4lQHEu6KgV6yrmj8mF03GDiqft0chlQMckHQON9k5HSeVmlY41RqytsR78+guLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336030;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JplU4wVTkWumAQWVPY+uWvQbwax8rS4YqtPypTKgt+U=;
	b=DxEJRlY920cvwYo0QJtajVrJvjZUgmFV+lsnhiCEpJ88sBeuDAc+ysF6ZrSnA8r4L6V1
	 kMc4/cQOIZOU4pCg30CQqkpgd7gY95Gdv+lJmzkZdDDph5C6HlM1NHsibDt38MgaK3uAl
	 tnSjqlepJa5967rKvtO9woxbMDlv7NcEM2v59yNig1BB9xCI0maYSdmqix9rmSswveSbz
	 +e8OBU8XcxqK+hovRGeITrKjDFA5SuPeIlWPH+Ui4FE9OxSub1FwZl35ZDTKiz398dgEC
	 Y02b2yJkOCxTqbAig9gRj13Vo9bLq4Gpt0dNc3h14xJuZljZIBV50kgpIBhYt1XT7IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAsZFs2B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A131606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAsZFs2B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB5B1F000C1;
	Fri, 30 Oct 2026 04:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336030;
	bh=JplU4wVTkWumAQWVPY+uWvQbwax8rS4YqtPypTKgt+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAsZFs2BBtdMRf8GoiEz/CiN+L/ufvDi3+cL8snoePRT36+hnJOGJ/eeSJGiyxMf3
	 MEfn5zu8cA6ruZbuC8ohY2hwM9DqVGbtfm65uc7DP28mu92X6Uq9zRoQNGkP+oK9oy
	 ESY+1Moo3MyCZDuT/vgkQvjbio//g03UDG0l3Ugh6jDdHKRA6rWGelhBeQ7fpschDi
	 DFt85JdKP+4Lb0lc8RlvB1zrUFsLcz8dsn8i6349AtWH7GirPSkCNPMbiiivBuZU5B
	 Fzfkpq3IL4qOBU4GYB26R0Bgc+BNDjjklo4XZi7E7KudvBr4lIN3E0DK1WN8O8rDQi
	 6j+FXotOC7VdQ==
Message-ID: <sashiko-outbox-190365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 05/10] net: airoha: Move qos_sq_bmap in
 airoha_qdma struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-5-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-5-af613b61ae02@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Pre-existing off-by-one error in hardware queue rate limit clearin=
g during HTB queue removal.
- [High] Pre-existing logic error in `real_num_tx_queues` management breaks=
 hardware QoS offload for out-of-order queue mapping.
- [High] Pre-existing missing resource collision check in HTB queue allocat=
ion allows silent hardware state overwrites and resource leaks.
--

commit f382d3d7cd42468f4ce246a12779bca6a0b8a1e1
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move qos_sq_bmap in airoha_qdma struct

This patch moves the qos_sq_bmap field from the airoha_gdm_port struct to
airoha_qdma to prevent configuration overwrites when multiple net_devices
connected to different QDMA blocks share the same GDM port.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 080705e2f58d7..69a4c2e0d58b7 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -2627,7 +2627,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct ne=
t_device *netdev,
>  		return err;
>  	}
> =20
> -	set_bit(channel, port->qos_sq_bmap);
> +	set_bit(channel, qdma->qos_sq_bmap);

This wasn't introduced by this patch, but is it possible for multiple class=
es
to map to the same channel here since channel is derived via modulo?

If they do, does the code overwrite the hardware rate limit of the first
class and increment real_num_tx_queues again without checking if the bit was
already set in qos_sq_bmap?

>  	opt->qid =3D AIROHA_NUM_TX_RING + channel;

Also a pre-existing issue: because channel is derived via modulo and can be
sparse, opt->qid can end up being >=3D netdev->real_num_tx_queues.=20

Will netdev_core_pick_tx() see an out-of-bounds queue mapping during
transmission and fall back to standard hashing, bypassing the hardware
offload?

> =20
>  	return 0;
>  }
[ ... ]
> @@ -2811,11 +2811,11 @@ static int airoha_dev_setup_tc_block(struct net_d=
evice *dev,
>  static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> =20
>  	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);

Following up on the real_num_tx_queues logic above, does blindly decrementi=
ng
this by 1 dynamically shrink the queue range and instantly invalidate other
active queues whose qid might now fall out of bounds?

>  	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);

Does using queue + 1 here instead of queue leave the deleted channel's rate
limit fully active while incorrectly wiping the rate limit of the adjacent
channel?

If the deleted channel is AIROHA_NUM_QOS_CHANNELS - 1, could this also pass
an out-of-bounds channel to the hardware configuration functions?

> -	clear_bit(queue, port->qos_sq_bmap);
> +	clear_bit(queue, qdma->qos_sq_bmap);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-airoha-eth=
-multi-serdes-v4-0-af613b61ae02@kernel.org?part=3D5

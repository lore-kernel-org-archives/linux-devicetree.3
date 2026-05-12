Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6360284690
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628725; cv=none; b=J/y5emxRG1x8CSIAfrB9/6yjEYisDt121u8DVp8wFLJBy53/NgcTNY0vGflOih9iwdQ74dNG3pdyGxaEVqfwQRSFMM9IP5N/QUJJ0PAv622Ol0lm/Qz1ATboGd3nPgPIwsUWXRWf8CgRxF9rNGMZqp9t6ZxPHZEb9ZZ7Lctn2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628725; c=relaxed/simple;
	bh=dvR8tgkwL1XdLpmS69gTT5yllTgLNGfet2QCZGGEcAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MM+Tb1zxJ/d9s9xNPuJEkyfnqLDCFcVja3ttgZ4cW6DckF19wzPgTTSZKDIX183hIuLwkMFmPXnA+tnCEUfCtFdtfl+PTEpNYQD3pczxG1+G3ogG5odFYY7p6mxe6HoIppWlKyro3jEUX2wjk2O3bYBiMGkR0cxk7isgM/6Cbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inoaaBkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inoaaBkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA40C2BCB0;
	Tue, 12 May 2026 23:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628725;
	bh=dvR8tgkwL1XdLpmS69gTT5yllTgLNGfet2QCZGGEcAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=inoaaBkU216sRkuPDx71S877BcO/7HHK6s/ax6WIZOJnmdJoyaUOWkEqzQbp49N3x
	 PPN/pviIadf6fAvLVqzBeFCZbtEDTY1JFYfA3q5ByJN1JLdkwjvUeJ+f+dne+4/Xxw
	 Q3vw1FBsetyhVYOmvkshafZ52ANktz8L4rHbsmcyqqkA/yJemDubnFrrBhslqi5iBb
	 CbTN88A+ExqWcciQ5EYCxu3LWXYpfCKoR+ypq2yGNDAp2ynFVamxP/Ky2RbTo7vZW4
	 O50lTls0D+SE9H4sXsIszKh34ktdYVmwhBMXjk1HVe/9oX84EWLktaaYCP4GmnqMUO
	 nC1mc6QsDHFJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 12/12] net: airoha: Better handle MIB for
 GDM with multiple port attached
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-12-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-12-c899462c4f75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:32:05 +0000
Message-Id: <20260512233205.7CA40C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The RUNT_CNT statistic is overwritten and lost due to incorrect as=
signment logic.
- [High] 32-bit free-running hardware statistics will wrap around and reset=
 64-bit software counters to zero.
- [High] Torn hardware reads on 64-bit registers due to free-running counte=
rs.
- [High] Pre-existing potential deadlock due to using `spin_lock()` instead=
 of `spin_lock_bh()` for stats lock.
--

commit 2f0d0c633539afc37cceb4ad426afb56465e7b6d
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: airoha: Better handle MIB for GDM with multiple port attached

The commit enables the split MIB feature for GDM3 and GDM4, moving stats
from port to device, and modifying the stats update logic from clear-on-read
to direct assignment since the MIB clear was removed.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 533ffe20f8333..27ccc636d8009 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1621,143 +1621,146 @@ static void airoha_update_hw_stats(struct airoh=
a_gdm_dev *dev)
>  	struct airoha_eth *eth =3D dev->eth;
>  	u32 val, i =3D 0;
> =20
> -	spin_lock(&port->stats.lock);
> -	u64_stats_update_begin(&port->stats.syncp);
> +	spin_lock(&port->stats_lock);

This isn't a bug introduced by this patch, but could this spin_lock()
cause a deadlock? Since airoha_update_hw_stats() is called by
ndo_get_stats64() (which can run in softirq context) and ethtool
callbacks (which run in process context), a softirq could interrupt the
process context and spin forever trying to acquire the same lock. Should
this be spin_lock_bh()?

> +	u64_stats_update_begin(&dev->stats.syncp);
> +
> +	/* Read relevant MIB for GDM with multiple port attached */
> +	if (port->id =3D=3D AIROHA_GDM3_IDX || port->id =3D=3D AIROHA_GDM4_IDX)
> +		airoha_fe_rmw(eth, REG_FE_GDM_MIB_CFG(port->id),
> +			      FE_TX_MIB_ID_MASK | FE_RX_MIB_ID_MASK,
> +			      FIELD_PREP(FE_TX_MIB_ID_MASK, dev->nbq) |
> +			      FIELD_PREP(FE_RX_MIB_ID_MASK, dev->nbq));
> =20
>  	/* TX */
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> -	port->stats.tx_ok_pkts +=3D ((u64)val << 32);
> +	dev->stats.tx_ok_pkts =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> -	port->stats.tx_ok_pkts +=3D val;

Now that the hardware counters are free-running (the MIB clear operation
was removed later in the patch), can a torn read occur here? If the low
32-bit register overflows and increments the high 32-bit register in the
brief window between the two reads, the resulting 64-bit value will be
corrupted and off by ~4.29 billion.

[ ... ]
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
> -	port->stats.tx_drops +=3D val;
> +	dev->stats.tx_drops =3D val;

Since TX_ETH_DROP_CNT is a 32-bit hardware register and the MIB clear
operation is removed, the hardware counter will eventually wrap back to
zero. By assigning it directly to dev->stats.tx_drops, won't this
cause the 64-bit software counter to also silently drop back to zero and
violate the monotonically increasing requirement of ndo_get_stats64?
Does this need to calculate the delta instead of directly assigning the
value?

[ ... ]
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
> -	port->stats.tx_len[i] +=3D val;
> +	dev->stats.tx_len[i] =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;

Does this overwrite the RUNT_CNT statistic? The code assigns RUNT_CNT
to tx_len[i] (where i=3D0), but immediately overwrites it with
E64_CNT_H at the same index because i is not incremented between
the assignments.

[ ... ]
>  	i =3D 0;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
> -	port->stats.rx_len[i] +=3D val;
> +	dev->stats.rx_len[i] =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;

Does this also overwrite the RUNT_CNT statistic for the RX path in the
same way?

[ ... ]
> -	/* reset mib counters */
> -	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
> -		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
> +	dev->stats.rx_len[i++] =3D val;
> =20
> -	u64_stats_update_end(&port->stats.syncp);
> -	spin_unlock(&port->stats.lock);
> +	u64_stats_update_end(&dev->stats.syncp);
> +	spin_unlock(&port->stats_lock);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-airoha-eth=
-multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D12

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACC939A808
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421907; cv=none; b=PuwwAaZR3kVEnTlQriTM+bRHZxdOTlM+3o/d8l6xkGq0WZOAyyIKnOfljgYt39S2prWnzTglKkHYtjJURGFsv9a2Qt/drCs16HK72rG7R9eOBT3j620x8LG6POknoXj972MeikA6J3gb7RyR0UEFziFh44ji45/7Hv7wsiBJILM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421907; c=relaxed/simple;
	bh=+uaG9XBdEQVb1wh/b9uTV7pw6O01oqHi9oqUKIMosho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TGNmsl0ggF2tZc3G6TRXMHS+61KEP8Hk5nHZuqcs68GPB5YDSw2czibFkVpF+FOgL+aeIqw0nWit4m5+Oy8bpr+p5/yFBesT5vV18/m0pwOcaeQgm0Hu/rlP0nPzVx5gEpYoiXH2Mp6wsO76wC/RR+vy8qG+Rb2tpLnUqY1/+9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4rssbiI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4rssbiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBDCC2BCC9;
	Sun, 10 May 2026 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778421907;
	bh=+uaG9XBdEQVb1wh/b9uTV7pw6O01oqHi9oqUKIMosho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=F4rssbiIvRpDDu+ttZ/xJLYwE8r4E5Djme0MuEncgzuuvX2t9hSszAau6Dwg3FhP5
	 UlLgTwnkDetOiteWkunyZQy6STk0aXCg1GOVknHHLHjJYQ6r0VRuv6XpgWorhvT1Ap
	 Yd/JxG8stJY2moc4tI3kUpmN1aJ8KlWsGCEVoYslpR0hWlEgwammvdjEH/ckTGwd0E
	 SXCf5owLoy9w+rCiLqsqMD9Ose7zkMSMOcj5fxyrp06azCohYV4inCnyq/w9rkb8uk
	 j9e67jVIc50RVTXFEcPLqQXkwUtBkdYPL6RR57MIngbpGsZqn+6tL6dyPYAy5bRH4b
	 qtqbIX4oFl0AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 12/12] net: airoha: Better handle MIB for
 GDM with multiple port attached
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-12-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-12-805e38edc2aa@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 14:05:06 +0000
Message-Id: <20260510140506.DBBDCC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving the statistics lock from the port level to the device lev=
el introduces a race condition on shared hardware registers, causing cross-=
interface statistics corruption.
--

commit 29334a9bde18f0777df549f0d135356a4b8bd3ee
Author: Christian Marangi <ansuelsmth@gmail.com>

net: airoha: Better handle MIB for GDM with multiple port attached

This commit enables a split MIB feature for GDM3/4 to track counters per
hardware channel instead of per GDM port. It moves the statistics structure,
including its protecting lock, from the port level to the device level.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 623cac42dfb71..b1a6586293457 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1621,143 +1621,150 @@ static void airoha_update_hw_stats(struct airoh=
a_gdm_dev *dev)
>  	struct airoha_eth *eth =3D dev->eth;
>  	u32 val, i =3D 0;
> =20
> -	spin_lock(&port->stats.lock);
> -	u64_stats_update_begin(&port->stats.syncp);
> +	spin_lock(&dev->stats.lock);
> +	u64_stats_update_begin(&dev->stats.syncp);
> +
> +	/* Read relevant MIB for GDM with multiple port attached */
> +	if (port->id =3D=3D AIROHA_GDM3_IDX || port->id =3D=3D AIROHA_GDM4_IDX)
> +		airoha_fe_rmw(eth, REG_FE_GDM_MIB_CFG(port->id),
> +			      FE_TX_MIB_ID_MASK | FE_RX_MIB_ID_MASK,
> +			      FIELD_PREP(FE_TX_MIB_ID_MASK, dev->nbq) |
> +			      FIELD_PREP(FE_RX_MIB_ID_MASK, dev->nbq));

Does moving the lock from the port to the device level introduce a race
condition on the shared port MIB registers?

Because ndo_get_stats64 can be called concurrently without the RTNL lock, i=
f two
CPUs request stats for two different devices on the same port:

CPU1 calls airoha_update_hw_stats() for dev_A:
    spin_lock(&dev_A->stats.lock);
    airoha_fe_rmw(..., REG_FE_GDM_MIB_CFG(port->id), ... dev_A->nbq);

CPU2 concurrently calls airoha_update_hw_stats() for dev_B:
    spin_lock(&dev_B->stats.lock);
    airoha_fe_rmw(..., REG_FE_GDM_MIB_CFG(port->id), ... dev_B->nbq);

Could CPU1 then read the hardware counters for dev_B instead of dev_A?

[ ... ]

>  	/* reset mib counters */
>  	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
>  		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);

When CPU1 then clears the counters here, could it wipe out the unread
hardware statistics for dev_B?

Is a port-level lock still needed to exclusively protect access to these sh=
ared
hardware MIB registers across multiple devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-eth=
-multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D12

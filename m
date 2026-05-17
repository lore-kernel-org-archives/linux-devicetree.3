Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334BA2E414
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997495; cv=none; b=ZTTEx2pVqa5novV3oxBIT+rmptoCUAqZ4/NCGb18aIt1/fCnyT7W0hiOuxQgvLFfYL4IFZVtZWb1up/0CtJStIavvgb1hW/2P8u3g2j5ZyT01wYn+LIYzp5BODdHxKZvswXVvT4IP1J9HfAqdmY+pmN4dZi/3UmulU4kr2RKL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997495; c=relaxed/simple;
	bh=MaAt1gypCSiVJlVm1ErazOM55HJERe3KwKrmZwTdsU0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UzTJviFENedADRBqNdBTHvlHXcu972NwBV+YOnbSO5+7SZ+25lPFNFJ19kqdi/fgM1DEyibmxzU/Hoq0SrF8DdASZsf04le63TqUmQmk4cXOZIRzt4ifuFxA2tvDlTT2osYNFTktAap1YQ8d6Ntu08kHxdZl1VK63FxLk5dKMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBP4kpXO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBP4kpXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1F8C2BCB0;
	Sun, 17 May 2026 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778997495;
	bh=MaAt1gypCSiVJlVm1ErazOM55HJERe3KwKrmZwTdsU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uBP4kpXOWTtoqYdqDu7UZi63lOz9dRa9G1XOeZ/lbLGUE009Qt8yJXONzPrX33eF7
	 UZ6JdDFPJGO1Sa9kY11GO7f+O9K6Wc3+3m0mFjI5tGsMYVo0A5oE5nurl4lgRE4KHv
	 P2e7Hh5mvX+FN7q43H/+DwInV32LzFNdO2AowLyM53IDfBEWmMsUm66x7NYmEDdkbo
	 Vjt6Fyqqe95Tl500E3TmREtFrZo9Gk++CkQ8oYBYQx2fK0LLbp+751fI82824XCUdH
	 nz0cfBs20zgadxyO8yZn5G0VQAo+k/fY9ibm2b1Ai3J0gP708xduvdFj4rlDLc/4yT
	 JY1G900g545gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 08/10] net: airoha: Do not stop GDM port if
 it is shared
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-8-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-8-99e0093303e2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 05:58:14 +0000
Message-Id: <20260517055814.DB1F8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Flawed hardware MTU recalculation logic in airoha_dev_change_mtu=
() for shared GDM ports
--

commit 28e02ac4611575e19c4f6eef3fa74c11d4debb6e
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Do not stop GDM port if it is shared

This commit updates the driver to allow multiple devices to share the same
GDM port. It stops the port only when no other devices are using it and
adjusts the hardware MTU to accommodate all active devices.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 8558790eca644..c70e3ace38e25 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -1917,13 +1945,18 @@ static void airoha_dev_get_stats64(struct net_dev=
ice *netdev,
>  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	u32 cur_len, len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port =3D dev->port;
> -	u32 len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_eth *eth =3D dev->eth;
> =20
> -	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
> -		      GDM_LONG_LEN_MASK,
> -		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> +	cur_len =3D airoha_fe_get(eth, REG_GDM_LEN_CFG(port->id),
> +				GDM_LONG_LEN_MASK);
> +	if (len > cur_len || !port->users ||
> +	    (port->users =3D=3D 1 && netif_running(netdev)))
> +		airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
> +			      GDM_LONG_LEN_MASK,
> +			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> +

The commit message states that the driver must "always set in GDM_LONG_LEN_=
MASK
field of REG_GDM_LEN_CFG register the maximum MTU of all running net_devices
connected to the same GDM port."

Does this logic successfully recalculate the MTU when the MTU of a running
device is decreased while sibling devices are also running? In that scenari=
o,
len > cur_len evaluates to false, which appears to skip the update and leave
the hardware MTU stuck at the previous larger value.

Additionally, if an administratively down device has its MTU increased,
len > cur_len can evaluate to true. Does this prematurely increase the
hardware MTU, exposing the running sibling devices to larger frames based
on a stopped device's configuration?

Would it be more accurate to iterate over the devices to compute the
actual maximum MTU of all active devices here, similar to the approach taken
in airoha_dev_stop()?

>  	WRITE_ONCE(netdev->mtu, mtu);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-airoha-eth=
-multi-serdes-v7-0-99e0093303e2@kernel.org?part=3D8

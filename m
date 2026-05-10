Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF824382373
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421903; cv=none; b=ogoENO9fCvEWxzrGpug2E/9qu4SfZO7pStJ/pa9oGtP2JA3zrwHhHL0NA5Jpb5swnBYtKXOOla4/n/Zh+mrPY63ZC2Nmc9P42GXdK524knA7BQjgjuS0QW3BjYpTe0xoe6v+HKSOuJZ0jW/TAFWqa7wnx/o87tqE+HZqaGhjXh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421903; c=relaxed/simple;
	bh=Y46GA2iBxzlcVqXXKrV60yJrlTqyTS0fFGBH6XoLhds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=orEtzsgxDQAAaapEehPNqKlf/6R7m4bYgH25FmichOicNKE/GkUC/waD/1tBFDz9P59LlXe60jYzZLe0MV6P/f0+gFBV/ZIJXagiw7EDdwta8tNzwHlsZ9bOQl+9G54k50Yx3Sktvv8n148seWgveyIY6Zz8WcJ8hVAuebeEIyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlywzUDz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlywzUDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958BDC2BCFF;
	Sun, 10 May 2026 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778421903;
	bh=Y46GA2iBxzlcVqXXKrV60yJrlTqyTS0fFGBH6XoLhds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QlywzUDzXGLR7CphMz4mX/I1lb0USF3uxeRRm2l8vKdr0/XC6Yqs5+1mLrqtpRlyL
	 X5DsRt8YhR8y1hQrAp0UcYgDyIQ3Hwce52dZleAEZenJa3FS0I2j+g+RXgt2Fgd298
	 T7pdUztxtp0fZnwi3L8N6zovd1DQOtyATJdBTdvkjLsIW2m7HrxUoBmYofFwHmotdA
	 zwPZqVXCm6ece9zGnBu2gCpjG0s8h6nfHjVOyjZIayygCNgtYDEPFVQNLpQEi0XEQy
	 svSiWCU3RGaKsIe76NIHrpLrhOFzHFBln3vR8cWfgaw/N7NIT9IQvAy//H5/7btyxV
	 q/CGtFZKJYzhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 08/12] net: airoha: Support multiple
 net_devices for a single FE GDM port
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-8-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-8-805e38edc2aa@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 14:05:03 +0000
Message-Id: <20260510140503.958BDC2BCFF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Bringing up a device overwrites the global WAN port and GDM loopba=
ck configuration of previously opened devices sharing the same port.
- [Medium] Standard netdev statistics and ethtool MAC/RMON stats return the=
 combined hardware counters for the entire GDM port instead of per-interfac=
e statistics.
--

commit 6b561eda8762bee9a19daa9304286dbd64cc6eac
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple net_devices for a single FE GDM port

Introduce support for multiple net_devices connected to the same Frame Engi=
ne
(FE) GDM port (GDM3 or GDM4) via an external hw arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 904f8da936005..be31f639f4be3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1829,7 +1833,7 @@ static int airoha_set_gdm2_loopback(struct airoha_g=
dm_dev *dev)
>  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
>  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
> =20
> -	src_port =3D eth->soc->ops.get_sport(port, port->nbq);
> +	src_port =3D eth->soc->ops.get_sport(port, dev->nbq);

Does bringing up a device overwrite the global WAN port and GDM loopback
configuration of previously opened devices sharing the same port?

Since multiple devices can now share the same GDM port and each has a
different nbq (and therefore a different src_port), wouldn't the
initialization of the second device clobber the WAN port configuration of t=
he
first one, breaking its forwarding behavior?

I noticed this is fixed later in the series in commit 8e8f8223af5be ("net:
airoha: Introduce WAN device flag"), but wanted to confirm the regression
between commits.

>  	if (src_port < 0)
>  		return src_port;
> =20
[ ... ]
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 694e83bfd1e70..8d6887e334130 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
[ ... ]
> @@ -539,19 +540,20 @@ struct airoha_qdma {
>  struct airoha_gdm_dev {
>  	struct airoha_gdm_port *port;
>  	struct airoha_qdma *qdma;
> -	struct net_device *dev;
>  	struct airoha_eth *eth;
> +	struct net_device *dev;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
>  	/* qos stats counters */
>  	u64 cpu_tx_packets;
>  	u64 fwd_tx_packets;
> +
> +	int nbq;
>  };
> =20
>  struct airoha_gdm_port {
> -	struct airoha_gdm_dev *dev;
> +	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
>  	int id;
> -	int nbq;
> =20
>  	struct airoha_hw_stats stats;

Since standard netdev statistics and ethtool MAC/RMON stats are tied to the
hardware counters on the GDM port, do they now return the combined hardware
counters for the entire GDM port instead of per-interface statistics?

Prior to this patch, each GDM port mapped to a single net_device, making
port-wide hardware stats accurate for the interface. With multiple net_devi=
ces
sharing a single GDM port, querying statistics for one interface might
incorrectly return the aggregated traffic of all interfaces connected to th=
at
port, violating standard rtnl_link_stats64 semantics.

I noticed this is fixed later in the series in commit 29334a9bde18f ("net:
airoha: Better handle MIB for GDM with multiple port attached").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-eth=
-multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D8

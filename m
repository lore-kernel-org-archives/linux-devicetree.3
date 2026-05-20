Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAC4964F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267577; cv=none; b=jthI2lqR01NwGCYFxQ8y5HK12YeQhZQsEdsfc27jtVTPsuB72jfO2VstJSdWr7kcUkAAerU5sj7BJlUa6jrJLEwksDPR+h65gG/aU5kLcr7nWWv5qzylcpY3zMn7XtomAnv7Dd2zYlDdEZd/WHiy+UWx9RMaataAHvzj5cMW+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267577; c=relaxed/simple;
	bh=ZIaPIi7sksc4MHHjmkewKSBdXIcSZGNGRmsX3DnwtBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MApaeMq9pOnmEbvhgqxOooPBBNI0oMCdE2qBrCQplWTJmRePvHydNHB0efphaZoasfqctoJ14kNLt7A9e8pdla7aSN8zKx1yw+0aHe284ECFYdDdWRgXz+36+pChLLmvH5JuZhp1nSBsmOKe8I+slKM9axcXMCqdTLtjCCX9M2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiJNEEZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiJNEEZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D171F00897;
	Wed, 20 May 2026 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267573;
	bh=kV6kS6eDvRZ27F40oavk75hK6JqHmEtix+AlIXx2hhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WiJNEEZsUH8k75PPMy/vhwjTQ7V6Yzx4O/X1gNHgaslW+foF18R73c0WJ3AiXpEWM
	 RAtSeC/mjvnfYeJS72IxRCzcH+3QUOWOWtxsQwB7E0ogR8sNyYfBBdEq6RIrKfx+3D
	 opwFhgBijSCIQUNCCvZGi1PC21YzpIcKb67TIcLfwhLudRAwf1pVJbW1M1IwD4wbOK
	 F4tecD8G42gIw3Ec/2opqn+diL+/0hUODE7QaCwXypL7owNaIzKMAeDS3uUlVoq6JL
	 baoJzZ3BGMmdfWkQTgqcfFMBQ0yZMQIV+X4RODOdeCwiHDEoyII6IBioUOOa5/R52Y
	 V+klmHHGydFaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 07/10] net: airoha: Support multiple
 net_devices for a single FE GDM port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-7-6bd70e329df6@kernel.org>
References: <20260519-airoha-eth-multi-serdes-v8-7-6bd70e329df6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:59:32 +0000
Message-Id: <20260520085933.35D171F00897@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Port-wide hardware configuration is improperly modified via per-ne=
t_device callbacks, breaking the newly introduced 1:N relationship.
- [High] Sequential initialization of multiple net_devices sharing a GDM po=
rt silently overwrites singleton hardware loopback and WAN configuration re=
gisters.
--

commit d922e17d3b113696fc139ac4b2b3ef81e2b9ad50
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple net_devices for a single FE GDM port

This commit introduces support for multiple net_devices connected to the
same Frame Engine (FE) GDM port (GDM3 or GDM4) via an external hw arbiter.
It updates the airoha_gdm_port structure to hold an array of devices instead
of a single device.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index fbb50dc73af84..fc49f0049983e 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
[ ... ]
> @@ -540,19 +541,20 @@ struct airoha_qdma {
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

This introduces a 1:N relationship between a GDM port and net_devices, but
are the net_device lifecycle and MTU callbacks updated to account for shared
ports?

Looking at airoha_dev_stop(), the driver unconditionally drops all traffic
for the port:

airoha_dev_stop()
    airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id), FE_PS=
E_PORT_DROP);
   =20
Since this modifies the forwarding configuration for the entire GDM port,
does stopping just one net_device silently drop all traffic for the port,
breaking any other active net_devices sharing it?

Similarly, airoha_dev_change_mtu() overwrites port-wide hardware registers
such as REG_GDM_LEN_CFG. Could this lower the port MTU while another device
still requires a larger MTU?

I note this regression is addressed later in the series by commit
646f1e7bb6021 (net: airoha: Do not stop GDM port if it is shared).

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 27b214ce2a4ed..8d36ab6cd7854 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1830,7 +1831,7 @@ static int airoha_set_gdm2_loopback(struct airoha_g=
dm_dev *dev)
>  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
>  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
> =20
> -	src_port =3D eth->soc->ops.get_sport(port, port->nbq);
> +	src_port =3D eth->soc->ops.get_sport(port, dev->nbq);
>  	if (src_port < 0)
>  		return src_port;
> =20

When multiple net_devices sharing a GDM port are sequentially initialized
via ndo_init (airoha_dev_init()), they unconditionally call
airoha_set_gdm2_loopback().

Inside this function, global singleton hardware registers are modified:

airoha_set_gdm2_loopback()
    airoha_fe_rmw(eth, REG_FE_WAN_PORT,
                  WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
                  FIELD_PREP(WAN0_MASK, src_port));

Does initializing the second device on the same port silently overwrite
the hardware loopback and WAN configuration of the previously initialized
device?

I see this regression is resolved later in the series by commit
8a565b44990bb (net: airoha: Introduce WAN device flag).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-airoha-eth=
-multi-serdes-v8-0-6bd70e329df6@kernel.org?part=3D7

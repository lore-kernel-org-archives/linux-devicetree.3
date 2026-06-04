Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334B3D45EA
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552886; cv=none; b=KE1kSTcQ9OX7QShHfK1itXwGbY1rWkoRSW/j+PP0t8CzoLNrwsxB/GCjkxVCQwLoEDl/nzCAoLdYT6buubf30TPvX/9dQGVEpoh0omhe5p9N3ijtxAcgBf3BrkkRQ+PnTWjyuMkQ2lh4l16+HE8OSGmRbuV4I9EQNBlv4xfxI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552886; c=relaxed/simple;
	bh=wI3D1WLX68HaHc306LYeqy6g8dxRpdBvrUW+rL7Q8EY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tJSwq3gfMUlqd1y1Pj+yp0OffrqWHATlHVsuq8H8yCpNQsP4Jbj3z4WrKhpI1NlgT3d+BNecXOg5eCiR1jc9wiTBgw4VIb+TrJpLFGQu2qcMbL+d5CRJXM1F3kMq3+sNbC67qf3+XoBvG3ABqRFeJYLo6SPPEPEgj1FNBeosHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1s7lLSU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1s7lLSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5A11F00898;
	Thu,  4 Jun 2026 06:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780552885;
	bh=GpeeF0xSJ/hgKWqdjqAzqQWHXM111v8KnWatSmA/PCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T1s7lLSUyqWwZnACTK+/TsK28usp8tv5SBCGfTEotgJf82KaEuf/ZH4hiz5UpS0iH
	 epz2umw7YWmj5hCJJWGYkzdBKvxKusR76ruRwC7PYFSf+F0gNgZ2zedwk3xgCVszWB
	 SwyVY/DC0uQ8PD9UgJY+Dr01xdvoMeBu+J5hXWLp6DEX22OXiW7HzyGuBgnnUFm/j1
	 p7PsAtrt0jCIHHEkwWReSas/XePqCwvPtaJG4cK09S/uwOILcj1U9arFop8L1Bp0bV
	 hWzbw9fQLpaR+Bi/sfSWMD/89L93+1dqK+dzAmpTXty9I+o+8+uChe5ElzrF9N0uc1
	 aOwsRueZSG+0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 3/6] net: airoha: Support multiple
 net_devices for a single FE GDM port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-3-5d476bc2f426@kernel.org>
References: <20260603-airoha-eth-multi-serdes-v9-3-5d476bc2f426@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:01:25 +0000
Message-Id: <20260604060125.5B5A11F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware configuration clashing for shared GDM ports
- [Medium] Hardware statistics are incorrectly shared across all net_device=
s attached to the same GDM port
--

commit 18f4c136c0685846d452a3b0c6a493df8cf6dda0
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Support multiple net_devices for a single FE GDM port

EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
manages the traffic in a TDM manner. As a result multiple net_devices can
connect to the same GDM{3,4} port and there is a theoretical "1:n"
relation between GDM ports and net_devices.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 57a16de0a2ec7..1d088d95d5fbc 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1742,11 +1745,9 @@ static int airoha_dev_open(struct net_device *netd=
ev)
>  			GLOBAL_CFG_RX_DMA_EN_MASK);
>  	atomic_inc(&qdma->users);
> =20
> -	if (port->id =3D=3D AIROHA_GDM2_IDX &&
> -	    airoha_ppe_is_enabled(qdma->eth, 1)) {
> -		/* For PPE2 always use secondary cpu port. */
> +	if (!airoha_is_lan_gdm_dev(dev) &&
> +	    airoha_ppe_is_enabled(qdma->eth, 1))
>  		pse_port =3D FE_PSE_PORT_PPE2;
> -	}
>  	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
>  				    pse_port);

[Severity: High]
Since multiple net_devices now share a single physical GDM port, does calli=
ng
this unconditionally overwrite the shared port's forwarding configuration?

If one device on the shared port is brought up as a LAN port and another as
a WAN port, it seems the last opened device will override the forwarding
destination for all sibling devices on that port.

Are there similar issues with the ingress configuration?  Earlier in
airoha_dev_open(), REG_GDM_INGRESS_CFG(port->id) is modified based on wheth=
er
the specific netdev uses DSA:

	if (netdev_uses_dsa(netdev))
		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
			      GDM_STAG_EN_MASK);
	else
		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
				GDM_STAG_EN_MASK);

Also, do airoha_dev_stop() and airoha_dev_change_mtu() have similar
regressions?  They appear to blindly overwrite shared registers like
REG_GDM_FWD_CFG (setting it to FE_PSE_PORT_DROP) and REG_GDM_LEN_CFG(port->=
id).

I noticed the stop() and MTU issues might be fixed in a subsequent patch, b=
ut
should this intermediate patch be self-contained to avoid breaking
bisectability?

[ ... ]
> @@ -3080,15 +3100,51 @@ static int airoha_alloc_gdm_port(struct airoha_et=
h *eth,
>  	u64_stats_init(&port->stats.syncp);
>  	spin_lock_init(&port->stats.lock);
>  	port->id =3D id;
> -	/* XXX: Read nbq from DTS */
> -	port->nbq =3D id =3D=3D AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
>  	eth->ports[p] =3D port;
> =20
>  	err =3D airoha_metadata_dst_alloc(port);
>  	if (err)
>  		return err;
> =20
> -	return airoha_alloc_gdm_device(eth, port, np);
> +	/* Default nbq value to ensure backward compatibility */
> +	nbq =3D id =3D=3D AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
> +
> +	for_each_child_of_node(np, node) {
> +		/* Multiple external serdes connected to the FE GDM port via an
> +		 * external arbiter.
> +		 */
> +		const __be32 *nbq_ptr;

[Severity: Medium]
Will these multiplexed devices report duplicated, incorrect hardware statis=
tics?

When userspace queries statistics for any single multiplexed device,
airoha_dev_get_stats64() fetches from port->stats, which is updated by
airoha_update_hw_stats() reading the clear-on-read MAC hardware counters for
the entire physical GDM port.

Since the port->stats structure is shared across all net_devices attached to
the port, each device will report the total traffic volume of all devices
sharing the port rather than its own traffic.

Should the driver rely on per-queue software counters to provide accurate
per-device statistics when hardware MACs are multiplexed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-airoha-eth=
-multi-serdes-v9-0-5d476bc2f426@kernel.org?part=3D3

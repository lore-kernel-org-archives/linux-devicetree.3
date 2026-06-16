Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D227037C91F
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620347; cv=none; b=ljqIg7g3YkdzngVuvtrQDB16GcLiXZADyrtvTvMSb02ZTbCLBrTqGp8nyja4j3O3tSmedpy/AGKJFTSF/msA0L6FT1nwNyd79U5JA47T9yUKJQr12j0JrBDL03+SKSDavyLyLSR2blgfPR1d3Av3BLARHFQLpeCBgNgsCE2PbXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620347; c=relaxed/simple;
	bh=bir+cipck6KrSpyz9jy4k7OOGiJVXiEf/ukp6s9uB94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DUNpiWVvpK89QYCfG1hN8tElYHbU1pyyclieqNdOgEEmY3UpMrxXYHmshrti5x3RAluih2YZCzQgUebHE+YC2luO67N2g4lRqotmrhWDUi50+vuALXr238gIIdS5mXUCODVqzK0s9cJWEhrk0GI7Hy5oriaJSdu/+4h9y48fsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=El8sQXWL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="El8sQXWL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA6B1F00A3D;
	Tue, 16 Jun 2026 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620346;
	bh=qtwW59/nj5EUgfvx1PWAGNaRHh3B3aC8ltn/UQ4idl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=El8sQXWLnaI5PQRoCLJXGBy+4H+EHmIMOLmpMEAfwr+IHAlrmKkPnKbg4JAjjraAx
	 ZNugZiETKxRHfMd1yzCvQHWzgEqgFbjEb0bUK2uyuRvmlcGA+6w+bGW/Vc012W+A5g
	 55hOqIaHLWbQtNEhVsY0jtIBKkdHtsK03kj9eKAQRps020zyu6RkLsrEBiyWSuX4xu
	 wWOYNzOAoB4h/QvTmt6cFGQkx5MnAHa2aB18H3BgdSNp5uC3Egg9XFONYfZmsAO4iE
	 jq/QbsedSpazZ1gWT/sP5cIn0+okk/SvZiiRIqkdW2JKMrQhA4uwgCnnFG79pmesFs
	 y37FgJMOCy1kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 12/12] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615122950.22281-13-ansuelsmth@gmail.com>
References: <20260615122950.22281-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:32:26 +0000
Message-Id: <20260616143226.5CA6B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] NULL pointer dereference in `phylink_destroy()` on probe error pat=
h.
- [High] Data race on shared GDM4 fragment size registers causes configurat=
ion corruption.
--

commit a159dc684c14d93e9de96a620bb343b8bb77e730
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: airoha: add phylink support
   =20
    Add phylink support for each GDM port. For GDM1 add the internal interf=
ace
    mode as the only supported mode. For GDM2/3/4 add the required
    configuration of the PCS to make the external PHY or attached SFP cage
    work.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5f1a118875fbe..9a42fb991bd72 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -3168,6 +3180,151 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *e=
th,
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy=
_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct airoha_gdm_dev *dev =3D container_of(config, struct airoha_gdm_d=
ev,
> +						  phylink_config);
> +	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_eth *eth =3D dev->eth;
> +	u32 frag_size_tx, frag_size_rx;
> +	u32 mask, val;
> +
> +	/* TX/RX frag is configured only for GDM4 */
> +	if (port->id !=3D AIROHA_GDM4_IDX)
> +		return;
[ ... ]
> +	/* Configure TX/RX frag based on speed */
> +	if (dev->nbq =3D=3D 1) {
> +		mask =3D GDMA4_SGMII1_TX_FRAG_SIZE_MASK;
> +		val =3D FIELD_PREP(GDMA4_SGMII1_TX_FRAG_SIZE_MASK,
> +				 frag_size_tx);
> +	}  else {
> +		mask =3D GDMA4_SGMII0_TX_FRAG_SIZE_MASK;
> +		val =3D FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> +				 frag_size_tx);
> +	}
> +	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, mask, val);

[Severity: High]
Does this lockless read-modify-write on shared GDM4 registers cause data
corruption?

Because the SGMII lanes of the GDM4 port operate as separate phylink instan=
ces,
their link states are resolved independently.

If both lanes undergo a link state change simultaneously, phylink's workque=
ues
can execute airoha_mac_link_up() concurrently on different CPUs.

Without a lock around airoha_fe_rmw(), these concurrent updates to
REG_GDMA4_TMBI_FRAG and REG_GDMA4_RMBI_FRAG could overwrite and corrupt each
other's settings.

> +
> +	if (dev->nbq =3D=3D 1) {
> +		mask =3D GDMA4_SGMII1_RX_FRAG_SIZE_MASK;
> +		val =3D FIELD_PREP(GDMA4_SGMII1_RX_FRAG_SIZE_MASK,
> +				 frag_size_rx);
> +	} else {
> +		mask =3D GDMA4_SGMII0_RX_FRAG_SIZE_MASK;
> +		val =3D FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> +				 frag_size_rx);
> +	}
> +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, mask, val);
> +}
[ ... ]
> @@ -3231,7 +3388,7 @@ static int airoha_alloc_gdm_device(struct airoha_et=
h *eth,
>  	dev->nbq =3D nbq;
>  	port->devs[index] =3D dev;
> =20
> -	return 0;
> +	return airoha_setup_phylink(netdev);
>  }
[ ... ]
> @@ -3457,6 +3614,7 @@ static int airoha_probe(struct platform_device *pde=
v)
>  			netdev =3D netdev_from_priv(dev);
>  			if (netdev->reg_state =3D=3D NETREG_REGISTERED)
>  				unregister_netdev(netdev);
> +			phylink_destroy(dev->phylink);

[Severity: High]
Could this cause a NULL pointer dereference during a probe failure?

In airoha_alloc_gdm_device(), the port->devs[index] =3D dev assignment happ=
ens
before calling airoha_setup_phylink(). If airoha_setup_phylink() fails,
dev->phylink remains NULL.

The error propagates back up to airoha_probe(), which then unconditionally
calls phylink_destroy() on all populated port->devs slots.

Because phylink_destroy() dereferences its argument without checking if it =
is
NULL, this will result in a kernel panic.

>  			of_node_put(netdev->dev.of_node);
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122950.2228=
1-1-ansuelsmth@gmail.com?part=3D12

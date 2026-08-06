Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB8C480975
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036423; cv=none; b=htYrLZ2GxemCb8NBxMvjZjI1QV+GbE2eVH79ztXPuQeuEj5RQVcktYx65dhwRaw1Z6gbrpfoASsdCgX4ZVsyi7qgAScLTuI9kI8vWhujs4f3f+vuAW+qUWUZyKTPd80CAIdxxQ4GW4NZTOWLo7IlaCENJ7sCSsUXSB4MalzTvxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036423; c=relaxed/simple;
	bh=2g/BH7/dnQkVJ5j6ZHSFOFFmOj5t0qrsnPL18Dt9tD8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVXKi0XG2xURwyzQaMutcCENdiLTXmNsWc87OZUPtRcMnJi8LlnOgmNytLl28RQQ1VE/59O5WBepvDj8vZyB+FzmsNGtg9SeK+oNPx6HhX5zo3u3AhwVFNf7MBqUstKCn3I9P35SL3fri+G0K03RB/f+jnIb/Z1b1KeeXtvXWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2YXmTbd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2YXmTbd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b966dd74so15202295e9.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786036419; x=1786641219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtyOCXOdSpPncxX9X95K21xTpnlgw4ERbigVVrepMHc=;
        b=N2YXmTbdcjN973XvjwRBtUOypM+iKBrXRqUP6HPq7aSCcjFeWncSFcUG9CJUiCQfR4
         DI2U2RaFgYTir/ENqUGwcAtT1tn/vRag/if2uFLgIKbt6M5mdQ2dl+8PO9T8k8HLk415
         JjDFXlnVRHTZGHRU6lLN8AtQT6SFeVyxW6jr5JrqHSDMRZuv2NRLnm6HlB+LKqBgVV7i
         HgNhNiYsUZD8vNk3ynXimA6W6M+iiC8e/wKLrSIv1DEmxSjeJ4wfo/I+K+sKqG4lG3Pb
         iGeYKvp5n7jh+6WJ6qhkxfC1oeN7ryOJwkLeizvgOcCMHhkDvSntzwE6jueZBxcPtYko
         9qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036419; x=1786641219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtyOCXOdSpPncxX9X95K21xTpnlgw4ERbigVVrepMHc=;
        b=glFa3PlpzfecyiA0KOkMibejhejcbq6+oxY1NjAwfzsan/ctyZl6puNX8XtmVwa9T6
         ovJYuGdQh2tNhqYeu2+/+zOsyHM8tgOQAdBIrKmcjV7AByZaBmjuPRPxtvjTxoLu9XO5
         jPgHZPQmXdIPZGmtpJoPhBpJ1Log9lZziH6C7UiYJlIPusOFxoeNEgjVqIdqfwARvQD+
         0vx3iB0o/u9+DuQV6Io6SJEEQkabbN9R4Y1eZfmKWwr7gsHD/KZ5SoVZudQN6yWJAWtk
         TX2od0RkDwiFiRqf9xdB0/ts9fk8iOskxrfpFDMCp+840NjfKA/nGs/D6/yOFcx7Efp3
         TMew==
X-Forwarded-Encrypted: i=1; AHgh+RobjZvHp2+4xPnr3abOM5hiPvjBvbefNundNA3xnR03izmKdCYXOnYFDi186HrNQS07EK/PujLnjR8u@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6YoQj2obvZR9jXxsBfwBs7iTyyR0CewBQzY2EMk2kYGDOVIi
	gaSpFMBDksSV6wAjlfy/ry35y9sLJwIoWxOjZtRihd1rF9Cp5wjmaude
X-Gm-Gg: AR+sD10s+sWfCtQPtkYhy1Xv3EwuciVs+Ki0iW5JWPvNyWbLYzh33AON8zW/PQHCroL
	q8WArDs5kOShaZFc+WWQgKh13ZikibCXxRAiD/qP1JBAvUDOvJF5GZ0JZCYzlSO4+cGGfpX5rmU
	pMOrb0OZRStOJ0ctJDJeqM5TFVGKcdtrox4L4QgEkOYkhHuFFvJsEDzFh9/K11n3QMKrGGUQXKR
	aGphFA23avlbaNGt+tXtbPgml6ZHfJJ+uAHpiIwRqa4F/2RDZfSsNklWu8pHX9JCgyVEUYmhCZz
	z1Bw9YwQqstsjfdCWbN9NxItCrtC3suQ6uMLOIVqq6wvIMIj7O9+WYLNlkLB/VEuJgBUb9YDorp
	qnhiFC21hTQPfwxKdPZTbnS0OIbxaaewQpVakKSlZfYcDL3HpwYhTvTWpteltTubRtrSx+iMRZo
	afyO3SzjCrpMrI6i09R5LSEf1wL19A/OrBFm6bMaVxTen+igis2UlZbaTBaQI3SN6fBe04ELaBg
	ZqaWztPvNKzvQfq0KLF3DCrBJpTuI65J2o6
X-Received: by 2002:a05:600c:5251:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-4995b04695bmr7965295e9.16.1786036419254;
        Thu, 06 Aug 2026 10:13:39 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bb81731sm1732145e9.0.2026.08.06.10.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 10:13:38 -0700 (PDT)
Message-ID: <6a74c0c2.1c04d3ff.d716d.a9f0@mx.google.com>
X-Google-Original-Message-ID: <anTAvad1j37P3ZfY@Ansuel-XPS.>
Date: Thu, 6 Aug 2026 19:13:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v10 11/11] net: airoha: add phylink support
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-12-ansuelsmth@gmail.com>
 <ams72wEsCiACYh-k@lore-desk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ams72wEsCiACYh-k@lore-desk>

On Thu, Jul 30, 2026 at 01:56:11PM +0200, Lorenzo Bianconi wrote:
> > Add phylink support for each GDM port. For GDM1 add the internal interface
> > mode as the only supported mode. For GDM2/3/4 add the required
> > configuration of the PCS to make the external PHY or attached SFP cage
> > work.
> > 
> > These needs to be defined in the GDM port node using the pcs-handle
> > property.
> > 
> > Update and provide a .get/set_link_ksettings function that use phylink
> > for ethtool OPs now that we fully support phylink.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Hi Christian,
> 
> just some nits inline. Fixing them:
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Regards,
> Lorenzo
> 
> > ---
> >  drivers/net/ethernet/airoha/Kconfig       |   1 +
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 189 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   5 +
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  4 files changed, 205 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
> > index 1f6640a15fc9..789906516bf8 100644
> > --- a/drivers/net/ethernet/airoha/Kconfig
> > +++ b/drivers/net/ethernet/airoha/Kconfig
> > @@ -20,6 +20,7 @@ config NET_AIROHA
> >  	depends on NET_DSA || !NET_DSA
> >  	select NET_AIROHA_NPU
> >  	select PAGE_POOL
> > +	select PHYLINK
> >  	help
> >  	  This driver supports the gigabit ethernet MACs in the
> >  	  Airoha SoC family.
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index dba7c52c0896..5065d6583b9f 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> 
> nit: alphabetic order.
> 
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -1915,6 +1916,14 @@ static int airoha_dev_open(struct net_device *netdev)
> >  	struct airoha_qdma *qdma;
> >  	int err;
> >  
> > +	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
> > +	if (err) {
> > +		netdev_err(netdev, "could not attach PHY: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	phylink_start(dev->phylink);
> 
> Should it be last operation in airoha_dev_open()?
>

I checked also other ethernet driver for this pattern and it seems
phylink_start is always called before any netif_start_queues.

I'm addressing all the other suggestion and adding the Ack if you are ok
with keeping this as is.
 
> > +
> >  	netif_tx_start_all_queues(netdev);
> >  	err = airoha_set_vip_for_gdm_port(dev, true);
> >  	if (err)
> > @@ -1954,6 +1963,10 @@ static int airoha_dev_stop(struct net_device *netdev)
> >  		airoha_set_gdm_port_fwd_cfg(dev->eth,
> >  					    REG_GDM_FWD_CFG(port->id),
> >  					    FE_PSE_PORT_DROP);
> > +
> > +	phylink_stop(dev->phylink);
> 
> Should it be the first one? (reverse order of airoha_dev_open()).
> 
> > +	phylink_disconnect_phy(dev->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2509,6 +2522,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
> >  	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
> >  }
> >  
> > +static int
> > +airoha_ethtool_get_link_ksettings(struct net_device *netdev,
> > +				  struct ethtool_link_ksettings *cmd)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +
> > +	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
> > +}
> > +
> > +static int
> > +airoha_ethtool_set_link_ksettings(struct net_device *netdev,
> > +				  const struct ethtool_link_ksettings *cmd)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +
> > +	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
> > +}
> > +
> >  static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
> >  					 int channel, enum tx_sched_mode mode,
> >  					 const u16 *weights, u8 n_weights)
> > @@ -3353,7 +3384,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
> >  	.get_drvinfo		= airoha_ethtool_get_drvinfo,
> >  	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
> >  	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
> > -	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
> > +	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
> > +	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
> >  	.get_link		= ethtool_op_get_link,
> >  };
> >  
> > @@ -3409,6 +3441,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +/* Nothing to do in MAC, everything is handled in PCS */
> > +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> > +			      const struct phylink_link_state *state)
> > +{
> > +}
> > +
> > +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> > +			       unsigned int mode, phy_interface_t interface,
> > +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
> > +						  phylink_config);
> > +	struct airoha_gdm_port *port = dev->port;
> > +	struct airoha_eth *eth = dev->eth;
> > +	u32 frag_size_tx, frag_size_rx;
> > +	u32 mask, val;
> > +
> > +	/* TX/RX frag is configured only for GDM4 */
> > +	if (port->id != AIROHA_GDM4_IDX)
> > +		return;
> > +
> > +	switch (speed) {
> > +	case SPEED_10000:
> > +	case SPEED_5000:
> > +		frag_size_tx = 8;
> > +		frag_size_rx = 8;
> > +		break;
> > +	case SPEED_2500:
> > +		frag_size_tx = 2;
> > +		frag_size_rx = 1;
> > +		break;
> > +	default:
> > +		frag_size_tx = 1;
> > +		frag_size_rx = 0;
> 
> Missing break here.
> 
> > +	}
> > +
> > +	mutex_lock(&port->reg_lock);
> > +
> > +	/* Configure TX/RX frag based on speed */
> > +	if (dev->nbq == 1) {
> > +		mask = GDM4_SGMII1_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}  else {
> > +		mask = GDM4_SGMII0_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG, mask, val);
> > +
> > +	if (dev->nbq == 1) {
> > +		mask = GDM4_SGMII1_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
> > +				 frag_size_rx);
> > +	} else {
> > +		mask = GDM4_SGMII0_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
> > +				 frag_size_rx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG, mask, val);
> 
> nit: I guess you can have just one if/else block here running airoha_fe_rmw()
> inside the block and getting rid of val/mask.
> 
> > +
> > +	mutex_unlock(&port->reg_lock);
> > +}
> > +
> > +/* Nothing to do in MAC, everything is handled in PCS */
> > +static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
> > +				 phy_interface_t interface)
> > +{
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_config = airoha_mac_config,
> > +	.mac_link_up = airoha_mac_link_up,
> > +	.mac_link_down = airoha_mac_link_down,
> > +};
> > +
> > +static int airoha_fill_available_pcs(struct phylink_config *config,
> > +				     struct phylink_pcs **available_pcs,
> > +				     unsigned int num_possible_pcs)
> > +{
> > +	struct device *dev = config->dev;
> > +
> > +	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
> > +					num_possible_pcs);
> > +}
> > +
> > +static int airoha_setup_phylink(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +	struct device_node *np = netdev->dev.of_node;
> > +	struct airoha_gdm_port *port = dev->port;
> > +	struct phylink_config *config;
> > +	phy_interface_t phy_mode;
> > +	struct phylink *phylink;
> > +	int err;
> > +
> > +	err = of_get_phy_mode(np, &phy_mode);
> > +	if (err) {
> > +		dev_err(&netdev->dev, "incorrect phy-mode\n");
> > +		return err;
> > +	}
> > +
> > +	config = &dev->phylink_config;
> > +	config->dev = &netdev->dev;
> > +	config->type = PHYLINK_NETDEV;
> > +
> > +	/*
> > +	 * GDM1 only supports internal for Embedded Switch
> > +	 * and doesn't require a PCS.
> > +	 */
> > +	if (port->id == AIROHA_GDM1_IDX) {
> > +		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +					   MAC_10000FD;
> > +
> > +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +			  config->supported_interfaces);
> > +	} else {
> > +		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +					   MAC_10 | MAC_100 | MAC_1000 |
> > +					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
> > +
> > +		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
> > +		config->fill_available_pcs = airoha_fill_available_pcs;
> > +
> > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_10GBASER,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_USXGMII,
> > +			  config->supported_interfaces);
> > +
> > +		phy_interface_copy(config->pcs_interfaces,
> > +				   config->supported_interfaces);
> > +	}
> > +
> > +	phylink = phylink_create(config, of_fwnode_handle(np),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink))
> > +		return PTR_ERR(phylink);
> > +
> > +	dev->phylink = phylink;
> > +
> > +	return 0;
> > +}
> > +
> >  static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  				   struct airoha_gdm_port *port,
> >  				   int nbq, struct device_node *np)
> > @@ -3474,7 +3655,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  	dev->nbq = nbq;
> >  	port->devs[index] = dev;
> >  
> > -	return 0;
> > +	return airoha_setup_phylink(netdev);
> >  }
> >  
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> > @@ -3510,6 +3691,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  
> >  	port->id = id;
> >  	spin_lock_init(&port->stats_lock);
> > +	mutex_init(&port->reg_lock);
> >  	eth->ports[p] = port;
> >  
> >  	err = airoha_metadata_dst_alloc(port);
> > @@ -3706,6 +3888,8 @@ static int airoha_probe(struct platform_device *pdev)
> >  			netdev = netdev_from_priv(dev);
> >  			if (netdev->reg_state == NETREG_REGISTERED)
> >  				unregister_netdev(netdev);
> > +			if (dev->phylink)
> > +				phylink_destroy(dev->phylink);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > @@ -3744,6 +3928,7 @@ static void airoha_remove(struct platform_device *pdev)
> >  
> >  			netdev = netdev_from_priv(dev);
> >  			unregister_netdev(netdev);
> > +			phylink_destroy(dev->phylink);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index fa9a8edce22f..6396a5aec384 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -595,6 +595,9 @@ struct airoha_gdm_dev {
> >  	 * QDMA migration.
> >  	 */
> >  	spinlock_t txq_lock[AIROHA_NUM_NETDEV_TX_RINGS];
> > +
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> >  };
> >  
> >  struct airoha_gdm_port {
> > @@ -604,6 +607,8 @@ struct airoha_gdm_port {
> >  
> >  	/* protect concurrent hw_stats accesses */
> >  	spinlock_t stats_lock;
> > +	/* protect concurrent GDM4 register access */
> > +	struct mutex reg_lock;
> 
> nit: naming is always hard, maybe link_lock?
> 
> >  
> >  	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
> >  };
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index 442b48c9b991..4ea89057b560 100644
> > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > @@ -357,6 +357,18 @@
> >  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
> >  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> >  
> > +#define REG_FE_GDM4_TMBI_FRAG		0x2028
> > +#define GDM4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDM4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDM4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDM4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> > +#define REG_FE_GDM4_RMBI_FRAG		0x202c
> > +#define GDM4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDM4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDM4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDM4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> >  #define REG_MC_VLAN_EN			0x2100
> >  #define MC_VLAN_EN_MASK			BIT(0)
> >  
> > -- 
> > 2.53.0
> > 



-- 
	Ansuel

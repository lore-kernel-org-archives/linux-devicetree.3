Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FFC39C00C
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553145; cv=none; b=qqMiO6MeIkkIwQzgDLB+RzK4eG9dFaln3AWHW6Az2kT9fdyRRndEY/H6Oemx+ZoaK+w9QAqVN/SbNLLKVFSIdm+kiM6Fha6v238AlzK7IIRyoQrB5f+WEacodARHB5s6sRrk3SCtv7iK2jngqyfIhyWR4RbLax3kAfztXJcy0/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553145; c=relaxed/simple;
	bh=qAvcd8KV8i0oCeUFeItRYTgvHsO+kk5Prfmf2cHu3nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASfSTkNR3nV4jVEVjbSxhKNWO6n3WjUkRnhDJ6Nmd9em664gta3bAvFgucLTIqQFHMAd6AQy3xxj6yRAfLOMuvrRGO1VNXTXUeY5P1dAR4aUXZ9SWcrtDCCRvGZhvoFvjbjQhv43c8KMRaGBwcHkAP26fgkP8JNSoEgacoSGtSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V22sHbm+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V22sHbm+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so7568545e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775553142; x=1776157942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQ7KewCbuwaOxvClMzMc1+LqgmYOmarKwkVc4uUvJpU=;
        b=V22sHbm+3dpcbBwjOuJKBN+bfe3lnvKPSgGt1Q3R9OSBULR0IWfiG2ikfSrhlZJhRR
         T7drvY9X4MuXi1Bbsu5xD/xL9cXNIGOhPFmAfTfFkMPB+TGKcC5PfTYqTxc8gVgRiPgp
         Fi0/PJmohViwitPbpO01+OL6DK6slIJSxj42P+M5yXdzgpykAfcA1tvZ+NdDqBXXshw6
         ZL+u30wUkdHxJ320CULaEdJCNaOmdxK1PbvFcYenVArK+Xl4jS6z5CjBg/PiE3LLBl2r
         3wN4CzP6wqV0ifxK7v4YqkM42TH/lQs8DGr8hajeUP3/N8h3jw/srBOdffhpagohxHju
         WkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553142; x=1776157942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQ7KewCbuwaOxvClMzMc1+LqgmYOmarKwkVc4uUvJpU=;
        b=jsuzhpIjXvtwZu3vOZZNHuNmdU+fNv2yztTZCNHgiXZ6RCmMQSX491QtA0kZFhSdeE
         bRADwJnpcZWPhjRjLaApF4TNHHvob1beFQ2pJ0BKfWs5gIs12P1vj89UAdQF32vLaqY7
         hGxD/2//ysnebl7ZVKsPSwfETI32FxukfzeJ21aB4KQMxDo8akuX1emW9M04N9RWqh+1
         RXTuvXM/pHgZTmmdV0MRhuVPNRxv5w7+r+qJDrQRNeA659PE7umLVtFF2TZO7KYVz/xU
         GFVCsvaDZM5xrCoCUyGOxDwmRL4LR3iHda1M6msnNbQ+RFhUW7J8mkWO/uWvoUIY57f0
         qIrw==
X-Forwarded-Encrypted: i=1; AJvYcCVDe1EQLVoT+ne1nlyfVEfqdFuEzB+EXIuz0vT/O9xb9m2nFHb4w9Utn6TYgc1Wo+TRtPvDMaFWOFct@vger.kernel.org
X-Gm-Message-State: AOJu0YwjhthXhFdpoAAfDDF9vjMSc9Bm8bI2sl4cE44P6bCqYjQtWdab
	0tU81+wNFZHGDwL11Qz9C9znWfYEOmikhRYdVth5o+RwfufFZhcdjFgi
X-Gm-Gg: AeBDieuEk+Aa41JrQsiNP65S21EWGdda+9mdc/4Mbwex+89TAIWC+rpew805VsUH8zf
	LLFyEhBLG+fKzEnLUoLBhwLfMksrS7NnAsjX1xXQZNE1RgEQ6y/KnMQNGb6DOAqo+6HteAD7a+m
	jxIHhDhuMfNuS8puJzQLcsrMDi+sTnUjhpcC0NKJ8GEsj6NM6k8HEjcbC8TjxYNOi9kB4ceNffy
	/Dv/0jMjGlATdSp0ePokn0bA3Flo0jjJciSyAA2YjxQAIF3fRcpTTzBXqc07kaYmPYYpplZdESu
	q35lOZ+dKpCNZ0dIhHbDGT77V9Pv9oZeSN7UaXeU9cE88jyMJ1Jlr4XiSTbWPO3o7dz2/EyriA8
	dVQq9mHi1Plk+Rb5LrWHBK6huQEAS72ADu4Jr6JCdutbkG2U/sthm+x7OsGGGbG+ZAWnUoK0+vX
	4zxoFrRN+nuwgmoIs=
X-Received: by 2002:a05:600c:1381:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-488996b43b5mr125472385e9.1.1775553141252;
        Tue, 07 Apr 2026 02:12:21 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:41ba:75e1:d08f:8974])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm521212815e9.5.2026.04.07.02.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:12:20 -0700 (PDT)
Date: Tue, 7 Apr 2026 12:12:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jens Emil Schulz Ostergaard <jensemil.schulzostergaard@microchip.com>
Cc: Jakub Kicinski <kuba@kernel.org>, UNGLinuxDriver@microchip.com,
	andrew@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, horms@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, woojung.huh@microchip.com,
	linux@armlinux.org.uk, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/9] net: dsa: lan9645x: add basic dsa driver
 for LAN9645X
Message-ID: <20260407091217.rrwzho3lcmfip3y5@skbuf>
References: <20260324-dsa_lan9645x_switch_driver_base-v2-4-f7504e3b0681@microchip.com>
 <20260329195629.2789129-1-kuba@kernel.org>
 <c1b824a3e597b37df133053f6b216e9196b130d5.camel@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1b824a3e597b37df133053f6b216e9196b130d5.camel@microchip.com>

On Wed, Apr 01, 2026 at 01:46:19PM +0200, Jens Emil Schulz Ostergaard wrote:
> On Sun, 2026-03-29 at 12:56 -0700, Jakub Kicinski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > ---
> > Subject: net: dsa: lan9645x: add basic dsa driver for LAN9645X
> > 
> > This commit adds a basic DSA driver for the Microchip LAN9645X switch. It
> > includes initialization, port module setup for NPI, CPU, and front ports,
> > and phylink integration for MAC side configuration.
> > 
> > diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_npi.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_npi.c
> > --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_npi.c
> > +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_npi.c
> > [ ... ]
> > > +static void disable_conduit_ipv6(struct lan9645x *lan9645x,
> > > +                              struct net_device *conduit)
> > > +{
> > > +     struct inet6_dev *dev_v6;
> > > +
> > > +     if (!conduit)
> > > +             return;
> > > +
> > > +     /* IPv6 on the conduit will generate frames bypassing our tag driver, so
> > > +      * they lack an IFH. This will be garbage in garbage out and we want to
> > > +      * avoid this.
> > > +      */
> > > +     rtnl_lock();
> > > +     dev_v6 = __in6_dev_get(conduit);
> > > +     if (dev_v6) {
> > > +             WRITE_ONCE(dev_v6->cnf.disable_ipv6, 1);
> > > +             dev_warn(lan9645x->dev, "Disabled IPv6 on conduit device: %s\n",
> > > +                      netdev_name(conduit));
> > > +     }
> > > +     rtnl_lock();
> > > +}
> > 
> > Does directly modifying dev_v6->cnf.disable_ipv6 bypass the proper sysctl
> > teardown path (addrconf_disable_ipv6) and leave the IPv6 stack in an
> > inconsistent state on the conduit device by failing to clean up routes,
> > addresses, and MLD memberships?
> > 
> > Is it a layering violation for a switch driver to alter the networking
> > configuration of an external upper device, especially since this change
> > isn't reverted during driver unbind?
> 
> Yes this will bypass the sysctl teardown path. I can change this to instead
> read disable_ipv6 state and warn the user that their device is misconfigured.

I don't want to have to deal with a DSA driver altering the conduit
configuration outside of the DSA core. NACK to any attempts of trying
this.

Define "garbage in, garbage out" for your case. The packets are sent to
random ports? Normally, switches are configured by their drivers to drop
those packets that don't contain DSA tags. You can also do that, by
setting up the switch to require an injection prefix.

> > [ ... ]
> > > +     /* Configure IFH prefix mode for NPI port. */
> > > +     lan_rmw(SYS_PORT_MODE_INCL_XTR_HDR_SET(LAN9645X_TAG_PREFIX_LONG) |
> > > +             SYS_PORT_MODE_INCL_INJ_HDR_SET(LAN9645X_TAG_PREFIX_NONE),
> > > +             SYS_PORT_MODE_INCL_XTR_HDR |
> > > +             SYS_PORT_MODE_INCL_INJ_HDR,
> > > +             lan9645x,
> > > +             SYS_PORT_MODE(p->chip_port));
> > 
> > Setting LAN9645X_TAG_PREFIX_NONE means the hardware interprets the first
> > bytes of any frame received from the host as an IFH command structure.
> > 
> > Does this allow a local user to transmit crafted frames (for example, via
> > raw sockets or standard protocols) whose MAC address bytes map to malicious
> > IFH commands, thereby bypassing VLAN isolation or flooding the switch?
> > 
> > Should the hardware be configured to require a strict prefix, such as
> > LAN9645X_TAG_PREFIX_LONG, for injected frames to prevent this?
> 
> A prefix offers no protection against the described scenario. The current
> configuration is correct. If a prefix is configured frames MUST contain the
> prefix. With the conduit exposed in userspace this is not something we can
> guarantee.

The short prefix prevents user space from sending frames by mistake
which will reach the wire (daemons attaching to all interfaces, like for DHCP).
It still allows user space to intentionally inject frames into the
switch (for example from XDP on the conduit).

I recommend you go for the short prefix and drop the conduit alterations.

> > diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> > --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> > +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> > [ ... ]
> > > +static int lan9645x_setup(struct dsa_switch *ds)
> > > +{
> > > +     struct lan9645x *lan9645x = ds->priv;
> > > +     struct device *dev = lan9645x->dev;
> > > +     u32 all_phys_ports;
> > > +     int err;
> > > +
> > > +     lan9645x->num_phys_ports = ds->num_ports;
> > > +     all_phys_ports = GENMASK(lan9645x->num_phys_ports - 1, 0);
> > > +
> > > +     err = lan9645x_reset_switch(lan9645x);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     lan9645x->ports = devm_kcalloc(lan9645x->dev, lan9645x->num_phys_ports,
> > > +                                    sizeof(struct lan9645x_port *),
> > > +                                    GFP_KERNEL);
> > 
> > Since the DSA .setup callback can be invoked multiple times during the
> > platform device's lifetime (for example, when the DSA master interface is
> > unbound and bound again), does using devm_kcalloc here cause a memory leak?
> > Should these allocations be moved to .probe or managed with kcalloc and
> > freed in .teardown?
> > 
> 
> Hmm I do not think this is right? I think dsa_tree_teardown is called from
> dsa_switch_remove which is called by the switch drivers .remove.
> 
> So I do not think you can get multiple setup/teardown cycles during the device
> lifetime?
> 
> As far as I can tell both felix and ksz use device managed allocations in their
> setup callback.

It's valid feedback in general. In a multi-switch tree, ds->ops->setup()
is called when the tree is complete, and ds->ops->teardown() when the
first switch disappears. If there are 2 switches and you unbind and
rebind the driver from A, then switch B will see a ds->ops->teardown()
call followed by ds->ops->setup().

In your case, since the switch doesn't support cascading, it probably
doesn't matter. But the LLM doesn't have the context to know that.

> > [ ... ]
> > > +     /* Set all the entries to obey VLAN. */
> > > +     for (int i = 0; i < PGID_ENTRIES; ++i)
> > > +             lan_wr(ANA_PGID_CFG_OBEY_VLAN_SET(1),
> > > +                    lan9645x, ANA_PGID_CFG(i));
> > 
> > PGID_ENTRIES is defined as 89, so this loop initializes indices 0 through
> > 88. Since the CPU port is index 9, its source PGID is PGID_SRC + CPU_PORT
> > (80 + 9 = 89).
> > 
> > Is index 89 left uninitialized, breaking the OBEY_VLAN rule and allowing
> > CPU-injected frames to leak across VLAN boundaries?
> > 
> 
> No I this misunderstands OBEY_VLAN. When set the vlan table can control
> whether cpu copy from the pgid table is enabled. It makes no sense for PGID 89.

Explain that in a comment.

> > [ ... ]
> > > +     /* Multicast to all front ports */
> > > +     lan_wr(all_phys_ports, lan9645x, ANA_PGID(PGID_MC));
> > > +
> > > +     /* IP multicast to all front ports */
> > > +     lan_wr(all_phys_ports, lan9645x, ANA_PGID(PGID_MCIPV4));
> > > +     lan_wr(all_phys_ports, lan9645x, ANA_PGID(PGID_MCIPV6));
> > > +
> > > +     /* Unicast to all front ports */
> > > +     lan_wr(all_phys_ports, lan9645x, ANA_PGID(PGID_UC));
> > > +
> > > +     /* Broadcast to all ports */
> > > +     lan_wr(BIT(CPU_PORT) | all_phys_ports, lan9645x, ANA_PGID(PGID_BC));
> > 
> > PGID_BC includes BIT(CPU_PORT) and all_phys_ports (which includes the NPI
> > port). Will this forward broadcast frames to both the CPU extraction queue
> > and the NPI port's normal egress queue, causing duplicate frames for the host?
> > 
> > Conversely, the multicast masks and PGID_UC exclude BIT(CPU_PORT). Does
> > this cause them to bypass the CPU extraction queue entirely, thereby
> > lacking the LONG extraction prefix and breaking the host's DSA tagger parsing?
> > 
> 
> No this is not how it works. Generally when you configure the CPU port to use
> an NPI port, the hardware manages this internally. You do you have to start
> using the npi port number all of a sudden.

The comment is fair though. Why would you set all_phys_ports to
GENMASK(lan9645x->num_phys_ports - 1, 0) when you can compute the mask
of user ports which are enabled? It seems sloppy at best, and also
contradictory (comments say "all front ports", but code includes the NPI
port in this mask).

> > [ ... ]
> > > +int lan9645x_port_setup(struct dsa_switch *ds, int port)
> > > +{
> > > +     struct dsa_port *dp = dsa_to_port(ds, port);
> > > +     struct lan9645x *lan9645x = ds->priv;
> > > +     struct lan9645x_port *p;
> > > +
> > > +     p = lan9645x_to_port(lan9645x, port);
> > > +
> > > +     if (dp->dn) {
> > > +             p->rx_internal_delay =
> > > +                     of_property_present(dp->dn, "rx-internal-delay-ps");
> > > +             p->tx_internal_delay =
> > > +                     of_property_present(dp->dn, "tx-internal-delay-ps");
> > > +     }
> > 
> > These are standard integer properties specifying delays in picoseconds. If
> > a user explicitly disables the delay via devicetree using a value of 0,
> > will of_property_present evaluate to true and enable the hardware delay
> > anyway? Should of_property_read_u32 be used instead to check the value?
> 
> A value of 0 is not allowed per the bindings. The bindings enforce that if this
> is present the value must be 2000.

Bindings may change. Please use of_property_read_u32().

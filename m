Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95422931D5
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076418; cv=none; b=IPcsZacV3sXjdpENJGPe/l4a8opulQOFn3E7syhx01Q6bE5MOZYsIRChWFuYQCMLdbV9eEucgCNRXmzilFNyKHy4Q1NsINPYDDxB1Yg26s7EImbItAkAqzwHPOP9KhvMvkgACHyz0myOyVi1vg9A/gScSWhtwK6MghSLQVzEDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076418; c=relaxed/simple;
	bh=JJDFfhsd/GTM+KIZs2Xzv41T1UmgO+KFHtsTYBpYdzk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJWX+8jZYwLlxqOvyR/O+MobyND7vfOmpPb4Nn6AXEHOBNLiONkwkTWNhXtwSN+KAMtihW8XdKzUQsOCKcMpYwfd6CFGkHS/sET23u1Y3Ok+roy012nlkt5f4330lZfLDniXEe6LiGm44/jogA3/PZW7KHoJKpuVzlWbHulqaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkaS6+k8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkaS6+k8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so14806665e9.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785076415; x=1785681215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dx/36lpu5YKnUlGy6gnSnCmKuHwVnomYG6DKntygu6o=;
        b=pkaS6+k8KRZ9yEOXii3os6s/qIP4QRYPJ37vrGuLvKP5zofwE1+VF/xLypY2Ln9iQ6
         VEBbIrocXTlRydmwk6ntiN+W45k9MKk9u8czJBRpHnOkTU+EIrL0x+evtGgWkfpiGzZo
         D2O4wMI3ZeFZYtCkOulgx7JaNSken3Pz6SDH0rmnxTTKgCrZu7iXEc+i3n1C88f0C3b9
         E56OVYvVROtNSJ1026EJyyyz3Z2j4Oi5y7hszC/5Tm8rElbAvUUUy6ZUQ4quINNMIhAq
         rstxACF3aDqp+52/ivVfKAdGa40M1Hu+5Lh4f5hl0vqCUcc6wt+QjzxCi7sRKGmVZ4EG
         HRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785076415; x=1785681215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/36lpu5YKnUlGy6gnSnCmKuHwVnomYG6DKntygu6o=;
        b=QnQg4y/fIqkJPyo4GhEgN+B4XXBHfixNgtglBWUNwgnqp9HeE3zsIMefFSe+5daTV3
         MqMc+mogRn6MKeSfMuq3XfZwAJa7YjC/NW+tyv3Dq1p6Bpw8xbzemJr5/NYboqwUSINo
         GJ5PNFUSvciDG+8UNUZUgW7DCGA3HvhoeAlfGpfesfNjXhSoeE+njbnoII/lrkroYcWg
         5okh5OkwLwpKrXYrra7MMZUVF/e0p1RbaCqI3B8vGpl/vKBWatQtvdP9Qx54M0Mf6BM/
         UgUOmG1z5MTgQ8dF3XAaTNDhiToJEzkH0ey4SqvP7wOutsRTvZK/8UNxyQXjOQyArPyW
         dUBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpkf6mmu/7F19vgFvzyR6IplqVsnx31nAMTm3RB4NyRDZMj3NPjSg8qVfGfI2nHCfoit/NzGLraPr2G@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDsjxFG5BV5/GjCIOj8tvfCFjsATtoacdq/MllDAQ/gjuNZHg
	gkRuwOtuKDzYXOpiaSppJv/ZZ36y9BNGDWvRsEFfu6pcdmFY2hUxl9EV
X-Gm-Gg: AR+sD11Nc86W08JD0nBd1b/Z4OXF58rjZg8sT8aPB8zibg/xfxiuv0f4HxCwJb61qXK
	RIOaviYb/84dI7qVl1tmnPCENm7y6qKbDgKxOb1oCIZCLLp8GvgtngnATcouk8nQ8lqs/B3YYSy
	OE+4k8brvKuC5/ty2fkp9PFddEzWq9oUArJm2iM11Fd1Oht85TIYHLJaBDy+7GjjWAuXkKxxSPp
	lLWZnZ1TQ6Xfl0TGf1ZMv3GwApHsCMHDiCi1hZfztU4eQzQbMlU13aiMrpspbl0wudw08k+jzEG
	KyzCPJM4zpyVeTmjeVdPBgE1oDMAsgeFRPMfrTsNTkWeVuTMaXltdpsAxr6z+A5qXPSyFnsecvN
	rvtc9YidD3jyYVEP3kWcUOWRt2WR+z7KsIOWFXO7CSQGlpAw6gdN5j1YsnE3Iww2/O4XgnR6i8R
	JUPsVdolqRlw2cCI0ZtW1Hw0QM6WLoe1HMrzhiAUSEGe7R
X-Received: by 2002:a05:600c:4704:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-496b5c92ebfmr64411455e9.19.1785076414619;
        Sun, 26 Jul 2026 07:33:34 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-0-193-91.retail.telecomitalia.it. [87.0.193.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed5f93sm234143555e9.1.2026.07.26.07.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:33:33 -0700 (PDT)
Message-ID: <6a661abd.47e43f48.2d554a.cce9@mx.google.com>
X-Google-Original-Message-ID: <amYauZfp7GWNQK0E@Ansuel-XPS.>
Date: Sun, 26 Jul 2026 16:33:29 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v9 06/12] net: Document PCS subsystem
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-7-ansuelsmth@gmail.com>
 <d9ffe027-c3de-4b96-949b-8e9dd4e53dd1@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9ffe027-c3de-4b96-949b-8e9dd4e53dd1@bootlin.com>

On Tue, Jul 21, 2026 at 02:11:46PM +0200, Maxime Chevallier wrote:
> 
> 
> On 7/17/26 08:54, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  Documentation/networking/index.rst |   1 +
> >  Documentation/networking/pcs.rst   | 229 +++++++++++++++++++++++++++++
> >  2 files changed, 230 insertions(+)
> >  create mode 100644 Documentation/networking/pcs.rst
> > 
> > diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
> > index 44a422ad3b05..3fce8f6ac089 100644
> > --- a/Documentation/networking/index.rst
> > +++ b/Documentation/networking/index.rst
> > @@ -28,6 +28,7 @@ Contents:
> >     net_failover
> >     page_pool
> >     phy
> > +   pcs
> >     sfp-phylink
> >     alias
> >     bridge
> > diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
> > new file mode 100644
> > index 000000000000..98592cdee3ef
> > --- /dev/null
> > +++ b/Documentation/networking/pcs.rst
> > @@ -0,0 +1,229 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=============
> > +PCS Subsystem
> > +=============
> > +
> > +The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
> > +of PCS devices. These devices contain the upper sublayers of the Ethernet
> > +physical layer, generally handling framing, scrambling, and encoding tasks. PCS
> > +devices may also include PMA (Physical Medium Attachment) components. PCS
> > +devices transfer data between the Link-layer MAC device, and the rest of the
> > +physical layer, typically via a serdes. The output of the serdes may be
> > +connected more-or-less directly to the medium when using fiber-optic or
> > +backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
> > +with a separate PHY (such as over SGMII) which handles the connection to the
> > +medium (such as 1000BASE-T).
> > +
> > +Remark on usage of .mac_select_pcs and fw_node PCS
> > +--------------------------------------------------
> > +
> > +There are generally two ways to look up a PCS device.
> > +
> > +1. MAC OP struct .mac_select_pcs (considered legacy)
> > +2. firmware node (fwnode) PCS entirely handled by phylink
> > +
> > +Implementation 1 leaves the entire handling of the PCS to the MAC
> > +driver with the selection of the PCS driven by .mac_select_pcs.
> > +Custom implementations are required if the PCS is external to the MAC
> > +and needs to be handled by a separate driver.
> > +
> > +This implementation is considered legacy and it's suggested to
> > +switch to the new fwnode PCS.
> 
> The .mac_select_pcs can be deprecated, with the .fill_available_pcs()
> mecanism available, we can keep PCS implems inside the MAC driver when
> it makes sense, no ?

Yes that is the idea but it might take a while to deprecate it.

> 
> If PCSs aren't described in firmware (i.e. DT), we have to use .fill_available_pcs()
> without using the fwnode API if I get your code right.

Yes everything should be described that way. 

> 
> The 'legacy' part is the only remark I have, the rest is all good :)
> 

Any hint on the wording? I remember you already said something about this.
I will check previous review.

> > +
> > +Looking up PCS Devices (fwnode implementation)
> > +-----------------------------------------------
> > +
> > +The lookup of a PCS device follows the common producer/consumer implementation
> > +used by similar subsystems with a ``#pcs-cells`` on the producer and a
> > +``pcs-handle`` property on the consumer::
> > +
> > +    pcs: pcs {
> > +        // ...
> > +        #pcs-cells = <0>;
> > +    };
> > +
> > +    ethernet-controller {
> > +        // ...
> > +        pcs-handle = <&pcs>;
> > +    };
> > +
> > +On :c:func:`phylink_create`, phylink will use the ``num_possible_pcs``
> > +value and ``fill_available_pcs`` helper function in
> > +:c:struct:`phylink_config` to compose the list of available PCS that can be
> > +used for the phylink instance.
> > +
> > +Phylink will then internally handle the selection of the correct PCS for
> > +the requested interface mode based on the interface modes configured in
> > +``pcs_interfaces`` in :c:struct:`phylink_config` struct and
> > +``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
> > +
> > +A PCS is considered eligible when the requested interface mode is present
> > +in both ``pcs_interfaces`` in :c:struct:`phylink_config` struct and
> > +``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
> > +
> > +``supported_interfaces`` describes all interface modes supported by the MAC,
> > +whereas ``pcs_interfaces`` identifies the subset that require PCS selection.
> > +
> > +For the special implementation where the PCS is internal or part of the MAC
> > +and a dedicated driver is not needed, it's possible to leave the implementation
> > +of the PCS to the MAC driver and just implement the ``num_possible_pcs``
> > +value and ``fill_available_pcs`` helper  function in
> > +:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
> > +struct allocated from the MAC driver.
> > +
> > +Using PCS Devices
> > +-----------------
> > +
> > +It's mandatory to either implement the ``mac_select_pcs`` callback
> > +of :c:struct:`phylink_mac_ops` or ``num_possible_pcs`` and ``fill_available_pcs``
> > +of :c:struct:`phylink_config` to use a PCS for a MAC.
> > +
> > +The fwnode implementation exposes simple helpers to parse the PCS from
> > +the fwnode :c:func:`fwnode_phylink_pcs_count` and
> > +:c:func:`fwnode_phylink_pcs_parse`. The :c:func:`fwnode_phylink_pcs_count` helper
> > +takes the fwnode where the ``pcs-handle`` should be parsed and return the
> > +number of PCS entries described in the fwnode.
> > +The :c:func:`fwnode_phylink_pcs_parse` helper takes three arguments,
> > +the fwnode where the ``pcs-handle`` should be parsed, an allocated array
> > +of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
> > +and the maximum number of PCS to parse.
> > +Contrary to :c:func:`fwnode_phylink_pcs_count`, :c:func:`fwnode_phylink_pcs_parse`
> > +helper fills the allocated array with ONLY the available PCS and return the
> > +number of available PCS found. PCS that returns -ENODEV will be skipped and
> > +won't be inserted in the allocated array.
> > +
> > +A phylink instance may use multiple PCS devices. The maximum number is reported
> > +through ``num_possible_pcs``.
> > +
> > +It's mandatory to specify for what interface a PCS is needed. This can be done
> > +by filling the ``pcs_interfaces`` in :c:struct:`phylink_config` struct.
> > +If the requested interface mode is not present in this bitmask, phylink does
> > +not search for a PCS for  that specific mode. (example MAC doesn't need a PCS
> > +for SGMII but require one for USXGMII)
> > +
> > +With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
> > +is the following::
> > +
> > +   static int mac_fill_available_pcs(struct phylink_config *config,
> > +   				                      struct phylink_pcs **available_pcs,
> > +					                      unsigned int num_possible_pcs)
> > +   {
> > +   	struct device *dev = config->dev;
> > +
> > +   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
> > +						                    num_possible_pcs);
> > +   }
> > +
> > +   static int mac_setup_phylink(struct net_device *netdev)
> > +   {
> > +      struct phylink_config *config;
> > +
> > +      // ...
> > +
> > +      config->dev = &netdev->dev;
> > +
> > +      // ...
> > +
> > +      // Parse possible PCS and fill num_possible_pcs.
> > +      config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(&netdev->dev));
> > +      config->fill_available_pcs = mac_fill_available_pcs;
> > +
> > +      __set_bit(PHY_INTERFACE_MODE_INTERNAL, config->supported_interfaces);
> > +      __set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
> > +      __set_bit(PHY_INTERFACE_MODE_1000BASEX, config->supported_interfaces);
> > +      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->supported_interfaces);
> > +
> > +      // PCS required only for USXGMII
> > +      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->pcs_interfaces);
> > +
> > +      phylink = phylink_create(config, //...
> > +
> > +It's worth to mention that it's phylink code that takes care of allocating
> > +the array of :c:struct:`phylink_pcs` pointer for ``fill_available_pcs``
> > +callback based on the value set in ``num_possible_pcs`` for
> > +:c:struct:`phylink_config` struct.
> > +
> > +The ``fill_available_pcs`` callback must not write more than
> > +``num_possible_pcs`` entries. The third argument may be used to validate
> > +that there is enough space to fill all the available PCS in the passed array
> > +of :c:struct:`phylink_pcs` pointer.
> > +
> > +The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
> > +and is used only to compose the initial available PCS list. Ownership of PCS
> > +is held by phylink and :c:func:`phylink_release_pcs` should be used to release
> > +them.
> > +
> > +Writing PCS Drivers
> > +-------------------
> > +
> > +To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
> > +register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
> > +The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
> > +the PCS provider should be registered to, a get function to return the requested
> > +PCS based on ``#pcs-cells`` and a pointer to reference private data for the get
> > +function.
> > +
> > +The PCS will then be registered to a global list of PCS provider that the
> > +PCS fwnode implementation will use to parse it.
> > +
> > +For the simple case where the PCS driver expose a single PCS,
> > +:c:func:`fwnode_pcs_simple_get` can be used as the get function.
> > +
> > +You must call :c:func:`fwnode_pcs_del_provider` from your remove function and
> > +release the PCS from any phylink instance under RTNL lock with
> > +:c:func:`phylink_release_pcs`::
> > +
> > +   fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
> > +
> > +	rtnl_lock();
> > +
> > +	for (i = 0; i < data->num_port; i++) {
> > +		struct pcs_port *port = &priv->ports[i];
> > +
> > +		phylink_release_pcs(&port->pcs);
> > +	}
> > +
> > +	rtnl_unlock();
> > +
> > +Late PCS registration handling
> > +------------------------------
> > +
> > +It's possible that a PCS becomes available after the MAC finished probing.
> > +Contrary to the usual producer/consumer implementation, when a PCS is not
> > +registered and can't be found, the fwnode parser helper returns ``-ENODEV``
> > +instead of ``-EPROBE_DEFER``.
> > +
> > +This is to prevent race condition with particular devices that register
> > +MAC and PCS with USB or PCIe and require the MAC to be registered before
> > +the PCS.
> > +
> > +The phylink logic correctly handle this special case and keep the phylink
> > +instance in a fail condition.
> > +
> > +The PCS fwnode implementation provides a notifier to which each phylink
> > +instance with a non-empty ``pcs_interfaces`` in :c:type:`phylink_config`
> > +registers. When a new PCS provider is registered, the notifier is called
> > +triggering the :c:func:`pcs_provider_notify` function.
> > +
> > +Function :c:func:`pcs_provider_notify` will check if the just added PCS
> > +should be used by the phylink instance. If it should be used then,
> > +it's added to the internal list of available PCS and a phylink major
> > +config is forced.
> > +
> > +If a phylink instance was in a failure state, with the just added PCS
> > +now part of the available PCS internal phylink list, provided all other
> > +conditions are satisfied, the configuration is retried and the failure
> > +condition is cleared.
> > +
> > +API Reference
> > +-------------
> > +
> > +.. kernel-doc:: include/linux/phylink.h
> > +   :identifiers: phylink_pcs
> > +
> > +.. kernel-doc:: include/linux/pcs/pcs.h
> > +   :internal:
> > +
> > +.. kernel-doc:: include/linux/pcs/pcs-provider.h
> > +   :internal:
> 

-- 
	Ansuel

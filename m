Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976632D877A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108190; cv=none; b=M7y5c/a7N1SCV78k2aESL3M6rkHbH9K4r8RNzyuWgfxlfyv9cEiZrwZ/hIUmeuEWBGh4qb8Lc+idO1eSC0kzO+RotkN5AR0fitYMT6CcN0v2wDiDeQi9uv7fVpKxp5btxvbRwoY1BBNMxXxwzikE7kd46XAYoLFNhRTKXP9fKhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108190; c=relaxed/simple;
	bh=MtRdUUtefu/KgquiVrgS8pKSLfZm2/hH0hgnqBwJeEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nSBiHDkCQWyJh/rwv6RuLYSlOZZ0BOPUmlBZmoIcyb4sVnjwmQexsb9ATbplGxF0d51hfb9bKeLS/p2KIUci+6+4qo6Kk4aT1/kC4OLGHch2d7kk88fQGjhoWIdwK+I5gc9SIsbAC9BbehMhjifTgaLg9M92asvmJ85tLyurEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ynlk9L24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ynlk9L24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B72E1F00893;
	Wed, 10 Jun 2026 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108189;
	bh=khVMuyH6aqcFHlQFTvY8rNpmrAmo/x4IDF6cJGeEKSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ynlk9L24QFej6jc3TDavMw7AUjOkK0cUeWIu5lc/wZGau0gXQlibVCPSel6hEKNYS
	 FXV3AGbRufy9siFeaf+ieM2UrRyoabNEou0B21foJxlgMnNjQPgDJg0klMDOqLSnKs
	 A9pmnHjNeB0tEcGUFxqB20wmO7KTl7P1R4b5uzrigVSRAaEBOOtNGDU+8EDVsn/YCf
	 lsNnftY4r4W8h44H7uXW4x6dTiOQI6vs8kxsAT7DgWW7sdjSytD9uR5GqoEUArL2U9
	 3QEJmMG3gkCOvRqB3ztx9x/jLI6CyvbbYb2mMVVkeySk2waQxVd8i1newElxFBQ7Am
	 RXEXxO9DwP7Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 12/12] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609151212.29469-13-ansuelsmth@gmail.com>
References: <20260609151212.29469-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:28 +0000
Message-Id: <20260610161629.3B72E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Calling `phylink_destroy()` before `unregister_netdev()` causes a =
Use-After-Free during device teardown.
- [High] Unconditional PCS parsing in `airoha_setup_phylink()` causes probe=
 failure for the GDM1 port.
- [Medium] The RX fragment size is incorrectly configured using the TX frag=
ment size variable due to a copy-paste error.
- [Medium] The `phylink` instance is leaked in the `airoha_probe()` error p=
ath for successfully allocated but unregistered devices.
--

commit 7158f1ddaf486067bb751bd3d43f1a8bfc87794f
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: airoha: add phylink support
   =20
    Add phylink support for each GDM port. For GDM1 add the internal interf=
ace
    mode as the only supported mode. For GDM2/3/4 add the required
    configuration of the PCS to make the external PHY or attached SFP cage
    work.
   =20
    These needs to be defined in the GDM port node using the pcs-handle
    property.

[ ... ]

> @@ -3148,6 +3161,153 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *e=
th,
>  	return false;
>  }
> =20
> +/* Nothing to do in MAC, everything is handled in PCS */
> +static void airoha_mac_config(struct phylink_config *config, unsigned in=
t mode,
> +			      const struct phylink_link_state *state)
> +{
> +}
> +
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy=
_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{

[ ... ]

> +	if (dev->nbq =3D=3D 1) {
> +		mask =3D GDMA4_SGMII1_RX_FRAG_SIZE_MASK;
> +		val =3D FIELD_PREP(GDMA4_SGMII1_RX_FRAG_SIZE_MASK,
> +				 frag_size_tx);
> +	} else {
> +		mask =3D GDMA4_SGMII0_RX_FRAG_SIZE_MASK;
> +		val =3D FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> +				 frag_size_tx);
> +	}

[Severity: Medium]
Should this use frag_size_rx instead of frag_size_tx when configuring the
RX fragment size? This looks like a typo that could cause the hardware to be
configured incorrectly when the RX and TX fragment sizes differ.

> +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, mask, val);
> +}

[ ... ]

> +static int airoha_setup_phylink(struct net_device *netdev)
> +{
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct device_node *np =3D netdev->dev.of_node;
> +	struct airoha_gdm_port *port =3D dev->port;
> +	struct phylink_config *config;
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
> +	int err;
> +
> +	err =3D of_get_phy_mode(np, &phy_mode);
> +	if (err) {
> +		dev_err(&netdev->dev, "incorrect phy-mode\n");
> +		return err;
> +	}
> +
> +	config =3D &dev->phylink_config;
> +
> +	config->dev =3D &netdev->dev;
> +	config->type =3D PHYLINK_NETDEV;
> +	config->mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |  MAC_1000=
0FD;
> +	if (port->id > AIROHA_GDM1_IDX)
> +		config->mac_capabilities |=3D MAC_10 | MAC_100 | MAC_1000 |
> +					    MAC_2500FD | MAC_5000FD;
> +
> +	err =3D fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
> +				       &config->num_available_pcs);
> +	if (err)
> +		return err;

[Severity: High]
Does this unconditional call to fwnode_phylink_pcs_parse() cause probe to
fail for the GDM1 port?

The commit message mentions that GDM1 does not require a PCS. If its device
tree node lacks a pcs-handle property, fwnode_phylink_pcs_parse() will retu=
rn
-ENODEV and abort the probe. Should this parsing logic be conditionally
skipped if port->id =3D=3D AIROHA_GDM1_IDX?

> +
> +	config->fill_available_pcs =3D airoha_fill_available_pcs;
> +
> +	/*
> +	 * GDM1 only supports internal for Embedded Switch
> +	 * and doesn't require a PCS.
> +	 */

[ ... ]

> @@ -3435,8 +3595,10 @@ static int airoha_probe(struct platform_device *pd=
ev)
>  				continue;
> =20
>  			netdev =3D netdev_from_priv(dev);
> -			if (netdev->reg_state =3D=3D NETREG_REGISTERED)
> +			if (netdev->reg_state =3D=3D NETREG_REGISTERED) {
> +				phylink_destroy(dev->phylink);
>  				unregister_netdev(netdev);
> +			}

[Severity: Medium]
Does this leak the phylink instance for devices that were successfully
allocated but failed to register?

In airoha_alloc_gdm_device(), the phylink structure is successfully allocat=
ed
prior to device registration. If airoha_probe() fails before or during devi=
ce
registration, the NETREG_REGISTERED check here skips calling
phylink_destroy() for unregistered devices, which would leave the memory
leaked.


[Severity: High]
Is it safe to destroy the phylink instance before calling
unregister_netdev()?

If the network interface is running (IFF_UP), unregister_netdev() will
synchronously bring the device down by invoking its ndo_stop callback, which
is airoha_dev_stop().

Inside airoha_dev_stop(), the driver attempts to halt phylink:
	phylink_stop(dev->phylink);
	phylink_disconnect_phy(dev->phylink);

Will this result in a use-after-free since dev->phylink was already destroy=
ed
here?

>  			of_node_put(netdev->dev.of_node);
>  		}
>  		airoha_metadata_dst_free(port);

[ ... ]

> @@ -3472,6 +3634,7 @@ static void airoha_remove(struct platform_device *p=
dev)
>  				continue;
> =20
>  			netdev =3D netdev_from_priv(dev);
> +			phylink_destroy(dev->phylink);
>  			unregister_netdev(netdev);

[Severity: High]
Similarly to the error path in airoha_probe(), does destroying the phylink
instance before calling unregister_netdev() cause a use-after-free when
airoha_dev_stop() tries to use dev->phylink?

>  			of_node_put(netdev->dev.of_node);
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D12

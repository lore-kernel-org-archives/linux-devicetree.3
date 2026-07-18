Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B473368B5
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365283; cv=none; b=qvV2cqY9UUKLjT/M5icGW15NMAqrIET00R6TuPYfFH6m5CKO1hXlmkEbHcxF7WZHb3eMh5BuYiTvFKt7LJVn9+oK0RcBIezOtnrkARexf0yzOoBT09w3j6Q6cngIRTwxz3MUrh1zAmWj4m8TyMrTRPgRXXEhFW4ZxkQZbrGiPvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365283; c=relaxed/simple;
	bh=tLr19T9WWLDW1tJcGBiCXt3zTLcEyMOQEHKqFZ2djp0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vk0pFi/aaGuDBjzezfhlf++eDSbJLQ5HAH26ADpl8fNFLzdo7lxBwMcwR9mA+Uk2ThfOILyX9YULAnerWwXhlrzHHmyEKwhrjg6cybOUbJLBVnZpEE/41SDwicdt+WUx70bOUH6MI7ClWXVN771FTxRgVmueR1KhLZ13IKBNdpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig2H1YFX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig2H1YFX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D3A1F00A3D;
	Sat, 18 Jul 2026 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365281;
	bh=Xj68q7+4SZ64ya0ebkXURTk+O9juc6TNZcPMDQcvyNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ig2H1YFXMWGtTMyaiCBeU8FofvIDjWvYvy6e4ehhDvz81UMhYgCafmhvJbqchj4vU
	 xHsOtTTXmUpy2iNIch40My0JnpkZXBKL5bX4oDKneGQu8n5X8KL4GRjZt8fchXA0z8
	 iKWUI335FL5xnJ+0zG9CrFatNJ5e2B7EI4pj0Cs/zZp2Nuuu+3ehsAGqOw9RfuL+vO
	 kuBtlbPKANXSQ8skPdY49y3xWSp/QbaqlQRuMAG7x5hQjRcLNhJMGki/ybg3tTqvzH
	 whTpPqHcSnFXgtQGLzU8J+CcuPQMcp6JTZvPxkLlWDncYKCzILF1eyytgjriMT9ZQL
	 /G9MD+SiZ3OIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 12/12] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717065448.1498335-13-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:21 +0000
Message-Id: <20260718090121.79D3A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Missing phy-mode property now unconditionally causes probe failu=
re, breaking old device trees.

Pre-existing issues:
- [High] The spinlock `port->lock` is acquired using `spin_lock()` in proce=
ss contexts without disabling softirqs, creating a deadlock risk if interru=
pted by a softirq calling `ndo_get_stats64`.
--

--- Patch [12]: [PATCH net-next v9 12/12] net: airoha: add phylink support =
---
commit bb8a7d4b36e6cc8dd02385bcf6f62f3da412aa5a
Author: Christian Marangi <ansuelsmth@gmail.com>

net: airoha: add phylink support

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 59001fd4b6f74..ed1ac032f3374 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1837,7 +1838,7 @@ static void airoha_update_hw_stats(struct airoha_gd=
m_dev *dev)
>  	struct airoha_gdm_port *port =3D dev->port;
>  	int i;
> =20
> -	spin_lock(&port->stats_lock);
> +	spin_lock(&port->lock);

[Severity: High]
This is a pre-existing issue, but using spin_lock() here without disabling
softirqs creates a deadlock risk.

This function is called from process context (like ethtool callbacks), but =
it
is also called by airoha_dev_get_stats64() which can run in softirq context.
If a softirq interrupts the process-context caller while it holds port->loc=
k,
the softirq handler will attempt to acquire the same lock and spin forever.

Should all process-context acquisitions of this lock be updated to use
spin_lock_bh() instead?

[ ... ]
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
> +	spin_lock(&port->lock);
> +
> +	/* Configure TX/RX frag based on speed */

[Severity: High]
This is a pre-existing issue with the locking design, but since
airoha_mac_link_up() is a new process-context caller, using spin_lock() here
introduces a new instance of the deadlock surface mentioned above against
softirq callers like airoha_dev_get_stats64().

Should this be changed to spin_lock_bh() as well?

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

[Severity: Medium]
Does this mandatory check break backwards compatibility with older device t=
rees?

If a device tree is missing the phy-mode property, this will now unconditio=
nally
fail the driver probe, whereas the previous driver version allowed successf=
ul
probe without it.

Is there a fallback mode we should apply here instead of returning the erro=
r?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D12

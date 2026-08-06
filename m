Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB468448399
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027123; cv=none; b=KzoTPViBP1PlkolnEpFF7tNRd1owAbl8+DgCq2q+NnE8TxFtXzJ16i/T85Eo0q/q7ZhqJw2MIqRpTrR3vCDdnW26QqKrYYxTHP0T95qPJoDmtVaaCaAOEg2dc2fpOFanIeqWBZyUwF9rOqJnbJCJUtoxKRxRx4r/2xMn4M1Yucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027123; c=relaxed/simple;
	bh=eRcDRCd04VweTPQBOPikn5XJ/oJyJpXMCJq6iYr7UHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqHgUFGgDbXlV6zLI8jPXg/X+VqD7ZpcAJxgy/29gzk2PdoFQExwZ6AusqIfof71lTEFvnslcv2PYItBSs3z0QodmyTc1u84i7Umi0yUwJ89zVggzYtAinHN/nDYJfXN40BaP36/hiCNUZ26t9YfV+VEpsW3MBGw/SUKlDQMuqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCwh2Azi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCwh2Azi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D871F00A3D;
	Thu,  6 Aug 2026 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027121;
	bh=Qon8zKcmDAnw6RWIR4/gwkDIt87hnHpXJIzkm9WMbGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HCwh2AzikDaftvZIFlG6GYcPZV557c/gMG1F4wDVwOmI+t00FQ3122/+2dV4i2CHz
	 mGcRSLzKQwve5A1JHdIVVdYmagDEsqry0nn0ZXMCOO27NBh8Y2PdF9Vid8t5NmIlhB
	 6EZfoeCLLWFRPFQ3Df0uZbsDUhSs8drlgxXyMKciEJPbCIhHzzqjvCK7wJjSaxQ9OE
	 5nANTbk7ezgVOvKVhS6H65849ZAR80kUg2LQUPa2rbVc/h4OmHHMX+5V0RPOCs3z07
	 nx56S8Z/4MFxmviB/nwBoVyTB05uwH0l1TqfuugmEsrXyspyBEeElsYm6AkFwCrvtF
	 0Nd+YjILPZHVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 6/9] net: dsa: lan9645x: add vlan support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-dsa_lan9645x_switch_driver_base-v11-6-007ebc983a0a@microchip.com>
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-6-007ebc983a0a@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:38:40 +0000
Message-Id: <20260806143841.38D871F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Code Fix needed in lan9645x_port_vlan_filtering to explicitly igno=
re the NPI port, preventing REW_TAG_CFG corruption.

Pre-existing issues:
- [High] The MAC table dump function `lan9645x_mact_dsa_dump` acquires a sl=
eepable mutex and performs sleep-polling within an atomic RCU read-side cri=
tical section.
--

--- Patch [6]: [PATCH net-next v11 6/9] net: dsa: lan9645x: add vlan suppor=
t ---
commit 7eb00c9a8e8dbdc6e13b0734d6fc7a8d54af0360
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Subject: net: dsa: lan9645x: add vlan support

This commit adds VLAN support for VLAN-aware and VLAN-unaware bridges.
VID 4095 is reserved for standalone ports and VID 0 is used for
VLAN-unaware bridge ports to isolate their FDB domains.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -576,11 +580,52 @@ static void lan9645x_port_bridge_leave(struct dsa_s=
witch *ds, int port,
[ ... ]
> +static int lan9645x_port_vlan_filtering(struct dsa_switch *ds, int port,
> +					bool enabled,
> +					struct netlink_ext_ack *extack)
> +{
> +	struct lan9645x *lan9645x =3D ds->priv;
> +	struct lan9645x_port *p;
> +
> +	p =3D lan9645x_to_port(lan9645x, port);
> +	p->vlan_aware =3D enabled;
> +	lan9645x_vlan_port_apply(p);

[Severity: High]
Does this code inadvertently apply standard VLAN configurations to the NPI
(CPU) port?

When the bridge's VLAN filtering state changes, the DSA core propagates the
change to all ports in the bridge tree, including the CPU port. Here,
lan9645x_port_vlan_filtering() unconditionally executes
lan9645x_vlan_port_apply() which proceeds to modify the egress tagging.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_vlan.c
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c
[ ... ]
> +static void
> +lan9645x_vlan_port_apply_egress(struct lan9645x_port *p,
> +				struct lan9645x_vlan_port_info *info)
> +{
[ ... ]
> +	lan_rmw(REW_TAG_CFG_TAG_TPID_CFG_SET(3) |
> +		REW_TAG_CFG_TAG_CFG_SET(tag_cfg),
> +		REW_TAG_CFG_TAG_TPID_CFG |
> +		REW_TAG_CFG_TAG_CFG,
> +		lan9645x, REW_TAG_CFG(p->chip_port));

[Severity: High]
Is it safe to rewrite the egress tag configuration for the NPI port here?

Writing the dynamically evaluated egress tag configuration to the
REW_TAG_CFG register erases the mandatory LAN9645X_TAG_DISABLED
configuration that is normally set during CPU port initialization.

If IFH extraction and packet rewriting conflict, a pushed VLAN tag could
overwrite the end of the extraction header with the top 4 bytes of the DMAC,
breaking CPU traffic. Should lan9645x_port_vlan_filtering() explicitly
ignore the NPI port?

[Severity: High]
This is a pre-existing issue, but does the MAC table dump function sleep
while holding rcu_read_lock()?

A user-space request to dump the Forwarding Database (e.g., via
bridge fdb show) invokes the netlink rtnl_fdb_dump() handler. This handler
takes rcu_read_lock() and iterates over devices, calling ndo_fdb_dump().
DSA passes this down to the driver's lan9645x_mact_dsa_dump().

Inside the RCU critical section, the driver acquires mact_lock (a sleepable
mutex) and uses lan9645x_mac_wait_for_completion() to poll the hardware,
which uses a regmap poll with a non-zero sleep interval:

drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c:lan9645x_mact_dsa_dump() {
	...
	mutex_lock(&lan9645x->mact_lock);
	...
	err =3D lan9645x_mac_wait_for_completion(lan9645x, &maca);
	...
}

Could this trigger a "scheduling while atomic" kernel panic or cause a
deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-dsa_lan964=
5x_switch_driver_base-v11-0-007ebc983a0a@microchip.com?part=3D6

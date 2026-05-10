Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD3175A95
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778404257; cv=none; b=h9tDNjLAV5piisZyl9I7n1OOWiYX4dKQTQLlff3yPBYvZQWvqj6j23xnqACOn8VkYuwdujSbMTZvD58vL5fKci57zyP0XdWP3aDaRRPkuVsWhdFiciZezqoWe2bzuw2IwSm+NjUumrHjSCTozpRSp145k/FvMPBn5PvpvB47rkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778404257; c=relaxed/simple;
	bh=nOFF+kpZcUWn02Sv0SI3cJKuG4v1OYTD8KOv/dD0zI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aRMLhRwCkEWw+r+fPxnwK+JjYdfUggk9P11hIe6gfOhCJlJtz85gv4HPNKqElHXACzOlu2B8knAijBfS2l2tyGC1hX+yxFamlmW39kuuFfZKyZ820BDr3PiHZQUCYcpaJKn15C8vLcZXLL/g2vebqix1lxZ2tyvREJd6pTox4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWxGOx77; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWxGOx77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5F8C2BCB8;
	Sun, 10 May 2026 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778404257;
	bh=nOFF+kpZcUWn02Sv0SI3cJKuG4v1OYTD8KOv/dD0zI4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BWxGOx77JpDMEiet1AD97jIZB2bnv00W9dYaXMRNzBzd9hqHlunubi46SbWlfBOtJ
	 3PZ21+Vm5ErBjvaPoYaprYH2EnON4qTm38UEsuj/acvw2miNFFqjMs/NyBbxFNerzj
	 vQfYsBZkatiXlf0GM+AFnYu+QTm9NfaU1UP5Hg8heWCEJxd/GwiPJIj5C/WJCJJEUv
	 roNTXAqNKRdeVelUwHgJTPUfvCna/6JLdM2zYWugTbuItPyVk5SSmaCpc9HRRTd+QJ
	 BAN+HUxo/WzJ5AFsV3ehOZvpnmn3SkbEXzngEQ3VvQ/qeyKr7b1vBD4V0CCRYxw6tL
	 Qy/pDlJ4pVC+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/4] net: dsa: hms: Add NXP i.MX RT1180 NETC
 switch driver
Reply-To: sashiko@lists.linux.dev
To: "Minghuan Lian" <minghuan.lian@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509090632.2959553-4-minghuan.lian@nxp.com>
References: <20260509090632.2959553-4-minghuan.lian@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 09:10:56 +0000
Message-Id: <20260510091057.5C5F8C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] Dereferencing `cpu_dp->user` on a CPU port causes a guaranteed NUL=
L pointer dereference crash during driver probe.
- [High] SPI transfer buffers are allocated on the stack, which violates DM=
A mapping rules and risks memory corruption.
- [High] Uninitialized kernel stack memory is leaked to the switch firmware=
 over the SPI bus.
- [High] Missing array bounds check for port index derived from Device Tree=
 allows out-of-bounds writes.
- [High] Hardware duplex configuration is never updated from the phylink ne=
gotiated state.
- [High] TPID VLAN filtering configuration is updated in software but never=
 applied to the hardware.
- [Medium] Deleted PVIDs are immediately re-applied to the hardware.
- [Medium] FDB dump prematurely aborts, hiding the last entry in the MAC ta=
ble.
- [Medium] FDB entries are reported to the bridge with inverted static/dyna=
mic status.
- [Medium] A pacing delay intended for firmware command ratelimiting is loc=
ated outside the mutex, failing to serialize concurrency.
- [Medium] SPI protocol structures use native host byte order instead of a =
fixed endianness.
- [Medium] The error return value of `hms_dsa_init()` is ignored, leading t=
o an incomplete switch configuration.
- [Low] Kconfig selects a non-existent symbol NET_DSA_TAG_8021Q.
- [Low] Left-shifting into the sign bit triggers Undefined Behavior.
--

commit bc52bd2232e9fe56601b95379d2d4e43ce454f07
Author: Minghuan Lian <minghuan.lian@nxp.com>
Subject: net: dsa: hms: Add NXP i.MX RT1180 NETC switch driver

This commit adds a DSA driver for the NXP i.MX RT1180 NETC Ethernet switch.
It registers the switch with DSA, configures ports, and provides basic
operations like phylink, MTU, and tag_8021q setup. The driver communicates
with the switch firmware using the HMS command interface over SPI.

> diff --git a/drivers/net/dsa/hms/Kconfig b/drivers/net/dsa/hms/Kconfig
> new file mode 100644
> index 0000000000000..4f209b4c64131
> --- /dev/null
> +++ b/drivers/net/dsa/hms/Kconfig
> @@ -0,0 +1,14 @@
[ ... ]
> +config NET_DSA_HMS_SWITCH
[ ... ]
> +	select NET_DSA_TAG_HMS
> +	select NET_DSA_TAG_8021Q

Does NET_DSA_TAG_8021Q exist in the kernel tree? The tag_8021q functionality
seems to be built automatically into dsa_core, so selecting a non-existent
symbol could cause Kconfig unmet dependency warnings.

> diff --git a/drivers/net/dsa/hms/hms_config.c b/drivers/net/dsa/hms/hms_c=
onfig.c
> new file mode 100644
> index 0000000000000..daddb4db3d294
> --- /dev/null
> +++ b/drivers/net/dsa/hms/hms_config.c
> @@ -0,0 +1,253 @@
[ ... ]
> +int hms_port_mtu_set(struct hms_private *priv, int port, int mtu)
> +{
> +	struct hms_cmd_port_mtu cmd;
> +
> +	cmd.port =3D port;
> +	cmd.mtu =3D mtu;
> +
> +	return hms_xfer_set_cmd(priv, HMS_CMD_PORT_MTU_SET,
> +				&cmd, sizeof(cmd));
> +}

Does this code leak uninitialized kernel stack memory to the firmware over =
SPI?
The cmd structure is allocated on the stack, and some fields are set, but
padding and reserved arrays are not initialized before passing the entire
structure to hms_xfer_set_cmd.

> diff --git a/drivers/net/dsa/hms/hms_config.h b/drivers/net/dsa/hms/hms_c=
onfig.h
> new file mode 100644
> index 0000000000000..a54adefe794d6
> --- /dev/null
> +++ b/drivers/net/dsa/hms/hms_config.h
> @@ -0,0 +1,259 @@
[ ... ]
> +struct hms_cmd_port_mtu {
> +	u8 port;
> +	u8 reserved;
> +	u16 mtu;
> +};

Should these hardware command structures use fixed endianness types like
__be16 or __le16 instead of native u16? Since these structures are sent
directly over SPI, a big-endian host might swap the bytes and send a
corrupted configuration to the firmware.

> diff --git a/drivers/net/dsa/hms/hms_main.c b/drivers/net/dsa/hms/hms_mai=
n.c
> new file mode 100644
> index 0000000000000..b7f7c3a7d3667
> --- /dev/null
> +++ b/drivers/net/dsa/hms/hms_main.c
> @@ -0,0 +1,934 @@
[ ... ]
> +static int hms_fdb_add(struct dsa_switch *ds, int port,
> +		       const unsigned char *addr, u16 vid,
> +		       struct dsa_db db)
> +{
[ ... ]
> +	/* Allow enough time between consecutive calls for adding FDB entry */
> +	usleep_range(HMS_SPI_MSG_RESPONSE_TIME,
> +		     HMS_SPI_MSG_RESPONSE_TIME * 10);
> +
> +	mutex_lock(&priv->fdb_lock);
> +	rc =3D hms_fdb_entry_add(priv, addr, vid, port);
> +	mutex_unlock(&priv->fdb_lock);
> +
> +	return rc;
> +}

Will this delay effectively pace the firmware commands? Since usleep_range
is called before acquiring priv->fdb_lock, multiple threads could sleep
concurrently and then acquire the lock in rapid succession, bypassing the
intended rate limit.

> +static int hms_fdb_dump(struct dsa_switch *ds, int port,
> +			dsa_fdb_dump_cb_t *cb, void *data)
> +{
[ ... ]
> +	while (1) {
[ ... ]
> +		rc =3D hms_fdb_entry_get(priv, &fdb, entry_id, &next_id);
[ ... ]
> +		if (next_id =3D=3D 0) /* This entry is empty */
> +			return 0;
> +
[ ... ]
> +		if (fdb.port_map & BIT(port)) {
[ ... ]
> +			rc =3D cb(fdb.mac_addr, fdb.vid, fdb.dynamic, data);

Could this return statement prematurely abort the dump, skipping the last v=
alid
entry? If the firmware populates fdb with the last valid MAC table entry and
sets next_id =3D=3D 0 to indicate there are no more entries, exiting here w=
ould
prevent the callback from running for that final entry.

Also, is the static/dynamic status inverted here? The third argument to the
callback is bool is_static, but the code passes fdb.dynamic instead of
!fdb.dynamic.

> +static int hms_parse_ports_node(struct hms_private *priv,
> +				struct device_node *ports_node)
> +{
[ ... ]
> +	for_each_available_child_of_node(ports_node, child) {
[ ... ]
> +		u32 index;
[ ... ]
> +		/* Get switch port number from DT */
> +		if (of_property_read_u32(child, "reg", &index) < 0) {
[ ... ]
> +		priv->phy_mode[index] =3D phy_mode;
> +	}

Does this code write out of bounds if the device tree provides an invalid p=
ort
number? The index is read from the device tree and used to index into
priv->phy_mode and priv->fixed_link without verifying that it is less than
HMS_MAX_NUM_PORTS.

> +static void hms_mac_link_up(struct phylink_config *config,
[ ... ]
> +			    int speed, int duplex,
[ ... ]
> +	mac->speed =3D speed;
> +	mac->egress =3D true;
> +
> +	hms_port_phylink_mode_set(priv, mac);

Are we missing an update to the MAC duplex state? The phylink callback prov=
ides
the negotiated duplex value, but it is not assigned to mac->duplex before
hms_port_phylink_mode_set is called, which might configure the hardware
with a stale or uninitialized setting.

> +int hms_vlan_filtering(struct dsa_switch *ds, int port, bool enabled,
> +		       struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	if (enabled) {
> +		/* Enable VLAN filtering. */
> +		config->tpid  =3D ETH_P_8021Q;
> +		config->tpid2 =3D ETH_P_8021AD;
> +	} else {
> +		/* Disable VLAN filtering. */
> +		config->tpid  =3D HMS_META_ETYPE;
> +		config->tpid2 =3D HMS_META_ETYPE;
> +	}
> +
> +	for (port =3D 0; port < ds->num_ports; port++) {
[ ... ]
> +		rc =3D hms_commit_pvid(ds, port);

Is this TPID configuration ever sent to the switch hardware? The struct fie=
lds
are updated, but it doesn't look like any SPI command is dispatched to apply
the new TPID values to the hardware registers, meaning the VLAN filtering
toggle might not actually take effect.

> +static int hms_bridge_vlan_del(struct dsa_switch *ds, int port,
> +			       const struct switchdev_obj_port_vlan *vlan)
> +{
[ ... ]
> +	rc =3D hms_vlan_entry_del(priv, vlan->vid, port);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * In case the pvid was deleted, make sure that untagged packets will
> +	 * be dropped.
> +	 */
> +	return hms_commit_pvid(ds, port);
> +}

Does this unintentionally re-apply a deleted PVID to the hardware? When a V=
LAN
is deleted, priv->bridge_pvid[port] is not cleared if it matched vlan->vid.
When hms_commit_pvid is subsequently called, it reads the still-cached PVID
and commands the hardware to use it again.

> +static int hms_dsa_init(struct hms_private *priv)
> +{
[ ... ]
> +	if (!cpu_dp) {
[ ... ]
> +	if (!is_zero_ether_addr(cpu_dp->mac))
> +		mac =3D cpu_dp->mac;
> +	else
> +		mac =3D cpu_dp->user->dev_addr;

Can this cause a null pointer dereference? For a CPU port, dsa_port->user is
null, since the master interface is tracked via cpu_dp->conduit instead.
Dereferencing cpu_dp->user->dev_addr during probe would trigger a panic.

> +static int hms_setup(struct dsa_switch *ds)
> +{
[ ... ]
> +	hms_mac_init(priv);
> +	hms_dsa_init(priv);

Is it safe to ignore the return value of hms_dsa_init? If the initialization
of the CPU port fails and returns an error, the driver proceeds to register=
 the
switch anyway, which could result in a broken data path.

> diff --git a/drivers/net/dsa/hms/hms_spi.c b/drivers/net/dsa/hms/hms_spi.c
> new file mode 100644
> index 0000000000000..22e4393554738
> --- /dev/null
> +++ b/drivers/net/dsa/hms/hms_spi.c
> @@ -0,0 +1,116 @@
[ ... ]
> +int hms_xfer_cmd(struct hms_private *priv,
> +		 enum hms_spi_rw_mode rw, enum hms_cmd cmd,
> +		 void *param, size_t param_len,
> +		 void *resp, size_t resp_len,
> +		 struct ptp_system_timestamp *ptp_sts)
> +{
> +	struct hms_cmd_hdr hdr =3D {0};
[ ... ]
> +	hdr.cmd =3D (rw << HMS_CMD_DIR_SHIFT) |
> +		  ((resp_len / HMS_SPI_MSG_WORD_BYTES) << HMS_CMD_LEN_SHIFT) |
> +		  cmd;

Could this trigger undefined behavior? The rw variable is an enum (signed
integer), and HMS_CMD_DIR_SHIFT is 31. If rw is SPI_WRITE (1), shifting
it into the sign bit overflows the 32-bit signed integer. Casting rw to u32
would avoid this.

> +	memset(&hdr_xfer, 0, sizeof(hdr_xfer));
> +	hdr_xfer.tx_buf =3D &hdr;
> +	hdr_xfer.len =3D HMS_SPI_MSG_HEADER_SIZE;
[ ... ]
> +	if (rw =3D=3D SPI_READ)
> +		resp_xfer.rx_buf =3D resp;
> +	else
> +		resp_xfer.tx_buf =3D resp;
> +	resp_xfer.len =3D resp_len;
[ ... ]
> +	rc =3D spi_sync_transfer(spi, &resp_xfer, 1);

Are we passing stack memory to the SPI controller for DMA? Both hdr and
several resp buffers provided by callers are allocated on the local stack.
Using stack memory for DMA is generally unsafe in the kernel, especially wi=
th
CONFIG_VMAP_STACK, as it might not be physically contiguous or cache-aligne=
d,
leading to memory corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509090632.2959=
553-1-minghuan.lian@nxp.com?part=3D3

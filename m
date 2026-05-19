Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8534D8D9D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193647; cv=none; b=e7jr8KkBTrCYJyEtxWbUhRpiDir/YXFq+S/pQjt/3tBnzvepyNZuBjstBlxxtwZB0r/hb03PLW6c6MBKf+gE2mCIPrVoHG0jpNtu8CqbIcsVxeXyh/vZXvl5ktWk8Tg0c8FRihoCSwHh29SxacMUQZskH7uEL7HMJpclxgg4Q5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193647; c=relaxed/simple;
	bh=CMWd55Hvg7GmggU/uNdpCxjfA4oUHF7FPS9Myn1tXss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5PlxzbsgLRzumFNxDjkTY3R5wqFRBINnzC3AWC0OVmalNBIrIyuiEGeyDajj1t4CaG646C1ySudxreTu7OSAeaT4kBKhBF6/ih1N4Xf5WAecjUlNsZQmiXNNHq8qLgjFyqW7ksxyWBjt0zvi+5NV9syWqOxD30Hmcyoc5uxVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bC//DXOa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bC//DXOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0831C2BCB3;
	Tue, 19 May 2026 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193647;
	bh=CMWd55Hvg7GmggU/uNdpCxjfA4oUHF7FPS9Myn1tXss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bC//DXOamACvNX8OG8SUhqkO8qdP4FocGs/PpxnV5wLtIWX8QLct/zR9apFeqEvwC
	 m8PH2v6OyWPTzw3ACYu0lh3LQc8iODBUScKexLUTZqv8IQJ6N7HsLL763fOezfKU1J
	 XehLdWSJlt11sFqmgcp64Iyo7f0QbtNWkQnoggnxfYmCymsjC3bKTHBkJnalzx+q0O
	 wHv4nrKWHYjE5cM88r6Ckzb8CxYs1HytVdcO+Sqs9w9DWKeUIhIvgouaFK+0lEXwwR
	 Iu9/QrAYUoL4tTZWB+exBsprdGL+jlhTukeZz/9TkcNuHr6T9jYZJnld3paEXK2G/B
	 XVVEGRc3HhOrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 8/9] net: dsa: lan9645x: add mdb management
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518-dsa_lan9645x_switch_driver_base-v5-8-968fbf34ffa3@microchip.com>
References: <20260518-dsa_lan9645x_switch_driver_base-v5-8-968fbf34ffa3@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:27:26 +0000
Message-Id: <20260519122726.D0831C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Deleting a port from an L2 MDB entry can fail with -ENOSPC, leavin=
g the port permanently active in the hardware multicast group.
- [High] IP multicast frames may be duplicated to the CPU port because the =
CPU port is specified in both the MAC inline portmask and the `MAC_CPU_COPY=
` flag.
--

commit 12dd40a6c7c29e212ec6866149d379306e63d403
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
net: dsa: lan9645x: add mdb management

Add support for dsa mdb callbacks to handle L2 multicast and IP multicast,=
=20
using PGID indices for L2 and inline port masks for IP multicast.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers/=
net/dsa/microchip/lan9645x/lan9645x_mdb.c
> new file mode 100644
> index 0000000000000..0ba3e0974dc08
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
[ ... ]
> +static int lan9645x_mdb_update_dest(struct lan9645x *lan9645x,
> +				    struct lan9645x_mdb_entry *mdb_entry,
> +				    enum macaccess_entry_type type,
> +				    struct lan9645x_pgid_entry *new_pgid,
> +				    u16 new_ports)
> +{
> +	struct lan9645x_pgid_entry *old_pgid;
> +	unsigned char mac[ETH_ALEN];
> +	int err, pgid_index;
> +	bool cpu_copy;
> +
> +	old_pgid =3D mdb_entry->pgid;
> +	lan9645x_mdb_encode_mac(mac, mdb_entry->mac, new_ports, type);
> +	cpu_copy =3D !!(new_ports & BIT(CPU_PORT));

Can IP multicast frames be duplicated to the CPU port when both the
destination mask and the explicit CPU extraction queue are configured?

When new_ports includes the CPU port, it appears to be both encoded into
the MAC address bytes via lan9645x_mdb_encode_mac() and explicitly passed
as the cpu_copy flag to lan9645x_mact_learn_cpu_copy().

Should the CPU_PORT bit be explicitly stripped from the portmask before
encoding it into the MAC address, similar to how it is stripped for L2
multicast PGIDs?

[ ... ]
> +static int __lan9645x_mdb_del(struct lan9645x *lan9645x, int chip_port,
> +			      const unsigned char addr[ETH_ALEN], u16 vid,
> +			      enum macaccess_entry_type type)
> +{
> +	struct lan9645x_pgid_entry *new_pgid;
> +	struct lan9645x_mdb_entry *mdb_entry;
> +	u16 new_ports;
> +	int err;
> +
> +	mdb_entry =3D lan9645x_mdb_entry_lookup(lan9645x, addr, vid);
> +	if (!mdb_entry)
> +		return -ENOENT;
> +
> +	if (!(mdb_entry->ports & BIT(chip_port)))
> +		return 0;
> +
> +	new_ports =3D mdb_entry->ports & ~BIT(chip_port);
> +
> +	if (!new_ports) {
[ ... ]
> +		lan9645x_mdb_entry_dealloc(lan9645x, mdb_entry);
> +		return 0;
> +	}
> +
> +	/* Update PGID ptr for non-IP entries (L2 multicast) */
> +	new_pgid =3D lan9645x_mdb_pgid_entry_get(lan9645x, new_ports, type);
> +	if (IS_ERR(new_pgid))
> +		/* Continue forwarding to old port group. */
> +		return PTR_ERR(new_pgid);

Will an out-of-resources condition here cause the port to remain permanently
active in the hardware multicast group?

If lan9645x_mdb_pgid_entry_get() returns -ENOSPC because all hardware PGIDs
are in use, the deletion aborts and the hardware is not updated. Because the
bridge network stack ignores errors from port_mdb_del, the software state
would diverge from the hardware state.

Would it be possible to reuse and update the existing PGID in-place if its
reference count is exactly 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-dsa_lan964=
5x_switch_driver_base-v5-0-968fbf34ffa3@microchip.com?part=3D8

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C14E2DE6E3
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102216; cv=none; b=eyekidLhDc1ZplYQ3n5G75ONA8zfd2a85AESD9qDttyAPh4Cn+vzhhe1qBVeQ3VFjH2VgBK79TiLzpDKuv3zaYlMpuQQB0J729V6F9J4vww8SI36RRXYpWju8SH787slLU0A6IDOcKdZUT9YKDa1Wye/cwnUguzKdnJWYJlSDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102216; c=relaxed/simple;
	bh=aqr1xIBt1bK8Eq7ElbKKEla52efPBvr2MCpYaJDl8NM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JuRmd5sw9SfwRDAfqPq6M7I208NPG29+m/xBLfgWhcBQWcV97L86Nl0GwDEDoTiidFvcWkOM85B62cCrG0/XrrcXfRVAapiXSAg2kEXDPhSBxkNn9cB5OpoLHKhPcyxy43CY3KdiBfFlpzHAU6c/IwW2rD+0BOEf4yishlJEH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHQ7QO84; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHQ7QO84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1208D1F00893;
	Sat, 30 May 2026 00:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102215;
	bh=Mbsb//Hs5FBdkhXosASANV7Yi4cOrn5fbpyH5ANoVYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHQ7QO84DTKKTKfGH2keYfI8CSH3hRhE5dKbIN5vLxUelbnOf0MXwIuKRWJ8W4BtT
	 hbIpw+oDBd25BxDzYvZOh40fdbkHorMzvnN05nChKk/b1jWs6JeNiZRrE9xOuT+elG
	 dcLd7tYJKEkJhEMshPAlH1QveduK5REGaA7s3cpDqel3uI3iIsjZQ+6rGk6JmImy3e
	 QFB4hwG+x37Et8QEpp3RAZhynAY4SrH/iIf2WqgA9AYla5RFt8O43j15A2UCsTP0v9
	 sTZCR1tNxT4nvONVj/m38dVR/j0mPCyZSafU1d3DAuZV+g7+yLpRNhB5mVclQIpXjG
	 BuPkOiSkxO+EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 7/9] net: dsa: lan9645x: add mac table
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-7-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-7-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:14 +0000
Message-Id: <20260530005015.1208D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] L2 multicast FDB entries are incorrectly mapped to a single port i=
nstead of a PGID, overwriting previous entries.
- [Medium] Static FDB entries are excluded from `lan9645x_mact_dsa_dump`, m=
aking them invisible on standalone ports.
--

commit 27e48dc68296c269fcc025aa1f9ae3a7d03b1da7
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add mac table integration

This commit adds MAC table support and DSA FDB callback integration for the
lan9645x switch. It introduces functions for MAC table manipulation, aging,
and dumping entries.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c b/drivers/=
net/dsa/microchip/lan9645x/lan9645x_mac.c
> index 0000000000000..1079e49f62718
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c
[ ... ]
> +int lan9645x_mact_dsa_dump(struct lan9645x *lan9645x, int port,
> +			   dsa_fdb_dump_cb_t *cb, void *data)
> +{
[ ... ]
> +		/* Only dynamic entries are surfaced through the user port dump.
> +		 * ENTRYTYPE_LOCKED entries are already reported by the bridge
> +		 * master's ndo_fdb_dump as NTF_MASTER, so we avoid duplicating
> +		 * them as NTF_SELF.
> +		 * Entries toward the host (NTF_SELF) have DEST_IDX =3D=3D CPU_PORT
> +		 * and are filtered out by the DEST_IDX check.
> +		 */
> +		if (ANA_MACACCESS_DEST_IDX_GET(maca) =3D=3D port &&
> +		    type =3D=3D ENTRYTYPE_NORMAL) {

[Severity: Medium]
Will this filter out static FDB entries on standalone ports?

While the comment notes that locked entries are reported by the bridge
master, standalone switch ports not enslaved to a bridge won't have a softw=
are
FDB to report them. If a user adds a static FDB entry to a standalone port,
it appears it would be programmed as ENTRYTYPE_LOCKED but completely filter=
ed
out here, making it invisible to user-space tools like `bridge fdb show`.

> +			addr =3D (u64)ANA_MACHDATA_MACHDATA_GET(mach) << 32 |
> +			       macl;
[ ... ]
> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> index eb13dfadbd3cf..a76e61fb37096 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> +static int lan9645x_fdb_add(struct dsa_switch *ds, int port,
> +			    const unsigned char *addr, u16 vid,
> +			    struct dsa_db db)
> +{
> +	struct net_device *br =3D lan9645x_db2bridge(db);
> +	struct dsa_port *dp =3D dsa_to_port(ds, port);
> +	struct lan9645x *lan9645x =3D ds->priv;
> +	int dest;
> +
> +	if (IS_ERR(br))
> +		return PTR_ERR(br);
> +
> +	if (dsa_port_is_cpu(dp) && !br &&
> +	    dsa_fdb_present_in_other_db(ds, port, addr, vid, db))
> +		return 0;
> +
> +	if (!vid)
> +		vid =3D lan9645x_vlan_unaware_pvid(!!br);
> +
> +	dest =3D dsa_port_is_cpu(dp) ? PGID_CPU : port;
> +
> +	return lan9645x_mact_learn(lan9645x, dest, addr, vid, ENTRYTYPE_LOCKED);

[Severity: High]
Does this code handle L2 multicast FDB entries correctly?

Without a check for is_multicast_ether_addr(addr), L2 multicast entries are
mapped to a single port instead of a PGID. Because the hardware MAC table
is keyed by (MAC, VID), adding the multicast address to a second port via
the software bridge would overwrite the destination index of the first entr=
y.
This would cause the hardware to only forward multicast traffic to the last
configured port, creating a mismatch with the software bridge FDB.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D7

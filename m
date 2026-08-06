Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0913957E
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027123; cv=none; b=gyV5ovyjU5eOB1V1klhaLirWl9G2vnoPX48bqGl4J0SKZI1zTmxXMRf7UMCNfQ4eIjXbTinf63miz+pItuOmJHGQVoEREkz/Z5L4A09RHZA2jXdhKf2f2yDTmM4v/KC+S/Vg9U8wweDbjsg8wNdNwWO3/Gf1VWkyxwHZrBpGuYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027123; c=relaxed/simple;
	bh=3YtPqnRidCFsUt84NYMqlOsoawkh50P+QZ3rVrDJXfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ufmudA+151CDFFFYzLN2nDGub6RnfnLtHtQpWb8npVSbD23AkGpUloJtWX3LOm+6pzpPO/MejNyUSwch7Ov4+yKJndSo/2aD1OI9fvJjGpjXghLYgptuXwGK8SAXki4noNIwi+BCD6aOAitFJTZ2SDZKKS6XKPov+UshToDhhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WW7nvC/x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WW7nvC/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC321F00A3E;
	Thu,  6 Aug 2026 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027122;
	bh=6mZiAukBjNX7anUhBVDoDdFmZ+q7k0AP0QH2lGb2M7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WW7nvC/xMACxcir0kNgd+pKEhWhqs7v2FnzfwmSy+33OaOoO9+6upO7TcIWYxpjAO
	 pIPtMQJok715BrDtoIHvPKciEl2sKrfpCcHku7I4CskRBLe27GCzH3Ze/3U16+jGMz
	 51bJVFpa1rKicVK0sXp7BZZgm7DmwD0Yv56kGa3JuNyLJWidx7FH/CZbtZ9CvI8sXF
	 7WRAOCDmpDiShHZsbhpo+zrQ9jn5z8nlAHQCFLWRpATwQzEg9DtsnH66T0hNwu8xYP
	 nlD1lWP5Wo2mPltS1twboRYZ9k7wqyfyrDT41B+qJlXrqWz2FJ2aJHycFHaxy//JHj
	 ls4pQgM8XnJkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 8/9] net: dsa: lan9645x: add mdb management
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-dsa_lan9645x_switch_driver_base-v11-8-007ebc983a0a@microchip.com>
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-8-007ebc983a0a@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:38:41 +0000
Message-Id: <20260806143842.3AC321F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Duplicate CPU packet delivery on IP multicast MDB matches
- [Low] Inverted teardown sequence between MAC and MDB initialization
--

--- Patch [8]: [PATCH net-next v11 8/9] net: dsa: lan9645x: add mdb managem=
ent ---
commit c8677da78fd630673d16e31ac732c8854e853dbe
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add mdb management

Add support for dsa mdb callbacks. L2 multicast and IP multicast is
handled differently. IP multicast stores the port group mask inline in
the mac table. L2 multicast points to a PGID index, which encodes the
port group mask.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> index af158d4461aee..fc604edb309b9 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> @@ -70,6 +70,7 @@ static void lan9645x_teardown(struct dsa_switch *ds)
>  	destroy_workqueue(lan9645x->owq);
>  	lan9645x_npi_port_deinit(lan9645x, lan9645x->npi);
>  	lan9645x_mac_deinit(lan9645x);
> +	lan9645x_mdb_deinit(lan9645x);

[Severity: Low]
In lan9645x_setup(), lan9645x_mac_init() is called before lan9645x_mdb_init=
().
However, lan9645x_teardown() and the err_mac path destroy these in the forw=
ard
order (lan9645x_mac_deinit() followed by lan9645x_mdb_deinit()).

Since lan9645x_mac_deinit() destroys mact_lock, could calling it before
lan9645x_mdb_deinit() cause a use-after-destroy if MDB cleanup ever needs to
take mact_lock?

[ ... ]

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers/=
net/dsa/microchip/lan9645x/lan9645x_mdb.c
> new file mode 100644
> index 0000000000000..ea37bb660273c
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
[ ... ]
> +static int lan9645x_mdb_update_dest(struct lan9645x *lan9645x,
> +				    struct lan9645x_mdb_entry *mdb_entry,
> +				    enum macaccess_entry_type type,
> +				    struct lan9645x_pgid_entry *new_pgid,
> +				    u16 new_ports)
> +{
> +	unsigned char mac[ETH_ALEN] __aligned(2);
> +	struct lan9645x_pgid_entry *old_pgid;
> +	int err, pgid_index;
> +	bool cpu_copy;
> +
> +	old_pgid =3D mdb_entry->pgid;
> +	lan9645x_mdb_encode_mac(mac, mdb_entry->mac, new_ports, type);
> +	cpu_copy =3D !!(new_ports & BIT(lan9645x->num_phys_ports));

[Severity: Medium]
For IP multicast entries, the port mask is stored inline in the high bytes =
of
the MAC address via lan9645x_mdb_encode_mac().

Because new_ports includes the CPU port bit, the hardware will forward the
packet to the CPU port according to the inline mask. The code also sets the
MAC_CPU_COPY bit via cpu_copy.

If the hardware acts on both the inline port mask and the MAC_CPU_COPY bit,
will this result in duplicate packets being delivered to the CPU?

Should the CPU port bit be stripped from the new_ports mask before encoding=
 it
into the MAC address, similarly to how it is stripped from L2 multicast PGID
entries in lan9645x_mdb_pgid_entry_get()?

> +	pgid_index =3D PGID_INDEX(new_pgid);
> +
> +	/* For IP multicast, the hardware lookup uses the DMAC
> +	 * (01:00:5E:.. / 33:33:..) as the (mac, vid) key, not the encoded mac.
> +	 * Therefore, this CMD_LEARN will atomically rewrite the existing
> +	 * hardware entry. We intentionally do not do a forget before learn
> +	 * sequence, as that would not be atomic, and leave a forwarding gap.
> +	 */
> +	err =3D lan9645x_mact_learn_cpu_copy(lan9645x, pgid_index, mac,
> +					   mdb_entry->vid, type, cpu_copy);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-dsa_lan964=
5x_switch_driver_base-v11-0-007ebc983a0a@microchip.com?part=3D8

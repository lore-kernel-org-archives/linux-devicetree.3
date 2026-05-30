Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D372DCF61
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102214; cv=none; b=Vu3qruKk0+gc8fBkoj+zBgBtbLNexjcogkV62h1pimWOfXYMmZxAr6GEPqXc4ecOd5kAMS436qXFpOJ8yJB8h/iXqaxgRyzk2H6ihSCu3+ocBYma++4yxyzGPKMQ+CxkacdjXy9lqHAD0VepSU4wjFBiy5YBw7qdYNW3zz5mabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102214; c=relaxed/simple;
	bh=FuWgd26lXyp3OMibhPJMZ5pN1pW4WakQPH9VE95NJuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ocGTWGhDzsRuZwENengbYIkP6Bzq/mrCVUeSeZXylZ0ptXmlldqtLbxhnY35DoVi3r1Dh912nlcyGHRfRfHKhbwcFkj3VLdRJNPJrHdUZytXwZRLJDTbPelaL/indxHILvJzgqx3QpPHWF6lB5Szc1cnQeEI2yxjwvwRQQ4miyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1qdeJSe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1qdeJSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373D51F00893;
	Sat, 30 May 2026 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102212;
	bh=PzrmKSBxNh7Wv/imvKh7FxNAQNlFuBn7DR5qJF2DQK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T1qdeJSeoYc54MEgua+HyepKiCjZp7pBZgDJtoUJmkz0EH6qlEHOULziQNKnw1I8O
	 c3k1rPeiptCUM9Vk8E4X6iRFJEyflW+b3FvLIdxuWiZ2MHXzhp+FEuUTByA5UgxqFV
	 fspPT1T0J8+Xj46R8dnu0fE3uMMlNjBWR07RMH7olrEmdKrvU4ayGZvXkSNRUxpsw2
	 1bsSOqqhHJi/n70kL9hdadlZywDOaF0mhR/6GBGAtZI14nYbKPktjrcnBsoKeYDQod
	 z7pYzSMLWt+qKdZ7MEIflJGRWsAZs4gSuW5yuMw7cxfnkKsRVCu94hRLC8r7xru4XB
	 RgLuKs42SGHoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 1/9] net: dsa: add tag driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-1-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-1-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:11 +0000
Message-Id: <20260530005012.373D51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver fails to handle hardware-accelerated VLAN tags on trans=
mit, leading to dropped VLAN tags.
- [High] The driver ignores the return values of bridge VLAN functions, lea=
ding to the use of uninitialized stack variables.
- [High] The tag driver leaks the socket buffer (`skb`) when frame padding =
fails.
--

commit 2c0a796d85ea905a1a209fed6a3f2589d5f8409a
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: add tag driver for LAN9645X

Add tag driver for LAN9645x using a front port as CPU port. This mode
is called an NPI port in the datasheet.

> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
> new file mode 100644
> index 0000000000000..0b639228215e3
> --- /dev/null
> +++ b/net/dsa/tag_lan9645x.c

[ ... ]

> +static void lan9645x_xmit_get_vlan_info(struct sk_buff *skb,
> +					struct net_device *br,
> +					u32 *vlan_tci, u32 *tag_type)
> +{
> +	struct vlan_ethhdr *hdr;
> +	u16 proto, tci;
> +
> +	if (!br || !br_vlan_enabled(br)) {
> +		*vlan_tci =3D 0;
> +		*tag_type =3D LAN9645X_IFH_TAG_TYPE_C;
> +		return;
> +	}
> +
> +	hdr =3D (struct vlan_ethhdr *)skb_mac_header(skb);
> +	br_vlan_get_proto(br, &proto);
> +
> +	if (skb_headlen(skb) >=3D VLAN_ETH_HLEN &&
> +	    ntohs(hdr->h_vlan_proto) =3D=3D proto) {
> +		vlan_remove_tag(skb, &tci);
> +		*vlan_tci =3D tci;

[Severity: High]
Does this code handle hardware-accelerated VLAN tags on transmit?

If the networking stack passes the VLAN tag out-of-band via skb->vlan_tci,
the payload ethertype will be the inner protocol (e.g., IPv4) and the check
above evaluates to false. This ignores the intended VLAN tag.

Could this be changed to use skb_vlan_tag_present(skb) and
skb_vlan_tag_get(skb)?

> +	} else {
> +		rcu_read_lock();
> +		br_vlan_get_pvid_rcu(br, &tci);

[Severity: High]
Does this ignore the return value of br_vlan_get_pvid_rcu()?

If the port has no default PVID configured, it can return an error code,
leaving tci uninitialized. The uninitialized tci is then used to populate
the hardware frame header, potentially injecting stack garbage into the
packet's VLAN TCI.

> +		rcu_read_unlock();
> +		*vlan_tci =3D tci;
> +	}
> +
> +	*tag_type =3D (proto !=3D ETH_P_8021Q) ? LAN9645X_IFH_TAG_TYPE_S :
> +					     LAN9645X_IFH_TAG_TYPE_C;
> +}
> +
> +static struct sk_buff *lan9645x_xmit(struct sk_buff *skb,
> +				     struct net_device *ndev)
> +{
> +	struct dsa_port *dp =3D dsa_user_to_port(ndev);
> +	struct dsa_switch *ds =3D dp->ds;
> +	u32 cpu_port =3D ds->num_ports;
> +	u32 vlan_tci, tag_type;
> +	u32 qos_class;
> +	void *ifh;
> +
> +	lan9645x_xmit_get_vlan_info(skb, dsa_port_bridge_dev_get(dp), &vlan_tci,
> +				    &tag_type);
> +
> +	/* We need to make sure frame has the proper size after IFH is stripped
> +	 * by hw.
> +	 */
> +	if (__skb_put_padto(skb, ETH_ZLEN, false))
> +		return NULL;

[Severity: High]
Will this leak the socket buffer when padding fails?

__skb_put_padto() is called with free_on_error set to false. If padding
fails, this returns NULL. The DSA core transmit routine assumes a NULL retu=
rn
from a tagger's transmit function means the tagger has freed or consumed
the skb, so the core won't free it. This permanently leaks the skb.

Should this use true for free_on_error instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D1

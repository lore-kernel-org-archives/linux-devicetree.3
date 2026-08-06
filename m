Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE013957E
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027117; cv=none; b=nm1QmUwWOb6utrmgbaJA/blojtkCH5tkjCK4V8/l0hcbhuCBNz3ex/x98TcjqQEQBX948j1Cz1zWC0VcGRssxIMac3UOY83z0HmRkYdfkcZJDOmwS0AnNFWjHCXkyFPi4SIUMTi3xuUwYqfENc+DPrazYE9KlazFXsQZ7aOcxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027117; c=relaxed/simple;
	bh=PNO3NC+bc3FY8EcysDClYNcHuVAfBXY9DK9gFr6lCFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EYEuST0eC0g0jkSdpAHqiejXNGHo3aciPDZu5tByn0KK3TITXojns+M2VjYIc9VdkKpy+yEPYNpx1Tz2U1AjTuKs3ez3g/a8+L52gjio+s9lkYMX0AVCTTMdr+G20Ox8FbBp4hnnMW4cviEYwQNboJQqgpIvX3OG6hx1B5TlsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaB3G2Qm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaB3G2Qm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A7E1F000E9;
	Thu,  6 Aug 2026 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027115;
	bh=Qc8TBmyWtkdurlD0GvI8ut6mseRaTlKBUjaISbRcX/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aaB3G2QmGForma65RTCL3WgY8Y8EIL9RKwL1ncbgX4PYSMWKZWdv24iEUeEF5R5mo
	 sW/po1p+4xY2S0nTy1tdBzztGgtXbCGgQEwZrOq0cmc70SbpE7iRlGifTLVHYH95sN
	 PUqXcIzXurT+DqFMShV2sGsUPSXfjMEEfCt33RyM2Z2PDaBibDVc404Bzn+Xhl9Jkc
	 vXg6Y1Z5Qc7OiUWVWTaNLj67HUtU+y6DduVDYbBjb51nbD2egs2Q8NvQXwwTiZzlCZ
	 qMlzN6CLI/ktf391gmKTmj2hLR/ovimV45YQRBzVicweHGF2G1CN9gcMI94OVojlUz
	 Tp7GNq1KUTE1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 1/9] net: dsa: add tag driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-dsa_lan9645x_switch_driver_base-v11-1-007ebc983a0a@microchip.com>
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-1-007ebc983a0a@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:38:34 +0000
Message-Id: <20260806143835.53A7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The tag driver drops hardware-accelerated VLAN tags on transmit, l=
eading to switch misclassification and double tagging.
--

--- Patch [1]: [PATCH net-next v11 1/9] net: dsa: add tag driver for LAN964=
5X ---
commit 97f24952991b201e3d0f1948d98e9534914b9db3
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: add tag driver for LAN9645X

This commit introduces a new DSA tag driver for the LAN9645X switch family,
using an NPI port for CPU connection. It supports prepending a 28-byte
internal frame header (IFH) on injection and handling a long prefix on
extraction.

> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
> new file mode 100644
> index 0000000000000..6a33216c7792f
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
> +	} else {
> +		rcu_read_lock();
> +		br_vlan_get_pvid_rcu(br, &tci);
> +		rcu_read_unlock();
> +		*vlan_tci =3D tci;
> +	}

[Severity: High]
Does this code drop hardware-accelerated VLAN tags on transmit?

When the network stack transmits a frame through the DSA user port with a
hardware-accelerated VLAN tag, the tag is stored out-of-band in skb->vlan_t=
ci.

By only checking the inline Ethernet header, ntohs(hdr->h_vlan_proto) will
evaluate to the inner network protocol (like IPv4) instead of ETH_P_8021Q.
This causes the check to fail and fall back to using the bridge PVID instead
of extracting the existing out-of-band VLAN tag.

Because the out-of-band tag is ignored and never removed from the socket
buffer, will the conduit driver eventually insert the original VLAN tag into
the payload, resulting in a double-tagged frame on the wire?

> +
> +	*tag_type =3D (proto !=3D ETH_P_8021Q) ? LAN9645X_IFH_TAG_TYPE_S :
> +					     LAN9645X_IFH_TAG_TYPE_C;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-dsa_lan964=
5x_switch_driver_base-v11-0-007ebc983a0a@microchip.com?part=3D1

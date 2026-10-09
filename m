Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB1425CEE
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536799; cv=none; b=bFSURRzOeCrxI2Tl24k1n3t/YpE8ARRMMKmVN83r/DEm3l8DqFBUS6EscwhYiNEj/CbwVYsdCZzFXmwIZ/ymKuPKsXHPwAozAVsrmriYyxYHD4Sl6wlFpVZhyOCkkI8KfwIsxU26zYX2TCrbs6ku/cHfo9EFRDTdi/MaOqlCuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536799; c=relaxed/simple;
	bh=RFaiWIH1BwtuUau8dnPXskxgqkWsdc/x3cRXs5WAvis=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NFJ1S4xlJ9SpLSgO28tJLn87lkRaTkpXbJqbX7ifT9FCEfGHm0YElPJVv1l/e8y+S2mwa9oPeB5jmz7VybZhIr1icyfSNgSccOSe0TEiABBmod+waOHJkdZ8kUmq2d7idc918Y3ax81A1sxVd3hY8WqZOI0ViB9DBfyGVNp56MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxZCeB3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxZCeB3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167591F000FF;
	Fri,  9 Oct 2026 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791536794;
	bh=djb2dqmPHbFDmpB9+F29fDzVOpfHHWyMyeZH1BLHKK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HxZCeB3jQo5jDs4ZVykoTrJEekcOGK1oeuC+KepOt+erFA/lVqRMTj4f/3Q071amF
	 2Sn9Pav0PQotfkHY8pTKV4zaSOJVi1nJaIvyWx+NylMNi2378E/5I0aq6CSlmMOrmj
	 T50AJYaRleXbwjMeI0i2IWILk5k+dMHJ2BMreS9gFlIrkO1vTIzEScIxlj95l4dAts
	 T7aJ3r07x+TQig5UwDF32LqL3hLvRsiAo3BcCESjR+xLrcsrTrXGXlFfmEhVj5kljz
	 FRadzKWQ0IU0jSsayjUuEYnx9S14n81EeIBTcncYjB89aVNCLIrg7C54ShjenVMlHl
	 +lj5dvWqbb8Hg==
Message-ID: <sashiko-outbox-165121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 1/9] net: dsa: add tag driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261008-dsa_lan9645x_switch_driver_base-v14-1-3d2a72661213@microchip.com>
References: <20261008-dsa_lan9645x_switch_driver_base-v14-0-3d2a72661213@microchip.com>
 <20261008-dsa_lan9645x_switch_driver_base-v14-1-3d2a72661213@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:06:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net/dsa: lan9645x: Stale skb->mac_header and skb->network_header=
 after vlan_remove_tag()
--

commit 2bf43370c466c901725bcb460aaa53654797d172
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Subject: net: dsa: add tag driver for LAN9645X

This commit adds a tag driver for the LAN9645x family of switches, using a
front port configured as an NPI port for CPU traffic. It handles frame
extraction and injection using internal frame headers and prefix formatting.

Link: None provided

> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
> new file mode 100644
> index 0000000000000..00339daecfcbd
> --- /dev/null
> +++ b/net/dsa/tag_lan9645x.c
[ ... ]
> +static struct sk_buff *lan9645x_xmit_get_vlan_info(struct sk_buff *skb,
> +						   struct net_device *br,
> +						   u32 *vlan_tci,
> +						   u32 *tag_type)
> +{
[ ... ]
> +		hdr =3D skb_vlan_eth_hdr(skb);
> +		if (ntohs(hdr->h_vlan_proto) =3D=3D proto &&
> +		    ntohs(hdr->h_vlan_TCI) & VLAN_VID_MASK) {
> +			vlan_remove_tag(skb, &tci);
> +			*vlan_tci =3D tci;

[Severity: Medium]
When calling vlan_remove_tag() here, are the skb mac_header and
network_header metadata offsets left pointing to stale locations?

The vlan_remove_tag() function removes the vlan tag and moves the payload,
but it expects the caller to update skb->mac_header and skb->network_header.
This is why the standard helper __skb_vlan_pop() is usually preferred.

Because this tag driver does not adjust skb->mac_header, the offset becomes
stale. After lan9645x_xmit() pushes the 28-byte internal frame header,
won't skb_mac_header(skb) incorrectly point to bytes inside the new header
rather than the actual start of the destination address?

If the conduit device driver or network stack relies on skb_mac_header(skb)
for transmit processing, this could cause it to read incorrect bytes for
packets that had a vlan tag stripped.

> +		}
> +	}
> +
> +	*tag_type =3D (proto !=3D ETH_P_8021Q) ? LAN9645X_IFH_TAG_TYPE_S :
> +					     LAN9645X_IFH_TAG_TYPE_C;
> +
> +	return skb;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dsa_lan964=
5x_switch_driver_base-v14-0-3d2a72661213@microchip.com?part=3D1

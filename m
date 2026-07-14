Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547E3EF649
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040237; cv=none; b=tUTpreH/V/euyMOTEOznDVpBIgRWoqOFMD8+6w2SQ/0nLyHnEXpw5Fk5Cbn7MdaPvuUH9wcY0PB6RvCg+B+odr9b8p7Cz6o9eqpmZGWcua1DfkyVSe5/gzizZX9KYpF7+h6b/2pAjD0jJF/Fa3nVUSL7Wwq668+HoaBxpRbLhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040237; c=relaxed/simple;
	bh=8lauzoCV0Odo+rQIYEW020nlaawB3h3rCEKLa5hRDak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ELJMeUEUcRGhNq1tJZk3Sz7JvhQZonY5Hg3u4lQYSif601k0IOTbc1+Prgbeaz7hdyCnXqNqbfuz2uK3f5uDnxqxjrQpITNKDaiIrZSYa9uZPnY9BJO+Oaln4fGsByxzA4B4SsQ6dsko+913wYRCm6CllnEb8bmTMrob/aCkP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwaGPVsC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwaGPVsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FCD1F000E9;
	Tue, 14 Jul 2026 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784040225;
	bh=HZMvlN47iSORZIZaAbkAqmsFbas0vM1DiVs9tPYji0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YwaGPVsCyX454F5cBlV3fh+M9hF9kScDbVu8y9CrbQFMt+L4bYJN/MSC9fGNqWFd8
	 R54+G8ErlZ3j32mPllqdzpXm6olLg/zMPlX6J5IfFMLpOSXuqr3NrJ8zovbNaoqQBq
	 Es+vn29pd3Ec1iYEAtFGpUpaM0Xq6SL5NI+MefHTaPvmGsxA/C89NkfwUObJLvRNJP
	 I58NZzHU8lAUddyj6y0SdYLQ9ul4U9wsx2ojnPKUF7VN9vZ93HKGHFdB19+C2oQ9h1
	 mRnCQFBMEXHEWHRVEZqxoy6+KbcZNZkHsASpNPBISYJmgFexqbrW3HFXKp9E9Uo1sS
	 tPe4pVE3iCMmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 1/9] net: dsa: add tag driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-dsa_lan9645x_switch_driver_base-v10-1-a4886a08fb15@microchip.com>
References: <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
 <20260713-dsa_lan9645x_switch_driver_base-v10-1-a4886a08fb15@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 14:43:44 +0000
Message-Id: <20260714144344.B5FCD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding an out-of-band VLAN tag without checking for and popping an=
 existing payload tag results in double-tagged frames.
--

--- Patch [1]: [PATCH net-next v10 1/9] net: dsa: add tag driver for LAN964=
5X ---
commit 3fca3b09e95a3eeee247c89f8ecdf602074e9506
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: add tag driver for LAN9645X

This commit adds a DSA tag driver for the LAN9645x family of switches. It
configures an NPI port to use a 16-byte long prefix on extraction and no
prefix on injection, prepending an internal frame header (IFH) to transmit
critical data.

> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
> new file mode 100644
> index 0000000000000..2692c7ad56cbc
> --- /dev/null
> +++ b/net/dsa/tag_lan9645x.c
[ ... ]
> +static struct sk_buff *lan9645x_rcv(struct sk_buff *skb,
> +				    struct net_device *ndev)
> +{
[ ... ]
> +	/* While we have REW_PORT_NO_REWRITE=3D0 on the NPI port, we still disa=
ble
> +	 * port VLAN tagging with REW_TAG_CFG. Any classified VID, different
> +	 * from a VID in the frame, will not be written to the frame, but is
> +	 * only communicated via the IFH. So for VLAN-aware ports we add the IFH
> +	 * vlan to the skb.
> +	 */
> +	dp =3D dsa_user_to_port(skb->dev);
> +	vlan_tpid =3D tag_type ? ETH_P_8021AD : ETH_P_8021Q;
> +
> +	if (dsa_port_is_vlan_filtering(dp) && vlan_tci) {
> +		u16 port_pvid =3D 0;
> +
> +		br_vlan_get_pvid_rcu(skb->dev, &port_pvid);
> +
> +		if ((vlan_tci & VLAN_VID_MASK) !=3D port_pvid)

[Severity: High]
Does this code result in double-tagged frames?

If the hardware delivers the frame without stripping the in-band tag because
port VLAN rewrite is disabled, calling __vlan_hwaccel_put_tag() here adds an
out-of-band tag while leaving the original in-band tag intact in the payloa=
d.
This would cause the network stack to process a single 802.1Q tagged frame
from the wire as a Q-in-Q double-tagged frame.

Should lan9645x_rcv() pop the existing payload tag (for example, using
__skb_vlan_pop()) before adding the out-of-band tag to avoid duplicating it?

> +			__vlan_hwaccel_put_tag(skb, htons(vlan_tpid), vlan_tci);
> +	}
> +
> +	return skb;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-dsa_lan964=
5x_switch_driver_base-v10-0-a4886a08fb15@microchip.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6538C3D16E9
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415846; cv=none; b=Xe1REAH1Necw1HTegZ/nMto8GpC65alSG53LvUJ2Yh2De/ECRzaXoiu8Ab4D+eaVOFPgMi7Fdyp04uI0xk6aHQQCnfqKENUQVLSYC3fIMDlCFN9hiNJv6Qxf/gUnkuBi3+M3x88VRsv7KWf0D6ly8JImovemJaeOt2UP54S15qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415846; c=relaxed/simple;
	bh=V3VZkXZxmRgAtmQqHnoQMFi1hulyLpJDNVHtOM+0NHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TsnPkJ2CeznDdih3/ZPCPE31YkZ09H6zZfZqcLNdO5o+zt0TzUFRwa3DqJE43ozM2+qqUv/bqbUcLh3ZHwenTnxUQPC0CmOJ3AUxMX17LvTS8j4WF4d07wOIn0jTtJ4sf27Z5vgw2q/WEM6V8nhf/1PvG3v64pS7PGLezVeKI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4N9SVs5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4N9SVs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15A71F000FF;
	Mon, 14 Sep 2026 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415845;
	bh=g/O7IXHgnD9VNgPxlpb8BDaFb6B+WZutV4NgWfehWXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4N9SVs5+YiiqGZpM9IdXq2r4OAPq+z2vIhN5JDcSwZ4O/4TGz/uOoX4jrtTE4VCt
	 ZzJquQKeK/REnNn/tMtbWPk8IJcXAW+eTUmzwLk+bX0+Bi1ePTl6d070ZOeRJyr9/s
	 eZ9Oo72JfXpJ0OIAEElTfID7teAJLuHfhMvv0+fJCqrHWDxn0xDEYtitdvPeAvbAQU
	 MVcxBPJbo0n6OqK6eeHRkA0YIsRfs2ikefctNHhlyR0CmHswtiB7keS1lO6wFloTc4
	 Xg/QU1zxDbfFYhU/fbMgmxjY6w7rB4NT06ScOMu6oE6cPlzP2052KQohVVjEwA7sXy
	 4FykRUoY0EyjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 2/4] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260913-ks8995-to-ksz8-v13-2-327b16d309eb@kernel.org>
References: <20260913-ks8995-to-ksz8-v13-0-327b16d309eb@kernel.org>
 <20260913-ks8995-to-ksz8-v13-2-327b16d309eb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 19:57:24 +0000
Message-Id: <20260914195724.C15A71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The ks8995 tagger omits the `.flow_dissect` callback, causing the =
generic flow dissector to use an incorrect 8-byte offset for RX packets ins=
tead of 4 bytes, which breaks flow dissection on the conduit device.
--

commit beb5bab677cea0349bf40d65eeebd8d0ad76ec83
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

This commit adds DSA tagging support for the Micrel KS8995 switch family.
It implements custom ingress and egress tagging using a modified 802.1Q
tag format and registers the protocol operations.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..435665013a864
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c
[ ... ]
> +
> +#define KS8995_NAME "ks8995"
> +
> +#define KS8995_TAG_LEN		VLAN_HLEN
> +/* Reserve room for the switch tag and a hardware-accelerated VLAN tag. =
*/
> +#define KS8995_NEEDED_HEADROOM	(KS8995_TAG_LEN + VLAN_HLEN)

[Severity: High]
Does setting this headroom to 8 bytes cause issues during RX flow dissectio=
n?
Because the needed_headroom is 8 bytes, dsa_tag_generic_flow_dissect() will
erroneously assume the RX tag is also 8 bytes long.

[ ... ]
> +static const struct dsa_device_ops ks8995_netdev_ops =3D {
> +	.name =3D KS8995_NAME,
> +	.proto	=3D DSA_TAG_PROTO_KS8995,
> +	.xmit =3D ks8995_xmit,
> +	.rcv =3D ks8995_rcv,
> +	.needed_headroom =3D KS8995_NEEDED_HEADROOM,
> +};

[Severity: High]
Because there is no custom .flow_dissect override here, the DSA core falls
back to the generic flow dissector, which will use the 8-byte needed_headro=
om
as the RX tag length instead of 4 bytes.

Will this corrupt protocol extraction by skipping 8 bytes into the packet
instead of 4? This could cause the network core to read an invalid
encapsulated EtherType and break Receive Packet Steering (RPS), Transmit
Packet Steering (XPS), and Traffic Control (TC) rules on the conduit
interface.

Should a custom .flow_dissect callback be provided to correctly return a
4-byte offset (or 0 if the tag was stripped into hardware metadata)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-ks8995-to-=
ksz8-v13-0-327b16d309eb@kernel.org?part=3D2

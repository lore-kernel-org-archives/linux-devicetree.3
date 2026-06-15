Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3DE41167A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542889; cv=none; b=lofE5fNvh1si60UY74DwfCaazquOmteVXFn8GdN6g+QuZ5r1Vf2jdukHeafeMHURSTXkYHd28jSptNk7wKtAg/DJQ6lWktJWvOuJ3FvK9SPk6klGygtodQU2Xa7x5ZRyq3FXLhS0FwxLyoKiuME7z0FxbWbhzrDalvxB9+bl3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542889; c=relaxed/simple;
	bh=d/8Zqctlz/DLOM9q9QxdP9vhWJUjPZ0S3+UvBn1JxwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YAadvlVWVLktR8mW6Vdsn5c7J2vi+Oj2ZZZNnZgHpBBIB2z3rTdnE3Rd+YvZgFUgxVEe2FvDZmhzN3d2zYqHZEpv42iwexkhEPG8jln4jh74zZBHoaTlwuk7WSZnE3paBxoavKAT7PcoegL70o+7eQQ3uIaajlXtU9DVGERCCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ks9HUzEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ks9HUzEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AE01F000E9;
	Mon, 15 Jun 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542888;
	bh=TPvL8+J0cUJpnMsVArlf7O6EJxVlU782sCgFvy8NlXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ks9HUzEKbu/EFMq9Two6kxrLkg8ens7a2oWhem6PpbE6qxzucMQfXWzM6irJCWhkt
	 vMg+r/lmQO/vkPFZ9nxZN/6anLh3pCCVlFSQmTjlWbfTprauMI3oc3wkLNLwOxHomw
	 Gd3hdbotgNq+tGsuWTIMn2pyjk3gD2AvU72pFx7krB4TiLlgAsL72wo6heoT3ciYf0
	 qcMh7lRiWGjJ1wkdAz+bQk/EfTKfi4INwce7uBeZtWh+k2Jyfoqi91wuaa3KvCdPIC
	 A2qQ6RJC0CMe8kYe7FTVEKjbQHaO5FAxQvpAidf6bFq8W/MC6GppTaz7MzTET5raqR
	 e+79Z5KxDdjAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 07/15] net: ethernet: oa_tc6: Support for
 vendor specific MMS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-7-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-7-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:27 +0000
Message-Id: <20260615170128.17AE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing state validation in MAC-PHY RX chunk processing leads to a=
 NULL pointer dereference if a start-of-frame chunk is missed.
- [High] The RX path does not limit the accumulated length of ongoing chunk=
s, allowing a malicious hardware device to trigger an `skb_over_panic`.
- [High] Repeated start-of-frame chunks without corresponding end-of-frame =
chunks will leak newly allocated socket buffers.
--

commit ad9ba89ed1440b885945a45d429d49b23e68bbdf
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for vendor specific MMS

OPEN Alliance 10BASE-T1x Serial Interface specification, table 6
allows vendors to use any memory map select (MMS) value between
10 and 15. This new API interface enables vendor to map one of
thes MMS values to MDIO_MMD_VEND1.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index 9410cecfdc2aa..fab7cb84df712 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
> @@ -202,6 +202,18 @@ int oa_tc6_ioctl(struct oa_tc6 *tc6, struct ifreq *r=
q, int cmd)
>  }
>  EXPORT_SYMBOL_GPL(oa_tc6_ioctl);
> =20
> +/**
> + * oa_tc6_set_vend1_mms - Add vendor specific MDIO_MMD to OA TC6 MMS
> + * mapper value.
> + * @tc6: oa_tc6 struct.
> + * @mms: vendor defined MMS value for VEND1 mdio device.
> + */
> +void oa_tc6_set_vend1_mms(struct oa_tc6 *tc6, int mms)
> +{
> +	tc6->vend1_mms =3D mms;
> +}
> +EXPORT_SYMBOL_GPL(oa_tc6_set_vend1_mms);
> +
>  static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,

[Severity: High]
This is a pre-existing issue, but I noticed a potential NULL pointer
dereference during RX chunk processing. If the MAC-PHY sends an RX chunk wi=
th
end_valid set and start_valid clear as the first chunk:

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_prcs_rx_chunk_payload()
    if (end_valid && !start_valid) {
        size =3D end_byte_offset + 1;
        oa_tc6_prcs_rx_frame_end(tc6, data, size);
        return 0;
    }

This function unconditionally calls oa_tc6_update_rx_skb(), which invokes
skb_put() on tc6->rx_skb:

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_update_rx_skb()
    memcpy(skb_put(tc6->rx_skb, length), payload, length);

Since tc6->rx_skb is only allocated when a chunk with a valid start is
received, it will be NULL in this case. Can a malfunctioning or malicious
MAC-PHY trigger a kernel panic here?

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a missing
length check when accumulating ongoing RX chunks. If the MAC-PHY streams an
unbroken series of ongoing chunks (start_valid =3D 0 and end_valid =3D 0),
oa_tc6_prcs_ongoing_rx_frame() repeatedly appends data:

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_prcs_ongoing_rx_frame()
    oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);

Since the SKB allocated in oa_tc6_allocate_rx_skb() has a fixed capacity
based on the MTU, could a stream of ongoing chunks eventually exceed the
skb's tailroom and trigger an skb_over_panic()?

[Severity: High]
This is a pre-existing issue, but repeated start-of-frame chunks might leak
socket buffers. When oa_tc6_prcs_rx_chunk_payload() receives a new start
chunk without the previous frame ending, it allocates a new SKB:

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_prcs_rx_chunk_payload()
    if (start_valid && !end_valid) {
        size =3D OA_TC6_CHUNK_PAYLOAD_SIZE - start_byte_offset;
        return oa_tc6_prcs_rx_frame_start(tc6, &data[start_byte_offset],
                                          size, footer);
    }

This eventually calls oa_tc6_allocate_rx_skb() which overwrites the
tc6->rx_skb pointer:

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_allocate_rx_skb()
    tc6->rx_skb =3D netdev_alloc_skb_ip_align(tc6->netdev, tc6->netdev->mtu=
 +
                                            ETH_HLEN + ETH_FCS_LEN +
                                            OA_TC6_TSTAMP_SZ);

If tc6->rx_skb was already populated from a previously interrupted frame,
the old pointer is overwritten without being freed. Can this be used to
exhaust kernel memory by continuously sending start chunks?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D7

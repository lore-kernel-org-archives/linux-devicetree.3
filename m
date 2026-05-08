Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212082F8EB5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778277820; cv=none; b=geEbpe8yKfzRS9jk0gqD2EyJ7xd56JsoVnDrQRMVmyokRUVK5ZL7pITbD5s66Dm5ej/wv74sLnUAsVU+ShzC9Dt04kIcPxzrL/T/l4CSiPvIN5TYXLrzvjMGwsYf6DO+wKBsCIshxovrXJD6Wy6JuL2sZxLbvlDCSRcnZqkpExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778277820; c=relaxed/simple;
	bh=d2fQ5Qj8FYJLxlMp+xLA0eq5ODt/o/c3ggRGsd4rYKg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJEgTJHPQKo7rMf7xAqvMyRv4c7vvlhzEN6QMUVTCD3mZlipJHPWu6jyDmDeB9Cue6jBJq2whdClgmHwTQcBSjIAlDx+wy6w2dlVxJeO3Q7izt+1Cr5NJ3Qnbhlh1swL764FeC+V85hc7CT+kuy3BuuzMfhY70AC+7wrG7pEdkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V85I3uWO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V85I3uWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76C7C2BCC9;
	Fri,  8 May 2026 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778277820;
	bh=d2fQ5Qj8FYJLxlMp+xLA0eq5ODt/o/c3ggRGsd4rYKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=V85I3uWOPmSMPCoSYTMXWJUGfJ9m94dR7adIs/Mw3yjKiAiTT3ItPKBpmEWhyF+ur
	 FMtmABPsFRYPkZA0f4JXDbpFjvDTpZgh1k9pDePqkU+Z0WM2INm/iAUYHfcXZmPxVE
	 mdePzH7Gbe5D+ec7A4zOvTW9AztNwxeuWHduHvxS6eMlRipVZaXgAvrU/yioDhUvnH
	 LHIDpN1nXcI+tWYidZdiTaRCH6eR5Jq63ZSZKUelvZY2/py5RmLTuyuBlwl4Nes59r
	 JBvgt2s4qqxYf2MpodyN0QL3GmBldPZWEV8K80dmOGRPC2WGmykwiUGWjQ3xFeUdoy
	 3wXbV/agBXzTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/15] can: grcan: Refactor GRCAN DMA buffer to use
 structured memory layout
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508070121.6918-12-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-12-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:03:39 +0000
Message-Id: <20260508220339.C76C7C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unnecessary __packed attribute on struct grcan_msg_header causes i=
nefficient and non-atomic DMA descriptor accesses.
- [High] Replacing word-wise bit shifts with memcpy() for CAN payload break=
s endianness on little-endian architectures.
- [High] Pre-existing NAPI livelock when alloc_can_skb() fails under memory=
 pressure.
--

commit be98321b7518fa6d89c56b12cd7c4501bba55c9b
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>

can: grcan: Refactor GRCAN DMA buffer to use structured memory layout

This commit refactors the GRCAN DMA buffer handling to use structured memory
layouts instead of array indices. It introduces struct grcan_msg_header and
updates the transmit and receive functions to use memcpy for payload handli=
ng.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index b5527fd9e02e7..4921da349a0ef 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -242,9 +239,23 @@ struct grcan_hwcap {
>  	bool fd;
>  };
> =20
> +struct grcan_msg_header {
> +	u32 id;
> +	u32 ctrl;
> +	u8 data[CAN_MAX_DLEN];
> +} __packed;

Since this structure is already naturally aligned to 16 bytes, is the __pac=
ked
attribute necessary? On strict-alignment architectures like SPARC, which are
typically used with Aeroflex Gaisler cores, this attribute might force the
compiler to synthesize non-atomic byte-by-byte memory accesses (ldub/stb) f=
or
the 32-bit id and ctrl fields instead of atomic 32-bit instructions.

Could this disrupt the atomicity of descriptor reads and writes, leading the
GRCAN DMA hardware to observe partially updated descriptors?

[ ... ]

> @@ -1239,30 +1256,33 @@ static int grcan_receive(struct net_device *dev, =
int budget)
>  			continue;
>  		}

This is a pre-existing issue, but if alloc_can_skb() returns NULL due to me=
mory
pressure, the code uses continue and skips the remainder of the loop.

Does this bypass the rd =3D grcan_ring_add(...) call at the end of the loop?
If the read pointer rd is never advanced, won't the loop process the same
packet repeatedly until budget is exhausted, potentially leading to a NAPI
livelock?

> =20
> -		slot =3D dma->rx.buf + rd;
> -		eff =3D slot[0] & GRCAN_MSG_IDE;
> -		rtr =3D slot[0] & GRCAN_MSG_RTR;
> +		hdr =3D grcan_msg_header_at(&dma->rx, rd);
> +
> +		eff =3D hdr->id & GRCAN_MSG_IDE;
> +		rtr =3D hdr->id & GRCAN_MSG_RTR;
> +
>  		if (eff) {
> -			cf->can_id =3D ((slot[0] & GRCAN_MSG_EID)
> +			cf->can_id =3D ((hdr->id & GRCAN_MSG_EID)
>  				      >> GRCAN_MSG_EID_BIT);
>  			cf->can_id |=3D CAN_EFF_FLAG;
>  		} else {
> -			cf->can_id =3D ((slot[0] & GRCAN_MSG_BID)
> +			cf->can_id =3D ((hdr->id & GRCAN_MSG_BID)
>  				      >> GRCAN_MSG_BID_BIT);
>  		}
> -		cf->len =3D can_cc_dlc2len((slot[1] & GRCAN_MSG_DLC)
> -					  >> GRCAN_MSG_DLC_BIT);
> +
> +		cf->len =3D can_cc_dlc2len((hdr->ctrl & GRCAN_MSG_DLC)
> +					 >> GRCAN_MSG_DLC_BIT);
> +
>  		if (rtr) {
>  			cf->can_id |=3D CAN_RTR_FLAG;
>  		} else {
> -			for (i =3D 0; i < cf->len; i++) {
> -				j =3D GRCAN_MSG_DATA_SLOT_INDEX(i);
> -				shift =3D GRCAN_MSG_DATA_SHIFT(i);
> -				cf->data[i] =3D (u8)(slot[j] >> shift);
> -			}
> +			if (cf->len > 0)
> +				memcpy(cf->data, hdr->data,
> +				       min_t(u32, cf->len, CAN_MAX_DLEN));

The original code explicitly extracted payload bytes from 32-bit words using
bitwise shifts, which placed the bytes correctly regardless of the host
architecture's endianness.

Will replacing this with a byte-wise memcpy() break the payload memory layo=
ut
on little-endian systems, causing the CAN hardware to receive byte-swapped
corrupted payloads?

> =20
>  			stats->rx_bytes +=3D cf->len;
>  		}

[ ... ]

> @@ -1447,16 +1468,13 @@ static netdev_tx_t grcan_start_xmit(struct sk_buf=
f *skb,
>  		tmp =3D (id << GRCAN_MSG_EID_BIT) & GRCAN_MSG_EID;
>  	else
>  		tmp =3D (id << GRCAN_MSG_BID_BIT) & GRCAN_MSG_BID;
> -	slot[0] =3D (eff ? GRCAN_MSG_IDE : 0) | (rtr ? GRCAN_MSG_RTR : 0) | tmp;
> -
> -	slot[1] =3D ((dlc << GRCAN_MSG_DLC_BIT) & GRCAN_MSG_DLC);
> -	slot[2] =3D 0;
> -	slot[3] =3D 0;
> -	for (i =3D 0; i < dlc; i++) {
> -		j =3D GRCAN_MSG_DATA_SLOT_INDEX(i);
> -		shift =3D GRCAN_MSG_DATA_SHIFT(i);
> -		slot[j] |=3D cf->data[i] << shift;
> -	}
> +
> +	hdr->id =3D (eff ? GRCAN_MSG_IDE : 0) | (rtr ? GRCAN_MSG_RTR : 0) | tmp;
> +
> +	hdr->ctrl =3D ((dlc << GRCAN_MSG_DLC_BIT) & GRCAN_MSG_DLC);
> +
> +	if (dlc > 0)
> +		memcpy(hdr->data, cf->data, min_t(u32, cf->len, CAN_MAX_DLEN));

Similarly, does changing this transmit packing from explicit bitwise shifts
to memcpy() risk transmitting byte-swapped payloads on little-endian
architectures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D11

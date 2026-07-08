Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49607381B1A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550097; cv=none; b=ZoTd7/n/TO/KlWkKIBKja4+zxtquPl9STXL6dAzGAEkPKGTzUR+nvsuBSY8oowduKHLwA/D2VHd5Yc6qFLwXjZyGmucKdnTGLM1uMH4V2iyK1ar9MVdoCBntPlIHK61ZNu39VJ0RIba3eEak+avM13tSIA+4oG8x/pWZGhiswtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550097; c=relaxed/simple;
	bh=X42vz6Vj5S0SIKv81DzKo615ZKHfRGfuAgIV+0vsSh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JFxwcbWOWtvpA1paUIg8gE12t5qOWRW/2BFZiAjPZfqbTOQH2WHXqz9bX3UzYBwf2bF1a7jdrSQqR/1fiU5R6LUXYpGmoJGHj8UJg/wd+VDM85b5Uqj2dl26PjF0/JyKDTZTtk2kVGPKd6TsWR/rU8zaAqdhhXyPYCPm+BlPQHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO6I+6rW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO6I+6rW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26731F000E9;
	Wed,  8 Jul 2026 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550096;
	bh=X8Eza6YxZCIYkqVhMbQueO1rwyiBg5OiJPSkups1+Yw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZO6I+6rWsN1Ikpu2eiiR0IseEiNHDxWtINC4WaTd+6xN9eAVb/NeYFTPipJIn6Jw4
	 UAIBPoVByKax95tweY4mISuyQ0AjJYiCJ1AiOWsrjRvX98Dni4c21Cq4TvQDxWzp1M
	 sKqaALM55xZeU6Lps0NZLbAjT/yuI/jxouo6ejSX4ai65bJqHeO7XGN9bfF3vv043q
	 KXNje7b7/kkrKkKa7bttb7eyLG4PTUt+gZqEnGXpxAuACnGGSvZVkPPaNxYM9nn9bN
	 zvfyv6TdAh8Yp7ktFNSf0g88xsFEMc3JERp8nlY3ueTr8hEOQI2DgfZawoq8790bo/
	 L+KA3yj59p4dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 07/13] net: ethernet: oa_tc6: Add
 read_mms/write_mms register access functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus" <ciprian.regus@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-adin1140-driver-v5-7-4aca7b51a58b@analog.com>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-7-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:34:55 +0000
Message-Id: <20260708223455.B26731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing SKB tailroom validation before skb_put() allows oversized =
frames to cause a kernel panic (DoS).
--

--- Patch [7]: [PATCH net-next v5 07/13] net: ethernet: oa_tc6: Add read_mm=
s/write_mms register access functions ---
commit 1657b3f7ce65c20a46c5f26047b7e9b1c93b5265
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Add read_mms/write_mms register access functions

The Open Alliance TC6 standard defines multiple memory maps for the
MAC-PHY's register space. Define register access functions that allow the
caller to specify the MMS.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 3c19233fb38f8..955148d3cefc4 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -62,6 +62,8 @@
>  #define STATUS0_RESETC_POLL_DELAY		1000
>  #define STATUS0_RESETC_POLL_TIMEOUT		1000000
> =20
> +#define OA_TC6_REG_MMS_MASK		GENMASK(19, 16)
> +

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for oversized
frames to cause a kernel panic due to a missing SKB tailroom check?

Looking at oa_tc6_update_rx_skb() in this file, it unconditionally calls
skb_put():

drivers/net/ethernet/oa_tc6.c:oa_tc6_update_rx_skb() {
	...
	memcpy(skb_put(tc6->rx_skb, length), payload, length);
}

This is fed by continuous chunks of an ongoing frame:

drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_ongoing_rx_frame() {
	...
	oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);
}

If an oversized frame is received, or if the MAC-PHY streams continuous chu=
nks
without asserting the end_valid flag, the driver reassembles the frame by
repeatedly calling oa_tc6_prcs_ongoing_rx_frame() and oa_tc6_update_rx_skb(=
).

Since the SKB is allocated with a fixed size, and skb_put() is called
unconditionally without verifying skb_tailroom(), won't this overflow the
bounds and cause a panic via skb_over_panic()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-adin1140-d=
river-v5-0-4aca7b51a58b@analog.com?part=3D7

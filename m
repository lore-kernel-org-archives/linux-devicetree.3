Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414AE37A846
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211204; cv=none; b=E0AqTMRMwYg+vK3AWU2cSj8adjmG8l9ACJ9TnCTzA8afLW2wmO7cx02CBj6NbG11U9NjXYYIhKIZo4zQSaDI8lN5LUa5Bo7MUVTuHHA3EL7vTIGUVxIqRqiTEUYLk0zekcrhGitIwPvNy/6Dl1edLn3bTqmfnQOOlJEaGGpFce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211204; c=relaxed/simple;
	bh=NEoCtTxSW83pbWYRWECwXWswxCExHSd9Jdcj5PDlVUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c6prn5S6F8DawEwxl+4pIjHMNjbUeie7/ZaSwxsZu9J1kZa0hBTXMMtpWVYhnNSLkjTiKEZ+weJ9eUjPJam+V0gffAKAXhWew17B7tYN+JXO8LiXnpiGQgb87UY575LOl4jzMSh57LU4S67Oz7JEVdcTfIUFEJnRbV8PwFQ87eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4eV+pup; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4eV+pup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0E01F00A3D;
	Tue, 28 Jul 2026 03:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785211200;
	bh=PzIrvu31h+s27PQtyJV21nuWWjpQK69K2L8gNk2b9jI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J4eV+pupi9hG3VU7FUX6Z8xzT2twA/wfUtxapA+Dh4NSPdNU8UNnjeLvCNq1vVN+k
	 HiG0qTHnGXT89fbT1ble1Alf/lyp5ZRBK6PfDPCtqfYhhYLD8hikAz0rQTTODLmxdf
	 Kz7q/ggiot1SwRiyXkzHCwelWjLCTOx9bNtXxZUpiUrsKHDUTxmsCU4oAGI6gMQAym
	 yQavIrsKCXQk5qpPVqOgLdS5+iZXjwtrXxxdb/RupOsWJsB1Z24O5gYMsDTnkMxws5
	 mEvAGc19KdrGHA25gAd/qNSl7JXYHsgH8muhPMIXCqHTAgISH5yGfjb/4hWeMqY2b6
	 /4rpCOiJ8tq4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/5] net: dsa: mv88e6xxx: use ARRIVAL1
 counter for all peer delay messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luke Howard" <lukeh@padl.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727-mv88e6xxx-ptp-fixes-v4-2-10b4020155fc@padl.com>
References: <20260727-mv88e6xxx-ptp-fixes-v4-0-10b4020155fc@padl.com>
 <20260727-mv88e6xxx-ptp-fixes-v4-2-10b4020155fc@padl.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:59:59 +0000
Message-Id: <20260728035959.ED0E01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing SKB Linearization for PTP Header Access
--

--- Patch [2]: [PATCH net-next v4 2/5] net: dsa: mv88e6xxx: use ARRIVAL1 co=
unter for all peer delay messages ---
commit 4e21fb1f9ef35cdb7536e32b19f9424e5f8c90e2
Author: Luke Howard <lukeh@padl.com>

net: dsa: mv88e6xxx: use ARRIVAL1 counter for all peer delay messages

This commit updates the mv88e6xxx driver to use the second arrival counter
(ARRIVAL1) for PDelayReq messages as well as PDelayResp messages. This allo=
ws
capturing timestamps for both when they arrive simultaneously from a peer.

> diff --git a/drivers/net/dsa/mv88e6xxx/hwtstamp.c b/drivers/net/dsa/mv88e=
6xxx/hwtstamp.c
> --- a/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> +++ b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> @@ -323,9 +323,16 @@ static void mv88e6xxx_rxtstamp_work(struct mv88e6xxx=
_chip *chip,
>  				   &ps->rx_queue2);
>  }
> =20
> -static int is_pdelay_resp(const struct ptp_header *hdr)
> +static bool is_pdelay_msg(const struct ptp_header *hdr)
>  {
> -	return (hdr->tsmt & 0xf) =3D=3D 3;
> +	switch (ptp_get_msgtype(hdr, PTP_CLASS_V2)) {

[Severity: High]
This is a pre-existing issue, but can this dereference of the header cause =
an
out-of-bounds read if the PTP packet is fragmented?

Looking at ptp_parse_header() which provides the hdr pointer, it ensures the
header is within the total length of the SKB, but it does not seem to check=
 if
it is within the linear data buffer:

net/core/ptp_classifier.c:ptp_parse_header() {
    ...
	/* Ensure that the entire header is present in this packet. */
	if (ptr + sizeof(struct ptp_header) > skb->data + skb->len)
		return NULL;

	return (struct ptp_header *)ptr;
}

If a maliciously crafted or fragmented PTP packet pushes the header into the
non-linear paged fragments, could this direct pointer access read past the
linear boundary when ptp_get_msgtype() accesses hdr->tsmt?

The same concern seems to apply to the read of hdr->sequence_id in
mv88e6xxx_port_txtstamp() on the TX path.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mv88e6xxx-=
ptp-fixes-v4-0-10b4020155fc@padl.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F206637B41B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211202; cv=none; b=tjjvsEyzuj1s/C4raxaP9rpm3IdXYf24nQIt/49dpsSag6jHrnusRJ2+cDk7pKEFb8y4p0MinDzVZEVIMepl9/8ciaO0sDXd42CUlee/KXdrZeQSpnIjsKMrg7HuOTH9K1eyMg1onzk5ig4iefhwGiCKogSBxbBb0UfXz35Y2g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211202; c=relaxed/simple;
	bh=/cJDutgHoMvpQokRd3WQI6AiLoynkpeW2JlD+bnptBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q3xrVDd0ypKPj8PAPDcxOd27A6q8b7AvnVqDD/ezshFSb3cKFc5aqTDdu1iIECHoB1dc37bhA2SIBPRzhyz01rG+yx8am7RKBQkPVaKIobnAZ/2ksEwmDgcwmu4D33cL6XLLHJbx8Q85PSNnK1n5zKwrplmk65KbxucNg6Yf0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzbmIb1f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzbmIb1f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951161F00A3A;
	Tue, 28 Jul 2026 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785211199;
	bh=mqbHmVtvHAZ+xnvYjbBbGxBrjJ6pJZg54DD3nTOpEX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CzbmIb1fILnNqOiYItHLr/bTQvROeU5CvO2LSwLozDvciHeYWl2iUqja+zL8J9A6Y
	 VWPdOxfbegntZr32Quu+cCL0eJ0d2RSe/7Vi97m6aEkCg2EGc9XcpOBmVejyH/si5U
	 v3MkED+1nTF/og0XmKOqan2gXrGCmeRQXmCMAoi2n/pTrnFDJFoGDg/bREXTwREkkU
	 QvKQdVsO3M4DMikK0wvvvHEuMvLsHvVT3B054SFGD5YfXXZncGt0PhLAQXb1FrXC2O
	 atzfXTm1XbQWy56qgcTIu2Hzt5p9PSa5PgfkW978B2bwNoe61zdIQPFBmyRSHcDSks
	 yax3S92/kpu8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/5] net: dsa: mv88e6xxx: only time stamp
 PTPv2 frames
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luke Howard" <lukeh@padl.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-mv88e6xxx-ptp-fixes-v4-1-10b4020155fc@padl.com>
References: <20260727-mv88e6xxx-ptp-fixes-v4-0-10b4020155fc@padl.com>
 <20260727-mv88e6xxx-ptp-fixes-v4-1-10b4020155fc@padl.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:59:58 +0000
Message-Id: <20260728035958.951161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing PTP header linearization leading to potential out-of-bound=
s memory accesses.
- [High] The MV88E6XXX_HWTSTAMP_ENABLED bit flag is used as an ad-hoc synch=
ronization mechanism for hardware reconfiguration, failing to protect again=
st in-flight readers.
--

--- Patch [1]: [PATCH net-next v4 1/5] net: dsa: mv88e6xxx: only time stamp=
 PTPv2 frames ---
commit 105747c72e976395df1d9d44672056bd86952a7c
Author: Luke Howard <lukeh@padl.com>

net: dsa: mv88e6xxx: only time stamp PTPv2 frames

Marvell switches only document support for IEEE 1588v2, not for PTPv1
(IEEE 1588-2022). Reject PTPv1 frames in mv88e6xxx_should_tstamp().

> diff --git a/drivers/net/dsa/mv88e6xxx/hwtstamp.c b/drivers/net/dsa/mv88e=
6xxx/hwtstamp.c
> index 6e6472a3b75ad..e4326165e1896 100644
> --- a/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> +++ b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> @@ -216,6 +216,10 @@ static struct ptp_header *mv88e6xxx_should_tstamp(st=
ruct mv88e6xxx_chip *chip,
>  	if (!chip->info->ptp_support)
>  		return NULL;
> =20
> +	/* Marvell switches do not support IEEE 1588-2002 (PTPv1). */
> +	if ((type & PTP_CLASS_VMASK) !=3D PTP_CLASS_V2)
> +		return NULL;
> +
>  	hdr =3D ptp_parse_header(skb, type);
>  	if (!hdr)
>  		return NULL;

[Severity: High]
This isn't a bug introduced by this patch, but does ptp_parse_header()
guarantee that the returned header is in the linear region of the skb?

ptp_parse_header() bounds checks against skb->data + skb->len, which includ=
es
paged data. If the header spans into paged fragments, callers that directly
dereference the returned header without first calling pskb_may_pull() could
cause an out-of-bounds read.

This happens in the RX path when calling is_pdelay_resp():

drivers/net/dsa/mv88e6xxx/hwtstamp.c:is_pdelay_resp() {
    return (hdr->tsmt & 0xf) =3D=3D 3;
}

It also happens in seq_match():

drivers/net/dsa/mv88e6xxx/hwtstamp.c:seq_match() {
    ...
    hdr =3D ptp_parse_header(skb, type);
    return ts_seqid =3D=3D ntohs(hdr->sequence_id);
}

and in the TX path:

drivers/net/dsa/mv88e6xxx/hwtstamp.c:mv88e6xxx_port_txtstamp() {
    ...
    ps->tx_seq_id =3D be16_to_cpu(hdr->sequence_id);
}

Could this lead to kernel oopses or garbage reads?


[Severity: High]
This is another pre-existing issue, but does using the
MV88E6XXX_HWTSTAMP_ENABLED bit flag provide adequate synchronization?

The configuration path in mv88e6xxx_set_hwtstamp_config() clears this bit
to act as an ad-hoc lock:

drivers/net/dsa/mv88e6xxx/hwtstamp.c:mv88e6xxx_set_hwtstamp_config() {
    /* Prevent the TX/RX paths from trying to interact with the
     * timestamp hardware while we reconfigure it.
     */
    clear_bit_unlock(MV88E6XXX_HWTSTAMP_ENABLED, &ps->state);
    ...
}

And the TX/RX paths check it here in mv88e6xxx_should_tstamp(), just below
the diff hunk:

drivers/net/dsa/mv88e6xxx/hwtstamp.c:mv88e6xxx_should_tstamp() {
    ...
    if (!test_bit(MV88E6XXX_HWTSTAMP_ENABLED, &ps->state))
        return NULL;
    ...
}

If an in-flight reader in the TX/RX path checks the flag, gets preempted,
and resumes after the configuration thread alters the hardware state,
couldn't it queue timestamp requests to disabled hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mv88e6xxx-=
ptp-fixes-v4-0-10b4020155fc@padl.com?part=3D1

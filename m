Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091743793DC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211201; cv=none; b=bypa1y6gS4JEo++cs5Tf33SCgZUixF3xSLQ7N9d0xH/LJjvaNGIZR2YBdPOEFz+nHwYY6CHi8NwOxt8E5HpYHNKvWhsRTJJhlVbRSfTLej5s+lF8pUfBVwegH3EtPJvpsDRUrXuIYhELe+8av9OpyYNEsG825kj6FUwgTMk/tzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211201; c=relaxed/simple;
	bh=4+aMDrpPrBmdL2q9QxrdTsb+poO1PeOGmEOXr+W9DvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IAUbPQ8LBgdoCBnMJT6cN2p4bKVg4TlEJKfMlP8GzBWxIkx6twK1gIE6R8gOnBtE3foOsoz1sNPUjEh1iGtwNlGtRGBpxz8WMBUsBHUyDbM2FdoPYoRudpZkYiQTrrfupKrwgFLDY1VXXv8vIwC4h4KjMT+Wv5Q2Y3DcNYDwveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwFTdvou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwFTdvou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9821F000E9;
	Tue, 28 Jul 2026 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785211198;
	bh=kcP2tTCg0rz/JgtAWrVBaG5NZx/c6rcc6ccigv5lXBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gwFTdvouO4HD3qbTtPJZODA2IdSFv/PURTTJwec5ySUxydNVHz7pjqmtG9by393Io
	 Qr41a4WrC72M2NLnvRPxoSPVMLSYnRgikv/+AwZ5eCVYA/XpMZMXA0y7QGT1S3O65e
	 klA3qql7v+24LMhZTvBnteEd5qDJ+fUMxKFnBZn3SbuVznFg1usI2mVuGGE67kW7j6
	 p+VEJRg0kfXhjPc/omrSrI0aGbmq/sO3joAZO9PqGDkORd0U5O4ibmaZtgMGAeNofl
	 fqDIxtIHu1M5Pdl58tTzYWDO00cpEz7+kfbgiJWDQy7b7wuUvTe9cpIfu7ua0jTgIf
	 0qhNwFZ1+b4sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/5] net: dsa: mv88e6xxx: embedded PTP
 timestamp support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luke Howard" <lukeh@padl.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-mv88e6xxx-ptp-fixes-v4-5-10b4020155fc@padl.com>
References: <20260727-mv88e6xxx-ptp-fixes-v4-0-10b4020155fc@padl.com>
 <20260727-mv88e6xxx-ptp-fixes-v4-5-10b4020155fc@padl.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:59:57 +0000
Message-Id: <20260728035957.DC9821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardware configuration failures in `mv88e6xxx_set_hwtstamp_config(=
)` leak `chip->enable_count`, leaving the software state permanently out of=
 sync.
- [Low] Lockless access to `chip->tag_protocol` without `READ_ONCE()` / `WR=
ITE_ONCE()` annotations causes a data race.

Pre-existing issues:
- [High] Dereferencing PTP header pointers on nonlinear SKBs without first =
ensuring the header is within the linear data buffer causes out-of-bounds r=
eads.
--

--- Patch [5]: [PATCH net-next v4 5/5] net: dsa: mv88e6xxx: embedded PTP ti=
mestamp support ---
commit a448ec89fabbabe65af4afa19ebc67d3c379213b
Author: Luke Howard <lukeh@padl.com>

net: dsa: mv88e6xxx: embedded PTP timestamp support

mv88e6xxx switches can embed the PTP arrival timestamp directly in the
frame, at a configurable offset from the PTP common header, typically
the offset of the reserved2 field.

[ ... ]

> diff --git a/drivers/net/dsa/mv88e6xxx/chip.h b/drivers/net/dsa/mv88e6xxx=
/chip.h
> index 7272b7dc4955c..c75a71464b20a 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.h
> +++ b/drivers/net/dsa/mv88e6xxx/chip.h
[ ... ]
> @@ -818,6 +825,14 @@ static inline bool mv88e6xxx_has_lag(struct mv88e6xx=
x_chip *chip)
>  	return !!chip->info->global2_addr;
>  }
> =20
> +/* Whether the active tagging protocol has the switch embed arrival time=
 stamps
> + * in the frame instead of leaving them in the PTP arrival registers.
> + */
> +static inline bool mv88e6xxx_ptp_embedded_ts(struct mv88e6xxx_chip *chip)
> +{
> +	return chip->tag_protocol =3D=3D DSA_TAG_PROTO_EDSA_PTP_RESERVED2_TS;

[Severity: Low]
Is it possible for chip->tag_protocol to be modified concurrently by
mv88e6xxx_change_tag_protocol() in process context?

If this runs in the fast path rx softirq without READ_ONCE() and
WRITE_ONCE() annotations, could this cause a data race?

> +}
> +
>  static inline bool mv88e6xxx_has_tcam(struct mv88e6xxx_chip *chip)
>  {
>  	return !!chip->info->tcam_addr;
[ ... ]
> diff --git a/drivers/net/dsa/mv88e6xxx/hwtstamp.c b/drivers/net/dsa/mv88e=
6xxx/hwtstamp.c
> index a5b362a999e64..74eaadeeeb784 100644
> --- a/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> +++ b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
[ ... ]
> @@ -147,20 +149,30 @@ static int mv88e6xxx_set_hwtstamp_config(struct mv8=
8e6xxx_chip *chip, int port,
>  	if (tstamp_enable) {
>  		chip->enable_count +=3D 1;
>  		if (chip->enable_count =3D=3D 1 && ptp_ops->global_enable)
> -			ptp_ops->global_enable(chip);
> -		if (ptp_ops->port_enable)
> -			ptp_ops->port_enable(chip, port);
> +			err =3D ptp_ops->global_enable(chip);
> +		if (!err && ptp_ops->port_enable)
> +			err =3D ptp_ops->port_enable(chip, port);
>  	} else {
>  		if (ptp_ops->port_disable)
> -			ptp_ops->port_disable(chip, port);
> +			err =3D ptp_ops->port_disable(chip, port);
>  		chip->enable_count -=3D 1;
>  		if (chip->enable_count =3D=3D 0 && ptp_ops->global_disable)
>  			ptp_ops->global_disable(chip);
>  	}
>  	mv88e6xxx_reg_unlock(chip);
> =20
> +	if (err)
> +		return err;

[Severity: High]
If ptp_ops->global_enable() or ptp_ops->port_enable() fails and returns an
error here, does this code leak the increment to chip->enable_count?

If the count remains incremented on failure, could this leave the hardware
state permanently out of sync and break the ability to enable or disable PT=
P?

> +
>  	/* Once hardware has been configured, enable timestamp checks
>  	 * in the RX/TX paths.
[ ... ]
> @@ -249,6 +261,52 @@ static int seq_match(struct sk_buff *skb, u16 ts_seq=
id)
>  	return ts_seqid =3D=3D ntohs(hdr->sequence_id);

[Severity: High]
This is a pre-existing issue, but can this dereference of hdr->sequence_id
result in an out-of-bounds read?

If an skb containing a PTP packet is received fragmented such that the PTP
header sits in the paged data area, ptp_parse_header() returns a pointer
extending past the linear region.

Should we call pskb_may_pull() or skb_linearize() to ensure the header is in
linear memory before dereferencing it here and in is_pdelay_msg()?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mv88e6xxx-=
ptp-fixes-v4-0-10b4020155fc@padl.com?part=3D5

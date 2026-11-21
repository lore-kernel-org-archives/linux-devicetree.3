Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220788;
	b=fcIH5r1WwKxQUp1h8bluHQew7oDruCu7aY5b10mCxehhRSeMMVuZYbT9VtUdm/nRo94M
	 PCn1wJjljLD9PYhbyP4ozrtGWDskLaSmXckC3F8G0AioHkDETkeVhOQETZD+edsBoKrqg
	 cHWrmTXnPBKt9v3qQIrYoN1n3egrc/cisZGqwByS5RhU4lhxcjmilufQFEJexI9oaiMrA
	 u1DU2J0RDUxRmE8lJJoJLScFIjDCDgdi8f3+Td8Nvp46JhSG1fSf4klooDR3JAwhqpfPy
	 OVi0ygQtI/0qX1LhV2LJmBUwbNgrNNJO6jpUQOWv7Lmg3tgj3VaCxHt1b7k4TUK89kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220788;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N0Gddx+pPETauu6b6SUYJYXDdPX2KM47y59NQEHdr6I=;
	b=edYo0oWO1RwjUHbNy1Mmvyh+glItkgEf+1jkIaK8Hayo57kKQaFL1/+0Fw40RYrFRZjX
	 ETq3R9R8Ds4i+ncXnmqNGTjuR0IQ58tcoV5tRI8aH773AQCHSavrAZWymICotfjhvhwBy
	 G8aATvzZpbtm8ii7+KDdHzTsJq7lljUons2aA7q/mVBxl4plQuPWUKMXAqLP1iGLsheW+
	 TIPy6RcqfNolTRqqxD76rdZZoKYXrrGvFMZT8793D3DVLSibNImBUj1VbS4Ak3V72wTwY
	 0LXaDvl5YXTkkFUmK7ff9441iBu+Yb5NYPWeV1sXGVCWvQjxyUT9xy203x0FIEtJ6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ep+pyJvJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711ED60A2605
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ep+pyJvJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76961F000F2;
	Sat, 21 Nov 2026 00:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220787;
	bh=N0Gddx+pPETauu6b6SUYJYXDdPX2KM47y59NQEHdr6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ep+pyJvJw9Jt6oR968zgqaGsw50gEvOCMkBpN/zVscNbOT04tOHKCYmmCFf3O5y0k
	 bCTObVDC0/Lihq1XEjjXV5hK8bKsxjCycoheIFZ0rIfVCtP8DKh7E6ew47gEZkyJiP
	 vDqoOyYiOo/+hk+7dg30l1/gNU5qDJVJ62uxfcoH2w1xVyMT5z0ZC6hj40whQub8Gj
	 IqIL13W3+XAIhvtNhIGInB41CKK5OUzHH5e63Br2cND91Fqz+oPILxcG3qBdjQDIqx
	 xLQE/eAADhiObKzYh9rQQLQVVUXge3tAt/PhbNLHDrXkhAEwXVJ2FioGoL5zJtVVCn
	 hqi0RQ/3up7mg==
Message-ID: <sashiko-outbox-226422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 22/24] net: dsa: rzn1-a5psw: Keep MAC TX
 enabled on RZ/T2H
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261120002549.1908299-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 00:26:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: dsa: rzn1-a5psw: tx_allowed conflates admin enable and
  STP state
--

commit 35401b3c17f803c4cf769c92538ab3bbb602e7e3
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Keep MAC TX enabled on RZ/T2H

This commit keeps CMD_CFG.TX_ENA enabled on SoCs that require it, pulsing
the hardware reset line in probe instead of issuing CMD_CFG.SW_RESET and
gating port transmission through A5PSW_PORT_ENA based on link and
administrative/STP state.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 751d03b0bde4c..86d5b9d52f8db 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -127,11 +127,20 @@ static void a5psw_port_mgmtfwd_set(struct a5psw *a5=
psw, int port, bool enable)
>  	a5psw_port_pattern_set(a5psw, port, A5PSW_PATTERN_MGMTFWD, enable);
>  }
> =20
> -static void a5psw_port_tx_enable(struct a5psw *a5psw, int port, bool ena=
ble)
> +/* Must be called with reg_lock held */
> +static void a5psw_port_tx_update(struct a5psw *a5psw, int port)
>  {
>  	u32 mask =3D A5PSW_PORT_ENA_TX(port);
> -	u32 reg =3D enable ? mask : 0;
> +	u32 reg;
> =20
> +	reg =3D a5psw_reg_readl(a5psw, A5PSW_PORT_ENA) & ~mask;
> +	if (a5psw->tx_allowed & a5psw->link_up & BIT(port))
> +		reg |=3D mask;
> +	a5psw_reg_writel(a5psw, A5PSW_PORT_ENA, reg);
> +}
> +
> +static void a5psw_port_tx_enable(struct a5psw *a5psw, int port, bool ena=
ble)
> +{
>  	/* Even though the port TX is disabled through TXENA bit in the
>  	 * PORT_ENA register, it can still send BPDUs. This depends on the tag
>  	 * configuration added when sending packets from the CPU port to the
> @@ -140,18 +149,38 @@ static void a5psw_port_tx_enable(struct a5psw *a5ps=
w, int port, bool enable)
>  	 * This allows to implement STP support when ports are in a state where
>  	 * forwarding traffic should be stopped but BPDUs should still be sent.
>  	 */
> -	a5psw_reg_rmw(a5psw, A5PSW_PORT_ENA, mask, reg);
> +	spin_lock(&a5psw->reg_lock);
> +
> +	if (enable)
> +		a5psw->tx_allowed |=3D BIT(port);
> +	else
> +		a5psw->tx_allowed &=3D ~BIT(port);
> +
> +	a5psw_port_tx_update(a5psw, port);
> +
> +	spin_unlock(&a5psw->reg_lock);
>  }
> =20
> -static void a5psw_port_enable_set(struct a5psw *a5psw, int port, bool en=
able)
> +static void a5psw_port_link_set(struct a5psw *a5psw, int port, bool up)
>  {
> -	u32 port_ena =3D 0;
> +	spin_lock(&a5psw->reg_lock);
> =20
> -	if (enable)
> -		port_ena |=3D A5PSW_PORT_ENA_TX_RX(port);
> +	if (up)
> +		a5psw->link_up |=3D BIT(port);
> +	else
> +		a5psw->link_up &=3D ~BIT(port);
> +
> +	a5psw_port_tx_update(a5psw, port);
> =20
> -	a5psw_reg_rmw(a5psw, A5PSW_PORT_ENA, A5PSW_PORT_ENA_TX_RX(port),
> -		      port_ena);
> +	spin_unlock(&a5psw->reg_lock);
> +}
> +
> +static void a5psw_port_enable_set(struct a5psw *a5psw, int port, bool en=
able)
> +{
> +	u32 rx_mask =3D BIT(port + A5PSW_PORT_ENA_RX_SHIFT);
> +
> +	a5psw_reg_rmw(a5psw, A5PSW_PORT_ENA, rx_mask, enable ? rx_mask : 0);
> +	a5psw_port_tx_enable(a5psw, port, enable);
>  }

[Severity: Medium]
Can a5psw_port_enable_set() and a5psw_port_stp_state_set() overwrite each
other's state in a5psw->tx_allowed?

Both callers update the same per-port bit in a5psw->tx_allowed via
a5psw_port_tx_enable().  When a bridged port in BR_STATE_DISABLED is
brought administratively up, dsa_port_enable_rt() calls ds->ops->port_enabl=
e()
without resetting the STP state:

net/dsa/port.c:dsa_port_enable_rt() {
    ...
	if (ds->ops->port_enable) {
		err =3D ds->ops->port_enable(ds, port, phy);
		if (err)
			return err;
	}

	if (!dp->bridge)
		dsa_port_set_state_now(dp, BR_STATE_FORWARDING, false);
    ...
}

a5psw_port_enable() -> a5psw_port_enable_set() then sets BIT(port) in
a5psw->tx_allowed, so once link comes up a5psw_port_link_set() enables
A5PSW_PORT_ENA_TX(port) even though the port is still in BR_STATE_DISABLED
(for example, while the bridge master itself is administratively down).
Conversely, when an administratively down port leaves a bridge,
dsa_port_switchdev_unsync_attrs() sets its STP state back to
BR_STATE_FORWARDING, setting BIT(port) in a5psw->tx_allowed while the port
is still down.

Tracking administrative enable and STP forwarding in separate bitmasks (or
checking both in a5psw_port_tx_update()) would prevent one from overriding
the other.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120002549.1908=
299-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D22

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2E4C77A4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193645; cv=none; b=MhCrfRsFSSPmzuZNYz0UU52E06/5lnnRP+ZXmv+xhFnk9aGAXrrI1BfYHN9UEqs4l9hpvDl4QLkhrA8tbqfMNMMhAkcgsF3kkzELIlBoH8ExMmhQrcnltO5Wpv+1j6IPVFNNUC9pRNFDFpLZfNP8ZmyweONXhBwI30/Bq0fYd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193645; c=relaxed/simple;
	bh=h4XmE2KMF2FlXMIZuuLEBA7AdugBRkgyv9aQm3krMII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZA167eFoqGvIsymv52IpFQH8NlN7wwFfwGFRsiaj/fnoWCOEHLF/mkNwo7QVwKbkKTepDEn9BGMg33s2a4WTCZOClbKX3ghGHGSPnLbw063mqnc7xH2cAFtj+K49Y6h8Yx1OvB4NFpD4hXv1DPiAgJmTVJRDnZaCycm0V9otY6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGTuEE8+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGTuEE8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543D3C2BCC6;
	Tue, 19 May 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193645;
	bh=h4XmE2KMF2FlXMIZuuLEBA7AdugBRkgyv9aQm3krMII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eGTuEE8+1sAz0sPiA2IA8I/ZB67ZH6CM2CVMWESAx6E8sajnbSljJ4v3ELcXjcNz1
	 KKKXD2AVueUlFRLNFmuyBewLPXNYf2Gwq1JX5GOFq73jXdmGo9fOTSYMn0UhqSsKox
	 CK039qDC+05BOzYxArRomfUX9FegsB96gQL1bAHQXLLJ+xp72nrxe/pqsllEmIJWCU
	 zNVEwM9vf8wj3XlhEN6l219ZViobQvsYPNVTQH5oZ3/UUt+wji6Xo5MOZLUWEJqCcP
	 yqvDwVL4Or6e2JSWJJa1EmWD5tE3Bdl4yliZYn9yWx+8SxkchL+wrCWl/CeOolRAsz
	 Ish299hzP0gJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 5/9] net: dsa: lan9645x: add bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-dsa_lan9645x_switch_driver_base-v5-5-968fbf34ffa3@microchip.com>
References: <20260518-dsa_lan9645x_switch_driver_base-v5-5-968fbf34ffa3@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:27:24 +0000
Message-Id: <20260519122725.543D3C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Race condition in `lan9645x_port_set_learning` leads to desynchron=
ized hardware learning configuration.
- [High] Stale STP forwarding state causes port to bypass STP and temporari=
ly forward traffic upon joining a bridge, creating Layer 2 loops.
--

commit 4eb2af719b5c6bdd492ea4fe37e94ac02ff39b74
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add bridge support

This commit adds hardware offloading support for a single bridge device
on the lan9645x switch.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> +static void lan9645x_port_set_learning(struct lan9645x *lan9645x, int po=
rt,
> +				       bool enabled)
> +{
> +	struct lan9645x_port *p =3D lan9645x_to_port(lan9645x, port);
> +
> +	p->learn_ena =3D enabled;
> +
> +	enabled =3D enabled && (p->stp_state =3D=3D BR_STATE_LEARNING ||
> +			      p->stp_state =3D=3D BR_STATE_FORWARDING);
> +
> +	lan_rmw(ANA_PORT_CFG_LEARN_ENA_SET(enabled), ANA_PORT_CFG_LEARN_ENA,
> +		lan9645x, ANA_PORT_CFG(port));
> +}

Can this race with lan9645x_port_bridge_stp_state_set() and result in
desynchronized hardware learning configuration?

lan9645x_port_set_learning() modifies p->learn_ena and reads p->stp_state
without holding lan9645x->fwd_domain_lock. Meanwhile,
lan9645x_port_bridge_stp_state_set() updates p->stp_state and reads
p->learn_ena while holding fwd_domain_lock.

Since lan9645x_port_bridge_flags() executes under rtnl_lock, but
lan9645x_port_bridge_stp_state_set() can execute asynchronously, could an
STP state change to BR_STATE_LEARNING interrupt lan9645x_port_set_learning(=
)?

If so, the hardware ANA_PORT_CFG_LEARN_ENA register might be written with 0
(from the stale BR_STATE_BLOCKING state) immediately after the STP change
wrote 1, permanently disabling hardware learning despite software indicating
it is enabled.

[ ... ]
> +static int lan9645x_port_bridge_join(struct dsa_switch *ds, int port,
> +				     struct dsa_bridge bridge,
> +				     bool *tx_fwd_offload,
> +				     struct netlink_ext_ack *extack)
> +{
> +	struct lan9645x *lan9645x =3D ds->priv;
> +	struct lan9645x_port *p;
> +
> +	p =3D lan9645x_to_port(lan9645x, port);
> +
> +	mutex_lock(&lan9645x->fwd_domain_lock);
> +	if (lan9645x->bridge && lan9645x->bridge !=3D bridge.dev) {
> +		mutex_unlock(&lan9645x->fwd_domain_lock);
> +		NL_SET_ERR_MSG_MOD(extack, "Only one bridge supported");
> +		return -EBUSY;
> +	}
> +
> +	/* First bridged port sets bridge dev */
> +	if (!lan9645x->bridge_mask)
> +		lan9645x->bridge =3D bridge.dev;
> +
> +	lan9645x->bridge_mask |=3D BIT(p->chip_port);
> +	__lan9645x_port_set_host_flood(lan9645x);
> +
> +	mutex_unlock(&lan9645x->fwd_domain_lock);
> +
> +	/* Later: stp_state_set updates forwarding */
> +
> +	return 0;
> +}

Does this leave the port in a stale STP forwarding state upon joining the
bridge, potentially creating Layer 2 loops?

Standalone ports are placed in BR_STATE_FORWARDING by DSA, which sets
their bit in lan9645x->bridge_fwd_mask via
lan9645x_port_bridge_stp_state_set().

When a port joins a bridge, this function adds it to lan9645x->bridge_mask
but does not clear the stale bridge_fwd_mask bit or reset its internal
stp_state.

The bridge core queues the port's initial BR_STATE_BLOCKING state
asynchronously. If another port's STP state update is processed during this
window, lan9645x_update_fwd_mask() is triggered.

Since the newly joined port is in both bridge_mask and bridge_fwd_mask,
will the hardware be immediately programmed to forward its traffic, bypassi=
ng
the STP listening/learning phases?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-dsa_lan964=
5x_switch_driver_base-v5-0-968fbf34ffa3@microchip.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB8F26ED59
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102214; cv=none; b=ARgo5yIIDqrKxAP3wvBFKRyYTTbn0nswsW2sVq2QDgsjAQ6+aJ+VhiKxj2f/0OofGMQaaBZJKGuMntHYkoEqC2g2gdlQLEx4jWdaflTJDzqx8L/nFDYTJOzdUCDuLxlNDO3tSw3VyvFOQjHcYayOt5Hzb47QWtU5zqp7HkaCg6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102214; c=relaxed/simple;
	bh=ULZnykkdO/ZFXgqLi52VatwZuFZfFKgPfgettPbNSK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HItw87x/CqIoQ1mlUChpMzOSl2/OPgeUfeAEXTu1glwFowwg/GgYDAUMgUZSvUT++cZ2QbkAhAy/pjDVyt9rnOTtZIQXNQaaNcsKfVbvfvV33wC0tKyT9bM/Z94C52/j1DI/+iwMNly73VbbqpASSE4vyddd8yv/6dkALfqxNoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esGKV0fQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esGKV0fQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9531F00899;
	Sat, 30 May 2026 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102213;
	bh=dOywTM+CC01nkuzdcDMaKGONTL3I0BcwxaDDnmcPXDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=esGKV0fQmqljCPyQ4v+NkH9W6GQmqOitpoVLF8GxpevcGTtXY55avDJrvgFahFe8T
	 DcP8HZL6JBkvpsesyuu2NLUcQzdisCZ+5VD6qmCAUJAn+QrtZvNKAkrw4RZPgCbfvZ
	 8RMdsvDK5nf3LRbdvMroLtHjmb4wevD9nAZo/Azk6Jm+jQwKYpJDI86H17YbMwtEU8
	 HdFJnigblUoNMj8eh1ycD2pfSNUDJgy/7+TSopZ9lG7whtX8mKMW/A46zfe8inui2Z
	 UdVZNmEHYwRufblwknsBqeYx8F2ld2HI+Rd6t/mR+BngzpC8jDg83fBDjTR2OsslbB
	 1qFMP+92GSS7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 5/9] net: dsa: lan9645x: add bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-5-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-5-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:13 +0000
Message-Id: <20260530005013.8B9531F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Failure to clear `bridge_fwd_mask` and `stp_state` when a port lea=
ves a bridge allows a stale forwarding state to persist, creating a race co=
ndition that can lead to temporary Layer 2 loops.
--

commit 31a25a746a8f28de119e2a7f8f9439f1cb05b67f
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add bridge support

This commit adds hardware offloading support for a single bridge device
to the lan9645x DSA switch driver.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -269,6 +292,278 @@ static void lan9645x_port_phylink_get_caps(struct d=
sa_switch *ds, int port,
[ ... ]
> +static void lan9645x_port_bridge_leave(struct dsa_switch *ds, int port,
> +				       struct dsa_bridge bridge)
> +{
> +	struct lan9645x *lan9645x =3D ds->priv;
> +	struct lan9645x_port *p;
> +
> +	p =3D lan9645x_to_port(lan9645x, port);
> +
> +	mutex_lock(&lan9645x->fwd_domain_lock);
> +
> +	lan9645x->bridge_mask &=3D ~BIT(p->chip_port);

[Severity: High]
Does leaving a port in the forwarding mask when it is removed from a bridge
create a race condition if it rejoins the bridge later?

If bridge_fwd_mask and stp_state are not cleared here in=20
lan9645x_port_bridge_leave(), the stale forwarding state persists.

When the port later rejoins the bridge, lan9645x_port_bridge_join() sets the
bridge_mask bit again. There is a small window before the DSA core calls
port_stp_state_set() to explicitly initialize the port to BR_STATE_BLOCKING
(which would clear the bridge_fwd_mask bit).

If a concurrent STP state change for another port in the bridge executes via
the switchdev workqueue during this exact window, it will call
lan9645x_update_fwd_mask(). The mask calculation bridge_mask &
bridge_fwd_mask will falsely include the newly joined port, prematurely
programming the hardware to forward traffic to and from it.

Could this bypass the STP blocking phase, creating a vulnerability to
broadcast storms and temporary Layer 2 loops?

> +
> +	/* Last port leaving clears bridge dev */
> +	if (!lan9645x->bridge_mask)
> +		lan9645x->bridge =3D NULL;
> +
> +	__lan9645x_port_set_host_flood(lan9645x);
> +	lan9645x_update_fwd_mask(lan9645x);
> +
> +	mutex_unlock(&lan9645x->fwd_domain_lock);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D5

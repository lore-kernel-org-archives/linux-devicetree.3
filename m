Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B98F3CF678
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027122; cv=none; b=oAFeIAwp2sFL84dt7TwGAa1e9Y+wxbjCI6iayGfuYY8stOyPnoHKU6YpfiDjlJc2zpeC+sVhTWSS5y/PT8tLp9XHtbX5tX+BibIpj6pvOMNqgTIYtD9YL5thjQLyDR5nIWGJ+prCL077UkemLvggxkFO5g5dubjOjRSH4EWO4As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027122; c=relaxed/simple;
	bh=2E9EqnXxArvlzoj5rXvcXBQj1icqrtrKovwhJWCgMy4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YYDq2T78Lw+TnuxCtLt3MihuQa4PCqDZbcwKUp0srtp1LKS2nivZyAHRXYzn/Z6jm0w/9AwspTGqUWOGKMki2Rdm9G4yOCMZqCGpGo0hsOK56Wj10ktF5ZVj7pd4a/O7dfs3ArwVo0agwn0pFBcKganaqmOKbO75MITtpUP6Ekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEAO1ZCf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEAO1ZCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FCC1F00A3A;
	Thu,  6 Aug 2026 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027120;
	bh=lf2cQbX0CboNL0SavEL2yve359kSktCznK7AdhnwGQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XEAO1ZCf+pbEBXB8sHspea3+EwhUTib0d+apy7hlWjDaqCabJQag+2t9g14+pG1C5
	 Z1iNc/QDyEDIygz0+HMX4qNx+UCD1zbHwetOmTa2KyYLyKmo1VMBHlg89I1z7BLJ9m
	 3ylhPQ/q346PA3j62j5E6RnX/9XYztE1jO1haBOmSs3RGCGIDCF5XFKH8ICBLC8M/e
	 CEGcew5Q4pyxccDo5VXfEXsDeZ8L1DoaFblUUNh7jPAflLVmTgqwqyCpBk1GMS1CZU
	 c0HetPAjYNyi1Jbh+kOdP0385B/eGY0y5oPy1ZPGxyM8IX6v1R7XMOSj0DMv4XEdwj
	 uiIJOvo0ioaXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 5/9] net: dsa: lan9645x: add bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-dsa_lan9645x_switch_driver_base-v11-5-007ebc983a0a@microchip.com>
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-5-007ebc983a0a@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:38:39 +0000
Message-Id: <20260806143840.00FCC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware learning is not disabled when a port leaves a bridge, cau=
sing cross-port FDB pollution that breaks software bridging/routing for sta=
ndalone ports.
--

--- Patch [5]: [PATCH net-next v11 5/9] net: dsa: lan9645x: add bridge supp=
ort ---
commit f959003f0679008432479a15ff4b25747ede3826
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

    net: dsa: lan9645x: add bridge support

Add support for hardware offloading of the bridge. We support a single
bridge device.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> index b253813518c20..c145d28ffbb99 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -282,6 +305,282 @@ static void lan9645x_port_phylink_get_caps(struct d=
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

[Severity: High]
Does this code need to clear p->learn_ena when a port leaves the bridge?

When a port is removed from the hardware bridge, its learning state incorre=
ctly
remains enabled. If this port and another port are later added to a software
bridge (for example, if the hardware only supports one offloaded bridge), t=
he
DSA core transitions the standalone port to BR_STATE_FORWARDING.

Because p->learn_ena was not cleared during bridge leave, the call to
lan9645x_port_bridge_stp_state_set() will incorrectly re-enable hardware
learning for the standalone port:

	learn_ena =3D (state =3D=3D BR_STATE_LEARNING ||
		     state =3D=3D BR_STATE_FORWARDING) && p->learn_ena;

	lan_rmw(ANA_PORT_CFG_LEARN_ENA_SET(learn_ena), ...

This causes the port to learn MAC addresses into the shared HOST_PVID FDB u=
sed
by standalone ports. When the other software-bridged port (which expects to
send unknown unicast traffic to the CPU) receives traffic for a MAC dynamic=
ally
learned by this port, the hardware resolves the destination.=20

However, since PGID_SRC for standalone ports is 0, the packet is silently
dropped in hardware instead of being forwarded to the CPU, breaking network
connectivity for the fallback software bridge.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-dsa_lan964=
5x_switch_driver_base-v11-0-007ebc983a0a@microchip.com?part=3D5

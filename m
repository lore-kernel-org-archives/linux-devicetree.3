Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08544AB9A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027122; cv=none; b=LMzXu7MCGqRmkDq8c3i667hdXnSZFKFvsrjt19J1pUTxlFmayfWFmO2C89songyoanX6cYLBu6hHNW84gueBS0cePf+zPdI7VImnpnM9w/RZlq7sjXMZvcci5mfsS7WQDO7s6S1Z9IaBiQiy/kXFITjccoxah/ELERZseWlEnHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027122; c=relaxed/simple;
	bh=pvq6kJH2GZ+7/ReKI9OWAZGmyJr3oMWcm3Y5ZT3ZA5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kbE81yW0somzlWs3dJr8G88CdlOBHLpI4UFGVGlkEfBtko7LZViOyu9v3nHUFS7z5eBgqLsgiw9yiGzTW5X30vhcUM+VGnZqzkTEwaYTlRkz3obvkZ/PT75XNtHrlFK/Oia2cs/VpXeVLb/L/zeyd1OuWv3eeVGFzg0Gr1/pcZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwfVF045; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwfVF045"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91801F000E9;
	Thu,  6 Aug 2026 14:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027118;
	bh=DQZX4Y13ap5I5IttCAVZciuJAWACdse+/k21URXQR+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lwfVF045XQxm1+R94FBxV+AVbsGt3rapb6VbnjkKJh9CBrOWoxeXcRHJc+66cx8Pb
	 FEHL1QE1Epb+RykGn1gEPesMkVcddAGgdhE5DRBLJx6P71Xq0Fh0VkIle4z6610diT
	 BA0Gk80N3SNc5IzSoLE0guIlvzFpwIECnpCHygMHatGdaS5S94bCpXe7RUTs0ezWM/
	 LZJozG8jpmbtJ1xalXB0sDubgLN1qCuqbLZ+UTodUCmJ/q7X80mdI4fyMhAjdfouAk
	 j1NMFg9vPFn5pNAPwqwi96OkLnbvblh0JQ0vMWPVlr3x5UsXu6tSIr1u3UV5xjUIaa
	 JzvWQ+hWsNqjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-dsa_lan9645x_switch_driver_base-v11-4-007ebc983a0a@microchip.com>
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-4-007ebc983a0a@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:38:37 +0000
Message-Id: <20260806143838.A91801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Standalone ports drop all normal data plane traffic destined for t=
he CPU because the CPU port module is missing from the source port forwardi=
ng masks (PGID_SRC) and the flooding masks (PGID_UC, PGID_MC).
- [Medium] Pause frame start watermark (PAUSE_START) exceeds the port's max=
imum allowed memory (ATOP) for jumbo frames, breaking flow control and caus=
ing silent tail drops.
--

--- Patch [4]: [PATCH net-next v11 4/9] net: dsa: lan9645x: add basic dsa d=
river for LAN9645X ---
commit dd8bddd9c4ac1f2dbff1feda2560552c682fa913
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Date:   Wed Aug 5 14:34:52 2026 +0000

    net: dsa: lan9645x: add basic dsa driver for LAN9645X
   =20
    Add the LAN9645X basic DSA driver with initialization, parent regmap
    requests, port module initialization for NPI, CPU ports and front ports,
    and phylink integration for MAC side configuration.

> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> +static int lan9645x_setup(struct dsa_switch *ds)
> +{
[ ... ]
> +	/* Disable bridging by default */
> +	for (int p =3D 0; p < lan9645x->num_phys_ports; p++) {
> +		lan_wr(0, lan9645x, ANA_PGID(PGID_SRC + p));
> +
> +		/* Do not forward BPDU frames to the front ports and copy them
> +		 * to CPU
> +		 */
> +		lan_wr(ANA_CPU_FWD_BPDU_CFG_BPDU_REDIR_ENA,
> +		       lan9645x, ANA_CPU_FWD_BPDU_CFG(p));
> +	}
[ ... ]
> +	/* Multicast to all front ports */
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MC));
> +
> +	/* IP multicast to all front ports */
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MCIPV4));
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MCIPV6));
> +
> +	/* Unicast to all front ports */
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_UC));

[Severity: High]
Does this configuration drop normal data plane traffic intended for the CPU=
 on
standalone ports? Setting the source forwarding mask (PGID_SRC) to 0 for all
user ports seems to block them from forwarding frames to any destination,
including the NPI or CPU port module.

Furthermore, deriving front_ports from dsa_user_ports(ds) excludes the CPU
port from the flooding masks. Should the CPU port be included in the source
forwarding and flooding masks to ensure host traffic is not blackholed?

> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
[ ... ]
> +void lan9645x_port_set_tail_drop_wm(struct lan9645x *lan9645x)
> +{
> +	int shared_per_port;
> +	struct dsa_port *dp;
> +
> +	/* Configure tail dropping watermark */
> +	shared_per_port =3D
> +		lan9645x->shared_queue_sz / (lan9645x->num_phys_ports + 1);
> +
> +	/* The total memory size is divided by number of front ports plus CPU
> +	 * port.
> +	 */
> +	dsa_switch_for_each_available_port(dp, lan9645x->ds)
> +		lan_wr(lan9645x_wm_enc(shared_per_port), lan9645x,
> +		       SYS_ATOP(dp->index));
[ ... ]
> +int lan9645x_port_set_maxlen(struct lan9645x *lan9645x, int port, size_t=
 sdu)
> +{
> +	struct lan9645x_port *p =3D lan9645x_to_port(lan9645x, port);
> +	int maxlen =3D sdu + ETH_HLEN + ETH_FCS_LEN;
[ ... ]
> +	/* Set Pause WM hysteresis */
> +	lan_rmw(SYS_PAUSE_CFG_PAUSE_STOP_SET(lan9645x_wm_enc(4 * maxlen)) |
> +		SYS_PAUSE_CFG_PAUSE_START_SET(lan9645x_wm_enc(6 * maxlen)),
> +		SYS_PAUSE_CFG_PAUSE_START |
> +		SYS_PAUSE_CFG_PAUSE_STOP,
> +		lan9645x,
> +		SYS_PAUSE_CFG(p->chip_port));
> +
> +	return 0;
> +}

[Severity: Medium]
Will jumbo frames hit the tail drop watermark before triggering flow contro=
l?

The tail drop watermark (SYS_ATOP) in lan9645x_port_set_tail_drop_wm() appe=
ars
to be statically set to around 16KB. However, PAUSE_START dynamically scales
with maxlen (6 * maxlen) in lan9645x_port_set_maxlen().

For MTUs larger than roughly 2.7KB, PAUSE_START will exceed SYS_ATOP. Could
this cause the port to silently drop frames because it hits the tail drop
limit before ever reaching the threshold to emit pause frames?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-dsa_lan964=
5x_switch_driver_base-v11-0-007ebc983a0a@microchip.com?part=3D4

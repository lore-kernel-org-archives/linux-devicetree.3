Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548224C77A4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193644; cv=none; b=JsKA9bawQRZ4NG8XRVr0u2xygaqnDD7SP6rkQl7OtbCwOP4xUM5/A9snu3umX3rd4l+eRdtuQckiis0sIbbAD5zg011vFcNi2uPLKNh3QT6roU/yCtT6zSRuFo3WBxevF0Re8a5wJQsvZHVaWAJsKNwreVmSfTeun0dnkoQz10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193644; c=relaxed/simple;
	bh=b8XdmDpJ8+sqXU7+xdj3eIVFSjWIMIKRZoV2rpUnpN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FfvZpD4PSy9rtqb+Ar9kUFZLXYV4kkKAaarEH1Q4iB8TaPwiIrM1MF7v+2urUEagccK1YbW6kuZYcCRKMdt+29/vFV4clo/E662z9+aNyX96vEocNxnel8EEyNAaXXw2npPwcbhsz32UuLAmXxoaxdk3oTpFjc1BKc2+mHRxYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlYe6nVQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlYe6nVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F96C2BCB8;
	Tue, 19 May 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193644;
	bh=b8XdmDpJ8+sqXU7+xdj3eIVFSjWIMIKRZoV2rpUnpN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WlYe6nVQKNOL41Hx4pgOK8X/5UoT6r+6vgaLyBP6EQ/NSvDeBIZdbjwhWQWDWu7Wy
	 XLgIcDhgu+h8mFhqF3cmPfBv7HNP+QhW4uEWPdkkY2gvDK9KOOEt3nt6KP5VfDLZKt
	 kqskG3zuGTZc70sdSH0fSQjCURCdOSSyfcRgHP7Yh4dcR5/pWmx6ldxAlAFmSscSJZ
	 a1y+S1l7wkfL5VPH7gRGd5tyWFqWdUlFR4Q0O/4wdCSpxYkBSPnZr2f3zIpPP75rM5
	 Pw2Q+hyfP9IaFVo4p8BtqajN9qI5C2dzg/RCSvBMJP2uJIpIPHRJELcSdjcIDUZ0V1
	 ONJTC0fnmBpmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-dsa_lan9645x_switch_driver_base-v5-4-968fbf34ffa3@microchip.com>
References: <20260518-dsa_lan9645x_switch_driver_base-v5-4-968fbf34ffa3@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:27:23 +0000
Message-Id: <20260519122723.A7F96C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Setting PGID_SRC to 0 for all front ports prevents traffic from re=
aching the CPU port.
- [High] Tail-drop watermark `SYS_ATOP` is not initialized for the internal=
 CPU port, causing CPU extraction frames to be dropped.
- [Medium] Time-of-check to time-of-use (TOCTOU) race condition during RGMI=
I_0 hardware mux collision check.
--

commit dd42e20749a1e5409bdf3c001b0f05f884ed6287
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Subject: net: dsa: lan9645x: add basic dsa driver for LAN9645X

This commit introduces a basic DSA driver for the LAN9645X switch family.
It includes initialization, port configuration, NPI setup, and phylink
integration for the internal CuPHYs and RGMII ports.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -215,22 +215,10 @@ static int lan9645x_setup(struct dsa_switch *ds)
>  	for (int i =3D 0; i < PGID_ENTRIES; ++i)
>  		lan_wr(ANA_PGID_CFG_OBEY_VLAN_SET(1),
>  		       lan9645x, ANA_PGID_CFG(i));
> =20
>  	/* Disable bridging by default */
>  	for (int p =3D 0; p < lan9645x->num_phys_ports; p++) {
>  		lan_wr(0, lan9645x, ANA_PGID(PGID_SRC + p));

Does setting this mask to 0 filter out all traffic destined for the CPU
port? If BIT(CPU_PORT) is not included in the source port mask, it appears
normal networking packets (like ARP or IP traffic) won't reach the host
network stack. Should BIT(CPU_PORT) be included here?

> =20
>  		/* Do not forward BPDU frames to the front ports and copy them
>  		 * to CPU
>  		 */
>  		lan_wr(ANA_CPU_FWD_BPDU_CFG_BPDU_REDIR_ENA,
>  		       lan9645x, ANA_CPU_FWD_BPDU_CFG(p));
>  	}
[ ... ]
> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c b/driv=
ers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
[ ... ]
> @@ -105,37 +105,25 @@ static int lan9645x_phylink_mac_prepare(struct phyl=
ink_config *config,
>  	/* RGMII_0 is a 2:1 mux shared between port 4 and port 7. Reject
>  	 * collisions by looking at current hardware state: the driver
>  	 * maintains the invariant that RGMII_0_CFG=3D1 iff port 4 owns
>  	 * RGMII_0, and for port 7 when GMII_ENA bit 7 is set this implies port
>  	 * 7 owns RGMII_0.
>  	 */
>  	if (is_rgmii) {
>  		hw_cfg =3D lan_rd(lan9645x, HSIO_HW_CFG);
>  		gmii_ena =3D HSIO_HW_CFG_GMII_ENA_GET(hw_cfg);
> =20
>  		if (port =3D=3D 4 && (gmii_ena & BIT(7)))
>  			return -EBUSY;
>  		if (port =3D=3D 7 && (gmii_ena & BIT(4)) &&
>  		    HSIO_HW_CFG_RGMII_0_CFG_GET(hw_cfg))
>  			return -EBUSY;
>  	}
> =20
>  	lan_rmw(HSIO_HW_CFG_GMII_ENA_SET(BIT(port)),
>  		HSIO_HW_CFG_GMII_ENA_SET(BIT(port)), lan9645x, HSIO_HW_CFG);

Can this code race if phylink invokes mac_prepare asynchronously for ports
4 and 7?

Since the read of HSIO_HW_CFG and the subsequent update via lan_rmw() are
not serialized by a driver-level lock, could both threads concurrently pass
the collision check and overwrite the multiplexer ownership?

> =20
>  	if (port =3D=3D 4) {
>  		lan_rmw(HSIO_HW_CFG_RGMII_0_CFG_SET(is_rgmii),
[ ... ]
> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_port.c
[ ... ]
> @@ -77,21 +77,15 @@ void lan9645x_port_set_tail_drop_wm(struct lan9645x *=
lan9645x)
>  {
>  	int shared_per_port;
>  	struct dsa_port *dp;
> =20
>  	/* Configure tail dropping watermark */
>  	shared_per_port =3D
>  		lan9645x->shared_queue_sz / (lan9645x->num_phys_ports + 1);
> =20
>  	/* The total memory size is divided by number of front ports plus CPU
>  	 * port.
>  	 */
>  	dsa_switch_for_each_available_port(dp, lan9645x->ds)
>  		lan_wr(lan9645x_wm_enc(shared_per_port), lan9645x,
>  		       SYS_ATOP(dp->index));

Does this loop configure the tail drop watermark for the internal CPU port?

The division accounts for the CPU port (num_phys_ports + 1), but
dsa_switch_for_each_available_port() only iterates over the physical ports
known to the DSA core. If SYS_ATOP(9) remains uninitialized at 0, will
frames forwarded to the CPU extraction queues be immediately dropped?

> =20
>  	/* Tail dropping active based only on per port ATOP wm */
>  	lan_wr(lan9645x_wm_enc(lan9645x->shared_queue_sz), lan9645x,
>  	       SYS_ATOP_TOT_CFG);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-dsa_lan964=
5x_switch_driver_base-v5-0-968fbf34ffa3@microchip.com?part=3D4

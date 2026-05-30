Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62EE2DE70D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102215; cv=none; b=pX2nMGURzvIKRkdIsrfr3a/h7tK+qsdDlXfazvoLo11E6Z7U7FjcmYUsjcHI2Af9L56MsvhgSeGuRwHzeFVtl94qDq7UPQeInsNZbCfvhAsIIQNbT+G2jZVDt30br5XOeDlpB8dumNKLdb4MiyQZdnM3plvGhJsL7pv4oRvf614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102215; c=relaxed/simple;
	bh=1fPAKwXdhhTOBcLOUwlEmpcLnndrxAwubswrVsAeXk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q66DhWj2nzTR5124qC5yzdq3ABScYgwyoZBx88MJ70gTvbhyw96psHxQGGUa6RLvC23NDrlXeRRydOFFvZBGxp6Vy/h51/c4Q5NyhH0VcNwYhf5AxwVtv75gXbUuN9F8y6R4rXV+2nw3RHFYmGw/9gX7YbHuLE+crSYDRVeIrsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDV1OByU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDV1OByU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503F01F0089A;
	Sat, 30 May 2026 00:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102214;
	bh=gnakwWo2poZ7NEmJWoSQ/yrXMnMspRwNWfVwv0dhOt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bDV1OByUalTlJMhDNk/OVW4v2odyfX4xCdt/ewMhVHUTEtBYA/cyZ/35+iq6uOQwR
	 MBZDHlYiiiBNRv8c9+Xxbdz9ThIC2jiL8fcM5ozCsKj2yh95szgDC1Q9takLIZMxAa
	 bbD4luL44PdosvXcW2fmHmYRIH4vrao+471WDewKWxqg6cTtW9jKMZCOU2kEsHDCRO
	 xYrp1fm9drJOhe3Oaj4uWMXxYDk/ygSGYwDnurD+a26rrCecfCY82Mapt5IjCWWa6w
	 4Jv+gEHFr/IxkNNgP4fskRO3zJqUxMRbJjkxbxWKbXigS/1mIohodbk8IazGWyDS2b
	 WcZJW42kDMs7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 6/9] net: dsa: lan9645x: add vlan support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-6-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-6-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:13 +0000
Message-Id: <20260530005014.503F01F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] lan9645x_port_vlan_filtering clobbers the CPU (NPI) port's egress =
tagging configuration
--

commit 6fffecbf30e0b6af9ee79a8cd06c0280fc266991
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

    net: dsa: lan9645x: add vlan support
   =20
    Add VLAN support for VLAN-aware and VLAN-unaware bridges.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> index 9d8f3a1b335bd..eb13dfadbd3cf 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -559,11 +563,52 @@ static void lan9645x_port_bridge_leave(struct dsa_s=
witch *ds, int port,
[ ... ]
> +static int lan9645x_port_vlan_filtering(struct dsa_switch *ds, int port,
> +					bool enabled,
> +					struct netlink_ext_ack *extack)
> +{
> +	struct lan9645x *lan9645x =3D ds->priv;
> +	struct lan9645x_port *p;
> +
> +	p =3D lan9645x_to_port(lan9645x, port);
> +	p->vlan_aware =3D enabled;
> +	lan9645x_vlan_port_apply(p);

[Severity: High]
Does this code inadvertently clobber the CPU (NPI) port's egress tagging
configuration?

When VLAN filtering is toggled on a user bridge port, the DSA core
synchronizes this state to the CPU port by calling port_vlan_filtering().
Here, the driver unconditionally delegates to lan9645x_vlan_port_apply(),
which executes both ingress and egress VLAN application:

lan9645x_vlan_port_apply() {
        lan9645x_vlan_port_apply_ingress(p);
        lan9645x_vlan_port_apply_egress(p, NULL);
}

Because the CPU port is typically non-bridged,
lan9645x_vlan_port_apply_egress() will overwrite the REW_TAG_CFG register
with LAN9645X_TAG_NO_PVID_NO_UNAWARE:

lan9645x_vlan_port_apply_egress() {
        ...
        if (!lan9645x_port_is_bridged(p)) {
                tag_cfg =3D LAN9645X_TAG_NO_PVID_NO_UNAWARE;
        ...
}

The driver correctly avoids applying egress tagging to the CPU port in other
places. For example, lan9645x_port_setup() explicitly skips
lan9645x_vlan_set_hostmode() for the NPI port, and
lan9645x_vlan_cpu_add/del() only update ingress state.

Without a similar guard (such as checking p->chip_port !=3D lan9645x->npi) =
in
this function, toggling VLAN filtering might push unexpected 802.1Q tags
onto frames extracted to the host, breaking DSA tag parsing and software
forwarding.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D6

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739513;
	b=TZi4vhMh+Quysq9lHgMekilr3nH+b1BhBDDXkopDFux4BG0XG3A3YBfzcFQZe6v3JziY
	 d6HtnuoIKGm98J9u0vDICqBHHay6C7sPNTcyyUmKHblkQ2+EG1Uo2tnpA254UOF4fz1fh
	 ioWVkIBJzBo/70qOXDgv/9Bakm2dLa2pdnFbdTpeQqspxhB3Whzjju1IGcB58Shf5M+Td
	 7nVvH2sgL7b8rsVQHgig4xnUDaIDqQ1Si7rSBp/hsN5TkquzRPn4cFvX0kLVuZAagQEdx
	 j68hW31lHC+Zfg7eMZvE0U/Gfg0e7JhDf1R1PYmnjCiGm2urNz/chdvK2Hn3kL0TEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739513;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wX8dMhY1Qs9sToqpnCnbQlZQDN8hZpN8UBBz1ho00BU=;
	b=jBkprR4qCDhrHjGgmdk8NCT6tOnfVbC1xF4JIeXA6d+RuXXb/0cOnMYxyEh61Q2j0Vfv
	 H3+TNY0gng8DPXKnooa6Vdzka1gEHt5THjl+lKcUYxKlMUvQnupM38JptbCvpU2Hc/sgI
	 LlqqBfO1j22QEW55YkY4O3YHn6dlgsstYvo2wcGmFtxmTjkFH9rEVL/KOlef3yaSMbvYx
	 rjhnvF+V2kvePa8t60iaNxVW+kQ5q2KuB7qbrKKLtIf7h8TDvnNI+iB04vktsFpDM9UxT
	 3AEiG6+/nBYmc8/ywItPPPPfxrSD9zfo/L5Iq38UUelnwaHAnacHfZVz+p2VUKgG8Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8jw4W8r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13AA606A334
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8jw4W8r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1D01F000C6;
	Sun, 15 Nov 2026 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739513;
	bh=wX8dMhY1Qs9sToqpnCnbQlZQDN8hZpN8UBBz1ho00BU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8jw4W8ro1yAD+6JtM+Qjl/qIVb7Cm2qg4VHXC+W4DZBQe7aOsEXcFFIqEUf6jXAh
	 F/dC/RfOHT6rHCMzuvDiXKh4ULGFQH7NFv7Gr0Zhc08Vcai+235Eu4rgFspdbdOGGo
	 UADhdp6dJBqepatb1Q7bH9UynBJxvT0oo+lJLYM8bKdx06fMs48lpC6cCm+/5Wl6LJ
	 rA2GUcvF9knLzHQbRV6DFy6e8gWxlfwGXgMyzdTZiv8DpEvDIcJk4KylAc6BltLFmo
	 GKDO3stVAV1ynkZUO46lK0u6j4djUvZ98QkhCqT45ttQL3vvApchLmZXPdBHAQjSrg
	 96l/rPoOrLhJw==
Message-ID: <sashiko-outbox-215392@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 01/15] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-2-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:12 +0000
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
- [Low] net: phylink: use pl->supported_interfaces in
  phylink_create_sfp_cage_port()
--

commit 93205d49f980ea49e825ec43738fa0a2070e098a
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: keep and use MAC supported_interfaces in phylink struct

This commit copies supported_interfaces from phylink_config into struct
phylink and updates phylink to read from the internal copy in preparation
for dynamic PCS handling.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e885da1c28311..6c339b25926cc 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, =
struct phy_device *phy)
> =20
>  	/* Set the PHY's host supported interfaces */
>  	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
> -			  pl->config->supported_interfaces);
> +			  pl->supported_interfaces);
> =20
>  	phy_set_upstream_port(phy, pl->sfp_cage_port);
> =20

[Severity: Low]
Should phylink_create_sfp_cage_port() also use pl->supported_interfaces
when populating pl->sfp_cage_port->interfaces?

drivers/net/phy/phylink.c:phylink_create_sfp_cage_port() {
    ...
	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
			  phylink_sfp_interfaces);
	phy_port_update_supported(port);
    ...
}

When pl->supported_interfaces is later updated from attached PCS
instances, leaving phylink_create_sfp_cage_port() on
pl->config->supported_interfaces causes pl->sfp_cage_port->interfaces and
the downstream SFP module phy_port supported link modes in
phylink_add_sfp_mod_port() to omit PCS-supported SFP interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D1

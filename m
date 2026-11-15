Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739514;
	b=pSEYx5MZbIDvAj4ZId0TFUSSkQpLoi4flevzEtN85KQuM6bhlO2bYbOsEpHkA3r2hBID
	 MB5paQiaPcJNAheLvQOMokiw0tm+UCWnD1Y1nIAVgRpauP2lEDFbdHC9dkQApEtMsuCyk
	 64g+QAkR1efaPKnEoBLBhBWgz9pBMOVAwuYUe+95r10XMosYKHzpj6LkOn2tOw6/5b7xB
	 JRRqd7aYK1UpTL2gaQ/d5Abi04jVQIOryYd1B0k8detT3rOv6KCYdJa6wAE3j87FklFVX
	 ng4bntu/OLZeYMk8VPsBIfRmaa0Rt0sr1IqONDezvwrlFvpAnTzaF19VMoLUngIwZfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9A5Czp89batg47LOjvFAEddRzCQ20x8w0RY8yX87Xm0=;
	b=kOV7r/nygsPfcvM5Ftjc0MZSCsJ3PfWoCfMJ0zcuyGXYMMg1ZZnwxpw+ey+QOWZq4/+P
	 R6flbcvZgMUn1Tc5ZSe7Qzb3CbsxhUd/iPeUEyv+Pf1es5ifWebI45+KtQimU/lTJCSsf
	 755bopd9nI5IZh6c2P+vADeGVxuKayoKYggcP0ONY57kgi3PMb1f2fkaX7NDTlChQYbkA
	 0f7a563pOuMo+rsEZt0UJUgEzVCUMa3CAFVJ3aC9IY+gQ+cz3bhv4v42A+sRTAZO+TZda
	 7WYJpfYntG6erlUe2CUEuFBSw3jHvD8n1ssQU5CrGsg2dhL0ZSLuBL2bd8Zo52nzDLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSNBpWKP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F3606A33D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSNBpWKP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DF21F0092B;
	Sun, 15 Nov 2026 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739514;
	bh=9A5Czp89batg47LOjvFAEddRzCQ20x8w0RY8yX87Xm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSNBpWKPhy+2L2AF+H+E31GvNpzowk3/bklv1T8ykQVUOG3JS+caZQO15BjJ7igsB
	 consWNHnJgC0EeJBhywI4bjT5QkyLw/XWG0nBX5YjAfyVcw077+VzeymWFX/5RLLyT
	 zoUyMRf0TH07GN+hBd2AtdTtUVJBRkab7/wWcx3sMSKIRYiZ+ubfudR7icQ7OEH6EU
	 btLBsdxpZifKmFfLl1S9NhEhtkHTD3DZj6/G/sD2gh2P8u8hfAXdubMTB60etRg2Yy
	 b71xO8FT6YzV+vnCauGw6pZ/k0jw9PQoXBb3DB1V/S6LdRBGXyJOsRXL7NLkyQ/609
	 9QCUA67csebXg==
Message-ID: <sashiko-outbox-215394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 03/15] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-4-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: phylink: missing error return in
  phylink_validate_mac_and_pcs()
- [Medium] net: phylink: broken PCS interface filtering in
  phylink_create()
--

commit 68a6b41cb9652b8b9ee28ac370dd9685425db77b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces internal PCS tracking and selection in phylink via a
per-instance PCS list populated through .fill_available_pcs, as an
alternative to the .mac_select_pcs callback.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 51c147eb8c2b6..35bfdffc86ba8 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -535,6 +554,21 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		struct phylink_pcs *tmp;
> +
> +		list_for_each_entry(tmp, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
> +				pcs =3D tmp;
> +				break;
> +			}
> +		}
>  	}

[Severity: Medium]
Should phylink_validate_mac_and_pcs() return -EINVAL when state->interface =
is
set in pl->config->pcs_interfaces but no matching PCS is found in
pl->pcs_list?

When no PCS in pl->pcs_list supports state->interface, pcs remains NULL and
phylink_validate_mac_and_pcs() skips the if (pcs) block, validating the mode
against MAC capabilities alone and returning 0.  Unsupported PCS-dependent
interface modes then pass validation during phylink_create() or SFP/PHY
setup, only to fail later in phylink_major_config() when !pcs sets
pl->major_config_failed =3D true.

Also, this isn't a bug, but the pl->pcs_list lookup loop is duplicated acro=
ss
phylink_validate_mac_and_pcs(), phylink_inband_caps(), and
phylink_major_config() and could be moved into a helper.

[ ... ]

> @@ -2096,16 +2220,31 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		rcu_assign_pointer(pcs->phylink, pl);
> +
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);
> =20
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Medium]
As reported by Maxime Chevallier on v7 [1], does ORing
pcs->supported_interfaces into pl->supported_interfaces leave unsupported
PCS modes enabled while adding modes the MAC itself does not support?

Any mode in config->pcs_interfaces that is also in
config->supported_interfaces stays set in pl->supported_interfaces even when
no PCS in pl->pcs_list supports it.  Conversely, if a PCS advertises an
interface mode in pcs->supported_interfaces that the MAC does not support in
config->supported_interfaces or config->pcs_interfaces, phy_interface_or()
adds it to pl->supported_interfaces, and phylink then treats it as a native
MAC mode requiring no PCS.  Callers inspecting pl->supported_interfaces
such as phylink_validate_phy() and SFP interface selection will therefore
see unsupported modes as valid.

[1] https://lore.kernel.org/r/3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.=
com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D3

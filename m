Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739517;
	b=4Lj6lJRfYwIIruEDINKkzHV7qxp82pPQm3nYFFJntfpN5+4oymwyHLJqVEHK610GtC7f
	 gCxIaMwT5hAMg8dHneH9ToNfJnfh/JN+y/EqXkqTxGAnlnghYy5wlMuuazPpNr7gQ9Vbw
	 YPP4IeUSDKa8PB2UqKHcj9tNjYfD6Bux7lX4YiL9ZytL3EPLk8nkj6NQmTprnxXS6a8ir
	 NDYaETq0hbFwnqlfat2KAHE6mhZSEnbZx8VVgcsyUrZlkoE+5jYlrKwD0O79lrwCkPaIr
	 bWH4LFsUS3tykIaLQf3wVx3Au3L9nhES6mEBq5Ai4q+qmZKbLZfilPMdeTtF+aKaCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NpqbutdiGItlXQWyKUWCwOhXWBn2PVF5p9l70IWLFtU=;
	b=5bpHady+PMj5f0U5JpnrqR5L1YhaNd3YOu75AiDxRxM6B23T1yYLjFLxC+EwtyfO1Cy8
	 BiR2wDaZGb84rSSlVgcs5dhZeHvduBrkGk0HmlslnKqQic2DOF2qursOqrAZjWHNIY6lM
	 CbqJMjHqRKY4aItekpVdzkhstbLl0CTUCmaKHKblvT8H7j5lvrDoYzcpjAB7MsSs1pYjp
	 7FrnJO335JE30K0PVpON91U9UUrQazw6zEVUXDUijmTNfVp9fReOVw2R/I6aJ4Ecris7S
	 jJxnyDagmVBa58xtNCMvHCju3aC01Y6PW6HCUOdn7TF1jZdshpi9QOT5bagLaa2LhQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hBlHNuVI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F21606A337
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hBlHNuVI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21A61F000CB;
	Sun, 15 Nov 2026 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739516;
	bh=NpqbutdiGItlXQWyKUWCwOhXWBn2PVF5p9l70IWLFtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hBlHNuVIHbbnxbaDrCj6ASBoAbmyWCIesXI77lK5AcbhK/k/nlMLkjJYkMzfZ63lk
	 oR0YgdUZ1FfBUw92GBaklsx0LEIbXUOuWvPDKJpwztUEyaK1K7qxXql8O9EyYOG9HW
	 vqk64BrnunDO1tbRBiPt9aJfMkec9h9ihtxbnR4W8veSG5CmvcFcHZWd747u/CnEJp
	 ZGObvfSphLTfRbQ6jptPDjIEq4UvStkv+isisBkwC2KrsbDKiQa826JwykHIKQfFaF
	 7RGOaU3T5cmPP30y4J8rSL+WLxFA3b3Iho5hht1iclJlZsVUpQN/JGplIbM1fGq0wM
	 RYeE5xFGYwUdg==
Message-ID: <sashiko-outbox-215398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 07/15] net: phylink: add capabilities
 helper and track modified advertising
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-8-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:16 +0000
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
- [High] net: phylink: unchecked phylink_validate() in
  phylink_calculate_capabilities()
- [High] net: phylink: broken advertising tracking in
  phylink_calculate_capabilities()
--

commit fb3c4a8238a09c214077ba885092205d6fc987a8
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add capabilities helper and track modified advertising

This commit introduces phylink_calculate_capabilities() and a new
advertising mask in struct phylink to recalculate supported and advertised
link modes while preserving user-disabled advertisements.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index d1bd7109c5668..46b2aba336bd1 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -61,6 +61,7 @@ struct phylink {
>  	u8 link_port;			/* The current non-phy ethtool port */
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
> =20
>  	/* The link configuration settings */
>  	struct phylink_link_state link_config;
> @@ -717,6 +718,27 @@ static int phylink_validate(struct phylink *pl, unsi=
gned long *supported,
>  	return ret;
>  }
> =20
> +static void phylink_calculate_capabilities(struct phylink *pl)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
> +
> +	/* Get user-disabled advertising modes */
> +	linkmode_xor(disabled_advertising, pl->advertising,
> +		     pl->link_config.advertising);
> +
> +	/* Calculate the full supported advertisement */
> +	linkmode_fill(pl->supported);
> +	linkmode_copy(pl->link_config.advertising, pl->supported);
> +	phylink_validate(pl, pl->supported, &pl->link_config);
> +
> +	/* Save the newly calculated full advertisement */
> +	linkmode_copy(pl->advertising, pl->link_config.advertising);

[Severity: High]
What happens to pl->supported, pl->advertising, and
pl->link_config.advertising when phylink_validate() fails?

When the PCS supporting pl->link_config.interface has not attached yet or
has just been released, __phylink_validate() fails the
test_bit(state->interface, interfaces) check and returns -EINVAL before
masking supported or state->advertising.  Because the return value of
phylink_validate() is ignored, pl->supported, pl->advertising, and
pl->link_config.advertising remain filled with all ones, corrupting both
the active capabilities and the pl->advertising baseline used by later
phylink_calculate_capabilities() calls.

> +
> +	/* Keep user-disabled modes out of the active advertisement. */
> +	linkmode_andnot(pl->link_config.advertising,
> +			pl->link_config.advertising, disabled_advertising);
> +}

[Severity: High]
Does phylink_calculate_capabilities() preserve user-disabled modes and
mode-specific capabilities across PCS release and re-attach?

First, disabled_advertising is computed from pl->advertising and
pl->link_config.advertising on each call, and then pl->advertising is
overwritten with the new capabilities.  When a PCS is removed, its modes
are cleared from both masks; when it is later re-attached, linkmode_xor()
sees 0 ^ 0 =3D 0 for those modes and re-enables any modes the user had
disabled before removal.

Second, because linkmode_xor() is symmetric rather than
linkmode_andnot(disabled_advertising, pl->advertising,
pl->link_config.advertising), any bit present in
pl->link_config.advertising but absent from pl->advertising (such as pause
bits updated by phylink_update_pause_state()) is placed into
disabled_advertising and stripped.

Third, phylink_create() calls phylink_calculate_capabilities() before
phylink_parse_mode() and phylink_parse_fixedlink(), which (along with
phylink_set_fixed_link(), phylink_bringup_phy(), and
phylink_sfp_set_config()) overwrite pl->supported and
pl->link_config.advertising without updating pl->advertising.  A later
phylink_calculate_capabilities() call then treats the difference between
the stale initial pl->advertising and the mode-specific
pl->link_config.advertising as user-disabled modes, while
linkmode_fill(pl->supported) clobbers the mode-specific pl->supported
mask.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D7

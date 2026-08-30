Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9DD231A3B
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 05:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788067585; cv=none; b=c/RANOYM6p7D//4oFh0D7/02BQqzKTJpUSpc9BgJ6rsRgdyi/fzAPQTgbs0LlSj2OBPz/rjWUArq1pF8svk3gZoIZ4KWann/kEz2sCv20npePJwOT8JYGK9zMsqJi/kjvWEWTewsOb/J90FoDFgyjnTkMZGIDC87Py31zy4WWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788067585; c=relaxed/simple;
	bh=9ea8JDeXRyLInJSyFm20AgXDmugtNmwcyLv1+vWoixw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FzZEgH+lTiP4Vn4g/7ytNJYpDzqae7fowEMkEAIp+Yt3w2edFXfg4NbvksXyTp7RPGXNrhwQ5jJ7/LeIe+Ejace09WY3LWBaSuY77K23UP5eqf7g8vpT7BEQlV9AZgDSTGued2HqUbniBJMfCZJ95hKpYpCfsmZWlwP1iNgWEzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9KG7z8f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9KG7z8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6DB1F00A3D;
	Sun, 30 Aug 2026 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788067584;
	bh=sdOT39iUh/zS9ffiTmrTFt+8M0HRELPSNgtS1sIUhfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G9KG7z8fJAXmQXrocvNpYGqMP10bLSv0dDxDh7j3oxE1WNGveR5KIJqc3gq4rZX6u
	 rWZByGX0g2B3aeJVb54o5YBC5bvS3gbKkFe7WTaj589E/C90ql0Pd/yhTvKalmUQrU
	 PQ7DYWsozp6Asq2MM9odI8cmiG2KIHDTRlw6pgl+j3bOa3LMWWcEzuHWBRPEPtuPuI
	 DDpYH/64dykpsd1t/j+7NLSl35WnzSYR9p9n5uG3HcaJtSrpWZ82rPIR6r0cyy6v1W
	 wGOOpn97MW9/W3x61hxwGNH5MTVX2gW5pShzU1b+fjRh9ho8DkQdF5ThsnC56XuhIn
	 17HkVa9rt74kQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 9/9] net: phylink: report no link modes
 while a late PHY is missing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260829052546.1152446-10-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
 <20260829052546.1152446-10-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 05:26:23 +0000
Message-Id: <20260830052624.0A6DB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack memory read in `macb_taprio_setup_replace`.
--

commit 0643f275f79b61c4578a88309083d8ddef0461ba
Author: Aleksei Sviridkin <f@lex.la>

net: phylink: report no link modes while a late PHY is missing

This commit modifies phylink to report no link modes and reject settings=20
while a slow-to-probe PHY is still pending. This prevents the port from=20
using the MAC's capabilities for a link that cannot come up yet.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 62e6059a18da3..857d38ed45a6a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -3106,6 +3112,17 @@ int phylink_ethtool_ksettings_get(struct phylink *=
pl,
>  	else
>  		kset->base.port =3D pl->link_port;
> =20
> +	/* Until the PHY arrives the port can do nothing, so report no link
> +	 * modes at all rather than the MAC's own capabilities, which is what
> +	 * an empty SFP cage reports.
> +	 */
> +	if (phylink_slow_phy_pending(pl)) {
> +		linkmode_zero(kset->link_modes.supported);
> +		kset->base.speed =3D SPEED_UNKNOWN;
> +		kset->base.duplex =3D DUPLEX_UNKNOWN;
> +		return 0;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but is it possible that kset contains
uninitialized stack memory when passed to phylink_ethtool_ksettings_get()?

For example, macb_taprio_setup_replace() in
drivers/net/ethernet/cadence/macb_main.c declares struct
ethtool_link_ksettings kset without initializing it:

drivers/net/ethernet/cadence/macb_main.c:macb_taprio_setup_replace() {
    struct ethtool_link_ksettings kset;
    ...
    err =3D phylink_ethtool_ksettings_get(bp->phylink, &kset);
    ...
}

If a user space process configures a TAPRIO qdisc on a MACB interface that
operates without an attached PHY, this function will call
phylink_get_ksettings(), which then reads the uninitialized stack memory in
phylink_merge_link_mode():

drivers/net/phy/phylink.c:phylink_merge_link_mode() {
    linkmode_and(dst, dst, mask);
    linkmode_or(dst, dst, b);
}

Additionally, kset->base.rate_matching is read to conditionally set
kset->base.speed:

drivers/net/phy/phylink.c:phylink_get_ksettings() {
    if (kset->base.rate_matching =3D=3D RATE_MATCH_NONE) {
        kset->base.speed =3D state->speed;
}

This uninitialized speed is later returned and used for hardware interval
calculations. Since this can be reached by untrusted input via the tc
netlink interface if user namespaces are enabled, could this result in
incorrect hardware QoS limits and trigger KMSAN use-of-uninitialized-value
warnings?

>  	linkmode_copy(kset->link_modes.supported, pl->supported);
> =20
>  	switch (pl->act_link_an_mode) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052546.1152=
446-1-f@lex.la?part=3D9

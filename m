Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F491DD0EF
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365277; cv=none; b=YzcDWXKYBk7p5MWP+gY1f7bAibd7zcMmQRkuXxXrxGaZy1FsoCaxieC4B4dbBroY9n73vDmssh1ydbpJLX8KXbskB0zXk9J8iptb2FcXH3f9Pmi0aRkEJnbnFvMWUc10wR7iAs2lNEJjnZjh2pud7dWgbMxDMpPAbnR9a2y5Vhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365277; c=relaxed/simple;
	bh=7avaIYHFMlndstpyEXr3hEJ6d+QbfkiE4M2Z9RhztHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ImFvVLyHSP62PI8bhH6oJQygeDogI1NxNHyfMLJvzXnTnegaJZgKe86JKki+CO/B85iXZhJDmVZeaSSgtDb6OtDbl+i/lM87qdDqxTqNzYJT/iz9NtMVfHn3DuhBRsEezLIUShVlhgT/Xjl8EuaAtYKqAZ0tDcXLNdROkiWl6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MANr96ap; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MANr96ap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553FE1F00A3D;
	Sat, 18 Jul 2026 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365275;
	bh=Vm/QmLHtNHPfA2uh1+xV8VQocDYD3k2twPJI/vyb7nU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MANr96apMDj1+T30n6hygs3nufmle91hoz+Ctr5B9jqoDzMQc2W8ABj9P4eKhNz/Y
	 pAvxTNO5S6xvKz8fI4xf38x46RTkLMrIPM5nJCPvR5Ic+CUOC2nB86eNoMnJQjznLW
	 u4AaVwFt6P+bLOGj6TeduCMm4oik866Cf2Z0/H7h3a4m4fl6tU31rC/v3KTB8b3IPJ
	 aN+zVs41i5WxKLCQZXnj7QQce4BfOlukMfiQG6pOJpLeH2vfNPl4cckPKARp6IYqdP
	 nPJlnOW2HCs1/JUSoeBCAG5eFGI2JIPK22Dg2ONrzKEACxvW8SjQwJXgJdLj9youjf
	 KBXC2nkAN7pWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717065448.1498335-2-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:14 +0000
Message-Id: <20260718090115.553FE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `phylink_create()`, if `phylink_register_sfp()` fails, the func=
tion frees `pl` without releasing the GPIO descriptor `pl->link_gpio`.
--

--- Patch [1]: [PATCH net-next v9 01/12] net: phylink: keep and use MAC sup=
ported_interfaces in phylink struct ---
commit 34f151721de84035e589a96b730a7b88905f81c9
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: keep and use MAC supported_interfaces in phylink struct

Adds a copy of supported_interfaces to the phylink struct and makes use of
that instead of relying on the phylink_config value. This prepares for
internal PCS handling where a PCS can be added or removed after creation.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 59dfe35afa54f..3464e3ec56997 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1867,6 +1872,9 @@ struct phylink *phylink_create(struct phylink_confi=
g *config,
>  	mutex_init(&pl->state_mutex);
>  	INIT_WORK(&pl->resolve, phylink_resolve);
> =20
> +	phy_interface_copy(pl->supported_interfaces,
> +			   config->supported_interfaces);
> +
>  	pl->config =3D config;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing
phylink_create(), I noticed a potential resource leak in its error handling.

If phylink_create() processes a fixed-link configuration that acquires a
GPIO descriptor (pl->link_gpio in phylink_parse_fixedlink()), and then the
subsequent call to phylink_register_sfp() returns an error like
-EPROBE_DEFER, the function frees pl but does not release the pl->link_gpio
descriptor:

drivers/net/phy/phylink.c:phylink_create() {
...
	ret =3D phylink_register_sfp(pl, fwnode);
	if (ret < 0) {
		kfree(pl);
		return ERR_PTR(ret);
	}
...
}

Does this cause the GPIO descriptor to remain held, preventing subsequent
probe attempts from succeeding since the GPIO request will fail with -EBUSY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D1

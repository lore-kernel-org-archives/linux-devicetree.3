Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006C3DDDC3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138787; cv=none; b=tiZOSyEiHmVCdpvuDHpu0x9rO/b0ywg2XqNUy5QG+13U1NWNre0Ga4Z0SZmP0Y1vAgSbsMm1A4dMwjEqibRN1w00FgfkStVjJ5JjMHhKXsS0LS6FitguhwWLgI88gleSl7uBqu5kvf4syw4THxW0MBDElMoGIdFY+MRzTQmDngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138787; c=relaxed/simple;
	bh=ccd+tlponh7aZAKSsgcTz2/eSgipT1W08qmVHfXIUmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dOkBeFlI9ywkN6+mpUa9ex4HToN3w+9pSFBKcOEVyMQbKsYVATpblIvpHyzT5WkjGKOgk0fR39MBlZ4cR9GR2vK5uQEQWqfg9QKMegWR3d9hUmntUI3UPKhL/3L+oAuE8FfjEH1FODgWCL9LvLbL2AetLpFnJ/V6gwKzbsnDl0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmcZYdQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmcZYdQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD251F00A3E;
	Mon, 27 Jul 2026 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138785;
	bh=/Mny8736gwt5KUhe0cA1s38pl6Qr9t4r4nVXIyNp9xw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmcZYdQqYlSAQLpMnXiPzlWU/DQoqdVUgtjHIt468AEURJlxrK4bf2YyZfBaFtWOQ
	 TlusvGReFq60RpmAQF+nf4/WpbApk8q/pxBdoeL60Sc7x4BluGyFFjzttC9A6CtLpB
	 4tj0xNSPcMphc+MZQy4/L+D7a/1UDE4z3JVcv3jUUtuKlvRTghjQ9OKM9+wnIkW0b6
	 4ZEcdYCA2pQlGpAIJZXA7GD26QMVOwU/T36qeg0PgxxiPbcc6u6YYtZt8m5gZrV1qU
	 5dpKoT9y7Fj1tO3bOM0eIO8GZshyfefjEJJ9Q0Y6TBhZ585emgb65/+pIErY9Wp5HQ
	 yYiItDQZ1z3cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/34] pinctrl: airoha: an7583: there are no muxes to
 enable i2c buses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074234.3761170-7-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-7-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:53:04 +0000
Message-Id: <20260727075305.2FD251F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'i2c' function is removed from the AN7583 pinctrl driver but=
 remains explicitly documented and allowed in the device tree binding schem=
a.
- [Low] The 'i2c0' and 'i2c1' pin groups for AN7583 are left completely unr=
eferenced and unusable by the devicetree.
--

--- Patch [6]: [PATCH v7 06/34] pinctrl: airoha: an7583: there are no muxes=
 to enable i2c buses ---
commit 22df8bb0430afc8490b745f45493ae811f88f9d8
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: there are no muxes to enable i2c buses
   =20
In the AN7583 case there are no mux bits to enable i2c buses, so i2c pin
function is not necessary.
   =20
Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 4076bd0261d17..cad56ac3c0614 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -1821,7 +1821,6 @@ static const struct airoha_pinctrl_func an7583_pinc=
trl_funcs[] =3D {
>  	PINCTRL_FUNC_DESC("sipo", sipo),
>  	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
>  	PINCTRL_FUNC_DESC("uart", uart),
> -	PINCTRL_FUNC_DESC("i2c", i2c),

[Severity: Medium]
With the removal of the "i2c" function here, does the device tree binding
schema need to be updated as well?

The schema currently lists "i2c" as a valid function and enforces group
constraints for it:

Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml:
            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
...
          properties:
            function:
              const: i2c
        then:
          properties:
            groups:
              enum: [i2c1]

Could this cause validly-schema-checked device trees to fail at runtime
since the driver will no longer support this configuration?

[Severity: Low]
Does removing the "i2c" function leave the "i2c0" and "i2c1" pin groups as
dead code?

Looking at drivers/pinctrl/airoha/pinctrl-airoha.c:an7583_pinctrl_groups:
    PINCTRL_PIN_GROUP("i2c0", an7583_i2c0),
    PINCTRL_PIN_GROUP("i2c1", an7583_i2c1),

Since no pinmux function references these groups anymore, should they be
removed to avoid leaving unused static data structures?

>  	PINCTRL_FUNC_DESC("jtag", jtag),
>  	PINCTRL_FUNC_DESC("pcm", pcm),
>  	PINCTRL_FUNC_DESC("spi", spi),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D6

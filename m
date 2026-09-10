Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DD4825AB
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049496; cv=none; b=Bd1sBu/bk+99Amu/8fdjHQbfMSG9OaN089MkE0ZUT5VdHufeuXdpkyGmgyqH34dYLuYyqI2IvRvu/HlO1QWF8dPWlz7sb8T+KoMDxNt6RUxwqAz88xRNQ705zNki+sbzn/czACJuFzu+fkzkxAKYU4dzgRLCE0ddv5hrELbp/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049496; c=relaxed/simple;
	bh=Ximzdc1RpRobDDM3DuRnnVrT+3EVWcNz/iOtMEJ1700=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PG93jqq0bNhRVbxp/3/8Mypv4f1+0ydRg5GDAdCLm32OWvpH1g2utTqQOR3I2IN295m73zIzdR+tiKeq38+laOqGIBSd54AOWKiJFp2qwR1WBHw6ajeGAOHce+KwTMesyxyRSqNpBFN8Yp4HTFuCQT8PsWtpytKB9IVYrDn5ByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4HxojIa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4HxojIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8E11F0089A;
	Thu, 10 Sep 2026 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049494;
	bh=OSrkeMOGaK284GSDkqrCTA40sucBOwA/nSFnAQOtdEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d4HxojIaGHKMfOplqif1hBmIo+FWNwRLgeFvMsIG2Wf4D6inZYx9X6m14iAobmNs7
	 9Z3vShSq9WmE4wInYMHbUxKl5MUfkHQQbKlOsYwbAmrt2pYqppa2TZGpLM/7Yve38d
	 DM4zmrwN3XmkFl5S/atZz1Uy0w9BbajPknx55sh9Db/6kb8UHwEWsWnnc+8Cm6TCmR
	 UlhuPE0J8x/MQ7aYaQhhGtM7GQaYKJ8Ob4A38sufS4ZrkAdQfDom5HsbaybdHx8rX9
	 vnLEwg8PLeDDkE9ZMxwzev+32gWXTplwP70815ArGH9NZqQ4zXN6dbSI/OYiuaSpM1
	 sU7Sg3xFFplFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 6/7] dt-bindings: net: dsa: mediatek,mt7530:
 add econet,en751221
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909140346.2861572-7-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
 <20260909140346.2861572-7-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:11:33 +0000
Message-Id: <20260910141134.4B8E11F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `mt753x_check_passthrough` implicitly bans valid standard DSA casc=
ade and multi-CPU configurations for all MT753x switches.
- [Medium] The binding introduces incomplete and overly restrictive validat=
ion for the new en751221 switches, incorrectly using 'passthrough' terminol=
ogy for a standard cascade link.
--

commit 9f411b8347b2bd00011347f799ab43d47066ae33
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: net: dsa: mediatek,mt7530: add econet,en751221

The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
in the SoC register space. It is similar to the econet,en7528-switch
except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
port 5 has no PHY, but is in some implementations connected to a
downstream MT7530 multi-chip module via a TRGMII link.

> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.ya=
ml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index e29fb86934981..106c4087528d7 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
[ ... ]
> @@ -223,6 +237,20 @@ $defs:
>                  phy-mode:
>                    const: internal
> =20
> +  mt7530-passthrough-dsa-port:
> +    patternProperties:
> +      "^(ethernet-)?ports$":
> +        patternProperties:
> +          "^(ethernet-)?port@[0-6]$":
> +            if:
> +              required: [ link ]
> +            then:
> +              properties:
> +                reg:
> +                  const: 6
> +                phy-mode:
> +                  const: trgmii
> +

[Severity: Medium]
Does this block incorrectly enforce that any cascade link (port with 'link'
property) must be on port 6?

It appears this restricts any cascade link to port 6, breaking cascade links
on port 5, and misapplies the passthrough terminology.

>    mt7530-dsa-port:
>      patternProperties:
>        "^(ethernet-)?ports$":
> @@ -330,6 +358,7 @@ allOf:
>              - airoha,en7581-switch
>              - airoha,an7583-switch
>              - econet,en7528-switch
> +            - econet,en751221-switch
>      then:
>        $ref: "#/$defs/builtin-dsa-port"
>        properties:

[Severity: Medium]
Does this block omit validation for the cascade link on port 5?

The upstream switch uses this block, which only validates `ethernet` ports.
Because its actual cascade link on port 5 uses `link`, it falls through with
no `phy-mode` validation.

> @@ -337,6 +366,16 @@ allOf:
>          mediatek,mcm: false
>          reset-names: false
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - econet,en751221
> +    then:
> +      $ref: "#/$defs/mt7530-passthrough-dsa-port"
> +      required:
> +        - mediatek,mcm
> +

[Severity: Medium]
Does this apply an overly restrictive definition to the downstream switch?

This block fails to reference `#/$defs/mt7530-dsa-port`, meaning its standa=
rd
CPU/user ports bypass `phy-mode` validation.


Regarding a regression introduced in a prior patch within this same patchset
(commit 1d284e3e71056b81f501b69bacab596eedd52079, "net: dsa: mediatek: add
support for passthrough mode") that does not appear to be fixed by the end
of the series:

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 9a50a492e6f08..58190e13813c1 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -3397,6 +3446,76 @@ static int mt7988_setup(struct dsa_switch *ds)
>  	return mt7531_setup_common(ds);
>  }
> =20
> +/* 1 if passthrough, negative if error. */
> +static int mt753x_check_passthrough(struct device *dev)
> +{
[ ... ]
> +	/*
> +	 * A switch is considered passthrough if exactly two available
> +	 * ports have an "ethernet" or "link" phandle.
> +	 */
> +	if (passthrough_ports > 2 ||
> +	    (passthrough_ports =3D=3D 2 && enabled_ports !=3D 2)
> +	) {
> +		dev_err(dev, "Only two ports allowed in passthrough mode\n");
> +		return -EINVAL;
> +	}
> +
> +	return passthrough_ports =3D=3D 2;
> +}

[Severity: High]
Does this logic implicitly ban valid standard DSA cascade and multi-CPU
configurations for all MT753x switches?

This block increments `passthrough_ports` for any port with `ethernet` or
`link` phandles. It incorrectly restricts any switch with exactly two
CPU/cascade ports to strictly having zero user ports, breaking standard
cascade setups.

[ ... ]
> @@ -3529,8 +3648,12 @@ EXPORT_SYMBOL_GPL(mt753x_table);
>  int
>  mt7530_probe_common(struct mt7530_priv *priv)
>  {
> +	int passthrough =3D mt753x_check_passthrough(priv->dev);
>  	struct device *dev =3D priv->dev;
> =20
> +	if (passthrough < 0)
> +		return passthrough;
> +

[Severity: High]
Does this unconditionally evaluate the faulty passthrough logic for all MT7=
53x
switches during probe?

Any switch with exactly 2 CPU/cascade ports and at least 1 user port will f=
ail
driver probe with `-EINVAL`, breaking networking functionality across the
driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909140346.2861=
572-1-cjd@cjdns.fr?part=3D6

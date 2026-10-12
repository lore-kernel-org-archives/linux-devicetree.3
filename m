Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090B46F4A1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795763; cv=none; b=WDORx+pgWByy4QDpNkCuo26dkFo6XFrapF5URQvyvEPPOLJvi5MU8EtrUbDAQUtBpsYdohDJs0cgHnw10FqfJt3OthVet0ERwhN4iBG45dA+1PAxc4qcrvjGHtaYZcHx+KVJk/5vocrdnYmn8eg4nBP7uYfLSda+WUBwV8123K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795763; c=relaxed/simple;
	bh=1kXY/MRthfi+95bS49A+pIkegxzd/yzRUyMa3PHyhn8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CZhb/OYQVQXUnSdHPzHVGne1AVEOYHsBxmorjCTO9rmb/6fvFg9h2Itn5uTtdKrZU2JnrR7yibMYKco5dPn5NAUsv/6anY2zjkE8hJq1tYrqaa2FO6SAa0kRjZaHfTBYXmxf3U6FSXNroo12WLYGv36m6SjrM+TUmE1ABXaTyQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3AKoAoC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3AKoAoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579961F0089B;
	Mon, 12 Oct 2026 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795761;
	bh=4ygGT1q+20Db1BG+IgE8FMhqgOcpAkXpmhkCaZJrgqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3AKoAoCa8Y9bbgyaIHkNnPHlTaVh72F4tloPgu/1sE2Djbtrz5Of2OXIaiQdJ+WB
	 VWXbOz6nfBv+j6ERhlidrbMy/1M7qko+3EtW7CcZFQEaSDTQlgdHptzhm16pGTNXMB
	 M1HoOGQ82xhoEiLvFGDfCLDK8KGbIz0wmvRuPzQv9qNTbVx+tm6LSBQIlLEoC4MnV9
	 i5C/oHX8CPOlPMhSU2L7UA01JuiUPBk+ouoAOL2MyVwFWWXAt+5Vl6hHS5mL6BTSti
	 7zJxXIaL0quQ/7KV/x+sU7PIhyGCA/Q2Mswoq4h7nHpoxXPBQVMNulZqWpu0nPwHt+
	 56ShISZQv6lwg==
Message-ID: <sashiko-outbox-167879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: display: ti,tpd12s015: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012085237.377612-2-quchaosheng000406@163.com>
References: <20261012085237.377612-1-quchaosheng000406@163.com>
 <20261012085237.377612-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:02:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: display: ti,tpd12s015: missing minItems and require=
d for gpios
--

commit fc9c522935b9c669ac75f93cec8daaa7860a7102
Author: Chaosheng Qu <quchaosheng000406@163.com>

dt-bindings: display: ti,tpd12s015: Convert to DT schema
   =20
Convert the TPD12S015 HDMI level shifter binding to DT schema.
The TI TPD12S015 is an HDMI companion chip that combines a level shifter
and ESD protection circuitry. Document the two ports it exposes between
the HDMI transmitter and the connector.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> new file mode 100644
> index 0000000000000..5955f2e6421c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
[ ... ]
> +  gpios:
> +    description:
> +      The CT CP HPD, LS OE and HPD GPIOs, in that order. The first contr=
ols
> +      the level shifter, the second enables the level shifter outputs and
> +      the third reads the hot-plug detect line.
> +    maxItems: 3
> +
> +  ports:

[Severity: Medium]
Is it possible this schema should enforce a minimum item count and require =
the
gpios property?

If a device tree omits gpios or provides fewer than 3 items, the schema
validation will pass because it only defines maxItems: 3 and omits gpios fr=
om
the required list.

However, the driver unequivocally requires the third GPIO item (index 2).
If absent, the probe fails:

drivers/gpu/drm/bridge/ti-tpd12s015.c:tpd12s015_probe() {
    ...
	gpio =3D devm_gpiod_get_index(&pdev->dev, NULL, 2, GPIOD_IN);
	if (IS_ERR(gpio))
		return PTR_ERR(gpio);
    ...
}

Should the schema enforce minItems: 3 and add gpios to the required list to
match the driver's mandatory requirement?

Additionally, due to a preexisting bug in the driver, if this probe aborts =
it
will leak the tpd->bridge.next_bridge module reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012085237.3776=
12-2-quchaosheng000406@163.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB84175A74
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543845; cv=none; b=Ake8UODFxvKGpIibyJQPH+CX4+B8YS8WP3CCrENSHkv2n2B9vLW7229de6c8oI3xaxT5r0fT/ZAhcEVDWxIJvBNAuozET5za7Ab2eIwxtYa6wwLVJNw+csqA9Pd805bPoh2fXAAN1NgDB6hCIHnqG2maU2A52W42UNVkRlz4yhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543845; c=relaxed/simple;
	bh=4oB9TyLA9CryYUDyKKZoOWJLSgVXibBzGJYy7srBvgA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jjjqMc83QP4wSoZxADcvkVfORlK4oazfckHAswpseoAj2talyIYEanfww4ZOL2fytwFL4GuSnCYfIBCNSlw9myWf0sPb5Rnp61EYgykBAUhqqjJsKKYNKifsI9ocqJIs/Hv7pF//c8/CPMpxhkA+6nypYz75Tf29FQOrsPpHMnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2reEFgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2reEFgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1791F00893;
	Fri,  9 Oct 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543837;
	bh=eCR2rVOxljXIgaUHxUERrq3IAIM7n1o13GUJ6/FeG0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B2reEFgzgDrXm8laDOTo/HqkQTpR27aNEwkD/ANN9gVY3WliWPn3aa5MBW+8REmY1
	 cp3WQst26on6jClVjGRxhyPnYmr63FFnVdqH6gE/5WLQpb9THYQEGQPrxaVru2Wsr+
	 IUsBIehDHFsFJnH4/4y4LXWNKRvkl5Fqk9MQzS6Bz7mCtt119/inECA+QiDoAZBCNV
	 0cHpt+kmKC7TKH1GvnRi2zEzudAM3gjVXoeHu9mS/eBo5SsA9TKaheb7j9Gcg7G/pf
	 xvcRf/ynqT6EJud9GWvjf4mAMrBXa1R7HDj1ZTlc0vpLc0TYYbMRVgSWco6IVO56E4
	 +oMSj4xwrAtog==
Message-ID: <sashiko-outbox-165306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,tpd12s015: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009105356.300188-2-quchaosheng000406@163.com>
References: <20261009105356.300188-1-quchaosheng000406@163.com>
 <20261009105356.300188-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:03:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: display: ti,tpd12s015: missing minItems: 3 for gpios
--

commit d5e502558b023b930dba87dd54c3fb7121502833
Author: Chaosheng Qu <quchaosheng000406@163.com>

dt-bindings: display: ti,tpd12s015: Convert to DT schema
   =20
Convert the TPD12S015 HDMI level shifter binding to DT schema, documenting
the ports and compatible fallbacks.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> new file mode 100644
> index 0000000000000..1927da3bd7361
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

[Severity: Low]
Does this property need a minItems: 3 constraint?

If a device tree developer omits the first two optional GPIOs without using
<0> placeholders, the array will have fewer than 3 elements. This will pass
YAML schema validation.

However, the drivers handling this device (both ti-tpd12s015.c and
encoder-tpd12s015.c) unconditionally request the HPD GPIO at index 2 using
devm_gpiod_get_index(&pdev->dev, NULL, 2, GPIOD_IN).

If the array has fewer than 3 elements, the driver probe will immediately
fail at runtime with -ENOENT. Adding minItems: 3 would ensure the dt-schema
validation catches incomplete arrays earlier.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009105356.3001=
88-1-quchaosheng000406@163.com?part=3D1

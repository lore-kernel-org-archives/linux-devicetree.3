Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCA1A7264
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781946308; cv=none; b=lJLG3sKNUKzDt92lCtLxv4hXDM2itEKurRw0IYkY+u6dhwVjIkhLFO2EISp+tA/EmAlzXUhGx6XsjZrRfbkyLrDf1AHzkbkGzPQgGm/u8HvQwMYgZScbibVZ9a8Z0qzvdbnREqd2pB4yGSTXRqN4Q5iYzP1vvCFYTjdK8YyqLK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781946308; c=relaxed/simple;
	bh=bQmc3efEdw20YBayWvZh6138+BjCjPeyQRdZhcCXSmE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5d4WU4W2CmdQbPbS+B/tmUOi9mXqWAvfNZl70bHnChwwYD7DxyntOlegVJNvAOZ14Sx57ERiOqVc5T78paRcoL6t0d6uctYh1zSxyJYA13Q9aaLiq6X2JAqjtBvF9HGAIH+0oGUlQWcYMssBA5ovGaUVEfdYZJQolaXiiPy1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK3tBpIN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK3tBpIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3171F000E9;
	Sat, 20 Jun 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781946307;
	bh=dHfwz1pb4MFr1rvzffAaNTvN2/p3ZlGNr7HKthUKmWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kK3tBpINL1XQ5mUIsFu/CBfwOOHK4r07/ISZErXijalKnbD+W0AM2Cijma3Jbotbk
	 DS5kyrO1qhgOFX09liTgdQittZwj6iSceLkYLki5pWGO6uSh7nvHw6eS9VDINY9SOe
	 hR6yIjvv8fLvfa8I2hkikdHMyIQgbagWx8tutVYE/R8eyverAnC7w5+dlqfOgfAjyH
	 pMA+2x2+1o5WeUgPGDAbMhfoudDMYGh3SW1K/vLFNeDZ6/S5tSoDCLFkqKLumZisaa
	 uuDSFdgebx5C1ohwjtwEUc7si5vUUXGPubr3iJXmpcilXZQadfW/uYPC2vj2D9nE9g
	 5Ce8So3iZbrOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 09:05:06 +0000
Message-Id: <20260620090507.0E3171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding schema omits the `properties` block defining th=
e `compatible` property, causing schema validation to fail if device trees =
include it and allowing incomplete nodes to incorrectly pass validation.
--

commit 8c5bcc12a2e0793aa168b5a819709950e4b101f4
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

regulator: dt-bindings: Add Unisoc SC2730 PMIC

This commit adds the device tree binding schema for the regulators found
in the Spreadtrum/Unisoc SC2730 PMIC.

> diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2730-regu=
lator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regula=
tor.yaml
> new file mode 100644
> index 0000000000000..ab945c46b08e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.y=
aml

[ ... ]

>  "^ldo-vddrf(1v25|18)$":
>    type: object
>    $ref: regulator.yaml#
>    unevaluatedProperties: false
>
> additionalProperties: false

[Severity: Medium]
Should there be a properties block defining the compatible string here?

Because this schema specifies additionalProperties: false but omits a
properties block and a required list for the compatible string, it acts
as a catch-all that can successfully validate an empty regulators node.

Furthermore, if a device tree author specifies a compatible string (such
as compatible =3D "sprd,sc2730-regulator"), validation will falsely fail
due to the additionalProperties constraint. Could a properties block and
a required list be added to explicitly allow and require the compatible
property?

> ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620-sc2730-reg=
ulators-v6-0-bbd2db395231@abscue.de?part=3D1

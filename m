Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69747143B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935049; cv=none; b=PYNpX16nk155e1bHtecSeikcbVAI4nUzjiy2kfEwXJXmszyTb4qMcfAa0Vm9oxvWHSHMo7wsNV8VV19hWgA7bJP8HZ3o8jUcyxBDAsnCda9AtcV4ZZH3DNbe1Qqrh8kkVUm+/ZpCcLOSbPWLCyp/u/9sicZqFWh36EIbje/zK5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935049; c=relaxed/simple;
	bh=4jIhjYHV3kF2jvgfepD19RYojDhnx64j36yfsj4sjis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rYfY8Xvbv1LnEN3aB+9iJ89jT+y4iL6w87BHRHcwT+WXgCp47iZTqVGzlrrowIsC5Ch3U+8FQTacuhZA5s3WiNz7bqpULOPwpsxUMivtLrOb8qSn1pe3j3wVy7TRef9qSgfXGj5DTC75nk/v0wovbD3wPU7grZ+TQAgM1Sbe0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAkKL+ru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAkKL+ru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4981F00A3A;
	Wed,  5 Aug 2026 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935043;
	bh=xBxreDMpUM9q7LmfY4rdxl9Ci1cLmfRu3zZIcwQUrow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IAkKL+ru0xSmO7SFEcxLADvdfavAP+wv9qkCV3nf0WNSpZbEm6GpXT/S6bY9tJMcG
	 wZlcn7cJ/YtYxnhvVIfFHTSt2l0C5EcMKjzQlrW8RJ6j2NfErPolJsLsY35Lzxj8wk
	 dxMP8eGrg7vUsbFhgOV8aHZGrljmJwtRbrvmgv2MrI6SJ5OAp61ze8MqSgyhkZadIv
	 UK9kBByWkmbeARxtTez5Tn0UUWeB38dYWeBgpe2zqZ43cHzXiQ0Skl9Vhb4PXcGqGp
	 niAxOI/OdPRY01sZxawG6hPyVJjwGyrRrX8yudpLF804YIcvbgbar5W49bYx6G4Iaz
	 fKbGcepxE62pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 29/36] pinctrl: airoha: an7583: add support for
 pon_alt pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-30-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-30-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:04:02 +0000
Message-Id: <20260805130403.3E4981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing devicetree binding update for the new `pon_alt` pin group
--

--- Patch [29]: [PATCH v10 29/36] pinctrl: airoha: an7583: add support for =
pon_alt pinmux ---
commit e4aace775344077581e730c5d2b97d324007c209
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for pon_alt pinmux

This commit adds the pon_alt pin group and enables the pon pin function
for it.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index dc88cbd8746bb..2e145ef5a224c 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c

[ ... ]

> @@ -564,7 +567,7 @@ static const struct pingroup pinctrl_groups[] =3D {
>  	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
>  };
> =20
> -static const char *const pon_groups[] =3D { "pon" };
> +static const char *const pon_groups[] =3D { "pon", "pon_alt" };

[Severity: Low]
Is a corresponding update to the devicetree binding schema needed alongside
this change?

Looking at the bindings in
Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml, the
schema strictly restricts the allowed groups for the pon function:

          - if:
              properties:
                function:
                  const: pon
            then:
              properties:
                groups:
                  enum: [pon]

Without updating the schema, will dtbs_check fail with validation errors wh=
en
developers attempt to use the newly added pon_alt group in their devicetree=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D29

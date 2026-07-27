Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A0437868
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174744; cv=none; b=ofFrsjDDzOGKs8pP7P2QzhApBBtKYtlCpNB9WI+3MvHri85dA7YIRTfALHuiPwcBsK4vGQQQtzNvSnrjDCcLGZpVPdZgN63oiHQv6P4gdyL91TfrPwUEzxQjRH2w/r0OZo7HzCveAU5JoHBuqRhnXDDV860kNDDlKzW/4yNO0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174744; c=relaxed/simple;
	bh=65eZKd18W8WxkbyUnUK3BfXPIP6mXA9bOCcBu3wepwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MD2k5tXB6cz5Ifhs9aRx4cJC9tO6IpdvNsGicRKeAqDjukljRQXhRjvMU14GTEcxxAeqaBmwx+YjtstJ2qSKW2Q6KUAggQ7g1hdGsfs45dnAT++q7C4RrM8MqxPS0eLYyVEBGyVXdOZAMM2XgsfF+1Wqnhmd4jQ0X/zHWj0ApUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZOlgpVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZOlgpVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258091F000E9;
	Mon, 27 Jul 2026 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174738;
	bh=TQQyakFIEaLD+XkAymAH/fUsaPpx57eRjCz8cUzrJqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZOlgpVd79QjnNgyGMWn/+EqRDsKJnS2LkyA03dxrRGub8MUihewqCJTUwPvj9DB5
	 5xStMJl97LY1+3H+qUbR8kL/lWjqdPm1OVPzPrdMFRwmISbDPgXiAHUdm4OZT11tXz
	 fRQqIsdVZZBb4sG4BKEO19eF5+eJhchlbpPBgjTNX3zDP3tKsds1n8LZahkfQuItJt
	 iARP+7DGi7mrQI3MsQ+xx0rIyrz01uuzyn6FLKV/F0VDYRn/8InRDKptED2mFyxgYd
	 ALN6+5upqD9r95Ys0D6sTgIAjCuDBpIDFtjQTLP9XOu0J4jmpwYiVwnI0VHX4rw9Ki
	 0JcD2Qpe+9N3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/35] pinctrl: airoha: an7583: there are no muxes to
 enable i2c buses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-8-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-8-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:52:17 +0000
Message-Id: <20260727175218.258091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'i2c' function is removed from the AN7583 pinctrl driver, bu=
t the corresponding device tree binding still lists it as a valid function.
--

--- Patch [7]: [PATCH v8 07/35] pinctrl: airoha: an7583: there are no muxes=
 to enable i2c buses ---
commit 468f37a4e3c15517200510fff4781fc404ca25d0
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: there are no muxes to enable i2c buses
   =20
In the AN7583 case there are no mux bits to enable i2c buses, so i2c pin
function is not necessary.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index ffbc7b3c61812..b90917d64f158 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -1822,7 +1822,6 @@ static const struct airoha_pinctrl_func an7583_pinc=
trl_funcs[] =3D {
>  	PINCTRL_FUNC_DESC("sipo", sipo),
>  	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
>  	PINCTRL_FUNC_DESC("uart", uart),
> -	PINCTRL_FUNC_DESC("i2c", i2c),

[Severity: Medium]
Should the device tree binding for this device also be updated to prevent a
validation regression?

The documentation in Documentation/devicetree/bindings/pinctrl/airoha,an758=
3-pinctrl.yaml
still lists i2c as a valid function in its enum and contains a conditional =
block
for it:

          - if:
              properties:
                function:
                  const: i2c
            then:
              properties:
                groups:
                  enum: [i2c1]

Leaving this in the yaml file means a device tree could specify function =
=3D "i2c"
for the AN7583 SoC and pass dtbs_check, but fail at runtime because the dri=
ver
no longer supports it.

>  	PINCTRL_FUNC_DESC("jtag", jtag),
>  	PINCTRL_FUNC_DESC("pcm", pcm),
>  	PINCTRL_FUNC_DESC("spi", spi),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D7

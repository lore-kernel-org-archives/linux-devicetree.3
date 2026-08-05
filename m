Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819A46D0A5
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934605; cv=none; b=N72Ms9MIAboyptXRXtXC+/icGvwD/pujIYH/BlvlEPcZm/0R+zyclX1qRkmljsyMo5ohXdL5qXxixdkVKIRnVH0c8l9eMGPmWQMX6/tp7q6HSFddeiRj+stmPf4YBF8fwC/xhDqK94NXaJcjcDtI3UabMSDj3R8fRgekAQ5HdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934605; c=relaxed/simple;
	bh=+LUrXR9ex7SAkxBTKbvc1542Kzy/Inkln/7sNJAezxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JIflrdEkCGm8TU+GE6uPyUOV4IkajnsnBIZXD6GLs8T2dGKbqZlKvCgCMkPGpdUtqcse5PlUrAQa4Dzs466eUNQ6xwQ/cE6yMjNvaAK3z9jwKj7lmUx7QR3qxuQL8fM9GDrBjFAyHdJDnR0nH/ifoQDjDQX1+ioQCTCOHQAKcYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJqwaGvj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJqwaGvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58681F000E9;
	Wed,  5 Aug 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934604;
	bh=oqBV+yPZ23dSXUfqXrHovIeDyx6UEV/0unvxK3B0Z8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJqwaGvjmzBTmmv2TBtSAcMytF1LYJMIJgIJ0uDDQeoXZXYe6Rw2ItqE316uqa9Lc
	 BpwnGNKpS/v7sxvYWWft6wyHhPqSlRcTT7uSP7Pvtgo/5vzn2MwWP6mdoSFPsbeR+F
	 WdTrNUVMNE3NqjkKuuUEU3XjOqPyzC+tB5X75gM6ECkLdkYT/TLKFVkarIww13K+NN
	 a67IbVnasQ8pYztRYA44QU4FTSSTnXKK0pkmmDO3OORYZ72O809a6/MzfqPAhDlBXQ
	 QFG4Cu5lFPfvesFiobnQwRZhhPV+cV9ig/KB43HBjmKRCd53r8yMoHqEi0SfiXcJjb
	 R5XVKTEcDWrbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 16/36] pinctrl: airoha: minor improvements
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:56:42 +0000
Message-Id: <20260805125643.B58681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores the argument for PIN_CONFIG_OUTPUT_ENABLE and P=
IN_CONFIG_INPUT_ENABLE, incorrectly enabling output or input even when expl=
icitly requested to disable them.
--

--- Patch [16]: [PATCH v10 16/36] pinctrl: airoha: minor improvements ---
commit 4b2c740f295974755e7cd78a7cde87ad90927662
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: minor improvements

This commit updates the airoha pinctrl driver to use the field_get() and
field_prep() macros instead of direct bit operations. It also improves error
handling across several pinconf setter functions by checking and propagating
return values.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index e4ccf357df892..f9c126a2f2791 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2996,7 +2996,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *p=
ctrl_dev,

[ ... ]

>  		case PIN_CONFIG_OUTPUT_ENABLE:
>  		case PIN_CONFIG_INPUT_ENABLE:
>  		case PIN_CONFIG_LEVEL: {
>  			bool input =3D param =3D=3D PIN_CONFIG_INPUT_ENABLE;
> -			int err;

[Severity: High]
This is a pre-existing issue, but does airoha_pinconf_set() ignore the
configuration argument for PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE?

When the pinctrl generic framework parses a device tree "output-disable"
property, it translates it into PIN_CONFIG_OUTPUT_ENABLE with arg=3D0.
Because the "input" direction boolean is derived exclusively by evaluating
param =3D=3D PIN_CONFIG_INPUT_ENABLE, PIN_CONFIG_OUTPUT_ENABLE with arg=3D0
evaluates to input=3Dfalse.

This causes airoha_pinmux_set_direction() to incorrectly enable the pin as =
an
output instead of disabling it, which could cause a physical short circuit =
if
an external component is already driving the line.

> =20
>  			err =3D airoha_pinmux_set_direction(pctrl_dev, NULL, pin,
>  							  input);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D16

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A43F326E
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054879; cv=none; b=gBR/Qfnk7aZ30EMNuZD9kkqrCITxFkJ6i6DUHYd3krkOWnkw18Wy6k3bKaViDoMXtVfvwF66JIUbscQtvg2penqDG03rrbcP22p22AQaujJ5+qRAXT2hU7wNPgqCf/Ecv7Y4lz0zotjBGb6dYlzPOB3Agt8U3qWcNjOq6/DKvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054879; c=relaxed/simple;
	bh=Ubqeh4ysoVTjf8QS5IMqiT0ypaEwHqrKyRiECc56cyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZBsixOJvc/BXKkJMTv9SUjLAA9PGgiFE3GnelbBwveCpEbwoyRQ8Kfyyij78d5QmCkR6YE9ZOIvyjemMj/AuhlIlHnzOCK6uPyYHlVqAYjGnXSyPJWaq7lwmvztl/IeQWZdgPWwuNszZIN/CN3mznZgY1YhkG456oeYtPff5c98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lc1AHV+A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lc1AHV+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1BB1F000E9;
	Thu,  6 Aug 2026 22:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054877;
	bh=H6ll9z55+TifrhC7mTcFXmLub2h/YqoVtx0Z15IJpTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lc1AHV+AB/ImT24UeR1pUBRjgvVNlw6jt85HPgVP8BbdgPWcAtCE7V/dhfrub0GF3
	 EYBWsWi1AnTlBCu9yhowXuKM8ranK/uBF2INWJoIQPkss58OuN8dS+sjdPHrF9IM2h
	 ic7b2kw/XykcPQqbP6aDGF65WD5unzGtR2X3oHH3A+ZXl6hiMa23xVitOY8sLmkuxM
	 18WCEEfQW686lVsK9ZFWw4vF8IWBoARerjW1/oUyexXD3E4DCJbouLVZPhunRWVTUI
	 CohBjOCCVfX8O9j5Q3IIk46xstZ8aexK4HvvIUbdHn/4zcRjmgvjgm3ddsBtOqsAPE
	 GRpYp3h4hQD8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 17/37] pinctrl: airoha: minor improvements
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-18-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:21:17 +0000
Message-Id: <20260806222117.BB1BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver completely ignores the `arg` value for `PIN_CONFIG_OUTP=
UT_ENABLE` and `PIN_CONFIG_INPUT_ENABLE`, incorrectly enabling the feature =
even when the device tree requests it to be disabled (e.g., via `output-dis=
able`).
--

--- Patch [17]: [PATCH v11 17/37] pinctrl: airoha: minor improvements ---
commit 32427c5ad4b8147aba5933507740e1938010aa75
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: minor improvements

This commit improves error handling by checking return values of various
configuration functions in the Airoha pinctrl driver. It also switches to=20
using field_get() and field_prep() macros instead of direct bit operations.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

>  		case PIN_CONFIG_OUTPUT_ENABLE:
>  		case PIN_CONFIG_INPUT_ENABLE:
>  		case PIN_CONFIG_LEVEL: {
>  			bool input =3D param =3D=3D PIN_CONFIG_INPUT_ENABLE;
> -			int err;
> =20
>  			err =3D airoha_pinmux_set_direction(pctrl_dev, NULL, pin,
>  							  input);

[Severity: High]
This is a pre-existing issue, but does this logic handle the arg value
correctly when a feature is requested to be disabled?

The code calculates the input direction boolean purely based on the param
type, completely ignoring the arg value. This means if a device tree
requests a pin to be disabled (e.g., via output-disable where arg=3D0),
the function will still enable it as an output because
param =3D=3D PIN_CONFIG_INPUT_ENABLE will be false.

Could this lead to unintended hardware states, such as pin contention if an
external device is actively driving a line that was meant to be disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D17

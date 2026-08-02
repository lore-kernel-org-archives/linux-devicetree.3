Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D228CF5F
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674727; cv=none; b=P/PZQBscUIQu/ZaRYp7GmCIbp1bs23G2MfBwk4d+a3F5sxggDoVCNwcGjyi1iINdDjO6DFKAmV9dRoI3JPWQCK2vvCIdiwg7Lv93QSMBmj+/vjbC3fyhLm+V0ZTSUPaRG72b7veIcYZ+fyc3kzABauI54LTQQJSDYNaXXQwE3S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674727; c=relaxed/simple;
	bh=R20gWZ3TDd8iVfTYJ2PlScTzFtG4EBxBavdB4Gq6FP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GPCbyQM8CT1xfxfiiyVV6WweIc30tz9zRcguGbcpG3oSBrR7suPkPzpgLBgloze4nvJ8Vdumlp16iWv25WwIBTpLyeetKrhplM5cmDtGHV4y8fs/H5VtFbnInUNr8iVMw0XH12Ju+UCBQRJL7hq9hbjICR5BhtTx3fSBE4GLMJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIOXG2Yz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIOXG2Yz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272831F000E9;
	Sun,  2 Aug 2026 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785674726;
	bh=8CEZWIE4kDJq0cJ7SkUpt0Ah43ixcSsukMifKFuXnGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iIOXG2Yz1fsFV+Dn1eGHUmjUMX+ZQxLpAPUaeRhKuImQooivQ2au9zpkDeMdz0IJ3
	 hayXdUCyWHhcOoMvJPux5LpItaf7PTAOqAw8Xp7wna0BxGYlMfpPlS/q20cKp5Fnya
	 DoIrDma/XUaKeTnpqSzTw5Cvuu3GvF3h1tQKNnAyxLo91/ARE/iPocBzAljTQRzUUl
	 r7dUZcuMyj1bh3Z2+aNzU4IPHF0xENGsUZsH5gmrW1HVDciMsOgW/xdAh/lZmCTWnn
	 m1uXP/sDqrpigUPj3JEqlm6wURhayVD9O1vGY0A7XStgrjCojiM84tFAktpniBWtLM
	 PUZT5rnq784cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: sound: Add NXP TFA98XX TFA2
 amplifier binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-tfa98xx-upstream-v1-1-4dd55cdd658a@ixit.cz>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-1-4dd55cdd658a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 12:45:25 +0000
Message-Id: <20260802124526.272831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema fails to implement the compatible strings and IR=
Q properties promised in the commit message.
--

--- Patch [1]: [PATCH RFC 1/3] dt-bindings: sound: Add NXP TFA98XX TFA2 amp=
lifier binding ---
commit fcdff8de986493484ef077c116e00cc54ac329f0
Author: David Heidelberg <david@ixit.cz>

dt-bindings: sound: Add NXP TFA98XX TFA2 amplifier binding

Adds a YAML devicetree binding schema for the NXP/Goodix TFA98XX TFA2
family of I2C-controlled smart speaker amplifiers with on-chip DSP.

> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa98xx.yaml b/D=
ocumentation/devicetree/bindings/sound/nxp,tfa98xx.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa98xx.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,tfa9894
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1

[Severity: Medium]
The commit message states this binding covers chip variants TFA9872
through TFA9912 and documents optional IRQ GPIO properties, but only
nxp,tfa9894 and reset-gpios are defined in the schema here.

Since unevaluatedProperties is set to false, won't device trees attempting
to use the other variants or IRQ functionality fail validation? Should the
additional compatible strings and IRQ properties be added to this list to
match the capabilities described in the commit message?

> +
> +  '#sound-dai-cells':
> +    const: 0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-tfa98xx-up=
stream-v1-0-4dd55cdd658a@ixit.cz?part=3D1

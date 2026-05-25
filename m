Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF582D77E6
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701374; cv=none; b=UKHz8nFIqtnOSoaac0Q3w3B6CfnqKw68wgn0ahay0rb7FTfIvVLf+O0cFEkIiKD6hXw8dgY+DoeDnJQN2rwDdThMOH2oXJheay8vm/+zzY7YOMQURf+ANof7jnVU1NZs66/Ej59pLuufk63uNX2faCjoqatQrapXvXBI9AdldMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701374; c=relaxed/simple;
	bh=bM1y9pbnzmvjZLaDgRtGlRS2w6oJe55Kbt4yC6XghJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hywaIytSZgqpQ48LfJuPzS7Jygf7ELkpP9+4PwDWmomJT8GcKRFQCa+l132OzZWwN8jejwB0oGl2nNNSBehmiIU3euvOk7HB6f7R56e09GdDqcnGdN/54Kw8tuvoCEV1T5wNtg3YOZAQS8el4Io7so6WeJwIK5YnW/mbBvGzR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7AF401/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7AF401/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711941F000E9;
	Mon, 25 May 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701372;
	bh=IRMDHvfyp8yQUIBCMBVZ0p641Sez4Lb62bHR8RkKngY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N7AF401/UR0+EAJCMTByzoH0ebF32l2hjUtk+n5uM0p6MlEveYnjQEqvOowiJNkWl
	 EKt7AWua+zK4iZpISAxgkkXfsURIDN/SzzyUtNhVVidoHdsSJo9i5upqf5JjQ2s6Z5
	 FswKup1ndmYGX6lYXmGam3ZyvPjdYi8q4C5BRI4yOiiVEd+jMEg5lshuOD8OsTc2aa
	 kr5AU6iZ50+NH2G6/Y5MFfJEX9Kre2cOYkQSMi723DizpaZHDD9lmQ5BNi8ZG8F1ES
	 I7KSii8OY2f3WJO0VKvUpew9+WGG4fL2CQ7esFFwmW20UqirKcOkTiCJfqZiKkeFnk
	 iXIBYuRMdO6gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nau8822: Add supply
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-nau8822-reg-v2-1-7d37ae393e46@flipper.net>
References: <20260525-nau8822-reg-v2-1-7d37ae393e46@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:29:31 +0000
Message-Id: <20260525092932.711941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the description for `vddspk-supply`.
--

commit 2a0698dd10cf90a92b31e252ae2cfd2a236cf2d9
Author: Alexey Charkov <alchark@flipper.net>
ASoC: dt-bindings: nau8822: Add supply regulators

This commit adds optional power supply pins (VDDA, VDDB, VDDC, and VDDSPK)
to the NAU8822 device tree binding. This allows device tree users to ensure
correct power sequencing before communicating with the device.

> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> index cb8182bbc491f..cf4c130382411 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml

[ ... ]

> @@ -30,6 +30,20 @@ properties:
>    clock-names:
>      const: mclk
> =20
> +  vdda-supply:
> +    description: Analog power supply
> +
> +  vddb-supply:
> +    description: Digital buffer (input/output) supply
> +
> +  vddc-supply:
> +    description: Digital core supply
> +
> +  vddspk-supply:
> +    description:
> +      Speaker supply (power supply pin for RSPKOUT, LSPKOUT, AUXOUT2 and
> +      AUXTOUT1 output drivers)

[Severity: Low]
This isn't a bug, but there appears to be a typo here. Should this be
AUXOUT1 instead of AUXTOUT1 to match the actual pin and driver definition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-nau8822-re=
g-v2-0-7d37ae393e46@flipper.net?part=3D1

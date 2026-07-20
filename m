Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200D83B42EC
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541029; cv=none; b=XcACidxywCXZznchsv71tVtUbLClWmrW1ZS2QelALrTWljm48lTLxsh1ADpd+DqOB0eP5CvC3l8LwXv7IjZZLtMZfwj4eIPySfQOjtM5XGW94IkzIR9+cE0VutW7zglj8pNQFcDvUOwa4xpj3oulEiF2Z4lmOaGmSpYxQeV0QEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541029; c=relaxed/simple;
	bh=j5KLpXH97QTJPsuyNs9IWcF7D50RB5BsLv8p84nqzoE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d6go4hCHbb/Sm+vl+teCcTxGotLJCYOuPcb1aYd6B1erU6GZwNZ6EiVsfsMavSV2b9gxaSuG4gzk3UxscE2d1MNjm7xKPxGKgPsg79c3k8XOowxiK7KhoLeet/6pcrQh9f/XBPvotKHMHRvNokoncMkE4rVoqJk75gmjXW2J5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btTAHEJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btTAHEJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76CC1F000E9;
	Mon, 20 Jul 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784541028;
	bh=gcbk7oq7YQ7lY797Yc/1yMaXGRT5y3yWZ95vMphyE8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btTAHEJButMU0LJN+BcXT+o1U+sNg6wYrJZZ1HWunMkMCkuVdvBt3vzhlckOZoi1B
	 oH6z0oRPBb0WZku38YI2H3XsdlQHgLtlWo6fcV1nCNSyq4iMrPL9vW4Kg1UtUnb9T+
	 lf1rbSRI6vsBRV3xjfli3XqwgKeNDGbk9/frCegA8jeVaoixX9VAKaphR0kqExuV8R
	 Xn4vvf1wCOM6KlMAkdGPMm1QCO8vdBb+QnrsOaIjB5j7JHdGh9cIBeBu78TmhYb8F1
	 KGH6uDBe772zKuF690rMh6mrfWmgTSJGkqoYzjC24EolnA+CeeSzp30J5rFYLdVR81
	 M1ktwnbH4Kj0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <67d51a7210f0d7410dbe34e3d93813db1fecd622.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <67d51a7210f0d7410dbe34e3d93813db1fecd622.1784539788.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 09:50:27 +0000
Message-Id: <20260720095027.B76CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding description states the device acts as a syscon provi=
der for shared registers, but the schema prohibits the use of the "syscon" =
compatible string.
--

--- Patch [1]: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM co=
ntroller ---
commit 06ebdbe78362ab02ea5e88d503ad7c179855b48a
Author: Naushir Patuck <naush@raspberrypi.com>

dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller

This commit adds the devicetree binding documentation for the PWM controller
found in the Raspberry Pi RP1 chipset.

> diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> @@ -0,0 +1,66 @@

[ ... ]

> +description: |
> +  The PWM peripheral is a flexible waveform generator with a
> +  variety of operational modes. It has the following features:
> +   - four independent output channels
> +   - 32-bit counter widths
> +   - Seven output generation modes
> +   - Optional per-channel output inversion
> +   - Optional duty-cycle data FIFO with DMA support
> +   - Optional sigma-delta noise shaping engine
> +  Serves as a fan speed provider to other nodes for a PWM-connected
> +  fan using shared registers (syscon).
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,rp1-pwm

[Severity: Medium]
The description states this device acts as a syscon provider for shared
registers, but the compatible property is restricted to a single string.

Will device tree validation fail if a user includes the "syscon" string=20
normally required for standard kernel syscon lookup APIs alongside the
"raspberrypi,rp1-pwm" compatible string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784539788.gi=
t.andrea.porta@suse.com?part=3D1

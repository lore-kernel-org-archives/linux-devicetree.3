Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68D3090F4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351585; cv=none; b=XjL0taIDkTTMkMCvO4Jlkoor/G7ngSKaBbxTF6J3RKWTxaJpyofhO11LRiZzuYUaEMc/Lw1NVGcVRWXg+in+DGX9nEDBRlcot4xJpp43Nai9iO3rMVapiJPCnjwTspDwyOMCZt+a1o70bdfpNPffJzWGUdemoIqsF3hZpECxrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351585; c=relaxed/simple;
	bh=9DjWiZ9eKzjV/RR+718cLs9IsQ4urlE0+mMcUsf7q3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d0KkZ8jayF8HCgOprq/Wcagz7czDHFnJRRQzpUAOK5ha39Eb07ORb9E8iRBgI4pRn6BF9wHLLDL6R7HdViPWp3rDz3gq9ggpBlBU27NsCHkzHyF7hx04xHdp0bmsMCNI3a2hU0lzc7jcjbgsDkkxQd5bsRWBzLy4dnN3zWQOkJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgpDwOz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgpDwOz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDAC1F000E9;
	Thu, 21 May 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779351584;
	bh=LR96YHAoUJW/rEF9Igwm6oGauP81UOFaTxSLrGbLiFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LgpDwOz/fj3WNNACrPxJpGXHKjQKTsfmlU1z6vz0x6PRI/ZTSs90YvUgT6b2DaJ3V
	 yz/Qp/9dFctkOlpRcKcVAbKzdtamfGjuchIRYeMc7bLxJqoEPYALXJuFPOfdpX3+i6
	 IvE9TZN09xVisq6tS5EnwG7ME15nk9IrJVjKALS8deaMk+wR1YIvuYceq3E1wmQo7K
	 mN9d7knF3zbLzyCy8/Gych9teDrfkEICYUobBnBk3SrmUfpz+kbZ1LaVq4jH682MOK
	 yKbTLPPBelo9cCW9ej+TdnFybSkLPjG1QEHd63W4Ifowf84Tv5ta+EoHqQeNRTH7Qr
	 vyC6LxbcYljAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: backlight: document the
 SY7758 6-channel High Efficiency LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 08:19:42 +0000
Message-Id: <20260521081943.4CDAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing main power supply property (e.g., `vin-supply` or `vsys-sup=
ply`) for the LED boost converter.
--

commit f0b2513f96c13c59660da8495c808919bb4b44ab
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency=
 LED Driver

Document the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control.

> diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7=
758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.=
yaml
> new file mode 100644
> index 0000000000000..80e978d691c29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: silergy,sy7758
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddio-supply: true

[Severity: Low]
Should there be a vin-supply or vsys-supply property included here for the
main power input?

Looking at the driver implementation, it references VBST (V-Boost) register=
s,
confirming it operates as a boost converter to drive multiple LED channels.
A logic I/O supply like vddio-supply typically cannot provide the high
current required to drive a boost coil for a backlight.

Omitting the primary power supply could prevent the kernel from actively
managing the main power rail on boards where it is switchable.

> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +required:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-topic-sm86=
50-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org?part=3D1

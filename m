Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F1348875
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626645; cv=none; b=sMZA8+2b3OODRiM8SI3eB6dHcd9klcmavncfkLLmJgtO+tHQriiDmog/4BQRB7GsviFEMTjUJk1eT/nWeVaqN/1zPEQfO0iRjBtRGdGB740dY4zY31eLyBZAaAwkm3lYREO/mVh9rwzTjNjbC58y3tVYUh4mXM6egTKdo5kRw4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626645; c=relaxed/simple;
	bh=dkxn2GO0ZgMae6JUdwGeKkp5CIMOjWsbXU9Xnou0dXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A/Rzhh6LCQKA3EmECPnxkyCgNzIQvWgwL+KNGbY3NI/KjdOE1M/YUEaC2e7MV+g7YmSf28buyuK71lSVFX7UYfCizh14MO8vTtFXnMrxcd4e+BczohU3W/jJMHXU9/BlRP/ek0DIrQu6meolijMBMEaftDja76zu0tPR0oZIbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE8FavwP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE8FavwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DC51F000E9;
	Sun, 24 May 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779626643;
	bh=Puzl9tSnk1i9pojV7uiHbwzmAIqZ/OPymEBi0E/FaJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mE8FavwP4wsf/MH+5IB5J268ID9VzeA6RTQp1ff+U9fs798/RyvRA3RB3zayKPFll
	 5qmijhw9qtGHGPTYVD9TFHIfXtI0Ylyx8HMGRFsqh8dE3YU9IRBEVJqoY0ByH/YrUi
	 M7lhOGqomzxirRuZTXCzgo0H3de0gT4Ol+kz7hHDJjVF7tbhjYZV6QX6i6EPFRv9Th
	 kungnMpg6WnZHMFE0ztOAOZo130Fr3rJzjuO41qWHh/aNizcWFqLxuBBjxFaArbkoQ
	 8vMcUyaSPbAbwFvtwXe0omtKmTWy01WNiyFWe5Hwub5vlHwM46thAlsdoXeiG4YoQC
	 We7tFlQ6OzHjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: sound: asahi-kasei,ak4118: Convert
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524123415.108301-1-manishbaing2789@gmail.com>
References: <20260524123415.108301-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 12:44:02 +0000
Message-Id: <20260524124403.57DC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The schema conversion incorrectly replaces the 'irq-gpios' pro=
perty with 'interrupts', breaking compatibility with existing device trees =
and the driver.
- [High] The 'reset-gpios' and 'irq-gpios' properties are missing from the =
YAML 'required' list, weakening schema constraints.
--

commit 0e4f9fd8065be8e0dd8e4f0d56bb269c25f2d4bb
Author: Manish Baing <manishbaing2789@gmail.com>

ASoC: dt-bindings: sound: asahi-kasei,ak4118: Convert DT schema

Convert the Asahi Kasei AK4118 S/PDIF transceiver bindings from text format
to YAML schema.

> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.y=
aml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml
> new file mode 100644
> index 0000000000000..54cee45ac0513
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml
[ ... ]
> @@ -0,0 +1,57 @@
[ ... ]
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Critical]
Does changing the property from irq-gpios to interrupts cause a regression
for existing device trees and the driver?

Looking at the original text binding, irq-gpios was specified. The driver in
sound/soc/codecs/ak4118.c fetches the interrupt line as a gpio:

devm_gpiod_get(&i2c->dev, "irq", GPIOD_IN)

Since the schema sets unevaluatedProperties to false, existing device trees
containing irq-gpios will fail validation.

Additionally, if new device trees use interrupts instead, won't the driver
fail during probe due to a missing gpio?

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO used for the Reset pin
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"

[Severity: High]
Should reset-gpios and irq-gpios be included in this required list?

The original ak4118.txt binding marked both of these as required properties.
The driver unconditionally calls devm_gpiod_get() for both reset and irq
rather than the optional variants.

Omitting them here could allow incomplete device trees to silently pass
schema validation but still fail at runtime during the driver probe.

> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524123415.1083=
01-1-manishbaing2789@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7534C225E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405077; cv=none; b=d1QD9m2gnfNXsc6JsX84Flu+wyxeEn3bm+WvyZ/vzFRujHL/hZchuKCVCC5PoPrAsWiIvb87pKXrnPgpgMV6cBU3Tyjlk1jyusCpVSNWLKHZRR7Iz8TlTUICBrgz/Xp+k3GIZd7tvAb1t9oJj3Rt3jiiCw7nNLUokBlICPU0GOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405077; c=relaxed/simple;
	bh=9TRijPiCN81yUZ8unaN1ldgNEY8M2IkorE3I0wfwNoU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WXV6OtTayU37kI13Vp5bmCKbbDv6eWDRf4osii+AQdvfX3wbt9WnXQSti+uMZ0h2S1h+HacByFNjwrHxHCUPRXxfMjl7ER/V7FrOGk7iVrLXiyH4jby6ZfBQ6lcxCbsl3ss5WRsIL8Lc5tlWeMqxMFeaIjgwlo+AEa51zoxC05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwWJAEyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwWJAEyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31B11F000C4;
	Mon, 19 Oct 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792405076;
	bh=f3zEtZMBUT+8tvpp10Hi7QYqDRJCmiNGuqw7V4DII9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JwWJAEyGMlk+KP+oXES4hZFklsUvTcXLy03Puv7yhkW5ZjoWdozvCo9zufftxCQ08
	 85skl5ik56dsmk5iz6330WV/nmHwKG/NNsb6TPg7rP6noDQddmYmCiAEAGAHNMrZQ+
	 Zoa4ADhZ94XCX2zURp866I2si56+4IFCXnc8fHikyXbp55MwDmvWFNQ8j6VDEX2k0Z
	 Sr0Km4WwdVslZcMFqNxGJjwFrFR37qiI1OcqfzwO6XtIKrUx8YlgpHKftrb0dUDZYi
	 5ir4RCN2PfPHp8S6bHQcEQNS0BE1ASDcwTe0mMWe9cibKCbcHZj6Np9XnyXWxpMiqj
	 Sb2civplRim0Q==
Message-ID: <sashiko-outbox-176971@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Document FM34NE DSP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019101357.117462-2-clamor95@gmail.com>
References: <20261019101357.117462-1-clamor95@gmail.com>
 <20261019101357.117462-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:17:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: dsp: relative $ref to sound schemas fails dt_bindin=
g_check
--

commit fb615b13d5875feacbe1263da737f849cd8294c6
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: dt-bindings: Document FM34NE DSP

This commit adds a device tree binding schema for the Fortemedia FM34NE DSP
voice processor used in ASUS Transformer devices.

> diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/=
Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
> new file mode 100644
> index 0000000000000..46308a462af16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Fortemedia FM34NE based voice processor
> +
> +description:
> +  Fortemedia FM34NE is a hardware voice processor (DSP =E2=80=94 Digital=
 Signal
> +  Processor) designed by Fortemedia. It specializes in real-time audio
> +  processing, focusing on noise suppression and echo cancellation.
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asus,sl101-dsp
> +      - asus,tf101-dsp
> +      - asus,tf201-dsp
> +      - asus,tf300t-dsp
> +      - asus,tf700t-dsp
> +      - pegatron,chagall-dsp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Master clock to the DSP
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  bypass-gpios:
> +    maxItems: 1
> +    description: Signal that switches DSP into programming mode.
> +
> +  vdd-supply: true
> +
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false

[Severity: Medium]
Since the $id for this schema is under /schemas/dsp/, relative $ref entries
resolve against http://devicetree.org/schemas/dsp/. Because dai-common.yaml
and audio-graph-port.yaml are located in Documentation/devicetree/bindings/=
sound/
rather than Documentation/devicetree/bindings/dsp/, won't these relative
references fail to resolve during dt_binding_check?

Should these references use /schemas/sound/dai-common.yaml# and
/schemas/sound/audio-graph-port.yaml# instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019101357.1174=
62-1-clamor95@gmail.com?part=3D1

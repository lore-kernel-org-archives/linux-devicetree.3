Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD923B3887;
	Mon,  8 Jun 2026 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914451; cv=none; b=PGxJKPEUpxQHowvz3K/eBMvugp5/XO3ClESr9hTpxUnZd1jvfdMv0vmcjjub1E4bf9gipaAS81s8vzREIjO+9xtfvQIFFS8ogCwU5uVRKK6nXJw8mBbs/cLCJktpnCnfLUo277frR4IWANqADcPSsN3gZEh8/cficyW6+x7zQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914451; c=relaxed/simple;
	bh=o+cjUESU9sSllbxkX/C5btO4wbTI7+Ur5mkM84/pXCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cwrl7E4Xy5Ch/DNrwyDqrrYo6KVFedUxtOonQQmPQ2vtNb5qOZdW0X5gk9VsVDCf1fFxJJqmzPVEpuLQLmDCbFvedVz06JOU37xPl7o5Rqx8S/R7+bAuIKgNskEBG9DivM7EIMSED7A6iMkf9JXTOhxLNo8kz8a4qF/a9mpm3OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLMZS0wb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLMZS0wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B21F00898;
	Mon,  8 Jun 2026 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780914447;
	bh=TyNxqtslFZQYuMq/6mJiwQMsItsR5jg1yBQCfcCkpRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iLMZS0wbT0MskX7TsYLWEyQWZNNfIN8vAxwT+IUiXaVV9lQGfbRQIVrZa+Lfe+soz
	 nbyuUYJ61azgueRWmIbMSbFmZQLak+wWRMrKVEOwKKhtUsbUWPWLnMtbxfUYO4pk6H
	 bVbf2hxKBawbBo3QYk6hiDx6sdBleZujH2mfAoNcPhnrgPSdzpeMs1pWyolrS+7cTH
	 NMrkg1abpxLO28mPZQieGPKt2Ywh9IBXOlmeUfRFYfC4sltO0oQPY07goCf7jzkJCs
	 H5VJO2f4RJbJ2P9hOzt2h+x4VIflZm01e8HJzEubbS0BdJ+Ynt89AR1TYrQC2ecfp9
	 7zQ5+e9AjqNTA==
Date: Mon, 8 Jun 2026 12:27:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: mfd: add ti,lm8502 combo LED + haptic
 controller
Message-ID: <20260608-expert-mustang-of-superiority-fd5ce2@quoll>
References: <20260603080256.853037-1-github.com@herrie.org>
 <20260603080256.853037-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603080256.853037-2-github.com@herrie.org>

On Wed, Jun 03, 2026 at 10:02:56AM +0200, Herman van Hazendonk wrote:
> Add a YAML binding for the TI LM8502, an I2C combo LED + haptic

DT binding. There is no YAML binding.

You sent multiple patches on the same days, multiple versions, not
waiting for review and causing SAME review comments.

Please slow down.

Only brief review follows and I will mark all your further other patches
sent so far as changes requested.

> controller used in the HP TouchPad tablet. The chip is exposed as an
> MFD with two child sub-nodes:
> 
>   ti,lm8502-leds   - LED-class outputs D1..D10 (with per-LED reg
>                      and led-max-microamp properties)
>   ti,lm8502-haptic - EV_FF / FF_RUMBLE input device for the internal
>                      H-bridge vibrator output, optional
>                      ti,invert-direction property
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../devicetree/bindings/mfd/ti,lm8502.yaml    | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm8502.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml b/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml
> new file mode 100644
> index 000000000000..10f2e32a0738
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,lm8502.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM8502 combo LED + haptic controller
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |
> +  The TI LM8502 is an I2C combo device with ten constant-current LED
> +  outputs (D1..D10) and an internal H-bridge that drives a vibrator
> +  motor. Pin D10 is shared between the tenth LED channel and the
> +  haptic output; the haptic driver writes D10_CURRENT_CTRL = 0 at each
> +  start to mux the pin to the H-bridge path.
> +
> +  The chip is exposed in Linux as an MFD with two children:
> +    - ti,lm8502-leds   - LED-class outputs D1..D10
> +    - ti,lm8502-haptic - EV_FF / FF_RUMBLE input device
> +
> +  The parent node owns the I2C client, the chip-enable GPIO and the
> +  vcc regulator; children share access to the parent's regmap.
> +
> +properties:
> +  compatible:
> +    const: ti,lm8502
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description:
> +      Power supply for the chip (V_DD). On platforms where this supply
> +      is provided by an RPM-managed LDO with "regulator-allow-set-load",
> +      the driver will request High Power Mode (~100 mA) so the internal
> +      boost converter and ten LED outputs are not current-starved.
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the chip-enable pin. Pulled high by the driver
> +      at probe time and dropped low across PM suspend.

Drop driver references. Actually description is redundant.


> +
> +  pinctrl-names: true
> +  pinctrl-0: true

Drop both

> +
> +  leds:
> +    type: object
> +    additionalProperties: false
> +    description: LED-class child for outputs D1..D10.
> +
> +    properties:
> +      compatible:
> +        const: ti,lm8502-leds

No need, drop compatible.

> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^led@[0-9]$':
> +        type: object
> +        $ref: /schemas/leds/common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            description:
> +              Zero-based D-channel index (0 = D1 .. 9 = D10).
> +            minimum: 0
> +            maximum: 9
> +
> +          led-max-microamp:
> +            description: |
> +              Per-channel current cap. The chip's MAX_CURRENT field
> +              quantises this to one of four buckets:
> +                <=3000  - 3 mA
> +                <=6000  - 6 mA
> +                <=9000  - 9 mA  (default)
> +                 >9000  - 12.75 mA
> +            default: 9000
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - compatible
> +
> +  haptic:
> +    type: object
> +    additionalProperties: false
> +    description: FF_RUMBLE child for the internal H-bridge vibrator output.
> +
> +    properties:
> +      compatible:
> +        const: ti,lm8502-haptic

Drop compatible

> +
> +      ti,invert-direction:
> +        type: boolean
> +        description:
> +          Flip the H-bridge polarity bit in HAPTIC_FEEDBACK_CTRL so the
> +          motor spins in the direction the board expects.
> +
> +    required:
> +      - compatible

No resources here, so this haptic should be folded into the parent.

Best regards,
Krzysztof


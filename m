Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618693148C5;
	Mon,  8 Jun 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914479; cv=none; b=OVg0RvQUJFScMFZkcvI8IcC/H5xkDUZf20FeKdDPTFf6ci4kQP3fBL3hMiwpB11f7cGzHdT6YbetAxW5uKyH6aiDjgIdiJ56Klil/H4w3OQytffgmt4Cp2m+3Am78sXIvRawowtekEnxJcZJ5x658EzyHfUYbRmmMjMuIly0p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914479; c=relaxed/simple;
	bh=GKz3mt5ASiHP0LOj/cTVhMIUUhoOQRuHnlAYso30/2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE+B0/L/nCt6sKW8MJ+C/l43YZCzu+XTCQCy2TFL6u/1ncEhMDYW2EWBWYZlzmSeyysguFbHArThxpRGcm/P7mOJvw/CzLnM3hL9+9+Va5EitnRTJq0MGIMs9BmpH8KPvl1g408tBn7pn60vP82SphM2YMthQAUGIFFLBNmekSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaOBTIqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaOBTIqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EF01F00893;
	Mon,  8 Jun 2026 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780914478;
	bh=wfs3rcPBNb033TIU8tcuziHt29xgmyYpwBKEJ4uT5yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CaOBTIqCDS3Q3IedCquU4mE941UX0zNuCUbFHK6due4658TjeBWUAFUysm9jWdqXY
	 hlMlSDDcvdQ52KNhwmkP0xxC8UCL6S0jUy9S7ZsWph2HqDQ7H6aGqcFGTDMKmDZGGU
	 W9zEo5B8B8qBJjojeND933Iac0mfca+xtnVLsJ7ikqdixSL1HtcESSNZJQ0wPmwpOV
	 LJvdnbCaRt5UJTzfbVL/jqlyrY5zx0Bw7V2NzAFPwDNRdqJyU5/NA+VOiup0blczgw
	 uJmbnIliKfbF7dwpX7ZpqBXybyOZp0VsKEF5f/rxugtMAMN4p06pgfiYhQMYvcJGCy
	 B2e66/qecpfQg==
Date: Mon, 8 Jun 2026 12:27:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: mfd: add ti,lm8502 combo LED + haptic
 controller
Message-ID: <20260608-crazy-ruby-impala-c7e9a4@quoll>
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

And where is any user of that? We do not take unused bindings.


Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CB1C01
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852274; cv=none; b=Rv1gEX8Nl5FJnM8SBZdyxTdXpBbj1MzUxjmpFUzmMPUkk15JhnBABh7vm6YDVN4Mrk76FMkYmEJ29gPkOKtD2VLJJyRn3VYtQOSKj3ZeTlNgMma2IhlDaHNCru8gI4qNRKTBjyTwJ+7UaE6IBYwtsXlZpp5KKMCPgRkpWZ17iQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852274; c=relaxed/simple;
	bh=5RxcRtRvC4CWnlhMY7jHn9+L7s5FqDGhofLNMgKGbaM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXKh7laPr1FlUO6xQTG6qRmUNgVGpdU4iROmW3qpvJPtcWOQNNYzM0tTq8XPAKeAEtMD9aKENcSfg9NWUvrT9vzAompgM2hpuRqUTteXX1mrVK5ZleD3UAv5bB83PgkddlLu9MBC4IwbJDHxrZDUV9/tbu5PQjtXJ9QiM09tju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTmRGnJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTmRGnJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3CCC2BCB0;
	Fri, 15 May 2026 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852273;
	bh=5RxcRtRvC4CWnlhMY7jHn9+L7s5FqDGhofLNMgKGbaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lTmRGnJZh5kvnB3i9tAvvKgP3YNwyKHLv3q5Bh8stwGWKRKsNiYndq+MsrgsLKicX
	 SFUsbzhTLr2yP14srx9k1YtvXMfCfJvXoJHI4vA4gjrw3x8r6MzB4A+w1vGT7U2jzd
	 xsFtpmlEsL+CC2NFjAp8md3cUf/j0JiHvXhs8/G3Qp3gZOWG5+WPS4RHisw/cnUwg/
	 RivbdjcK8xai3KjlGPkhT27dN5qVOJ8SsB+N5LiJa0r6g8PpqrbCUMrKH4PAQB6k8/
	 8Fv2VU8RHnqOGN4s9bpajtEnuZbz0mNgVc0PadnM8Iu11I+TM4z0fNyJZccFjtIVCb
	 twEHnVoFQxBCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/6] dt-bindings: iio: adc: add AD4691 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-ad4692-multichannel-sar-adc-driver-v11-1-eab27d852ac2@analog.com>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-1-eab27d852ac2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:37:52 +0000
Message-Id: <20260515133752.EE3CCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines GPIO controller capabilities but omits `gpio=
-controller` and `#gpio-cells` from the `required` list and the `examples` =
section.
--

commit 5576d49868d1ae53d794381f2b3e2079954441db
Author: Radu Sabau <radu.sabau@analog.com>

dt-bindings: iio: adc: add AD4691 family

This commit adds device tree bindings for the Analog Devices AD4691 family
of multichannel SAR ADCs. It defines hardware connections including power
domains, PWM, reset GPIOs, and interrupt sources, along with providing
two binding examples.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> new file mode 100644
> index 0000000000000..af28a0c1cfa9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml

[ ... ]

> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  '#trigger-source-cells':
> +    description:
> +      This node can act as a trigger source. The single cell in a consum=
er
> +      reference specifies the GP pin number (0-3) used as the trigger ou=
tput.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vio-supply

Since the binding defines the device as a GPIO controller, should
gpio-controller and #gpio-cells be added to this required list?

Omitting these properties from the required list might allow incomplete
device tree nodes to pass validation.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    /* AD4692 in CNV Burst Mode with SPI offload */
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "adi,ad4692";
> +            reg =3D <0>;
> +            spi-cpol;
> +            spi-cpha;
> +            spi-max-frequency =3D <40000000>;
> +
> +            avdd-supply =3D <&avdd_supply>;
> +            ldo-in-supply =3D <&avdd_supply>;
> +            vio-supply =3D <&vio_supply>;
> +            ref-supply =3D <&ref_5v>;
> +
> +            reset-gpios =3D <&gpio0 15 GPIO_ACTIVE_LOW>;
> +
> +            pwms =3D <&pwm_gen 0 0>;
> +
> +            #trigger-source-cells =3D <1>;
> +        };
> +    };

Should the gpio-controller and #gpio-cells properties be included in these
examples?

Without them, the examples might fail dt_binding_check if they are added
to the required list above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ad4692-mul=
tichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com?part=3D1

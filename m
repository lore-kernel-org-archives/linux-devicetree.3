Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4232419FC9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191095; cv=none; b=ItaEqDxWJLHTghbSYScZGRUjbLGSsG62SmDZD5cMj3Utc1KtXRT9v9Hy8CcBchl1p1qgEVe9BgUOQj8gH1v6RQDMNOPjcoRv8owDB2r33Fke1qnCOQh/642JvqPy2sIfp/zISc6akmP2jhVu0wlcL4FOg71raFQ0RpGpDrZvGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191095; c=relaxed/simple;
	bh=+ZkiLWXbzGLCbEfPQL6ZxVrZrx1bwgVAPiBNInEl0xU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uhWHhxYDHqBPsFdEdpTzzoC25zhacqaPm7OvqAJ+PzBiAU/uqfIFMSLVpHScv5T86zVugdrhmg1geRcHbLpZPBv8iU+ohHdtkeVvCFwn8YMx2gkxgUc9kRR7bjN019avZfDGZu+Fav7O9nYKE9fScm5Z0VeqNmDMO7MvCOWQZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKQ1N91e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKQ1N91e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AF81F000FF;
	Wed, 23 Sep 2026 19:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790191090;
	bh=iCcQql9+IkoKQJgUq9hPfdqOb3zalq63QHBUmlM3gxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZKQ1N91e0UU1ri1qlcjQvFp6F1Lj80n0kp7DH3Ke7IgmNapTSMKn/me5cd6yErLzo
	 K/qd6IQEGHWH+n4rjwt3FBTjgq9x7X8PjLy8MbBUfSTNSccF24lO9cK2VSl9FdQWzY
	 2V0/HMpgsF/RrKhCa48utpiUEJzYN/WdZ6kxEH6kiJPxxNp1WkHTjB6bi3yMs8C7Qw
	 4SGl32VHUNa/RoH7yHArW6/HLdfNlco9G7nNFtDimA0INmEMPOmhbobeOrSGPF2Ttn
	 CwFgRza3vxls/5HTcLplNDNXft6v1g22UF8TmbHgYcJaQ6QDoAWsVzwbPwzbJ9YIjT
	 QjX9trTDj2/5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923-topic-sm8x50-iio-max34417-adc-v1-1-41d4ba1bfc41@linaro.org>
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-1-41d4ba1bfc41@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:18:09 +0000
Message-Id: <20260923191810.34AF81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: use of vendor-specific rsense property instead of=
 standard
- [Low] dt-bindings: iio: unnecessary gpio.h header include in example
- [Low] dt-bindings: iio: contradictory default and required constraints
--

commit 83b0b12b383dfd05c3631355160ac1fe40dc6802
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Rang=
e Power Accumulator

This commit documents the MAX34417 power accumulator device tree bindings.
The device uses an I2C interface to monitor power consumption in portable
systems.

> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yam=
l b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
> new file mode 100644
> index 0000000000000..6f2339a927710
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
[ ... ]
> +    properties:
> +      reg:
> +        items:
> +          - minimum: 0
> +            maximum: 3
> +
> +      label: true
> +
> +      maxim,rsense-val-micro-ohms:
> +        description:
> +          Adjust the Rsense value to the resistor value
> +        enum: [1000, 2000, 4000, 5000, 10000, 15000, 20000, 25000, 40000=
, 50000, 100000]

[Severity: Low]
Does this binding need the vendor-specific maxim,rsense-val-micro-ohms
property for the shunt resistor? The standard shunt-resistor-micro-ohms
property is well-established across multiple kernel subsystems for this
exact purpose and might be a better fit.

Additionally, is the hardcoded enum constraint necessary? It artificially
limits the possible resistor values, whereas physical shunt resistors can be
of any resistance.

> +        default: 1000
> +
> +    required:
> +      - reg
> +      - maxim,rsense-val-micro-ohms

[Severity: Low]
Can the default fallback ever be utilized for maxim,rsense-val-micro-ohms?
The property is defined with a default of 1000, but is simultaneously listed
in the required array for the subnode. Because it is required, schema
validation will fail if the property is missing in a device tree, making the
default logically dead.

[ ... ]
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>

[Severity: Low]
Is the dt-bindings/gpio/gpio.h include needed for the examples block?
Neither the device tree node nor its child nodes appear to declare or use
any GPIO properties or constants, so this might just be a copy-paste
artifact.

> +
> +    i2c {
> +        #address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-topic-sm8x=
50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org?part=3D1

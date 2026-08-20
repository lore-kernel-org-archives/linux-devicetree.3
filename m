Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EAE471270
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235723; cv=none; b=WrEDO264JzRewVx9zgP48SE+s/TrNQBQ7eTquv/yTaUE8Vh8Xdo40+nGLvP1YRV8MrpxYrz+a+PkOUSL2BEc+ABZ/5IxCQd05dabL7gZsdBBj0/Zqty+qHMgn7jlO1n9Sn5PgMqBxRBnbRVPqW6MGMt/YHNer+ClDVqZREDq7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235723; c=relaxed/simple;
	bh=d4/sLQnBbH8pOi2ijZHkA7qdqOC8Epp0+tTLK6xPWu4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uDfm2RpRBQaB0x6jcxaVCdjSDK/VhwEeM9nB1cx/2KirKHV6cHEZQy92D3BQijNgsaeFruYo9xNpQuSM2KFTomA7i75aWsWhGH4vSUIhtW4n/swZBncLeqW3qFpFdbqCNP92m9JF9wIbtzbsD70tq01onfb36x42xoT/kpsQUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KT0+BGkG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KT0+BGkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97951F000E9;
	Thu, 20 Aug 2026 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787235720;
	bh=P5Bumu6GzRDOlTybl5Eu8IfIQsnv1ZPUs5a7nfwI4WM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KT0+BGkGgpoqEV6c2MuiUB+rYCneVKq6GOY199r+jZjbv1XKn/ZM56uQLkxZtO9n6
	 w4G9jP/9OHR89LnxaSDyNloMY/LUjyPTpFcxpT6n9Hh1w8FECnnH2QDLWFNJEMXVt1
	 WrVi8QfpJmwc8MtKrw9QE/bcDKL+r/Q0I/bqjwsV3jdPQMGUHfuZhUGkcOr9/EAcTN
	 KPWx9uSCOmgB92Q2L+8QMpWLBtCkl2fo0qu/W7mkgc9kgiU4RAnViZ83BZ9m7d8+5f
	 hJiEagPKdxQLU8CO1yHBFVmGPNRog8LZgts7WGG5/drof/mbqZZwVnUQt+FuIFLUh9
	 sfN2HIIaY0AZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: iio: pressure: Add MS5637
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Adamian" <adamianlouis@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820141224.23730-4-adamianlouis@gmail.com>
References: <20260820141224.23730-1-adamianlouis@gmail.com>
 <20260820141224.23730-4-adamianlouis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 14:21:59 +0000
Message-Id: <20260820142159.E97951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Making `vdd-supply` an unconditionally required property breaks =
backward compatibility for existing device trees.
--

--- Patch [3]: [PATCH v3 3/5] dt-bindings: iio: pressure: Add MS5637 ---
commit f37736f8c819b5be2f362b907ebbc2d3373ecbfe
Author: Louis Adamian <adamianlouis@gmail.com>

dt-bindings: iio: pressure: Add MS5637

Create meas,ms5637 devicetree binding and move existing devices from
trivial-devices.yaml. Explicit compatible strings are added for the
different sub-variants because each requires different constants for the
second-order temperature compensation formulas.

> diff --git a/Documentation/devicetree/bindings/iio/pressure/meas,ms5637.y=
aml b/Documentation/devicetree/bindings/iio/pressure/meas,ms5637.yaml
> new file mode 100644
> index 0000000000000..befd81d1907b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/meas,ms5637.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - meas,ms5637-02ba
> +          - meas,ms5637-30ba
> +          - meas,ms5803-01ba
> +          - meas,ms5803-02ba
> +          - meas,ms5803-05ba
> +          - meas,ms5803-14ba
> +          - meas,ms5803-30ba
> +          - meas,ms5805
> +          - meas,ms5837-02ba
> +          - meas,ms5837-30ba
> +          - meas,ms8607-temppressure
> +      # These generic compatible strings do not identify the sub-variant=
s of
> +      # the part. They are retained so that existing device trees contin=
ue
> +      # to bind, and each is treated as the -02BA variant of its family.
> +      - enum:
> +          - meas,ms5637
> +          - meas,ms5803
> +          - meas,ms5837
> +        deprecated: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Regulator that provides power to the sensor
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply

[Severity: Medium]
Will making vdd-supply unconditionally required break backward compatibility
for existing device trees?

These generic compatible strings (e.g., meas,ms5637, meas,ms5803) were
previously documented in trivial-devices.yaml. That schema restricts
properties to a very narrow set and strictly forbids vdd-supply via
additionalProperties: false.

Consequently, existing valid device trees do not include vdd-supply.

By moving these devices to a new standalone binding and making vdd-supply
unconditionally required, won't previously valid device trees fail validati=
on?

Should newly documented properties remain optional, or be conditionally
required using an if-then block only for the newly added specific compatible
strings to preserve the DT ABI when extracting devices from
trivial-devices.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820141224.2373=
0-1-adamianlouis@gmail.com?part=3D3

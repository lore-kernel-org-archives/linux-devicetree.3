Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D73168EB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561423; cv=none; b=cSeJuY1gatRi0FSNPzGUX3CqBJ7M/VmV+rxh/Bv63FmWDAXH83CqLjqDHpaZwfAcq+AQLjMBl+6xg39KEF48xi/WEHuUgMzs0kiewgsxX52ZCANa6XsSFZcRlcdMNBaGyYiSlwhDLDH6BvYPGyFQQ2BKMi/BI5ho8kclqLZ4AF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561423; c=relaxed/simple;
	bh=l+NTvZwrLFVw4yUAn5OLNZaxmixZeMtDVKxvdKo6Qbc=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bfjqyjfdxTXldxwS9OhyOvlVQSg2ENXuob0qiHwXZfdx09t2iv4jRdl4VrBkOJtuj2338gLtpQCyHMkHcrBDw4/j/SNd17JmWHOJTngaoJYtgQE+uKHIjmkr0IYM4pA3DqNft4oSWS1ENl81SvDNXmnMVzpAQQejVYQCw72NTZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6bStSOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6bStSOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DD21F000E9;
	Mon, 15 Jun 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781561422;
	bh=p5FL+SzdexA0S6HPAk/0oHX63ZZ/EQqjkZHBc3Hy5T4=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=l6bStSOZT1HFXRolKD4JdxsuKEEXX+kVipmw+LndEKACJwmIqJcMWXI7FAq4CZbgL
	 5/NcOAqK4APazhSioQiM7hCgPoN6b8iAqTNc7wwSVgwb8oleq8tH9YSvbePUqeg58p
	 fcRyXB0whJAkKvPtKhnppItAL1OSD9JSGrmfS62Gqqr33lTS1NeVRhulgBVcM3do8M
	 31aQsRRK6ZruVlimlpkH0pImttku5imw0yzP6+NqluK3my/ESGQcVWUMc/8wwiObNY
	 yRQS+HHbilzv9w4PXSu2NcSqG8SW0SNO8RpSLqTK2OaS4BRb5XigYx72G7uH6y1Bue
	 4HM7j9q7HDoIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: add ti,ads122c14
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-iio-adc-ti-ads122c14-v1-1-e6bdadf7cb2b@baylibre.com>
References: <20260615-iio-adc-ti-ads122c14-v1-1-e6bdadf7cb2b@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 22:10:21 +0000
Message-Id: <20260615221021.F1DD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Invalid schema constraint applied directly to an array property (`r=
eg`) in the child nodes, and it contradicts the `patternProperties` regex.
- [Low] Mismatched and inflexible constraints between `interrupts` and `int=
errupt-names`.
--

commit 73a67f643701ff236b57cf5c513f2db2525ad034
Author: David Lechner (TI) <dlechner@baylibre.com>

dt-bindings: iio: adc: add ti,ads122c14

This commit adds new bindings for the Texas Instruments ADS122C14 and simil=
ar
ADC chips. The devices are primarily intended for temperature sensors, and =
the
bindings include channel-specific reference voltage and current output
properties.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
> new file mode 100644
> index 0000000000000..dc7f37cad7721
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
[ ... ]
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: FAULT interrupt (GPIO2 pin)
> +      - description: DRDY interrupt (GPIO3 pin)
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [fault, drdy]

[Severity: Low]
Is it possible that this unordered enum for interrupt-names allows mismatch=
ed
arrays like [drdy, fault] to pass validation without enforcing order?

Also, the interrupts array strictly defines index 0 as FAULT and index 1 as
DRDY. If a board only wires up the DRDY interrupt, would it be forced to pl=
ace
it at index 0 of the interrupts array, contradicting the description here?

Could this be improved by defining valid combinations using oneOf blocks wi=
th
exact items arrays for both interrupts and interrupt-names?

[ ... ]
> +patternProperties:
> +  ^channel@[0-7]$:
> +    $ref: adc.yaml
> +
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 16 # arbitrary limit, channel@ can be any combination o=
f AIN0-AIN7

[Severity: Low]
Since the reg property is an array in device tree schemas, will applying the
JSON Schema maximum keyword directly to it be ignored by standard validator=
s?
Should it define the maximum limit under an items list instead, similar to =
how
other array constraints are specified?

Additionally, does a limit of 16 contradict the regex ^channel@[0-7]$ on the
pattern properties node? The regex restricts the unit address to 0-7, which
prevents any reg value of 8 or higher from matching, rendering the maximum =
of
16 logically unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-iio-adc-ti=
-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com?part=3D1

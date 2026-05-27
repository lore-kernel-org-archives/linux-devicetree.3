Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80949453498
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905878; cv=none; b=IvWqpqH5cKimS2C+er9Pn+x4gBmLXIdiqNzLyeM8/i3OEfwBsz6r0+bZ4hCJN6/5/Xj/Zou+ymtuqZrIN8G87bUL0xfadjFxL0XalGpm9QiUKqWgdIWKaBrxRXiycBA/S0IeaqLsMi+szRfCsPSwoyU5FZ6KJWKwiFMiNDf8Ouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905878; c=relaxed/simple;
	bh=fDNYIemZZTPVpfMZeZyOHlHoMgOD4SLL5LbNFCun2Hc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mTlGaXRGN9My4yTEUHeMy2+tybH3S8HAXDmbOT7MmGrLw+Scnk1oARrSBFJcutwv6CW+0zpmRbjdiHhQmIvxaOiP9QiKzY1Gg/RSNUMcb+FbcklSUzjxwMQsB/iyn6JUMKP+MxCbMPXFGIDrukm5pyQEoCtzmo9WYukxLYPb6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMwwZPjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMwwZPjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C59A1F00A3D;
	Wed, 27 May 2026 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779905876;
	bh=UVGrwWWFJSsEojo4q8v6xqxssfvfBavXJ5XhgvnFN70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMwwZPjFSQXmVs9THlk4zmfgTTJ3qbh6PciZIMBhOv9X9RY3okH9PWkUkjO8zA1UH
	 XHK1yo5SEFX+cIWpcbQOwPZ4kWWKWS2dLIQM7I6mKq+A03pepzYOgmfAcdpPZ2p9i8
	 rDEyQZSXL0HiwPs8/oHYA3QGvcFJOrXJQmwLeg6fAKrHzsPJQiU6hT42zP4lX4KPd5
	 Ly/v5t7z0vh+F5t0Tat7kyl8jEGj6NGghmBdvXozQmsKItwwZUsr81sd2brajTzZhN
	 nv5FwM8qCfWxQ6TnQ6ZvsbQqlvmEDeAd4AjlmNzW2DtqT65cVQKRq+cvwlhq1ZdmIZ
	 LHcuYmHC9wmdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527175527.2247679-2-s-k6@ti.com>
References: <20260527175527.2247679-2-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:17:55 +0000
Message-Id: <20260527181756.3C59A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Schema Validation Regression: Changing `spi-max-frequency` global =
type to `uint32-array` silently disables bounds checking on existing periph=
eral bindings.
--

commit 165130603fd7c72c188dc391a534397b6c57dbd4
Author: Santhosh Kumar K <s-k6@ti.com>

spi: dt-bindings: allow spi-max-frequency to specify a frequency pair

This commit extends the spi-max-frequency property to accept either a single
maximum frequency or a two-element array. The array format allows specifying
a conservative base frequency alongside a higher speed that is supported
after controller-side configurations.

> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.y=
aml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
[ ... ]
>    spi-max-frequency:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

[Severity: High]
Does changing the global definition to uint32-array cause issues for existi=
ng
peripheral schemas that constrain this property using the maximum keyword?

According to the JSON schema specifications, the maximum keyword applies on=
ly
to numeric instances. When the instance is changed to an array, the maximum
constraint is silently ignored.=20

If existing device bindings constrain this directly using maximum (for
example, maximum: 10000000 without wrapping it in an items object), will
they silently fail to validate bounds and allow out-of-spec device tree
values to pass validation?

> +    minItems: 1
> +    maxItems: 2
>      description:
> -      Maximum SPI clocking speed of the device in Hz.
> +      SPI clocking speed of the device in Hz. Either a single maximum

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D1

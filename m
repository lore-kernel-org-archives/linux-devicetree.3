Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C073890F3
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873612; cv=none; b=OuRkurNf38z/TMgMjHJJP1n3xq7tPnc7EN2oskBlgkbQ0EHmtWyAX3E9YfI2yjiiYpnvTMU8q8Gpsw4pbDxaGZGscSTGju6Cl1ZCLy2i7xZW2S9oyrIPymiNPiCUQERssFif3AfVt9Pot8/1uiAzR8W0SeDX26Lz+qBCy5/wr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873612; c=relaxed/simple;
	bh=ryU1tZTeswrfZ8iwXeLI59+Z41KCaez9u8Ydbewpt2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HP6Yt+oyE79IHaXn3T+dDPrPA2OsiEWgBAXm9kPeoW2830xYolTMvROVGGWmd5VSYUti+fcTLhOMS2QdhNOwpgqQZWlt1az/gZ8vtU4efRv0gAOCTf0whb3j0J7QuV1NXf3ekTZBkJSMpnERT/UB8ZDgvUurqZIDjNIsoBjI8sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2Lu/e4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2Lu/e4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3501F000E9;
	Fri, 19 Jun 2026 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781873611;
	bh=J/cKCcbMdTu9hfCVi+oJbEwh7A+3vW3QjfTroaPp+E0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I2Lu/e4T1hppO1VIHkwNfSmcdqrw3VgHNdA0L3yJt6IgE61EbN05gZhEBcaVvdS0J
	 mm3bTTYNndKC3gKxJwTFp+Q3Sl/Js4SPUcNXimbpE5Z961s2kFfmVUBq0WQIt+/ZKp
	 DhRsE/wbvecs84w3evXvbcd3Qpnx0DSJNharnL2KyT+bUM086bXe+nRVMUur5nOJ0c
	 XCjp4GhBXQJi2Eh/29Z6mvrvQjyWyMXH54sU77uiHvvdsfjeqUKgT530Y/LO4LeHaT
	 IZDFEPC35uHzbM2ShBP/rWjs1nhZEN9gDYFq51BeDGwEsX+pvfHy/1bFQsOC5oZbQQ
	 Ke8IOXs5K8TKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: misc: convert lis302.txt to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jad Keskes" <inasj268@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260619124426.882626-1-inasj268@gmail.com>
References: <20260619115649.840676-1-inasj268@gmail.com>
 <20260619124426.882626-1-inasj268@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 12:53:30 +0000
Message-Id: <20260619125331.1F3501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding erroneously forbids `Vdd-supply` and `Vdd_IO-su=
pply` for the SPI variant by setting them to `false`.
--

commit 286d4c20f34dbb3740102063ad8a21275e5828b2
Author: Jad Keskes <inasj268@gmail.com>
dt-bindings: misc: convert lis302.txt to YAML

This commit converts the old LIS302 accelerometer plain text binding into a
YAML schema. It covers both I2C and SPI variants and retains deprecated
property names for backwards compatibility.

> diff --git a/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml b/D=
ocumentation/devicetree/bindings/misc/st,lis3lv02d.yaml
> new file mode 100644
> index 0000000000000..c73371b754a1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: st,lis302dl-spi
> +    then:
> +      required:
> +        - Vdd-supply
> +        - Vdd_IO-supply
> +    else:
> +      properties:
> +        Vdd-supply: false
> +        Vdd_IO-supply: false

[Severity: Medium]
Does forbidding these power supplies for the SPI variant prevent accurate
hardware description?

The hardware physically requires Vdd and Vdd_IO power supplies to function,
regardless of whether it is accessed via I2C or SPI. Setting these
properties to false in the else branch explicitly forbids device tree
writers from modeling the physical regulators powering the SPI device,
which will cause valid hardware descriptions to fail dtbs_check schema
validation.

> +      required:
> +        - spi-max-frequency
> +        - interrupts

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619124426.8826=
26-1-inasj268@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33216198E91
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057733; cv=none; b=stCnp+4GDayTdwa4o8GWJho92u+Leef0ITShbafBWBltxemtXAX1ZKTrKQK/ipVR3TJeCH0xnl8NmZ7PK5EYjsGxT37HCnhgGcrSSImVrZ+pO6GmLOeeRCV1ptdcX2piEp8yCz/8DJ2wbyiNk0RwVZjK7txR0SSgKpfr91yt4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057733; c=relaxed/simple;
	bh=vWFC5gwYnWmCFTCnTqGdtPvTDQvyYYJQ0U31tjPa494=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uYSmwOk3CK15HX22mLcset205jIvec1Ta1G4vgzJcSJMhXFZOtFY0VRFEkTvSTNXFNYp1ggsBRVaSCDYOBMffmpP84H7DnAQGfm4LHWBhQ5l4qXJ9sSyWNWBtrhy54Z0jQzO+djfQXZpp9J00bFvXBjq7JS1FkzcxInVCjQC4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf+4pfP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf+4pfP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BB91F00893;
	Wed, 10 Jun 2026 02:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781057732;
	bh=3jYwYmErqlhV3Nj99/ZBDXBccLhGbeFcQUBAL+1tu/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pf+4pfP2/FGK5xjthZma5uHFeEMjsihYisY32Qlaqtgozqys5HUT+ztvllD3sdAIn
	 JZeqdvisoufH4+WAr4UhSJnmp2nQhiTxiYDENrJdpT6denmFAmuSpQTG4hyayojKGw
	 bO5AaQCTWY1yDYUKf6lECaDyxTM5bAEyQnQPiLSMXw8KOTo1pAQrhanhAQUha6VTg2
	 wIAHV0NkmokEOjkdhexHDEFAQRSGh7B3Zq0ROaiolsvxC7/uOLpjyQ04XN3utt34+w
	 k4tI49QQbDxAHPgZ8tx3EYkXI8ofhlIt9ArkV6QxPI0AN41HI5zfAZM8MFuoulO03r
	 NeaAHLtTLP6Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: pressure: Add MS5637
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Adamian" <adamianlouis@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610020458.104818-2-adamianlouis@gmail.com>
References: <20260610020458.104818-2-adamianlouis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 02:15:31 +0000
Message-Id: <20260610021531.D8BB91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `vdd-supply` as a strictly required property breaks backwar=
d compatibility for existing device trees.
--

commit 8073eb9fc3f96931b47510a0323c9f632b9db41f
Author: Louis Adamian <adamianlouis@gmail.com>

dt-bindings: iio: pressure: Add MS5637

Create meas,ms5637 devicetree binding and move existing devices from
trivial-devices.yaml. Explicit compatible strings are added for the
different sub-variants because each requires different constants for the
second-order temperature compensation formulas.

> diff --git a/Documentation/devicetree/bindings/iio/pressure/meas,ms5637.y=
aml b/Documentation/devicetree/bindings/iio/pressure/meas,ms5637.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/meas,ms5637.yaml

[ ... ]

> +properties:

[ ... ]

> +  vdd-supply:
> +    description: Regulator that provides power to the sensor
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply

[Severity: High]
Does adding vdd-supply to the required list break backward compatibility for
existing device trees?

The generic compatibles like meas,ms5637 and meas,ms5803 were moved from
trivial-devices.yaml to this new standalone binding. In trivial-devices.yam=
l,
vdd-supply was not defined and additionalProperties was set to false.

This means any valid, existing device tree for these sensors strictly could
not have included a vdd-supply property without failing validation. By
unconditionally adding vdd-supply to the required list, existing device tre=
es
in the wild will fail dtbs_check.

Furthermore, the corresponding Linux driver (drivers/iio/pressure/ms5637.c)
does not appear to fetch or use a regulator, confirming it is not functiona=
lly
required.

Should vdd-supply be omitted from the required list, or only made
conditionally required for newly introduced compatibles, to preserve the
Device Tree ABI?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610020458.1048=
18-1-adamianlouis@gmail.com?part=3D1

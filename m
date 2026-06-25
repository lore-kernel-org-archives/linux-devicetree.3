Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA01E7C18
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782398636; cv=none; b=l7jqfEngulhSvGoJUdqTSNu9WXY0NBkrzIWB3yvnvdVCflp+OJUcpjBKq9q3HMT8Eg/55FUHBphUkdyQCXiqzDWgnIJxXg6rfYCE8jo7pzuaF4wkqMDUDRtUVHUyFtGtjki2cdzRkwNruDocu83zQyKD56c5+qV7kYEMJWRPY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782398636; c=relaxed/simple;
	bh=E66PysMZe1jx0qsGDzzFcsZTFxnc8bdwBi19BAsiRG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FxKdGIamFRV5mQb2HSEaRSjV0W42HkX/C0j2UStsL2wvFusUCHmws7c5hRbKslFj/VQRmn4BVImKMsQSMh1BZ3kQp4ja2pb0ek+4SnEYvNV/ELJVFrO8mCOe058t11MM531/VvWmUPnwXp8PF+AhUOn3B+bJKak5NsUM47D4J5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qxn2Sh6B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qxn2Sh6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47561F000E9;
	Thu, 25 Jun 2026 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782398634;
	bh=Pg6PAzEEf+PfrC1bEjjyrN5XGdo21fICTgOpIicGDzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qxn2Sh6B3dxm+h1BBXqwrRe4zhQHCtDwKmsi+rCnsoKqakLTQ8dUzsTT9QgCd5K+E
	 PrbVuHSYrspTpG8aFLXFCAHcbtM/ZTE/6bDXC71DUZrxgI2zMf1ppomyJUjJFbgQ02
	 SEs/oiwxhqAcxaXenVz5JY6LFZtrhnJNoEzWxSet9Bwji9siNAHAmDKkFI9B6lQOT2
	 +D0VpRsEqBFm9wpl1ciAmQ3d+6xKyI2TSgviP7SFZkR4nTfM6ZOnqiEm7jhcLb+ESt
	 P3QCiKzOAreGf7odXgzRyPKoSiDSeLGHepfjwNXKCq7HvH1y3IGc6sYWy8D5z9XPIe
	 t+4DQzSy4xTHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: iio: adc: Add ltc2378
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b08eabad7a56056dafa42f58a755c8d4320f5113.1782397418.git.marcelo.schmitt@analog.com>
References: <cover.1782397418.git.marcelo.schmitt@analog.com>
 <b08eabad7a56056dafa42f58a755c8d4320f5113.1782397418.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 14:43:52 +0000
Message-Id: <20260625144353.A47561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string 'adi,ltc2338-18' incorrectly specifies 'ad=
i,ltc2376-18' as a fallback despite conflicting hardware constraints for 'r=
ef-supply', breaking backward compatibility.
--

commit aa175408226610e4bc2c27ed8ee768b0307ee6fa
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: Add ltc2378

This commit documents the device tree bindings for the Analog Devices LTC23=
78
and similar series of ADCs. It specifies the compatible strings, required
properties, and voltage reference constraints.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b=
/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> new file mode 100644
> index 0000000000000..9adc420fe142b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
[ ... ]
> +      # Low sample rate fallback for 18-bit bipolar sensors.
> +      - items:
> +          - enum:
> +              - adi,ltc2379-18 # 1.6 MSPS
> +              - adi,ltc2338-18 # 1 MSPS
> +              - adi,ltc2378-18 # 1 MSPS
> +              - adi,ltc2377-18 # 500 kSPS
> +          - const: adi,ltc2376-18 # fallback (250 kSPS)
[ ... ]
> +allOf:
> +  # Except for LTC2338, all designs require a voltage reference input
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - adi,ltc2338-18
> +    then:
> +      required:
> +        - ref-supply
> +      properties:
> +        refin-supply: false
> +    else:
> +      properties:
> +        ref-supply: false

[Severity: Medium]
Will this cause probe failures on older kernels when using the fallback?

The compatible string adi,ltc2338-18 is configured to use adi,ltc2376-18 as=
 a
fallback. However, this conditional block strictly forbids the ref-supply
property for adi,ltc2338-18.

Because adi,ltc2376-18 requires a ref-supply, a device tree correctly follo=
wing
this binding for adi,ltc2338-18 will lack that property.

When an older kernel attempts to bind using the adi,ltc2376-18 fallback str=
ing,
will it fail to find the expected ref-supply regulator and abort probing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782397418.gi=
t.marcelo.schmitt@analog.com?part=3D1

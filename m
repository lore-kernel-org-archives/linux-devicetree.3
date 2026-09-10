Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DF568FC9
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062226; cv=none; b=i2q37bd2jY1J/sqdPgyeXw6iE3OIK3SmALAhjTU+f7ZGLHbED7p4v6PT9WfeHn4hWPSJ6EDCVu+ypyKpIJt/yo2ds73rMFsVBepwSPrFq9gk29u/+4/QlrIBlluj3fho1xz8r5ENBm3KbLSkI/jo9WScW8emfzO8n2vuT5E4gNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062226; c=relaxed/simple;
	bh=zT1GnqF74T7VTY079F2wfwaqXtsmcLa77juYMVv03cQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAvSEIjVc3o+wHJfMfcp7PXgbUjErBYt/r2YenWJlE3djnlVfxQUvCVYjKKA2dpDV/TM/B/A6ROY1He65ZmIaa5pnb2UN0KTm/t83f5Twx4i1MlsdwCP1ZWPPCOAp4BF4wrxQdrynzcA2dYrz6QTAU6mQFz1WVfXXdgYpWGtE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJ6o5/m3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJ6o5/m3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FBC1F000FF;
	Thu, 10 Sep 2026 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789062209;
	bh=VQGnvX3mUZGwMGfYIU7jZT3O4/zQRaAc/3pNc3XZrLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJ6o5/m3UeBxrw9b7W2H671cezUG/Qc+B6EHcKsGqLSguNiMd4wVKoI+gwO7BqsfO
	 DMDtvK9owUnGMwtOoEufavXr4bkIU55hdzK8Ik5pDe2VO21ch16OOAVMQWCleyf17q
	 HCpUFVbeoRkTfTwzEeO6/wY05DAe6msiyfkwkS05cWssQzTCwJmLAV+PQa73wfT1Oe
	 rnf5oy6nzHPrywZqXn/wTLdwsibyX6cOZ3p0XMqk5O98yMNpM4rSct3Qm+lJTVUNos
	 5Ezc+b/d4Kjo/XpunW5TIhf28ZpkP1jdWvTIRhCuf2CAub5QiEpLGwdggQHkXStA8t
	 LG/CepxKO155w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/17] dt-bindings: iio: adc: Add AD7768
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260910-ad7768-driver-v7-2-7f70b07627e1@analog.com>
References: <20260910-ad7768-driver-v7-0-7f70b07627e1@analog.com>
 <20260910-ad7768-driver-v7-2-7f70b07627e1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:43:28 +0000
Message-Id: <20260910174329.36FBC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding declares GPIO provider capabilities but fails to lis=
t 'gpio-controller' and '#gpio-cells' in the 'required' list.
--

commit 4abd2d85ce51d7f09a986c8aa5389ed8989878d2
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: adc: Add AD7768

This commit adds the devicetree bindings for the AD7768-4 (4 channel) and
AD7768 (8 channel) simultaneous sampling ADCs.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> new file mode 100644
> index 0000000000000..d8e489fa1f6ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
[ ... ]
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd1-supply
> +  - avdd2-supply
> +  - iovdd-supply
> +  - ref1p-supply
> +  - ref2p-supply
> +  - io-backends

[Severity: Medium]
Should gpio-controller and #gpio-cells be added to this required list?

When hardware capabilities like a GPIO controller are defined in a binding,
the corresponding standard properties must be added to the required list.
Does this regression allow incomplete device tree nodes missing the mandato=
ry
GPIO provider properties to silently pass schema validation?=20

At runtime, dependent subsystems will fail if they attempt to use the GPIO
functionality without these properties being properly constrained.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-ad7768-dri=
ver-v7-0-7f70b07627e1@analog.com?part=3D2

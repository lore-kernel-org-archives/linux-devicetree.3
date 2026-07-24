Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F002417BFC
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895457; cv=none; b=sDb0pkHuaFPNkLg8QD/z4LO2h83L9MnSAJUm65HFsLPtWgCJQmxdsicsMJT1za4Ybaqz2E439nwKLmg3m6SzjnLMaIyBNWVgyCNDnP36c//UNCwzHxaeZ80xxj3JPuNVDbZnBZ/GDZnJmcpXt4p6zHoIDs0AoI/HDMjonBDMfbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895457; c=relaxed/simple;
	bh=rH5eeYyMFtLEgWLyFAiNwp+2X/viBdH2DXUhpZvRCv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K7M+kRCmlSYnCbNjzmV1FfTgnJEzmIO0f7lb/GsEdjPZSKfZHMagyRiH7PDHSyF0OblFStPKA+51/L6taOhRFaYGBcAhbmgfkvBMr2vxZ4JGyyvq28i+r7YOUbVIv29JrSTb1FiHkYnu1Nh9C00KE+2U+np4XtUXOm67fGepvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzSLciQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzSLciQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8E31F000E9;
	Fri, 24 Jul 2026 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784895454;
	bh=3ebT33QSWEtlXMsZqnZsg9W7vB9drONwVKsRlM4bPDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzSLciQOTF5nKw9CvtcUle7Qe+FfA8ysAZ1mXVzZsyuGqOQYj1QZOWLqTvmjJh2hj
	 0tKK8U/XwKG6WJZfdJoPBmg0bz16iYJoisUmOQg7oL5AeIJbIMImLqjO1i1mQjcxKi
	 rsprygz4YuEXJAVOIz4gVF4vXcJ1IIXSnSUQ5fMCzTX1JqdWL+/E2MaKfahat3GOjT
	 KZSyFAq7b8Day29leuAOlDGR8RVzrNKRtRG+efhH6qgC+XuTiJMhyUAuy/BdUKOash
	 Hv+jwGoOaEiSvQDnxYKzY0+2kjp7ZAz2XUConKvCEjZNXaGPbal+Vb3r3BquH2WwkB
	 mbrdR93tizW9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: iio: dac: ad5696: extend device
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-ad5686-extend-dev-support-v2-4-cfc2b30ce988@analog.com>
References: <20260724-ad5686-extend-dev-support-v2-0-cfc2b30ce988@analog.com>
 <20260724-ad5686-extend-dev-support-v2-4-cfc2b30ce988@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 12:17:33 +0000
Message-Id: <20260724121733.ED8E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing driver implementation for newly added compatible strings.
--

--- Patch [4]: [PATCH v2 4/6] dt-bindings: iio: dac: ad5696: extend device =
support ---
commit 4e58650f8c4c07db88580b9ce728f26ca5b2ce81
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5696: extend device support

This commit updates the AD5696 DAC device tree bindings to include the
AD5316R, AD5675, and AD5697R devices. It specifically notes that no fallback
compatibles are used due to differing bit resolutions and channel counts.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> @@ -16,10 +16,12 @@ properties:
>    compatible:
>      enum:
>        - adi,ad5311r
> +      - adi,ad5316r

[Severity: Medium]
Are there driver changes intended to be paired with this binding update?

The commit message states that no fallback compatibles are used, meaning the
driver needs an exact match to bind. However, looking at the driver source,
the entries for these new compatible strings appear to be missing:

drivers/iio/dac/ad5696-i2c.c:ad5686_of_match[] {
    /* Missing entries for adi,ad5316r, adi,ad5675, and adi,ad5697r */
};

Will this prevent the newly added devices from successfully probing, since
the driver core won't find a matching driver to bind against when parsing
the device tree?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-ad5686-ext=
end-dev-support-v2-0-cfc2b30ce988@analog.com?part=3D4

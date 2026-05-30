Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E64367295
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137789; cv=none; b=fpE5CDpTjgxMWyXuLebvU8IMWvQYyHPyeWYi2VZbtimN7hQ9gpuSlNzzfi70gv4jgLg84hMdFF+CIjyi/a7gCbmwV7JWz4JFyHvur9ROIDOitzAGun0TIML0zCea2/zINfgKqrsX1RwPv0FHlQ2EWIFI3pKxn1HPwCW71QyfFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137789; c=relaxed/simple;
	bh=raxk1zhnnHVZZOfR2/cWrr7Nt/AGk79ZAxxM2xJOEEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDTu0pQVyVa+TFGhw3ze0Ba4JlmaDj2wnHWsj3ePD7qSJ8NxE2/cjltFW16rdZdCA6NUREJiv84Ir3AUjxgLdP2aNU5wybssfi/DdHYjlQB8dl2gCrO0vxGkt2k4ouhDY4iXKUeh9sPTs3O4VJnnxeB4iqoRQrThraaoZUJ4yNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+75tSK0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+75tSK0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1683F1F00893;
	Sat, 30 May 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137787;
	bh=nf1glVvzi+5G6C20cZuJW4zIOcsUjJlV4SVWWnFDaEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+75tSK01+BznK3VJBBK1xH5gQRYu1J9c91mG+slSFvWJlCqBR4fcovNmHOTGA8X4
	 Tq5o+eYFU21Vki1t3IzA2n92r7CH2wV1gTM6IdUx6gW+YfHohw+MTXduOLQrqtTV/n
	 yK/tm7Ae7lQT0pZEotcDA/AmIDGKqKGGCg1Te6TnYMcD3jRrAGIvRwBkR+THxXiSEW
	 bUdVqj3TA7CMLVXv61C5fBs23zEahL1NuJ7ikKIIokk9atFEwsMg0MciIpj6TIbcRK
	 20/kN8WcFolh3DZuCzWjjGgingdE1IgANO2R6Z4vNAH2VclNLZdxv9qxqDVHDAXvBP
	 jj3BAhINYv/Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Add schema for AD7816/7/8
 digital temperature sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Narimani" <tahanarimani3443@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530133126.54460-1-tahanarimani3443@gmail.com>
References: <20260530133126.54460-1-tahanarimani3443@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 10:43:06 +0000
Message-Id: <20260530104307.1683F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing conditional device tree schema constraints for `busy-gpios`
--

commit b1de64cf7a950c655f529289b45b50bb4b5224f5
Author: Taha Narimani <tahanarimani3443@gmail.com>

dt-bindings: iio: adc: Add schema for AD7816/7/8 digital temperature sensor

This commit adds the YAML device tree binding schema for the Analog Devices
AD7816, AD7817, and AD7818 temperature sensors. It defines the required
properties and resolves checkpatch warnings for undocumented bindings.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> new file mode 100644
> index 0000000000000..7f6a3e5dfcf40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
[ ... ]
> +  busy-gpios:
> +    maxItems: 1
> +    description: GPIO connected to the BUSY pin. Only applicable for AD7=
816 and AD7817.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: OTI (Over Temperature Indicator) interrupt.
> +
> +required:
> +  - compatible
> +  - reg
> +  - rdwr-gpios
> +  - convert-gpios
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

[Severity: Low]
Does this binding need conditional rules to enforce the busy-gpios
requirement?

The property description states that busy-gpios is only applicable for
AD7816 and AD7817. Because it lacks structural enforcement, an adi,ad7818
node could incorrectly include a busy-gpios property and pass schema
validation, while an adi,ad7816 node could incorrectly omit it.

Could an if-then conditional block be added here to restrict busy-gpios
usage based on the compatible string? The ad7816 driver strictly requires
this GPIO for the AD7816 and AD7817 variants and will fail to probe with
-ENOENT if it is missing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530133126.5446=
0-1-tahanarimani3443@gmail.com?part=3D1

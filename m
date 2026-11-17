Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912855;
	b=F1s4Q9X/tRnyOpDjfd4g7tTATOy5Z+yxDLEmuI8oq1s14b108BOe2lj0MQeod/x2IcDN
	 Ob1OBcpDAWUqhgM+GPQYEF6eSwaBLrAe1z0vYSMxU6rxiDicnJHbCjQesdGPnAsEOb/Qx
	 T2skUYVVufkBeduAZmfcMzM6UMQjUo/l5NNkp18Ciq45OFdcNXk6+E634VnkwIasA/lAB
	 hnR/cZPP9yYEMB6ZpVer6gakDx3ZDz2ATdLjoxMK5ilMcAmGSaE50U8jDQyh7HkYnqMRc
	 p2lzdyPgc7smROPBrPSu09ouqQ2UEywGsl4qFt9cS/fHPYnUlHq+pPE984I3RvQxVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912855;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lam/cICO0AMtiUahVeuLUDr45c+3NkuF+/YcWKRf9Cc=;
	b=C8j6fZjXn8yPbz3W2PzSl38r23IZkwxm9zIia4MNtupEcipsCwKG5XMix5OynmOK5wZY
	 JTTKkdFFVMWjAXm4kYYU9t9nhIY3fFqsXJva8vS9+bkcckgxWC31fYTtMgVPzjQCnRl+z
	 u53YhPOY4ejKw8320jo0NM8OjsCAHY6Ds1pcUpj6Z21ayPzzKU3O//Nt2sRG+UzC2ZfIZ
	 fMVn7tgt5klq3gAqTSyNRiuoPjZ8B/MwGNwHXPLiK67XCqnoZmwO2cVTl/sfCO1DeX79K
	 C9tTFH6CX5exBoGi1wj5MCLLA6EcP15iqr6/2e5/GdIJ0+B1FY9UTLA6uG1WpHjd1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XD6BYAvu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B42606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XD6BYAvu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16C01F000C4;
	Tue, 17 Nov 2026 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912855;
	bh=lam/cICO0AMtiUahVeuLUDr45c+3NkuF+/YcWKRf9Cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XD6BYAvuanBMxXg6WwZjZrdw4muV8M2Q6H3WCdWhsF3NmWKvfJcsfIpCgmnOykhpa
	 aEMCI/UWbx8q1NF8CF4HCbitqEAg2z1Br7jsIbEs90n2msRCPEnxnsJSROir+7rKvx
	 DiZcbHSlKcRGMdrRf4DcaurNbd9AehoQ2aC4oOaquuyhgY0xFvS95dS4IxIjZ0VuSw
	 BrF7n262WmajvyfOZI31Xvu1aHQZhVNNKpcUpKE23gn8u0FcQqT8VdebleaPcpmmt0
	 UZapWp3CurfkqBIiHpLXqA10dQNHNHqT7ZSJNgPIGB5kBF8X/ofgKXykjOcSV29iYg
	 SRWdbTRKoAeag==
Message-ID: <sashiko-outbox-218677@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWRpbCBIw7xzcmV2IFRlcGU=?= <tadilhusrev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117104414.1182364-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261117104414.1182364-1-tadilhusrev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:54:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: iio: proximity: duplicate int-gpios property in
  imagis,isg5320a
- [Low] dt-bindings: iio: proximity: patch changelog in permanent commit
  message
--

commit a0ca949bf69221deb4e3e78d116e407964e58ad3
Author: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

dt-bindings: iio: proximity: add Imagis ISG5320A

This commit adds a Devicetree binding schema for the Imagis ISG5320A
I2C capacitive SAR/grip proximity sensor.

> v1 -> v2 (addressing Sashiko AI's review of v1,
> https://sashiko.dev/#/patchset/20261116074013.355363-1-tadilhusrev@gmail.=
com?part=3D1):
> - Document int-gpios: the driver optionally reads it during the reset
>   sequence; it was undocumented in v1.
> - Reword the description to the chip's own characteristics instead of
>   how the Linux IIO channel is exposed.
> - Simplify vdd-supply to "vdd-supply: true" (left optional: the
>   XCover5's own grip sensor has no vdd-supply node at all, an
>   always-on LDO not modeled in DT, which the driver's
>   devm_regulator_get_enable_optional() already tolerates).
> - Rename the example node to "proximity@28", drop the unused gpio.h
>   include, and add the blank line dt-check-style wants before the
>   child node.

[Severity: Low]
Should this patch revision changelog be placed below the "---" separator
line rather than in the commit message body so that it is not recorded in
the permanent git history?

> diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg53=
20a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.=
yaml
> new file mode 100644
> index 0000000000000..ccb84b29f468b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
> @@ -0,0 +1,62 @@

[ ... ]

> +  interrupts:
> +    maxItems: 1
> +    description: active-low data-ready / proximity interrupt
> +
> +  int-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the same INT line as the "interrupts" property. =
When
> +      present it is polled during the reset sequence to observe the INT =
level,
> +      as the vendor driver does; otherwise the reset falls back to fixed=
 delays.

[Severity: Low]
Should int-gpios be dropped from the binding?

A single physical interrupt line that is only observed by the host is
already described by the required interrupts property and should not be
duplicated as both interrupts and int-gpios on the same node. Requesting
the same pin as both a GPIO input and an interrupt can also cause pinmux
or GPIO-IRQ lock conflicts on platforms where the interrupt parent is a
GPIO controller (such as Exynos pinctrl). In addition, Devicetree bindings
describe hardware rather than driver polling or reset implementation
details.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117104414.1182=
364-1-tadilhusrev@gmail.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874972;
	b=nMLg+6uVED/xHLDxANotb42Djl2ZJY5xbi97xP0lqPkDvTICx/uW38uXxzciUNibXnyw
	 Pw+ttQE5ggkqJ2EA7OduF21voqYd7Qr2xz5TTY4o/RsTktebogsxkpuR8BQPBDRgzFAkG
	 SgYOxO0ZgNfLbm1pDTVu8nC2hH52ALBjfQmw5sZv0hcB3Sh2C4obJtXzfGUhhlSgi8FlH
	 mJfFfCazHkbzJNXHhZwCp+cWwGeZGyJd2ymx8G0ExIDtbARWifNQDodejqY0sMRoVR2Jo
	 9AhU/ozcLSQvFbmwuI6VEIXC8+Jvo7bPfHoLOa8DosmulJgS9mxvcQKEP3ZFMStOULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KxBeFO/saplsBb9XJUojr97D8kHSSi9amnaDdt721lA=;
	b=sRaQvolzTF4vT4upHDeVrgcyr6/pXqhFp60z/lwvG1LPtENqaScTRrHd5WlfU+iasUmh
	 F0GTQwft/eLSC1gHlQ0Fo8Woo7NdNiDJ8j0Xlf3KAXB4X9rS0+sUHhUiREGg2eYINGkHq
	 FNznsC6B8sHq1vHdL4DrhCGn81/SgDLa8H3sJfls9nQMCFKg75eYC6oISuxsNGJkiCKOm
	 8Mwb5btDcITeDLD9CYLKHjJu9QWQck7HsVdNTa2sehIxd6Y3NCWUg5vhZnX4mASI15iSv
	 kD2sIityhb4h7Gvsq2FopiBbxsZHV9dBvtQUyVnyMlqT/3VZpxMDc2U972TntXN4sfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ca8grWkg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2C606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ca8grWkg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028951F000C1;
	Thu,  5 Nov 2026 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793874971;
	bh=KxBeFO/saplsBb9XJUojr97D8kHSSi9amnaDdt721lA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ca8grWkguToeMOjJZZFWJlhvgtCeMphliQbdQb8qPD+D+wWanKyeR8fg8JCi3DewY
	 ZJ/EyFFHPlZuB6erPwL17oUJFqQ8zpH2ZNZLpAJGIolaDDTA8xagxqAThqUo6jPByc
	 iSTRwSOh/ATHnMD4oGxT+lTwHjbVjz/VbFdy7IVAW73t8+JslX+OC20843wn09NvEo
	 gjmjgDSRtsml5BpHMybmAdF84TDzZZ1RHaX4AnKcS+yDrvwXcxUhCFOYLy5Ts5A5UF
	 W0nvXmEQtvbPbDpg/eOCt154NKkpIaPQt/2yorxsghoRXFQVnNPK05eQehDEylqwoy
	 4CkyocBT7ugCA==
Message-ID: <sashiko-outbox-198868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
Reply-To: sashiko-reviews@lists.linux.dev
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-1-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
 <20261105-b4-dw9800k_cleanup-v3-1-6850ee6a5a5a@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:36:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: media: dw9800k: misspelled dongwoon,vcm-presc in examp=
le
--

commit f9bb5305dbf06d2a36be417b4c7b389a82ea4850
Author: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

dt-bindings: media: i2c: dw9800: Redocument DW9800K

This commit moves the Dongwoon Anatech DW9800K binding out of
dongwoon,dw9719.yaml into its own dongwoon,dw9800k.yaml schema file with
updated SAC mode, vcm-prescale, and timing-control properties.

> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k=
.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
> new file mode 100644
> index 0000000000000..f5bae7b287f1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
> @@ -0,0 +1,91 @@

[ ... ]

> +  dongwoon,vcm-prescale:
> +    description:
> +      Indication of VCM internal clock dividing rate select, as one mult=
iple
> +      factor to calculate VCM ring periodic time Tvib.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 #  Dividing Rate -  2
> +      - 1 #  Dividing Rate -  1
> +      - 2 #  Dividing Rate -  1/2
> +      - 3 #  Dividing Rate -  1/4
> +      - 4 #  Dividing Rate -  8
> +      - 5 #  Dividing Rate -  4
> +    default: 1

[ ... ]

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        actuator@c {
> +            compatible =3D "dongwoon,dw9800k";
> +            reg =3D <0x0c>;
> +
> +            vdd-supply =3D <&pm8937_l17>;
> +
> +            dongwoon,sac-mode =3D <4>;
> +            dongwoon,vcm-presc =3D <0>;

[Severity: Low]
In the examples section of dongwoon,dw9800k.yaml, the actuator@c node uses
dongwoon,vcm-presc, whereas the schema properties section defines
dongwoon,vcm-prescale and sets additionalProperties to false.

Should this be dongwoon,vcm-prescale =3D <0>; so that make dt_binding_check
passes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-b4-dw9800k=
_cleanup-v3-0-6850ee6a5a5a@fairphone.com?part=3D1

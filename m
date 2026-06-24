Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA5186341
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782326397; cv=none; b=K5XIMESctg+vBbD6wSdNBS22T6kzQXLwDyszlhqXdkzSu+Fp4u4jiytnZuX3GR3JCdTFjKTbzZ3sKuLQv8qw5SdATJudKm3aT3wf/fDeyWikB3Stp71efm+HfHayxRmwmkJhQflBdg9/DRZisbo6KK5aSXBZpf86MFkRHNg7Oj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782326397; c=relaxed/simple;
	bh=xsCBp/61X6daX5Aj2nOLGX0x7xDjrogpNgH5dGCkwLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cJrcfsk4Wc7SDoXP/ScxwvoM6KRjeEJ2CKY8f8Iw7A/ZCfF6VHJV0m0meDWFSeVB0wTusUlYrUmeCZTwrreWqlYkmgnXVz03LfE8DDbf9e2S0b6ExYoJ9GQjJRBKkOrhhB/gYuJhS8naoEEjZUlK/SQJ/0NuSQqlOpHCtjXmaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO4XW1z8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO4XW1z8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6D11F000E9;
	Wed, 24 Jun 2026 18:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782326396;
	bh=cDIuW7IRBjsiHXTmMGKjo1Dps4S1HsaX7fcgSo+4IhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SO4XW1z8gC/AbxBrSeIgnuy2qYzGYDBA2b6m2REvOr1a3RT4a5BoUSy+KpkDQz/yC
	 7TvhK4uPrSiye+KgTBVnJpu0tmZ8raYmK7UDCkmnw/AoUZRpf68epI2tfoBVSsQ+TS
	 gpKGkXIqyLN81tFiWBFk8tdDfJORL8f5p83ALukK511TBM3MB5IG6YjAbOpgIMuTlF
	 u6M35wtoWR2PvhSjMJUpl8cit6ZjvUL3O6gWSYXzZvBHvZyzI2MZV0hDuCQvJ33nnm
	 w9KptsgcVmSK46jXV+q+/70bcB272Q0VbpBLxoEqpqFPUzCkBarBNboBE5kVOH3YI2
	 PjljXxQwsRZ0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V14 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260624182350.50467-3-macroalpha82@gmail.com>
References: <20260624182350.50467-1-macroalpha82@gmail.com>
 <20260624182350.50467-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 18:39:55 +0000
Message-Id: <20260624183956.0C6D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatibles 'invensense,icm42607' and 'invensense,icm426=
07p' are omitted from the conditional block requiring the 'interrupts' prop=
erty, violating Device Tree hardware description rules.
--

commit dfee2e713ee93b8822c465d8c4cace6a935bc62d
Author: Chris Morgan <macromorgan@hotmail.com>

dt-bindings: iio: imu: icm42600: Add icm42607

This commit adds the icm42607 and icm42607p inertial measurement unit devic=
e tree bindings. It also refactors the required properties to make the inte=
rrupts property conditional, explicitly omitting the newly added compatible=
s.

>     This device is functionally very similar to the icm42600 series with a
>     very different register layout. The driver does not require an
>     interrupt for these specific chip revisions.

[Severity: Medium]
Is it appropriate to omit the interrupts property based on driver behavior =
rather than hardware wiring?

Device tree bindings are meant to describe the hardware capabilities rather=
 than specific operating system driver limitations. If the icm42607 hardwar=
e physically has an interrupt line, shouldn't it remain a required property=
 regardless of whether the current driver uses it?

> diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm4260=
0.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> index 9b2af104f186d..81b6e85decd52 100644
> --- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml

[ ... ]

> @@ -67,10 +69,24 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> =20
>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - invensense,icm42600
> +              - invensense,icm42602
> +              - invensense,icm42605
> +              - invensense,icm42622
> +              - invensense,icm42631
> +              - invensense,icm42686
> +              - invensense,icm42688
> +    then:
> +      required:
> +        - interrupts

[Severity: Medium]
Does omitting the newly added compatibles from this enum block bypass devic=
e tree schema validation for those variants?

If the hardware shares the same interrupt constraints as the previous gener=
ations listed here, device trees missing the interrupts property for invens=
ense,icm42607 will now silently pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624182350.5046=
7-1-macroalpha82@gmail.com?part=3D2

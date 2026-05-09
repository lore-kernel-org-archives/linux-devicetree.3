Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B31E140E5F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337942; cv=none; b=G9GlswSjXwgjzd7zAlvFmV4EmG19tGQszF2YOgLHvE3vRyeZH5ZlTsoCoIoDgeduzrMX2uPOr09C2Xp+OTayVz39XVc2U7lMszcFwLs4soAuPHHlRbXi2D4sT1PRm8xDmu9vN8y+r7/NBAZ5EIRHTBRv/vC5+GFnjbA0/6i6UMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337942; c=relaxed/simple;
	bh=mO6eTRSpfJU9LUrMgyN8cXGu9lb9Fxzyjya0OBZxw7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HcNqQ5Ko3ek5Z4sGj3c3krHSAfJXnmg+QNM5SmBYCmaYS9TcAJ4AKLdh0Qj5TrUYg4Stx20k5bDnqo5jSv3vxAzmnELGP04jVZawlEhLGCca+tnQ6Qu/nXuR+ip5RiS82cdjuz1+7Sg5JdgBa05KN/7BeSBH5fDpHh71G9tWHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnW+vRxk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnW+vRxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5E5C2BCB2;
	Sat,  9 May 2026 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778337942;
	bh=mO6eTRSpfJU9LUrMgyN8cXGu9lb9Fxzyjya0OBZxw7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AnW+vRxkp0+eYxQ2vV6KqU7akB39ys9HYilG1tUBQWqjENqhbak9o4wnJQDUkLSbw
	 HgHcuccUrq1IBAJOz5Ubsu40OsPwmP03nTm7cl4q923ZncPwIquBKbRQciv+JRrfge
	 wWwN9c08R3AZiCQsf9oGfOBEShIsAUOcfWcH/2BLPlld0cgWP42EfpG0BtVYUBIGfw
	 KZonKLeE8a4abQoER7kSYjLG2UQnqdgWiBzrP+DR3YsO4rVmADsIsAZqAw7+92A8hS
	 ejNszSSKiH+shWrp5NWN66GI7Eu1909kCbzs059ExMQgzxmSi4sRuGaWi1euDfsf73
	 mOEJaKCzfvtgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: iio: dac: ad5504: add output-range
 and missing gpios
Reply-To: sashiko@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509142047.30302-2-0rayn.dev@gmail.com>
References: <20260509142047.30302-2-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 14:45:41 +0000
Message-Id: <20260509144541.BB5E5C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `vlogic-supply` property is missing from the device tree exampl=
e despite the commit message claiming to provide a complete usage example.
--

commit c85189a6dcd792e207cd5be70833e861a180c568
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

dt-bindings: iio: dac: ad5504: add output-range and missing gpios

This commit introduces properties for configuring the R_SEL pin on AD5504
devices. It also adds vlogic-supply, clr-gpios, ldac-gpios, datasheet links,
and updates the usage example.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> index 9c2c038683b4d..e0123dceaa336 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml

[ ... ]

> @@ -45,6 +78,10 @@ examples:
>              compatible =3D "adi,ad5504";
>              vcc-supply =3D <&dac_vcc>;
>              interrupts =3D <55 IRQ_TYPE_EDGE_FALLING>;
> +
> +            output-range-microvolt =3D <0 60000000>;
> +            clr-gpios =3D <&gpio 4 GPIO_ACTIVE_LOW>;
> +            ldac-gpios =3D <&gpio 5 GPIO_ACTIVE_LOW>;

This isn't a bug, but the commit message states it provides a complete usage
example including the newly added vlogic-supply. Should vlogic-supply be
included in this example node?

>          };
>      };
>  ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509142047.3030=
2-1-0rayn.dev@gmail.com?part=3D1

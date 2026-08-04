Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E073A5445
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845263; cv=pass; b=HoHyCFCHRiv2xnsiRwpqhRzoLqN0sy6J9xF6NHg3rLn3827pHhLeTP3gveiGeK/hMOzdQR9PwDY9cOjwQ9F3utr6e6A5n7trDl4oDA9V+zI0qlfxoBIlKFsv72IySt2Y1U5CTjiHlW91ukQdw08U7E5dOjykQtrgGytV/KDdLes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845263; c=relaxed/simple;
	bh=MKpC6XQ+00hU3bnVTnqZEYjizODE483Yd+dvd3pEtkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vye2RyR0ABMcCXAjRpcDe0xFks642hAkd25uISfpjeW9no+nsnZDgiGCB70EwONebF+VwgLuhtgPuQ9v/d9ysyJmdKUZaBvXXuVEjiizF9o1KIpt8eVyCFpN1tS4YdB48Hd/vNsVMqirXt42bChrcu5URbGDh7XKJPIJCanreZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlIze3Mx; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlIze3Mx"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so2554608a12.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845256; cv=none;
        d=google.com; s=arc-20260327;
        b=Te9vp0qQ4dpi/OC9vRdT7s2R3kveeqhyTavXYuMtd1twR/TGArSKQNhTTRycA+4F6d
         6+UpGX1Ou0/9yc9yPghKlp3JJQ+9Q0D3kUA17FwG86cN1ZdmywIOr5N0asujJecTj3i4
         82ZH2uEwF3eeMp/s1aWMa92sDleSL8WYvtUJrLpOl6ry6/ZJlGdu8bR7X9imGrMCWMpZ
         tRzMSNixyp6BKzA5PNOX5X+SZBnIcAPmYze2Q6OCdduFWinaWhVlytl3PkYDkqX1CTmh
         Nuo1lCnfa9bvTgKxuI4jCHA5UohZBZzYshiNB5ZediD8mwW2SyP/v2oVzwheXZTSU2+U
         COfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        fh=aOHz250HL5G92xExfedOP+ttbU+pIWp3IZ3qToIlMWo=;
        b=fl+VjSiTITKyhOQ0t/f8037u0Zd7WBz1D6R1az1jnLDRHMU5LqmKehRkgK053raiLN
         mRUvS81Rg+fxBkSrnebga08s2JS+zZwxqududBnIBKtIUCtgRKCohEOUKsZgVQVRUd06
         RbBRwQYQM+pLvks9N+RAIf1wkOQvPpdBbysko1hjkZ+/AiOxS8HhEnJ4MUfAs87VVuqU
         vAg6ecucdo05sfb/4PgWr1hnbVP6OOXbkOcpEhmpAmtonYhw1oyP6COV/QL12jKcJVqU
         lIPQHo4fWI+qg1DTKYWWTUn/cepKY3hfCLU39eikc+FUuR83ZXrrXi47BdONerRVTvSm
         OXqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845256; x=1786450056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        b=jlIze3MxIiy3EZmsy7bDZEtdHooTWnY9d5joOvWdestzEXyaS9RETuhR1SnR2KByc4
         UK1brCAi3pfj76/Motfq8x8WMTERjhv7gqatpwHtIcKkJBBT57RTPENt2znWr3OynLc2
         eQY7g9YnHFz2JQhfwhxZz9ixlldDXDJnWU9+sPet5u+xo2SpQIZEe7wH0bdJlnQ6Rzkc
         o9HXvZjA6abitLgILmkzTKww0M5wdVWod1LpVgo5Ndjwpk+IOEAKwAcu7LCuplIG/Okp
         WDZDSPY5Geb3ODqGDAeXtJPEfR37xoYsdIkGG1neQlAmbkfOBSL8fBeRI+VTu4bFanOE
         ZNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845256; x=1786450056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        b=jir/YDHNNot9FxRRJIL3jau0wo12qVTRiFkl8YXR78PxJtyUwOXZEiKXWAgL4m03rA
         OBFRAU2qcbA4BlQp53FzqbkXObrpr3+xW1bP7SXBCw+ZfPjuPVk6HBOtxD9GXM6ICZ5q
         krMZnTRICu/BLj1Vf7FAzYZuNi9On/kOZA9C0/OxNWLOLYYD90taFylb7VLBy/j61vhQ
         26EismN56R0dTGZ7H0pb/narbh2FNs7SbU9Yd92tLaBgUKjuNnYl3I0tH5dCudNqnQaI
         YaIQTrRZoiPT7WESDOHhho+1sicX73sa7844SddjxCY0p2JR4j8+uXjda4l2binlDgYT
         fnSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEIfYKjwTscVhg493+Z9hxk8fbofIfw+/yewB1KVBVCmFTwWRYBvZugu6GOyqAssDno6iH33U6brgj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0j4a6l45gCeD8nz3ZaKZA8ALbn5TNcA3ggdmN6QWBcprjQvDR
	8fJlsXr0iKHi5BahOl27As3WEfc0koO1j2G74E7E0ZWey5SLtD5nK54N6XCQk3n3FzBIIiQbbcm
	L/wDZo3FehG6bUSGaGmud2nTD20FqrWfKhMREui1IZw==
X-Gm-Gg: AR+sD12F7GouklkCE50+maU5FbhFRqJ+QsL27xvuX/lgMMT01CAd5390XHWIhImdne2
	2t+2cmvoUFFnmfvHIlK4gor9TPij4HHcmoxvVu7kqTPKTsURbnBUw5Bg2DS1e37V7liGePKfdf2
	xutag4RT0hNYNEwU1jCO2ya6w/vJs2gfBQ4xjrWaY+mfHrEbt7iURXgLtVF5R6q5GbPgW9CyaOW
	yZy2450f7usDfuS0KiJwXp2HiViXJIXn4OQ6kiLoe6CBU3apA/GtwbG30EIIlamsE25PsO02AR5
	9YHx1DDygXB8ETQUPZIX3bw+ePj3ldyWgMcoMKV1e/qHHHFl90BtJYPMhdB9jthtngZtGiGjhrZ
	fIOk=
X-Received: by 2002:a05:6402:388e:b0:6a1:2863:ad74 with SMTP id
 4fb4d7f45d1cf-6a12863af68mr2437534a12.16.1785845256497; Tue, 04 Aug 2026
 05:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:07:22 +0100
X-Gm-Features: AUfX_mwrWQhO6_L2Bot9kuFbfGYJZrtdWlLRWzD4dosje_HVGZdBKQIbCnWzkTk
Message-ID: <CADrjBPqc7jsrfYJXecG-PYt_Pp0vE0mA6GhOhb54u1p0SUFCzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: exynos5433: Override thermal zones by phandle
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Fix indentation of DTSI file with thermal zones (two opening { brackets,
> but only one indent) by using a safer choice of phandle/label override.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/=
boot/dts/exynos/exynos5433-tmu.dtsi
> index 57b335f579d8..a3ebc49fcd36 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> @@ -7,8 +7,7 @@
>
>  #include <dt-bindings/thermal/thermal.h>
>
> -/ {
> -thermal-zones {
> +&thermal_zones {
>         atlas0_thermal: atlas0-thermal {
>                 thermal-sensors =3D <&tmu_atlas0>;
>                 polling-delay-passive =3D <0>;
> @@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
>                 };
>         };
>  };
> -};
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index 5fc3ca233ac6..ebd63b9e244d 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -2073,6 +2073,9 @@ pcie: pcie@15700000 {
>                 };
>         };
>
> +       thermal_zones: thermal-zones {
> +       };
> +
>         timer: timer {
>                 compatible =3D "arm,armv8-timer";
>                 interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_=
TYPE_LEVEL_HIGH)>,
>
> --
> 2.53.0
>

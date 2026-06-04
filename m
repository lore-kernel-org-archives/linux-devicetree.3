Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204AD4418DB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575940; cv=pass; b=PkVGHzoQ+Ej7R/kEfIbNWcbF9e5UHSWVzicU0E/IiDx2Ck2Dy++0SsPdmSw2p8s+6/v+sM396sEs2PWTa/WmHmLLXFDtSVzOB3T3d8+lkQdq2t4oVvfQGOpPgr/tRuAqkMhjrsecRnCojkgsJBmf6UUPHO23bjZsUwz1YAdhxkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575940; c=relaxed/simple;
	bh=QXg9S3LANuU2Vu2CwL7ml9RG3pg9mmdQqBn/HO6HYQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ng5X6ejTF2t5AcHdg6HT2z2v1UyEz7GLWy2YGeY/NUhXWZnGCCK3D9F22y2BA664XM4XK/MEM44PfNso6QrSBNHlqD4SLvBPKO9kEVu7NgsFGDxE+0y6OmMH6yhVDHr1dHe/VMhKg6nvGMV9SBgblVzbR8P7HbXHqx+9ziLnhPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNrKS+F5; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNrKS+F5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso747846a12.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780575936; cv=none;
        d=google.com; s=arc-20240605;
        b=BD8l0/DKC8qFIUW8Jp03bSPRPijHqg71/kcORlU/wfVs2ZS4y3YSO3zZao1KpkRnp9
         pcZN454LN80CW7G8xOGAaXyFFMbICIXLGlS8i15f86l3yISOf7N0toobb73Bu50+rJ3o
         H+E0L8056PUd6XSYdrxb7zLPaZoUNCe2SiTiWnA1pKwROrN6IqwDiRl6VVOd4Vb1rKef
         Ft1VzY89++viEUDjcOpmBs1Xd3xVflcSYLv+snH0BuuIpAHgTqc3IOCtkoftfthbTSIh
         xx0vtLt4loOqBHlKCyG1u2WMXdyVaA56vFngamzxhxhbpyjlBAGBTTZtF3PeUGJuwIjH
         /uJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        fh=ItvLJ52/0ZddBsl8k0gDlNYUbc/qXIwcusH1hiCWHR0=;
        b=gayBSAz3qA7SCVDFgrEQrY4nJ9TnKkurbexA6L5toG5i/UlDe1jfXj6/0iENKesV9t
         fZKd70KTOy6FGsm/zRuuISe33nd4YxaZrxSFg0NsSfsD8T9xnbdmnPsbHJwfdxz+9KNn
         xz981Naxy5yFA/kL7mgi/cHh00fM5RzlJCSAt/F7IABIOlrGHT+jfFFsNcc+qx01yTBV
         +Z8buNrehApUARBoZHU9ZBAZ5Usw85dplRpTjbKPbM/AB4YuAtDQbK6cTQZ9ArnvDrJP
         fm4vVSVZJjh3P8x8Xk7Vni6iVxrr9VCS2XQmYchgjHUG4o3RCFf9bDp56ILlD13jSrAC
         tO6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780575936; x=1781180736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        b=VNrKS+F5Q/MjcXlX0j/M0qvcolEc5C8XWATfjY3gaaCFWwg2vK2Evo3JIiAMObMPdY
         5inFXiO8SfKHFAuzsDNFOwybZV2xkgMrXpJxBzRgKvXINWORM0AVzr3LNLKefIB1xR9M
         OJDyeItVdF+aMiCL+PBnBbP+qS+Ao3Sc7SGxbFnLCN7HlYT1KYxSA3Cxdc3+2AAQwbG7
         IFXA5OCQXcSr+mDSwVxdUirtrs+ESNJlBPb4G9ZWZcPWdB6hv9I5hJYIBfgORf0zzKjb
         QU2tBJh+3O2/RFVFsJFDgFNowFbj7Dgn0ZL0eWjfHtZTiSyst1DLTalXaF/vlr8xDgyf
         0B4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575936; x=1781180736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        b=Mj1YUttQRmfFOI3P+/yq+i49FRD3o/DE5izgcgvL10jXXyHMyRYp+tscwjUni4GI2X
         jtnAF57RaiqjEJX4SYteAWu0QmsuGUhNhHs1MpEsAU1z6QpWFqYDu1MIMWZaxCAg6Y0D
         qvJRTXj8BhpzNjvA+OX93RtS1g44iND4lQT2M2WbbOcs0fWGA4t3gLtTiL9cHvlCMSqv
         qaVCowF2rEx6vqavHsfp5Nao84LK6E6so6UoDIf9fpgfT0ho2+kSSxv6kryQTspWQT98
         M1nienvcWIWUx8X9X2IQ2v77rQdIrzcNz+UdtXzxiYnyIp0A8TdrXBIWw48hSZ0UIMzu
         0naQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fIS3e1drejhFfjpAyWySh/JpDZlftNEtq5fnGGTyuLVxBsmQu7c/OlZfIGwQiMvZDv5HgOUsD278H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xUAWiosSPSH0+RmY3uZPluAk9ZXNCFDB6fs2jcY5xkNfC/yq
	Z185ZLX1ZDYzxJ++y0VDEKIAha5iETzHYFCaNQUZ2673sdILcEoV7pXZX73IAuARjEavr48G2PS
	l9TltyTJRH5a37RwakCqyI32wKUyaqq8kdOWcfTB8zw==
X-Gm-Gg: Acq92OHnpFF/2KNQh7Ik7hlkMustlv5d5t1jd0V12Usp0OxO4sOiFTvV01eiONaWOoJ
	pyKgFhP8/HIq8ULr1g5JUvXJiAT/a97bKPPe9pUHbtzkNAXxhtJpGRBxJZXnbNWTD9H5h0h7yKn
	abDEJobqi3U4m0qdiSny+AXzAE4trsIvkarqlNygvqDXBjOQjGXbCtGcFiK2+h6FVwoioyC2btr
	0zx+N48vMNRlbLmyVeCEeGRrTe2uxuY38oBxEIHg/R/rCCMi3fj+f3Fr6NzRdoOKy57M+B0q0kA
	zOXLKMYmFfAAw2UtP5kqCZDhsEN92okrdDhg7z6h0ElnIT+C
X-Received: by 2002:aa7:c3d8:0:b0:68c:3439:945f with SMTP id
 4fb4d7f45d1cf-68f0f3ef6c9mr1109192a12.12.1780575936462; Thu, 04 Jun 2026
 05:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 13:25:23 +0100
X-Gm-Features: AVHnY4J8PoxEVn9YHkIV62f2JcL-eq6_poQLFyumkGxMP4pQHp8fyUwqwpP8j1s
Message-ID: <CADrjBPqXnv97XX2y-_YKi4=NCJw5CcaBd5b9ibQEHLZ5N6ZYkQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] arm64: defconfig: enable Exynos ACPM thermal support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
> to allow temperature monitoring and thermal management on Samsung
> Exynos SoCs (like Google GS101), used on pixel phones.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f93..3fe76a4c2633 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
>  CONFIG_BCM2835_THERMAL=m
>  CONFIG_BRCMSTB_THERMAL=m
>  CONFIG_EXYNOS_THERMAL=y
> +CONFIG_EXYNOS_ACPM_THERMAL=m
>  CONFIG_TEGRA_SOCTHERM=m
>  CONFIG_TEGRA_BPMP_THERMAL=m
>  CONFIG_GENERIC_ADC_THERMAL=m
>
> --
> 2.54.0.1013.g208068f2d8-goog
>

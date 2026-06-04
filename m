Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB0426EAA
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574247; cv=pass; b=uymvDLeEy6epOwxp1QX1cN/u7e0SwuZ/R5dWQQt4xx9KxYrkifB5WT9A04Y53Hkw6Yc8L0SDdLuQ9RFGWfOOOcbpo4jnCSP4mWGrPRdNRdUe8H7oSVWwMLocjUm+YH+Ion6t7NVNrSbSvKN20xTiYkq2Afqf5kYc8SU3YalVHDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574247; c=relaxed/simple;
	bh=I1IsJZ9VsoHWf+kU/vnao0WS/4NFd54dWmBswkYEDVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw1NsHLtnQNHhst5hz5JE8w50Hd+gggRKiFsaq7fMGpj34np3A8/6ZOvOh+gOWimEiTNv7DcLGJjHJXwlcQWMcYsGA+ZAgdb3+Wf7qVVuPSuSjLfvKJSQjCQHtMITwikvNuWIzK17Py/C/VcO+BEJ+weF+6ztTF262ve0mQl/vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTy7MeMb; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTy7MeMb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bebbc325000so79653666b.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780574242; cv=none;
        d=google.com; s=arc-20240605;
        b=faMYC4c6K+GGvmm4hpP/Eds0Mn6uxxa3zuUMZpbWtebgqHkLEmUyyA1AL2kHp1s/Ye
         pn3cUn5xR2tpSnz4cBMYU5GsLS3MvaqPQXGS6qgBbbJYiSkHZQOTIaWurO/7vv9WlMim
         7sh0fKQqeSEINwHvKCwOexjKTBhLMBmqY6C+Ws003A5gT42QW2s+L2WgGvhToWYB6Mff
         Rd39panz4WisIbS6Al+wy9/xd1jMhqa1zOWnWE0hbwvSIgA6XxxfVOpNCTK2aezGtYPc
         XY0loNpbjQHXiByGjMRhn0DYEj81VsOTLura0E30OJi43X5N8Sokf01lUfOft/cP95kQ
         4IRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        fh=ErVLenDBHpVYh82bqyjDL1Hqr1vH6bWkkHogPIcQfAs=;
        b=jVS1ra7vQvfxUuphTIym6xYIUTNM5maNPDvfiC7WLxPSE9D6GP2jAFLRT/J4T44CC2
         gpx5pVKHQLxqBazbr4/aMr9ZmH1e4Sr9zIywxZZe82oyo9HdsxSzahVdYGUbBTUioFW+
         Omd+dpfIeRGH3jUjQtOHfTQ7Er6DJIqNQ5v1/jz6ltmjQ6Sfj5FcyrSDDgidAGTch4mr
         g83k/bE3BxxNacUXrNrXCNFnBKcyJ+P/agO1CgibcVXNgO855o8bcXguRT7AX062AHOC
         EBNkxJEkHr4pM4aVBzPDKwn0iam6GumshqoKS3gUppSkkiFsjgDbJPDjO4DsoCe4hYse
         UxGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780574242; x=1781179042; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        b=hTy7MeMbnVM3tT14eYkrmRvhzoLBHk6oVol6dlf+voq95pO2jPFQaEZHC+4DaD/HZ0
         PpWMuam0iN2y34grNNjEVPPubmwqGa0GlvFNatE6LGgXpM8IJj+H3w/qnmP/xxP47zUo
         eeas9jBzN9DIJSbUSlD3uthIHkbCOmOVYaVHsuA+qdg57PkOjK31aRlHCh1sejJM23bC
         V5Cm3Kq6HvMkbpqx2txmTwenaMn8x6pdtyzMSPC7D4244mf/sWYRq3aVaFgTqutcPmHn
         bzgAsSc1w8Slxox7+6rJBDwAyU4QylG71APoAMgTvEbOKE2nTvPgw5tFofy2nOmPCGI3
         8b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574242; x=1781179042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        b=j2f972OHxe/KTRo3p2kMHZq1XERTE6PCDpTp5emyrkYErqKvqAJ33V3GUFJ/3hwrZr
         8pJoAYIPG7F3D3LE14qhsOyW5J06uV9csr8gHBILvre9X9gbNAeDU/A7MgaH4MVVX+qc
         avM3/KFdcjKsRY/8xxiwYv28X0/w8biWGLga8qAYpsGt4rIOQhiCLMdToBHJGhCU583e
         e2ZxLAzgz/UGw4at0VjqCKZ6HHQNMHOZPtgChwzaGukCbCQTm2wZOcAGm4jsKjZ7awUl
         Adlnyk/4uPSGs5LxwuixMrY/4cmU3iiBr487iN+QNBV+ww4yGaAYuiRdQqBy4IF3dOeF
         pDlg==
X-Forwarded-Encrypted: i=1; AFNElJ90I3kJjO8MB2C0UXnNoKoO3XJbIsZQL6ttPskcAjCHBWgam26aaTPXPSfvE3Gxu8ueNpsa45jHpVnt@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXUqtD/93BwAfQrCQPriFh3+Gyp2/q6feAa43jN8hOTdv0Eh5
	JrFXyLEtup7nkm5bMh2FSkNpCAKLh0lgUjj7NfdxNoJfT6JHrdipeR+OcR6/IB8WmQaScEoZHDJ
	eysltyk1TrxcEXZ8kd1KaeKWxbp2wXuKzkADvrUvjPw==
X-Gm-Gg: Acq92OEyeAOnbBOt4EF/VcZwNwit+YeVHYIuuwJkXSVRcN+wJiYnEdaRiUfQ7dx74yE
	kpO17PzLbULC0kHZf4p/0EssmeAIbLZ/2fd5Ogkt88wNnvuPvw0bJyQaDsKYDhRPNjQ33WwkBY1
	BRHhwYWCRF5wVvS5nuUbKo/IoJKmRxDTDfXrx3HQr4iZo46KVduBjmxTyVJa6CskQS4qtYEsLto
	zPGHt4HskfvCm4YqDqzZSA6NwhKzV9jGOjs/7HdrJmFxZdcEmBx6ohCCw5N1lJ5NzK6AKpKXsBi
	ExnWZI5JtTaIB8r+7TEdOtGjOLl9tckrx2Om2BUDeXYcwXOw
X-Received: by 2002:a17:907:cb89:b0:bec:fa92:d370 with SMTP id
 a640c23a62f3a-bf0b32b528bmr439481266b.33.1780574242197; Thu, 04 Jun 2026
 04:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 12:57:10 +0100
X-Gm-Features: AVHnY4KWKy6Zaqr6HchCfbtUy4GGigvt_YXk_Yu2tFv0GUwKJqXP0QbORP7VN80
Message-ID: <CADrjBPrb+3pFPFRnufY+wYvu_d4NH5a0ZXLXEju9HB1=Tc3rVQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8218c2749b7..6a8521270daf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23661,6 +23661,14 @@ F:     drivers/clk/samsung/clk-acpm.c
>  F:     drivers/firmware/samsung/exynos-acpm*
>  F:     include/linux/firmware/samsung/exynos-acpm-protocol.h
>
> +SAMSUNG EXYNOS ACPM THERMAL DRIVER
> +M:     Tudor Ambarus <tudor.ambarus@linaro.org>
> +L:     linux-kernel@vger.kernel.org
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> +F:     drivers/thermal/samsung/acpm-tmu.c
> +
>  SAMSUNG EXYNOS MAILBOX DRIVER
>  M:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-kernel@vger.kernel.org
>
> --
> 2.54.0.1013.g208068f2d8-goog
>

Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575E265CC2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602674; cv=pass; b=YGm9FEfvuviAgGzuVBGtQD9zF9XYJQ9xnxSvyzxiA7gCkR5rGWEF5Xh59+zizjCcpbIBsxKLx7+z2JhGu2uViigsgoI02Nki0c1TqDJAuyhga0bqcXTAne4VpzOp9qMZVMWT32qR0vQtfchEryusTDZkaJ87ike77kz2JguUNgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602674; c=relaxed/simple;
	bh=VsdkuYcnq534k/oBdCgtwjiHv0Cz+Yckus4BQnntf0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCyEy/f0TIRqugZpLd2CRI8KF51zzmO5FwxGdamulrBz+xI/ANyGfT7H+QpKtOcuqQxEWj4BHNLQ7Uq4MY8Nke3Xx1dzA+h6UoyrA8pIiqK9AXVPi4DBszEuf8y9OQjZ7VPAElbIHHmbENk4Fwp7gROoCmICrjOunncoZ9qiB9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmjQPRfv; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmjQPRfv"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so1346624a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602671; cv=none;
        d=google.com; s=arc-20260327;
        b=LuPlQOe/xfHhBxBOGZIdD2DvhYorp0yVVGIkZzUWoYxHOsEn4GYm8mp25SmRkM+not
         dOSd7prYALfP0tW6XevpDN5R2cxiXZWBJDXtFWxbbqDWBaJ82PxL5X3CiPY34bgxsXNp
         M4rDKc38JIqzyiFMNIatE2SEs7fV89j1LdkcjOzoUDJo22gAyCTEC4VdkRMRNUEZKOnh
         rfDHtRHR5PIp0OxgCh7B9yZzF8XdAX+xLSCdvjcYodeM4VkrOyg+GnAvnHkU+zNumk7d
         gg6j+hLl7HafqFFADStyIiRu56zfGPFYkRkkdwP9Qj9x1r9j2hTLvjd4jnoBnGZhYtEC
         YsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        fh=64KSXPMRR5WojI5GMc7OFnLnL1SAj3tAnEe+h7IDuHw=;
        b=gNg2vLr320YugEh+ce/gTIsUaIRg1D/VxXUVYrX4UjJk/fy+Q9NnkYsQ07JxttEqvj
         5PsR7fc7ACt3aKHZ48QD9+aXdjdVQXmYn7Xjv0FhjJtYlgOyCU+fxL0xbH/GCzqmhNQ7
         vzdPdBnD5i7YxYE2VooOWxO67p9qJdGaGLbhW7optotrLedGGUd97L5yf4pHdPjjVh1E
         IpkD5qgJEGINgXB0ebLW/vlHaVXE+20jptzWjYtd67OLlghOiO2CJ6i3X223usA8E/CO
         D9kIg935tdUenDDfd8IxzU4eayXx5nV2CXC8xc2op2Teb8k39OgSDp2BW2tX36qpZQ5N
         Q2Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783602671; x=1784207471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        b=dmjQPRfvLmKb7MAmQN4yQ7F5N07K6mXn+x5xvrhyz1a6aLPVNgv5tDh7MPOQKp+o3s
         4z2R776WVMpF/D4BEHJIUQT1bAe8oL7ydk4BFhyfVuC9NZgouKBXNcXwThgcPfeZByo9
         QpAqIV4wxczt9QbG+ixjjFhtSvJpvI44cA26hTTc+g550YMiKxXZesOgFZDtP1iMxoiA
         AnYBgPXaPmk+PuEhknh4EMPpDWZMDkuMKm0A4EmlCWuS22Ne7uSXuhSgki1IVJMBZmWa
         X9qK3ol3H7SCJz75mi1zCOSQnDwKvCN4IZtuRFsD0arSLGIcWk11jzx8pcSA/K2bHfoW
         xJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602671; x=1784207471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        b=KK4kFEMTcA9+zaWu++2VYnNzXeQtmA6uf4yy6qaKNyUqQK88Aq+Qpn/9hYi1+8tgg0
         B92YpHiB5dQculqH1unWFYFPVSshLL01qgEaHw2wYtHYnJslnKnelfDKLrS/9oBgORWJ
         nUagYd8ljMDyYU/UjBh1X2fsZJM15XIGTvf3+AEB/5HPPMLCj8PsaSV7UxN4Kb+PKgy1
         eRxXAT/3IC/smBX6C41sxW5ewuXFVJEU1gsvsTLVpp8um4smMm6YxIhoQHynAvCOUnG/
         OhUIguY29tB1wudHjkkgUa3mlz+085f36jaNxBf9fv8Abg+UJoFcLUljChy7vlzp5PkB
         SIgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyL8lVLsETYi6lMdjAH4efC5DV0THQm2we5lmPpqDNjkCbVXjlWjOlAKPzOJvePKk9k0tpMO5EOsPJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNtRByUNGZRDRXkQG0EiTW2EHsp4g6ByI3yevRTmQpxQs+4Ykx
	oZ4Kh3IQ9zkZmxLWtzLq7rLNQqXdz5Wes1G4C0Rn32NbOgfy4RfweXINeaoq7had2xRCidnIgd+
	0WHwAwcKiUfWmkLsZIV6B0mCVCQqK5aNXPAd2q1fZ0Q==
X-Gm-Gg: AfdE7cnqz+DTbBVUUqJ9kOGzqYPsWisFJ4ZCIUMLz8EnMoKN8uWLnKbi8K9WOSsPb0l
	5ztaqZL/OBg2sY2mv2tcO8LQFHONUUj9+5SXF7zpeTGiigYl7k+vWEiJ6CJoH6Te82y0sFQJILb
	iDuLaHelrwKgQtsjU7zqjRv/GfJI9VVLLoQEftxH+EENWFobpF06UuAhYD1BCGH132paEbeV4CG
	viyQFX0/Vn8CXZ8mAbFIRnkDh4ofpLLsIlo8/iYI6rNEkTjugh8tPuP1WdGjOBBpJiomKGcjLgK
	FIlP6rOvY7IWrI8HfmLxtfiMMRqD+eA=
X-Received: by 2002:a05:6402:3214:b0:69a:b3ab:dbf3 with SMTP id
 4fb4d7f45d1cf-69ab4498173mr3121469a12.26.1783602671013; Thu, 09 Jul 2026
 06:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com> <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:10:55 +0100
X-Gm-Features: AUfX_mxsj7yhT66qMFeVreq-yvEDLAx2Oah2zZKlqJssK5rRTHtI0rAPHqjZj3E
Message-ID: <CADrjBPqc_hUJUCgRjk4F6RUVE+3qK7pxs5EGUTmH2PBs4R3Ymg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed
 reboot modes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jul 2026 at 11:57, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
>
> Most of Android-based Exynos devices share the bootloader or its parts,
> thus reboot modes are most likely the same, however only a few upstream
> DTS define them, so add restrictions only for these.
>
> Google GS101 has on the other hand quite different bootloader with many
> known reboot modes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index d124f3ae9fbd..5bd39876e3b3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -176,6 +176,20 @@ allOf:
>        properties:
>          dp-phy: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos7-pmu
> +    then:
> +      properties:
> +        reboot-mode:
> +          patternProperties:
> +            # Negative look-ahead to disallow unsupported modes. The '$' has to be
> +            # part of lookahead group to work, instead of trailing outside of ().
> +            "^mode-(?!(bootloader$|download$|fastboot$|recovery$))": false
> +
>    - if:
>        properties:
>          compatible:
> @@ -183,6 +197,13 @@ allOf:
>              enum:
>                - google,gs101-pmu
>      then:
> +      properties:
> +        reboot-mode:
> +          patternProperties:
> +            # Negative look-ahead to disallow unsupported modes. The '$' has to be
> +            # part of lookahead group to work, instead of trailing outside of ().
> +            "^mode-(?!(bootloader$|charge$|dm-verity-device-corrupted$|fastboot$|reboot-ab-update$|recovery$)|rescue$|shutdown-thermal$|shutdown-thermal-battery$)": false
> +
>        required:
>          - google,pmu-intr-gen-syscon
>      else:
> --
> 2.53.0
>

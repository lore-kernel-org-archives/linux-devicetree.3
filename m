Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4774E8DF7
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787472; cv=pass; b=WEBrAlv41tTVhbLdgvWMLghCa0HqPVoempy6Wb3EFJjtim0DkUSD02TXEU89SgQRGOREvMaOt09ZzPUjATarAwViIIkI++s0oc1vnuGolB9KkbzlAmbiTdXsguBex8XYvHEBtlY7/CbXRy+wUsIsP7ji5hf8T8zvK9u0oWyFlIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787472; c=relaxed/simple;
	bh=p60aRWtIYjOoFTL6Ml6pk7tZl8zZ1c8Bsqt9/cNXsHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9PSdb8mSJwWnPS+1LOByrf+fSWB+ls8/e0QpaixzERUd9G4ULr16/OtaxG4syJAphhHBwSa88x3Hkh5rFAxJEmkkGZ05cAi/t7Wl/u7m1fSR1N5qrY31izjAZqKbEDNyaT//puo3BjVykZEiUDd9xgIJYUTY0e1v3UovWgI50M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Cqgewg8/; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Cqgewg8/"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-46f53c8a5fbso1034058fac.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787463; cv=none;
        d=google.com; s=arc-20260327;
        b=KdX8MeGOIIogBvNKOekZi5KRc9xP+I7AgKKGdjvL1lWzYpC9YC4QYYI1nbTsOwmqBB
         1WOwXAV+Gj+rEc3qELhSIC0vtZM4/yrino/qMhPpsRZ7d46pwgiIvdW9oki9CzPHBqV9
         olu+CMnx/HhZ/i94xV1iDZ6buw3Vu7hgeWebkmU9RKPqpnhs7BPGimPfKG7P1HatAeTj
         dSTFWEi2xv6CKPnMfPgaLAET5f+ylnVYl7Vrh9DJeM0YWzxmFc4yOod7D+XDzbbBBx21
         569hBP+zmaOCMjQpzZ0Ov6viXT45SuXpo5TNl5HQcROxzHxhmu5FMmPYLF+/zssnp4wr
         oyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        fh=zVVjWTrtDmbPa7SXjjMCx9nEKxLl7TLRGoqKM7Xqwi4=;
        b=UhrGavCw4KVbBJ/uGNsZpBcY85PRtYg4HUkRgiwhh6bgJrqZmmdc38n/O0MsmpKUHP
         /sp940nDwoBn5RpGEALmB5LXwaS13RYsbs1l/9jztRG26hK60gH6y7ZNviB0LzYhXYp+
         Gpu4/ucIixEHB1vWGjn8gHXFVzOl1XeHHuci7nqJjR/tZmUt+DjkpueXuO5YaFBgILxC
         f1ZZhfz6v7GjZzFaR1o8/S/aychdYs0InpL/8tj09lFIgwcgfPDX7RJwVGmmBxxUM8QF
         Atgwix1k/3wSBbHyJv8EAAAuwgV1hKtqYViYKj8BNJDIh/XwDJqCpLquC7Fsimauv3Tu
         t6OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788787463; x=1789392263; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        b=Cqgewg8/EvAXPUwM/MBqOK9csMLhIUTIbuxFUIFXSPIPHAStma7LUzCa+EL1hpq13w
         C74q007AC0wceHPkSoOksM6YtJrXqcGk4nEFi1kJgXcHq7tEXmbylQFS5oqJXpod28/u
         CnHWZyUZfoGzlFZLnXGb6qqREAsnLHJEkCvF9EDpPTfrfvYt/vTwmn5oRZ4I0/GlGPbJ
         8AMm+P3o5mGeicKcMqQOxQ4JSaRM6jiWs+VInUMa/F8R3yG6ioxtgycouWvjn2XR8ta/
         jUnwbdimb7eZgm7BHo+eWyKLiG2OWO3Z3YOvw+Blhgo0jmDcfnKJX2Am7gc+7EVVK1Nn
         P74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787463; x=1789392263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        b=N9CEwo9lYH+Fisy1afNwug3ZR28TyzCVXp4+tPL0joM5YWfxM9AhscLu/MbX6XvTWk
         NtY6hPyeMFaWWI5WL35qaMR3NU3OZVd/v8u2QTMb/w9WJ9WSim+wcd4BPsHVdMhm0632
         jyVNzEJTdUADu/IZ2shsY2YSKqmeNEy/9xrzaEqTng4D/FuyhMd7Zy5454fGQVFSR3kj
         dvAERG4uRm9RpXzQ8ehN/ko3Ignvodb6Ir3VQr27aKWycpoi185zZIhIJzugxRaisrJu
         yyGEN9OP/Vr38Tfyl12EfdGLWyGD6YLGCUrN0gigSBgbKAVxxL9GbfO6zXK6BdTtmvIA
         9BUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi7W/mE1h9vQkgaegTAlCqxKEi32ZQk7opCgenq4Yofr/BEO2lZn1lnAe5jXn7wWoOyjFHuibDZyJs@vger.kernel.org
X-Gm-Message-State: AFuF++nVk9voIADGMjC+x4rarJ4DH+6+oqOgLLUdIC+XlWMQCUO73tMB
	VrYbPFfUoS38YFLRvPRILFt3zv4SIAHYk6yrkxJiwYoYbHozLHhELNQ1rNRxadoiHtuxHpkPcve
	XURbA1FLN0DcJThoR5+2uTRd3mWliSOMv+xbeAHCHUQ==
X-Gm-Gg: AYBFou2RjpQIEbXePEYQf5xDEODpz70TZl+HwryMg3O8PFBF35QuvA1aUkH2apw9JtF
	D5qqHDUjsCUdR78G/QfAKKv3g1YlN+vi9ROL/kHtuIWkIJuvVeKArltpUiwmi+7CEdSmurWP61l
	ImRfZOr4c9zA9dhuZiyF4LYpKImFJBfD8wWszGcMbZL2Jl5dyQY5SlKUJDgvBujOx+a9XHPuRKb
	286HssuOIBgulp1lQsNT56qFje4UVr+aUS6N9laZrXZlS+vecqBk2TKYGF90DTJJnOhrOy8dfVg
	ff75ZiFggL8BUSh1pt2EEBgssuGOxTOuR9hx6hpKr/Ri36cdp5mdFyn4xjaEp/46sqJu0M4fBwQ
	kRPyx2q6g+x3Y9z283hVLucfYQ1CvUQxR7Sb0nVy/xf8cs+opGhdBGd3jwMv2
X-Received: by 2002:a05:6870:b01d:b0:46a:deaf:5915 with SMTP id
 586e51a60fabf-47551591688mr14531947fac.9.1788787463608; Mon, 07 Sep 2026
 06:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com> <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Sep 2026 14:24:09 +0100
X-Gm-Features: AcwNN1VtJNaQAhgZmbN25VVX96rEB3Wn69gfnD4KGJJXrfRYQ9eR2sFIrX6o3IU
Message-ID: <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add required
 vcc-supply property
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shashank

(Apologies for the earlier HTML version of this - I thought I had my
mail client under control)

On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
<shashank.maurya@oss.qualcomm.com> wrote:
>
> Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> regulator binding and mark it as required. The panel controller MCU
> needs an external power rail to be supplied before any I2C communication
> can take place.
>
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> index 37b9ed371b67..a6195e53be16 100644
> --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> @@ -35,6 +35,9 @@ properties:
>      const: 3
>      description: See ../../pwm/pwm.yaml for description of the cell formats.
>
> +  vcc-supply:
> +    description: Regulator supplying power to the panel controller.
> +
>  additionalProperties: false
>
>  required:
> @@ -43,6 +46,7 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - "#pwm-cells"
> +  - vcc-supply

Adding a new property as "required" breaks all existing users. Adding
it as optional would be reasonable.

  Dave

>
>  examples:
>    - |
> @@ -55,6 +59,7 @@ examples:
>          gpio-controller;
>          #gpio-cells = <2>;
>          #pwm-cells = <3>;
> +        vcc-supply = <&vcc_reg>;
>        };
>      };
>
>
> --
> 2.34.1
>
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459506;
	b=Cd4VRxwc4kWsIkzW6DJbu6Th1yIACnCthgkeZTc1EkXRXLebeCLcOEfE1KT8vFEvmyZO
	 GMhw1aTybmvmA2sousXDr89rM28RmMNwqH2CGkxmn5dZJ7S5teeEKVl0weSVNSK+7avQQ
	 ZaCjDTd9/6imSJWMCxO+CNcLq8LF4Dk54Y/KuHt9/qQa6QDyKbGQbEK8gVaqL2qFH4WQt
	 pPdI3qzUvExgOHqLFdBXygILZXG5i5ZhymxDVaxcOnud/hvDoUjaR0qBAWtFFL80o3TMx
	 w77RtFslk87U6jchhEUDb4dg5gv7AVAbNSsllKTTayZ3HetwXqzd2aLm4in3l5mmnNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
	b=SUSGKScnrXp8GjWQsm5sI8WAnP8b5HNDFsJnmIX+jKlZbON820vVdY+7zFxF5JyI4Mqu
	 PykLEdfbuvhJxG+tzyKHDThobCcWg3QzGb/MuJ9OyGCh0ZbTkLiKAl2F066VguaeU9uUE
	 2UP8+IygYPmbxaUqsjDOELDRhFZSdfkWXl3E9d2m13pWIdfYVXoIL28nUW9zNSSXNWS0E
	 WtoTd7A4rI7TL55FIEQd6SBwUJUCKLBULcF0Oz23lUfsoWM5pLPudP1fK/9Llz8Mwmi+H
	 tDdR0tqKjFxSBj2hGt5CvF7atWBNjfaNE1bOToZs2TE0yH8zxk/3KU55GKwdfTt10aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkRT5n2e;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DF5606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkRT5n2e
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e98798cbddso10589215ad.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459505; x=1793064305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
        b=GkRT5n2exhVq/bZWWaWrZfPBL5AwA74qNvh5AAr/Cgsx40W5miy0tb90dSrybPiAoA
         KYS5YrJMDwOJXQVm76DgepdKqhnCx6Iqsq4sLd3shwUGNj+OzN/wzokmuCk94+5xm1SN
         G2jJJDfuyh1SPZWyN+0RBm6NMNTfrQ12kcYn0FR2vl2C3JS3yLPcfijVc77wQLPIm6vq
         0pp+oKwJaT2ebEfzBfEgJGVN+hRbpSnPAW5glKNFeZaeYEtDVNk1g9RqbjKbqRNL7hXS
         Z5BfSnwFx/NFDkivzx6gPW43iJAAXPY0qzt+svke0gxc94DfosSykVf9sF432y8JhxHn
         aWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459505; x=1793064305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
        b=q3JGJTGgC0zWYiFWSRk8vnLbSsAqXj0RnBTtA8cqrt13TcfnqRLtTh5PJXif08BZrY
         0H0VmPfr7UyntuH9NVP/etL3aWNESA9+Xo9Hk+Gjp+mqKGo4VyboKZdZ4fo47O82xfZ0
         UUac/ifZ+WwaQWo2qNv3do4UDsTBhCG0ixhayIWQ2ZUkIsadP0dV27VrOdu2KD7hWxIP
         BziJ2pWOdWyT3g6w3bjsErdkUQ9eYozmq6A6X+UeMyjtOnm0n/5DiJrMrxbRPqwWwRYC
         B4nz/xFNcHvX0TE6+EJrQYlda6yfRyxPjHzdKkpj+6pDFw0G4EO18EsPzMkpkZQWdL4z
         74AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ6znDr3VuEHcLrGGN8g7d4QbD7KZfu2styEnQAH09WrylCAyvNAchIlm1Ullsvc5YG1UI83fsL0MP@vger.kernel.org
X-Gm-Message-State: AFq9FYKXNTlbJ7BLClUf7iVmtrpxdWNglYHz9xP2vFw2IlcZZEyLUBz4
	Q2YAanvbuTLD8zlw3QmIpHV+Fk+ZOGBOykVHOyWmp7d+2LIdEheubA/w
X-Gm-Gg: AYBFou1GFQTP8mhxerQSXGweZgRZ66yvdvZbAZK8gNebK/wgb+RmIi2r+69HnibhRgS
	VW3zYMo6wZqpSUkji7gQxYHrVJ9dRrw3bTaxhvIl4uuUlgiUM1QngWIKvfQQkH+dkrriglo9gTy
	/CrHiakrgLzqjyfPlJYC6B3nXSJBuNJdgO+wCQ63Xxz7sck+TKZnYHSgjwgihq9zSTBfRWw3CdK
	eTI4GBOcWwGNbUsL412f8FhwIOOGvHPFLMgqAu0EnbSnZMx0lcTSBn0ACuMpxTJdF9Z87342drU
	zBYwZhWXzbJ2puDGn2YyyX8RXMWC+1YLeuQNpQm8uwbtKEtEWhC7ogfzFU7ESN9E5StdhiWtrC4
	vcEOArAlgYO4Q3/qXEya1bUxRQimVOdYTGU+5l7+f/upCuTI3g8ipbytjNpQUV1rZHKJguFyEz3
	eomAeCOjRtAZBx/ZXhOzuGH8yU3zS1qwK0yEO/aAMLCuQFRpmY2nbYBHUvgE8ow2+tGTUp8oDpY
	T0ooXZiSTN4
X-Received: by 2002:a17:902:f706:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e9a6f57a2emr77436145ad.59.1792459504698;
        Mon, 19 Oct 2026 18:25:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14dec6f0sm6844815ad.30.2026.10.19.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:25:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:25:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	hajun.sung@samsung.com, wim@linux-watchdog.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
Message-ID: <63cac66c-98a7-4174-86c3-68c1e2f15805@roeck-us.net>
References: <CGME20261006160157epcas5p37b8a0053c489b051dfb415c9b72ba178@epcas5p3.samsung.com>
 <360067785.01791340382096.JavaMail.epsvc@epcpadp2new>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360067785.01791340382096.JavaMail.epsvc@epcpadp2new>

On Tue, Oct 06, 2026 at 09:50:03PM +0530, Alim Akhtar wrote:
> Add the 'samsung,exynos8855-wdt' compatible string to the Samsung
> watchdog device tree binding documentation. The Exynos8855 watchdog
> nodes use two clocks (bus clock and source clock), require
> samsung,cluster-index and samsung,syscon-phandle properties, similar
> to Exynos850 watchdog implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Applied.

This missed the start of the commit window, so queued for v7.5.
Sorry for the delay.

Guenter

> ---
> * Changes in V3:
>  - Removed comment "for exynos8855" as recommended by Krzysztof
>  - Added Reviewed-by tag
> 
> * Changes in V2:
>  - Fixed Sashiko review comment
> 	- [Low] dt-bindings: watchdog: missing comma in samsung,syscon-phandle description 
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> 
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index a32c47831577..37d9fc9b68f4 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>            - samsung,exynos5515-wdt
>            - samsung,exynos7-wdt                   # for Exynos7
>            - samsung,exynos850-wdt                 # for Exynos850
> +          - samsung,exynos8855-wdt
>            - samsung,exynos990-wdt                 # for Exynos990
>            - samsung,exynosautov9-wdt              # for Exynosautov9
>            - samsung,exynosautov920-wdt            # for Exynosautov920
> @@ -52,13 +53,13 @@ properties:
>      enum: [0, 1, 2]
>      description:
>        Index of CPU cluster on which watchdog is running (in case of Exynos850,
> -      Exynos990 or Google gs101).
> +      Exynos8855, Exynos990 or Google gs101).
>  
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos990 and gs101).
> +      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos8855, Exynos990 and gs101).
>  
>  required:
>    - compatible
> @@ -76,6 +77,7 @@ allOf:
>              enum:
>                - google,gs101-wdt
>                - samsung,exynos850-wdt
> +              - samsung,exynos8855-wdt
>                - samsung,exynosautov9-wdt
>                - samsung,exynosautov920-wdt
>      then:

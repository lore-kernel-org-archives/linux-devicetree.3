Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013135;
	b=jDlyzM+4RHBvPNMMIfl+Nag3Jjsy/62w3ON9Ae8hjDoHatzB3eBNsS05BSyrGnUN8Y5M
	 r5NyLWPSKJ8WAWE8dvl9IWpz+3Gc0ki8umbdYaNfO4VuVU55uuXEBthkv8byrwzTZd1AF
	 yHTH/btSGMZIMY1UFp2IEPfkF28nHnuomXnMdwkM16SA7wqya3x/pYhdD+3pNp8kiwWHH
	 naue3WcNc4j4hsedpjGNnyHk44k4jA3Mh+Sn4bfC29dXwGi8J/Gi/GCJJOg1MMY2AFl3u
	 2T+WpfQZXXNroRAnjWn0ZfXvdNIJAoKYAHJEJnkx4wsD4ShW8Ch7T1akM2AwdIYa7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
	b=o1iXMcV3/OBPuQKRstcmtkm4sEI6InIGTENA1sZ4+Xhy0z/Gm80uSZezH2dRFLzEebeC
	 t1T3u64meNh5uUiYzeLSmOh9m/wX6QLdWPah2KTRs6nNVgqthsD1gF6HIPNpOySwb0v+s
	 diRkFtDaEqt3MFCk7p8NuMXJCinoJSX7TqbyVaOW+tOjYUISsYDG3NCsTWYvIQOF2Y8KR
	 UwLD0lfkX//6M72S5+4j3YCT3Gymn7Ibo7dWjgjKsWuGJYEZtrGKSvlwKzbAMjVjUsewe
	 8r6A8FOqDfl437WVlI6jqsbeoFxw+/IToD36N0O5jFPBJXhSGnUw9wqS/XPXVYH/Bsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="h/V3GnQq";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB5606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CB5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h/V3GnQq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso7549265e9.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795013132; x=1795617932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
        b=h/V3GnQqzDYq2+Ocl+djVXBVuyWbqmvHG+OGYyfMN89qcxr7EWLd11cyani+5hjlv1
         WLNecqE7293/zllCuLdsKFoIFMM8fcNJhcpMs9c+7mypY5kOnCv1FIDJ+YaUg1Xmxldp
         xTrQX5ZC55Zklzxax1U7EhQWJSm+Yroo0mTyRZqMN29tezP9MUxPsKYS4KpzSHzOm8yX
         6pn/YAWEWzVXbVG2bLDqsqQxO8aZammeB8kymZOGTipwM1P7qrkPXfJBGBeXaJ7kSOL4
         upQU6siI/bA+SESuz/5YB89xWVFNdnooK7OWh86cdfYljPk/Pxoe1NRaJDHI9bGm3I5u
         JPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013132; x=1795617932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
        b=O9Q3z08EFAewLqKX8TZ0uXrOmOxG6JVwevfbiP+uxi3z3HxiobVWMRPqVZ56Hgum8f
         2lbGQnCG/CEteLu7NHi/xA/RefsCPINR615GXViKxw2kdvBDMnBT0WfNz3p1g8mPZJTt
         4YEem/MJ6v2scLEbZMgRwGXqMawYIYgP2DtT3vh2sSzzxI0BQGx0z/zY7iaOQZxE+JH/
         TTvx9GsQpUz7wePGs1v32wC4CQ7ey7xecoIufx2aTxwsNd7xbLkiWVDv1EzUc4BnkoFz
         Vz5Jo114gqhg1S4ul8NwNBxA/IZzCkjVvTtfsivu4F2BPej6VR4pUMD5HyNk9vUPcR9X
         sCmw==
X-Forwarded-Encrypted: i=1; AL+hErH31gB2SivjO9WOWMATdOZ5XGqYQRoeSRD7Gs04kmAcBZzBorExW0jEbFJ3oN+I0tQdv8XiscwabKzN@vger.kernel.org
X-Gm-Message-State: APuU4Z962OWdK979Zpd3ie/4aUG3T3g1Tk6+HCQwXwB1lmnSxw63IOq7
	GNQgKyBGB8g/jIkDX2rS/MgGgeVdwJ84W0rf1BAzPV6bv6XoG7EBLhguuf+uQwGWpD4=
X-Gm-Gg: AYBFou2ercgDCzdvAFqmUVh5afVMYNkUMNPvTgbiUjGKvdxZyLdUEXVWcAsKjJi9KUY
	2vQPSikKSmaUe4TcN05uk2BJHniD4rebBUdx9zb7zaMt2ZMHczONKmqXKBM4y2fCd0wiETbBp7O
	3oyKwNbr20GZmqmxojfHs1BMI/DbTyJIRnklOzHFHoDo6T7b/PGaupDGJhKuLyVa6362zsTQ65U
	0xnYIHbcC+raS8NUyvd5Hp02RuPcqGBG6rPenheo9dPJ73UgTwJfc+4MC33c2F3EzqiNh9ip71F
	Je/j7CNUG7/SaK1jDu9aoJpra28lrZMSVQNE1h9AzO3MyTZq14zSrWN0TOkcBW4NX3pU0PgTZs5
	I/Ka+ncfFb4BC6X4KqkQLomTLGIxhzZZFOhGfZvVbjryoYWzNfkEhGMyJIh7ZA8yLIXDSksWmHq
	3Ezi5qkZPVdnRP8dQ+U2UUh0cnV7/TfEvkOH5W8hxY8D2ShO4CTtj8JUTmGWyJAiPt/nMBR/Rs1
	EsvX8Pkrb/wX27nIPqeYV3ukbFlS9pfiUGqw7w98kdx2jCL1Bl0LvmyFQnBsDYY8v5Iwl9+cmVN
	mo0eJh36VNQVhdlDlkAAfVm/gVx/MhZLVw1coTc=
X-Received: by 2002:a05:600c:8b51:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb7da3a65fmr52309385e9.25.1795013132472;
        Wed, 18 Nov 2026 06:45:32 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm5382230f8f.41.2026.11.18.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:45:32 -0800 (PST)
Message-ID: <ee73f5ce-906f-4411-9449-d17c3abfa11d@linaro.org>
Date: Wed, 18 Nov 2026 16:45:30 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Juan Yescas <jyescas@google.com>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:51 PM, Alexey Klimov wrote:
> Document the `samsung,exynos850-tmu-top` compatible string for the
> Exynos850 SoC.
> 
> Unlike the GS101, where the ACPM firmware handles most of the TMU
> initialization and threshold configuration, the Exynos850 firmware
> implements a significantly smaller subset of TMU IPC commands.
> Consequently, the Application Processor requires broader direct
> MMIO access to initialize the thermal unit, configure thresholds,
> clear interrupts and collect calibration data.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> index 75560ebca48d..bea208cd4619 100644
> --- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -15,17 +15,27 @@ description:
>    both direct register-level access and firmware-mediated management
>    via the ACPM (Alive Clock and Power Manager) firmware.
>  
> -  On these platforms, the hardware is managed in a hybrid fashion. The
> -  Application Processor (AP) maintains direct memory-mapped access
> -  exclusively to the interrupt pending registers to identify thermal
> -  events. All other functional aspects - including sensor
> -  initialization, threshold configuration, and temperature acquisition
> -  - are handled by the ACPM firmware. The AP coordinates these
> -  operations through the ACPM IPC protocol.
> +  On these platforms, the hardware is managed in a hybrid fashion, though
> +  the distribution of responsibilities between the Application Processor
> +  (AP) and the ACPM firmware varies by SoC.
> +
> +  On the GS101, the AP maintains direct memory-mapped access exclusively
> +  to the interrupt pending registers to identify thermal events. All other
> +  functional aspects - including sensor initialization, threshold
> +  configuration, and temperature acquisition - are handled by the ACPM
> +  firmware. The AP coordinates these operations through the ACPM IPC protocol.
> +
> +  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
> +  commands (mainly temperature querying, basic TMU initialization, and power
> +  state management). Consequently, the AP is responsible for register-level
> +  access to initialize the thermal unit, configure thresholds and handle
> +  interrupts via MMIO.
>  
>  properties:
>    compatible:
> -    const: google,gs101-tmu-top
> +    enum:
> +      - google,gs101-tmu-top
> +      - samsung,exynos850-tmu-top
>  
>    reg:
>      maxItems: 1
> 


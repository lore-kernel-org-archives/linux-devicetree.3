Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4848A2D9
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129608; cv=none; b=ZmrYuB+OJyAcNXgI5rqHUL41qai0OEL/10ljGgxk8xLRRoKzw8FD/51AB37qzdUVqVK0y4cJc3VW+O9EEdVxk6cKyWDUEbVbqAE5ThTbzkv0kRqMGs0jRhCtNN6iO+KyVGRZB+isKeUKBfct3H3dnLziT3byDSwPp0fplpygnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129608; c=relaxed/simple;
	bh=XlgeT48VhEJN+z+/Jm1GZXVXZJyPe264p/t33nYnq68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQxohV+UP/56H1+Cozb+/zIlbne9LjyyDlCvoYeNH336KQA3c7ckpx3Lvr/zWhTtKI4JN1N3VL7F3Q/idNPlz+eBzhqJDwLSGn+DUv4p22frEy3x+aSL7jVmNXTLp2Y6teN+R1ac9oN5fcJdZvE7Rsd6F/xUpMVkhRHhILzzvg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q44o0bMU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q44o0bMU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a2c90e383so589623b3a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784129607; x=1784734407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=q44o0bMUANCZk4VzAdgp94nMvx7mC7nAoEeIALtnjAboZV6D8/gfs2FDo7NnASYVnh
         pLyemWWBhA9DGmZJj2g/hI/Ykd6bXOu23ken8kFIkNr5dRR3j4OCB55nECeA1qTlnw32
         ej74w95Qf1XOWssbUNWltyQJBRVdtj46m6q4sk6CY2sskWmup14Cq6PLPEwMYGbDxMX7
         5o5hY42f/H1/cEXnREXxPrTJ6XsQuC2IlMpr+b6dL38NSKk8IADbv0AcsEv93BDm3yXp
         UoGphw3oS/IoXZQgJ1fZ9RRf5pemT0+kUwp5ReRIaEz7BRohNgGXysUWWOLuD0R9yiqm
         4jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129607; x=1784734407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=oioC2u8S14fl3a1fb75uiN93NwiEX+SgNfRcFUbAZh7Z617GOJKPgJLDuZEafjHijt
         HoP/J0SbRVVttCr0HEhY+H+mnoTBv+bJg7mhjV5l82wbV3oqIGsfvq2Q5h66uxXGY+aa
         zmsd6Ns+oTRKc7HIMegEqjiOeKAslbGbHtzz5HOxJFmZOiUzjtgJZdnvy4++7Xc0LkPc
         jukudQsrAIR6YaOeqQp3U+ZX0+3GIbR210V2aLQhYzDyfIsEzS/5wSRL9jeKpOe3B3P2
         S3qNBo8G6/gqQu4ah99qqDXKNWLxMxVgT4FO7JFgG8hJr1JbzVftGfdS4xOrzTd9JtVX
         krPw==
X-Forwarded-Encrypted: i=1; AHgh+RqkOrpjRfkVdz7ikfZmNe5saXl3tc8flf5enRcNcsZdQdAM2xr+FDJS0Spsiz6w7Gw7mvxbTzAp2J/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyogXAyqPVrRexsj7xL24SkMnA/2xd9ENrDPCPUjT+FBcAi98zY
	wmcscpK7C6dK5DD7XzrVOweI5PoDvLFhXwzMMFfj3PPlLMU9cAAcYEqg7aZWiP/7ifA=
X-Gm-Gg: AfdE7cmJJiVsEbTlpWFibs3LsgQdp1YxhDzh82rXU5z5BoFI84v8qKehZ8smsXcXl2h
	/Dbow6SeSfr550hGlO7SlIm8AGtzSUUHiyiKBqCxIlJ2pbb4rPklPPqh4Ei+rFX3fmJvXkXJbI0
	r+SJmP8jQsDQKDGKASu179irRDX7q5iSLyB14VedBYHo90UARX2r5MCJBu6n9wU0xtp9oTdEtP6
	CtWzh2bPZQAl4llyMiOyORuXmFO1P877JP+EMVndri0Vx6u8qyEczMOQwlz6iO9+Fyo06jQu0bw
	5gSB6qYKnpTNWjFGudNv2RtdwUPuXHIrLFz+M+goO+j7pIy4AG41UsijCLycg45XOCbRgHzgyRa
	UNtuIBDTcByTil+SsIgXESe6Isudvwfd08mfzsk5EBFn1P1YIQRgydX8mbV+KaQ8gn8lCmwmbZ5
	oxtYLRkIrfimsFQutQ
X-Received: by 2002:a05:6a00:4f95:b0:847:9803:ec6f with SMTP id d2e1a72fcca58-84870373138mr20935586b3a.10.1784129606555;
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7de23asm3373865b3a.49.2026.07.15.08.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:33:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
Message-ID: <aleoQy-YePWJC0sW@p14s>
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>

On Sun, Jul 12, 2026 at 04:57:19PM +0200, Krzysztof Kozlowski wrote:
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
>  .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> index 3f710433e937..4cd5121b9a4e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -25,7 +25,7 @@ properties:
>        - const: amlogic,meson-mx-ao-arc
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        The name of the firmware which should be loaded for this remote
>        processor.
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> index 2811334515d1..591471e5f93a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -30,7 +30,6 @@ properties:
>        maxItems: 1
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      minItems: 1
>      maxItems: 6
>      description: |
> -- 
> 2.53.0
> 

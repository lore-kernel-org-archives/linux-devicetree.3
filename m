Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B43A7835
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997753; cv=none; b=HxTdbRTWpKI80/a8CXE9aCwx1cMNM0PR8af4wcOPvQwqgGroC9Y/VUm/gQhyAOYySiYtEUixEZAbhlx8ICATSvmFv/cWGVzEq+PpOxa7YDxdVH0+TpXG3z4XGoFZ2zipLVRcr7YlM7aX9al5trBrtEU1SZwW4pH99MV1ckXvlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997753; c=relaxed/simple;
	bh=DOcATmiBxnRGKjoFpcAJ5nk3hnXYfVYBXXI94JUx4Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRh8tcAHYLl5qE7qgKBze6qE4jJsb5fm8ZJxVUOYvlJxSjY2Bf0pXSNLjz+VnddVrLMHQOxHGdYkOMuVLCDbjAo7nxZ5HIh7F0qbj5PpWA6sVoR+WS5huyDQ0ZqihTQAVZZYUtfIbHfAyq26aesss+t1j5fGlp84jucFg8nKKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAlq6bVm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAlq6bVm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so57760075e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997745; x=1778602545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=BAlq6bVmCwVK50yS2UmyWp0kTy0toOfYXvJJoZ4MDUSYRFfM7IFM4qmvVl1acKEOYO
         RqTfcL2CQpo8NsyZE3Bz+eG9iZP3pmnA0Uyh0brnwT4Az7qvYfdjy424uMufC3Xy3h53
         u0L3EgIc9Br/5As50dAB6Ydty8VhkVl/+RcgoF70jGGg2XrHVvawxcKx0fQLbwdCFig7
         X+rOGS1s3C9n0Tx7x07YZSg50ekhs4IAxqZewB4vHP2YQnuQ0mRvsCoshGDC1tH8xIX/
         joqVcL+9RN2i89cLF/DCGm54sLI1zlMo5xZKXvK0k656rSGmQUApwiCGgY/UhEenZy9/
         WYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997745; x=1778602545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=cCU3UWsqLf9WU5OT24GNfQ5kqDFVpYzuFQ3Dwn9dWq29rtPOcFzpzitwLm6VAxRc3u
         PCU5naEyn4J90FBFX7e8Xx7zYhPXkFbKatah0bTkVDTf84a4YNmFWHKOS9xlEvbZNjD3
         +bWhpqQxdy2xFsGcX4MDKBY/B1PmSrFpK0t1U97btIu+qkPzl2JgjJwOzFiF9niSCqJo
         2jyFwqlOk5LEsUhMMYfF/NXWZAZnq7EQE6LUlLcpmGcHGNPC1LJIGG+vWJIZEsZIPg6N
         kdUW7f4yDm6lTeQCF74o7LcR5UqBEeK/5r5gWBHz2bgHUKxVnLROJ/e2WlHqFSzrAcjG
         PUqw==
X-Forwarded-Encrypted: i=1; AFNElJ+n8YKRoIR+5ZqqFUrgUTzqvroyh4g15KdViek5la7P+TKYDNzC0QF3gBRtzZvi3ue/64Nb1kF7pydY@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeLUA2BiYs+GOS+jCwyHIdom1foXr8n5eaRFGvSAmjEooTTxg
	dw+8N15HJfNfTspm3nDBDF4TcKLQi4VW5yBDXbZM5FQyeSGTmgCd/4gY
X-Gm-Gg: AeBDietQtSsZ56bHZI0rMmFXCtvO/RkyyK550r1C0cvRTavhfIgFeVxdBIJqyvVqpsk
	A6Lr2LIePuye3MQxWMS45bOsD74wWnmht4eL7dNwczMWxGTvDixPAkJZPHlcjt9JZCNHpjYnqbY
	7dNo5KGGUVB+40lY6CG/dLzITEBBR0u8ae70IRGzQmkcAvmpx5kEPcTTkBz0e8I24MnLJJVIHEM
	75J8aF4jH7Ulwigxwz5VCzGrIN99x8bLhw5C1XgeAB+m/l09Z4mOLn9KgdOLs0BCIna+JsmmSQj
	ZoOGItkqEbrsFsyGJZXKNbn9HeCydnp145t52EqrNCFlXuxJNv+1JCvnKpUG2OK5EgwIHh56QzA
	zinppBeflybn3xrEEQtVzV6eA39tGLxT7SmHlnFzxZNCq6SGIVHJOZqygDqWWna2rriGmkDrll9
	FPxe0gPn25qu0ouRYFonKJASvUmD/EfA7qm7jckZuUPxfZXB1OKywFwXGFPEtfvDWjWlNUle8hO
	YVIqmhTcaJBMXzMzjqwbKd0Xa9A
X-Received: by 2002:a05:600c:3513:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48e51d6c8cfmr1051235e9.27.1777997744843;
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm402657765e9.4.2026.05.05.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count
 for H6
Date: Tue, 05 May 2026 18:15:42 +0200
Message-ID: <A3ZnAVmNS1uZyanwbLT-hg@gmail.com>
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:06 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
>=20
> Add a second SRAM region phandle to the video engine for the H6.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
=2Da10-video-engine.yaml
> index 932043d7f0cc..818d815d4732 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> @@ -48,11 +48,15 @@ properties:
> =20
>    allwinner,sram:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
>      items:
>        - items:
>            - description: phandle to SRAM
>            - description: register value for device
> -    description: Phandle to the device SRAM
> +      - items:
> +          - description: phandle to SRAM alias
> +          - description: register value for device
> +    description: Phandle to the device SRAM(s)
> =20
>    iommus:
>      minItems: 1
> @@ -101,6 +105,21 @@ allOf:
>          iommus:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h6-video-engine
> +    then:
> +      properties:
> +        allwinner,sram:
> +          minItems: 2
> +    else:
> +      properties:
> +        allwinner,sram:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



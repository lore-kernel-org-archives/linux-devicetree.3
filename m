Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651331327D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925265; cv=none; b=VRLaPwf9B6fJSfJgiyjadNVV9ld4vPxJ0aZtKCkiNSm3Vxborj23zBXSnVqXIstR5PNIRh7RgnzNeCoLMMlqeTABdFImUrh2jBqBFtLyIR2upvXzo/FCgT7WhK7oHOBDzSRnOfcQOWM9Y+oNFQicdUDDsK5oszzkZ2CvsMjgkWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925265; c=relaxed/simple;
	bh=yT6xHVxLZk0upCiR71weeJ3YTpFaCRjAee8PNhOeWBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNvB16VUBgYBVDyE+k+DJhnJq7pD7NMFAp0e1j1sjy5zLuYg19qsfWke48C9IJLkZVXI8fTHgTnYWjVP9vAoMi5nR/HSIE3Tb00LuCLN7Mz4GzW7QlRzmfyJKl3aQhuplgP9RhUU0sWHD7xe9KdXl7pkVmUVC9ApEFtlN4tbPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUD99qLG; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUD99qLG"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304e83724bfso5079929eec.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925263; x=1781530063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8q9Y3dkb4+nYxO7LN8VFVjV8kgwP5XnZvXClRTD2SY=;
        b=cUD99qLGG4ELI+fTJjEGRWmCCTdSLepoNH3rwd0G0yc5NDJSURy5UFcYfgoo0GkqjY
         rsR3GOy/qTGCCEccRc8PHlQ9Llf9ntTUbrA/jy5gLEqj3p1w+ifo+z1c4k9qqwH3V2fU
         NQ34N+ELJ3HZvZRfgO4LZx5/tCfsKtF1zu00JhvJ9eg59MQFaAIPCE9r6PqQ2+OnKH6B
         i4aS7mwpqxbaZZaz/Hpueg2JS0AwOqbISCXJwYVQmv1/Jf/fzwWmUgTOFGLjMuv20VCL
         4AAPKG99SlVmi5JgngfBgqOH6/LK7mXW3n4dPyy6cCsC4cnHGS4fwOTKGrHUauL8fC7t
         DM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925263; x=1781530063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8q9Y3dkb4+nYxO7LN8VFVjV8kgwP5XnZvXClRTD2SY=;
        b=Yxq3Q72Eqd5pyPJaRHaX0D/9f0EeO9F0ueQJ9J0wG6g8/u9SFBu4hk5B9S/+8kZY9a
         cJoj1TKCySlCfljLdvF6JmUT1boAh37qmU4u/u9BM1LTH0Ki4bqeeGuqKEtjorZHMSpw
         6HeTzt1roJQ3s8E7I/cMGg1zcOdwQZRdyrA5/eStm8VdsONzX3TbMWYql/q+ju3ixsWZ
         /lHfIzFj4phnzxws155XV3AORjk9Nxvyh2SucnKEcTUzXv+Qa502XszpvM7Jrtc+Hc8C
         YUlWpyUYJ5sEyJjZtYuOPqQy6dXMGHR9xjwojaWrXb2u4cDAVxmXmNz1JmhIQsXN1jEX
         y3vw==
X-Forwarded-Encrypted: i=1; AFNElJ+rnugj+/C2V/us1w1c/Ej74EGEd71AnhDs9GueWjklWEAgOXNgUjI3gnThsXewpngR1XZJIiJJf0Wv@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7tqPprOTFYNC3fdDWhwNgVSrN2CEtRENcuJO00RDuorgX8Sa
	rzRzCwLbxGZfM0gXeYJ98KoUGMy2h8j7YHF2qWhDdpJoeO56TmMhD39Q
X-Gm-Gg: Acq92OE+h63O/JvGfOx1xAmxpvlmryozqHhbvBd9u+XG6ZyOcSXF9DJ+lpCvAk9eIWE
	WXFm3lNE9jInuLBgsWFZM/LfSHIXvjntQ2fD0GLW2WvhfXnpRPhxgsMq+8BbHgISfYGhL5IMLq3
	SAJvGuzBH7al8ClHo97yHpkgbw0AbfAbxn59eOyGqVo0eaRfldK+Gc5YVM9GlLlaJXD1mtEm2Z8
	b25ocmEVJvX+SP+3ahQs8cT+fnr6k/H4ule/1o6yokLBaa4C3eapEu1Vr64c2hwAKedaP5k70cA
	UA9tU9TROrCR0GGLMGnpRJ5DPtsCYS8U4CaDhDECzTusyLUir/mkVcveODmZJFRvR09KkqvN7xN
	wrsLrB7SBG3OfXX4U6UI7XTgSCK5AQyjH2glsfvfKokYFFPWJc886BcHsJYedd5nNYr8t95lQhh
	ZmwiWFnbYKkvSOLesZWOUCItu9pl1of/oaWglt8kVf1iZnIw7vR2Y9U1XthUKp
X-Received: by 2002:a05:693c:20c5:20b0:307:287f:9bbc with SMTP id 5a478bee46e88-3077b7509d0mr3955694eec.25.1780925263157;
        Mon, 08 Jun 2026 06:27:43 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm20883832eec.8.2026.06.08.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:27:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	linux-input@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 7/8] dt-bindings: input: microchip,cap11xx: Add CAP1114 support
Date: Mon,  8 Jun 2026 21:27:35 +0800
Message-ID: <20260608132735.553239-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606151658.60E2C1F00893@smtp.kernel.org>
References: <20260606151658.60E2C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 1 potential issue(=
> s) to consider:
> - [Medium] The new `microchip,cap1114` compatible string was omitted from t=
> he `if-then` conditional block that restricts `microchip,signal-guard` and =
> `microchip,calib-sensitivity` for prior CAP11xx generations.
> --
> 
> commit 5c58a6baee363da7434a9782efa913c250015130
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> dt-bindings: input: microchip,cap11xx: Add CAP1114 support
> 
> This commit adds device tree binding support for the CAP1114 capacitive
> touch sensor. It updates the compatible string list, maximum LED channel
> counts, and keycode entries.
> 
> > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.ya=
> ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > index e307628350c24..08233386a4336 100644
> > --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> [ ... ]
> > @@ -26,6 +27,7 @@ properties:
> >    compatible:
> >      enum:
> >        - microchip,cap1106
> > +      - microchip,cap1114
> >        - microchip,cap1126
> >        - microchip,cap1188
> >        - microchip,cap1203
> 
> [Severity: Medium]
> Since microchip,cap1114 is being added here, could this validation
> regression be avoided by also appending it to the if-then conditional
> block further down the schema that restricts microchip,signal-guard and
> microchip,calib-sensitivity?
> 
	
Good catch. CAP1114 doesn't support these features, so I'll add it to the if-then block in v2.

>
> Documentation/devicetree/bindings/input/microchip,cap11xx.yaml:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - microchip,cap1106
>               - microchip,cap1126
>               - microchip,cap1188
>               - microchip,cap1203
>               - microchip,cap1206
>     then:
>       properties:
>         microchip,signal-guard: false
>         microchip,calib-sensitivity: false
> 
> Since the maxItems for these properties remains at 8 (and CAP1114 has 14
> channels), it appears CAP1114 does not support them either. Omitting the
> new compatible string from this block allows device trees with these
> unsupported properties to pass schema validation.
> 
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606150458.2506=
> 06-1-jerrysteve1101@gmail.com?part=3D7


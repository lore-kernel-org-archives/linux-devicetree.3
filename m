Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4D136C9C0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785724; cv=none; b=TnP1UbRFAJjlJf8rL9T6HmecdLecd9mS5Bp120sWKacWgPMD1+TCsWj7xqM2JmCBLnHhkLEUAGiuAP9iT770JDu3SzbAMH6mtGxIdK+AufTsBr1U0SN1eLuGx0IdgOFECh8fKi4vWd/ZFkx+E3uEe8LOUSHnrt5pxmu+IVs83xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785724; c=relaxed/simple;
	bh=VjAnPKkOhrNzBBj74/3IQ5jyXGO7ZA3AmQIZeJkp3YE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3fsx8iblLBExtGSKPv3a4cNvIJ9DkXaYIdPfzq6HF0z3Afi4XihvMMdr/IoPI4Xk5ZzFpAF2TOK31dnRC8n3h4+uSVZwZWqGvL0JiydORfqgZbnfLHOzJz9OUP8ikD8jM34Qi+3PNSx5aP1m6wKvAXtK7/dI5lHic9I/2PtJcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOtd5Iux; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOtd5Iux"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so25096145e9.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785722; x=1786390522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIsx6zbYaQEdLVAaackOaf7e88l+t3puadax1/1AhNI=;
        b=UOtd5IuxjO+0CawwxJUBWuop0lzlLd5/uZhrltQgg9jIS3N5sre30KR2dsAcsc4ktb
         Ov5KYlNJSnRUmZGMTSiDoLWCe/dYmIFDvE7JlWxd3LpcsoPlxLmBFRz+LItp6Oa2+UqY
         7F7Iufx7c+TMi96uou4UHWerJcRNlMwFuFjdIP6BGheHMSeZVnZ9u5EcOT2R6YfbLEQY
         CCXbgR7NGUxw52lQXuq1JZHeA4ha5fCd2xo5IbuMwdRk4mbeiREkkz4KfKsWqE2I5YvW
         13ZvmhaXLrfJb9r3YMNjeGTpymqzb20UqVL+NkpEzvWlwWnogdrZMe04ntu9hxAIdlIk
         bMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785722; x=1786390522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIsx6zbYaQEdLVAaackOaf7e88l+t3puadax1/1AhNI=;
        b=eoLMXzm2Uunuh/LwM5lK12FIRFvaMx9Uocj6UrRyG1xJWXPH6mctzl8lm6CpLCOV5X
         oLpU9XFV8OBsB1XjNLJ+AfaWIsJfjPAiKQjOOFlwzJK+l+gEcat96igCnjEiDIdXU2mR
         tQCIxb8RacFiko/GZM3Yvf0BeWiEPc7J3zyVr0ZIJhHFf4HB/2NYuZTUZu+c1bOzEnuQ
         MxoITp3n2EG3okPkJTRqz18vIyNprVZ4zI7C1W85Hm0213EiW7lKckj9oXkAFSO2LxBy
         hRBil8lEFLkctAUbr2dj0IbmaVq9JEUCkkhfZPe4Q5fJBkeRgA36pUdpgkcbaA7oYmSo
         aXaA==
X-Forwarded-Encrypted: i=1; AHgh+RrRSbBK3k88kQAM5pkc3XjdwhYCEZgJQs8QIOvHYQND0nONT0cTjG+YM2+cINEau57kPamF8XuiLfmj@vger.kernel.org
X-Gm-Message-State: AOJu0YwxkliU72H7QnS3cnByRb5+b69o0FPJ6YEfIbklJW7R2i/wT+VY
	7bpt30uXojpBGkBC8Z3SjByRw0MXo6toui0wZdCDn52WUPSphzjAm3SE
X-Gm-Gg: AR+sD12eTNHooHAm4m0vpfqb4sJJsiOT50LrQdedg+7Zn2BMGh9VN5j9yE2s32x2h8h
	HZmROeqptS2PwIWLqfuZoHSd9TK7uXxTsMkZdeTp78OTSzbn/E5/tcvGFLV2gpNA5RxYbkss0Zu
	321xY7rB4BuCmZtV7D/+ssGaz7vi7Wnik/mShPYj9dAS5A+iTscgGQhvfcC521wtVl7bWIIaciX
	KSIpTHSTyPiF2qkTWBNIV8ShDQxm2TZ1GBtSGHQqu5f21uFLYBYWmJoFghJEXH60lwZijhFebUl
	tb09pAqBJWeLntxZqWG16oy8KV+tGdprxR+VbIBQOyFNko38A5tXzJGp8FLBRBywo5Jy68RpjTk
	r4cM9uByTVLvNo+cxr+vLlJ6Yc2EJOUVuYxHxFk6AWpS3I1mGeFBf10PlcWi2RMgNkECBCjNrHS
	Np+QqH74f1EShnRa51Mde94WA0+kfMhAjewKSVsSN6AtZ+l6LIgccQQgPRk8XHGpf5yS5B/+WWn
	RxYBfcKmN0WWxLTTEbcjnTF6sLafyp4pgSZWD4B/sXyRBPaBiuy7ev0kRfmGp6WuWBRzpcE5bDP
	io+HOaT+TOG/UX9p392tFzTK0uzNWEslDOuC0Avqj1IMFTyfEZtOj1B8n096NVWMfbvACVt1cfx
	fYq9SX5wq/Z0T8DKeKkBhqRWAbbwtqW+f
X-Received: by 2002:a05:600c:3b99:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4980c66d8b0mr265523695e9.4.1785785721474;
        Mon, 03 Aug 2026 12:35:21 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456220esm36742356f8f.18.2026.08.03.12.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:21 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:35:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a1
Message-ID: <20260803213519.7d3d241e@systembl0wer>
In-Reply-To: <20260803180717.4BE651F000E9@smtp.kernel.org>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
	<20260803-mcp47a1-add-support-v3-1-540e71b4fd2e@gmail.com>
	<20260803180717.4BE651F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 03 Aug 2026 18:07:16 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The I2C addresses specified in the schema and example appear to be 8-bit write addresses instead of the 7-bit addresses required by the DT specification.
> - [Low] The `reg` property schema applies an integer `enum` directly to a matrix array element, which will cause `dt_binding_check` validation to always fail.
> --
> 
> --- Patch [1]: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a1 ---
> commit 441e840b5a2a3f037c3520c49013a55b7dc4c1bd
> Author: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> dt-bindings: iio: dac: add support for mcp47a1
> 
> The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
> which communicates via I2C.
> 
> > diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
> > new file mode 100644
> > index 0000000000000..b181fe73dce84
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml  
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: microchip,mcp47a1
> > +
> > +  reg:
> > +    items:
> > +      - enum: [0x2e, 0x3e]  
> 
> [Severity: Low]
> Will this cause dt_binding_check validation to fail?

No, this is a perfectly valid dt-schema which passes dt_binding_check.

> 
> Since dt-schema parses reg values into a uint32-matrix (an array of arrays),
> the items array applied to it defines a tuple schema for the outer array's
> elements. This means the inner array [0x2e] will be matched against the
> integer enum [0x2e, 0x3e], which will mathematically fail since an array
> is not an integer.
> 
> [Severity: Medium]
> Are these 8-bit write addresses instead of the 7-bit addresses required by
> the Device Tree specification?
> 
> If these are indeed 8-bit addresses (as indicated by the 0 LSB and typical
> Microchip datasheet conventions), they must be shifted right by 1. That would
> make the correct 7-bit DT addresses 0x17 and 0x1f.

No clue what Sashiko is on about since these are indeed 7-bit addresses which
do work when tested on the actual hardware.

-- 
Kind regards,
Joshua Crofts

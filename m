Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A53AFAEA
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785284; cv=pass; b=sEDE65Zi11lqwBmjK+t56lNBo9+OY5L0fBt2dspN4uyYrGwjfPpCcs1VDDr3xee6J1/TcRQvGwSF0iYs4w3TtuhPoKG3GFYJ4iiFDkgImcd4FSWPksUEjizlcBZECpVtnP6bWKnpLC1ES6JFVKgMwP8tmBzULlzLyIR46jas6qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785284; c=relaxed/simple;
	bh=5fQncidyqju5XwIRjWaEWUVmeKeo8nb3CtmIXxuvC0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNGUB0opQ3llLi05m8f+bBrWKUoBYd5s2zBIStZ/ed4f+cwXUTR2sh+hHQnOA1d46h8xQhNrNZpBOJ2UzfNRsS3XnhaESIo3CqwhPKj/nRx7BvJW0m7mUKU81v4mLUIUNWKIGtN7X1fphozYKlp+ShAhyyhFzEoQy7i4+fc9zYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDUXxDK6; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDUXxDK6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2387227a12.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 02:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786785281; cv=none;
        d=google.com; s=arc-20260327;
        b=FoBxRRmSf0fE4ScmklDqB3a6rQ/ry8Gjvkn2wAHI/AS//ajWG/hb38xmXd1FnXtkY2
         uUppNCVI2WOUFApR1s4U4F99Z2DLLSr7T+rk8kARtQC8+kP7/gLRs5D9DDlqQhu2GtWG
         9suWqNxCV8HBV6kgMKoCEYBp65EKqSUHEn32+mxhXsP+aziGv1myv/g1Q6s7+9l7UgPm
         Lv9CwwExpC1gS1pcH0MEd0EIN2yRx0iymuT3TJmmmPsBeMpLhyMfg3nSrGZ7ixTqO5eC
         XICZbLT9xynXBP/rKg0Kj+gxFF+qDJZvITgReP3idJh58eRNlgNLXjtgqQQXq+uOXQNa
         MR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        fh=2W0Ap0j8ZPdraPmHNiuQ1VQrSV3frHwjk20YcE+aGgo=;
        b=iLEIIhkApXWdZCIgi/XPtcRxtd8YfVnG8upvSjalJTt+xKUS6hm9SqTNttv5//VtUE
         hqIENvaJ1ypiVDc6UwsOHSJP+q1uDrTAdc0GL9zpQx1/WjwEhkAK9N/JhC7zGB7mcifb
         QCEbW/N+HbHu7q+bSmNHyscazGkAriF1qBisv9qyjPFtbVwRK30SBcLHtnHZGY/g7HAN
         9o488Obg+5USaDuH7P2qU24JoNRQLadlZ/+quHTA/8MqH0/nVY8tbsF8r6q7QN0QG85e
         6qHK5FkpMSL9SXQeDIwlmUxJnk0DhWzoJ03lanFVNjGYsRlwWbnNM853Ytu7ZfNkbJhm
         wcnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786785281; x=1787390081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        b=hDUXxDK6PZuGgrKK0TowOFXMOcunkp2meq3XN+hsTXHz4HidSz4t4ZcRyw00Nkg5HR
         XzhGbrm6OrAL6zNmKgzYgihKjMKfidamb3rYfqGgFgtmGqxHrPFt7nd73n2YpCekhbPY
         1Of1QZ0lLeyJN8rqBfLcG/X2R3xZontgrQM8RVX/RIR+dFBA34I2cyBVBL7p3/F81BG5
         BQIpBM4Yph/ZAXJYR1O4CyWuHjnFtlmHwFEsjD0i1x03a/4pFw+2h3rbocvi3agCq2Ri
         tjaktN7z5rh4cI1SX29gfBWsTXa6kuO5BZHXjF0kSx0yOZDuFBA8teVlkqJFrfV9/quj
         /3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786785281; x=1787390081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        b=cj9p+HV7G/KLkpQlTNC/LLf+ULRL/WRepFVdTXi9z3xhHIFS45Vb7U5uCbVuGnpSXt
         TjVo5mv2Ys7m0XLx1hOWzVkMZVePZpPVbkJ7WEZm3HnCwuGyDQ/qCgbByWXzmdre6Tzx
         l2PK/lIp6V0ES2jd0lA5lN5kd9zjSVp8chWsCkjsn5ULWVo2AOOSMqmQSLwsgyWVxGj5
         fSU7XiWG4MpvoMC3rFAbT3FEoxRilTCIGSxkOa1wfSOiQhXmSEyFHMPsp90Yr7qMaPL4
         KgyQz8iyMhynQp9/DkB5HNWcJAgTxEw1jM6DlyENycczAeQWn9x7wAMJmECLSOYcM170
         5HVA==
X-Gm-Message-State: AOJu0Yw7RSppYr8Owfe8zbMGcjOARwFBfXGqLDn++srSSwgOnOOVqg7X
	twIOVdT9301Lso+ZcwkOGWS5Qo7gATM9nEMIEh5+n/1trkLc1cDDN7kFBOSgeoDvVLF5+OJmG8P
	Jw3tKt4ZgZjcd4Uzh2SSqAWNYxD3qAcc=
X-Gm-Gg: AR+sD10952iSciOarJAStZXbub27VuEvDGBGGG3cbuwcljWzDJLickru9CWgG4eEJby
	oHgWi5qnbFI6zin7de2RFj20M32FyyRDJSnbAw/WVyxcxRenh6e6FVPnczN6LA8WhWJda/xmhfE
	eKbAzoEfNTKxGMMdakPq7iEL/N6QQKg+bVLBVrw8r206B02o+s0j7XZ30j9dDIKv4QhLRNOJVbg
	tYxmGomZy/iHFqqGd8F7rEcRpXOc5JLLCI8NyNcbEPnbqvNCE6MlglQwQepe2mSGZixsKmNIpGF
	3OA9f1vtBS7YZiG9FBR89TFIWuXMKBu8dOHwbkuBquYFw25FSgORUajuymbK8twiT6gnVcpdupC
	Ruo00T2LGsh43
X-Received: by 2002:a05:6402:249c:b0:6a3:8586:9b73 with SMTP id
 4fb4d7f45d1cf-6a38a926287mr5303643a12.6.1786785281054; Sat, 15 Aug 2026
 02:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815083451.2147129-1-egbostina@gmail.com> <20260815084635.BECD91F000E9@smtp.kernel.org>
In-Reply-To: <20260815084635.BECD91F000E9@smtp.kernel.org>
From: Eduard Bostina <egbostina@gmail.com>
Date: Sat, 15 Aug 2026 12:14:30 +0300
X-Gm-Features: AcwNN1XLq_7Rvilq510EdyjugR4FFUzRoIg_f3AqTgOwGlF-ckiD4eTzrM4zuSY
Message-ID: <CAEFOc61s9761y+7zcuWmNUeRuOWika=uhAhOay8ufL7vVhNk8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, 
	robh@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 11:46=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The YAML schema defines incorrect property names for the vibra=
 default voltages, mismatching the driver's requirements and breaking schem=
a validation.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema =
---
> commit c57af8c690b680b78b9119a5988e020149e24c1e
> Author: Eduard Bostina <egbostina@gmail.com>
>
> dt-bindings: mfd: Convert TI TWL6040 to DT schema
>
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,twl6040.yaml
> > new file mode 100644
> > index 0000000000000..a93835aa91535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
>
> [ ... ]
>
> > +      ti,vibrmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right motor
> > +      vddvibl_uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibl default voltage if it needs to be changed
> > +      vddvibr_uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibr default voltage if it needs to be changed
>
> [Severity: Medium]
> Does this incorrectly define the property names for the vibra default vol=
tages?
>
> The twl6040-vibra driver actually expects these properties to be hyphenat=
ed
> and have a "ti," prefix. For example, in drivers/input/misc/twl6040-vibra=
.c:
>
> twl6040_vibra_probe() {
>     ...
>     of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV)=
;
>     of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV)=
;
>     ...
> }
>
> Since the vibra object sets "additionalProperties: false", won't valid de=
vice
> trees using "ti,vddvibl-uV" fail schema validation?
>
> Conversely, if a device tree uses "vddvibl_uV" to satisfy this schema, wo=
n't
> it be silently ignored by the driver at runtime?
>
> > +
> > +    required:
> > +      - ti,vibldrv-res
> > +      - ti,vibrdrv-res
> > +      - ti,viblmotor-res
> > +      - ti,vibrmotor-res
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815083451.21=
47129-1-egbostina@gmail.com?part=3D1

No in-tree device tree uses these two optional properties, so
dtbs_check never caught them, and I carried the names over from the
old txt binding.
I'll fix them in v2.

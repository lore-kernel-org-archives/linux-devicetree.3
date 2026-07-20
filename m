Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00660394471
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517846; cv=pass; b=QCrBD4REdzsXleMkQmPIGoJw325sL88RZWA7fcsQJ9eHqsxBaIH62kQeO25VfwE50IWvxp61889rOGwlE0VNZ8vGGy5wiUJW/WgkuPOsCKRnhzGElZEb+G28488VeNVCgbP40Y8Se7SFJJUMqEfKiSViGCIJyHzCh6yI2u2aLDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517846; c=relaxed/simple;
	bh=oRIe/84zUcYPF7WKctWcQse43kn0k7OaGkq/Am/HD3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFgYtdvG/CTRxUJ6in8MkjZgFh1QjDNF3iPoUKh4QX2zYNg7rj+H7uRYJlZ7txV4UtOxLys127ff8aw3O6avLfmIqgz2jfT7yBvasVhSqhDx08PXKS+5SpMLeP9qME0sm5q8Aew8Xez0JMmFYOBXiuuigTxBEygWUS15c12FBnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjWcHmEJ; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjWcHmEJ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso13962618a12.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784517843; cv=none;
        d=google.com; s=arc-20260327;
        b=jF2mLBiGXGSNDZY+ZQmVpgmzba+Vh6f/aKyEnWczpykH53D5fymheA6s4b0Z0Fh1Rs
         SG1qGgt7cFzDJ/dqN6FPaK5iIksI6uMnjpJamt0USMoNDeG4A2pe6Lppq4rJBHAB/MZ2
         bAWJ3ozNTjcb8LMMVMtST8Q7DUcma4BsnIEtcrdpRstd1H/83UsllDTRfvAQ1E5JaMZS
         sHdpfFUTuRZRZg5sjXh4Z/o1fk9+LcYs2O0G/xbrGW4d8qtVO3me66KxLkfPmGGpk0cK
         LPNJJAc4jvvsUUSdEwt+o6NwIR+zQsJ2HIB0V5zFWfQqjGiPShfRtnOUFw7H5hldbEka
         AtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        fh=J1iNUWIw6um/WsFVLTimJk9VLT4Hvy/0WLPQoKIVqIc=;
        b=r++rGcG+03S1m6gUDw6ryKbRR6wlzW+/zthu3rrYxsMKL+8ZvPs7b+MEXnGXLOi5IT
         R31P+H8NfDNUk5QG+9edR8CnomXmNnlJfekufx01G3vJ3juBkJXi3l+EDwb/QM6NyC3M
         3ufASG1L5Qc5GFjTsJ/zTMe56QNSnJrW3sTD36ox19/2GahOA8T8D0Zfrom2zBiP7gEm
         gmU6NBQRh5vYFLakHbcjAgMnk8HGy21yt9ai+EZ8Y1sJVo88OUgcFhKO4TSF2b1rsdcB
         ml7o+J0224hfdwcEZi4Qd0FgeWfCaKWNXs40stSjDGs7YyT+01ujCxsCawQ5Mr+VJL3A
         zvnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784517843; x=1785122643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        b=OjWcHmEJ/Q20yrwJ5tFk8ckX0yTSNASrye0ByaxGOf6sOtFK7cQJrx+uxYgQAndoyw
         aSQqXgzgdZcaelmyk0MSsdfHB68R+eitTqG4H+kNukzJ14iFu63z1S/UX//KruSdCmGu
         xHUQ38Q+Ymx1txoGlm6b4+rErDC861aPCJrhlgvA4ON56W+nhCu+yZPe2zEbnnd88LxZ
         9AFmxrgXjvTZqjGCdvDkm2bZnsFy+SM0TiXwhpZPNMkeeY9TByPo3+I80QnP4kjWa6oY
         ZiDYQpziDoSrk7iTPw1lmqZyRXiliqCY7ML6OFg8Xr66e/WQXpE//J7P25qtA3HA6AYL
         wUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517843; x=1785122643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        b=mTZ2FVX/dgYX/kU66r2vAp34amyFUGH11PK3eI55LFZpM2nkpO3xHNGw99JN22GPBn
         9l8pH4iblXUwEnaCwuSXtfCgBfor7PJM/vN3i5RTHOtgz6nOwNJyPviQQLJ754zIuBpU
         5qH3kijbinnvo8mH0fcibFLhkPpN3xkR6g6eDcFxFwf+N1GAHDZ9FGzdhVk5sD9laeju
         NkqYNMlWk0aKD92m6KTSV8OWaa5Te93Cqb+NeNre7Ng3N99iII/2+TR1fULI7pUqfoaC
         LEoEextyL0HrvuMNkVwa57Qn+ZAzy1yGLVYUXTDK4DbUeHDO7qQpz+oVJ9Fed+/fbn9p
         8+1w==
X-Forwarded-Encrypted: i=1; AHgh+RpMvO/6VANMVXX68p8VNOmY7rL+LKJmfDJFPNXIvQEYZR3BTZpoi6j66GceZSQoO9lgRNKxUEXHdICk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3PHVcv7r5Xs5OLba3mIM1d85clvhDb20t9sZI7aaAZB9FcOu
	AFroUqNGz6620O6boVkSepC7BC9agkpBWFqgfUsE3Dr1UgBKRfCg3YeJv62H05SdXU3OxHQIzZ5
	NfbK2QRAxEjZPgq1/X/IjYinc+YJfo6CfNHDT
X-Gm-Gg: AfdE7cnrjqj4nvzAfnx4YLLGi4lMGga5er1oMExoyH2iSOD6MPj6BU8NTZp24bcucO3
	tUhwtNTyf/0jnP6qFkzV+uCLCV+FktfRbet2hDdLOG8R0BQrmmzQylo3GsM4aXtOEnaJbwJnRrc
	bmrFxqPWxGnK7TS3bgNdaFRi8giXlbH8HRaL3YvrKznOW1jXZhUWE5CCxgE8eAdHMwDY0ll/MLa
	xSkBrpO73eK58p1AJCxeS+87YxbXR90cD9rWi1PM6Tmy6cqtJ62Lw7rwJc9UHncBvzGbMN9gUzS
	TIi4SwpVfL8F6O/n3EiH
X-Received: by 2002:a17:906:7947:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c16b46aa27amr427440366b.6.1784517842957; Sun, 19 Jul 2026
 20:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com> <20260717210439.356FF1F000E9@smtp.kernel.org>
In-Reply-To: <20260717210439.356FF1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 20 Jul 2026 00:23:50 -0300
X-Gm-Features: AUfX_mzsv1aeyFo6ikWaI5--bnju7xbF9TV1ObqLQI1Nx-0zHSbgM8sQSA2VqxQ
Message-ID: <CAJq09z73W9rtS75K2802jmZpHcAag-Sz6roKQW31cYANH4gjFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The binding defines PWM output and thermal sensor provider cap=
abilities but fails to include `#pwm-cells` and `#thermal-sensor-cells` in =
the `required` list.
> --
>
> --- Patch [1]: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt=
7470 ---
> commit 6372aff696282f1ac0ec9a8f1372c186734704a2
> Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> dt-bindings: hwmon: add binding for adi,adt7470
>
> The ADT7470 hardware monitoring chip supports PWM fan control and tempera=
ture
> monitoring. This commit introduces the YAML device tree binding schema fo=
r it,
> defining PWM and thermal sensor provider capabilities.
>
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b=
/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > new file mode 100644
> > index 0000000000000..14bb6359c91f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: adi,adt7470
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - The first cell is the PWM channel (0 to 3).
> > +      - The second cell is the PWM period in nanoseconds.
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +    description: |
> > +      Number of cells required to uniquely identify the temperature se=
nsors.
> > +      Valid index values are 0 to 9, corresponding to temp1 through te=
mp10.
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> [Severity: Medium]
> Should #pwm-cells and #thermal-sensor-cells be included in this required =
list?
>
> Because this binding defines the device as a PWM output and thermal senso=
r
> provider, omitting these cell properties from the required list allows
> incomplete device tree nodes to silently pass schema validation.
>
> If an adt7470 node is created without them, dependent drivers attempting =
to
> reference it as a provider may fail at runtime when parsing the provider
> specifier.
>
> Could both #pwm-cells and #thermal-sensor-cells be added to the required
> array to enforce complete node validation?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_=
thermalzone-v2-0-a55147958fad@gmail.com?part=3D1

It would be nice if Sashiko-bot could have previous submission threads
as input context. It would be a great way to avoid false-positives
like this.

The ADT7470 can be (and is, in real-world devices ) used as a PWM-only
device. Likewise, nothing prevents its use solely as an ADC for
temperature sensors. Because its use cases are modular, neither of
these provider properties should be strictly required in the binding.

Regards,

Luiz

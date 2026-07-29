Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A5D463B7D
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785351974; cv=pass; b=mA+fMA7yDfKbXDdRMdbOq75lNNEzOBY3HUaHUhCa/uVO9In1MMyDBKL+8pefFY/DHlBQyDbbVonJAQXgBJnLOi8GuvURgKI1aXEPOPk7eb/bbdmIbPEpfZ8dbXCo5FolIuPDQU9BSCXrWeB0eXxtasDeQAvbI5LF+ePH/bIJWOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785351974; c=relaxed/simple;
	bh=wAdu72A3DEXoTjZcNRaRdihUUTgd1Kv+JghHO10IA+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rs1Ew76AbkA+JY4i3hHx2CSsindvmJ+3SQLAXVufbidy1m4jt99JdS646XMj9PH3F2HSSLydVfuzAqOnNbu/Yq41ytEVFWQ6H+9IsMsKG9nGLynWh/aVBZyk9zQaVO/tV1XNNrPuzeKWO4mNwv436aakiLOefg8sbBF2I9ijxjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XscG826k; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XscG826k"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1953567a12.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785351969; cv=none;
        d=google.com; s=arc-20260327;
        b=dts7a2ZWuZ/6ntYsZMZBVWDWoEJFHyv0qsuJGG+wCn+m3W9ZnAy9rB/OvdEtdR1M5O
         WpFpNnpVuj5YeuXx5ozZN4FmMnogJFnuDd3OPaiMpZ+Vi561uwrviddID3RfmEMR013T
         kVD37jTe7wPb2wQ/MSYVmQF6vEkfF/GbQ67EhvI0fkgp2AhL2sIZepPEvhO+KqZCr4ze
         v9zPEC9cvN3IwxXwWfHe0QilHSgKXnVK/AO4Z30ZytM1I4wrtetg2ewvoFMvlMZ4hfr8
         g3CMbz+1n86jNF9W9otRsI9MeV6CtAH3swkmRGBa77V3J2w1w3NyOVIynEB1E9RfGriu
         5LLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DZXBsryljzvRAdARemAvVq8vZ8/d5uAOMgvUJOrxQGo=;
        fh=uUXbhqjfVc6Yk9tJhZTnLbzo/4GRybX3vViMt/zFcoo=;
        b=ofxkGouMqzai/4T/TRJfklY/+Mb4205uzVUzf8xX+y+TfXM6F3BVH7LOi9LDCQfDZX
         XG3PM7QRg95dVk5mz4ialu0VZMOdsk5Ju11R2Rn2XEaOYpaYEBFYvFSBpXwDBv5wtiUw
         eB5gjspXnfoF7bnuxounfxB1wf6kAoHWsjk+Gt82nxK8JHTa7wQdddcQP4dbctku1dv8
         76cUjti4mQQ7QftkqTV/rPRahg9oLwSrIdnAIPgtJsZ/ju/gxDcnba76AdBBqMxkaYz+
         uRJZGdig+udbMUUESXS2E0HpEG8XQQ8V9PfiMRBf1bocBWlOyt5LM6larX+j2TgFsjSq
         jLiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785351969; x=1785956769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZXBsryljzvRAdARemAvVq8vZ8/d5uAOMgvUJOrxQGo=;
        b=XscG826kFPsTzf15VIzEtkWguGRxdeVLX7qphy039ovATEVGGy32IpTQ12b0OtZDQG
         /7Zkv/y+A7alqLq0ecD2i46Q3iCutF08vhukdOgck0J9AmGq8NMrPgD75c9VXFI1ekmp
         KRc3Z5RddKb0QEkRKQhFUgIlpAzT+hnWzmhk1Hf07vXiMKDMJddeyItDE1yfhN7sakbi
         GEe67LsJgguOS63Dwz2jlJPctXHujr6DXCJ361CQMu1syXlWMwumuNzroORgPuzxCGsI
         f/9jBQddDcWNbyg0wQvcltfYpKw/fih6E4z11rK0F3oY0FEQ1x0MjNnDD3aC+upqkzyg
         5Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351969; x=1785956769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DZXBsryljzvRAdARemAvVq8vZ8/d5uAOMgvUJOrxQGo=;
        b=NpNUzX2fg++vd/nNWOQm+X5UpozV4O3giZanDeGOlcMYsNEi8LcvFXsX4KXFBQAh5d
         6KcxEvil7roUxQGWnUfSXwp4FaLA+aUvsA2b1JMXhB+f92NTIciwVMaajt78VbOtEY8L
         3aAfiBRtiorkiLS1ReWxiR18SgOgjjHoFH+QyNB8ECDFlHZ+IPADzyOH1gvThzwi6efs
         LAd3G7pdMMThJzuRqyDuBi6pk05vlpOJBdtkvmSozi0zbec9aclhDiESThzLsTyc26eT
         xh/AzDggA10r8nbKcUc0Kgx3GtCddJ5QndzfVKV1oRuNGVW1QwWUilVxwT+wW4Ls2j0B
         ArqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSTo8Jii740vd/I7+bQ1E8eKaYCFG6Ue5AoYX6nm0cjIfK5xKS14XOSO3+j/iKIM3XXN2mvw4gY4on@vger.kernel.org
X-Gm-Message-State: AOJu0Ywstgb1gN2gopF17EwuFbMdnOEopr3NLM+mj4UIXzjxjXr67sK6
	ZFHLi4Zrhtni/Gqs+Tjm8RuudjdrG8vw9e6oq3vBoV0xXIIHUr88cHp+Y7fzRrW9PA+IvUIEI/K
	ERfy8g8L6+Rl9A6OU9iGwd/e+2i+uSoE=
X-Gm-Gg: AR+sD12ksSw0xnunl5Z0UurbP92eIhRaxprmHHUmE1MAL8sOM1IGp0BsoupdD25Unn/
	vtGjHFRtH9bjZ4XSaGgEeJYi9byjljw4Sf0tVKwInwcqw5eJeg0TIKrVxyjRF2KR/6TDISuOhSj
	5VXfQVXpa7SzDIbZ8hifAyvqF+r8+r8Rf2WJxZ0LYLYwPwWfJz7HcI5LR++yziphg/A6oLSNGVm
	HLBK0w8HroWeYQVWIRnyjzEnSSRdfO5Dx8VZwJ+1l0qBUrBP+vP0DKeoqcb8p1Pq/930SQQPYT4
	t/lLfE4v7UkSJJY7Gl8/QGlhc+IB5ODbLcn9MnHLpDKgU0pD1bz9TtolU8FFRvjhhpPfPpRjfAB
	W2A==
X-Received: by 2002:a17:907:a0d1:b0:c1c:4c91:c24d with SMTP id
 a640c23a62f3a-c1f7248682emr457131166b.57.1785351968958; Wed, 29 Jul 2026
 12:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
 <12dfeaae-f806-4adc-95f1-97fe10ef748e@roeck-us.net> <amnoV4Vlxmc5QgVC@monoceros>
 <e535a9c5-28a5-470c-be21-95e1812e5e01@roeck-us.net>
In-Reply-To: <e535a9c5-28a5-470c-be21-95e1812e5e01@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 16:05:56 -0300
X-Gm-Features: AUfX_myK09lnBqf8bijuFVi6yJ4owlE81-Hh3AUMgJGBEnXoh0IbuXXrjswABFA
Message-ID: <CAJq09z5diKf9HpJ0B_7tyo2-2wPfojyG4pRY1qhRQ3fzx0Gr4A@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v4 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter, Uwe,

Thank you both for the detailed reviews. I hope I'll address all the
points discussed in the next version.

> >> No, I won't accept this. It has to be either or. A pwm channel modeled as pwm
> >> subsystem channel must not be visible via hwmon attributes.
> >
> > I didn't look in detail, but maybe my red line is a bit more lax. IMHO
> > it's not OK to be able to modify a setting that results from pushing
> > hwmon knobs using PWM operations or vice-versa. Switching between
> > exclusive use at runtime is IMHO ok.
> >
> It is my call to make, and my call is either-or to avoid confusion.

Guenter, I agree and followed your strict "either-or" directive. If
the device is bound via the PWM framework (i.e., #pwm-cells is present
in the DT), the driver completely hides all legacy hwmon PWM
attributes.

One implementation detail: currently, the driver hides the hwmon
attributes only if #pwm-cells is present and IS_REACHABLE(CONFIG_PWM)
is true. If the DTS has #pwm-cells but the PWM framework is disabled
in the kernel, it emits a dev_warn and falls back to exposing the
hwmon attributes. Please let me know if you would prefer to
unconditionally hide the hwmon attributes merely based on the presence
of the DT property, regardless of the CONFIG_PWM state.

> > +static int adt7470_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > +                                        struct pwm_device *pwm,
> > +                                        const struct pwm_waveform *wf,
> > +                                        void *_wfhw)
> > +{
> > +     struct adt7470_data *data = pwmchip_get_drvdata(chip);
> > +     struct adt7470_pwm_wfhw *wfhw = _wfhw;
> > +     u64 period_ns;
> > +
> > +     if (wf->duty_length_ns == 0) {
> > +             wfhw->val = 0;
> > +             return 0;
> > +     }
> > +
> > +     /*
> > +      * The PWM frequency (period) is a single chip-wide setting shared by
> > +      * all 4 channels, so it cannot be changed on a per-pwm_device basis
> > +      * through this API. The duty cycle is rounded against the currently
> > +      * configured hardware period rather than the period requested in
> > +      * @wf; round_waveform_fromhw() reports the actual resulting
> > +      * waveform back so the core/consumer can detect a mismatch.
> > +      */
> > +     period_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, data->pwm_freq);
> > +     wfhw->val = min_t(u64,
> > +                       mul_u64_u64_div_u64(wf->duty_length_ns, ADT7470_PWM_MAX, period_ns),
> > +                       ADT7470_PWM_MAX);
>
> This is wrong. Please test your driver with PWM_DEBUG enabled, this
> should emit warnings.
>
> Here the right thing is (untested):
>
>         if (!wf->period_length_ns) {
>                 wfhw->val = 0;
>                 return 0;
>         }
>
>         actual_period = NSEC_PER_SEC / data->pwm_freq;
>
>         if (wf->duty_length_ns >= actual_period)
>                 val = ADT7470_PWM_MAX;
>         else
>                 val = mul_u64_u64_div_u64(wf->duty_length_ns, ADT7470_PWM_MAX, actual_period);
>
>         return (actual_period < wf->period_length_ns) ? 0 : 1;

Uwe, thank you for the waveform callbacks snippet. It was much
cleaner. I only had to make one small mathematical adjustment to the
actual_period calculation in tohw() to satisfy CONFIG_PWM_DEBUG.

When using a truncating division (NSEC_PER_SEC / data->pwm_freq), it
triggered a "Wrong rounding" error during testing:

pwm pwmchip0: Wrong rounding: requested 714285/714286 [+0], result
714286/714286 [+0]

For example, at 1400 Hz, the truncating division gives an
actual_period of 714285 ns. If the framework requests a duty cycle of
714285 ns and a period of 714286 ns, the evaluation (714285 * 255) /
714285 yields a register value of 255. When read back in fromhw()
(which correctly rounds the period up to 714286 ns), the resulting
duty cycle becomes 714286 ns. Since 714286 > 714285, CONFIG_PWM_DEBUG
rightfully complains about the duty cycle inflation.

To ensure the calculated register value is strictly rounded down, I
changed the actual_period denominator in tohw() to use
DIV_ROUND_UP_ULL(NSEC_PER_SEC, data->pwm_freq). Maximizing the
denominator guarantees the resulting duty cycle fraction never
inflates, effectively passing all strict debug checks.

Thanks again for the time and guidance.

Best regards,

Luiz

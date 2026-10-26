Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034523;
	b=07ipLoHZGm741IrNj5bPvPbTmxh8nB1SN8GgkQhdCE+azA0cST++PJLAEVLm2NI3ykxy
	 ew7SRjPEfNVxTKg0Dt/HtQV/6/lySGiWjFA4eaag7MTCn8XE+WXsjaUd99OMEND16zwdT
	 BUacFRawqQy2Us+0nzXzROUswBsdg2kLnf6uIW4iw20svMR0MJZo3SjevCrXPoaaew6Hk
	 t+O6Mu8NVoTn90Ng79VDIGH3npLtG8CJ1SdKXmEhPtuJokZ6WH2Odpa43QlQYZAXcWluR
	 PCfWzVIkOiUdVRPcNF2/cCQ97zQOuV2fefdzbKOTGRhZsVnZRUXedYBaXQFUwC35E7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
	b=XthPRkFVfizogAaPjU8LasOPkdR5RQOSCf5OXMUBy3WCAlJaztnBYMJd7wJoVnQcNqCo
	 wnqSbw3LceCeGEnmsj8Djk2Ly7mDjWnwVOhARER6jk4X6eENSux5zOdyUi5TftliUXnmQ
	 6ARX7+VtPsSMp1Sn7FmWIqy4jeH03k34215ZLGqavPpIe5MnW0je2kTrOcgAgq0tnOifj
	 JZV+oSd5s0Q5mSxsaFu6MxHJwv7ClmIW5mm/NoIUq64Of7L4/tD8gQC2wqB1pUO6uwlMF
	 snupIjtAIstElUGmEbE8XUsAyB1IdBcI4LZo9NN/sqv8s6xOzdyldD+3hgFLBcmFexQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Imn2WVeJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B9606A322
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4B9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Imn2WVeJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso33884905e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793034520; x=1793639320; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
        b=Imn2WVeJmrsTcniPIqa5MczKk/j0HQLC5R50ZsdY0tt/KPGgosIRsrOYx5CjSAKpCg
         sUBCaMHuKHtTEabCxW/nZHVbwkoUsi7CiUzDGWAppSDFZW/Rqi/35XGKmoO4C22uCRTs
         dNOmXiy12f46t/57YuL9TTcLH4h1BJnkQMeMp6zIdvLE2Vh3uwvwI2GxuU6YRQzem5TN
         Bxk/CojGBw8QhkB0nnalb+Fn8e3oifdszHpxNFWH7CoOgjH8lS1TQDpYKy8b2F4aypXO
         aRWt0jL6SoxN0Wn78lEPFZmBCaMtN11bbCphCxe0QfWvSKr3kuYrD6VvG5GifU/KGxvh
         0Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034520; x=1793639320;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
        b=is/UWQhMdBaaNXOrLliXe1B8uJSS0+t8qTnrjrUfGigO72Hv46FkRfSojPmsTab6at
         FWr0sFCDTOJ8zIhV48QyRmlD1AShApUHtDKrN3NLKg5WwpQN3x6V3laeo9tspzEQIM7m
         fMAgWkp+6Wr1jK14gBf9uhx4o3cx12qtymzZpKDEPy4DW/iVadEOYK7ncbWvPJ/uFpzL
         A4LljxZTz+Xq0+drJkvTrNZ5Q269mBhqZRxtPe49sRKEZNdEcRSmtEjYclWbklXC0+JO
         AErC1IQf039o+bJ3ms8Z2Jp96iWdsHKXydvaRqEaUW3Vq8vIHnwuiKQHqprtfj5hs221
         XeqQ==
X-Forwarded-Encrypted: i=1; AKwUvByzWn/S7q2S8gVFKSrbLRVTQcIQ0fW1sFCaJ5OKlkZjgRSYUd7it8jf4dWBPD2RLfXz3BOQWLcvwXBP@vger.kernel.org
X-Gm-Message-State: AFq9FYIMSGP8wVOFT/kNKtQz7E4lzS5P3vhNj/crhP9KMq/iNyWwZ8g8
	Ms1yVXt49A60YTJkFp2VAtngT1VcvsK4zoF2dSkuV4nbxPZxGbrleHcXKnKuNkFvIeA=
X-Gm-Gg: AYBFou3g6zX2hvfeglPqvLORm1xABPgxQvqCwatFQOKdIbh80nx7MrY88d8nv8EjREh
	6wKfS8IlzSNENtg0D64qFCPpCiuAbflcwg0D5baYox8RjY4MOXVZ4n6NkB4XLeCI5Qb775wsY5C
	eYidBqo/1RPFyG8mAyVDssP6bg+OWHlYnkGQq469iTrzMAjB1JKMxwdHjqfiNpVRexfcIbN85Fy
	Df+zXRj+VdiHTwwwXLO/yAMXN/VrqfIB6zdhyLLfyf/VWuoAzVkxlB6OYNrswohP4oAbiSW2dQa
	7cxGVJWm531lC//s+yGUumsldDdXx9ujBzlsqJcYpBlD7jkSopl6pd4TpkV1dSfQ1DiUDwCGBgW
	t0Snxl2ZiUkrEmjYsatinFpVe+2jtEpW+wSw3DWrEtnQr5KU1KxMcuyPmZusO1ZMd97E2pBlTb3
	40jjQ/WSfXbUdNkpMlvI0tAGIdeioV/IqTU6gNW1AqhLDwgkAYd8RjCTnT4YVRBdDYENsXir4ha
	kwHL8ghdVkO4TT4Ou7ggUncVeOkog6CIK69BajXyPJU+7zcmRGyX5fTrggAY8bUAQgajAz2GgMD
	jeWU7UWIBnWw7jxnQj8zAL14wOWQi5A3KUH/Q1EScCMXiG5Y
X-Received: by 2002:a05:600c:3f07:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4a35acb3e77mr124957225e9.27.1793034520264;
        Mon, 26 Oct 2026 10:08:40 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm17070976f8f.2.2026.10.26.10.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:08:39 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 18:08:38 +0100
Message-Id: <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: <ferreira@se-rg.io>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Georg Gottleuber"
 <ggo@tuxedocomputers.com>, "Ettore Chimenti" <ek5.chimenti@gmail.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>

Hi S=C3=A9rgio,

On Sun Oct 25, 2026 at 8:51 AM CET, S=C3=A9rgio Ferreira via B4 Relay wrote=
:
> From: S=C3=A9rgio Ferreira <ferreira@se-rg.io>
>
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
>
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
>
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
>
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
>
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
>
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
>
> Assisted-by: LLM
> Signed-off-by: S=C3=A9rgio Ferreira <ferreira@se-rg.io>
> ---

I tested this on a Medion SPRCHRGD 14 S1, but the controls are inverted.
When increasing the backlight lightness it actually decreases it, and
vice versa.

```
% cat /sys/class/backlight/backlight/max_brightness
4095

% echo 1 | sudo tee /sys/class/backlight/backlight/brightness
1 # BRIGHT

% echo 2000 | sudo tee /sys/class/backlight/backlight/brightness
2000 # LESS BRIGHT

% echo 4095 | sudo tee /sys/class/backlight/backlight/brightness
4095 # OFF

% echo 0 | sudo tee /sys/class/backlight/backlight/brightness
0 # OFF
```

Moreover, I see that from `/sys/kernel/debug/pwm` the period
request differs from the actual:

```
 pwm-3   (backlight           ): requested
    requested configuration:  enabled, 498418/500000 ns, normal polarity
    # with brightness set at 4090:
    actual configuration:     enabled, 425834/425834 ns, normal polarity
    # with brightness set at 2:
                                            0/425834 ns, normal polarity
```

This probably causes the top 250 values to be all at the same
brightness. Not a big deal probably.

Do you have the same behavior? Can you send the EDID of your panel?=20

Thanks,
Ettore

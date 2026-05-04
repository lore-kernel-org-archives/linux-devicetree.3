Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483E354ACE
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885487; cv=none; b=kgB8n/f3/p3Jcfs27vb+hMlK9leR8TC/iAvOV089nOUGLMHZid7it5wURefqeYSTiF8YyQabmnOR9QjHCrZjNjolACA7j53CaWaCwlXanjDEcDy/YbROxl8ln7BAbIn17YdszC7cGSuWYOEnEiByDs0KXCo5tENTzGBtREKk4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885487; c=relaxed/simple;
	bh=4b1Z9TVnKdKjkQ91UetoQAPM+PvtTG+uUazxkJyn0fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9fedPo+x7xxI2ntzm7c0GbHFyrqLZSSWGY3AjOStuoxLH+y7nSZ0szMADeONTQi4PwllY6oEfbbr94noIw4kpA5sbIPPYnXuc/1Vp2g1OkpgLJ1Dh0MdROsYd4qHXWRgq+2HUnoqo9VvE6VbnYoNsPno8stM+ve8gzai/XwwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ee9ec26edaso416047885a.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885484; x=1778490284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5mGt0mKWKt7BharKNX9fTxCtQWRZYlGFfS86SF9TeM=;
        b=hoOirmvhigD/EqUlDE11gj6mQBXqpJ7c+0pPf3rrbl6s9FGKjaPq3tcc65fS5tw7eV
         7dtf8uRJtXBxCQX70H9M2rNg7DY5tS+Uk5P8k926kiLvZRLHEe3vB7kNctMOKz6YwA93
         q1U4pTfQXXVUtL5K3YVhKpkKiSsCZLxNVNftnn+QxfZCBssk4l9C3MyvBwDPTPDRtFsl
         Z5+4GiUe6vC9+D2QmFuuSBkGf0bDBuOvtFQiza45NvtVStWf0leRVLqwyuah7zzlS/N8
         F+AnC9ZMMtdlu9qxwdP/3edH79vPS0iHZ+57dWXZ+zEjLD/+jwS8WbCca16lOLZzTuMS
         IZEA==
X-Forwarded-Encrypted: i=1; AFNElJ/P5ulXqltId7KP8ORD3VwoFWAE3haaLH2RuzHLmr/VRWMsVlKjqnTsgVbI2ccV1HU6sYED+6tabGLr@vger.kernel.org
X-Gm-Message-State: AOJu0YzjTuCsaMwRO3rNaVY4YQpY4FVMgReq0+ZB8hoQ+qax+2RJN8CT
	Rado6y4EHcKzNnO8F1MBYs7FpuE6mG2mpdQCYrO58XuARgGyZScBsvtg4brXZJ2V
X-Gm-Gg: AeBDieuYqerqgZUJIpwx8FOzn8Okz++xrMl9BCq2DPU2AiamBTCKb77xCHQPC2kHi0G
	z3Qt81QX6pdNNnh54/qtI0oT3mOsfr5U9MfejOtscUqhZiOyNIeYRxx+YKU7c0106AQBnt8g510
	d+lISC+E/PrdHqo18niFKv2e3hMU+K6jfb6mTFkQrLzu/SPT9rfipyLcfezp8n5DxH1cgPYgQU5
	LR7DbKnEWl7qVKQaNY6cD+r37g4RWmIXFlEtB7HcndFDDZHcPt2RqugpoR7cL5Z+917zTg6wS3d
	7QZQ8iDm1ecSki/12rZ96R2c9K1BP5aNaye3yuYTzKyCtrgro7tr6mZafzM8AC45Q29I8YfptbX
	QZ4Z5wCYykJZ9nYJJ6DRvHL5gIMQNiMq713vnDUlgDd05FC2kQYihvLbayncpExibnmBcwwiCF7
	HakaVh10KM1KtwMgeo/kP/3/ohKDz0foN2aFNkJCF8rejQNhPTWwi9cyH/PGZtfjwAhHi5ePg=
X-Received: by 2002:a05:620a:2903:b0:8ee:21b3:2ebe with SMTP id af79cd13be357-8fd17d4a7eamr1306507885a.36.1777885484141;
        Mon, 04 May 2026 02:04:44 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm1057332785a.36.2026.05.04.02.04.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:04:43 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso63962336d6.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:04:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pCrIp0DZXv/7PE+QGBo7dSI3D5qAd8kMCfhXL0p8ERWW60uwfP4vGsAPq1HQY0og5cJBuTEntE5fK@vger.kernel.org
X-Received: by 2002:a05:6102:50a5:b0:62f:3abe:907f with SMTP id
 ada2fe7eead31-62f3abe982fmr942838137.4.1777885021372; Mon, 04 May 2026
 01:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com> <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
In-Reply-To: <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 10:56:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_mDhAVTH4bUzbHQAAhp-TdApp223PB-3Rrer+gs_3+A@mail.gmail.com>
X-Gm-Features: AVHnY4IB14dciSQLYR6ve-hV1cawj2RAYgs2Laamwu_g76ZIh5HxQK0TWj__-U4
Message-ID: <CAMuHMdV_mDhAVTH4bUzbHQAAhp-TdApp223PB-3Rrer+gs_3+A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock output
To: Josua Mayer <josua@solid-run.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sat, 2 May 2026 at 18:07, Josua Mayer <josua@solid-run.com> wrote:
> Renesas RAA215300 can generate a 32kHz clock on MPIO2 pin.
>
> MPIO2 is a multi-function pin, with clkout being one of the functions
> and exclusively available on this pin.
>
> It supports prepare, unprepare and set rate (32k divide by powers of 2).
>
> Add clock-cells and clock-output-names properties so that other dt nodes
> can consume this clock.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
> +++ b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
> @@ -40,6 +40,12 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1

Please no more new clock-output-names.

> +
>    clocks:
>      description: |
>        The clocks are optional. The RTC is disabled, if no clocks are
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC4486E60
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396331; cv=pass; b=kDg4uzUv+bUUA/gT215rnAnOUiv0NqI3bqMzcN2mr1V6/sfiXAFjQ8tPrLJvKwNI4klAI9SrevP0HJjyVsz+CZnqZ+Ml24XP5wLG9LCeQKdNuBgXnKoiYbf+ZXl1Uc5ieID/um026H4YcsgQzRih0PTeXwuZuH+xmhpSQswRQ34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396331; c=relaxed/simple;
	bh=kNfL/Hla6UKgQQwI6Gv8t1MIM+Kmznse6S3d1b1fzrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeMAn25DJb8k0kmprV9EXWR1v2tSusu5bGtLwNL8MGnlX0JH1QtBGZhx0B6StML4sKGg+rx+PhRymioYXCPmGnADPL6dCiromATyiw11JxltAWDNWS2ZUzTiO8/c8mbTp+x8Sfifh1mN5olnKEoDYS9QAMtrK6l4tLlfBjY5ttE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slNSKdhz; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slNSKdhz"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1752713d50.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792396329; cv=none;
        d=google.com; s=arc-20260327;
        b=j+7S1tPRjOWkcq3ddpbiGZc50eVavaNSIYx7w3EGk+cRyrhzhJkqvfKJoGQvVEqO18
         +Rn5gf1Zx3Z0PtpSJQXFpdeayh5uLccB2xY50MOqVZD1YpPUanppSeBpM75C9cqD+f6K
         u+3K5MxWhNT8hgfgnt5GgqM9NTQDw2kaXBBKPkyiqjpnl6PlESm/ciYJZNTPYWAJvHFw
         TCgM5Xdymi1zSfOVFo1X7V6rV4+wz+dLJ+22NLVls935g/fs4VdXmSw+1vOlWCpc56Nn
         s3HPuTZpg4X2Ff+vk0E4r936BviIbZAcCOLeVjprrX66155YIBrbYy/2FuGz1UgdwU6j
         Fgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        fh=HR9AytL6KkqhkUMICLvAyJogNrqS5qbLDIVTXY77nCw=;
        b=f/kcIUDP2QWzZhEJtk3S9hb0w0H54HCBRlne+u6AI4jo0PV9nne0RdE3R4ld5UPrr0
         mBMgFULC9GWaPJ8GIGwbMtYsZFebtQ7GbSyv+SIl+tVpc7KkBdZ4z/V+EmTdPIudUaT1
         Q5kt9iJWxZ8PKdc3zSnucJgEAVB5hF2gWTdp6HAmA9/WAqetkHrtKY+J4StBcVmoikh/
         axFU0EupRNcAxcWnOa1ICEyFUvfsX8K1fN+d/Rkq//OE7uYSm4as1Mso2hFIKmlOipqI
         JWgnZRosUev60P9v+GOHMjw+EtQGGhNfBEGAd7AJckq15KBC+bV89Eag/iezoFDzMFyO
         CDBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396329; x=1793001129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        b=slNSKdhzQDufNI/CyemCuLFkbABnOforDaBTNQIcdaxAv+mxfH28l5VPAToHuJOMMk
         RpQ+aWioG4md3ZFfkeWgnCBx0TlHwrM/kVh1CfaTqXWDlDpQTHPdra4NflzVqS9YtnEw
         eM/N3W4Ci3CrGgQj9RltcSNe6UI5Zct7+a57xSNQdmE0vxqtjuSVWec2qncPFa1UCWXH
         K8Xr+DnZQyqpRpr0WBdboItoqpJLaiJbifWCB0iTPTtgyuqAKxXX6QjcZdpKA2tLlhPL
         B6KPw5idkZqLk/XooROxf1J4fuvvVsqFEk/aT3axrz70RosIljgrqdFQmbLHI3TE/KGg
         EOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396329; x=1793001129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        b=ZgyLYjLrvZT4tN9tkC6nfeK+hNdKrJkCxg+1Y4x8rAIqp82+ja8EwZwRdDapnyr7DR
         sKz4ny/LVLfn1IAQ7Hw2z0ABCO2ybieuOZzNj/0szztAPuJme3ew3Ic/njx5iPmNcoLK
         HrahByzp761KCZQndON+iiASk3Imli8SqO1VqSy+kl9O9FvU5CHqHGe7DaNmjEoVJbgB
         ZJHe7SP9kKWFOnlElkYU69POIk/W3bp4rHumALphPzWetsHT7Q4rvF5VJ2Q/Ufi9vw05
         hgIYfNOYNSmAEMC7ZAhOfDgoX7C6Nw+P3ZoqRHAxIUe+eEOPirQLRJrt1J9subioYTOn
         WRkA==
X-Forwarded-Encrypted: i=1; AKwUvBxjoXt3AZ0vkHDNCWOd7e8H7ss0J0WcdIxHL0P9FXAka1I6k+SbyL3unGxXxw6hjacDl2ktALPtNw9n@vger.kernel.org
X-Gm-Message-State: AFq9FYJzdytGBJncC1FR6qU2ubZoydD6MuNFn01aNZmlgv51fq/XO8Hz
	176fj+/hBtmikHNtfrsy3CBFWc4jqBsaRyHG1ah9vJemUh62BI5RIElzU6d6+Kgik1Uirkv7aPM
	Zopn9RgrkmodRdqYzubRGl0MAX4jR1Bw=
X-Gm-Gg: AYBFou2Voa3QZCGJupzxdrHr4mEt1pQb1BlYn9XACRYkIio+ynhuvQbiHp0LwEA4caR
	ym7SO3MdY/XHz5mv7LTpeaHqj/TM2sOfxO6tYEIprZfOxAMhCoL0/PLWbivOHiZg4wstYrvLrtU
	6HhyKZ+r5az8Qd4QYkFcCL/mj8lq7gGT4BgElfEGidS+Xgo4DPVELetaSiYeEW8kIuLeKq6gnLZ
	4hJ5xhvMNl9QOQHCFbGBwKO1Zh9OXV3FEgWKs2L+syjKFNvNv/stIByYgvanHQf2uqw0yZsbGah
	0ZvMskW6jdgDN7qN9Rmx3hyw/cJTVGiJ4niE9xJHe3Qu1C4Frrguy9WcMKrCsJZBDAu1V7lFX/c
	Xmr/qZfOLlKK5kyXGXsdM685WmjiUmCjxhmCzCCyhuSIge2UyTgslMM75giXkEACm2TRwwPnkbu
	uIbgpuYQ==
X-Received: by 2002:a05:690e:12c4:b0:677:cccf:445f with SMTP id
 956f58d0204a3-679ca7ca9e3mr2034762d50.46.1792396328411; Mon, 19 Oct 2026
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com> <20261016162912.64581-2-lukapanio@gmail.com>
 <20261019-yak-of-subtle-protection-8ed0da@quoll>
In-Reply-To: <20261019-yak-of-subtle-protection-8ed0da@quoll>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 09:51:57 +0200
X-Gm-Features: AclHuK_A1TQjZsCV3MVlGkJ8tdfOzXTmuHWmMEHG7bKSsC6HnztuOLMJSgs52SY
Message-ID: <CACi=Ov5C9xuFvaYTcPapc=DzCFqrKng-V53voFHGWptvvs8c1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99703 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Oct 19, 2026 at 9:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 16, 2026 at 06:29:11PM +0200, Luka Panio wrote:
> > +  awinic,iled-max-microamp:
> > +    description:
> > +      Full-scale current of each LED string, reached at the maximum
> > +      brightness code (and 100% PWM duty cycle if PWM dimming is used)=
.
> > +    minimum: 4800
> > +    maximum: 29600
> > +    multipleOf: 800
> > +    default: 20000
> > +
> > +  awinic,ramp-on-time-us:
> > +    description: Current sink ramp-up time when leaving standby.
> > +    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
> > +           256000, 512000, 1024000, 2048000, 4096000, 8192000, 1638400=
0]
> > +    default: 8000
> > +
> > +  awinic,ramp-off-time-us:
> > +    description: Current sink ramp-down time when entering standby.
> > +    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
> > +           256000, 512000, 1024000, 2048000, 4096000, 8192000, 1638400=
0]
> > +    default: 8000
> > +
> > +  awinic,pwm-trans-time-ms:
> > +    description:
> > +      Transition time between brightness levels set by the PWM input,
> > +      for a change over the full duty cycle range.
> > +    enum: [2, 4, 8, 16, 32, 64, 128, 256]
> > +    default: 2
>
> Feels like you are re-implementing triggers. Several properties actually
> feel duplicating standard LED ones.
>
Thanks for the review. Agreed, the ramp/transition timings and the
mapping mode are not really hardware descriptions. In v2
I'll drop them and leave the chip defaults, and switch to the standard
led-sources and led-max-microamp properties instead of
awinic,led-strings and awinic,iled-max-microamp.

> > +
> > +  awinic,i2c-trans-time-ms:
> > +    description:
> > +      Fixed transition time between brightness levels set over I2C,
> > +      independent of the size of the change. When absent the brightnes=
s
> > +      ramps with a fixed slope of 1 us per brightness code instead.
> > +    enum: [128, 192, 256, 320, 384, 448, 512, 576, 640, 768, 1024, 128=
0,
> > +           1536, 2560, 4096]
>
> Best regards,
> Krzysztof
>
Thanks,
Luka

Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749E3EEAF9
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902397; cv=none; b=DxLh8LwrsfHUPcVrRsqY2vQ6Rjqj+vvQ9v81hI0H9lf+32L6kRlckhYu7yy6H9vrCc2cxuDLlZn9IuFucqGWWplUY6yAjBv1CFmHF3872AwY09Td5BLQX++EKbz0xp4QksC+FY290rHb9ubES0YX/yDeLg2qL6gr0csyiEpXX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902397; c=relaxed/simple;
	bh=riq1Gkad55t9ps5gwc29K6tLrNUvJeC1Hr5UhZ+UF+Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1i6GS8pYQ4vGDK9dphtkkFni/l1g3F4oZFfxXV9UX4+FCw8+/B3TR5Pa1BjIerLH/MuEBIrrsIoooxZu8UqAV0q3MSQcOBBglQDilz1PokeVsdTZJIaHOUjlPe43qW1KbbBS5FE0Lg8OB1+AeyiyvopUeFeSsbDp4eHAHptQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WjCcwHEe; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WjCcwHEe"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47362928f65so497979f8f.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784902394; x=1785507194; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NopB2zcAoE2W1rfx+y/nPylIKkaB6dYctYVWOaoLAo8=;
        b=WjCcwHEe9WT8qgT6gG2EuOoyqQIo2K/r7Z9FNsx9pWeTki5GhaEEtrKRKkyFabqAsT
         EJxqqaemWjgTKnbEiHZAzJLF+RQcw8KqUKkhDQmZjD2TJ4K3Xxn/Hhg6T9YgK/ZN+gD9
         CqNSjwLTXqTWDXIzWVbkAxLAc3dF2j1llheV0jmbSMzqesecarhaPIPzV9kg2E9SkfJR
         pgTo42oIFpIfFWJfpm6Ww8ndZQCwDbSSCriqUnPHh4fZqm/EaDnngmoksyVKl8hHzo97
         kicdKOOorS1tVSm63a7WMqbqjhWUUFXmMth3YHY78dqosB+0An11O9PYfF80zuPX49OH
         Wn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784902394; x=1785507194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NopB2zcAoE2W1rfx+y/nPylIKkaB6dYctYVWOaoLAo8=;
        b=dY4hBJ4uW0d0n5nM46Fb3xx24kSGhjonUgFHxt15lPJWqDhA1zAFEEP76bkerL2EMi
         kR6RAofg9Oy6hSbh41Eq0cllSuCFDEuEa0/nTTp01XjmMxBoPaxqZj8QogslnSEZElp8
         HB1opcNpG8c78RdVVHD8S/1MX5Fy2HIs2LEEDNSMxSR6PWSWA6oq6WslrjSqhBXPLlqz
         0yov/XWA9w0kgJAa0dZmb5INd3PFxXO7xVFmk0AC2BRaQfI07kn/Tzveh7/4/P8pxhYo
         rlsv0/5AHcGizhy7cPHQl5IPwqCo64er2ySK8Vp3RZf406xA4+PdS3ED1LiwGPVNK4mG
         5WGw==
X-Forwarded-Encrypted: i=1; AHgh+RrpCpYEObWO/+pDBb4uG1/An+A7augZYOMnzKeBJrGlKhxEGuFZdg/D1KKitITOZqdtbABOc7koyfAq@vger.kernel.org
X-Gm-Message-State: AOJu0YwTs5EklIFVdyhSHaiCe2tykCXS5lbYG+EI43+tBtAQfGJGaOe+
	abYeQSt07rek6KjDi1ByJm4HlIkpAKgGAn+KDtddNv1XDTGHTIPm1WQ+HxhFmk3QTAs=
X-Gm-Gg: AR+sD13L3bx6Y0Ij6y6Jvs1yYWJI71gK4VSCxOO70q0Nn8fOYlkxKFU/5GdGOmZIeD7
	hs0YFnV3hATG3zCrO5vYPxftLp6SsLNpUy0XjMc2gZLyniCPOzeNnO/3p2+kFh70gMkXrQWTIeQ
	agRFml8zGph1+hsVLd1Or7jJgE/02AXj7ARsDEdtQKdJX/8vA6zt9CV7Kp9uvtwNVwRSL0OShPX
	RBVi5JNfpIaKZsUHtQtWVRTTmCPeUD+U6wujZb26auX/Z7AaNApcBg1FaIJUnBX2Cy7hhDAsUOr
	ILnRXllQaMbcyC2mwVNCQKAoqRO5OVsGcSWVsqDm1B7KSyDHy4ci69H5p0BdgsWyzHqKCrXl253
	YOuogR2QMaupN2iGrtsFwqTpIkYoWdRidnxSJG/NI7Xn68+ucjpKOpVWA+r8PdJlevH+Uy8ekVP
	8J
X-Received: by 2002:a5d:5d0f:0:b0:47d:eee2:e19f with SMTP id ffacd0b85a97d-47f8d756adbmr9271223f8f.33.1784902394468;
        Fri, 24 Jul 2026 07:13:14 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5a46sm23693173f8f.9.2026.07.24.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 07:13:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 24 Jul 2026 16:16:43 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Andrea della Porta <andrea.porta@suse.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, ukleinek@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Message-ID: <amNzy0jqWAvh-cBk@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <67d51a7210f0d7410dbe34e3d93813db1fecd622.1784539788.git.andrea.porta@suse.com>
 <20260720095027.B76CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720095027.B76CC1F000E9@smtp.kernel.org>

Hi,

On 09:50 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The binding description states the device acts as a syscon provider for shared registers, but the schema prohibits the use of the "syscon" compatible string.
> --
> 
> --- Patch [1]: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller ---
> commit 06ebdbe78362ab02ea5e88d503ad7c179855b48a
> Author: Naushir Patuck <naush@raspberrypi.com>
> 
> dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
> 
> This commit adds the devicetree binding documentation for the PWM controller
> found in the Raspberry Pi RP1 chipset.
> 
> > diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > @@ -0,0 +1,66 @@
> 
> [ ... ]
> 
> > +description: |
> > +  The PWM peripheral is a flexible waveform generator with a
> > +  variety of operational modes. It has the following features:
> > +   - four independent output channels
> > +   - 32-bit counter widths
> > +   - Seven output generation modes
> > +   - Optional per-channel output inversion
> > +   - Optional duty-cycle data FIFO with DMA support
> > +   - Optional sigma-delta noise shaping engine
> > +  Serves as a fan speed provider to other nodes for a PWM-connected
> > +  fan using shared registers (syscon).
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-pwm
> 
> [Severity: Medium]
> The description states this device acts as a syscon provider for shared
> registers, but the compatible property is restricted to a single string.
> 
> Will device tree validation fail if a user includes the "syscon" string 
> normally required for standard kernel syscon lookup APIs alongside the
> "raspberrypi,rp1-pwm" compatible string?

I deliberately chose not to include 'syscon' in the 'compatible' property
to retain the flexibility to constrain the regmap exported through syscon
in the future.
Including 'syscon' in the producer's compatible string causes the syscon
framework to register the entire 'reg' property range, whereas the driver
uses of_syscon_register_regmap(), which could restrict the regmap later on.

Additionally, the fact that a specific register is used as a tachometer
depends solely on the firmware; if this changes in the future, the syscon
requirement might go away. Therefore, we might not want 'syscon' in the
compatible string at all.

Thanks,
Andrea

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784539788.git.andrea.porta@suse.com?part=1

Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE95466B1A
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294641; cv=none; b=C6DkOyH50q7tC/vMGKE3Xf1N6o0KRo52B3ZT1B3B3Sl+iWjrKkFkAO3hPguAlibAG+0rmmjBV5Xu0KnLa1d44SO+8pfSEOwmtEgkg1uC4Y89oREJFnJAFipH/fleo+u1pO+krho2AY2NBqfFS2eCCSQqHLe7CjafQsym9NLS80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294641; c=relaxed/simple;
	bh=a0Yc/fKM1BF67FXa+IEWRBt49Eq2NQRUCcAIKJ/eEY8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw851lvB5uPCxbViI/OnpJRA9Zi4AdsoazFbYu+6aGVsuFK1MAGaQI1FtRbW3DKQZs/hATp2qgv4pGKlZzlGGvbAOe7jzhcSU0hYyuM/0h2fwDiVnhIPLIgO3XDRLtASqNjPeK7ss+3JPF5YkuyOfTIi+pWQ/sveYT7pUNdlbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MAnPURuo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MAnPURuo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so512331f8f.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791294638; x=1791899438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59tTbEd7XKwQNSi2VwG8oe01VNjOQRuofqVVGEih6F4=;
        b=MAnPURuoOQt1DewCyXq+x1MXp38KIMX5Bx/iKRQBeqLFIEQxjioD2Cj+MlofEwPFFx
         ytkrY1e/jiF/Qdcy9IWIz/2KNMt3A5CAcXFZTz6PnfwfSa9NAxWhcMMh3AV40QH4YhML
         0Jh/+4wSU/3M4ReV4FIcJqhdmKGBUvmP27qMMe7Ve6hbYVqi/jGp849MFszbFd/+79IK
         mkpoIbT6lUxxAXHriK4OXUsih9DgS7/sTeiBtTujr2jtMoa6evOBysCTsnUIe3ul/+qU
         p6XqQKQ7V+RsmbcdPr6DZ+yBftt88RvTjsvQ/EmafF4x3hh0gh/8yFPx+nHYtyL2hJf8
         n/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294638; x=1791899438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59tTbEd7XKwQNSi2VwG8oe01VNjOQRuofqVVGEih6F4=;
        b=cnXP42Ngc5ZLjnUtOfY7prm3HC1CZmP7RGJ2uSzUbO6PYyPdRK00FkUtdI31+p+1ck
         Hf4wZMJ0+quOiGVuSeuaLAL1FKcUsHUZ5uhrvHD+0m6Us/+2g4Pr4GbSltYSE3eG2hPd
         D9Y6YXI9yqYIEawoBe/8HFpj4ZUEbEsg1xe2c8BuErSNEfSxXvFIJmUp8h8gkyKGvY60
         psIxNpK8HC8Hb9u8MYk+vKRloPQbu6IuCIO10/sTuDXgHixbTqbZyx42p2xxMzzu4PMC
         /DvXqhr5yf5f3F3aHSUVFNsebEB+OvnvN6wykKwq5p3QVVhnkX3sG4q/MMBWKJBInwMp
         Ccig==
X-Forwarded-Encrypted: i=1; AKwUvBxaO1OXMAyZpf83VZSiJnP3woi3E63i5sXUI9huz4O4FQ3uJt2IEKE6znSdGUqFxbSltKpicvB6UR/B@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Yxt49k67098kk5o9nc3YjG2UCpKv/THO0se6lXz1ZqWSJgQq
	XDBzHWw+uL/+T/4STLMaIoba2jO4K1VKY9oJpksjOnDXrtx3goBD8IEuIRBA+Y4WH/I=
X-Gm-Gg: AYBFou0lMtpKtpjh63l7H622ZoK+jMqXV1FJqMME+TNtPV5gJ9tS7xCCDoclW/BaiKR
	afl7fnUqQ57sIMKhPOfdRyM2WXnMjk3nErHJluX1gtTGdAv7p8/BQH99bNvLSDEgnW3u70z6qF7
	SDoY2mgyhKXVNwS8qElz2V89PA1DgWmXJwE74pxGP98xCpOG/se6aMJbDarK8G4zUjyofWnZWss
	27DsdKAJhUUQRe4ffIP5A3Ge0RIBsLxU7TjeZnUZ/Y00fHYb9igM9YBWjB20Twojl1KFh0Hpeq/
	qP/tdipmfeytnRvi9pz4YboYGwu5hLeLPk6/8DJneaFw8jIDdWQsKvrelKUK34GtUV/PrQvUwN4
	bc75m5wW178L7vqjp9nsBb5FmnbgHXgAFsSjSwNUyGBvh8EasYYt1IhyNJsgXhXbtkSVt6MxJvI
	fkk+Z6KZAeU/GGo0cixJw6hFPEwS2R83j9/MZTSjyIPWChIYMNPU1Ac0vQIH/nx7zAOdph+Sj4n
	3HHPJTK
X-Received: by 2002:a05:6000:608:b0:48b:d17:139c with SMTP id ffacd0b85a97d-48c6d1aebfbmr2875717f8f.51.1791294637769;
        Tue, 06 Oct 2026 06:50:37 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c714220e6sm204373f8f.3.2026.10.06.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:50:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 6 Oct 2026 15:54:22 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v12 0/2] Add RP1 PWM controller support
Message-ID: <asT9ji8v8gw8XfcB@apocalypse>
References: <cover.1790686331.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790686331.git.andrea.porta@suse.com>

Hi Uwe,

since all of the patches have received at least one Reviewed/Tested-By
and Sashiko doesn't seem to complain anymore, could we go on with
this patchset?

Many thanks,
Andrea

On 15:02 Tue 29 Sep     , Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware 
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which will be exported by this driver via
> a function. A subsequent patch will add the function to read the
> speed to this driver and a new device and driver to read the RPM
> and export this value via hwmon.
>  
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea
> 
> 
> CHANGES in V12:
> 
> - added a comment to better explain why we don't need to save and
>   restore config registers upon suspend/resume, hopefully Sashiko
>   will stop complaining about that.
> - the RMW access to teh global control register is not synchronized
>   via spinlock.
> - patch 3 from previous release:
>   "arm64: dts: broadcom: rpi-5: Add RP1 PWM node"
>   has been dropped from this patchset since it's already applied
>   to Florian's devicetre-arm64/next branch.
> 
> Link to V11:
> https://lore.kernel.org/all/cover.1790606188.git.andrea.porta@suse.com/
> 
> 
> Naushir Patuck (2):
>   dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>   pwm: rp1: Add RP1 PWM controller driver
> 
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
>  drivers/pwm/Kconfig                           |   7 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-rp1.c                         | 428 ++++++++++++++++++
>  4 files changed, 502 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-rp1.c
> 
> -- 
> 2.35.3
> 

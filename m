Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B737C92C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227951; cv=none; b=lOBsqskV847PnX9Xj9GmeV6DOKv87ho0NSCjVqQg4xSBJQC6wlpb3g2hvX4ShDPZhpiQhktXz67EStdKRRAWAZxsl9C7dA/46hjBqrEjlYmZbIeo7NnO19SGHe13bAKy/IE9e5xf+IwO2ppgNA9zt69U90i0MT90U0fCzhWWIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227951; c=relaxed/simple;
	bh=WVoh3zrIDDVVwO6/Qpr7kFi5is8aeakhIkv9KUqg1ew=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=te1X3XQ1B33hwJae7s5LpHxinJH+VVmIwosorP8RzX1T7VaBWi/cyxkm9rEBLKbNFJwuVsg7SrWLsMNK+pLEfemLSRTG5AKOKcAOYQt8507sE8Gy948oLNF3esZ7vfcoNkltVmewJEnAX+GtOxtwxNOr4BvWJs6d52sKvn8ti8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IZwdxPBq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IZwdxPBq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso15670935e9.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778227948; x=1778832748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCCOIzOkC3aMYU18+NM+L3w+mXvUjU56+VWPG5affHY=;
        b=IZwdxPBq6DNiwz/7VXhsRRa7ptDQp/OhtWd8hlbTiIPzJBnzflTkV9WfwdHmVbL2/4
         eNMPLXDED/E+6BP2jB2WA8lUqNzdzMelTYWFwIUG0Xalp8OEB3aeMpwxQai8Uh3KcYyr
         xkXjtO9regZRISoDpl6LXlVLwNDJMFobkvClaU/Di5505goLTvB8eezQP1sRXvg2aYFu
         NvpJCm+HTGQPyRFAwL/acgZo5Ce+EKrtYhB4Dz0PL9hgfy+lR0XI5pd054ER8Zjd9QvW
         YJim5UJ3CgN/IjVOI8gLmwCkvUvtxUf/avTCo5/8XGSzf5ak8hyT2TL19OBiwFYNpNJl
         chXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778227948; x=1778832748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCCOIzOkC3aMYU18+NM+L3w+mXvUjU56+VWPG5affHY=;
        b=HGVcvNoWJRRvB6HG3RzGS7i/vTCyxsudICmGkGinBxUHMG9dP2oLag266XOY0xkdD8
         vlHYNyUKskKEmTfcxRETbsH8G7rJw57I8u/AHI/309bo2ndodxBQhtFEjT9UqkdPR9XP
         cAgSdX5ElRX0D4wkC5AZ/8I9aWexzgAzxtwnOpuz/T+1UR2RuFcdZruVSl6wOpkd7YCy
         Xa3XJVlxDU6tfgEkeeNcZP6sgX20WGe6QT2W1uxTNuAKLly4aKBd+1ZpipphMVndZH+p
         Y7CT0ZxbsS0/SMmaypnmWrKso3bDBENAn8LZPTgNUS6ejQ7W9hj8qWmx8gSvH5VKSiG5
         h2kw==
X-Forwarded-Encrypted: i=1; AFNElJ/ta2b5sSN3oBGBFbzZUzAzrjyIQKcCwT7hkK2dduBLo4e1az0z8AnnZxMBUOaGmfyD0MX3BdLohn24@vger.kernel.org
X-Gm-Message-State: AOJu0YyXxmXvRQi9i5TiwY4Ws3vxjQEbxd8cS5YMfbbRdGboWt7KOLMX
	VBbnvW8niCJBZB8EGr3FZ8nZ1cYdOkmN4MGwujbIhGBqaTMUmwC6FuRZElKaNXlv3IU=
X-Gm-Gg: AeBDievJkCFwaDJ6j8YPswK5unHOJcH8d0LqCHqweRg9iSoGlQn9jMpg6QIm6whh9n3
	pjGtf8UG/mMVCBiY6A08/CusYR5Fal+17Ih0W743DF1crfJiGf9S2N0YVJZ5+zQZjNIVgCir0Sr
	dFnCfd5GKG7WbNyg7dXDi8Pd6JxGfe40F+mMP2zNNI0JnlvNF6LZioU9Z32pz0Me93YCmEQGDOU
	Y42f1bvV80Fa4Lov+GRBa9DDnyAPl3HD5+o6JrtDiixUK/Pj3qITpGdJ9YxVESTZCtiVexsY1E3
	K2q2xPjcAPJdKmRU+P+r4Z7ohLTvZLcTZyrOh3mx/ABZd+lovu6jHhe33Q1jsWQF1nsAmR5ib/8
	a/JwXGTgyCaU4B8U2uM/kBKsq0PjL/XGuInMv9kJ+p9zhtIshTdUOl9Lrg5GUUKKkepTo2BwL23
	hAsbMbdsxIZd2octnmKEDS
X-Received: by 2002:a05:600d:849c:20b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-48e51f220e7mr136524945e9.12.1778227947995;
        Fri, 08 May 2026 01:12:27 -0700 (PDT)
Received: from localhost ([195.94.150.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68eaf237sm26988245e9.6.2026.05.08.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:12:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 8 May 2026 10:15:44 +0200
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
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
Message-ID: <af2bsEdAhYY9c4rb@apocalypse>
References: <cover.1776932336.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>

Hi Uwe,

On 10:30 Thu 23 Apr     , Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware 
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which is then exported by this driver via
> syscon registers. A subsequent patch will add a new device
> and driver to read the RPM and export this value via hwmon.
>  
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea
> 
> CHANGES in V3:
> 
> - Refactored all the register macros. They now have RP1_PWM_ prefix
>   and follow the register name.
> - Dropped the tab alignment in front of struct declarations (use a space
>   instead).
> - Added a check in tohw() to test (and bail out quickly) in case that
>   period_length_ns is zero.
> - Probing now returns an error if clk_rate > 1 GHz.
> - Added a check on minimum period ticks. Return 1 to signal round-up.
> - Fixed inverted polarity detection on edge cases.
> - Fixed rounding errors (in both tohwi() and fromhw()) in inverted
>   polarity calculations.
> - Dropped a redundant check on period >= duty.
> - Replaced memset by inline struct init.
> - Disabling a channel now is faster, skipping the duty/period/polarity
>   setup.
> - Fixed an error string (s/Fail/Failed)
> - Used %pe to signal error string instead of an integer.
> - Added several new sections to the Limitations paragraph to better
>   explain what will happen on edge cases.
> - Maximum period is now U32_MAX-1 to allow 100% duty cycle on all
>   selectable periods.
> - The hw period register now takes into account for the extra tick at
>   the end of the period (subtracted one to wfhw->period_ticks in tohw
>   and added 1 in fromhw).
> - Added .remove() callback to free resources even if the driver is
>   not unbindable/unloadable, to avoid accumulating tech debt.
> 
> 
> Naushir Patuck (2):
>   dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>   pwm: rp1: Add RP1 PWM controller driver
> 
> Stanimir Varbanov (1):
>   arm64: dts: broadcom: rpi-5: Add RP1 PWM node
> 
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
>  .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
>  arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
>  drivers/pwm/Kconfig                           |   9 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-rp1.c                         | 414 ++++++++++++++++++
>  6 files changed, 500 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-rp1.c
> 
> -- 
> 2.35.3
>

A gentle reminder about this patchset :)

Many thanks,
Andrea 

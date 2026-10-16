Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E492D7398
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118448; cv=none; b=FmeVtRrYZg7EnRyjYez2UcBTuZ7e8+ETLdNzpH/Q5Ddtd4Me4qz4dklcuYg//hRYvPhto+Qh/8PWIhSXhoOkUPFTIMeaS1np6y206+Y+8165v3HHJNWcF8a2sGbbHE2agKhBUrvurorBVahRVNKaWFw9ZYz90ONuCe7PvUwdJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118448; c=relaxed/simple;
	bh=gRW0CdjdsemactFwR3AGo+8wfuwlCISA/LqSdtKqkJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2PVSyShNDPrm5hIg7E3XAS71YiCiNPpZ0e4bxIwqhHjZjU3XvCvunlRzvyGACuvdDKl1ursgbdZXe616/cEE5aJfm+GVJ9NtL3z3uOQS6kRwc+b8EXzFEVP8yMYkA2y434I6uowg4eUlUbadFCGNlqknG1JPojYkLTppvu9KAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzVy0qPX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzVy0qPX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34269755ad.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118446; x=1792723246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXXcWB8W/TzI98uT3k5P5pneThN/kTNcoObGZm/mG3c=;
        b=IzVy0qPX8DVeU9Eb8hGI0aR5d1UJxcwftCz6FPsBTLyKn9eu36BiKne9qYss3jJnHc
         jTQTaabqmbDpLXCmq6HIrfUCENVFb35qpwHQUTcwaxdS/T0ylMD8q8CcFJGyoaNqWV6l
         HU50KwQnw5SGyd8QgRym2HYR3IHsTqIZSv26aXDPVSP/rq55w8yHjOCDvFk6YcFTEUFR
         uo2quhW7UbFsl6T9ooHpPMBKw0QJ0lvqK0aGbgt5t19IdUzL69hmGy74jKfNPXzulgIn
         DRZf8/oLmnlG7EtbbLB1iK8hRsEkgDhzq1B4jFYMBz/SpcF8ElBZ5AhU5UkiyBheKvf1
         kFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118446; x=1792723246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXXcWB8W/TzI98uT3k5P5pneThN/kTNcoObGZm/mG3c=;
        b=wcApokRhH0H1uqo1fFWJ8o/Tp7FtNoRrfPi21fHi3U/+PZ3lCGZNqNUB8J4Gju7b0k
         6fakvlAQ9HwH7UUIguBENqp/0QtLZSvxk0zhaWx3lNFPpsvAvTQqTytl0qABdS3Vld+0
         H6F30dBIS/Ix/EX4DD3tXie1aJcWo12HzFTWCc7XnYFokJYhw1xcKckzte2Am6PcWvQP
         UnVBcrzueK9woS02jt/fHPcOSaNeB+f8WUr3IhyfN+kMD5XAWEmIiuojGAIl2wlc+Zu9
         yCIlYBf0ANUFewJIrdRhLArDn0CC8ZPW+BoGyZ9o5Foz5f5Tyiu3Td45odSooL3E0W3G
         VaFg==
X-Forwarded-Encrypted: i=1; AKwUvBy6/fUBvvmfnkBK3scYIs5vyIZi/6YUubWt9bKMLwWyvcQESU4AvdVsNGNlNLmBtwP5x5isyNi5IQG3@vger.kernel.org
X-Gm-Message-State: AFq9FYJwgSe5ju3P4VPukkKL4LSFCsliLgJt8eOGDFgugubp8JtyRw8A
	jcDBpMkK1swyHXmC7zTtOS21mYbtY+b+8F9nMPs7rPF8f1EaOzbDkejY
X-Gm-Gg: AYBFou0zba3MfeoQa4NO0x7DoI4LtwhdzeM8VfHSo5VPNja2cYCYMLOkuLoaibtx/S8
	wwc5zmKmpCtbpvKhLHtwCiAoi6wfThL72iULDHUGWJz362pAgYakGrCDK5fAmyVYKTMJetTbIdL
	O2R4OrcwMdwRpr6O7xWHpb12lgOd41Tmpc17tiUstDl4k/bMWaV3f1sc/7GsjF5CT1XtTNo4Uay
	zD5EppWtORwViTNvcTIuQ4TEUJy3SdWGJR3dWUTSH4lJk9+5qnw0XMUi36ConDKPYSTJJ+9DlqC
	LkqhNZwsfbAkbTQXSlN0o8av0/vWbiUboIywiIyDkZK0B5Fh6ZTQQw7slU4sJ0O9W+L9eAjeOsC
	Ko3ZlagpqaNyWcs/yaEksG80cE6HTuamGCNFqGgmfzm3nrO2JhXF23eeALS8oK9+PJoXg1Gy5iT
	rxv0N6Hd0RX+vSELiZIp5PvqU/kflB/m5x/Qan7YNNDfFk8dBhqHfOOwHegKck9ekrjkHd832cG
	FnbhaQYcSbVygL608Qyon3AwGVXm1cXGDbHuh0QpILHtg==
X-Received: by 2002:a17:902:fd8c:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2e948deee77mr57925175ad.7.1792118445794;
        Thu, 15 Oct 2026 19:40:45 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804d2dsm3246715ad.17.2026.10.15.19.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 19:40:43 -0700 (PDT)
Message-ID: <17bf5ca0-c071-4ba8-b168-3ffbdae629ad@gmail.com>
Date: Fri, 16 Oct 2026 10:40:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] i2c: ma35d1: Add support for MA35D1 I2C
 controller
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261016010448.324856-1-zychennvt@gmail.com>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20261016010448.324856-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

Sorry, the cover letter subject contains a typo: it should be [PATCH v12 0/3], not [PATCH v11 0/3].

The cover letter content and all three patches are from v12.

Sorry for the confusion.

Best regards,
Zi-Yu

Zi-Yu Chen 於 2026/10/16 上午 09:04 寫道:
> This series adds support for the I2C controller found in the Nuvoton
> MA35D1 SoC. The driver supports controller and optional target mode
> and runtime power management.
> 
> The implementation has been tested on the Nuvoton MA35D1 SOM board.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
> Changes in v12:
> 	- Synchronize IRQs while initializing transfer state and issuing START.
> 	- Clear wake-up control if enabling IRQ wake fails.
> 	v11: https://lore.kernel.org/all/20261001075101.489660-1-zychennvt@gmail.com/
> 
> Changes in v11:
> 	According to Andi's comments:
> 	- Prefix the remaining timeout macros with `MA35_`.
> 	- Handle errors returned by `i2c_slave_event()` by sending NACK when the
> 		target driver rejects a request.
> 	- Use `dev_err_probe()` consistently in probe error paths.
> 	v10: https://lore.kernel.org/r/20260921083753.1109826-1-zychennvt@gmail.com/
> 
> Changes in v10:
> 	- Handle enable_irq_wake() return value in suspend.
> 	- Correct clock divider mask and maximum limit to 10-bit.
> 	v9: https://lore.kernel.org/r/20260807060400.2047517-1-zychennvt@gmail.com/
> 
> Changes in v9:
> 	- Centralize SI handling in the interrupt handler.
> 	- Fix target mode comments.
> 	- Initialize the target transmit byte.
> 	- Add reset_control_deassert() during probe.
> 	v8: https://lore.kernel.org/r/20260804084806.1846570-1-zychennvt@gmail.com/
> 
> Changes in v8:
> 	- Remove rpm_put avoid duplicate processing.
> 	- Add synchronize_irq wait for interrupt to finish before i2c->target = NULL.
> 	- Add ma35d1_i2c_restore_idle() to handle bus errors or spurious interrupts.
> 	- Change return types of TRX helper functions to irqreturn_t, returning
> 		IRQ_NONE for unhandled status codes.
> 	v7: https://lore.kernel.org/r/20260727081859.1737223-1-zychennvt@gmail.com/
> 
> Changes in v7:
> 	- Disable IRQ before clearing i2c->msg.
> 	- Support	CONFIG_PM=n, and simplify runtime PM setup accordingly.
> 	- Remove redundant register access in runtime suspend/resume callbacks.
> 	- Defer clearing i2c->target until after pm_runtime_put_sync() in ma35d1_unreg_target().
> 	- Enable interrupts alongside I2C enable in ma35d1_i2c_reset().
>   v6: https://lore.kernel.org/r/20260720030616.1067660-1-zychennvt@gmail.com/
> 
> Changes in v6:
>   - Patch 2 (driver):
> 		- Removed dynamic IRQ toggling helpers for simpler interrupt management.
> 		Based on Sashiko AI Feedback:
> 		- Added zero-length read quirk.
> 		- Set i2c->msg to NULL on timeout to avoid use-after-free.
> 		- Cleared hardware registers on target unregistration to release the bus.
> 		- Protected suspend-path register writes with a spinlock.
> 		- Validated clock-frequency to prevent division-by-zero.
> 		- Removed incorrect I2C_M_IGNORE_NAK handling.
> 		- Corrected a comment typo in the receive data path.		
>   - Patch 3 (dts):
>     - use a generic functional name audio-codec@1a
>   v5: https://lore.kernel.org/r/20260630012106.3616821-1-zychennvt@gmail.com/
> 
> Changes in v5:
>   - Patch 2 (driver):
>     - Add spinlock protection for MA35_CTL0 register access.
>     - Add NULL pointer check for i2c->msg in the ISR.
>     - Use devres-managed cleanup (devm_add_action_or_reset) for runtime PM.
>     - Use pm_runtime_force_suspend/resume() for Controller mode 
>       system sleep.
>     - Control I2CEN bit enabling/disabling via runtime PM.
>     - Refactor arbitration lost handling in state machines.
>     - Remove unsupported I2C_FUNC_PROTOCOL_MANGLING flag.
>     - Clean up readl_poll_timeout() parameters, retry loop, and
>       unused macros.
>   v4: https://lore.kernel.org/r/20260610030208.2020275-1-zychennvt@gmail.com/
> 
> Changes in v4:
>   - Patch 1 (dt-bindings):
>     - Update example interrupt number.
>   - Patch 2 (driver):
>     - Remove redundant spinlocks and fix 'irq' type to signed.
>     - Fix target address recovery in ma35d1_i2c_reset().
>     - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
>     - Fix timeout UAF via explicit IRQ disabling during recovery.
>     - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
>     - Limit suspend/resume wakeup logic to target mode only.
>   - Patch 3 (dts):
>     - Add missing i2c0 node to dtsi.
>     - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
>     - Add nau8822 audio codec node under i2c2 on the SoM board.
>     - Drop redundant i2c0 alias and clean up dtsi property ordering.
>   v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/
> 
> Changes in v3:
>   - Fix minor DTS formatting issues (whitespace, missing newline)  
>   v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com
> 
> Changes in v2:
>   - Overall:
>     - Rebase on linux-i2c/i2c-next
>     - Switched terminology from "master/slave" to "controller/target".  
>   - Patch 1 (dt-bindings):
>     - Simplified description and fixed 'reg' size in example.
>   - Patch 2 (driver):
>     - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
>     - Optimized power management by moving clock control to runtime PM.
>     - Simplified code by removing redundant .remove(), .owner, and inlines.
>     - Added dev_err_probe() and default bus frequency handling.
>   - Patch 3 (dts):
>     - Moved i2c aliases to board dts and reordered nodes alphabetically.
>   v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com
> 
> Zi-Yu Chen (3):
>   dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
>   i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
>   arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
> 
>  .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
>  drivers/i2c/busses/Kconfig                    |  13 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-ma35d1.c               | 800 ++++++++++++++++++
>  6 files changed, 969 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
>  create mode 100644 drivers/i2c/busses/i2c-ma35d1.c
> 


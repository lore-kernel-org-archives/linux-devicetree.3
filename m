Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181A48425F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787311; cv=pass; b=lnSnvdOJSP7bodKDARecfhKmDr+NyUFqBDuKOyb7dxrXid/OUyAHwWmQz2f2ohB5fvGIGvCi1s8vyhuN5jiM9HWKpkkuDeMtPrAN5V5wPs03pItK609JsEb5GubWn1yZztOY5SpOF0Rocoduy36WMetEWSe6HnNyDqzAHHi7Mv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787311; c=relaxed/simple;
	bh=CHUkEQtNUff9f43STraSTOkBZzhBtKghb6R0F9+EaY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nN/Wh31dY3sHo3GzIaU5qzIGaVCWaT31bgf2Lsdk1l68/VFTWTebgHyOLZkhQgvENnD9AKMSK6I+MOTcGsST4zymMDtxpIdq6IyDUGfEycKa0wavRvECrDKiahqx4bhHUrcmG2bf6f+q/wyk5Uw1etpiw4iwBU39eslzTdakwkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jtbUGUUa; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jtbUGUUa"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43b7e186a0cso1768878fac.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787305; cv=none;
        d=google.com; s=arc-20260327;
        b=GO5UNqTlCgh3UWcTEICe66GWBoZa/KX9aaqnKgCr/FVf0YQ1/aoL/XHZUVtZDz424o
         udSkTY+tBz7siF7foq2KiCVK+PAtTrHO3HLnF6ivO3a3BzI4Z5qo+ZRRNsK4+wqgGN4A
         hfHiXl0xtE8rbT8a18Ao1vRDUAVqfnH5CUDqy/0fdst6GI17XtmaMwOz/4fnmdH3JCTK
         orFDyj9X5Q6nlnacaghu1s5cx//GIoDv+DWt6VJj5lY8xrV92CwjjCYrFxnaMhyzaSNQ
         foC84RQeMm0+4O/0dvhvxaRJQBLfNlaWzg7WIK2GmgyvdHb7NF+E+aFqcU16jvxRT6n0
         Lilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        fh=Yy9Q2R/EBlgR6GynXUcw5Hv+l7PYrHuaSEw0lTzul5M=;
        b=PzUq3+/AHFS/8gdzTbnUcjHZFwaJznm3UrtXo2TXY89DswDKSCwaZs6R8e0rD/eMqs
         /emiqzPFKEAx8bFGJOLXjevXdWMmwr/fbysFEaIueWHgMj7YNByh2s+Mz9vJq7fkWI0x
         YvoH2Lz/asSCY4V+6HfJ0W/hry01pP6Bp9oJ2KPGTsFu1JHk2J6OQyppPRHkjpETYsnN
         5F9vpf7xjRT00APTXTxmmAgg8Iff8JWXlgf9HbRRKeaWDaUrdp6JroCKKxn80txk1N+O
         EfuyWfBV95zfat/CY+6SCu52RPvGIfyLZZLKkA3Ry0IHY8/4zsBgoJiMPWk43mN30WzH
         HeHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788787305; x=1789392105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        b=jtbUGUUaZC5ow/po8qHVo8OL2XYXgT6i1+9BYK5eIdamcKvb+ugHpEXjo0KskF00T0
         g3VqNMpVs7sWAImV6+vQ+F2UfXUP52Z4wGBYdSOEujiNKDuZVXnfKzn9ytl6xOG3w7PE
         O9BHdnZCePbA0FQxgAVuIEHNGlEFtesyAAv7V2Ng1KYAUeq9MLUiWxIN8g+JOst6ffWZ
         jbh4ryFBiFGfILc4B6OThu3sIHv+mn/nWNb0PrLrxD5VfPNIq1j08kJMpItIIn83AJ4C
         TwPE83pX6eXr2WMs6h5nW3d8yID8qQsaqnq7+OwCcRyvRRLbLEyVVFmKTNXrSMJDCfQQ
         Oj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787305; x=1789392105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        b=LfOWyZ/TXbtWk08WGR71UY3DIzWcu8xJA+y+GW7wd0POPi5BEKWhvBSAz9DctjSJBI
         yX+uYX3w24q6f1z0u9WDymw5RyaO2WiQdJZTgDf/W7tuAFkZfnYx+CbLtyQVT/JleTh2
         aIisNcadxmv0OLJAocht9hrAAP9vJaJ/jg584sweNhZlMHOZKwzVWQ1slVORl+2Y/ZXT
         XOtHC1dbj1UGxu7OujIPz8SBmqi1rh5VcJve6VhRqNFYayz4EBLB30r2Fq/1tq8qQ6Kt
         +CVX5MUR5mZerEnnl7hDvzKuo2QNtB4dePi0zfLK2TQUcb9ZQ2WsD0Vg+niLV/Qy4xKl
         aGpA==
X-Forwarded-Encrypted: i=1; AKwUvBxbQTouP88scenEMcwkLZXdZ8BG8fdMCTUim3HGWiFGiF89mnO52wiHWh0wgF97u6qRkrlTJ8UuOuhf@vger.kernel.org
X-Gm-Message-State: AFuF++mORATY5KEtqK8jU5i2XCQj058Asv53+PiIS43XQjmydezgEOUA
	HDWL4thu5Ev4THrfv+ShNjxZ27t+ScMtp0YHYeYc08b0ExKYx2Wa/V+NDv1ujEevJsZU1b/ipBL
	JM/IiwLxx2VIbtfhCiTIAsMEqmcPIU43KLiSTUJU4GA==
X-Gm-Gg: AYBFou39P4vKDO6tC0xoEy0XasPiSwkUE9B1mvPBvNd7yQd7nwUnyPCObZZOI2Tbu9v
	x371vLoQ8OcvosEyfa/a3ZTmruX3PoB659uK/nDn9NLiUtHGRUsclnRyiyc+KWcdkM/+2Sjl0On
	r2UuJk5PMmCBSesl/l6sSo1nP50TbFjlSGhN23q5A9VWKwWqMWMpOzN2a43emEXGJ8GbN29JIDw
	iWZD1k6sJxNgeZU/hDNjwXu8YmgMcxaGeVdM8osN0/y3KpLI7t+rx9iOYSlXyMMnFrgANS+wH14
	6EBVxzf4IgIth5fMOuBmxD4Zs/Ql7s63LYpgzTr8/Xj9rS4R1PCX8MCpvdIo+pdEv566gHEiawn
	oFJLUTjQoaoI1kSvNL7Q3ft7+165Txgd8HbW3nG/imthBlID3JTUjLQZt/iHP
X-Received: by 2002:a05:687c:408e:b0:475:a112:1272 with SMTP id
 586e51a60fabf-475a1124b00mr10850018fac.31.1788787305186; Mon, 07 Sep 2026
 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com> <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
In-Reply-To: <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Sep 2026 14:21:29 +0100
X-Gm-Features: AcwNN1Vp8fXipQwCEjEj0y3FUJRvMgZ_G3DM3P8aQK-4PYEHw2tOLnsqDspjVww
Message-ID: <CAPY8ntCwUjFQcobRYbgo1G-nuO1Sug3i8Krjau1AnD4Nszvc+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shashank and Marek

On Mon, 7 Sept 2026 at 07:12, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 9/7/26 7:46 AM, Shashank Maurya wrote:
> > The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
> > rail to be enabled before any I2C register access is attempted. Use
> > devm_regulator_get() to obtain the vcc supply and enable it at the
> > start of probe.
> Which power rail is this ?

It'll be the 3.3V rail on the FFC which is used for the MCU, touch
controller, and LCD controller.
The separate 5V supply on the V2 panels is only used for the backlight.

  Dave

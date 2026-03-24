Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F543FE660
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363424; cv=pass; b=YLdgpY6vU4CVW6JBKz+rXdpuELbFosFlR8gPlCVsvv2VFOOAOhyvKoOdgN0SE8gMMa4geUgSOZ03V46MgBatHy0HtRa8Uy8gAoOmMKtbsOvrUurqUbzf+Nr429u57yVmDVK/CpRMS2/NwW4lP1L7g4HjyjwcIs5C/sHirndvZ7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363424; c=relaxed/simple;
	bh=cKuAMo+90hQl6jVZ4oV/u2GEU9U3JPEK51CdpHE/uPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLrSMy/jVeYAKvBGZKEHSINS3KTYLKUIspZhxbiORcGE7QljG9kPaNADa1xtMuQdGZ8yDr8IuqkUavGFDOkYsA41z3w/pEO5TdpZ4Egk8TcphR5mUHNHKQ2VQRxPi1bV8pY4jB9/hVvT0lAa12WY0wc/IGSAQXIhX1+0yVmujjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t95Hkx8Y; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t95Hkx8Y"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso4165533e87.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 07:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774363420; cv=none;
        d=google.com; s=arc-20240605;
        b=jl5yqPpE6PuBxJc1WRa93ov/nesqd82qjFpwdE9JDG4tjxh5L/yOgVVNrlT245b0dj
         FU9Uj5uyGejQB06UM1eDc9WaxbOnezMAd187OH4WPJbLz9P9F7j4DrS4NVqRT6RGc/oY
         pn0hXCtXdGgaeksRQb6dFZ2Ok1LWZmVyVRSmZp6S7p/0vfviwZkwwaDiY2KlBPggIHJ6
         fPGxKZVwDqYh2XXlGpm0Bpvxjz2aAzSIGwNoG6UI390uW/yxdXEv3WD2hgRh6e77DOAJ
         5ew8PmFSTiOLUO1uFADpI+g4NgBy/ApnkWW+K7GIpSHkNb8OHjxovwZ5jNj3fuoh4gdu
         zLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        fh=clOYeiXCS1OCuj3ROps27p4aLeYn97B2xjzDFdrJnsE=;
        b=ESvpzHiwh5eCSlgDugFusplH3irt7xC9rVG4dtL47MQLfZhcrF0Rvfw4LYi8gYqthI
         txfp8Fl3rvXTLCyFa+MeQgJf/JNjVCEgAGQkrN7sTPLN3Ka9n3MKHQ9sHnfBk9TPaUD7
         aXA2vjeggCHaUTphfTPIovka1rgEZXO126E+kMsTyXzxu33y+Pn6z3eNfunJEzjEHcPp
         FtqRe4aXmLMOE/DMXu6PxW8J/CO7PCnX7K8XTiS4Ljubn5GcHWvU6/fhjt6vLluKrF6n
         iHWRmHA2YY4fr4dVpW/1pRlnJoHHJGqFWqL3Dw2ahjBST4fitAuEYYJp+ApesRY04HtS
         F2Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774363420; x=1774968220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        b=t95Hkx8Yrmuw0mezkBkzYWnnBNzXUjHURTDarkHpFj4CfdX1LCzcES4v3uzrOklemb
         s5pksjQGY5M2Xm3Mx6edkSL4HJkZj6h/E7x+pYvGNDLKRgIUYVVwL5om28rX7DgmcV/u
         6yaWOQOUwEctnXiOc9CcOLEZJIId+MmakyhnbCWIvPFmS6qezbzbNzEu3rq4aL5xV8Lu
         gTuX80JVt792CmqW2G/62YeFNWNIgZUbMSBIytIKcihuxmqU0nEQjTct6CM7WqJ2btiv
         MufKbxiFJUYCEXEcaCcKJFritL+HWJZWbLI2rDGoRqly/vuLOwRiLqKwKlWnUpKOal9P
         dQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363420; x=1774968220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        b=koRnln5BW57gxLeaMoENDlCJxejiQRTKeUcNl8WN68zAhAjIXxVuByUyC0ZGVRLf7S
         B16PgsAQTYDMokhAYO//o5SZcaf8F8Lres1aWKQ+s9JzBpgqp3jb3K6DH3dJZXbDAilQ
         QNr3VbllNoCzHEaKf26N2x4b9+PnOzPf2lgcShMYflVugMzyGA1xwU3BpmurtZD5vq5i
         kebQVW8l6PBgiJG0KN4nUBObueITrYA59f7lJfuIS/8Fta2ScGb5EVhcCWu1Uon5+IsA
         JlaqIaezKzg25yZli/2DH6FRdK49MABxLEyT6cgvwlN20k/NWgVMicgogx/1S0Gesv2x
         1MuA==
X-Forwarded-Encrypted: i=1; AJvYcCUHSmH13hTbF2EX8KmGwmDj9prXhfqWffJF05L2d9cqaUg5p31N7V6zOdagkGvFFcjfPoeNls/z/KMv@vger.kernel.org
X-Gm-Message-State: AOJu0YzOwXdHui62YVFMvwchKQWYVMk1+ElrDJe0KMiYpAmkF8EeDa2B
	Vvl6CPq8XUNJVLDTws/KBp7vW26wx7JzRvLbguwXzFbVvggXmL1Zh3/4xHKe6Ig2/eFdmebau2K
	CFhS7p7+j4kMhwW85ObsED9C6EaKBjEAZSO5vwY/EkA==
X-Gm-Gg: ATEYQzx6t+hxIhL9hMTcavcEwKMPXXKzZmPXTWdavCCn2YjEC3k/JeP7yHCZU8faTUg
	7EMZchCfBW102zwuV5TqPUmCV2KQgS7Ii2Xp3NXMSm2Xj6aa07LbQsAVLGbURzGuvvQJFI2zKW9
	3Y0L7e+/5i1leIEIO3TXdvVAHnseJy5P2eErzQBpEhrloguEjKL5tdGocHKxTmDgV16Y1oq+kX6
	Uz4mFPm7cl2vzk0GyZYdrWmGTTpuE5BcM9gzeMVKO7rAIAPxtQ0oHsYicjAhpK1ZKafUoy+sRzD
	S6kJbLl+dNSnxkBwHYQ=
X-Received: by 2002:a05:6512:3d19:b0:5a1:ea0:afa8 with SMTP id
 2adb3069b0e04-5a285b5dbf3mr5614955e87.40.1774363419882; Tue, 24 Mar 2026
 07:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com> <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 15:43:03 +0100
X-Gm-Features: AQROBzCfUpt1ZwyBkuHwcMICLYcYLjpRhE9JmTUslsPEwhDJl3mjCswU4lxnLwg
Message-ID: <CAPDyKFqirdKWZmxO15B6MvH75zsQgiwM-6Ux0PiCuxZsfNBUfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Mar 2026 at 11:19, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> Add voltage switching infrastructure for UHS-I modes by integrating both
> regulator framework (for supply voltage control) and pinctrl state
> switching (for pin drive strength optimization).
>
> - Add regulator supply parsing and voltage switching callback
> - Add optional pinctrl state switching between "default" (3.3V) and
>   "state_uhs" (1.8V) configurations
> - Enable coordinated voltage and pin configuration changes for UHS modes
>
> This provides complete voltage switching support while maintaining
> backward compatibility when pinctrl states are not defined.

Adding pinctrl support like this should require an update to the DT binding.

Please fold in a patch that precedes the $subject patch and ensure the
DT maintainers are cced on it.

>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>

Kind regards
Uffe

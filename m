Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA945BD4B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183827; cv=none; b=Alcm2IN4yP2oPA8vjMWEzgEn/l2oiQi85JW2+71NWGE7FKRaEk61guiI7Xu9SYLCQhPe+L6exr+gQxdlPyDwCVjucUwvsB4Vf73QhE2Q6Z77ZY0MkfomdQMdoBo1Quk0ab8IrQzYZmYm7Gx+hVD+Y5kIzJL7p5lUKSnL2IiSzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183827; c=relaxed/simple;
	bh=VV0WQeCgbPqBTi7yab+uEYQeq6u9LFtTUX4clbsM2Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuwJb+pSMU2hTto9CY9MjpRi3TR6toyDfdUUu1tx85jKKYZ2VGYd+HQEceSMPb/egBB3IWK7UKwujtZUZP4ewXHRig8cqDlSSTcslkbgJpZQNAxBbft/CWIi6u5gdwAGzVzszC2aPgmPXnFVYMTpEEwwokxrutg8lSrC1JGU388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-63a3977145fso902257137.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183825; x=1779788625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+2SZGl9spcuw3ZVraVsNeWL62/l5e6HnqNdDh6fCso=;
        b=dvDaHyTEjY2xurgxuvFVVutzPMNWM93EQh16ODBfTmyGf7IMAtem9DZvnMItnKTmGH
         kNE9xiAYVEY6ykX5O4WjvD1c0oJDeuSw73Bt0xSgrT825JTNV4r2ia5CrRfdb9V5alCz
         e8WUS83oGmGIspCpwoUrBio9ZYqzICpLqf1+vJ4uaJWGu6i4xTrRRRAz5PunTwerWmXo
         V2wzFBfHNaQMZBH2ZCMac7k0wzI1LFDN4fP2GcN1HJd26CZpGmS/Pnbe7usDTpESQ3r8
         P/XFKQLnchbVn8BVHOfmemI3Mqbzqtv8DdMzn2DkMkoVCCIJsiDx1hjTlxFfywUlOLnk
         53+A==
X-Forwarded-Encrypted: i=1; AFNElJ8+A3bJr/pNOSjeedgK1TfK6tTRwXnC2ztwa4P2ztNQyZMZVK4zkH3iSC29Zax9c0es3uMT4mpasBNL@vger.kernel.org
X-Gm-Message-State: AOJu0YwesCPrrY7USEwzRdAe8HJvRfuokXy+myJnRZj46UwDl0QN2X5w
	2+C8V1btl/Gd6RFUgKr0WxET31vJFCu11z1xhym/BxyfWmnJSELUTjzwQ4QEiyzZ
X-Gm-Gg: Acq92OEeCQDt9Kq32cEKtRH0R/sngy+jcSNfPfXn4FoCa5x9X6uY8nWN2aQnB8F4SPB
	7P9Ti15ZW2WFkPiCd18GReM1BN/gHPIw3hRNDOIoxhzLSfmPeZyHSKG8MjabgfA8dXEcnehxjnJ
	HP9CaGzeX9Czdof2Sj5y7NyQk7lPVMcjAEr4k5ZBfaIPw1RGsIszM7ODK4Pctl/6Ab+3xtVw8VE
	aKEB3L8ahC7wC73CaB+qnl572K+StSF2ivyS3tWtPaOME4QJ8w7m6dPY7VZo1ID+80zEkP4mLn0
	pa2orGV2DSPUBKvk18KNqdGcEiJ3e/CHw9gRwW03yRmQRsBSPQqjr/+qgHVMNf7pA97EYp7KfQr
	wrC89CCvi0bBn6k1qTXbpsjaRCPz7Lff3N2XvMuLyZYgliR5D3yYPaOwx0ItdDzFWkKycHcue2q
	V4oLGFZY5DxnjYKgJlN2bpVf9mIKs0SJ9Iq9C3QxP4C5RTHSF4P4dHfc5PY+oUo0mPMKHvs+TUt
	DE=
X-Received: by 2002:a67:e715:0:b0:631:8665:350f with SMTP id ada2fe7eead31-63a3df5d046mr8141835137.13.1779183825510;
        Tue, 19 May 2026 02:43:45 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ce6ce2edbsm6180961137.8.2026.05.19.02.43.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:43:43 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-577500ac0e4so881142e0c.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8I2Zhe+K1tWdh3YSvQYV4mgMK/jEyoYDHCAVMyiqbk46iBmVMNQHxUG3vVJCm0kOwmFGpVwGF/KxmF@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:634:d42d:15e2 with SMTP id
 ada2fe7eead31-63a403ac9a2mr7077474137.26.1779183821499; Tue, 19 May 2026
 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com> <20260519094820.1f05ab8e@pumpkin>
In-Reply-To: <20260519094820.1f05ab8e@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lfn8Mcrjf-CZtgFTL8ilhwbGlXFwz-O3Z8xcIZpla9SRL4d3C994HiNs4
Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: David Laight <david.laight.linux@gmail.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, workflows@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-csky@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Dinh Nguyen <dinguyen@kernel.org>, 
	Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Dave Penkler <dpenkler@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 19 May 2026 at 10:55, David Laight <david.laight.linux@gmail.com> wrote:
> The company I used to work for used 4 NIOS II inside an fpga.
> The instruction timing for one is pretty critical, it has some code that
> has to complete in 122 clocks (worst case).
> Our solution was to spend a few man-weeks writing a compatible cpu!
> I think it came out with fewer pipeline stalls (in particular it 'lost'
> the one for a (predicted) taken branch).
> The maximum clock frequency might be lower; but it is ok at 62.5MHz and the
> higher 125MHz in just impossible for all sorts of reasons.
>
> OTOH I really wouldn't run Linux on it!

Sounds similar to what CoreSemi is doing with J2 (nommu, also for
predictable latency), but their products do run Linux.
See the video from the LPC session at
https://lpc.events/event/19/contributions/2097/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640ED3CD8CD
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456837; cv=none; b=mseFkSs55fL70bt62FfMrQubpX9AYWlAFRvStIQ1m96m7EIFBjpubcqws/tD7r9yxOxqnehfowQc7HCkFEQ8o0B3+5UiuO13PvOvieBQSUcgQBOtPmy2GkZ4WF/+1z7f2cs7AutBWEYqxAAnBO86u0HET4YrmxofkisfRnC84y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456837; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ih1W3RbtVwbC4+FfkmEF8M7wueyGOARG81QlI+Ws+kOzRgtj84oLB5ELlTLHAS7miV05j1egFxgXz/VVkO8Jw34koyAdCJ4o2P6Bhfp8ZMf2GkI/98RSYVB3OWtCQ842cbhuqVVL9fpeCmoc53f+82aiXe750+bgkIHOuKMdNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-961780b0b98so372340241.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456835; x=1780061635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=e/sDz0c20EKI10PHFKJcgF4hDochiwQtLPIjXTM1zkCS4k9hFnxOEuVeSsPGRDiyv8
         hCw3WEUGleuucqf9MZa5pAT/buh32WQJNBU9MgGGqFAX+HxLIjp0zurFxWtkDutQ9gYB
         SV+5bV1SAFaQBKS0Kp1BAEXLLTjq7pojtlFXUgbg5UmeA8fUxu8xrr0x+JUCPF5DldBk
         ttUFcIo+H3UAL70OU/AwH4ooYO6slSdDJIr3GqYcrXuOEKLVDkfX4x5PUF8rFCMw5Le4
         5VAWktp9qpTsGF5YdNayKXftmh1PtONrMFRxtefo87uNdjWBo5oDlRC0mXQddJDYBp5+
         sSQA==
X-Forwarded-Encrypted: i=1; AFNElJ8CRGYZI3r041UksKpkF9dvA2WIV/4Eyra1HzxTkddkKN1QfIhcwej9BzpfvIljYv/yankMiv4uYDhl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkLkkIlXVAOx6OoCNhA7hik8wZKee0Ye0EbMe7l1jI/seW3vn
	WFS3WSOxLwnVPwGWw/ZiBcphsVkTZV/AWVWdA/t0d1llxuMVW5R38vK145rAHJHF4ss=
X-Gm-Gg: Acq92OHrrguOdnTltMhHKc3FgL3CoXj0/61P6v+Fvcxd7UbySucskdiXNgpvKvZRpmJ
	4eEzAdjvEY+tI1HUJ3LD0OYzL1PeefIh1wGcsF/yFbsucZ7vUzR1+9ManYEXvjXEOcK4DrbmhHA
	+NyaqgDVPv7+qrwFbZwaL00Ih4Zgf/z+YlZefgKznt/hSz6ficUoMKUz6ZCYAA9EBX69nTW5X5x
	x0wjNUu0vnvCYVR1cFOokuWO0uRoZG77wwYlGIYDPCA5gJlmU5lXsbBPKybXZzLWQRjMXsjFbFW
	DYyqlrxHFlJ3FwNLR69PODICamFYkeLVMc8ux620Vu/MsDCj9HYaXAJPbBGMidv7khbi05jKY4Z
	js0Am59kQwuxF1qPRG5rDLga+SnfbGkdxfcxPkvrV8Nu9kod/68e0iJPBIVlXU3Ev7iOFSerPAA
	OmkmNTAUGtkEwsip7fKXH4Yr7GzSvwd05qPU3fa3ezXC5PaE1RtcrlwYmDSux1zsNkvIizfhKn0
	Cw=
X-Received: by 2002:a05:6122:458a:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5865e69bf6bmr1941096e0c.3.1779456835236;
        Fri, 22 May 2026 06:33:55 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738430e3sm1563198241.5.2026.05.22.06.33.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:52 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5873983d19eso535483e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ83QBsRW/H4twUvnJnN+I0STX2d5wG3UafAgcPP7+zMfDKxS/8hvGJCFvm8GnaPEfcW8vHIvWt1PhAq@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:575:22f2:a1f with SMTP id
 71dfb90a1353d-5865f726da6mr2054383e0c.4.1779456831104; Fri, 22 May 2026
 06:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeGsp+g2mGu7EQo6cN1v6-ectETVU+PtWUpznHboS-TQ@mail.gmail.com>
X-Gm-Features: AVHnY4KJmR-uF4CxL9myINVO4InRW9Xy-V6WIFG-Jxn6EItYI51QzaUkbyalZ7o
Message-ID: <CAMuHMdVeGsp+g2mGu7EQo6cN1v6-ectETVU+PtWUpznHboS-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: salvator-common: Rename
 clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

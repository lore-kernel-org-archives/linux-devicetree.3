Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7083E9F62
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455262; cv=none; b=oyicU0758KePp7Zd9Hh061cCBKkN6+pok/VHv6C9GFWizq6oskuUSUdH0K+sc10OoEFuRCImhWIedFgKN5ufQEVXd+JcQDS5Ah6v4L93rW4m626uBmPYoNcIeE0cRjHCPoP9pFm5mAMSNryFowN3IGDszJEnokz6k6RLKqAzqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455262; c=relaxed/simple;
	bh=AwxLjzrdk9/Z7BE85Y5oP4mxHmoYxY0IGia8Ki6oFXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYnIEJ+L1fPwiVhDSXkN6CHb2jJaXqreTsOCzopkpug3uVuhbEiNYefI68wyG7cVHwx5O9sBMtk289Lm7OsE5TuIazQ26alH1sxyhVlY3JVWAjYtKKqg8TlsJruyv1G49Tgu4selek873Mbip6yaIBNiQrICcMaGe5q2zykyYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66971ccfcabso4192090a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455259; x=1775060059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7hxFHeXhaKh6ezauoVCeEqUVcF6/z5+QCU6EnsyTkw=;
        b=HGCf8VzpSmALtgVZWTryZYNH7LxzCeLvv+b5A68J5ZIff2LbZBO9BUTkNdS5V91DBH
         VPlFXFYktqLNja+yJ6sfFGwr3tSO0X+7TKh+1F1wnZVmOmdUNBokD/hvTp8ggESpxq8c
         a17wsIsOWfDv2ueC9ADBGtA1NSYrjBVLbKicCe5gWGb+RwZkvZQWNomxIeV6wqaHSllw
         t1mqdvrMpXqgD8G7ZbtXCiULRrelmk+Tz8dvPCoe6+Cg9lSG2UhgfSqf1v1+dGqkBRQ2
         1a/X11glA77CfZqLri6GKm0Xr7Q9FdZPuIXoN49Ib+kDl2m2hK50JxrikYx+A9YiK8e5
         A7ww==
X-Forwarded-Encrypted: i=1; AJvYcCWFnowSQKtZ1IqYIFc8W+5FabB9KhXitkD6HiA1MxH8ETmkR8PU0NUaMinFLWsunXBNZhTcv6MiwxTa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/g38MkybY3M+hVBrB19JZtMfndUfsOMj0x/bFIVY1iNSX48OL
	6jyP9PKpXrLtWTsoET50WpSbHN4fzxT25sln7Xm9Uc7i66fmXjQhKRWtqxdenfddVM8=
X-Gm-Gg: ATEYQzy76PTQRJVzPAEzMHAud8khI+TBNP7DBsQOrbZfvp8I/QCR8N9GHzWJ8B+7r2k
	2/f2zwn4lmapc13g/fV2Q3HV6aetANDda7sCWD0i1os5ZAuiqhzVu3aJdopGLn92V1QuyQsOoWt
	QAbBxaNmbeNDzBg+toSeAG2j/MQHc6RtyDrViKrAz3wYKHIFHFstjEpY0ufJAbL4NMloKfBKju4
	Otqm4hSdGcQxma5X/9aG1G0XQe8Lry9BTrBdxqiZoemIcvQy6Kur2Orch4JwW76snFp2Dd8HvU7
	/2NazrsjESSKv0kfff1zHtiqqIfgz/druJfqrLDYy3dsnh4X6VOyovrqf3bpAdjjE9D+THlx3yq
	NuFtWh4O4nyHcV2e6uXLbfJeK5/MHVacx0QULfy9VUXpRcGmNDoZ952GYpasBdpv08V03sBB5cY
	5kMhgmITpml0v8tBbbhZuTVI1M1jAIGceBvozp73CY4F0FOyljF+sOFSBelj+i
X-Received: by 2002:a17:907:a604:b0:b93:56a4:d6bc with SMTP id a640c23a62f3a-b9a542c9719mr206116666b.49.1774455259203;
        Wed, 25 Mar 2026 09:14:19 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20219193sm5998066b.9.2026.03.25.09.14.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:14:18 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so3945580a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:14:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNyJkEGRMbfR9ArNf0nTpV/8uPHl9q1CZv1RB3lW2TLnXI+pOlgsDMXJb7Cfc/9SRrKNvN+k8YRrU2@vger.kernel.org
X-Received: by 2002:a17:907:6c11:b0:b98:4551:e796 with SMTP id
 a640c23a62f3a-b9a5423c83dmr299006666b.30.1774455256810; Wed, 25 Mar 2026
 09:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319132907.2350458-1-aford173@gmail.com>
In-Reply-To: <20260319132907.2350458-1-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:14:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsa=TM8oX_cE8XZZWpDBH2m+q-Y-uc=v3xzCpkef-dMw@mail.gmail.com>
X-Gm-Features: AQROBzCHMIm0U58LxIOB3k6KRzR_C4wVTSUb0Mx4rQrhRbA8aVOLRlAYZiQiDA8
Message-ID: <CAMuHMdUsa=TM8oX_cE8XZZWpDBH2m+q-Y-uc=v3xzCpkef-dMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
To: Adam Ford <aford173@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, marek.vasut@mailbox.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adam,

On Thu, 19 Mar 2026 at 14:29, Adam Ford <aford173@gmail.com> wrote:
> The LVDS Panel was never shipped from Beacon, and there are device
> tree errors, so rather than trying to fix them, remove it instead.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -101,38 +101,6 @@ led3 {
>                 };
>         };
>
> -       lvds {
> -               compatible = "panel-lvds";
> -               power-supply = <&reg_lcd_reset>;

Shouldn't you remove the reg_lcd_reset...

> -               width-mm = <223>;
> -               height-mm = <125>;
> -               backlight = <&backlight_lvds>;

... and backlight_lvds nodes, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

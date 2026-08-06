Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE33D903B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018589; cv=none; b=YW/QvqkD3xueVbvqceA6jEmT2AcJXpp7+/+KVyqtspzNglpCycAgx+zYO+14rfNZGQheMKmmVkOP+gL3UWHNEYe9DXa7J3MlyrsBVI6siDrJcf0/LJlKm/Az5sneJ2zAbdcv7wV18qZ0zzrgsWHlU4iqdAp/W3U+445eH4oMC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018589; c=relaxed/simple;
	bh=MfcI2RhcsTr0yzfFod4885W1pqBXaezKzSsvnaGWzuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3B8RfIRHGIxFIHDu7cge/0RTmyTc2dW8lsPceRZDzAFzOATQrJQFytwN8+e74QGSn4CfbQ8JuzthkSUTEPwb1DK8tAKTKKN6yk4Ek19z/HKXZfM4oLHSW6Q80eFpcRrbI7yt0TtPL3eCo6PUNzUjYPnvUIv5exJiCDtH9VQRLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7466771f1caso623685137.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018579; x=1786623379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U36O9R4trTBcyOnxyg/ehmF6oGcafbI8ItUkmxAwOdM=;
        b=r6SPV+k43FG2BvS/E/EtI1aXqo/4+7/bGAsZd7DeOcg1hsbVMoBK0yRHn759C9vE+O
         lhuS5NLgqwRvBw09QtVYwekVEwoyJZtRXcxCDcQLNG9a2g+pDzLoYNwTIFFqLbJt8KxY
         NYUEKSQl8lI1sK7D9wr6+x9MaRvlu3V2BtKKJSYmjhpH/isk1MVEBD10iVyA2h8bJzq0
         0etQ7A0BP6CrWpqUJqSrx/0/wVPO+8VhUNYEzBMmWlkg2llyp71vWdMM3MWZ12E90BJd
         uBeJkJB3xs+eOog4I66rTP6ExfiESw6/z2fCxH//Lz08tRcrT8d8SIzgpQvSUAzdMGEZ
         Y45g==
X-Forwarded-Encrypted: i=1; AHgh+RqMgvuz9rcUvINj3Cm/y1BllRsuK4uu+UMaItwj2vDHBlVn4HHkj/xwEYvTqrNFsHAz8X1zej4RMMBL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2c1+BbEe18vTsHbI9Emzlq/Z7eVmN5E/61xnuYc3exa9r5AB
	d729t6RZ4KlYk+CrlXuuMKIb6IFdHgqyQdAS63VfsC9M5Zu9IbI6g05hg0FmsrGv
X-Gm-Gg: AR+sD10UpBKu6jiUz73KFbB4MoHg58lQakFjpqkeCm+43OaITSF3cjFQE7gmeNjobzQ
	5Z0OaArWE0kkBKwvI1VTMZOZRTbfH/HbaumzvE9BLKD1yseWrkgs+19mElSSZJ0Nszx2NO6xGlT
	Bze80xm98/df3ZSc4L+IaiZ3KB8Qi1WmBPGQSvS7JT7wps+8phxtwc9ljhSTZ2LZDdQigjAi5e9
	MaMvMju52M3eDGbYh8jz30Hy+D3zZfUZPKXjOrLK0YaV2ch2rzH1EEY7QDkMzhPDgSX8v8aCGP+
	RTKK7FM0jtfOwnBHNijZJV7r4n2PPinkkZGTsOEcXEwy4CQ8H6uJGN9Q8hoZJVjnmsEh271Zkw3
	hA31HaPRWWjJ30VrjAx0nAPsY17p26EOTGo/ZfQHS9oIKdDRlF2FB4ALFhmzyIhBx2cWmYlmVyh
	Xwzd9R8pWbm70ggYqT4Kszy8NJim69T7gppX4DscSOWdKd0l3u3zW3jE6iYNuBjZ1ot3MoHvPWN
	oPLhUE1In70bEQOssiN4Yk9wA==
X-Received: by 2002:a05:6102:449b:b0:745:7f23:a876 with SMTP id ada2fe7eead31-760ea84c5f5mr3661866137.1.1786018579371;
        Thu, 06 Aug 2026 05:16:19 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c7975bbsm2635458241.1.2026.08.06.05.16.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 05:16:18 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so567587241.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrtdlDGZjRFnPP+kId4I8qU/kcVXFT2NubSF0QImSOGYoujmhl8s1UrALlERO6xc3PnmaveGQWZFwU+@vger.kernel.org
X-Received: by 2002:a05:6102:449b:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-760ea84c5f5mr3661787137.1.1786018577628; Thu, 06 Aug 2026
 05:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806111018.782380-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260806111018.782380-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 14:16:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBxvXQW43P9QGJxYnnoDrwGxJzCv1d7bXiAcP8CCw+_g@mail.gmail.com>
X-Gm-Features: AUfX_mwjDsO_L7mP6JsEcg0THPfhb-ZJpCX_tP9gPgzN2ZLuyGkUnH850M6oOv0
Message-ID: <CAMuHMdXBxvXQW43P9QGJxYnnoDrwGxJzCv1d7bXiAcP8CCw+_g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Drop clock-frequency
 from required
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 13:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> clock-frequency is described as optional, with 100 kHz assumed when
> absent, yet it is also listed as required.
>
> The description is correct: i2c-riic calls i2c_parse_fw_timings() with
> use_defaults set, so the core falls back to I2C_MAX_STANDARD_MODE_FREQ
> when the property is absent.
>
> The stale requirement only produces dtbs_check noise on boards relying
> on the default:
>
>   i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a
>   required property
>
> Drop it.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

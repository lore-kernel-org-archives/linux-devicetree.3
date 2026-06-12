Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8413655F6
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304942; cv=pass; b=psgQqwkjHvjHkM5NKtmcedlJy5GQ6264aF1HR45xZngz4xf28Zu4YK8Vi80vIjtp1tfUbqWd0Bk27kyRcdahqKoSa5FsM+6b2MH73zLgB43hFjHaqtTB34o9G/x0+npuwnzCxhzT70MSYUUmqNbvEzmzD7HFw75ijga2kPhKjvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304942; c=relaxed/simple;
	bh=RnGRLsaryVYMbmEZaBHC0Tao43UKFOd1sK8lgdxTk3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao62cl6eqGhTkZGLHNdC9I//MGb3kSekGI0aJgLYTSXsnaZcg1n3jYGAwCRahBNfsC7RL/HRHI5URu2d3Kg5EcZWRiWTx68pOA/Ljiuy/ByZPd1GJ+lR5zbS7JawLFI0vw27D5cgNV34aDkB1MaTKaTixpzWXXJ6Ljs2454D2lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkhcIDmY; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkhcIDmY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so1049759a12.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781304941; cv=none;
        d=google.com; s=arc-20240605;
        b=RchlZ1Z4dGn5ZiXTNmZ16olxsk3TmUvlPDS+7QODMJC+1S+aX9Pvlr5JmrbUPhgCBp
         iyyn+/FycS1rJB30SyECMdxTOjgQKhZ0+ZiDTjD9Ng6Inbfnst82o3rzsXsnKjLCI/sG
         hC7g8651jwi3nvE/jZc9QNU6ilRC/h6XiOpYO2u9DEWquExWbmzNtxpYjtereZrffMM9
         4hOFMvBw3X0hSH3mX5u2zMYTVVho82f4LI7S0bGOlV4o+d58h24MCNSXZHUroo2E6npJ
         fzbd3k3sJ8iTybUiqA4+A1mLhsL47msFj2b3QHPjpwvoG2PDlpzXyyb4Hq/ldfo4kuMN
         WIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cemL8pO4O+gor5GCDMKqIY/b/nhS0YXr6Sf7gRABVFE=;
        fh=0mdCXt8p0q6o1imT0bMHOmqOPQOA/IXVhibCyuG/Xsc=;
        b=KSEPuDY4VbKogbjwMxSsYYW0jdHu0yvb5aOYY+KJ16zp9m1zKfuQhz8v+GYa8MXszr
         p84IaB6LvGEl0AD1QGPvjRAzNGCeR+1j03m41khTnLJ20wwZ/ewnQlrliEo+73Q7bD0B
         qhTKEYIMIuOe2f9NkzdThpMh/hMMYr4bVvYHDEDBXT/16pESvCvWVrlcBEZshBZElBZI
         pIGgXIK7P2Tm81pY5AADQ0GfUgK5//2DVqSJXOoM8BQdIeEoDZKuMGgnFSVlpBQ/b5nA
         3+rGTEIY+AVxM3ivamOfqqoQQh1SW1fTPbU/WQo9vLYlsE0bUV2MW8mg5k6vUI6+goMJ
         ZwHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304941; x=1781909741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cemL8pO4O+gor5GCDMKqIY/b/nhS0YXr6Sf7gRABVFE=;
        b=IkhcIDmYzzUQWGOq1uA0Kdk6Ulaoe7lQv+d1O2oiNIxFq3yoV3mAhSNS29A6QzanmE
         bAcADD8bsl8gDxvn3Ll6m4hB8tG34Pk6qwIPLIMlBLmkHCv2lKMKgyWpb9IvjAiLNyiD
         n4elFCz5AlCptW9jSDOBtJPsmDDIoFrCPfXNQbdZlFt9NxIRYFr/zgYR320BwvrKln6I
         BZw3z++91DyQnsZ4R0WZo6yiWTodDnzn13m2QzBdYkTZ+UDeFmCnO3lQ1No5J75IZthp
         7ohOv0Ddr+Jx43USh+pPc6DyT16CUH9EAew3961zsk4INZqQ8TEXHUOEdIn9LC8rP6VD
         kxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304941; x=1781909741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cemL8pO4O+gor5GCDMKqIY/b/nhS0YXr6Sf7gRABVFE=;
        b=bO/Y1okMgDuj2AazQqkhECm274QOwR54QHt6qlFtgCz4u3nAn2p0+f5SEQWJPJOrlb
         NJKjXc+0wejlF44+b1HMYvZBDs1tzVBlu+s90jdtzOaEStxM0+Uo2A+fzb7AApIrEAe3
         d4B+7rut1ttcyPyUXPep9/gFnZJDie1ffT/hRSe8zI63C0+Tqs7qnlqgIr1BdsS8v4TP
         imvMP07hnWQ1yblHuAdLBWQ7PIScTbhPbRQHICJzefDnV/vvvvVy082KrSuFXSsUiZcb
         qxnI+PIKGMmxXfLlxgMVLn+fovGwtWVI9QoOpo1BcS3Y+cT2hC2XFkDD9pZcxbpuei5G
         /ooA==
X-Forwarded-Encrypted: i=1; AFNElJ9oxp5wywwdw/1PFgMM89Vy9dpR/6sP8X+up9RGgYax4xrIVeje+co0u8IkWRa2e5KHkpHp6tnqHzjR@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIkliIWtMYDO8fFDLZzFIM7HdT6vSf4zyaRyuiCmCQc26J1TG
	+CpW5hQyvl5sF2OjcapIlx+aDkaMLgtn6i3iOh4QnfILc5PvWYq6/BTEhOzEPB+9KaaixyypmaN
	4bzdxkH6m7srUQsT6ELbDF+22ru3/Fz8=
X-Gm-Gg: Acq92OG1QGEz2z7WgZbpYfsxOPmzGyMkD7QF2DM488q1J2/7NeAxbxk+hLVmlC6I4u8
	XDfhlV8rq6nYTpfgjKG7Y9dBC9DLGTGDQFQh4q8bmzR87wGVSSVMJ+u8Ebjf/wnd6zo9yn98XGE
	n9IehgCVDNw6N0QUWbrM0HJoXxPBg8wcykWZrjJzlsVfWQYY1dtqPvRr9aDdaGMD2ocIblRetMo
	owVehrdTg3LAkKTJVE6dRgWMunB8OBH9kLRwRB2mWfAcMbLfjojN457LgMj+Im9YX+/ZI4FxeJ6
	VUhYVNvyuSO679O1vrVcxH0eCd8w08S1Oba+DZNPT2Mgb9zuP2AdbJZMum3P9c9x/nYgIR+6
X-Received: by 2002:a05:6300:808b:b0:3b7:99af:2d22 with SMTP id
 adf61e73a8af0-3b799af3065mr690013637.19.1781304940769; Fri, 12 Jun 2026
 15:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
 <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com> <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
In-Reply-To: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 13 Jun 2026 05:55:29 +0700
X-Gm-Features: AVVi8CckQkjD86MDGtEDHBEDRZeUn6MBYP38VksTuYLHBCU5CWlyG_A5TkSZIfE
Message-ID: <CAABR9nFoLrYTUqRr0__n33EZ9Y+YfM=RxAMsx2EFnDWxHa4k3g@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

>
> Thanks, confirmed.
> Have a nice weekend!
>

I went through the schematics and summarized the FSIA clock and data
routing below.
This is mostly for future reference, so that anyone investigating this
hardware setup later
can quickly understand the default configuration without having to
revisit the schematics.

In summary, the current hardware connection between FSIA and the
WM8978 codec is
configured as follows:

Master Clock (MCLK)

Pin 11 (MCLK) of the codec is connected to pin 3 of OSC X8, which
provides the 12.288 MHz clock source,
and is also connected to the R8A7740.On the R8A7740 side, there are
two possible routing options:
1 . Pin G3 (FSIACK - Master Clock Input for PORTA) through resistor R250.
     R250 is a 0-ohm resistor and is currently populated.
2. Pin K5 (FSIAOMC - Master Clock Output for PORTA) through resistor R120.
    R120 is a 0-ohm resistor but is currently not populated.

=> With the default hardware configuration, the master clock is
supplied by OSC X8 and FSIA operates in slave mode.

Bit Clock (BCLK)

Pin 8 of the codec is connected to the R8A7740.
On the R8A7740 side, there are two possible routing options:

1. Pin L5 (FSIAIBT - Sound Input Bit Clock, slave) through resistor R123.
     R123 is a 0-ohm resistor and is currently populated.

2. Pin F2 (FSIAOBT - Sound Output Bit Clock, master) through resistor R139.
    R139 is a 0-ohm resistor but is currently not populated.
=> With the default hardware configuration, FSIA operates in slave
mode and receives the bit clock from the codec.

LR Clock (LRCLK)

Pin 7 of the codec is connected to the R8A7740.
On the R8A7740 side, there are two possible routing options:
1. Pin F1 (FSIAILR - Sound Input LR Clock, slave) through resistor R124.
   R124 is a 0-ohm resistor and is currently populated.
2. Pin E2 (FSIAOLR - Sound Output LR Clock, master) through resistor R227.
   R227 is a 0-ohm resistor but is currently not populated.
=> With the default hardware configuration, FSIA operates in slave
mode and receives the LR clock from the codec.

Input Data

Pin 9 (ADCDAT) of the codec is connected to pin H4 (FSIAISLD - Sound
Input Serial Data) of the R8A7740
through the DBGMD/LCDC0/FSIA mux path.

Output Data

Pin 10 (DACDAT) of the codec is connected directly to pin J4 (FSIAOSLD
- Sound Output Serial Data) of the R8A7740.

Conclusion

With the current default hardware configuration:
The WM8978 codec operates as the clock master. FSIA operates as the clock slave.
If we want to test FSIA in master mode, the resistor configuration for
all clock lines must be changed:

1.Master Clock (MCLK)
2.Bit Clock (BCLK)
3.LR Clock (LRCLK)

In other words, all clock routing selections currently connected to
the slave-side pins must be
switched to the corresponding master-side pins.

Best regards,
Phuc

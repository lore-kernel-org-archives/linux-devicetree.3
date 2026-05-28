Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD863F412B
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975039; cv=none; b=YzWtndmTlstwRWB92xx2jwQ1IdyUI00FSc3omw+jNmFaqGLlzTxitbhATgJeEqWX4w1Ds8LCUqPA3BOnzBIkYDniTa0GqtwjcogChCjcV8gjM5S3nhVDPlP0CozxvlM0NCr3LSChTu0Ll962oUINXv47pThrJnXOfJ2G6wygR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975039; c=relaxed/simple;
	bh=jBGtRaUIssZJBiL6UhZEdhVI/X8GSvu/qG2UsvRupI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCaRHTPCP9BYJYltkH9nFyIbx6QqFDlw4mqW8Gaf9mV4MK/DstYqe1Br6DuibR3xWrPtFktKZPQeC0v5qC8VOobwZfkL7SSe0JeAzFf5C6ZuYv9Q8rPOV5dSJulA14MZvXjJgkKiSfDJR3i0j4M6kNS9AkjMcPRy6Lwyd0c23ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bdb3eb93e20so1253111966b.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975036; x=1780579836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm7D9F1teaCAYCkqxhP59SQwZeLN4ep/zHxw7l5Vin0=;
        b=KB820JvottXLWrLiS+yA9udy0QW51rS0qz2mmUYPB7h7RZgJPvTXykbSfl6YbWOWm2
         EHlumP/4wzkXSCTkMukQqnlgUgqPYXjaey+4Pv2h1qrN5NIpmCwnz7QQBR/W397c1VED
         NVTWvnMqwx+ukKxeK+ta16k+pyKEKwdYI6oJ7AmhGNnB9jEfmywKcMB5Ju1i+EOyfmez
         /GG6MPw8gXdg1+luQLPN5OhB6bc5mqo9/hfkxaX6tWFGZtk+DdlI9UAKmM/uV46wM3lO
         RbW8+AHEH45UmquVtJSUz50YW91pxw3KihtcHsyumY3Gyn/JshFr7EICZKSBd/iAhSwV
         iNUA==
X-Forwarded-Encrypted: i=1; AFNElJ++UMyifbxvuIGvG33RFFWo3Dn+oXlZTw7NpGruIt9pcYaPvWyLwb0ZVA+/sUltygOiwXZuHKxGJN21@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Yc9+qElUKAV2RwMGdeZVgYlEkRUI7aSAouKQyh7BjCKaBPTn
	YEZSWB5btvL0VGCjgd9VBgA4MbChQQBLjoTGpQPczn872EB3Gl3JlQDctcRdfO4glNc=
X-Gm-Gg: Acq92OHiN4FSu/K837lNsTBbJm1w0ZIB6LrooQkHYklM5rRb7z5MjzMeSVvBVoasv2J
	Rv98RwIGbfygarVyQG/nQWMQ8XNRt+Lz66FziDcJHtXG+NyFAzUmGiGpw7/C7DWXSzgA52nW+F4
	DmRUVy2vXutjYq4TIclbJNyRjmiMmNpSvu9zwMF0VU8rUD+pRP/jstwyDB1JCw9CxgU3pls6bJP
	Ym0o939o3pmpeCTdZbhYW5FhtTJyV/8oMCePKm+eupRN/9K9V32Y41S1pULZkxRDDYXPzzzaZjX
	iseRgbLNUGmsk/P7qV1hIRP5mT0pWRVnHA92b+WvZKLP415Q01sPbk4WqXMwITnQYeSOIYvQ3m1
	mRxY+rEOlg09bnbcR68LoYZgMUPgXmfqIYdkcGNb7VQaPZjD9YYPu4gv/IK8NksKflRq0mxhQv7
	PgZGu5oWBXqK6Xxwe8TbVnoJwLxKTqbGa5+8xiGOVIkzQ1qzNMtfujKQLynu0KaX8DTZD30Ns=
X-Received: by 2002:a17:907:c08b:b0:be2:27e2:d7a2 with SMTP id a640c23a62f3a-be227e2d87amr948013866b.25.1779975035440;
        Thu, 28 May 2026 06:30:35 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb4115csm1869648a12.30.2026.05.28.06.30.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 06:30:33 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so13509075a12.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:30:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/vh2yPjAPWdmxKczvgVDoSzu4AQzrqTF63Vgh4pe69WYO1P2yG/qMIDGvvsdd5I53kq3v86KTsR6Hx@vger.kernel.org
X-Received: by 2002:a17:907:9d17:b0:be3:9977:e1c7 with SMTP id
 a640c23a62f3a-be39977e94bmr698117766b.19.1779975033006; Thu, 28 May 2026
 06:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
 <20260519074702.3308-6-wsa+renesas@sang-engineering.com> <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
 <ahanyVCJoqk9Hl8x@shikoro>
In-Reply-To: <ahanyVCJoqk9Hl8x@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 May 2026 15:30:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7ezkNDYfshKpLBSZygcurJPPWAf5bDF7p428S_S7QeA@mail.gmail.com>
X-Gm-Features: AVHnY4I-KuYi8iDJ9KVUVS6476LWmZXfOsoopgf9Rrtq-gY-1ednCl8_huhz8eo
Message-ID: <CAMuHMdX7ezkNDYfshKpLBSZygcurJPPWAf5bDF7p428S_S7QeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use SCMI
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 27 May 2026 at 10:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> we are missing you here! :)

Meh...

> > > +                       scmi_clk: protocol@14 {
> > > +                               reg = <0x14>;
> > > +                               #clock-cells = <1>;
> > > +                       };
> >
> > I am a bit reluctant to apply this patch: with all current firmware
> > versions, the system will lock up after "clk: Disabling unused clocks",
> > unless "clk_ignore_unused" is used, or unless out-of-tree SCMI
> > quirk handling patches are applied.
>
> Yeah, I understand. Maybe we leave out only the scmi_clk hunk and
> send it separately once it works upstream?

OK, I will drop that node for now.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

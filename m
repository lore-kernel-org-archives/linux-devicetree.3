Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF89283FF5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886322; cv=none; b=N1vLAsz2KdlXHqvbrNEKyRil9s0VLOxnF3/zIB2E66Ghx7OTYOSKJ+nk+eZar8tsxodkV38B+UdfkJsSaapqGJuLZL+rmHPi2pD67iSf7W/mRGkd6M4Jqrqqmamw0OQQbI1Lx9OdgtBaALFKyvE/aBauoIMBQKY1Byf9C9TIpK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886322; c=relaxed/simple;
	bh=V9RAf1GqqHMJtgbWs5i0yM5MgVagBGD839DyGgc8I5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibSO5fXChWlgqb2ZERl1cErPialWEzMMkLK8RtIfL9xBhpuTn7PRmsICwknieNogFI9n8rNKaeTObSgXIxSIvQdbo3YSsrypkVAS+1awxVvcSQgi3Ef7T1VMa1OkFghtTeQ0GQTGgONcLkHDinAVm5Bm2YfG3+GogIat5NJxH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9568159ee07so8300578241.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779886320; x=1780491120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1s/jtnq+BOH84dbnuPCtGCz4Kb51mjTjZ/fcs+3yeQ=;
        b=BiTXtcI7mQHJEMQi8+3UZfTEcU0LCQyl1zp4VDdV3EBllPbk+bdskze1A3REORQ/Vz
         nVP6D1/8Wnr2Qhnujz7M6MQX4hck9Vz5Uq/OdajGMFGKV5bPSXjs4zi7bIiCKx7SU3NY
         25lLuF5tu56+Jhg6OANfzF4/5KnnNp1ZUUHcezpbJdrUvi7ThVaVICOGr7ZwvwV8gmxa
         vpKcs7Bup2r8P6IqF3mpBSuyqqOMQF1dcYDkHpO3HkboGjSmo/+sndG2IThzSwyTsSM9
         L4U9RRaOXPIDO1FiMUeviHQGV2x6Hn4neTrJBf0TK7JnmdZj5Gj/AXS8zeTpB9tb3E3l
         liwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OVnl0bVjrG09hpUUa50DyKp1OOcd4faGjRUNTr/MncvdklQujORYThHL6yJPiQLszTj73f3fAhb3v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dvAzcNhRwnmRWjBhPOe/uEpjo3GfyBVKgPpNUULQMLq1Vwj7
	hCQOPYcZp3J/Uy/3q5j0wNaPJD6NcHUttm9wsEOkPjK9cgKjLWfoqYqwQeCKCOs16SA=
X-Gm-Gg: Acq92OGTJfIP65IydKu5/gB/eCXxIaMKbxCLckZK3VANU1CMx6W2Nyib9I4AUROwsLw
	9T9nNMlVKVM71I9Xwv6BtWsaAE/TFA42ey8+GhkcKfB0YgUxZxvpZq3ytquLb56DKPOO6XfCa3+
	7VqR/x5UHmnBHCsDAmVCAZljPQ67hkB3C0d/uammXk3AjFlMvVbhI7lDxeHRJCdgUqEWv3MtA3a
	PodKwthSsagWCBnYCANjfFDUM9QtrtIbHuJwcXU35FU8y2aQLvHWTRJfvBenukF/55W1S5ngxYn
	AB2OFmkKxv7EMDGThivwknq3X15gUPXXqruvUW3Ip2rcpzP4AI6hW+Wi4aRoIScUaSk2tzUmfBs
	N2oy+DQvPe/ElRi95W2wcnKwFPNsXGJR5MooGVd6g6rDxnAAhnLLV2Htnt73xOcz1po8h3AzmqW
	ZNmMo1rw+Ugf+O5zPu2ljEapjByqvq2huspSgS2FuEs2d0gO0CHSS4S4uC7HYWkD8Ap9tS4/8=
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr12869972137.30.1779886320042;
        Wed, 27 May 2026 05:52:00 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961d388f339sm2393384241.12.2026.05.27.05.51.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:51:59 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95d04f205beso8235858241.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:51:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+vIColflpGAlU00sKhRHebeyNK4QdDzRZaJHLUB2Pif5E33r3hVU2v56vRBKSUbvmNwiqm+GmGJDTt@vger.kernel.org
X-Received: by 2002:a05:6102:4b1c:b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-67c70e65631mr13755724137.4.1779886318786; Wed, 27 May 2026
 05:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524092016.46346-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260524092016.46346-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 14:51:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbnK9LXKgaEpWCosUHLMGQzpe32VxaT4xT5P1FU43NLA@mail.gmail.com>
X-Gm-Features: AVHnY4K7PEhqL7l-y4HCxD8YtnX5gQi3Kk8WMoT27R9AZcbDgLwF3FI-H1Ufsec
Message-ID: <CAMuHMdUbnK9LXKgaEpWCosUHLMGQzpe32VxaT4xT5P1FU43NLA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Sort pinmux entries
 and fix blank line
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 May 2026 at 11:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Sort the pinmux entries for both GMAC ctrl nodes in port order (A/B/C and
> D/E/F respectively) and remove the extra blank line before the second
> pinmux assignment.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

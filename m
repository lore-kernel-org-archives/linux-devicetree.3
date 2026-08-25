Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AC442B3E
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668889; cv=none; b=Qjp44LHJwEFMNTTP5SmNqA1Pp6wwoZDJhI0FTW9OLlQZd84iSlnWiu8ydNJz4SKFexfK9TCv122C3NRtKsCnmXUtHOEXMZPyG5UUZ9VzXVL2Puf33vvv68DLVURKMLWe23yZC54KLGmJxngS5PPZvXi2T3fDdvuRR1Xh/LlfC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668889; c=relaxed/simple;
	bh=nLpkCbwZynXDMfJEEM7Od0jmnvS7H38PKmlDset+WdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJRMR+NZwwouH/ZlCXPu18BTP8kdBFAcT3uK+bxvJ36J+no+/xPhITrcSR6AdZUmqnu6JL5TuQOU0txh/DuiR20by556eeGKhnu7ZGVwlqMw6FWqxSqtcCmxUhxkQ63kZpTysvkpVJ9pZU0ASXWNU2oCQfIA9FwTdlzB6ld5c68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97c3e2cf01cso1363163241.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668887; x=1788273687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2zVX3GQV5dux+TGrNQ7XOJ1BZI/EApCvZgLsrH7Hjs=;
        b=gsM7mQCmtu0Z88tbBeVdf7pH8b+VHm6eJ71L3PJiDNOX0ZCGniuZshl9XRj3J1DWIg
         iVRREYeCqwtRYwb7V5iH0ODfEpCai8Uz3xTqUpfC13DOj36gR0Kq7m9uTHertA2U/Pv8
         bz6kjg6tteWX7zgNhECEUdZ8d/eiKqwBUTNioZ3A8W2t0Tv1an1Z6oiguE8SCH6mguQh
         zGrYxVXtFhq8o2Ppbk4+IwzFZLvNTlbUHkrL+1U8+hMk47I7QYqqn0tEqjWX8O8pQ8Ol
         IPrNy/Cov5h1TDoHfF3/YTHweotutibth9cyiDC42YoUAcXvGxq41va8Qk9/TzngZ8/b
         kGXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqxd7uyf7oqu/R/iLAOgQQg9DfQ8iEQgGwx0QC9B36en2pHWnsXbLkgTsCbo6LRCCT76YcgG46WSuh+@vger.kernel.org
X-Gm-Message-State: AFuF++l+j3hawG0O4ZfNSm99mpZ16PIybks59y/z0+aKCmRc2qh3mvs1
	1c9P07VUgM8uxe9Fp6T2Ef2Pa6r5lSHOnXx5USB1mvEJhtja1luNNcgUt72z0cpOAeo=
X-Gm-Gg: AR+sD11LjilLcLTcia95QxBVy+2FhbDLRReYUgTqYTwDlKVBst/JGXhxUiC20OXxooD
	pDepF69NV9byvC8Hlh5JLOEIyiyvcLoO0ecox/BV4Y6t+6q25URKNC5Y2HaoSkHiFI2vFrFzBHM
	hovHh50atu1Hdfyqax/pmS/CIXbe1Itj3oxUk2IydvuhRy42ESkMrQCLMwqddckUe51xqPzzLr8
	nv4yzcE+mkh4bPKFDchAhTamjKPAmbwv1TfTiWc7nkh2C29U46DPzdf0EL1LditiaNnBIFR4HQq
	mwls5BtR5ILyVyPK2q+CHAfL0gMnjgurkBYF7d+d/SUU/ra0pxg7PyDdNe8b1kWqVzmtAm6YDQi
	sFaVfukIgUsfbmd6llMzeDpTaxFZ0D2v2Cq813XxFUITxjXS+pEakPBrh2J4S9Xo4PEZ0RkzKAR
	hR8QSDQINDHjH5B1mRzisZVwrDH36El+MpHtMOJz1qQNcwKVQrCpPMiQuWgRegM1mXnFPVhYxx8
	FLPxCRV70Q+WftjYrrQP0pdRXu53q5E4GcAH/W4
X-Received: by 2002:a05:6102:2913:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-77bd338ee24mr8110113137.12.1787668887007;
        Tue, 25 Aug 2026 07:41:27 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d856d8fa0sm5708436137.7.2026.08.25.07.41.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:41:26 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so1599582e0c.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrgo5s8/+4a0PqfJuvvMXBE3zHzHOc5Ffm8KJJ/NxQMGZF7/TY/VCaY+cAoevl1BEusPj7Zc77SxzC/@vger.kernel.org
X-Received: by 2002:a05:6102:956:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-77bd288c901mr8711759137.11.1787668885681; Tue, 25 Aug 2026
 07:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-7-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-7-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:41:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMhfr=rp9G8X-+=AR5vqW5VrJfrKwjVrHEKk_kJOh0ZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XcBg5LXeoVHCFcLS1DZhjQyfJuS_scF13yf7YemR1ca_DnmJdOHtxK55I
Message-ID: <CAMuHMdXMhfr=rp9G8X-+=AR5vqW5VrJfrKwjVrHEKk_kJOh0ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add support for Renesas RZ/G3S
>
> The Renesas RZ/G3S CAN-FD controller is largely compatible with the
> variant found on the Renesas RZ/G3E. The main differences are:
> - the RZ/G3S provides 16 AFL pages
> - the RZ/G3S supports only two channels
> - the RZ/G3S supports only CAN-FD operation and does not implement the
>   bits used to select between classical CAN-only and CAN FD-only modes.
> - the RZ/G3S includes an internal divider that allows the peripheral
>   clock to be used as the CAN FD clock source.
>
> Add support for the Renesas RZ/G3S.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF4306B31
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533305; cv=none; b=VkX+7jIsLJKevkRcbDjLqfaiJAdfBrVNlb2djKkKnnIBXQNMz51yTW2Tm5AfAkf/YOVPmw+I27fgVbDS6NC+F7XRgpimM99DpDe4jEeoAYsCBQADOKIZdBqGqnPLl6PVVWpexkZiVXfeIs/5fg8D869OFHn0f/9nQvLhvOkvgcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533305; c=relaxed/simple;
	bh=PrdVd4X1hWNcsssygPYsudpiYX/MAc0rIL671UYG3fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmyMARIl88+2gDGqQdhcAGZrPL3pH2PSG6eGB2r/ygDUb+l50eXyMA4rdj7Xdt+BBbtCkaSRz2gzDfTIuEF6KUax78WRaTeNhwOFdsfq58qUaBAsPU2lABnz73xwPXGGHOxDz8WwFz5H6GQYq0eTUSUWCnuQGUimGSuVPQnKREw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d357797acso601048e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533304; x=1775138104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Kjle8Op6pOPl0dSvzRbB+JPH3/6RrwN6QyyD8dpN9I=;
        b=PjRuwcUR2yPUEzdwef3C08oYfa31zOwfoGee135oaA3CZMvS28QEK3OIXTlo7snayy
         Xs0CyROhEVy2EgK3JsW7sRSphS/9Ul0k90EcX/cNW5dSRTVnk1hrm3IsR7PrrWIaN7yu
         Y0kB6z8Txc5/jtiCtnhLZifxP2lGRAE4df/pcTUNYjmFao2+/3bGZX8uKL1kbspCqHzb
         Tp6aAwC2MuBKCi+vcJ0ThfwfOzjsRf7MgUT3RBF7PoLHXhB710K5dsB17tvuEBPZPu+g
         DfNSCl9yQFf30gIYozymgF3yHOkjfvNZ6bP3POheXwoUSL4LRKtY7lnzHO00IsHfWa5c
         5soQ==
X-Forwarded-Encrypted: i=1; AJvYcCW64uszA8SqNmwf7Rv0Hc0LrXa2/VajRWuyDtADIWK7tlqxzrgivSRQXnBV7/Hjp+nyA5IH2GyRoOG2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg5lW1AFHX0QkjyjwND2rShznLrqYadjbSCBwiYcLJvlKGPECF
	gCaVKCIXWCPnyyJ969fgrP+8ZaCbcJ2j8dZclbOrZ67oSB+I7R2YZU546ZPaURDJNO8=
X-Gm-Gg: ATEYQzym8luiKEl5Km3M0s9n00KIAm5ds7VoR8mES7nJlfAsWspXtQvg7NX7L/lHLty
	uOaTVJXTucIhdikA42GNxP7DDSubitMxyfZSpn5Zo6iq2CUS13i8mu8g5h735KY/ltDIxaME3Q/
	1Mhn39+CfkmWavbEV/Zp9TrDFWLNiscE8PYsBP/uX0HsZzPeXjWPwWBfgybKnz8PqB7tdJPUAug
	z7LGVCp/kuNqjCKoHZ33QCjY+Y+M/sLCqN1WKal7rqh87NZ7JTKC2fGwhJrusffMw40HypSbjGu
	mh9Ye9ccuSs/E7BH1ws/9hg4FDiMu1uBUHkMvTozfjRzbClYSo5PZiVgqa5tYNJsm5oWLUMm6ho
	kJFODWKZ9GIU6cehaGNPF1as3/byZb/ni9dWdq9U9lRCZQ+91sYrihsgcoRFYNr7oLPgBCooAFn
	SJbnXQs8GXzscYzElrUpLp/Lp3pEUl+bnnZDRl8ivntllXh2+QdD0tToxmI91YZ4hC
X-Received: by 2002:a05:6122:6d13:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-56d21f68dfbmr3358003e0c.6.1774533303626;
        Thu, 26 Mar 2026 06:55:03 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d71725sm4545726e0c.13.2026.03.26.06.55.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:55:01 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56b890d1687so918814e0c.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVi9krLEo/zWg7bjmTF6EpPkfxRkGNqHPZ0tFDLqtpDbKNtGTrKc4nCu1mAmher/niB44SUJv5B6gBz@vger.kernel.org
X-Received: by 2002:a05:6122:e1ae:b0:56b:5893:d042 with SMTP id
 71dfb90a1353d-56d2207aecamr4251415e0c.12.1774533300590; Thu, 26 Mar 2026
 06:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:54:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWaR183q2zV2JdyXz=-PAPYVUg4FthVb7zX0E--Nu9wtQ@mail.gmail.com>
X-Gm-Features: AQROBzDOjjqprm8ONkegDcLY6zHuW-QzJPJ6tL6gtrR-q_Ul_XX3Xr42DBeHu1s
Message-ID: <CAMuHMdWaR183q2zV2JdyXz=-PAPYVUg4FthVb7zX0E--Nu9wtQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: renesas-smarc2: Move usb3
 nodes to board DTS
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
> the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

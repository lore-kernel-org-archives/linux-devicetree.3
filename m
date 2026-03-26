Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFC73F9F43
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536479; cv=none; b=XtPW9bQ23lQmoGTgPPIdmU4jtJ6lfpt7u0UV2lIAK3GjxOsbURoOaFB9Kze8PWXUylpO1QIfhJaWB8KPZomYI9MNoCj9SYgFLwriv+9/uLJLp53wBhUrZcyrllA4kCgSaw9OwArGsy5sAIDVZJBArMsYnPniN1BFYNBynEBLXXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536479; c=relaxed/simple;
	bh=Mz7743cLHKjDcfZBNnXTh/3101R4N8P42GWsc5M0tE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErNiIX9rXPMdb/kYrSt6RuHC2liMxPjdubkBHIO+4Wdn/X7o9LAFrC9Jj3A8G/R2WxuYHPpfJ562506f9vDsjxgi3uAy16bkMxwXwH6L/HslK14L+4FzdiQng30dAk2WAI0LTOpvjLbhBvhjkg8HNIfJRev9HJoVyVYvMdlbQiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b982518b73fso176164166b.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536471; x=1775141271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE2E786ICpZIcnAV4rwWupP+nyLC84JrXsMF73F6KhE=;
        b=fKEP54e93rU25OtF4ALB7AtgRQysm82yfRvLOmCzcFDslt3CCAdiXVylRPf427kgNU
         FtPARKxsQv8npw+rbWUEp9W/N1b7QUXDUmcOteP9g1mNNDRY2U5ohR6N59ZKrtLYCx9L
         4g5LlASGLhqK3l+Ip+hQ9LjkSItL9KwAwpCx9EqsMlF6+KOuA0rNyR3a2RGE0u14q3YU
         qy25FbqQFQYHQqtcdU40cCgEVD7A2p7M5e1pvyW/nwEvqmUfTRX4hKcFXtcoU9usJyyQ
         ylJ3/Es3kMVZKeuLnz6qhM1Y1vKwMAtVCBvta/668uG9d5r3yMIGnXGboWD9LC6kHi9o
         JyZw==
X-Forwarded-Encrypted: i=1; AJvYcCWxux/1OnS5oi7ibmaRQr/9DmGKaHAUllH+cil4ltgFOSipveDkeCdEsVZZ3dPCdUNAEWOOGRCpfPUu@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNVlO4DEgaDKKxiETAS6CinGrnyDe1QlAjPmJcqRnps1AmKLH
	aTDgQJ5+x5jBAe0w44bvebypaniCj1atBDmEswROKmXQovTuTMPPsFgUwssz9t82I1Y=
X-Gm-Gg: ATEYQzy/E23IlD8NRYYS/CXKQcDvbM8OzOzS+1tcR34+TFQqPIlCayhSzuU0Ltteaod
	sfj/UgtKOLg36HJgBD6v1R9VRScW8rKFY0i9gYZy0wp+GL2U91dKPEBInemwY2+zQjNnyoxDrTS
	VAZOI4Ip9eGxUftKTt9WHzzzmD+Yc5fk+vcg3XSPcS8TvGYa4BvyM1+pKSvcsheKtJAdXlQs+zo
	y1MbGzqtTzJ1KyW1xXUVv7GAFd4t0t9TNmp6FIPqmvlVQovLVZIkfDgPHjRqAadmuwf4+ZSUtbH
	BgbS3G7R4cl2XGnQlyAhNa0txgmYS32Hmk7QTIw+DdkTdJyZ+T15fpbDDTBMu7+vfAlw0NZ2RFF
	ifzVMZuRQjz0VEF0QyoXclIC7UQvSil2WE9AT3b0T8LqFyBWff5w0FIpKawTY0q/CviWhJRa1S+
	bhAis5w7ikvIkHm5dMw0k3ucaPFTGWN8GiLZ/Da9Yh9nudwb6Ri4kWvTT1vVr2
X-Received: by 2002:a17:907:1c90:b0:b97:4e42:23e7 with SMTP id a640c23a62f3a-b9b3470e5c9mr98723366b.24.1774536470873;
        Thu, 26 Mar 2026 07:47:50 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2225sm124349066b.37.2026.03.26.07.47.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:47:49 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso1371251a12.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:47:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDAt5GokZ4glgVctTcUZMCAwRQ8sgj/5LL5Ey3hjI22+tZ3pghkSUi8XweyOQ3XMyM7vb7tF0S0VFN@vger.kernel.org
X-Received: by 2002:a05:6402:400a:b0:663:6d0a:6f97 with SMTP id
 4fb4d7f45d1cf-66a826e17a4mr5435034a12.27.1774536469098; Thu, 26 Mar 2026
 07:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312082708.98835-1-biju.das.jz@bp.renesas.com> <20260312082708.98835-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260312082708.98835-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:47:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUV9XEQQb6bX40UoeNrs1DsueLWXcyY8wMGmrW54xPD8Q@mail.gmail.com>
X-Gm-Features: AQROBzBG2_5XR9iswvQhc2D8hUfkOYm4fbALofzpvMNtbuFoQlJK3H7uau0MO3s
Message-ID: <CAMuHMdUV9XEQQb6bX40UoeNrs1DsueLWXcyY8wMGmrW54xPD8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: renesas,rsci: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Mar 2026 at 09:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the serial communication interface (RSCI) used on the Renesas
> RZ/G3L (R9A08G046) SoC. This SoC integrates the same RSCI IP block as
> the RZ/G3E (R9A09G047), but it has 3 clocks compared to 6 clocks on
> the RZ/G3E SoC. The RZ/G3L has a single TCLK with internal dividers,
> whereas the RZ/G3E has explicit clocks for TCLK and its dividers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

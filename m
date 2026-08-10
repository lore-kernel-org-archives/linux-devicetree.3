Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B77199EAD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367819; cv=none; b=u9sUgo858oCIdkX2lbBW1Blf6oIPVwan0v4mpKxt40FeArDdjGpIj+VgRNK8jhV8geIl20N8MCIctmEPAed3kebX0R2X4zL9+Jw0QXBeCYyTywRYYzj9dX6aOULwliOgVlPBCjYkbEDDeqxYGj7Q4P4newa6Yx8RjwvKhjCVJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367819; c=relaxed/simple;
	bh=wz6Lak0uqypMbYCsIgZpyODVDVOYaTgDgwgpmJYESGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLsPNoN+9QaPBpALTLq9SpXmQoU8yzfgpa6BY5yWI9r8Q74gBmJYJTu6S9d+tl4q64ktI+e+hapJCApO40tbedQFg9nw8lUJP1gvEztv1Bk66X25FFsMaflzD+uIo+5YY3v0Rgd5AFXaCBvBSncnkvf87Bx0qPOSl/ax1Rd/qlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso1124590e0c.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367817; x=1786972617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2eRwfJFYjomfft/a1fhiXfMTFWRcLAVZWGYy0pUOEgY=;
        b=CYftiOQJrHoSnySyvv0HaOSCygkam4Q9eUM5rj8d2l5CUijeKiDmkmAbXzUHQjJ5GQ
         D/S74Ln3lOiUQMtRhc6BODYJMlyxLvXectVFALasIOOtCIsfv5+dh/Gfk+fS0lqP/N6y
         YhsyTxgcK1MUbZdM0h5/vOXtrwm/PJUNzY/HcNJs1P7DMan06Xe3soLxQARUIgE8YS5P
         /4jMhnHfP7NgWav2wzp1EItQWkcMPfFTfZ/BLKZdg08TxJ0Up1m2VNwyvMB5rYAJJFhQ
         Jx7u1Ounv9qIfjZQ1/gBysGaqrOH96eFciVZ/nypQJReJQ/htmHVECVE9PSDRTR6SHSm
         pozw==
X-Forwarded-Encrypted: i=1; AHgh+RrmrFBVJeZ8QqTBN02+yCFAcoDnmfvsG19yJIpuVj8sWwsryXAWnVKJgyRmAOk/YFXA0Rg2dFuVAisG@vger.kernel.org
X-Gm-Message-State: AOJu0YxvENPqvEDTR8ZRY6MeHgEAhJ9YOQTVEb3JzL+5fDA8kqCsniQp
	YpMK28xTHBUNfmkDaDvVB5q7vGTH8u+078iTZwoEDU6Vq8ipQ519naSDlJrlt0fG
X-Gm-Gg: AR+sD11E61TnR68CMIdDGiNDhh9KuyTkEwFjX9alapvt9qZQEHpQXZoGqHQ03Lw+tlO
	r7UTps+5TYROLyZTx/Q4b7dQ403+wIFqsf0BPCNDQ9qsLyoLR7DYvsHf68E0GMXDyd5Khmt+tMX
	d3vgtByuiMKrveZZAlHe0+by5fxYs6/qiCKCnwFAFNuFSzi+JYkD/V6BxyaJVgghVhaUWLd4Blk
	hY9IMkbg8hTs6j/tu/hYI0k9ji21RvcDtvujddVTLGIZPM3KQitWblyW3lBGi7vOJhyx2Dxjw4D
	LsuA63u27NSh0XR4zdhbrjrOgsqm6tXjSa8316KAMzM1Zn1hLl8iZzi0YXINvXM8mzZygAjeDlj
	EnxyetUio+MRcX4aiAgqkAqXGIugIQz9hDajJwTmyK/BHLuq1EYmuYLhYNW6/j+mRvb8XONWVjx
	+0SrdFwqQe4ig5FTgaKZdKTkhqLJId8EYwdEYWjpHTXt00lgJKE7z1uzap81K34JVyQzmjgDq2I
	Nywgopbpm0hD+Y4O+nADONbBA==
X-Received: by 2002:a05:6102:4403:b0:740:2bcd:24d2 with SMTP id ada2fe7eead31-7634b67c7b5mr7466078137.5.1786367817425;
        Mon, 10 Aug 2026 06:16:57 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2e53fb5sm3501338241.1.2026.08.10.06.16.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:16:56 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-73720e58dafso882505137.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpgv9M+VE/n6gNutYOlqQYy8m2vq1qZZ8cQIlPYXYXQnk/sqOjREQkpbAieVeBh0O6Zm/Y+pb1A02Uk@vger.kernel.org
X-Received: by 2002:a05:6102:8084:b0:736:e4c0:cddf with SMTP id
 ada2fe7eead31-7634b67beb6mr9095987137.6.1786367816536; Mon, 10 Aug 2026
 06:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com> <20260716095935.13329-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260716095935.13329-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8N46DbAzm8wh9j8zTpThPJxSHcod+Dkky9bQraNraag@mail.gmail.com>
X-Gm-Features: AUfX_mwPvHF74Oc-Dx3iRS8Mx6QncBSyuafc49W9lfl3q_2m7yCrJpaupe0_GAM
Message-ID: <CAMuHMdU8N46DbAzm8wh9j8zTpThPJxSHcod+Dkky9bQraNraag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: renesas: r9a06g032-rzn1d400: don't
 enable gpiochips which are always on
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 11:59, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> gpiochips are always enabled, no need to enable them explicitly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

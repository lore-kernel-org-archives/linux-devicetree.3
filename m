Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593E31714A
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147845; cv=none; b=OwFUEB8Eyk/f/r9kOfO5EgBNbXbEBqhRj2DJqWjWdbEQu4JGuF10EXIuDu8I+z5K+uAi7UP3xN6l5iB3uClFUxzIV0eeSXa4dfYLTUZwYLQPYlOJWbfTK9BUs3gDnNbH8Y7uMDEzas7GVgEHF3+/nTyUFoMohhPG6BheUUEnzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147845; c=relaxed/simple;
	bh=edl/piVKrs5OtkoJiz0xR24LhvlZrWG/37ME+V/oG4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIooHmHcKkNurG1iUD6CczNaUFbf9NkisKlJ46MsSoyOb+7giDo9MajrWuQiQZO4fQp8hEbBi/pxPx7nFbnO2ZSqFIn5OPoVt32LCt+Aad+KeIQJAa4bl0D399A4ccF8hudMUVlQwo2Xp7W1YXo9NZcGMGj6ZEGn6MXJLSrFEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5752b27958fso226841e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147843; x=1778752643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccgb4ZWN8MCcCOU1Q+Lq/+mMMkjF43VStizUiniPGuE=;
        b=PYRlhMhRfQNv3JdRqkwXzssjoTW3bYU7XAa/fApiEh7s86TtjhDAuqKyZ7yBO6ZbYu
         UGZVSqMKwFEJWBZdY6Ik0kVzTYBzgba7X9oN3hgxP+gXJ7qMEHtbV0bkVHtcquBhySJD
         6qTCiCJkB9iUsNi4xqD3WWuZcYW7kig6GMiprjjPZIT9H761gUGFICjU6rO8gLHkrFcq
         PNwWIA2/x151Jze4IA3lcAACJZqYDgcfFUjPvqnD0wzCOQ9DQ9a/w3HNbqigu1NG+eHI
         vUOl/W2TjXn8RAfvMjSBrgVj9EerUMNHK9mrEQjMcq1muwZxxtVghkLYq+8gjS6MChaE
         SV3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/uYb5ZIj1GjE0Gm1ZmfADgrniILDEcfCzY8ugOsWrSlZQQ8yvDo8sIp9i40/yPwQjrNAx3M+KgJKOM@vger.kernel.org
X-Gm-Message-State: AOJu0YyD63a67DABlsDtf4ZeSuIEDoBlfAIQ7tZNjYvEF3x5Y6ckPLSM
	NZjxDFWhU+vzTWgXuUqVP5drZ+bSmZmtNewcKFGVX/gNs9QSFCC+axsYiqtawFF5gF0=
X-Gm-Gg: AeBDieuayFfv9rHdnPfzVxLR/KO9xInqYQstjdB/pc2zho3danSIAkQilYTjsvrL/X2
	6mB9kXEITCLQmjJsrt6o2wRKkX9aZTgWYQMXzwvFxQ9FevLXw7sRGo2YVyXvQDGCJDSCxMVhsoc
	GNDyJ6ucWhq1LW77J8vkd1ZigLUt1bINa9vz89dnOjlRbJo0NHZGFzFx6A5LIHuzRSZE7ySLIui
	FuhC6klNHlq8dHZd2ImLXgr2NvATeLrKaIH5p+RKjzKUlAcFARUA5PL8HH+dMPHfmYnqXEVv9uR
	cJlBuF+CZmCvh6wd/95ZjUWE3e0NnfqRvVj1iolpXIYbK5uspgMFNhxfwu+KyZzg1y1+Fgp1j3U
	LqpRDB7y2ZgaRi8PSQ9yT6NT2LKFjGQ58CO8XKNm1/l+mtCFDumIIOKpDdY5XoHzZdLlQg7u7ty
	Vn8Kf9qC3AIYB4lY7xjgewz1tuSrj2y4FNvPiuQ4AuyIs+r/odJTxKV7udslvBp1A7VhDOZVEKA
	Nc=
X-Received: by 2002:a05:6122:1d12:b0:56d:9e98:4676 with SMTP id 71dfb90a1353d-575597446e8mr3966315e0c.13.1778147843212;
        Thu, 07 May 2026 02:57:23 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57560c80bafsm2467168e0c.3.2026.05.07.02.57.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:57:22 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso219807e0c.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++YAcnpa3W3Wd2tSjHjHLqWvUEY31HXC5kqYKtF54Rddwvia0SaJ5T+NnBZ79vCZcjDe6NKUbhHvTn@vger.kernel.org
X-Received: by 2002:a05:6122:6598:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-575596e4216mr3743417e0c.10.1778147842619; Thu, 07 May 2026
 02:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:57:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOWbHjPmKDm8Qt4YUf=s57iw9svfX93xGT8cs8J0vNUA@mail.gmail.com>
X-Gm-Features: AVHnY4LIh-6RAexuL5Iep_BX0eA7afS5VP6xEDhIHRNwdpWeS2ltwNzyuj8AWQ8
Message-ID: <CAMuHMdXOWbHjPmKDm8Qt4YUf=s57iw9svfX93xGT8cs8J0vNUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: renesas: r9a08g046: Add OPP table
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add OPP table for RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

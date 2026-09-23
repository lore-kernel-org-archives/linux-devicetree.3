Received: from mail-vs2-f16.google.com (mail-vs2-f16.google.com [74.125.227.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1574825C1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159526; cv=none; b=uLB1Ko6HRsN8AayQzgbmBXNbbz+5hBsBUKGdkFtFTk6W8W/6wyTK8MMoW3JpMLLGKkuiAfJWdvwxWijuOm/v1qBEZfRRs3LLvRxYEe/ZLUwTWy/T3pj0cCdvnp8ZTv9g7Z6YTGvPia66v2dPlPhLE3adiCgY/tzJwXadUjTJc+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159526; c=relaxed/simple;
	bh=qHmJ0LuimTPz5IfDSza+MI0wTd/JNm6z/p09kQHUHlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PI2pmjCpt28aGJNNQnnfgAxAJQ5noQLrLIYf2y33NjglRbtfzkhwyBQkfA2ANX33SI3iCfS5BFWNJBZf1fku0/6zVHn+9nqyDZIiRrLnLficcx4xhGpMW3VNyoee9w8dMUHDFqT/8LaUWjL8SMhwLivUm4FU7YyyJAwbexMlX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f16.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso323587e0c.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159510; x=1790764310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=otCNGSUWSvhuDPnjx1VVioLIbir8+cGg0W90YM641IM=;
        b=KQFy8WU6bO9HRTNZ8roS4YfYDOHiOPVBCzBUy6mHJu4uBEve6dL5hVIL1kzM1tVRBc
         8fP2kLMGj2FWFgfBVCjeXsCvvws6UibluTi9pBNkkpumFz8PjxTS/n2GT/YAMMN1Bocq
         jCKzbscmhD9zyFboNMIQK8qPeSpPE3q/YkUgdHdfjuSd5Fqr0w7Fas+MK7txC6Ksxz4a
         xUnaQv2tmXRpBnadJKBMZFwDM4t6+wb0W29GCMzAbF3ay2HKAqEfmLbLeRY+isihJY8G
         GhIzVs+1axZdsnhapPZ+/OBMz74D/KqDF75iJm2QIDXj71Ci/lQmseR9rc1AGK1OirZp
         bNwQ==
X-Forwarded-Encrypted: i=1; AKwUvByWfyVCm8XYiBDOG3H1co369xhxrRssOamlKxhxfAVkH1A0sziAXVylzpFzSDHDRn6Q/lBhIeAUqOqX@vger.kernel.org
X-Gm-Message-State: AFuF++k7CQpz3/ywX/itEIhRVWwzpxflQhhUP7Fdy9PoqiG50rYXgvcR
	j1+3YrZC2elXQ08VIGDhFXoU+6PLDwJm7qitaKqa8NsE2saq7/2ySeOZxOWW77OnmyA=
X-Gm-Gg: AYBFou2CztB9WEKayKtTvGMyhuTf+E6REFq3F3QwfpJt83Vna7zUCF5dSGWwyS7FG/a
	eA4JiGUyhlZIh9i0YpNofmAPNLfVwlQ41UxpfkhFz7cgSnFbi2OK9XX1Vkb/MY5QDA7pPQBgwMZ
	Ih+WQsX6iSNnNTcR4Eu5Ob1m+eAs1/DoGVFDn4q6aDTWwYjjFOIanPWJDfx6OdW2pjcU6yv1vD+
	yX4rGqga2EmGwuyoAGkg9srjaq+TNNFwuMAL8g3rPGBI5ogFxc9FWQofNDUmT08QQnldl02/P2/
	Voi4kxs+TdA92d8HCnhVAQdgnkjm1rZX6nkLBI4XiR9Zb14Idz5jS1RAMcvpkjDXq03p9xTemAQ
	MNQaRh5cSFYVVmbxzfKj1XmYBi+gYUx7srfEGCv2rGK1o2gQitkE/qIEL4KOAZs/OYVBoDErGer
	WdSOYA37QJrjBKsOOQ8OZQLXYLrJIKBvyqbuAnSXJW4qeHLOFylLtm3Ml6daC++kFcnHJuk2O+6
	+DosijuodiDkXGlZxesSMWFjbcZyBpJ/VRrEXfTE43Rgkko
X-Received: by 2002:a05:6122:6e09:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5c9f168afb0mr2531551e0c.18.1790159510014;
        Wed, 23 Sep 2026 03:31:50 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c161fsm2487568e0c.4.2026.09.23.03.31.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:31:48 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso235964241.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/yGH9uygay1biAR6BA/IrfapFvY55FuNjm4emBIFNWI+BIyGaFBak5p4azXl6e+lZXQmdgv325p84@vger.kernel.org
X-Received: by 2002:a05:6102:370b:b0:7a1:f971:78f3 with SMTP id
 ada2fe7eead31-7ac1de3bd78mr2006784137.31.1790159506008; Wed, 23 Sep 2026
 03:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:31:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6w13GNnQFiCWGkmW-=mwxnkuKJvp7=AF_xpb462C=xA@mail.gmail.com>
X-Gm-Features: AclHuK8KfViTXJxG4ecvsKtRjnbyEzEnCYUI_WTdfSW3Wds9FPM263MV1B6y2_Y
Message-ID: <CAMuHMdV6w13GNnQFiCWGkmW-=mwxnkuKJvp7=AF_xpb462C=xA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC Ulf

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add power domain indices for the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3)
> SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated commit message
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

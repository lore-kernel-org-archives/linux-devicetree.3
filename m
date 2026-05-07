Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD03822AC
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145850; cv=none; b=d4xVY0qYATaKnbD92ocvVcK8rRHNktpRhDXAMaZGo71Xu6YXqMT6HRzfnBysT84ax+y2Cmbp2XjECNySElEX3d8mRWsvOqYKbciiSK06dycKXpKdHvekmmD9WjtwDxf4fS2JdmM5/y9ireC+qVdREP+vHV06UXOqUGwhnU9wk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145850; c=relaxed/simple;
	bh=AMIb6q4EpAMzt52D+h3AqrP0Q2rrED/ImJNl3FKPJkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqogyw7SKxY5g4sWt7C3eqa4kNWok4OM8yrWZsKAXq4DfrKZiOi1ZHGx0D+UOF5jxiOBBA9dBGKFiPZt99djLi5lhexV9kmulLm03IkHjIMkw36jaaapKU0EJ47aGLB+Y3WutQuPQ/VHwreenEcD/XMcQANX3d0kBbBoYxv53eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95cda04cfd0so181489241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145848; x=1778750648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCndMd4yxjbHbIEJCX2AjFS4eFdSECDFSht1Q6asNeY=;
        b=aRjxL7cGiSLHKmf//6e0fNpXv2VVbxnixH43siQvJKE92cAMfJna7xRbANu8dpRqos
         8U0BDFCj3VYjKaDfxpbs63uHH9oDK/r1wSUpKzyaVhvpVnf1HZj+6PTmfiJoP6njv4VN
         NcIEyWi75ich7WvHO9Lb+F1954sFBWvuTFHK2AxKxeGFjejJ745AFnMFX6b1Zt+7F5YL
         WoxM0/QozcAUdDt2RNSKU3c2fpCIXdB5Hep4SDLGTU3E53Ly/+WMziPucYYufDUoz/ej
         ssH0GOSQpXW9fW36oi+pZE1yyt8WYSD59U8A7D/nq/ZtONz/nqnF1d0ey6/xIHssrf2M
         zuCA==
X-Forwarded-Encrypted: i=1; AFNElJ/3gnThxjyqEMWsdHNi8iH5kOrP6ZKqlz6V0CoawRBdV/FOGRldspCFt37VUqh6bnZ+f5InorZzzkgw@vger.kernel.org
X-Gm-Message-State: AOJu0YwCCsmHowy1tsfBJUdq8wXHLFRdjR7w3bPe3LrMktc6BjbqEYGh
	2qXeZHiUkY10geVVjL3As5I/YuP3G0rvTqphimZSYUUZdZ7UWzqYvoX8TiBCPPOU6vQ=
X-Gm-Gg: AeBDiesJGlV0bfYoLrwA62BTzqSZpYov+O+r8ZAYyEWUfUHeyV75C+O5sZzH0Ftn7bZ
	6sXcNUQlJN7kfZtFgktIMCuKwcQapqlphUrDMWShdqh83IFHO0Sfd+/AAzXmJ/lXi9NNWtDavEr
	gvyyo0Bo7suF48kct8edf+Ur2P7tdrxNRS+3RSwPaUlFsYDXZ5O6Q5Ta9/zOKHuwvx9FjuIBrma
	vGwj/aR0Ltn10pD/LYPUFJzFkle2dhdym1r85l+Y1dnEc3aL75Gd9WSW/XyrNWwPkGI2V776Fu4
	Ka7S4237ZjQTf19t8qKNKzt/3MU/V+nxRD4f125O/xPaBdX9qmBWJThg7whkbqlNxwzpB3Qvrtx
	zBfvPKFjILGf5gww6LlD26soUELmzVOS4nUsH3+JRfPG9lXlrptrnZ/TZItydmp09LkYsJzaND7
	epuLAnE9fv7F1HtFTF+syObKAHVJe46St/J2wB/+IKpRGe7tjqkUmGikF9UX2GHKH+CbvANI0=
X-Received: by 2002:a05:6102:2b9a:b0:62f:406b:1baf with SMTP id ada2fe7eead31-630f9022a67mr2863766137.20.1778145847825;
        Thu, 07 May 2026 02:24:07 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af5801sm10415030241.10.2026.05.07.02.24.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:24:06 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-62ddb07fbd2so223313137.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/yAkxDSW6xBfXoBy8N540tR+dCYLBjgw/398kr/0ZqkYFe6n6KC75XPd0m8DItLEmRJqeOAP6dlUNt@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:609:af4a:371 with SMTP id
 ada2fe7eead31-630f90266e4mr3464284137.23.1778145846187; Thu, 07 May 2026
 02:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:23:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWUwpeZocbQimvLwDTGXPyPJCePfLLXxXFF7LhJATbNQ@mail.gmail.com>
X-Gm-Features: AVHnY4Li4IX9mDo-taz0IkcBUseN0_iOnoFKhnadIj5uAaSwC2Mm4fb9GuMco_0
Message-ID: <CAMuHMdWWUwpeZocbQimvLwDTGXPyPJCePfLLXxXFF7LhJATbNQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk: Fix AVB0 PHY node alignment
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Trivially fix PHY node alignment. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

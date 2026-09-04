Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981D3F413A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526812; cv=none; b=aLN29XNRa/i6zM27Okwu7pQ3QKgZKUjOTNUeHynPG/RMO9ZnC/XcJYUVmRyKdCauhe/RRwpNdhmtXPfUwm1no/BnyosdKe08nQnIPi593b7VL9w9kea5jlhA1As1KrAPSfZX/wmjg96aP4BAjojPtB6b5ZB8Md57ERX2zGNbKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526812; c=relaxed/simple;
	bh=b+jsB/SxR9B4doq4j9X1OsN7P3v9KOS03k/c0WlWdws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CS5JZb5POcwlNphlhtcPaA/cAmlwHX06mTs4UEyGIFuCAfRAk6HBpNgE/7NQQHQ6c/whBFcNOF3H+HZKmjVg0iPTaoLW1NocX7w5vCzt3B5SamY0rfMGKdnvUQrJUSMgRlA71XIAeO0CtL0fbml1o25CuLY+7SPE0IQd0TA86qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso860009e0c.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526810; x=1789131610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d7GgODhxIjczQScbRESMbRZWtgZnkVvNT/nl7txte6o=;
        b=e2atI+BvPzMtGVmGnzB9rfBGSwy/1tp2TafnH/m6TJmWW7yOfubEG5tTT+cgtQDaZd
         mZrzA3ItGQyTz46PCSwtQKzY9CzGAFWqEzcIHaWZuRlARdcf03FEcDMADtJ61+pRSbXd
         fBpR1fAXl3aWoUoUlp7YoVolIIHphuYJzMLAT1NE+yqPNiodgcB8EWy+zdFFNTS1I3/b
         HOxjvkx8fOH8t7M17lsyLpzIqRhfR8/A/ElrFCdAcwCqEfIP2n5b2UcE3nQZIM6pO/gw
         P7ezNivS0tsMh4cMuPhZf4gWaH8VI1JAQznrvXqTnMIk2W6QODgi9bs+TC9xW03963P3
         A+OA==
X-Forwarded-Encrypted: i=1; AKwUvByMYkIWs6cKLTyZKeJkS1G5cCiITP2TUDkYu7O0+yE4iMkDfhx8nxPTY0MxnTG5uMuExm/g3DIyNkJG@vger.kernel.org
X-Gm-Message-State: AFuF++lWu5VBBCtThJkhIMmKFgtn2vwLcHCyWSAMNNJ0CzLlCJSq//rv
	WOD3e+a00Sv9vKsF6m4FCKP6gPUPf02DCZ/5AymTWFlOf+ktgyI5H3mFCjBWzBHgYb8=
X-Gm-Gg: AYBFou3yyPUi2NL7l0IAptqWkfpP6dCkLmOH1OzHUWOT1Ch1D+V2ZkgSphNK83cCbgQ
	Pz9D0Q3Id8rjljNea4tR/gOSShzC4lGGDmnFLi7y8AV3YpfnqMkC42KJIcWnmaHltLv8JTIllbg
	T/XVIOcIuq3Cu7gGnTC0wFZ4Bfd395tTGN+WpT7q5zJimVMM8jo/cagttMjKBSzXRJBuyANHbIJ
	+U91UB1gXaYZfJg9H3hvPwpIVXE+I1dkJiUXzeO3SSjvknsf6SifT7Tg6tc5lB6/xT6t2y/pxRy
	RTqnpTApFVTbrOm0zh9335exCYBu8r5ZXhd4CKX+l8zW19s1Bv8WDEaJwrTjeaGBKJHEaRO6IMP
	v0/7dZcA8mL4LXGfATm9ZqXoHO3K7/WKravBqLJoOqLq8p+nA/bCp4Fgk2vi6WfLP3hiaMMlTTc
	iqXJZ2CUEmOtetZLGPbJiuDOTsqr3dU0lE05tNjlqydjIkEM4i7OJkAz+IkJnOt1Gu7McShvGVX
	8cwTioOQAJa8Rwe1qbM4TNzNQ==
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id 71dfb90a1353d-5c7ed80403dmr2491346e0c.6.1788526809873;
        Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm1994872e0c.12.2026.09.04.06.00.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97bf8e907b0so639107241.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvDYv8hA/6ePYCYbtVA1HLscUlEKOHI/DnTxcDBm8tUe7n4dqWOWMMfzOawN5M21vXwJ1oYrIBi14F@vger.kernel.org
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-78a4a96d8c3mr1844791137.5.1788526809409; Fri, 04 Sep 2026
 06:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:59:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTw+rJ4fx+vuM_QdgXE4Bxo2LPX9y0NH3kd7sM2oKcug@mail.gmail.com>
X-Gm-Features: AcwNN1XaEv9Hx-TPYsSjIBjhBVyHhLCKgIrxqOUUTGt6324d-7yS_6EXvarXIyU
Message-ID: <CAMuHMdWTw+rJ4fx+vuM_QdgXE4Bxo2LPX9y0NH3kd7sM2oKcug@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: renesas,rcar-dmac: Add support for R-Car
 X5H SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Also add the familiy compatible because X5H is the first R-Car Gen5 SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

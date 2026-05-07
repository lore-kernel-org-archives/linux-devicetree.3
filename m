Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32537175A6E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146486; cv=none; b=TepNXcTQ77AASAy6+0xsJ7zSzql24W/xUduaZrLRHVUBzMQ+BlCKtaDqwC0LMHyIDjVisWMk8c9g2SEmEzBqaqIgU0O8lDpnVK8XZ6uq5L6zaIUc12pWjwoafz5FtjdK66Rq4ehPK+O2Qt9Hkl1N6jOuIwnyU2vA9SUiF2JTick=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146486; c=relaxed/simple;
	bh=EXL7itBy7SwyvckKg0HkmhYL9VAg/83tgztOvMxg/2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USe9sOEYlRgvR+rHRmac+00lGqb8DBPQJIDwf54J6XIewQZ74Cqh3eB7Ks1/lLLuAYYIc78i/WYcqYfIXXXvFvA2OG172xLtugeMZuzUs00FyhgLnrCqgHjh+TeSvNBb45jfvkhaZO52CO1VUxl6pNYvQrG9Yf9euWqPtvgoNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5752b27958fso221090e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146484; x=1778751284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=;
        b=Xgoxu71v9wTaDMFNXzhPOLYHOAbZ1c9oyf+EnSG4DNfDaPQXxjP1UbIBgx7pozlThC
         S217gH0XUfeKlGb2xG/XwcMqO5GzAaq17R3V+BNL5dQllbSpczkODOcXT1zWnw427nWe
         tReSG6bHsd3JAwLIrhxxEK3w0Nx0dW7e43T4+0fxCvuaHmDLuZiO2iWeN6T/OjxMyiz8
         2mw2L0ppsUNRsGIaZgjiZv603VowygLBeIsmI+sLGeCWOsDx88U5OwdAlengchkRA2Ol
         u/fTuxc5X+WQF1/CRUbVC0tQ3iVv+BiI4laU70DCL2rhg6IEr9flZQ3GzBc68mRg/aas
         ugmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ngwzy3XrG98Rl8v2l7CmSXXcx/ozLduI7YQSFSfhhZWA5e6iuTmAtIzOn0qEvUTPapM/90KdnE30D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IUWw5RBhNw9EBy0NqDms46KBH8XU44L0Y3XvlKKpVve/s2ru
	Gi92pEo1Erl6Ef79sCRt0r9thzGcW2wg0a53DuHTO39TNaxqYbRVJhA758zVNhGiEcE=
X-Gm-Gg: AeBDies7+sbsl+SXvJFBN3bkGtwGR4c3NId4tfmX9F/Xkd1Mg1exIiiWtsxWd33z2h8
	6YP1LdtL7bPZXl1lXKLe6JgHb8XfVPj7npyLeI/1sYdQh8PdVfJLnmfHsIc5TmtboU5P6Z9RSQJ
	XkExuWjIk3R6rKEy5kl0zk0AdBjrJVu+5scRHkG1GAp1QFRDL5ZL+lcgJhs2uL9AKDlWJMPKFYr
	gGkTQu/xydjkaNhVK6WQd/+0iDOyT2mm5bupKF5/6UTO/Y2hrF9n6YXWQ4aFbM78Yf9lhvpvW5r
	mKpYr8OwCJ2tLHE4Qj/Me0xuUhH/wJo6d5pgZcbYMMutRTxf/h7H6NcGBudULSkiFZZCESIVEn1
	GdcAAg0vweTgHvkSPKK6bDz4+Rw75krUTe3EiiGmhp+cMWVAnLD+3piHlTQLOimdlOrxzkSTQLV
	3DINt+SyQtB8e/rcziSX0ZhJ1GETFUWUmdSzAgUJAUjLHCEteDys8xyiUukwPyp1n4FrPId7KX9
	O5pFUQjNw==
X-Received: by 2002:a05:6122:1b8e:b0:56f:67ce:77cf with SMTP id 71dfb90a1353d-575595f0027mr3539088e0c.5.1778146483928;
        Thu, 07 May 2026 02:34:43 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6dc7dd4sm12992603e0c.14.2026.05.07.02.34.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:34:42 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cc8ac98bfso119492241.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CVuPA4aau58u97VaeBpZSm2YFaBp+gLnOHgZQ303/RGpehgQY7864QZjq2dwasQWULiTek80boGhq@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:606:49d:183f with SMTP id
 ada2fe7eead31-630f9060df1mr2849018137.26.1778146482430; Thu, 07 May 2026
 02:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org> <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:34:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxjMbbnU0DE5VZ_trgpOmykZtMogX=ENoU+fnP9r6j=g@mail.gmail.com>
X-Gm-Features: AVHnY4JrmA0rqCd6_oyesdTMolRy2oBM0JSfiD2aIIZPeGwPtc5XxCSK-5XF7ko
Message-ID: <CAMuHMdXxjMbbnU0DE5VZ_trgpOmykZtMogX=ENoU+fnP9r6j=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator-common: Sort sound node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort /sound {} node in the correct order alphabetically.
> No functional change.
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

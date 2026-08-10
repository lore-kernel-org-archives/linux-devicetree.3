Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66014322B87
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367571; cv=none; b=Ro7AcA7viObk3VWPUSqE89C3x4QDh16cCi3NvW9UsFEe+099pr6U3HybpwZ0zP2jbk8yNGVwJPdAbDVUBemgHyiFu7Riw4NowQt4268W5fLJXxbvABaG5nT9RJz7yIL6BZXx9UeMttXC3bOs7edY0Jp8HhojzR+C/W8U/ADrz/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367571; c=relaxed/simple;
	bh=MDiIHt4pFJMfzzoQaazMXxF6x94H52+tPmDWmY40+jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mS+Dc5YFrblITyzyyo64yt4R6Ir0mLYrPoAES0AjjgH65wBLW/LBB2XIWCUNc4/0JiykVcQZi8KzIS7g9/xjY8pZd3ZCGOKmzeexwaFr6NUjKuk4E50dJaO6x4SZ0mZca3L48dqSxfrYjLlF2mI+Xc4hlzAjINOFZhMJnM8Eg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-754ac74c495so352219137.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367569; x=1786972369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fUOVbZd6Xb+ghjtUrkja8gWXIgxzVDYDCvCRdWIg3Y=;
        b=EEQn6rF/p8uNO39D85kTmYnjnW18OpezC39yEH40v3qRXoY2dPMRmh570AlFC/aCZ1
         Hxi5hMEpmW1GquMMM+naz4Srp/fEy8U2kTKQVI17UQtFJSH80oyPu0pmyEQ79wUGUzLS
         mgixwtcpk1U7Puy43+qETTO1AF8DIG8ZjKoLu417bOqOggXW/KKuC5FxfwtXlPagF8LL
         Bidda+9meI904LoaOKaQn9I4YHx3l5zx9KwRFzZ1Wu4caOCeSYimjfSBTHY/Y9nKrCNa
         3a2Wb0LQzOFzZxKOiRmmdV/wgwSjTI/MM4G08F+eeu9CI22IPEkhyoK+9+qQqWts/NgK
         si3Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro2C3Xtw/5CPUxNFxbl8nMbbh3Qn6Q+JBJd+aDzpR/QjyLgRRXSbKMnoQLGe/XwUVeahCv5/i1pDcEP@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwVF6Q4I9y4Qal++/qr7zMsqJfkX2D4+7ND3xHChQRArKYbR5
	IbQInijr5nFB0gXTZUS97E0a9LCChk5XtngWnZB8zayLkHxqhn4o/+iI/0oqADOs
X-Gm-Gg: AR+sD11QbR+ldEAbtefu23v/8CxtaTIGZzsEzuUOaHhhgDC0FNrQVcwfP9BZeWsUnSf
	KNuXVirAaG7MOtZZr6Wyj3wdtffEFmymKJmvqQhkRwrdrUZqnr12jEuS9iLIPd6ks4YIG2wwik+
	4Jkb/8nltniKOz3a0PDu2obL5h7Bt/pEs4EGT0AVb8xJVOmEce/XpgpVleykHetdtBMUA70H459
	JIsh4qn2hsYQ4/OedtCjlXrJfoayP4x0Z/ROGQF2+c80+gODrnZMWVKwFOzCObjLZxAjmKH6YBj
	RAXb7PbjJflGbiKQIiN3d0Ny33+taRI/wRMZ9PZPPgD63w/W9Pd0a3v2vblL6ICsbx4u+cJNn3Y
	PnyH6xWd9+ij6hdF0HZmLmYqliB4/JXJSSCMgXFcmvW4e6tkPGfcSL8F/NqZeTVOFb8xiyfnmkW
	6EB7h0M925je0ir/EgOz0IygnEWFYsxec+LtQi0rKE7nyeH6Vvwpk2LqtS329cqvnSb5mpbULb7
	/uGWivpAcpMeCGMsex08y/++t3dah4ZbmYqsLrL
X-Received: by 2002:a05:6102:f81:b0:75f:e517:ec96 with SMTP id ada2fe7eead31-768e2db48a8mr325363137.0.1786367569204;
        Mon, 10 Aug 2026 06:12:49 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-764013edfc2sm4574150137.11.2026.08.10.06.12.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:12:48 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso852565e0c.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:12:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0rujDjpj781rFt6Cg2or1QIZvAoequQfrgc9Ea9sQYzVUh7LMFnqtz22pUrOFJDOXRIxl9ZVpQdBv@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:6f0:3ba3:7d84 with SMTP id
 ada2fe7eead31-768e664d4b7mr301407137.5.1786367567387; Mon, 10 Aug 2026
 06:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715105306.25147-4-wsa+renesas@sang-engineering.com> <20260715105306.25147-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260715105306.25147-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:12:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-0HD9AoVBiwkjSDB9a0-2tWuPHwjTPYQ7gE8jUEP8Qg@mail.gmail.com>
X-Gm-Features: AUfX_mzaQlUWSJzjmiThQr3A3bQUcIywY_poA2NcJ8075I1jVF1wz1rUsvtJafY
Message-ID: <CAMuHMdX-0HD9AoVBiwkjSDB9a0-2tWuPHwjTPYQ7gE8jUEP8Qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: lager: use inclusive wording
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 12:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The feature is now officially called "target" in I2C documentation.
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

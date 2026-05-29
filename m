Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE23A8723
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046459; cv=none; b=eooLHbAeFybXQibj3iDRjQW3EeMuciaswMzOO28TE0vmvr0oTg8ze0TfoIF4fYH83qXrF2+hc9R64oYAA5dnd3TjEtY98fTXkrEI7k/gwqoLM2rJkJ8Ug5s5Cf6Z+aL3w6nXhCN6E9ONaprvb9zNYWGvBcYCKxASExHYtnVYwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046459; c=relaxed/simple;
	bh=PRq6i2gXASoWwMkRzIq12yyh0AXMyNkbgK1/AHsxhzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5b61V/SzDEOawUKA6JMtnKgBn3w9JJWFym/eP03UYS6Y3x2vAln3CsReaEsvjS7l3qfNGiAIXNWn1Zi7qunuIVuQYPluSTTyLvAmRZaD2v4rfCPovO9EKZ5tXVB9oNCcDfUJcmIvGY12BLIkkX3O/TruEAxUzABeb+hINNYhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-632a055fa9fso5035263137.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046457; x=1780651257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xueodFuWkXkoQ/z92fB1Zs3IyOG+T8cVDetfkk8StJs=;
        b=HGe4ufa58t8JceliW7JLwf0Gy6UoDnBUn9CZh7YOZXbDDTzsMvMU7s2OS5ihIIj4Ug
         uCCrd646TeSZkcG9j/XJrwReBcNydSKZnUJSzD4/E5JnjxTlt+7BaBGnxJGQr63iTvC5
         sVte99KschjasN2M7KgnpdLfqQ8GlW9WwW1fVKuEcU77GYN6P0OGxbKSDjN+YyjmBdC9
         FqaGWVn3VC9QP5e2Vj1gInidvnoTTXNbGt3JCk+npjzC/adJIcM9P204f+/C/rxVK8O5
         5LM3uITJMIe/vr3fKJWBABSHwBYP2FIfHLlkBx2/MjhDsR9uQctKIc7B+jNa8A/Xef/w
         owFA==
X-Forwarded-Encrypted: i=1; AFNElJ8tn2kVOq8uCcF6DIQnmFMg3wl//J6rOuOq56cIpSSUFlQmFmmcc4QGz6Iy6n2huQTVKxrbGG8fA1R7@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLiTvcxODXTyPAMDsYdcRKTTluhrI4J5o+1oc8GVNogMNMz/X
	llaualvGjEuiuPAIslmZI1N29IO6BAtbsl+IWdPLC0seah5B0/SsUjyxIuBbZ0/CEkQ=
X-Gm-Gg: Acq92OEI621OFYu+1329MDf+XdiDHFeLsR4zAimb1BxRuLsfNyR3xn8n6G0ZHOQLW2y
	xx9G9ZlFuwliCmcnQ21B1DAl8o7JEIrd/RKPitwzW+TKJ0Pd1xc+ciD7sGoV5nNO1w4BvVBR+Tb
	SVaX1/gT1LjAavwiuL9PEsAn/CpqYnBK2hoZu6MIZdGm1bicG+JdBv8TdYGhrp4q5WXpquxkZZX
	FdAYOx3qrbg7/TwgPtieQNO6xf5DxQDcTdjkPdS6FxbZjLh/QTQengbtLzfzn9FyCG5b5NFsnz/
	8O0yphi1FsgfkLDvlbIJBjpgFYk1LFVSlKsSlgPXKDRlkYi0ptB/ESLd7N8ixkW93CowLq5KzB+
	rkm7RYMnuL6XX/J4WL0JX4y5cF7tdkSONEyr0nX2FLKdxzYBk8w2uDBWo6YCGRPqCrxcB8rKJEJ
	kUrQ8xix+XD0M21Xytw6IO1UJ9I+o/ITytzxD3dLBrvtkYjya8TGTYQVZjj5gQs9Xg3No6f0LTE
	agn9iNTJg==
X-Received: by 2002:a05:6102:688f:b0:62f:406b:1baf with SMTP id ada2fe7eead31-6bf4727706cmr603562137.20.1780046457161;
        Fri, 29 May 2026 02:20:57 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfc81a9db3sm715737137.8.2026.05.29.02.20.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:20:56 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6312a0d556cso6453500137.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sW9upH3GDKwv5oSCUtXZ9GdRT77KQChjfRMI29wys/74VPldvnb2RzXXg3wOvr/yjj55Yjj3vcucI@vger.kernel.org
X-Received: by 2002:a05:6102:3591:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-6bf485aeab8mr513831137.24.1780046456060; Fri, 29 May 2026
 02:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528074615.91110-1-biju.das.jz@bp.renesas.com> <20260528074615.91110-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528074615.91110-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:20:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRcHO-UPQt2iqDEtV7mjEwWswb+dveKwBtrj0DdZ=nig@mail.gmail.com>
X-Gm-Features: AVHnY4IMsBpJnZSc2sJl6Y2vvnth24kAgKugtJrt_UCspTkRJi08dEXNPqnEnRU
Message-ID: <CAMuHMdWRcHO-UPQt2iqDEtV7mjEwWswb+dveKwBtrj0DdZ=nig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 09:46, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable audio on RZ/G3L SMARC EVK by linking SSI0 with DA7212 audio CODEC.
> The SSI0 signals are multiplexed with SD2 and are selected by a switch
> SW_SD2_EN#. Add regulator nodes regulator-{1p8v,3p3v} to SoM DTSI for
> reuse with eMMC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added guard for snd_rzg3l with the SW_I3C_EN macro.
>  * Sorted ssi0_pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

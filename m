Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465AF244687
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609343; cv=none; b=GXTSMkyeZe5LziSfj4qwWP69TsXpqiIl6oxPko7PEdWzvT/n1qTCOckv+ex4en67VMIgEoQFzs1nxo/0XAiB1noRXflaaoB8FFEKxW/dUH4HKnA9IOBdEZWHLWePWl5//+MMQfZhDLWR+dQql1cTI7ZbMwQPYv7CzDBcEJtAChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609343; c=relaxed/simple;
	bh=5tZ02EgSvxOdXygbK1WQKObjr5Gj2i0W61ocHuGcBkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmhf98qDP9k047/LlDEKsOaqNEyCtaNK67QBrKBBZTMzvhN7azDN9N308sAqDX3XIk50mWEWnxN08SRKFcEBI7VkmllakxIg68lpkW8WXCQH4bSQyJnzsRDFNeLFO3VsOXF1rpP4CDGE9k1moXskLEKnjxXTcDlsWT9BBNTHaRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3422217a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609341; x=1784214141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P2zRt7Vjhk8Sqd+Km3YG6LmL4qUqvLlrRLlJ0jTtj5s=;
        b=IEtV/h2+wX5BV+/aw97OG31JIJXZFxkTCeMqXZrU6VTr7NYRp7nG7+8sRCAhzZh5Nm
         me2nYw9d/EShEquPWjOJ/taJgibQLL2Lb73p376sE2y174lzN4hqSSten5dTbvoGAzS7
         OeRlAIF3cK4S1ppkzBGXC88cGoTFQap+uCqV+tZAVnj9glrterie92y+m0JK4WZymVK0
         rn7lWKgkM6yLYcFrUEN2MpuVd1fZssB5WUxRBPjOqDzUOxR84MyYWpEc3bfh7fkzqF9A
         7CBcD9yE2xlaLJh9ptrkuNxznP1/B8oH1YNruM05TTbiPp++/D+qjn2prGcSTx5xFPkE
         tjGg==
X-Forwarded-Encrypted: i=1; AFNElJ9G/qQxSUET6VMr+WR6IMZ630csPrLD5O2LwaLCTxgyKr4htio3KYaEDMDlLwHmhDDWZJEABe3ZsxNH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nIMi06wlZhepFEM2y3TkfsfOu0Yr/UieKdTXBmcRcK+Js0h0
	k1WFPLwcky+8Xv9veG5n47ifbxfuW12OjRNHdEHem/4m6xkVYwAyVsVtc6LXkIiN7W4=
X-Gm-Gg: AfdE7cnsNcjNQpyf/scw+LNFh/uoG8zjBltbcw+ev4qNVrm+agXUsVIi7RJQ+HCUjqa
	joy1opiE16sKI3RUhH7LpVgFgmbmbnjDo82aEazOEiXu1lI1w7WwlTN0KtIyDlJhKaRi1sD1aCp
	8qt7SNj6pL27qk1P+ePS/OSlQI/BaCd5R2XbKcZ2kXsHbxuKjsVEC6vnjXurGyHrqtzwq1QFHTf
	JBaz3bMi72maZR7mAOfdY7GDA4X7ry4E4CcWazPhy9/DqEo9coI9eMtZoGUqcAgscZfiCvOcnN6
	dUPZxlFKmcGgzHBnjYDEL3XFmq2kT3u9g20VRbsQ+UQ1CvDmEZgXabTXt+V+GCpY6vaRjh94D3W
	B4VGwe8OxFW/b1Is/In8yrrxVlRLyl/cG/Ep+pw7Z2iR7+N/uVr3/PJrTUv/5Ikq6vt5Jr05f/X
	HrYih7TX7hgzTZ4fgO4MWFX0Qg+HXO20aeSrESPdcxkjndM20JDQ==
X-Received: by 2002:a17:906:f59d:b0:c15:e853:1a07 with SMTP id a640c23a62f3a-c15e8533634mr177768866b.48.1783609340229;
        Thu, 09 Jul 2026 08:02:20 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bc41esm521159966b.37.2026.07.09.08.02.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:02:17 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698b6c87884so3359153a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:02:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrRlHs+UU/5I+TUSvDTFVaCkiPuhPRduaBIG5Xktk7rHGfnUqi8gJbDE4S1V5RQYyvco+CrGEYxbvh4@vger.kernel.org
X-Received: by 2002:a05:6402:360b:b0:698:351c:979c with SMTP id
 4fb4d7f45d1cf-69ab445ea92mr3246600a12.2.1783609336821; Thu, 09 Jul 2026
 08:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708163311.222176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708163311.222176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:02:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUasWiEXYoCZ2ivqQaKRq=S4J9Sn-D6Eu8JycjcVE4-kw@mail.gmail.com>
X-Gm-Features: AUfX_mxK3iTEhoniQD-rddM02fNhgR_PZxB2vthnAkaeoLfOdf3o1OoJYFCLKJI
Message-ID: <CAMuHMdUasWiEXYoCZ2ivqQaKRq=S4J9Sn-D6Eu8JycjcVE4-kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 18:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Formatted the ranges property so that the new line entries are aligned.
> - Corrected the flag values for dma-ranges property for pcie0/1 nodes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

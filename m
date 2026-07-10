Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5264195D5
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683714; cv=none; b=Bfemywf6dezbnacGPl1iXWXe7btG6ojQll6y9lUhKZCZ68R8PhzPf+X0CkB/IpbSf7y/r5qTpPDeQLun5y+rtbLd4aoxupI+ARgq3hmNsqQMZMGuSim5+y7M4lKE4IQG90G1LOCrVx8nX0fjbNdtb8NPIL/cYPXaKYTsovnycJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683714; c=relaxed/simple;
	bh=cRN3DIVjjRem1Qh5/ryc/Kj1OzVUK/3+j5as2jsZXeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIUDxkaNZmTDDnOuHgo2xQz2UVWVLSJtaDFcZmTd2zcsF8eQv3kTeKPTxEhp67Kwqit2UUu6qIeDG3JpkSsY9j0YtVlM3KWNH5zQletH/1RaJriQLhKeeJ6OKqPSRT6EAHpbZH2GBFoWMb54Js3TRBuctp4ecNQH+vc2/WW66ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9691bfc9f81so470854241.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683705; x=1784288505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWZY8wb8dQToSEMAHOYY209Fxx7jwySHPe7FkR9+aYI=;
        b=jq2fh/is5HCd/iITnQ+xI57iA9+tSCyeKv315kzGX0lOJrRoc13kcMq+y2KrGEdSZN
         ZpSfE3Y7IvVbAOA91d/tw3v/fRcf2oJsF4jg9UxMH/wNoUq7t9Pqzn9gXrtPNLHF8vuz
         3Tu4LYuKeMp/NM8ESf4q+ZQGQwkzKyuwBXfGdeg+08fijPUfD3nI7X8hMBfqSLvKrQ6T
         yxdtG/wQZAy4OAiU+WK9QTUJaZxAR/Kd9rfdQ3UV61n5erMvaZQejaXHcn/fH6J552QB
         x3FbgN4gLbjPjihQ8nUvh5COLV2LRRBwNcnJh6cumTqPKA4gpkuQ+R+KbSWkSTj+kZF7
         Dh6g==
X-Forwarded-Encrypted: i=1; AHgh+RpljeAyk9eyeOqER3s40j+FtTHSuPCXbaNX8OmFnnKcnzBnMGUgVHuC8iR07cFtH2S5KIeMf7QKqcPP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5qprrFmYfZqEbckJRTIfEGfgwHmp1FWOTp28Cn/FsOPvm8Jyt
	Ed/+ZBM1wR+bq3CUj8zC4HOWpS+A+brFF2e7Yx9IgC3EH515KgnwUq4bvUdEPZ69X8I=
X-Gm-Gg: AfdE7cnnqz/D1Lf1ilRK6D6E0CGW4r2oMdrAWe8rHAJvCXIPDNdpkeIbDL/FNGXAm7B
	LkDO4vyYJKUEwW4QStriaBZgxeual8dFUlAWenoqoigk30X0YNzArpdKbah20ENeTETeCYRLmMa
	JHk//zoz5rGRnPih/PJZI3iqdOv3ImCtneUFvnoNWnQ8FKpLSwpJH9Svr46kYQ6RKNw3CN/giJq
	asicLOYpvFsX3mwpKVK+7L+ss+1SRJxYWOOe9E9f2TmhWgHb4/Kjh6wovIWLQrlplYmIvs/ItwQ
	kFjB/KpP4KnY0Xmw9Zq3oEbAucfOAzxY5mYmWwmMvogKMqWzF/sZsx74IwU6fG3vo+3tr3hSlUu
	onpe3UtFBiaTzDwhgEzHpZ6YZ7/YIrh7EJbQz32PIcqM9hu8yhm/vN1JKnEyJjsM0IXJkdbeAUZ
	OimjZOyW2OlRBxJVFaS2/YwNPu5oQYjNOhmn9YSJoZJ/17X5202NQjYg==
X-Received: by 2002:a05:6102:1628:b0:737:80f0:7885 with SMTP id ada2fe7eead31-744e00f6d8cmr7447816137.28.1783683704993;
        Fri, 10 Jul 2026 04:41:44 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6771d49sm5348696137.0.2026.07.10.04.41.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:41:44 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so201962e0c.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro2xJ3s2AHlFMzU9UoHYqLcEuPkdVEwEg+NvHVHp5+mwsCgRaylDV7xS4qk8fw6EjeMmsbc/mn6c+Gu@vger.kernel.org
X-Received: by 2002:a05:6122:793:b0:5bd:fb78:5461 with SMTP id
 71dfb90a1353d-5bf75a9d4ffmr6525009e0c.0.1783683703846; Fri, 10 Jul 2026
 04:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:41:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJP0tw3bOiPzEg42pS_cXgH-cknYRK+LM6oJODubGsVg@mail.gmail.com>
X-Gm-Features: AUfX_mxls9AoCaoJG5OMri9gWtJ-eSjx5f-xCDGMN1hXVtUnNc89fbMo53qNAh8
Message-ID: <CAMuHMdXJP0tw3bOiPzEg42pS_cXgH-cknYRK+LM6oJODubGsVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add USB2.0 function
 device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.
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

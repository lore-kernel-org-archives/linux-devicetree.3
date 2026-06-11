Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA3355057
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164522; cv=none; b=mb21YLfdnRvaVCb6DCwoK4dytDLhrRjxNAE9OKXk1eAowXz97SLMtn6KrjBekn0PsO3QSD0uq4nUxT/w7yjF0OJhmATHxjPgmEOj8fctv+i5Pd935hO+WcJ+8iv2++Q8TVgiKnREJK6sdavkj6koDdillGxP7MlOg5QBf+Uk3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164522; c=relaxed/simple;
	bh=5zL0Z6X7165+7ISPsPo8Jg+DzQNbIFkl5tKsObApxbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQw7+Dkhu2zXZ4yh+0rCVXn9C7GB9WhnPoGJGyEDqDOryzrzElG8u5XPraQRkl6Pmx2bPNWRX9bfXipP4ah4IMYFbhsa17Ket5bor0EI7lljzJ1NP3TMUSRU16fX5xk3nLZO+4Hxe1VuGMUv6XxZs8BFsXwOGnsooUM54bpapMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6cfdcc79789so2998296137.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164519; x=1781769319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg1AD3f/1jWyYR3P0Z5p8wEPI+MYZzqh5FcI4v1k2P8=;
        b=EeI2Yk5kP41GS/dj811wxXNmQvJoatIcSrzkwQqFcBTG/UpsUflfnutwh0Xa4bUBfX
         cP9RQwE/Z8tyVCNxs91kTlXx4PmI4T+3OyLPCTuy9cDv9DqLPxtgI/hGK0qnu7GJyUuV
         vsGF0vj1sIvj7rj2uMxw5OzizrOQh49UAzdy66HJ2uoXNjvX8sh8eQBo30+iPZXHswIs
         /7R+Esk9SoNOQmcXx8tHh7q1/lnMpnyorjwDm1RbgRScXeikKlCO6x1GS9GeCEVbsB0x
         1jIIiBmN1lMP45go2v0T3awA+P8A5gAUDHicivtFpj9C9NL/hqNUyNAPzF5m8t1edxb9
         woXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/59RZUyuQCLSQOome7iaiW1Ywb2mJIOooPyqQ9F7BRh3MHAaWlUFkrI27IdtOGyVPMz0wy7guRPOo5@vger.kernel.org
X-Gm-Message-State: AOJu0YyhycBzd9H7i2rzADVQVsWlacFv+Feil1BOOp63cNTrxiLAFgGp
	JGzla+Xt/d07uc0p7H6/TNz7UJl+R6Md6bLDArLeXG8ky94Bfm20TTUaWUbleXRlMDo=
X-Gm-Gg: Acq92OGcsNwmRdipOrL4Ofr2SrID+Cp9tz/frmr8sgQ0/1+QjO/8B7Wxk+/8byV4YB5
	5lBNRnkRUI7XjWbj4UICy6aY8WVxJVT+hcohGXQVBHCbZSZRAz+McZxPuMcf3PmQoIg8C7sGkge
	funlHCQpCGjuPQW5+rFSHa8G7TSqOy03XgKAeUDV+qDquMZl3KvPNIcERMb8sZZIJaZcOBRDDQS
	SzGlTEi+ZQyAomUyqLXBhmeU8czQXY01q/hv3WV/PMr30SlJOohmcxWbwoInoM73yKeoRXBBx36
	pFFgyQyD/v2qwfdpa6zf4JyvpUMeoA7CL3if6f/0dSPD5L70eTtXZh1A/TUq4faQUmzdtneNRFA
	n7Wo7M2isSi/CFwG/iDSXnwFYB1yhntdsg54AP5If+CqzWHq+c56xLT4rcma52CWTlL6zE/AzE1
	W2SfBaimeagyxb/dubYTxa9zkGK3udBVDSBL0fc0s8/cpapPYOQLeSfYLerf7nFItem61jasZo8
	wTpDPKcDA==
X-Received: by 2002:a05:6102:f9a:b0:631:2472:e832 with SMTP id ada2fe7eead31-71d5d99f84dmr432849137.8.1781164519324;
        Thu, 11 Jun 2026 00:55:19 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96662efcae2sm442665241.1.2026.06.11.00.55.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:55:18 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-96395a77d04so2376875241.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:55:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8LdBAh9gxDjO/IlwewFHHbVKb48VyxS0v6KA50WTnnu3EyyEZAD0LLoIo/cA/oUsTRIVsp1gKORTx@vger.kernel.org
X-Received: by 2002:a05:6102:54a0:b0:631:28c1:155c with SMTP id
 ada2fe7eead31-71d5d8a78fdmr441637137.7.1781164516527; Thu, 11 Jun 2026
 00:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkxCo3p6SEB4a=wUY+qXE9AxqmYtsGyLH_+wb_e328Pw@mail.gmail.com>
X-Gm-Features: AVVi8CfMFk11kDzU1W7A90vpbtR6Nnss2ELpEbzCC4jdTDTJHmSm7MM16QZwFsU
Message-ID: <CAMuHMdVkxCo3p6SEB4a=wUY+qXE9AxqmYtsGyLH_+wb_e328Pw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

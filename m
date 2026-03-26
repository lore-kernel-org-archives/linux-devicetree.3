Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FBB30DEBE
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535304; cv=none; b=d2+gBBzZpeTMvdBIt5rWrfI/DGm7o5Nw5MwCGZjmL8PdfJOwdJtcQCCHaUL5QOLTqMx9jxvSJ+XkacXGRViB28mhH6ycQLto4MqmfBhHgpVsGiaqs+16yJs+6CZ+eRdBBfdOvoASu5PdYuKTI4lTZ3gzJckKxGi+Omi5ddbRFZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535304; c=relaxed/simple;
	bh=Qu3UrdHfRGUo+IQpch7jHWfBEGOhd/gFnZp38a4AiS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMDDDhtGcvb7r4fdrkqbitBtwE9nw3ZIDAblSHf+sc3puyS9E2hl8pc+pdvZgBDEBf3tY/EhIebNpL17KIbh2roHIzgzdrk5teyJQKzN0H9egJRHPzheQTdcAR1noe5hXz4dysTXKT6/95tQxhjEvNLQ4Io+NnCLm21HcpE1RvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso495513e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535302; x=1775140102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx17fbCum0HxJGLiZIM7+APW+qVuJWwyHiukjhC23hI=;
        b=V0BGkqTPYKshGylu8dxpU1OkJwpaKCweVCROnnA2PSx+IJ5daHtnr03Oxtrpkyct0f
         jXP65QW8oAIM2uGNE5fjrEbQCD+YCF8+22Gfjw28a+/OMBsK2KNQunebEY4/QGgh23pM
         yHbZAi9w9e14VDILL2XmzM/llkGHIfvE6kT+U9Rlsg2ZL2nQcpV6u+wbMWbxHw7+wrXk
         T6R4VSXQqjjGB80pZ0wHrVhJq+1vti+WO4ynJMwJzCDmXS7vtLoVq03Ic1x5gZZdivLA
         5XuTJ228Oa/sBTMGLlmw3U0qLSGQaV7go1Qm7GmYNaMDCGNHxfTRwE0Nx1cWkYMmzyc/
         DNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdJAux7aY0jOEJCqZgORpjYT3GbZvxlvn035DtzMDqIEN8xv4ATRbE57wV4obAQgib4jHLnwBx8uhH@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQCOOXn4fcroHhnBAGngSfS3s5rKlVrBohqeR1d+BgVeXR9ij
	MV2FkPOFC0cHoM3o8dosSCe+NiMOOZzeSwISACO+FrH8Xf97rvSaUcPuJyvUGydUHXc=
X-Gm-Gg: ATEYQzz8i7UplQUfbPTji8Ai+yTDgYMA4Nw2DT64SAKAD53agANb8JFmDkFgyEVMM6F
	uXvewDgy6Oej7ruKliK+GxZWwww+TNFfmdUvOpwuUmntHn8ZUOKqx3ywJ8P16GCMDS8NT+FgKvb
	fhA0fc3+wuREKjET9iIMHqftS8WZ784mzkKg67T5E4KwtnSzxUwE3eebWfo/RoHHoTNLY1CMRqv
	QiMEPvLm5kJ+ylMIk2qdSesNWFWoWeJqwX9ZNjOD4IkFlIyS3tcM9ye4y8W7rPoE9jzthWrEm+4
	w6ediWXiVF0qMWTRj4HGdRUf8t7qPFi0XLDYVocttIbnF6Jp/vY7WvVj987wKop/FHCL9ZsaOme
	K9qiQjMDvpuUqw7OhP6Y2gt9auWCrJMh8LU9WP+SyLCemUF9xhynwXM7G9kD/hOxwn4lwJHaLf3
	kFKqxalzdfJO2NvgI69TGPsYG5qFjH/VyZdXqgaWyIGyb0aUhdP2+bJtZUrBGfS+fW
X-Received: by 2002:a05:6102:ccb:b0:5fd:ff75:f41d with SMTP id ada2fe7eead31-603872ac3b1mr3107850137.24.1774535301578;
        Thu, 26 Mar 2026 07:28:21 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1a149asm3766161241.7.2026.03.26.07.28.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:28:21 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56cde757d3dso387876e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnh6QVWT7O49H66Os1w3rsFRWX0Y3bLXGWYtEIlu8th4ghgYV1vinF43xSvF7SvXUSzPPWx6q5gGOy@vger.kernel.org
X-Received: by 2002:a05:6122:62f2:b0:56b:7a5b:3cee with SMTP id
 71dfb90a1353d-56d220699d4mr3816280e0c.12.1774535300726; Thu, 26 Mar 2026
 07:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com> <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:28:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQOQwZ9qgVaqWNrhA2mVe-5s5QcmJHD10QheSOcOn7qQ@mail.gmail.com>
X-Gm-Features: AQROBzAhM3AW6MrbB4cFj6sp3RlNTps86eZahrOvjSYvBr_GjZzQv99EoywigDk
Message-ID: <CAMuHMdWQOQwZ9qgVaqWNrhA2mVe-5s5QcmJHD10QheSOcOn7qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 08:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
> the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
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

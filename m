Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C90E3C3C00
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050316; cv=none; b=nXTGhSvnkTB5Yjo8kUZ5VsHnDk/41letcWPadaIVyQtkoCFFjYubKGc8U4vscwYKZwYWJZqNzf9OBsjNZLLyRMm/7JnZgbROecx9AmeoxtLR/4SnZjSiN4gVYqmwbScLsQ7caK037tJJqWIqqxjg2j+J6ELwqK+CvhuGRAUU/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050316; c=relaxed/simple;
	bh=8gSmBNSDT+HnK2uGYP23vyXqndtNWP44MPPrOSdU4wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6h5NwqVwjWLEd1UK+zMOWOWfqNwT+j6J774mYw0aP5pFXWonryvXvuPYoa1DoUDVwuhopvJLmDDN/uTgLSMgZ5XUbCYqqFLgBkrIUtMNwK95yC3Pfd//2U6DfagDar9r1Wi0WNr/YwZ51hN3WMJKgoWJ/Ktqcp4SABKPk5Kydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso482214241.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050314; x=1780655114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0EZxtk5WIR/qcU6NNuzZqxIRnzjtF+VNY4Zkt79Yu4=;
        b=XfpW++aKpim8EvZWLymTiU85gb1fQd2PMlW1+fsw16WcZ8tS6P+UpA3Gk3c4N8KS19
         tFT+rbyubyABcuNFsCmHaSSvfsU2D+DGtxd87r3SRO/BjUSzzOzGqV8FQM5UIxefTlzF
         6B5MsnJ5yErqmffaphKrYJDRPvmVPv8zE684GfkkN30MLJedoT1i9czHqKJEX+HEy2zX
         qNmuf2bxdrVXQNl/Oz0+e9rDHDdpH+EhwwcBF1WpK36Rm2WQwoNLQpGDRv37/+YA1/+I
         EyP/Gb76TzVxAzOIwUOkv0+8/sNu3UUuW3dEhKSKKDKMGYVKjJKfNOEfzcBK7nkYEvBz
         +LSg==
X-Forwarded-Encrypted: i=1; AFNElJ8KkDcfKFYxZn8MM6X7zza221OQqtJ1k0/zbJ0VToKC6gU9oTI96zZkqeo70xVidAKEzzv8WeqVkKZq@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJ7f83MY4PGblfqU44xIfLZsKhZjx37huFw2qS2DkVgkRLtVH
	SlMRM+YuW1uu6MPyG41l3iqQynTDuXymjDrmXn55A8394uspMDtO5RSGmsEam2iZ9i4=
X-Gm-Gg: Acq92OHJ5aDDob0zc/Yze0quk4aDaCgdeLoZwYKSc32OdcvfMO9h5eQc/qkPLzBGWjE
	2K/FjRpCeP0EC8mKbuSZzgAjWVGL2ZvU702l8f0/X/C0usqNbpGMziYGEepGnVZ1vcsw9/2VhbQ
	2ZxZQMLG7rFD/6rpz11DtBrN2RdnPe2ks544bjy9pbN4tFH+4+bNnaqjmAnNGPPqzqKH8TPBXp8
	wBcSmEd3XuG+lS452GPAc/q9HI5OUQRnCgsFxsBsJS0LDAjlz3esOFUIK6WrM2ycb8kl0JgIj8N
	5fbPt5QfWW1DSahZTvAfVyXoOGoGvG1Drr8kw3wtC7Vpr7q+1Z5fzC3AE40PZHbbwDdk842X5Ot
	074ASy3DcfNFI6nPJQ0AxpEd7OPWtwTg2cLIGo4G1OeJvHWdn+4ZB0My6pzZBS/r9mAKBK1DbEG
	/7F48Y8Y/XDoV0/g7DZRnd/ZKD5fvSeLcNXzjXOBhxmD9hMcWPzLNw0D8ZkcAJRLj2lMkV9/A=
X-Received: by 2002:a05:6102:3e1f:b0:631:d445:171f with SMTP id ada2fe7eead31-6bf0deab632mr631127137.15.1780050314013;
        Fri, 29 May 2026 03:25:14 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfca34f6basm702530137.10.2026.05.29.03.25.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:25:11 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so1028835241.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:25:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bu6R7rVdt1tvJ4ZdcXQ4uEOAUnWVMC8TzzPIEZht9MgcfYcgtu5rX3PLgLWED/YLJrV+5B8hbnYgk@vger.kernel.org
X-Received: by 2002:a67:ef05:0:b0:631:4ad7:b367 with SMTP id
 ada2fe7eead31-6bedf90a3e4mr558585137.20.1780050310734; Fri, 29 May 2026
 03:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com> <20260519111958.233194-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 12:24:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdk8Wi2oJMycw1fOrRTbqYffOWfAu+EqyyKKjFK9sghA@mail.gmail.com>
X-Gm-Features: AVHnY4KWXtuGqVum5tZmrAlM9wycIRJrdgJpoHPQPKh-iVVLq2Z9RIduSEcQABU
Message-ID: <CAMuHMdVdk8Wi2oJMycw1fOrRTbqYffOWfAu+EqyyKKjFK9sghA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 13:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
> configuration and activating the rspi2 node.
>
> The RSPI2 pins are shared with the DPI display interface and the
> two cannot be used simultaneously and it is controlled by a switch
> SW_DPI_EN.
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

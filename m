Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A0307AC6
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533328; cv=none; b=MPgBYyr6Pmb7MYeLC/p1FKKh5oWoVV3xxmD69p1YhgQ6Y+HP12tuBSh0pankMiuWBjTfiv2pXixE09uYdergetlfzd3+qmDKz3wsFripI4GNAf66+z8oOwAIRQHFB4ekmWOiuqplH1H/9xouLMXRll16KZ5EzRsy0qnon1m1SGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533328; c=relaxed/simple;
	bh=BqVzxxwA86UD9pUCKKd8k4HfvcPEqtCoQm2hTa91rGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYt4NpQ8l4x7qvkL628k6d0SdCYTVH/5Af6Sg05k5YRFt/Y/gRpBuGuZ95X3kDYyaR/1k3xFS7rEkfD3KcCF/j9n2Qnbwqona2IawMe4qxmYSiAYwliyWArMNva7Ic9AOzuptnM737iL+0CsHv2sKEgVfOZ0ZTgXytuFWooh/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56cc8a021e2so669613e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533326; x=1775138126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO+FbqAgMS/l/OrAPFbPc30FGp00FfB0y+WOPSOhxmM=;
        b=WUrDF+syVlomnKttFDGDgETyGgMzQ46mDrY1PKo+mJX9FeUCSfpxzy3U5FkAr5lIr/
         KSEtW3xs2V5IbIF7akCpdwSXRB7AjrC1DosHYXrEIFqMIKi7xkNrLngHss6MW6clmunZ
         QRU+5Y2iumrTH5AoVhb2GRhs2SdHim/24WCilRHSmwjEhxcfsyjOkazRk6YiSqQ8gyi6
         ewNnPg5zayKlXpGVQwfLnLM6wDGWUbV9wqeInzwQsPWSynQwW35inxIBGiZe3VYu55Yc
         R/LCldMEdhgDiEgLVzRGa+/BRWGkrr5H+5seFCWGGuUTPTu7Vm4EOp9fz44dic/IqOCo
         EA/A==
X-Forwarded-Encrypted: i=1; AJvYcCX0tb3rb27wdZLS0ru7wUjacgnw+6QAYalPxNvuBDE1qVkXEhNz+hYTodwca7Qs4SdlycRJB1pOMYqD@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5dXGOuH6TIxX5cGiY560dyxteH+AhHz9i/Bsp7Uqy8Ad2M9Q
	qxfQv0RWBfb50jInUJq1/nCFCOSvDj4WUsfRdMj7IbV0zDFMbwz18i81U8NGAKJz1Uc=
X-Gm-Gg: ATEYQzw1L4Erz3bE0G40JFN8Dj9Vh5KD1WuJS6fhKQaNz4F2aQFSPjaVO28JKZnXdqn
	5pZyFHfpjylz2CQmIQGi8jYCYfxmvAjsR4+NqnBa0Nf/BZOf3H8cbXvzEe852EXHTDxSSE15MeI
	1MPlB20J39Z+vpzM2n4Wuy54Fn8PcJg9RptD/joBi/JTc4KKfF1bMLKkwYqYaLtlIRjNLheqMnQ
	VX+9ZLV8lGwPBiBwsAQSGiUhyadW6q+kCIrZk4d1NJuS+7r8lMEvEJ6eHq6Yn+gEvH361/vGfnb
	W+IX8mSwyUsTsTk+wqWxRGwMUxuUR/7Qe1fJy617Nyj1PYZWG1KeDfvHPBKATiV52nJ79qcsCh1
	9T4mJZESjYo9s0FX2i/giipVydT7Tawmf/o6247jed5xIQnAYFU4tdgV/HpB2g3vArlEu7+Jwc5
	2gD6Fq1j2Wv6GEII4j4X86eqoAZcAPahOGAP41dBExqkBXKHzW9EF/It5JUj+A
X-Received: by 2002:ac5:c5c5:0:b0:56b:9534:c06f with SMTP id 71dfb90a1353d-56d3d6395ecmr452613e0c.3.1774533326482;
        Thu, 26 Mar 2026 06:55:26 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf74basm4663170e0c.2.2026.03.26.06.55.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:55:24 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5fff13d5a19so1419837137.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:55:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyW2MVf00GR0atMJm2rJYIIVRrnprwWzrpURjnI7UD9cKsiZhs09cOhkoheHmNp5UoEsogJCTTtHCu@vger.kernel.org
X-Received: by 2002:a05:6102:3914:b0:602:aeb1:730 with SMTP id
 ada2fe7eead31-604e4ac80bbmr587618137.6.1774533324225; Thu, 26 Mar 2026
 06:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:55:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-KW-d9v-Fp-MAg6JSB6o5FqC9U1KDbf2Ay2Fdi9FGWQ@mail.gmail.com>
X-Gm-Features: AQROBzB7sxTkJhDW8HcwP8aExdmtdPeMkeDY2fZPSNNJ9aG78EfyJ0tUfq4ycyw
Message-ID: <CAMuHMdV-KW-d9v-Fp-MAg6JSB6o5FqC9U1KDbf2Ay2Fdi9FGWQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: Add initial device tree for
 RZ/G3L SMARC EVK board
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.
>
> Added placeholders to avoid compilation error with the common code in
> renesas-smarc2.dtsi.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882B3C3BF5
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878122; cv=none; b=CjORYNiWbhg5qWmscYhtL7hv5cuh9KkWHwXd+NFFId8pil15MyxvhJhs5dQA9EDNLrSeT/1RDapgDu+MeIZ8a67QHlXQnlIhZbXOt0+LP3yNhFKSLl1qXZn6zO0ygixuflrmle4t2p0V+hlG1yFvJKKJpvxJK3UnNaAGfl8bsNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878122; c=relaxed/simple;
	bh=/kxWTA52BAt2g4WnQqRpqhpA4ac3KQhFlNL2rViCQp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsPRMaGJ+FSHVHwJ1B1l/Bqs2YGmE4E+R6Vq6ez4s1K988+an1f5Y+uhsHrL89jRNUZld7PKMHTVFMTFJnpsQsbXezTi03szOkBmCfbYjcmvMdtm5ZpY3IZPerdfspbUELuUZgy3OS6ckIG0sHmVIHS/c8+LCUGA1gSaJMIvxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b23f90f53aso22973685ad.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878121; x=1775482921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCelPAg5TqeEG1G1zPAvcyqOUxcgqEhU8AXcqqEt3aI=;
        b=Xa7ztUg602TTlLwkLw+8XNVEuQK++nEo8a4FpmonZB4sV6/9SaSJoP9VbwZnJ51N/s
         SjWhdHAOH9uw9240gcedYd81Yan5fMDJmi5kFTIVB4jwV+hic1114j4DqOFOTI8t2LtF
         RaflBHXYQNQaRZzjAXJ/U+/Yv/UH+ri6iQLYGTESMj1paOFQMU49u/opxxutlWyMDXe8
         DcgUyg1qeM1CRDiis1Xu5xtFUSSxQdlVNSV/HBxx2iLILFO/l92JMLs4ODQVHzpc8ZQS
         5BhrDBrrSafbq+XsckUMxiwwOTqM60bPuLbzfzoQ6/2NFgSkWvuyITn1fpVgt6Z6WIHX
         EvJg==
X-Forwarded-Encrypted: i=1; AJvYcCUA391zmgXYQz6tBeljGU3vthbaIzLqFQRVQ0f1RjL2ELT7rI7gFsmU3I5g4lHCXvbjDJyoIVZcVS07@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbC0drHLe/Zp/VTq0PaIBdLokIRW0e4ADZofFfas+tJ4TAF0e
	M8CejVrqhmo3GgAruvey/JzV8UKx63oJVBiCba/yKGxHLSO9aPHTAHKKBsnmznkt
X-Gm-Gg: ATEYQzwcmvmMunWw9PNyAWJbQBwTqOX8PVf57z2E92ESbxQkoFodhcE86nHTUFYpmsh
	ZJnE3LC7kQxeyfU00DMoZvoy6Px8XLb1UBq05y+m12EsBYoBt8OjNOXm/rYrWQQK13CiqIRDHmY
	Vi4eRnUhXJ44avlNzQwlfhFdtxRbot9S6Gh2KYNwKIKAxlefEm4Sb+T8gd+vj6WplMeVsxD0E5o
	aG9TklOntS6/KLu5/R+5AqZjwvhkwU2imAyAo4myjPg/dd7J0Ywvvko34n863Bb63Agrw+75+by
	0aYH6+Dnm4j8cS5lKkTl2kw7MZr7xx6sxr+OCHvckKAwu+jJqtVM1wiIpDihv1U+H0bOSlY8zOa
	o3rubI/ZGzdRMVIwmOZM5K1cRjwS79na7R/LKgKapTCnSSDJ2bqoUB5wtl3MI/kk1Z1lc7VGWsM
	O/L5dqPgRMhfY1sQzvTlXjnNi/rZTdFKZiKFJu5lSxfli0OQlydogK/lDlmZU=
X-Received: by 2002:a17:902:db08:b0:2b2:56bc:c6bc with SMTP id d9443c01a7336-2b256bd03d6mr27171865ad.40.1774878120816;
        Mon, 30 Mar 2026 06:42:00 -0700 (PDT)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com. [74.125.82.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427658e4sm99454545ad.48.2026.03.30.06.42.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:42:00 -0700 (PDT)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127380532eeso158781c88.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:42:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPryZ7kVlF1SusYF9V/fC7rfOOsDkwzwQ6wI5Ax2sp/N+oWly0anDHg7AlHjc5s2RXTijIJRy2aEOW@vger.kernel.org
X-Received: by 2002:a05:6102:2b85:b0:605:26eb:cc1a with SMTP id
 ada2fe7eead31-60526ebcfa6mr1670554137.29.1774877621873; Mon, 30 Mar 2026
 06:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 15:33:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
X-Gm-Features: AQROBzDj9P2QcJJ03rVKxKEo5zx-Wow-J_zNYCm0-1wsBhaAiKvmNzwG6-mGiTE
Message-ID: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for Inside-Secure EIP-150 crypto block
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pascal EBERHARD <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Fri, 27 Mar 2026 at 21:10, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> This is a series adding support for the EIP-150, which is a crypto block
> containing:
> - a public key accelerator
> - a random number generator
> - an interrupt controller

Thanks for your series!

>       irqchip/eip201-aic: Add support for Safexcel EIP-201 AIC
[...]
>       crypto: eip28: Add support for SafeXcel EIP-28 Public Key Accelerator

My OCD tells me to ask for using "SafeXcel" consistently,  ;-)

drivers/crypto/inside-secure/eip28.c: .name = "Safexcel EIP28 PKA",
drivers/irqchip/Kconfig:        tristate "Safexcel EIP201 AIC"
drivers/irqchip/Kconfig:   inside Safexcel EIP150 IPs, gathering
Public Key Accelerator

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

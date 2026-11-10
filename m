Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310729;
	b=bM+9wffmIsKdwaZy3WtzHn1ud/RG47tvyACAIFU5UlgYW88YwNVBLkp6mpnfJ/MMRPEc
	 g40rRIqQ3dpxJV42nUEXfGxbznq0HeQxw3DuOkn54UiZTSs+CwOkQpPNEFt0MNNZVmEXm
	 Ps98ktTfVBXP7AELwNhshyHObL9i+8ChY8uU4PWP4gwRur3QfeeNgMn6jzBCAZXvPi0O9
	 x1L8IlBF3yv7tWjD/pIWIIZf5IJbmeXAfVLDfiqf7gQfAB3z0nTL+W97sP132tPFjzQuQ
	 GvkthVI0rIKYXVTYR16Zy2niMW4mwypcS5Onl1rsg14A8VzL8zWBDooBypLHPaZ5U3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310729;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6I+JHeyZuaCKZLVFRW5Ed83CP01+3aMwrBoHmGNmzl8=;
	b=jU863bfsGUaUpXl1wJkr82yNTQnHGS0QDOGMFKyq/AN1bcjQb7dERYXOvQT9EcE0P3Bv
	 gk96Qq0EN0ydSZufDzy4e53RmChJxnQfQQShyusm62d+MIu+n3RTDaKiOJ3bHAOYym2vm
	 Me21Bga70PlDy60HrRJSiNuEuECI3x7KyZG3odjtGEi5jEUYE5e0cVdhXjoA+kBWY3hk0
	 /eRfwH6k+6ld9wtq6ioizpNN7d2mIe2s22JG788AIRjjZASgZP5YLEC5neknP248ZSIIU
	 Y1HSv1xeSfPIVjlndDCohZ4nFZaAMkTlI05JiHNhbmyRvtmgEmMooQXzk91+GNjYjVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0460A2603
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D0460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1222654e0c.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310728; x=1794915528;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6I+JHeyZuaCKZLVFRW5Ed83CP01+3aMwrBoHmGNmzl8=;
        b=XYRcJf0afeY6+yjhM8/MtMfS13zmW0YOoXQlQRVMVyghqwiMuKYkz4GbRXOaIZptQC
         WQYlYzFokas8AOMoZody6jxxCZnREQgJ7w0upAlOQSr7LwHnyJQnXwJX8EJPvd4WSqIG
         Yrf2wEKXZ4b9/NFfHnaP85JM/2zuDEO70+dkF7yUcJRt0wATgRqJuwDoOao65D7iCRpb
         Rp75vihR9WSENfLlYBlEoN4U+WURpB/J+R+TzNCGLbwbSqFkCrXqtks9eVsHpHIHVfms
         EwGjfPEu5AtbTJyrfdBZmsB+maJUAWfZB7BKKhuYW7g+zYahLJew6yFqQPE5YEmEDBcP
         UbzQ==
X-Forwarded-Encrypted: i=1; AL+hErFbvBaex597lqjXG74mZCjfc/wkbrJ69K9I8N1vLvDe0s8HbnBJdlDZxwqnn8ZUBcU4PJd2vKLuCVHq@vger.kernel.org
X-Gm-Message-State: APuU4Z9B4rBUIZMzG3QzLZoeQfYVxeG97Yc/v0fA5Fq2eEzjO8P49QcE
	fGIs5gwxo4NMB1zK/y5g16T7/6r0WL8A07H3BJgKfeZRvTX1KoqXnNbfiFiff9R+jlE=
X-Gm-Gg: AYBFou2g7wIZgvZ9j7axq7r1OKdnFXkxPYIgCmtPWR2W5e9hcai2w0TWppt8DeDmYci
	KrgBE6L77e1Qc4K9sqYrSu+bhpzPZAk+3aPW3GMaZlXWCTPjWSleOtE7ziG82FFSBfgcieikG94
	jGKGxmbm8jd0QDMP/O/v/xryDylqNHQgC0SoPwYZWFN3HBVteS3NDLE1xJi2joxTzfJX7Clf+bo
	36QoiCE/1aXBftji7A5s05OpBqQw/e/PNMxNykHu+ZCuMrjzJRX95WoiuklHISbvG2mnX2+HK5U
	dR4swGCpMjsyEOkgJgf7mtXY/D1XV+26V8rcAfrR8rG0xMI3TeL9/x6TN3+I/OWOcv1xNqIxpCU
	9DZTPHaScdpQLrB1eVvX3IUgpasFb+RVwjuzYuSOrTA1Eps0VzhfvYzd4aaG8s/roXN5gtRq7jC
	3maip92zQBFvthKGQR9EhWna/KZVh9XuL+tRTg3Ba4exN+ehjJB+OkyDg2IbC5fYr5zxUYvM0ds
	iyoAB4RiFMaMjbLl2bpbxPLmflTx87ivOkWH5Wm6bQO0gu/U7mdmlz3THgdtR1WWenuBa28yMbx
	k59TBNeVpUPRHW2gRosdgdInBVOjb3YjN8wAdTAt0hl/oU/g/fteIkEVcDGoOfrbrToSVZY=
X-Received: by 2002:a05:6122:8ca:b0:5ea:d247:adb0 with SMTP id 71dfb90a1353d-5ee0d0c6e91mr907607e0c.4.1794310728391;
        Tue, 10 Nov 2026 03:38:48 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c2f3bfasm1544204e0c.0.2026.11.10.03.38.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:38:45 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso1155676e0c.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:38:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9Bd3qAo6OK8yOKIpYRcDfNWDUuHcjKwNZny2PsluveUZGqVGMHqZm1+rHX6paIJpPYeBXk4BsiXIr@vger.kernel.org
X-Received: by 2002:a05:6102:688e:b0:7a8:1837:9eb9 with SMTP id
 ada2fe7eead31-7d301c1a90dmr782422137.27.1794310725440; Tue, 10 Nov 2026
 03:38:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
 <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com> <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
In-Reply-To: <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 12:38:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
X-Gm-Features: AclHuK_lxOefaCYe09vBlve1NogRGIcO0y48-fj-2S6VLM4EBEDUoZvwulW0sXI
Message-ID: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 10 Nov 2026 at 12:28, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 10.11.2026 12:08:49, Geert Uytterhoeven wrote:
> > On Tue, 29 Sept 2026 at 16:19, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> > > On 02.09.2026 17:15:37, Claudiu Beznea wrote:
> > > > Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> > > > fix patch was added on the CAN driver.
> > > >
> > > > Merge strategy:
> > > > - patches 1-5/7 should go though the CAN tree
> > >
> > > Applied 1...5 to the linux-can-next tree.
> >
> > Thanks, but six weeks later they are still not visible?
> > Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
> > resets in top-level"
> > https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe-mkl@pengutronix.de
> >
> > Am I looking at the wrong tree?
>
> I tried to get stuff into the last merge window. For various reasons it
> didn't happen. Anyways - I've pushed all queued Renesas related patches
> to the can-next/testing branch. I hope I've collected all the latest
> series. Can you have a look?

Thanks, LGTM at first sight (I guess Biju or Claudiu will scream if
something is still missing).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

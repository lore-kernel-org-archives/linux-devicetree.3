Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF2337F8AD
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897301; cv=none; b=BC0u3LgNrqwbOPr44cXaF6pg9arImDv9UUn7dJE2C23www0U/oKg3TjSu1JZzqONjtju/AkzzW1PqgKZRZFGGsk9O51Ph8K9S84nIZqwOY+XSd6eD6csXVQGritszF5uep5a+DSJOeGJ2Qi1RlAlw2kgPXg+DDshK/VCnTl/Yu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897301; c=relaxed/simple;
	bh=zfaGEqI6chxhQqt73siO8PNnMavfdzhEHGno2Nsy2aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7oNh0gn1FfrKKEOpHmDGd/qJveOSpZuiByRWi6Hwqu8ay1QrwR/OipXj/aSCGL5pa0ILqZGEY9MRon1eQcSg/p/QWGzsmLaD35TmElkYgzaYpQKz2YFQmiANEgKGCZvYrtdoJBRc/w6XN33HW3wkebGhgi1VlSKuKC2zTnNX34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95fa7cd1392so9007891241.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897299; x=1780502099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OvpwYv40ugn5nzb0kctzJjWJ4ravQczj2OqWNZz8Y4=;
        b=T2isb+0jSLh2Qk7+yScY/VTQCKVy+N1RJKGC8OThkgYQbDdKffjgRpAWNeC3kHeSAr
         p9Tl5g/TKuCXMO9ubrvfV524iZOH2OACQm8NgVIbFbsi5S2yxoeGv23/lRR8tKR/z8HO
         m5ssPOIk5xCwfBRq5JZObEO5WXVIeg6U9m/nKi21m0h/7NyK6xyT6gH7bxt9BgEPCBoQ
         cgE9wwncIKRzix08U2JcQxXGfSDSuyMBRhI92fuCrdW+Nzf4Ry/SaM+wExEodlqf3KRh
         2UJB1OF2cFn2xqP+UrA8287/ebXqmrldTTmNUqu+tjQOSGc0L3x6PnFrEP0XpT6ICpn9
         aeGg==
X-Forwarded-Encrypted: i=1; AFNElJ8lIVhCH2YSIP0+JhEEOJsbW2+zPt92y6wNxloYYKpsknJbL2Yl+hSzSvQXj0Pjqsorf8HUpcP9ygt7@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbjdhvBC0+wdUVIkz+sl6xMMSc0B3uaI7ha3mY6dO/SBL5tqH
	u/r5y0iiZNZFsRbSxvCkv+c8N3K35QlcXTlp62wvJWIiGHdo+AKtW4k4E4DpjgSTE1s=
X-Gm-Gg: Acq92OEZyHiQDxR5nEOG8pBO/pz+vjBH8ZR73K5cWxYx1dfi2hF20dmlb+Yxdcth64k
	V/Ix/swVLKh6rutpLWWqsWP5A9rPDwLpejgzWFNo9me9c2RolC0UXRL5jC9HJhVrjbJKcKfu4A5
	JWAUr0eVVcIcXYJQAJUEBat3nUlFR75JLlBv3A5Wb9Fak02bgR7COU1xVUJ7YI9yIxjPUDeLhxn
	qqJHvwXnRWCAurIsDK0ARhqk8hZkQ+074GMpA/gg2rz7YI3cgbknt1I9PivFrKgAvoLcPWoHTxI
	GNCIhg6KBOROn591ZBqtg1Kvs0otWgY57dP6trMFmWoiwzVkOqvbXnYclSg+uYtxGs+/fBdNK0V
	CvbD6sk0WWjfkPudOB76M3Xbjzrsl/EME9lfUdJDr9Oy3/Q48BLjQzKvzfKebyzqAmWdytgw1RY
	MNbTYDhRO2Y9cloUUhwh6dPEvJHSFvUgl92zRHUHR7fPuJlgQMFWEyf1Y/w6YQ+LRqXfGgri0=
X-Received: by 2002:a05:6102:b07:b0:62f:3abe:907f with SMTP id ada2fe7eead31-67c7cee41cemr13834830137.4.1779897299228;
        Wed, 27 May 2026 08:54:59 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9014bfsm16568265137.5.2026.05.27.08.54.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:54:58 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63169437ac7so8946872137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pIG/wGSl8F6AnaeJUglUVFz0JLCh+x//IWLmpvWT9iVRvQh6gGwEW+LCctPgwBMTky+Xvta+hM31r@vger.kernel.org
X-Received: by 2002:a05:6102:1494:b0:631:28c1:154e with SMTP id
 ada2fe7eead31-67c89aac621mr14097897137.16.1779897298730; Wed, 27 May 2026
 08:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:54:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV49XYzD9fog1z9skeWXfkYLTKfNByMYbY9NeDMPD8Awg@mail.gmail.com>
X-Gm-Features: AVHnY4K7YiBz400JWSj4tz7v_P3t75Z4hEgU8IL8Jk593kb3giueL-NSNFJMwvY
Message-ID: <CAMuHMdV49XYzD9fog1z9skeWXfkYLTKfNByMYbY9NeDMPD8Awg@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r9a08g046: Add DMAC node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the DMA controller device tree node for the RZ/G3L (r9a08g046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

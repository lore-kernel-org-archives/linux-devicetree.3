Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D536196E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613112; cv=none; b=U/6lCIpqw0G6w5FgmuS6E0Kg39hYzkZ65M+NO5J1bZhuN+QxuKj2UUCPtFYnoNYs4buWZj+e7dSh6UkqvClxJSW9iChullRRXR3jQEwqI5fmYJ1CC6Zjr7fJHM0pLFkU6z+t7aFgqZqzXFARXvPK0B87BX0BNgAljaC1LdBVkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613112; c=relaxed/simple;
	bh=z6DTFuPGv6FWaGZrtsoIb4p3tEuSyUOB0Uv5doIJz9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoiPx6oY/Q+1uRR2/Mp+WRRjWZHfTdynqQXxIcuLLAjC114pa+1AvZh7hqNMi3GAunl57+S+jBtJ0cteaEhhY28VOhaxY0IJYhu2PrMJwBS+MPw5QWMx7gYfZFlKyIiKL2rLQGxCgVjJ1s3/3+lSqVcZe39ddzJe7zoCy+oUcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966e7380109so1359115241.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613110; x=1787217910;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RqwpdLB7TrtYeRCXVjCM9omQuKhZ1BXK2srBTA+xeu8=;
        b=Uc6OZzW7uaCMmXgenweedff0oadtjk0og3OEG3RLa+BC/AT9fwMjkzIFBn3O3T64Za
         YIr5rLFUtGW/mCP7quSLQRjqpm1aPwEskRfnE10/6dqAs5K/yb5aCrnuoPSAv1XzkLem
         OkPlrGr7N0S8HvmyJd4ElOJ3xkb1r1myPnuRseplyeFTlbxhFFZjTbGC+7rEzuy2NxYT
         VS26xaOqqHr1ECfrjUDvbsJ2rp5qO+ogH1uxwsWAxlm4ee/ri4+E5AdoqCPl1XXeyiCB
         4pd+vu46kkMYvxvKf78tv9DoBgUgV/Z14M6rFX1u6IKjaT7o8mdYtywPEBXEOAj8oCDD
         qk4w==
X-Forwarded-Encrypted: i=1; AHgh+RpSNC6rJTLdVrTbTkbTwEk81Qx4MsE6daElZzP8uPSEeiNwup92tq3s3EV3Hy/eejH5PqooDqNUFjtD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FGmjLVBcN5ozh7NQblatFntRNofGIGQeJ+6lC3QXUMqzjIIQ
	m9Icd84CXPqzEJogzqVu/5fjPXRMy5waQ4AAaTUsn3qqP8u8vLp94MRi9fQLRmOu
X-Gm-Gg: AR+sD10jb2Jtq0XlMZZaCz7aBR+QN476m62gUAG1yB8nD2ebuAFEi69/xYdKwZNn3mJ
	wK4LLSj4GfHFZRl53i3S4aiimWag6TxzTRsL8Gf8H1b/1yc7PFo6Uj9gmNzm44BEGXx1QcZDX3d
	4lrV3HRglSjPEWLJT6hDUfmvb4gET4qZNlnQHqC7QZQobxrmbnFOHyhLzttA64TfdqRtYztsrGI
	9He6HSpcp72xML28nIaNBlM/B+L3anI3POgIw+rrTFJKR0yfa5V/eqFf+6BnvxJ8w8pPKWaRAmc
	mMVR/qEY8mLcefrh9lHFUxybyTmsmHJLjVZY5W8SzrnQtIlCePGdK9b0zRBC/ZncgpU9evEEKWT
	7afUtkN8VVZRpncbwNDx51VDo8DQkD7AVKTo9b4GytS3vzTR8h60Xfj3CrjsJFhX7fa4Ywub8pP
	VRiwJrsLYPZXrd4NoX8NS9bFK4ngUneDFEN9J5Aotu9L9eHLwMBy4+x6RmYIYFc4uoTpv8jJD08
	1l/bLxpvKzf4PsH2pJgpJXkyA==
X-Received: by 2002:a05:6102:5087:b0:73e:9fae:5845 with SMTP id ada2fe7eead31-76db1e3ce77mr1434081137.0.1786613110073;
        Thu, 13 Aug 2026 02:25:10 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76dd0b55497sm772981137.2.2026.08.13.02.25.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:25:09 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74a9ac9cda6so1007621137.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqRcuLI9XsYMltGJwo4spwW33cNCN6BXQnkUNoTvpBWD2sexcCd/qkGnSTMi/cMzJHCAvWiNXjXCrJq@vger.kernel.org
X-Received: by 2002:a05:6102:6441:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-76db5c7dafcmr1351180137.5.1786613107801; Thu, 13 Aug 2026
 02:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:24:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZqUkbc7KkLtz8gkecc_sN6tWPGL-2RHr8bck2YaTC7g@mail.gmail.com>
X-Gm-Features: AUfX_mxVPm_3gsxNaBlrWbODICSVqywR-fBDbmO_OI6j9jQTtSFIdCtCQE0EErQ
Message-ID: <CAMuHMdXZqUkbc7KkLtz8gkecc_sN6tWPGL-2RHr8bck2YaTC7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r9a09g077: Add DU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Display Unit (DU) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

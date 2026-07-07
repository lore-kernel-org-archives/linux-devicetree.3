Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C541DEF7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432434; cv=none; b=Tf1VGuaM6u7nfZb4qc6Ly34bXHq/n3ezt2lSlukjy/C9f6wgC/oB55ZGEmZ7PNofzeuliKgYLigmCHK74jJnOHoJP0PTiLZyNwqdT7F9rPkNPRYXNSiCtHeJJkGjMehoZ3CkeaRHe/2WQSrfolNSLKbUb5UBa6T7Qqc2BtUFO2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432434; c=relaxed/simple;
	bh=udmceW3RUM6Z4NairZqEwML5hnOEjadjcWJnUNeYGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9ynKIh3ORbkOU4Tjgj+24LInI+aeHLZHrRJIfDIyAi/jPCSKFd+QDBD1NSVIv2Py4aZRnssnVhQEAE5Rx+Bds0p4Zgqk/w57U+wjMNWk4NAkrpCRbrTF7DX9nxE2Y922e4Ojw/hkCEn9/Pmesrbtfn7Zh/lNm7LoRVhZJZZH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so1265859241.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432432; x=1784037232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1iENYh9jXtsnzxDKPGUvdWRKZFRIqtHgeYcjURDhBgQ=;
        b=n7Ylb0act5ZABWEVjWE6oevZfaN8bKE9LuROODRa6rH2W84mE6/DdOLl2KkVnTFzlg
         fXhL5m025H2O1hwhmk5LEpnmmK3WPE1cvZMzpi6Nei0MQ5bQtBWXEw8tAXPUpyvqXOP0
         +XVDJevmqv2OECH9/RZHXSdIDBVWJdx+w+lW05U8xfLys0vfiGqtY0Q7TcJCXKc3ZjBi
         RBQSHRCxV4Gt+ArKCX0U70gKWZS8Hp+oeuFhnFMKxUvuz6hcOKmfQ3Rh6K6tu0u1YowZ
         cWHacH4ygX20qsQvoaQ9tGdBtRgpHJL02d3z9Kl97V+j/4RTjpangoOTMDw1hSYwAzyh
         6CRw==
X-Forwarded-Encrypted: i=1; AHgh+RqDilxd28s2VKtotIGs7YM44A42/wqVaDv0KMUv5WCabiyBhPbjfrJhzKC6U38W/5XpCJee83lZsay0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iwYARFNF1KnNsybJeHJPx0qZYlwNIRVfjWGH9NcsWvAfnnkS
	dSJ2qoFcE1Cj5Pxp/C4T1/Shuz+V9FTpPdj7f0MbkJ3or+ToWg6rIsy0X77KtcpE
X-Gm-Gg: AfdE7cm7or1Ui2xtuhWAE/MM4ZSiTfmrKau4AZpM9Ifmb7Xs3aiQdtDwVVJ9O4rLtXm
	N7Fy5V40rKVsWq5I5nJHyzyJV/PclCQgB7B+YrXruzi7T4QSLofEUIowq/5aLJRg0i0fCzoK9xf
	g/r4e+ljjAhqRY0q31UTu+PxncyGig44hrTLBiolEh+ZdLyI5qDUCvTkfXCcD2asmGgL/euKejf
	Nc3yTDS/WsH2rqu1xnO53Kxz4aPsWj+1KgxZ3NZcdFSxbxGYwVQZl0cStY3rojiJSH/nO4K/5oy
	VPzUxyzLAB7mHs9sGkKzTHbFdZFsfitQluwI+7OOsGRTYYocUCeBrtMUmO679E1wzwSqBv8u7zg
	B7ZyHliWINUbOgF5ETeA8z+DQMLfHjfQPO2+wcnZgtrNTE/2JlWmr5KRZRNfDfKTOrUS9upB+1L
	E5L95jVobXNbxXU6NLBG6U18SHSuNXFXQSqFI+LpjTtmWRnChjs5YzS0eRkOO1
X-Received: by 2002:a05:6102:534b:b0:726:cf2d:6076 with SMTP id ada2fe7eead31-744b7e68ee4mr2796205137.29.1783432431986;
        Tue, 07 Jul 2026 06:53:51 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96983899f28sm6893956241.3.2026.07.07.06.53.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:53:51 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73770fd1b65so877700137.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:53:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoXAy8Qk5kpKRzg7XiNLOyVsCaIsnPTiSDL86Drq+SVXHUBOZ1Yc/XNoKoCghrw16pZEdDQMFeP6jiO@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:633:2389:3a82 with SMTP id
 ada2fe7eead31-744b7e691b5mr2984877137.28.1783432430667; Tue, 07 Jul 2026
 06:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org> <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
In-Reply-To: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 15:53:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnTatYWWxXS9p=_fQVSEH0fH4KzYMKKiNCN+ocSTmoww@mail.gmail.com>
X-Gm-Features: AVVi8CfRhBid3_aQOmlg9c3jWMm5fQMFfkLhy-yd2xfIq0EhzoNaQKJfylI-H7k
Message-ID: <CAMuHMdWnTatYWWxXS9p=_fQVSEH0fH4KzYMKKiNCN+ocSTmoww@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 7 Jul 2026 at 15:48, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 6 Jul 2026 15:06:01 +0200, Marek Vasut <marek.vasut@mailbox.org> said:
> > On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
> >>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>> +{
> >
> > I am hoping to get some input on this remap function.
>
> You mean its potential impact on performance or the implementation? In any
> case, as Geert said: a table of function pointers could help to improve it.
> I don't mind it in its current form if it works for you.

A table of register offsets.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

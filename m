Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944960;
	b=Yc2wypPNaEot7ck3Yg/8tkJgS/mekEebpikp3vGrQn+oL1K3IKR7HASlcl5mgfhNfmSU
	 bFzNjSuWHTjQJT9Ni84ssA6ePYjP/QQRJ+ZD6QvmX9FgYrGJRypcpRtnSxGRlanF4atEh
	 wb08Vp9HAQaZBPd+cJ67RKpKUNutdm366vVOaXwHNYu9rfT0NlQNtMH496r/2nxybkr/i
	 p6rOw+StVApvoZCuHY/eQfABNDbFZF5qqAuoK4KgXqY4PGLnrT8lUWWN3vEZA7Bu/7Ovp
	 uWCU85D0SX76W6tz5WijHN7M0k0q3P98cwvtp5AkgqMED3O0Rl4amevY64CKqTDj9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944960;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
	b=vRQc8BbE0Rc/EJLiSk64RoeZiX2X6mIndAF/lAPfS4zhOe2eMKZgWPMmhx+Lg7jiqqUG
	 yilA7RN0szJG29f2sSRobSfbre8fRrgrFqICUlYCu4C+o1KM1WXH+kT/t3jxCmkV81iL9
	 zVDka9szgXAXPn0vvsIFqxVdpShg3A/b5EONAksnaJXNeRmH7fx3zGodNHc9+Iv1wa2At
	 bWHD4yRbuLlIf29b7g2X/2JpISJvRvuqSG9qN9tKwVCD37RQaXKZMD9/w9Iv4aQu2NSQR
	 EJIIzsqwexqAsz7xA80y7LVb8PdVyZadYAqoZtus13ntaBqXik90TW2bdbttO/R+vhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52123606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52123606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc758830601so183018a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944959; x=1795549759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
        b=jltzJC3ePQ3DamS4Dfbsngkpm+Mx1TT9J0NMocOKbUuLUk+0JWFNn7PegPBEgNjeV9
         AOqLoVQ8LEM4sR0WcB8tiBUO0mXXvpoftkdwJNw/+jAyqdAaGNrzeejBqsvHRnSrPeZS
         Igzy6NmO7NbLPP2Y1bYzhwOW7UBHw2+aoIYGlUG33jKZkWxz66IROg4BqRuzkUBCqq63
         BIQGh44FBnEGRz7GvwtYsSTYbLW6IBbWeP284qJDGuyxIBFyV4uQdoT6X6eNCHCNPTU9
         46Lk56jegw6jX8I/su3Fwp6trtiQ2UdQBOs7el9mCpZaOoUDLQEALQNIPL6hkpI9geGO
         oqGg==
X-Forwarded-Encrypted: i=1; AL+hErEDtC7RYCe0/aT9nkXVqWnZKgaTqLh7s1GIl2DE1xPv2/qcIENssykrTuKK2OPH+UBnb2AsdluE5307@vger.kernel.org
X-Gm-Message-State: APuU4Z86oKfeXQDy6ZpXg76vG8YuBJRnoP2C4nf58ByiD4+RszLgck+i
	ZVcXslh4I7Dbxz6WFpwzyszGYuLUkFVUfrapSgABgQ2Ketbg1/wQTBXV+lfmPGbu
X-Gm-Gg: AZFdTZfEezf1mGJjZdAS/gbUJ9UmGMTBH+zsFcdWM7Jig6ryOIyfWKuhpfxSDCk0hQ4
	W8MsU6ZdmKoy89XdF4qTmYWvk70t1fx4XHhN5kqV8ZHR0TeKWtpQNtyTgEnSghiaSLf7dOZeKtJ
	Wpg56EFxl+5i5pIAxrpOT17G2eWBreRPr7n9RwMjyl0ptxkMsqZWsaY8d/UsCqXVKZUMVSiGNBd
	vFCAqQEX7b5FpqG3Hk1fArHo44mwzc7pg39iNojefniL8Su62VA+hvXQMHu8KZas0WcNCeUGFX6
	7q3XESFdumQ0cYOerMV9AP/bbm486uyghfn4rDI6xVk3K+VOCL7hx7KJRQ2BW/wqUemOEGE1cSf
	Y+9Vu9kKrCX4g6lXWIMQp/NF4brDsQgz3jkKXImUUMbvevhbPSlKO6JGlOiuDNoX+wOnDu/3bpN
	gcdzWf3JzyJ/Azi/N+lk5GQ5PJFus+yrUzBjZboZofIyHI7AwyWoKBfy9vxXDae52xwM+HDFjCs
	/fjIOk9Th3KgYfIWah1SJ/GW/kO/N4hTq3cnkn2ie0SmtW90eqlsH8K0rFGkHkAoZA3BtdricV2
	gzmNIono0cie0gcwLdxQL1Xk4x7F+HfDyG6u53qQmtBlZLowNdpyN8t5HWBEBfljgjFcu6mE6aZ
	ezlMqU1vEPEo6o4jMxnj7Pu6eHdN7P+feSDZMxhAnun7HLGUwqxKN+yseXH6J8gm4Gw==
X-Received: by 2002:a17:90b:49:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3b3d07a23f6mr437604a91.19.1794944959629;
        Tue, 17 Nov 2026 11:49:19 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4ddecasm5482551a91.14.2026.11.17.11.49.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:49:19 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so584500eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH14E0FSFAst0Hnu9yqUKzLKIIM+dnybYgz8oh064wTEvUok+5eRwu7PkTRzBeDNbJCZV/eJryeDnAd@vger.kernel.org
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id
 5a478bee46e88-3828161f1d8mr420423eec.41.1794944958852; Tue, 17 Nov 2026
 11:49:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
 <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev> <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
In-Reply-To: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:49:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
X-Gm-Features: Aa3M54q2rRrfck_2znOo84tl7sC4Xfyn9RtGeBH_rlEOV0HSVp39Mi9qyquXGxc
Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:38:53AM +0100, Linus Walleij wrote:
> So this has one register per setting per GPIO line?

Yes. Each line has its own block of registers, 0x40 apart: input,
output, output enable, the interrupt masks, the interrupt status, the
trigger type and the two filter registers. Only the pending bits are
shared, in one register per group of 16 lines.

> This is ideally handled with select GPIO_REGMAP
> for gpio-regmap.c using regmap-mmio, see for example
> see for example gpio-mvebu.c that does this elegantly.

I'll move it to gpio-regmap on regmap-mmio in v3, with a
reg_mask_xlate() for the 0x40 stride and the debounce in its
set_config(). gpio-regmap doesn't set up a gpio_irq_chip, and there is
one parent interrupt per group of 16 lines, so the interrupts move to an
IRQ domain of the driver's own, as in gpio-rtd1625.

Thanks,
Joseph

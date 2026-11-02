Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629394;
	b=GkysPhEXViGJR+G6ppQaf6Z2266OIcdy1r8gcrtAx6vnGKb3SQ1mRQKWbl+W1Mq9zEgS
	 4Jjw8JrdEe5U+4ge+CzAbO60iannF4Bgoi9AMyRwJlz0/gsqFU79Y17IgV5z350rSZj6T
	 zKCOCLfbTbUZ0GXTaZtvN5C5Sy0gBoFzxekamP1mijpneZ2xoKpqYBBMCi5WqoydVgQhJ
	 A33rUlfkIx71KgnLQL0VngiMiXy66n1NwV/g5E9ZlgGE1v1W0vg09aLl8oceUW/bojJ9p
	 kxgmtE+8Xk07B1ASzBLdGvXu9cGPaS1Zd4xgZSoArJmUmE82dr1Tb/b4VtBfd9d4T5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
	b=sCyu1NXuXKQ1apH8TnjMSsjt5JITbRlaTdPM/sgVQsMuYn6uAwt7QkcYrbx2P+9nUhdA
	 LUCS6J1bcOtlcQUvg4VjuRHlG8khUodSsBBGoqE4Ir3rq0Snvl0BIPyEL4aYUyCEfZFej
	 J3g7uyMKyFZ4kTYh/gHCy9E7EIMo43NYJuyzFnrJ68u2Rmxfv6bxwPZ9Esl3Tl2iKYd5Q
	 1RMtV2X4muT5Vfj21GKfleM9v+waOtvXEjgHVOMKjfv1qXScc3UlUZnPsMXJyEDd900b1
	 SuYr/02gIHyDsTr8D7iwPFHJHuYqAO/RcxsHqj0gqAT2+zujZKoP2Mpbu1zDXSuo40g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4460A3807
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC4460A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so1042724a12.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629393; x=1794234193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=0FsI8JKfdwQmudyzyfmTQVlPByzYNYayujLicTy5q2pnwA3kjZGMJapOQ6MTLzgTey
         sv2u3Pk+lLXkuI+OC+/J3DjbHekDnHy+c5G087tA2Le9rNkjzfaYr2cQe7PNC7prgD4v
         F+9K4c2P73XReb2VxRYXhhQhkKpKws04CBX4cZ5d0fhkSlP4nDszMoFcdsGkg0xPddpj
         FAEJZ6ff2ipqfgiKbYhKpnZI7et2OEME8aCu3hutxuVw+Fj2dc2lwsCvNoRtZpmnwGCh
         LwR0fZsw6bzXxE1UxIDLU2FvH7e6K5z679/E5PBYLQgS3k3Zkp0liWioZKsz4vJIC5wd
         FcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629393; x=1794234193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=N1xLPKJrHzzEF9jseNEwCCrIBwknZPYt5xBwV3gwJeLr/JvKJBACGAYixXKU2a/Ved
         bbSNeK26gb85xJ1ZodjpcOsV06iDcubbeh0X9DGfIjVdQViQi1rwoANwkTTrfXmp67t0
         0FWStpro9IMJ/JctH52JapmJCkCEgdtP34yPsAxqsqHQmvKLdLvYsTUQMkPggpp6aFI/
         ph7bVCKk08VT2us3sU/gwBtgJO7cFMokfTGSU51qCLQsGrtKZIQo2meSuuEoz+ieHEN0
         +qSt1p37QE3nTauvlZ4EVdEiY0t0t2e1F+KGd15TO0s3/8i3a0Nh/+igfQoaNWzf9rbQ
         9ypA==
X-Forwarded-Encrypted: i=1; AKwUvBwEz8QqrNn4hdg7HbEgXO6DketjLbWUMvwdPsKBHClN6Y0g6j6QWURNl8q9UZxW/l1w5UmI4XEcxcDA@vger.kernel.org
X-Gm-Message-State: APuU4Z/3+Nv4smW0YAdL7plKfajxaUTVx50rYmIJqBp8QgPYv492CqE6
	e8T3J+8Z7Ta7KOAUZxCFr07IalkMsp0z0IXGGJN3EzA0uB7BxlL8qIo0
X-Gm-Gg: AYBFou2RR8ju0WAhmtfkN+CjklhuKfa5rLhDU3IrO8/eGFDwXQ3vvyjxECtdre0493u
	7Wb09rcYZL4VhsBcOwA49/Tv6s9G9DDOz8iryFZW4hDY4LljhbJ99AwSalE+gn+so2e9HT9Kt59
	xtN1FlD1gV26iFZ0eYFDF6HbYvgf6/0/T8rMA9d/bdJxCTb3aG7Ip0yTAMY6vKaPQP5WX81SyNR
	ESfGeudfAn3f/o+FTXTiljZIIx00E5mF1/gp2X5nno31Hj9nzBzANxIWUNgcvQnPAM84lTBj3xV
	UVSGVnK9ouM+RgZ6WoIdhYyKcgIPgCJRjamoJ8Z5LQq8953kWRt2qzSBS//8tMA6JWvtcnhWsTN
	C3BZdmYVpTicmAWZNyTTxhGQASLlE0cYp+N0OtLZxQd1bQ+tXr12IVEsD0SP/QJXnt/CkU++VPw
	pST6ogepvmJDMbtasqayg3iit94ZdJs4w19dMpDa5gqas+k0a9EavZ5X0mzT3Hjsdb0zh8z0fJR
	PEc/ts0t65k22xrR8QELTnP1BdsOFfjUBoos8gGPzMAr5bzRLoZ+raifK2RqrA7FU4aIrajcVg6
	O330r0bmCajMAaL5fhvdvp0PLAE/vzabfYNQxcXFRxtkw4iP43riIrzHNA==
X-Received: by 2002:a17:902:f70c:b0:2e9:5829:9b3b with SMTP id d9443c01a7336-2eb364b55b9mr86204895ad.35.1793629392936;
        Mon, 02 Nov 2026 06:23:12 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486d5sm29700245ad.29.2026.11.02.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:23:10 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Date: Mon,  2 Nov 2026 22:22:53 +0800
Message-ID: <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-concrete-rebound-593001f1ac18@spud>
References: 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5511..b9b3bca12089 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ZHIHE=y
> >  CONFIG_ARCH_ULTRARISC=y
> >  CONFIG_ARCH_VIRT=y
> >  CONFIG_ARCH_CANAAN=y
> > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
> >  CONFIG_KEYBOARD_SUN4I_LRADC=m
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_NR_UARTS=10
> > +CONFIG_SERIAL_8250_RUNTIME_UARTS=10
> 
> Why are these options needed?

The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
UARTs beyond the 4th don't get a fixed ttyS index and end up in
whatever slot is free. Raising both to 10 keeps the index stable.

> 
> >  CONFIG_SERIAL_8250_DW=y
> >  CONFIG_SERIAL_OF_PLATFORM=y
> >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_PINCTRL_A210=y
> >  CONFIG_PINCTRL_TH1520=y
> >  CONFIG_PINCTRL_SOPHGO_CV1800B=y
> >  CONFIG_PINCTRL_SOPHGO_CV1812H=y
> > 
> > -- 
> > 2.55.0
> > 
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)

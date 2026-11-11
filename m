Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424115;
	b=bAOrf+/C73pxkckmCAWHQxT9MZDDdq0PXT7bukMVCRcCy50OT1oH8iV51EyYEQPib7YJ
	 ELE6LlckUYUDj9t9ANiPJFhrHCCWrwj3mRit2FHA4LTOfkpz5DuA6LpQPtQxh+bOmrNnB
	 TfssNitJ+5/vzH9PQ4QmwzbNTzIHAMOqR7lQN/5/2iOTC6vM4xMD+xXa2AUp8pXhen8Lg
	 DrgXdZYxl2PTJcDj5fPByIxNxe1c3nL1xWWdIFeGBoOc+ohLZdWACyxXL62ToQBNv+A0/
	 C09fPI2+VrsaobOyaXqlb1wXd9WdB29xRg66j+EpQJQc4YlyhTXegLlsU75BDBygUYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424115;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
	b=rzQwSBJsG9PZAM2Zhpwe3EGXkNT0xJPbJCK5OePSTLhFpkZqV+hjQF2i9vz0w4kAC2gt
	 gaU/75Mxhf931z6MY8AgiY4z2oYEZA2zs+rhwYCvQ+pbE0v1cy0pAuf6bieyXRZssFxPP
	 MDjSAai+bWlkli55WmK5cucxLfZB9ldBmHpXvGmPG1nhSuyhopT0PYydsAZLB2fG1KfGO
	 CIzLUW6X7bhN9tMzGIEpS0PJKxDTBVtZnXQc/0LSuG+gH39c+jb7UXiG6k0YpXE4JH/82
	 EkUZKuC5U1lSSgUSOjnIV3qfYdqw1a8TUDnMcPQmi8gulCL2KcJoTdODUJ44Vv+rSUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0FC606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C0FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb9f760337so82810a12.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424115; x=1795028915;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
        b=iUO0vtcfLGc5vVN9ixDow8ILPYItyOKtF6H6bQf1ei0KfaB/Icdjyp4c9SmCI4Zcb4
         NaslAhmZ/zB6E3+BICukzPvQjb51EWLGtrJwLPIfVYL0dis7PIlcVdfRJMKQ8nTflmiL
         b7HBGUAMr+0CWS/mgR6+A0DkADBknMCFoLe4VYpeKEKHgfWZ/SgVu3MDvtos+T7JXXjI
         MW+iCch73E1qGnI3L/0E/KXzSQu+uxtH43cUzJRHR2ktdtsk+WgAYwsN/0F5Fmcx9x2w
         7ONYOaBKV0CPTaQQvum0k8AHCN3E+fOuXvnogI4ScTlD+hIbYMb2mP5ozS+grazRYYNx
         CulQ==
X-Forwarded-Encrypted: i=1; AL+hErE5ZX9vJncbVIQAFMkFyR0K69JgUNOhSRIrDmvRt7mKIY3sxnBOM0NbRW8asMPVlMRyz8ETcpOqt1bb@vger.kernel.org
X-Gm-Message-State: APuU4Z9nIpMEpC0YP07X1uGJpivXJXZ0jgpYc/XB21MtveCD/Bg9VQXa
	5NUBbZk9aQL5KYpXVYTx7ZHYsRpuQfbcZHm/EkBy2d/ibOMOnZh8gI2URd6rJSDY
X-Gm-Gg: AYBFou2GD2SUHbog25KQZ2hZP4jZ2FB5J9OXhqbXL44D312sfDfXZq0gvfUliQcSbpN
	NbQKDvT3JNEzzh/BM+QKf64AoTdAc9p7lqWjN+TtwLm4Rp6Q35GjHGL+OOQQ2HtgD/PxmkjeYfW
	0225z0/lHCIt0ioimmBMHcIfr1kFTqvdFtEzKoVRLsJyRDuFPBoqE4jpCYQHjSkvFAKGRKKyTLp
	lSs/YMVpNmREBcyft4mzPlz8uHh2Q1lPGwxPqIxKzdDAziy3R0fXgL/ixG0sZPEcJFVq/PPgAbd
	0VCaBRnKaqvotyXJm3FLsYP+kpB72Hk2Bj2qfuFOQA2PcmA4LTUJ16Nm6caSmc+qdZ790EDfkYF
	qocvTxciGmEo5R7dj/lbBseHXyjEIkqphOxe6F2Qd31xi+yFZGOqcDC9nPFPgQEkutrshiq+RcZ
	TXjcUp7Vos0orScKJ3gJ4jBaA5gxdDt3PgwpUDaXYMlsUjP0u1c+vOdcwgP/xFGoxUakH/yR+gY
	YpM11JWe5iFTt3gGmg0FpJtIbrOQRbJHWznZpN90BoNXfViRrYSTFq/LPpNS2GQOlOFu448Bh0S
	5idfvKuFjy37Sl/cDDutG6JYl4sVp4pLLS9r6YbQr3KK7nrdS5bfcGVB1dJGs43OiCpRRo6Q1xO
	vu35pdKYWcS4DM9LDPRwIlW3D3iS/7kr8n8Duu44OLsEp
X-Received: by 2002:a17:90b:580b:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b197ccbb26mr208288a91.33.1794424114455;
        Wed, 11 Nov 2026 11:08:34 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c3e7b5sm557551a91.1.2026.11.11.11.08.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:08:34 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37600b0db49so113782eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGh0U5yyjfLYEP+wb8DHmjgEnpB7u3VjKYyikosboR79S2foYAm3hlQSAvbV9a+ncvGwRmK660coNu6@vger.kernel.org
X-Received: by 2002:a05:7300:c7c4:b0:377:3984:5cb with SMTP id
 5a478bee46e88-377e15ef441mr284775eec.17.1794424113527; Wed, 11 Nov 2026
 11:08:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev> <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
In-Reply-To: <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 14:08:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
X-Gm-Features: AclHuK9zvtdVIUhueVUtW3uifqySWqzLz4GA6zOccXJAOROeptCP5K7cJXQAOv4
Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 10:56:47AM +0100, Philipp Zabel wrote:
> > + spin_lock_irqsave(&crm->lock, flags);
>
> Could be simplified with guard(spinlock)(&crm->lock);

Will do in v3, as guard(spinlock_irqsave)(), since the clock gates take
the same lock from clk_enable(), which can run in interrupt context. I'll
convert the gate enable and disable paths as well.

> > +static const u32 sf19a2890_usb_resets[] = {
> > + [RST_USB] = GENMASK(2, 0),
>
> Do these three bits control separate reset lines?
> Does the hardware require them to be changed together?

Yes, they are separate lines, one per clock domain of the DWC2
controller. Bit 0 matches the controller's gate and bit 2 its AXI
master's (usb_axim). Bit 1 has no gate, so it is probably the PHY clock
domain, whose clock comes from the PHY rather than from this block.

There is no public documentation for this block. Chuanhong explained in
v1 that the lines of one IP's clock domains have to be asserted together
[1], the same as the GMAC's. The dwc2 binding also takes a single reset
for the controller.

> > +static const u32 sf19a2890_uart_resets[] = {
> > + [RST_UART0] = BIT(0) | BIT(4),
> > + [RST_UART1] = BIT(1) | BIT(5),
> > + [RST_UART2] = BIT(2) | BIT(6),
>
> Same question as above.

Yes, they are separate. Going by the gates at the same bit positions,
bits 0-2 are the UARTs' APB resets (PRESETn) and bits 4-6 their UART
clock domain resets (nUARTRST). The PL011 TRM (DDI 0183, section 2.4.1)
says the reset controller must use PRESETn to assert nUARTRST. This block
leaves both to software, so the driver asserts them together. The pl011
binding also allows a single reset.

The same goes for the other two groups. The SPI block's bits 4 and 5 are
the PL022's PRESETn and nSSPRST, which its TRM (DDI 0194) ties together in
the same way. The WLAN blocks' bits 0-2 match their AXI slave, AXI master
and platform gates.

v3 will explain each multi-bit group in the commit message, not just the
GMAC's.

[1] https://lore.kernel.org/all/CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com/

Thanks,
Joseph

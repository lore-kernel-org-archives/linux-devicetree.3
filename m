Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995189;
	b=ofO37Pu2tLpd9XbVRqEaUBcDWBtPDSBOv0n72xPoPewd3ZxD0gzsN9iXbTRDfY3Jb8Pj
	 yjKnB+gPpyN13iE6tmRNbU9WuSEvOvTdAAx948JQsWN6ItrS0OZbYsmUJITXCzwm0krFV
	 /q0yi1b7pB9hyyyhyoutwEKXFExiNrmz3+B1WZc+VPSPB2os/LMH3FxNaI65x4HG2G1jB
	 XJUfCDPMwe1Ed5aym8SZtmqBjlMnFtEXC0dxnnANfGX7aDbZ0gwDBvJHEGHsqY1i0f3NT
	 rdp1aL4uREPk8wieRlDqrHxGE+3e+KN9XfXch9xj1LghRIlHx1pKI1D4FDHS4WcZbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
	b=T6jJcx2OvHx3CcTz5XfHc1WB4tAN2v12jCK9byPlUKqE50ca23Fs1BDVX6aPXI74o8c2
	 QV/h/XRS3FcYy4gD+bLNOZ5T7E1yFbMrckMCYj3APStLkfa/NQ/m3tYVHkZyMN4n/KsVh
	 afMGmQaRpjlhVSnRdXf//TqkPfw+0Mc5bo4hdKXI/8r0U/wLGwTUNS2760nnNoISx14NZ
	 PwzOcGMg+omjlOCbDOHpf35DUd3pqBXXC/gMGxLg9MinTWceW5KIanL9TpFljzw9aJVwD
	 p8UNZBYT6UTcULgpdrMOzg5buzeZH2rQziyTBoGHIdcUIX9LRc/em54eNWK/fCNYSEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnfvgDlR;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF5606A332
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 19:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DBF5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnfvgDlR
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9892495e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995187; x=1794599987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
        b=jnfvgDlRBI+yxIh0kTBPlhMYJzE8Ir1UlsS0SxW1/czqfaMO+7NvdK68wIq6ghkziI
         gKUgnEm+CMfUTo+wMw7944hB3nN/K4cuwuqUzB9uw4J8T1SsoHbV2OomgfEKN6tbRiaE
         YvKGhAJzQFxkwDjm822TeEDbrFUSfLOXWSold/vj+045lGB7y4zWYbTiBrgd4M6OVAsk
         koBOXJThh2DeklPjV49e/BWK0t7l/rBPQawLKX3oi0642VX5uHF2f24OOIKWd1e5oZOX
         hH7ENv4q2enAwomT7b2170r09JoFGYqrC8qH19o3VlBIp+BAer3wuV0tKG5stFxhfrjU
         3HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995187; x=1794599987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
        b=OgAjr81ThFmxwjxUxhUd4r1kGeQLCsoOVLfkNgAEOlouXZS8tdHTeLIRslB69EkFR/
         M5aj0iiHQsncHztUSmLIJJ4QRylem+pr8tNUnHcHtq1f2KCdQyUOafs6B5KyoHSu8ub8
         lpqw034Sp/DsDgRgdxfBwG4BU+5y6mHcqAWheGU9D0ICMagrnmMXBxY7KYSVAaEUYmA1
         pqYaSkDLavS5PRqN0Oim4GBm7Q3neBjsCAHpmh3dVmYRdMnvJ5rTkGCXoSH2Fs71mWYY
         LBgmIQEIQ8hvEpbBwW3Bwufp+11lJ0aLwmJPbOlO6gnv4jJwlRNk+QqlxrrOxchKeK0q
         wP5w==
X-Forwarded-Encrypted: i=1; AKwUvBz87XAFInV33yQiCH4ztKgwoykzcXh+d57NRK07pIOmJ+8fl4AmrUe2XnX0xfCIaUm+aLKFSdjn08Fo@vger.kernel.org
X-Gm-Message-State: APuU4Z+iPwUyySMEJdPl3/bVOgBBlhnFfg73oAmhyEmvq911xF18pqV5
	NUvRBYTVYHspEc3IWYIfVIrVcNtM2tggW2+1rL80hvn4Ry+I4Iqk+Qh5
X-Gm-Gg: AYBFou0RjyfxAc0k80KLSuLZs3CUk8i1pW/v+vfW6AiYdNlZv/CIhRh0H5+xoq1Ofct
	E5dBVF6FSq6oL8kOaJt3NSAtmqBh/T6+EuwTQ/GH2B7LTmwMcEdt6jKBTnHIguisC+iQA4NDg3u
	L+XOWi8hxBOecrgp5FMxoE5YDPnCUk+9/oatSOCYQJpy3ha/Xm4VY5ek1yoQrKEwfmmjZXpecoU
	9mxqs4jHm1rA85e54/8QY6S152bXyxJpGxP1qQ/x9DcIU+YNrB7IkjVSj3h/+rdUW1s7gxecjSR
	t+cS5HgoZMg8O7ljhbFQ9jf4byHG4iyvQiq70/bOO7uBNZPzp5UHQWoTVVGzJ4JSQzGAZSqRiP1
	g717OSh1il7BAVsK3gqsc9SSzrCVdfsd6VJk2wKE/rnfEd8iV45XBuOSbYrIQF0toWRauCpJfDh
	sov1RjPZmBZqj+1sIZIVCWTB9uh2mS+VtPKbQpeEk7SmRSrQGhR3zopzz6pLsl7akgptyRGTl/M
	Mjha+m6ZTGZBCq7rp8jd0aordr/126YrFj7jyg+2p3WxnJerLtlljzlX2AjHtdT3GWkzeeAbtJN
	ZuLRbhn6PsrQ7NYdkn0Ek3ZC9NfHYCQ=
X-Received: by 2002:a05:600c:6090:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4b6db0d0817mr56859775e9.4.1793995187215;
        Fri, 06 Nov 2026 11:59:47 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62ecc1sm4414165e9.2.2026.11.06.11.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:59:46 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 19:59:45 +0000
Message-ID: <20261106195945.4157095-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
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

Hi E,

Thanks for checking. You're right about the commit message: I saw the
LED lit before Linux probes and assumed the firmware set it, without
checking where it comes from.

On the Lite, the schematic (sheet 21) shows RGPIO3 driving the system
LED and also used for fastboot detection, through jumper J20 that pulls
it to 1.8 V via R257 (1k). Detection happens at reset, before Linux,
and R257 limits the current whichever level the pin is driven to
afterwards, so I don't think driving it high conflicts there.

Owen

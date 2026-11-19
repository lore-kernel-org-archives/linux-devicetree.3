Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086158;
	b=x2CCJVMjxOlsFtgYyihvajXl2Nvx20+d+DlaBTualQsFVK+WN7aoYqQi9OpBjHVQQSx7
	 3byKEInVOSJvGttd3ZgGg7ZPNcg9uSKolpAvkQKvr3H57YxUciSMZVfQOR5ee5gK6dNYr
	 O4dc4VEifGJWnG1cCWafrjQWJMXGqj6WhXrl0PEcCsxBlu1a0o7lE3dA1bMY93AZr7blW
	 1I8xtgDPcui7kXFwvWurnk/Q8UP6MAdY0AzJvGbu1+ZyZXxs+L17EGlBzdaiZM6e38Zb9
	 xSJVkN5zzO/zy5wLORfCSq4MKBD2hmebhZK6+Mn3bfRgnzc4FJtYuuQrI/GAQfkxicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
	b=MKKfpTIb+Jl/6QzdKruY33uZw7lNwNn50S4uQmDDGxhMrc3V4XXINM3743T+9QZ0XhrA
	 C0wUb3fS4gWBcfX97irC3RoS4fZJlbCSYpsMOISjSRIgjyxmDiY4sWxUeMOa+yI5qtCXg
	 QayT0KGoxPiqXcnv97Se9goYGDgOz2vYgXG/ts9IjIOyMt732AMzjh+rOyCXSLgjAcOKf
	 B7obK/1wsNalY/GO/hcrswySSm9+9nsVXoAGMVQ5hI8Nt3IQlPXiAx3xbDArp0D6OI0ia
	 3LUuO/MB4ErcI7l4UWc7zwACnYJwYEitaQq88CS5XTZmVWVpTiMV1ZLQl5yyYJDp7kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJZsn0n;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B7606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJZsn0n
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c1479a959aso1648646e87.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795086156; x=1795690956; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
        b=WgJZsn0ntLtQmWwKEunSPtrq+5IfLHGwCNn/3/5AXft5tMN59CFoznndg/dzTOz36Y
         nyqhDzYuD2uBpx9dGgJPABy9nHsXaoE77zLwLBdHboKcNLZuEHO1T4iOlNJc9sFczOuD
         BUeJe4KMlpZNCe6zwSYItuHZsznqzs2zbWPl4he+ZvCeiGvez5anziEuKZ38MOlhus4Y
         9S9jDzCLW6MeW88xWXkHeQFJ9V8Qc/kKJATHZS5TXShS7MD92B857/1PnuVEYakgwBu9
         Ae44JHcUZzGd55VDF0icEKHgKLkI9dQqHSFrLAUBA3o1mWe3g2yFJU0WrpgdpTvkxh9l
         P0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086156; x=1795690956;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
        b=xYEI7wdvvhsG9RG+WZZhkuTRM/GZ2rUORHUhsF1mU2Bv979thePa0Gb35MUMCwUYWT
         IPC8PCe3DxAptiDCBrXeJ6KL0dMBg7GrH7FfUeosApFWqktqZ7WDpL9znBX47JF1Pvwx
         lvikKT/AGpRxv7iVtcJv0TNB0OLZUYfXGxKDhdCBqSASgNyc3YuZEx58xwSWaptv3Vbk
         urNGdg/CL8cYnnvKWrrdUCUkQ4SouH4TUM8aKzLQknWcjE19I1dk+O7kjPfD0e0T8eJI
         m0Udv4Y0W4m4CAWC11gsvelKeRK6T/+kA/uaAgWUkkMjkW0Jft0Sre1BkOLwva2jcAzT
         OFig==
X-Forwarded-Encrypted: i=1; AL+hErEspeSeotEVAQTRx1GYOQj+n5ajercOYGD745Xt5U8iO+nZJmeNaFiRw9tJpajw4zyJGgMG5XUmWAlM@vger.kernel.org
X-Gm-Message-State: APuU4Z81GfpbSUmb32r+Ne4euZARwKoVMhQHOil2rO2AGa3SEXbe6e6o
	tDavoywrz8XOk/JJsXQYf8CYFR47VpKTgbh+2zCnRcKe5lBQUyD8uh5h
X-Gm-Gg: AYBFou2ieyuxY/6hv2LSTdbpwpape0Uug+fZTbi/0TrkdJw5KNZWgHxRvcM6jCQQk0j
	kljcoXVMReZMLpIWHTBNLq2g4S0NWfXvJjIraxexO3IIqT0eZbw18Y6zExUtEIfHOztqCKoWpCz
	MRWSHP/LeWhE86RuJrk51FbVIBpHq2YYt47NbCvOBBg1uQCY4InAO6WQKzx2Xopcy18YPdErmdO
	NxM1vaAuiBCmF/hScFdt+Ek3gWkyE8WrTLrZyvMVTBVsqT05BXH//qEU7l0LR3oV5Lc4MWKEvn+
	N4XQ0zA4NxyVW31GrBccbgqpkfivEEz0ca99pf4AkCDGGlgodAY+dIOrXcW0LBFEq79DolBBQ35
	H9EYfgiz9bTznvUqg0KZKFvRxnYB7a5Cb1jLgQrUBJOiRBWL0nDZnQp9+pYsy7OlzSwXkTY5H53
	TfrQZh5pEw3fPlRBZlRiiE8yFuc8mIo02gpXxSXTGvVtKK9nFPAnP0Dd8gPUXEq0IUuhx3lKwnX
	dAdPAH4+YAPUniBx6sNvmfrgHMIZJ/WJuNXrM59MbJ9UBYvHHp/fPX7wE2z9gOHM9tvc/2Qp5uG
	0bhlQMCIRkXIMMVHioPUUow3rkm8vfKXOK8SgW0e5DUx5FHgEb85RL8=
X-Received: by 2002:a05:6512:2308:b0:5c1:4f83:17dd with SMTP id 2adb3069b0e04-5c1aa2b4af5mr1725666e87.53.1795086155763;
        Thu, 19 Nov 2026 03:02:35 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa772c50sm1425957e87.40.2026.11.19.03.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:02:35 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
 <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
Date: Thu, 19 Nov 2026 14:01:58 +0300
Message-ID: <179508611881.4.16899217970121840224@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Bart,

On Thu, Nov 19, 2026 at 11:32:23AM +0100, Bartosz Golaszewski wrote:
> Can you please address sashiko comments?

Yes. The spurious edge IRQ is fixed in v5: after programming the trigger
and polarity, set_type clears the latched interrupt status before the
line can be unmasked. This was tested on the Almond+ reset button, with
the pin mux configured separately by the test kernel.

ARCH_CORTINA_ACCESS is defined in arch/arm/mach-goldengate/Kconfig by the
CS75xx platform series [1], which is still under review and not in
mainline yet. The GPIO driver has no code dependency on it and can be
built independently with COMPILE_TEST. The architecture symbol allows
enabling the driver normally once the platform support is present.
I have clarified this in the v5 cover letter.

I am sending v5 with the IRQ fix and the updated explanation.

[1] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

Thanks,
Fil


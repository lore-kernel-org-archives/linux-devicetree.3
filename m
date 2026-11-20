Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191725;
	b=lJoThuAWAy3+XHRXCdaQSPSonjR1KPogY8Wxu4XfizfK1WxnP8cMHeN34+W8A1gV9wui
	 svCMuoLp3l15rS71dYprjcvzXz3lZjb99K62ye55R00qWkf2QsHI5AHJlDuKtZ+j5Yey4
	 69us69l4oc7XLFv6mAn2FwZmDAFJTpTMmohqa1LNKQbhtLP8Bt+SS2JhjdO4QMvyw6Ej/
	 v3K+LTj5Q/POkS/VtAALBW7o8mcomKoOR5tpRPhnRDhF7ZbAjpRsMHKIWs+X9oNLB3VMN
	 lEGIGAocvP2tvF0mtlTYk7zNAHG3j0UvbbtOVvxOtzhCRiO5hxqe7f+UmF9w/FZVUag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
	b=xGjtBYW13YpJnCmliQ3a42iQQF0xN5wl6tI3A598ePpTKW7kvUUzkqvzJLt9T6JoFtRB
	 KTwu3ZZxuAUdjF2IL95eUZTSD0EU/+eA2UD8Fq7cgyH74CmiDjn+zxzcotHTbUfkrOnKZ
	 GttubhomCjjyCxEUC4jJmfXTaFACfn+3hmeDJmqKTsuNhG9EkgZ7AZbEOFMaRhhuLExYp
	 DaCrhfm7JoDdwylZFFkQCgFqpCB7/uflojxE00ZV8ws4+dGeDBkYoky9B1KwbgDMZqvvD
	 gg+AU/M4nJVsujmU0eX8S1WOdkHY87AI/ucytBGpzWGBBXffGo+BRp2Vf8KgH/BG7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuaOZqg7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6D60A2615
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E6D60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuaOZqg7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so603839f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191723; x=1795796523; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=OuaOZqg7afbEd1aFm1dAGau1ntKt7R5Y8qC0j+YM/CILLTi/KNw8xmTK5X2PVsH6kA
         NPpBsyQS8t4uTEaFs1PADVAE9WyvYUCAsZRYpavhYC3pDFL2xW9S/tB8jJ44lr5pmZS3
         coUW8S+YXCXTrk7C52M4DOk8AD6LzNey5X76aH4EH8l22IdfGnRpeFtr6dmAPqXUU9qc
         uvRmRO2CTvqtc8wEVEQjVimdF9JNJ/hMSC3nH/arvV1R6SB9FvYXNSDX8nEU9pXZp7L/
         VoAPQaqAntnJgZIAkyUnPYIb85nLVmakiPPi1G2Z46OLjKF9J9vovakhu+ZbDxKmrEyz
         JyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191723; x=1795796523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=0yl0pk+jiDOMTmjLJu0c9hG0NtbYUwAN+Vs/x8oeazGKKAQTpvFOpVUGtDT06votaY
         5SpIZTyagdhsDunyEe7/D0jLmbhZnrRm/dHBWDU7PowQeEtPeZKEqnCqRKm4VV7Cg+eV
         Mcj4pKrN0ZTUwz2sL0HERckz0W1sk8QE4Wp4pFRyZTpy2auo2A4zZOBb/mQJB5u4rFT3
         DdP+sdTvbrIeaXyTvukp7QEVyhItmwD0twkNOy7Ee0njAMJQ2ZaA+J9SRse5xPxg6G++
         0sAXgZdDb1KhvyCIdfpi+XCGJ49rChSl9RdOnB/kJhxhXpnR9/C0B5aYuGO/VoZtsSJ8
         AM/A==
X-Forwarded-Encrypted: i=1; AL+hErHU74FT3ELOiUmIROKSdkt4oMG/MwtvgjQ/RgCh7Ipj5yUKkqYn86bYbc3FsVtQ+zqfUVE7v8ySOVOj@vger.kernel.org
X-Gm-Message-State: APuU4Z94NgdkAG2lJqTViwtXjfuAkC2E9JWaDojeYrEdRxuoHd3h177f
	QMux9GsP/UTTuux5ft8pZaePhIPXXpOU91yQxergPSZ0WMYEvO6dkJb7LZ0RhkXuIu0=
X-Gm-Gg: AYBFou0AOCve2XJ/5KSvS6wAejwirZAtH0Xy1jaUNRxWdHEJtmUr/St3Zghb21PR55D
	sSLv++Qy7b3cVm8tNxoPv4UANSkVbbso7FicSWEUTsRxx4D3w1UBQae9YLKzVwKBjxVS+RIb7FY
	1py/az6Uhzi1Z8ZbwhgxOpXlJrNFOX3iyWngfs7qFmosyefO/OnL4KUgFFm9O3qvXUcyXLmKqqp
	c/KcV6qUR4agGha84jWTySsHEdpJlJ43aUcmpaMderyePLvtm02FdZ0ZpxRUCCXPf8fu8hFtRZz
	rWgUJ5aSlwkyAgyLD8gX9Am6/0sgNzJA9MA7gyV9CAWVJSflKJeT9lZp9w7F+ozPAtXUYs893XY
	c0y/UubXc69EqUwdGxcQtCRqrvCYV6GDywiNV+6i2MrHMkc+NAk5rfm1AtLarrJ3q0U3jlX7xU5
	LYAwOO8ViJX/D6vFS3JYsK6HfkpBt0K8QtBsNlpXVBJt5Msz6wGeu5gZodgqlwmBsLxpun18qS3
	IISumq0Jk1hRJnUxGgcRjT0+dnRLjBXGoF43TKyPCDueknycSgnntWP63w3qMeb37sAY0OVAlxc
	xlVbMQyB5ARxihYB3MDgOJitQvw0vd0lxd07KBmIz3V5/sfQ
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr92312295e9.3.1795191723347;
        Fri, 20 Nov 2026 08:22:03 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm137854885e9.11.2026.11.20.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3121589367853881174.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UYAuJv9SVgURGKW/pKO2M7vMHBgjYbXz0H2zRl5sLMI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcufFn3NUD4mbSymcPHS9iXCz8sUe2X4GLL0RHsYf
 By1gyM6SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJF5pYwMj9eqR/3X/nTu9Pwp
 X8wmLIr1uLFhAkNJevMtlgmutw10XRn+V89UVdsW7afy87rS+tO36nYKuB5ZLxh/zPbCkR+ztzL
 oMwEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> I have the platform, I currently use it for my developpements and
> therefore I care about the clock controller driver and the SPI
> controller driver not being constantly broken. I would like to step up
> to help the Nuvoton team (not visible in the diff since they created
> an MA35D1 catch-all entry) in the maintaince of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Commit log nits:
- The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
  controller maintainer".
- developpements -> developments
- maintaince -> maintenance

-- 
Jerome


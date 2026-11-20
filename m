Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191723;
	b=oVWEOtOtRUttMWhfIEcY4Hg0GQ/VWGWTxrQbor5jkoiLn4+NHU/dMBH+R1GkrNh2dlQI
	 Jc46q6lzIk/XsL1hWU2Z+3Eq92N9TBtbv8R/eKJ1xiOYBUdfIm9i9yQDmrrVzIVUjXHXG
	 Ijh0sN4cy2jxjdhT0QU/6WJ3tYyAwH1acPfAv9WHxjMB3HHL6nrY3RANl2woIdSqThAZA
	 x0d/F1K0fRGTzQSHBn6BGoTPkKuS2IpEjBvhxnl5SUq/gg3YEyNfccKW/vRq+jxmPKLDT
	 AynEOFi/INy4b46Pm7w65ttYFd23E3P5Lo1sAH7MxfeMKaRX8Y+qjLdxgvBEnsMW1Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
	b=psLIU9r9zM1OcJHs5Sw8+unkmlANYOIk4Iwzs4mwVZ/dvXWuHi39RCUd599SVyeTsngb
	 bfAB2yguM5afhKVzY2dBkbwjmJXIRDx1dFGWHJLoxzCttJVV651pG55Ds6C/HumPPswpX
	 OxEgV42y6l2G7Ky6SEBUYu8xepWjlBleaCAYXGRbPqgjnp02k2O5wWabz//GP/QmjSSx/
	 M52noeKKBkpqI1ka5/VsAxwtATek1lqWwe07qmUtlhH6rMuvVTp1iJghbFDQFhipWI4YN
	 64cGpuG+/VaqwIJor4XWN0c3hIeMAh+iZx2Tzz3VgdM9K+3F96WGRQ4zc+P3tw5J3gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GSMVwhZH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9E606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB9E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GSMVwhZH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8592165e9.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191721; x=1795796521; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=GSMVwhZH/ueBlJaQiJ5tBFKzOag7BCR5BhXV1vjJ6yXySEI0mT2VMeFtR8YLI3QObp
         l+9xoHrKeIBmt2kbouQcLmWeYtsw1SAQsvk19IVm1GoRn/dd5U/zC3gpB7SsC82DLkMC
         1PxNoFLz19cCa9xeO6jQ1x7QwuiDjsSlO2ve/tZs/untp7QF97TlsVV0fEDCtGEfppcN
         kyTRRyJYJMxJzqyhtxryQTDEnVcltPPWcx/qW5dbw8GLPGUI+zwUL6SyrZNl/H/CXbIh
         DN4P0fC06cQ3rv1oqcphHJY9Or07QdoJ0BJ3bnq6/b+HufHJMelC+YFHl3KH9tbwoTMF
         pdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191721; x=1795796521;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=I/og5KSACOIyw2wCNLEEgDlSDumiVup8Z0TRI8BPvEArXaSB7oViUmtKj+jUnzjHhp
         E+ETIhrhaavJw9CKB6Oeyajd11pNxjg3CTODrireXhdC0ZypEq9mz077bN4OA5IAIjBE
         mWb9abd+FmrX7TuIrjdi71MD22kKlg4sNmwe9mamWKtLEj98nvIdcV7+r8p6PaVvnTzB
         Gx7raRr1ZSMKOm2u1cIsw60M5IPPrai0dgAZM54lZmW9TdePsNoLv6q1Jg0CKvs7S7o2
         k8G7Iw8FiVdmyS/blByHsR8WelGr4k6BjdLZmRDltMFkMFw5RC418CWKHUCvWynqOJFQ
         OhQQ==
X-Forwarded-Encrypted: i=1; AL+hErFjSGcNXdLyXjjM/G1v5oKywyt1kriC7CcGG/J7IlEYya1NP6AF4kqaRI+9tFqLySUSfCBXprkdoFJp@vger.kernel.org
X-Gm-Message-State: APuU4Z81AF4VqK1UxwvWYophtu3jac74g0cHvCQglQtILeezUzttLPDB
	SDhRuiKEgAmf0IDkN8bOaJlSB0Z9xClGjHVurtqF+VfqyajjwUgycUuDLNcEvbPJrPI=
X-Gm-Gg: AYBFou1Iig5Xg19NZQvA5bi7YEgALi51di5O2GetRXwIhMacpUnODmtM0f+e4PRXCCq
	5DGPzQKx0cnfAvdD3o+MnGqky/hZjKMx2/gsVy4QDhrRr4U/V0Fy9zqqLJyvbFoOYkljpXGxVFB
	stTy26ONsiEyBnSmA1mFne3rXECL5wSWRy9KM5xTZSRXPdv3/1CpDMgmygANDskK7YKhjDTJkgx
	VhOcV7x4DA6gDgY2XelO8GBihYCHtVtinUBtnMQbGaXcAbC4hIhRJ2qmMqurjLldgYM97H3zxLw
	ShPxHey2ZJxpiZgrwLyfvZojWHjjqgzXeGidDcnxEb1zWTR5TxfLiZJN4w+uH9MmCRbpNCeeZLz
	pK0T0THVBKxabaKtAfhbTTyNDOb+tdCDMSvARxBEB95Wgs3HQ8qqPvmhcYOmzaoHVG6IyIePNCE
	zzWRKK96otBGvuG4bnU711Jl3Oj0B47+e1oX8gJxx05qdFsunpgLtghygoQONpmuMMepuytQ9DO
	4rbYGDY/ZLmE6IfP9dqXlU0Tlwd9bQZjF+9skPn8uMLhAKSSTvKFurhw4uyF/O412JgftLXQa69
	toXJ6nhowfRUKY1UErk8TciPVOFRnFzefTYbbScvjJZGdHzS
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr77585875e9.25.1795191721065;
        Fri, 20 Nov 2026 08:22:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm129338075e9.15.2026.11.20.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:00 -0800 (PST)
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
Subject: Re: [PATCH v12 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
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
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.6006858658982158181.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=da1CAgmUNSJ5Vw/XW6Lz4OSgqJ+yn+Z+QoMk5bui0gM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxctdWw95f775+kf6Kd3uhXaOSe5//1wwaWVeY9QYX
 yM9mbu/o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOxMGf4nyRy6+VEnRlFq7fI
 GagKJv1//7Hkw7/YmsPPe/Y99eOVz2NkuJ8445EhV1vDy2cFLl7ntuvVZT55xxi3U6SLM/uNTEA
 fBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but at this stage it does not work with the current
> clock driver.
> 
> The clock controller registers its muxes with .fw_name parent data,
> which requires every internal clock name to be declared in the DT. As
> the DT does not declare them, all parent lookups fail: muxes end up
> registered as root clocks and most peripherals read a zero rate.
> 
> This conversion exposed a first issue with the WDT/WWDT parents which
> were actually missing in the clock driver. I am not using these clocks
> myself but it is worth fixing.
> 
> The second round of reviews raised another problem with the
> crystals. HXT and LXT are external crystal oscillators wired on the
> board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
> whereas LXT was not. The series now also takes the two crystal inputs
> from the DT: they get documented in the bindings, described in the
> boards and looked up by the driver (with a fallback for backward
> compatibility).
> 
> Finally, I was still unsatisfied by the clock tree because there were
> too many root clocks. Many "gates" were wrongly set aside from the
> downstream clocks they would gate, and SYSPLL was simply not parented at
> all (?).
> 
> The clock tree now looks much more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Looks good overall. just 2 tiny nitpick and we are good.

-- 
Jerome


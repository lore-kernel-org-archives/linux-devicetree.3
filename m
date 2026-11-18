Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015018;
	b=JVgbvzDf+0xoXTWgoa9WK22lu+rFHCBoSANt9h2ZzrDDm+qSuW20IOmvQNFVSUR855Aq
	 YV/mn+6T6e+05trYr60O/uAAfAT4UXjc7/wzrXi2qFII2TmZE9IOKhLQwb419PF0DDZdC
	 swW0xiD1qE/Dh0h/I/z8mtrImfdt+RT56f6mTjRsYdTL2Uxbar6k59r58fiMx2HY9I0bh
	 upCx4KNMLJHwCmVeZmanmJnOofvSKfANTVk2mL2hDNxvD3m+Pt8OQmI0p8wENeoWKYJZa
	 t8HBqaylcbWsTURDp49qOXqlMwj0aFxHt5DPIorulA3y+06EeYExyQ8UpIeFfdx4/hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
	b=XS5AY3bVEf5lRcJLr+IXWNsyKRXdkeNx6xdMmE0APsDdHS7+XZG2rJuhXR1GzWYjDJaW
	 XdSSniJ59Ksi7NXEl+NkI7Wg+EOvdP/V1txg5G+s3hNWkiueReujuoni4dA5MU+unBNUp
	 ECVharo5yH5g+ZhJxmz+7XFC6IR4vZ7Sme5wDHMHdLEoMCDfdKNRc6db9k5Ilnzdb1bXk
	 dTqEFuBEC25DHvLSXkNyltQNco2jEbpM/w5TVygkJgpG6P3OiUcKBuTqduXbRewr7ocEI
	 9a0gv5RJ0RUR/+CsAAgPC0ghB1IRPHm4lwk3he7vLhvKlOduUqcZfNODueRKH+hCC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iEWjEnyL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9791A606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9791A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iEWjEnyL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so973166f8f.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795015016; x=1795619816; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=iEWjEnyLaCvEhk5M1AC5NQQlDysiyvVk+m/XObmo5r4yFRVJsV74x/mhSkir4B7qMz
         KtA2S2cd1SPHmCasNEl3YXtyCltDHfHkQAUr4PM2xp4ys0o+luBMLN1PJAT04ec0CfEO
         J1ue4dlADD98xco42qsvWjY8TeUYJ91pJNlpG2HzLaUzHGgigZ7K7BJVsf/iRHcd3/ze
         1p2ldMgEy8WXbZamZrds69/CExGXM4jkrb8GBZFPllc+UCMfN/cuXZkZBwwee6elg9GH
         /8ejWlKpm3hSAazBTMqC5VZicJkOW+eBUWv6KXgh3TTCLik9m+6JsizSQzNiQapg+xCt
         6jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015016; x=1795619816;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=q7M1XBPbKpuBqnBDL9g6nP4ycQ7m/yd4V0CoZ3+zOa9UUjxuODWVgV0/RW+veh+cbc
         Zz8KV+b0lhsXa7rNnoQr+JdXqvrW5qpV3pfCT+wM5yjM1udLLZNJjlM6E+0yboP9kYN3
         2Hn7CZChLc87pjZo4MI6uwFLdqh+Gy6/opfdEhTY2izfWvHVArZmvbY2mZ5L2TTRXkom
         uqXxC6CcF4QAdWhLeQn5qO6lxLvoGwCv9esMPRWmNSxgDB3qsYt+kkrrfjETnRSZV867
         roWH1KrRDbjImpQB1aTIRMxYOaa3PaPKbOMZYURU6WM40iIH+hDffWw1m5oib18V5/62
         BDDg==
X-Forwarded-Encrypted: i=1; AL+hErFt94y1CmhABuBxMS+cVCmc/cEXzHERX9ca0rqolIAqLyariFdXGyVe1WVtti7cfLkubblfL9L/IADB@vger.kernel.org
X-Gm-Message-State: APuU4Z+qn71CFPHcKnb5RRbLDyGI7gnrsa8olYvCZym6IagMGFyJrDgm
	thgL7qweCfpqIWCnjOdBMg3nhZvRdzRXXM+SidzvCO1lTcqT+qBXrvhPhQLa6ewqUYg=
X-Gm-Gg: AZFdTZek6JWMbRwA95TQ6y1yXlmwFfE1vQrhshEvx0CSimE+FdoNfEyO6W+xdbMa/fn
	z1Qr3z9E8eMPuhY2e7c0GbhKH4Sae79kBFr6U2APifYIRj3NtrS02yQ/NwqanH74YuLPaPHdbyg
	pltz2VxBht0wwUtxDtafZv/o90diS/sZuDd9yLAkCSDT/CKAl66woCUBth0ZNAKfMpFwk7JjJaH
	eMtw0/EpZAzGVaFl0ht1vQMlWCBmPpEzoXgGvuBWn2lRzJ0QB0jQPFeeMT8WyvDPwC3gEwCVw83
	QnyUt2b7MJSorOWX7IW6AVcNSHxJB2ekwMV1ID7w/NJq90aP97pb0G0wyPj9wZcB7DxIw60KFJB
	Gp2mI0Juyv00n0vcatbOpiphM5zQ1v2tmz6PdG2BQtbmxtGMe9+uhlRYNyIs/C6tyyEqjXAtTWg
	0AglODv8j0WAqzeHLpUbKi+JM9ZUfIyGfqYULaXl6bP0HZ6/PukY4ndZl0poK94MWLs6CmQzp4I
	m6w6lB0vmHhuVjO37hWzTfR80G44XILydFE/+tlxLbopRxmttuUAu67ApU7pdtumNr/LrDr4AeH
	wCiY1cMqsp/7hbOJ7c3zdH2WyPW/3+fnbU4X5WJu1/ld/tkk
X-Received: by 2002:a05:6000:22c5:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4a6ed6f7c2dmr4688498f8f.28.1795015015881;
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5148396f8f.6.2026.11.18.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
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
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
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
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
Date: Wed, 18 Nov 2026 16:16:50 +0100
Message-Id: <179501501070.639563.9357303541273366380.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ze/lWMxenuMFFinRWmaSX0IcexmH1tvXM9t0DvMowcU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/D6bpy/0tV5+lWL51RkjKPQXn58FtMoH+f5SuWOVVn
 Q0z+7iko5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5Z8bwP3716cfT9okus2OZ
 8K++LlbF6Pn25IUzVn3Zf0aba1HEyhhGhjdSSyMeLDnMVr/5vvLSWKM/unu682QdT776tVq3cnv
 vJwYA
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

Hi Miquel,

We've had to base clk-next on v7.4-rc2 because it carries a treewide change
around devm_kzalloc. This was triggering a lot of conflict in linux-next.

I did not look at your series yet but it does not apply cleanly on patch 3
(maybe others too) because of the same change. Would you mind rebasing on -rc2
or clk-next please ?

https://sashingci-clk.liltaz.com/builds/555/steps/3

-- 
Jerome


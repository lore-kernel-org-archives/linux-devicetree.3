Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841386;
	b=j4QPKEiZtSDfuV1cBi/g1e+jk7LTIyFCvc7P3N5pmEsMS+CbAUo3ZKNwLJ2ISc6Z3QNr
	 hQipqMPMOlbQKe08bROiEOQ68wUR3CqgByAKCnwsgszGowVFyDPRlSScWRlAF6aIPdAIJ
	 QPU5OUbLF9AjZo/L6xMTI2ZlK67MTPqkzgt7GXVlrKFcvfeGQ0gSSc9Ym6wWpYYO1/M1w
	 z8iXyI/8r+JmMDrThP6GXqStfC79d63VxLCH7tpvRU+wmxISTj2CUmBevrnUbPgWMUn4N
	 6ev0mNb3aJ9Xse5W3zcXVy0Kep+CucZFZBZ+on0YdpBYcYRxAYb5qbcPZw5CvdE2TBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
	b=BVoSMwv1kU+TjWTo4k9I4oN2wcUGuoj3SVJS900dO0TM0ot3ISab7ynXGpFkPILYEMiZ
	 Pxix4KULttvCqZ2UNAfPKa/XemkCs7nZYeYaMlpCuIQLxIRz8PgX0X8BKMk6bMRYZ+2JR
	 YpoQhw5ZaW5+HHyZRAuMf983DGrnygamU2rdwgaA5VixPO6aSGRqE4d6gBzWFwaP13w0M
	 asQ13LYaAdmtiSdvI/c7v/ZjUvDg/1AfIdiCAWebJtwcHFKK9T9TP7Eeyi0f0y5tldfoW
	 gJ5uoqD+6rooFyHH6jVCthc1/F2sqycVHTp1fi2oQ9sVJZS1TwEQrayhLr3htR7qGnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AP/7tzAB";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46C606A8B7
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE46C606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AP/7tzAB
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4697404c2bso479529966b.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841384; x=1795446184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=AP/7tzABd22mCHY4s/2PcdgvIfVTgRSXHQfn/bR/H134UTLYEiJlsFj5hUlwWsjVl4
         pbJWImgPIjl7qHZ7nbb8WVG2zwkVzq7hMec29IUIZpCX7Vgg11gEaiBvwkAfUsy8bXv0
         zc6ySKUbnVIkvlR4t8xa1vx6UtpTXbaWuV2WtgAaTYHXlii3hBSDu3vZh23HYpYKgHkS
         3edceBcxs8bCjUBmMIqcWYSD3VhEc8XjyApJD3M7VcnmKkbgCaM560iUATqChth+lnu/
         tOOwB4rIIoacqxa5IfVno8RJGGE4lxG5SxAn8qdpyVv6983sAp5Q8zaCvZeoDJYRD5sz
         R9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841384; x=1795446184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=yjY1G1SkEBS5024FzjC9Fm04GlGX6kz6ilTlCFALaD6UaeF2m2gUCdFX/kpQcD3upc
         P04I/PCmLSloOopYwNP/CbpbIixVLvSsr27LGu25HzsotNdgK8EwC3M+A++RcLYnkCEv
         iyWAlcgf1AJlpQ/GzEAC1/OsNDTegEzA8OZ8xCt/17aF4MMajaATcHZ2JLVLDfrp+Ri6
         asJn724pUME9FpRV6IL0Tlkkdu4pPHbR0uRJTrPtVG2+1kYf7tvaFcplZrs3rpxUbnBq
         nDi569XlVjV+VAMKpOIhzt7FavonBkgS9EoWPON4ERVkSPySZ2Q+xSC7M8Ql+J3DOx+g
         dUMw==
X-Forwarded-Encrypted: i=1; AL+hErEKS8w5eO5PfhskyubxY5/htvotsDdwTtIKF3sjgtEDt1HH9eZoErB0SBAtRRsMLmIGfTgcxlAitaUe@vger.kernel.org
X-Gm-Message-State: APuU4Z8xzmf6AugVKxhkjDw1XGXmdezm8y05lydlI8AUgCPzeEu1PaE+
	IYm5NuZhlbtE57hW8/R9TEeRgaG6YGlot7OnflqFyt7SFJAUz6k8mlNu
X-Gm-Gg: AYBFou3ZAfzUmMduCe9UTIwEWMLcugu+1nPtbmJjA7G0GbNcrtzFABXId5xGJQcB7rf
	BE8XZaMeHynJCdzMWd8WE6Q8Ree6r7k1yJJNRfCNzsdo10gWK99P/nfnIpsSGtrJjNQPJG8IrW6
	l2Ne0p0FnTSqiReraxIzrPeuaqYhh6elGeMUWSy61ovOrasY2tUBlI+vD67RWqgfKoZGKt1IEV5
	pP+5+Gh/2DF3ST5D+Y0A2MwuN/046nKRT/gVwgK7OQRm/Tlx0VkKmYDJYWucxy6Deafhf6bPaBj
	+LTPQ6S1yYkLQ6GMWuLj+UdAqOUdptWkY1SQKUOD8ONlZczbvGFERyJ5JhP+py+2oDZVq5jNoVX
	Ms2Vw9/MWy8hKjhvJIK0diEpnuCge9GqKivsBjT4+SLLgkCuAE1ky8V1bUWFdl14X/5tdVanyCy
	urmFLD7OAdthJhrKJ9dfKXVjPT5plD4txgTPfuvg7Fsfkuzp/8yVnVrfMsOCXrUHChH5MRi+nZN
	OTVffCrWydpOxUr6PpuF6NYo5DZ11nrOWYMU3bOU1JkqHGZkJ1tH0JlM3igzluGo2SJHwBLKdvN
	PTUbRmk5Bj0mVbepvY21NtuuUU1TLDEXLawFBV6I+O7IeFJjnznkZMOj4zo/6lTxOJPvAOKChs/
	emHuseYpJ0O0=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c50968394b6mr992587866b.44.1794841384189;
        Mon, 16 Nov 2026 07:03:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:39 +0200
Message-ID: <20261116150239.264139-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
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

Remove CLK_SET_RATE_PARENT from CSI pad clock gates since changing the PLL
clock rate is undesirable by changing pad clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 61fe527ee6c13..f427786a8ba8e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1010,12 +1010,12 @@ static void __init tegra30_periph_clk_init(void)
 	clks[TEGRA30_CLK_DSIA] = clk;
 
 	/* csia_pad */
-	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
 				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
 	clks[TEGRA30_CLK_CSIA_PAD] = clk;
 
 	/* csib_pad */
-	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
 				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
 	clks[TEGRA30_CLK_CSIB_PAD] = clk;
 
-- 
2.53.0


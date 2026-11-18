Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009104;
	b=WyegPbYFcqZJ1U7qB/XzXOIVqm9R0FjVs3OvMOyIjGELPEjRKateE/F5fIF2KnF5vFXv
	 kjDRC+lP2SvULBF0PpwkxV72MKMDZNHzSqzz2TcYVLT0rZSElsoA/ADAS6kZ/5OmLM0C8
	 +K05iFlA1v+oujtX1EcTMKZ8abEvG/IZ1eSHOqWj+A3JmtgTKHUSPlr5Po8Rx47f1yCST
	 pm+aUrSw3GAyzZ7ufQmSUt/7VmmDtewBjZlWcKWz8qunS7A9OLv6qCsWLKsEpp8nLloX4
	 v1SGe3WND1nAbfw6u00X+G78+KTiuUvDly3gjyZC2QhW3o1fLCEXxQ3c/cYg4jhA89w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009104;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=AGWE2RmMJrveHquIEAsn/34An2cqTpUBjzB0QA5yts0=;
	b=0PyG9Y+RLvc+21dFNMH8SJnnmedtWxrsl7LPDNrXYvzfV9vfQyco2HJAgX8Jm8eBqZFq
	 7BnrNmTcjtR1NA6qxujHcUrC906hBywKcI6H2HW1yEh0TSJRqvh3mEzncbJscYkaA90Qu
	 UhhvCcsR9li+azy8M2lH1x5kyWKBJ+Zv0RL86tRoa88rWVwQDiWp50cghCzIRD9NpjW+B
	 InUo3mKbyQ3ny2fX09ZGVCPPfUaEYeccY33KOGba3GjobPHXBDlhaHwe5etSBGiqpUanU
	 hbxcHcRRHaf5ySpTKKoklPgpQIVaVyIUhN4vIVmCd0pgvA1rk3qZDTqVHwW4t22F0PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vaN3vp91;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1A606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF1A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vaN3vp91
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C9B21A16D4;
	Wed, 18 Nov 2026 13:38:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDE585FE9B;
	Wed, 18 Nov 2026 13:38:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA73411BC1FF3;
	Wed, 18 Nov 2026 14:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AGWE2RmMJrveHquIEAsn/34An2cqTpUBjzB0QA5yts0=;
	b=vaN3vp91o/s1mJ8OSC6zzue1loB7dwLglWh4yRkkgN9Txa+1D6SatnDzblqGScjqtbbBed
	qV7fG0QgshHPErJ30v1wxpDG5KbrGj0WyTs8U3HX2JvKZsyQUXpeIcIZBuHF28rPPXRFWM
	3HHG2vonPuEALyKzhCpHQdDsrwvROO4kyWI0TbhM+4M+qAkb0RA5zQpgkO1byHz27h5fl6
	x8bpUFAVWxdel2LGPQqG9q3CN0EscoLuuRL6Pzn3nhW6annxGazDNipi9JI6Lz6nEtT8pe
	wQ65x2EkFYiIgqW+eKWCxbUocxn3iLkoFtEXTL1kxNC/Hj7ERtTjRMhefbMJwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:13 +0100
Subject: [PATCH v11 06/10] clk: nuvoton: ma35d1: Use device managed helpers
 for fixed rate clocks
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-6-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Most of the clocks are already registered with device managed helpers,
except the fixed clocks. Harmonize the driver by using the already
available managed helper for that.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 65a2691002a7..8fab3c563316 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -139,9 +139,9 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
-static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
+static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
 {
-	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -280,24 +280,24 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	 * purposes.
 	 */
 	if (num_clks == 1) {
-		hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
-		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+		hws[HXT] = ma35d1_clk_fixed(dev, "hxt", 24000000);
+		hws[LXT] = ma35d1_clk_fixed(dev, "lxt", 32768);
 	}
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
-	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
+	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);
-	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000);
+	hws[LIRC] = ma35d1_clk_fixed(dev, "lirc", 32000);
 	hws[LIRC_GATE] = ma35d1_clk_gate(dev, "lirc_gate", "lirc",
 					 clk_base + REG_CLK_PWRCTL, 3);
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed(dev, "syspll", 180000000);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
@@ -338,8 +338,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
 	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
-	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
-	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
+	hws[USBPHY0] = ma35d1_clk_fixed(dev, "usbphy0", 480000000);
+	hws[USBPHY1] = ma35d1_clk_fixed(dev, "usbphy1", 480000000);
 
 	/* DDR */
 	hws[DDR0_GATE] = ma35d1_clk_gate(dev, "ddr0_gate", "ddrpll",

-- 
2.56.0


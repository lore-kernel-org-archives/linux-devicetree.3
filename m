Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021607;
	b=2HuMVK01peoSKrxMzHthoW8CXTfh8ocydXUn8hB3l5vbNC99neXBNb/7ZRtXibQSiOFx
	 MlbzJ1Ct67af8IU/15j6VUOrkD9WJY+nFKqCl4K76RBmGgf2YY4c0NN4a3xMRzSd5kyBm
	 e2qFgdEoh6UY2vlCddNAxfPegGe3PqVb7YXZ9EIKEnzwgH7UIgCq59KnngUwgY/fH36RD
	 IqiWGH/dg8BCBf4kQZVAPpzLNX7BtF0Drtbi3tsnfRhOINSdZ/A+VeStv0Lm0q64zjCpG
	 z+5uEOj+IPGQqZW5/T94i3ALFRHVowg8P4tZNdjK64b5JTJrM+zcDBAADcd5UWiheTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021607;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=tGR1Pheja8UX+q7j6BPbOePxrbdEA1lKf+oSFzTuAy4=;
	b=UAv7HpNjw/TDBnqMXNW1QET7RdGnGQfM9yNZ+ZvmqZCFSzUTxAuudSHsAn5MOZvJ83EQ
	 r1mwxGvOvn3K5UHbeJtlgd+eilOkPCMys1Y2Zd2aTgeY6xhK0QcK+KLqpLiXeNQPlQXP1
	 aw1KsHGs7GXPezbkICILA94Xk/rz+fAkIJr/ASTW3jascUJCSqZzXuFyS4dJ/bJ2YN7Ei
	 OGK4X2gXjOlb4QkuPZJr/Eb5Hcx5pDij1qCzj+czVP321cjtzZtJD6NQTpsO0klEeL8zq
	 xJkcFUDgnTF5+QqjB4SFQbgg5nUxc6kUZ0rBrSa9gihlitqlCRsVHd1xsl8pC/iYDyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N7tWJTXq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D560A260D
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905D560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N7tWJTXq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4ABAB4E415F3;
	Wed, 18 Nov 2026 17:06:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18D525FE9B;
	Wed, 18 Nov 2026 17:06:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30A7811BC29F5;
	Wed, 18 Nov 2026 18:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tGR1Pheja8UX+q7j6BPbOePxrbdEA1lKf+oSFzTuAy4=;
	b=N7tWJTXq91CmHZAVeUCRic974Wak36ycLZYVPBV19l92gS7EePUMS1QnL3VxQ1UwyxXGj/
	a637ctUnvyPT3jQEj2+XKFQp72QJXDfmxVBX5B8E+eebxCN+gfh7ZAGztl1uzH5/RkHkV+
	bUzI0fP5YKlTBwOHwa6cJblkbW4dcoerCq2Ifu8kqroQ5P2D9/wUe6x1QJSga9PAOBmlvs
	UdYaczEBb91ov+wceS8QCAlrTfce89d26ARjirGNOgoWAKL32rQvZjIHGQ4O3qDvAKWlMU
	ZuxPzQfkEHw4+5r3VE10OydcUKq6QhFafH3AbGFKMm1oSgB2xlhj1Q0GnG/hQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:18 +0100
Subject: [PATCH v12 09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-9-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Both CCAP muxes are registered with a single bit bus width which is
obviously wrong since there are 4 possible parents. Fix the mux field
width.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index a5a36f88d973..97a90cdb48c7 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -424,13 +424,13 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[EMAC1_GATE] = ma35d1_clk_gate(dev, "emac1_gate", "epll_div2",
 					  clk_base + REG_CLK_SYSCLK0, 28);
 
-	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0, 12, 1, hws,
+	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0, 12, 2, hws,
 					ccap_parent_idx, ARRAY_SIZE(ccap_parent_idx));
 	hws[CCAP0_DIV] = ma35d1_clk_divider(dev, "ccap0_div", "ccap0_mux",
 					    clk_base + REG_CLK_CLKDIV1, 8, 4);
 	hws[CCAP0_GATE] = ma35d1_clk_gate(dev, "ccap0_gate", "ccap0_div",
 					  clk_base + REG_CLK_SYSCLK0, 29);
-	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0, 14, 1, hws,
+	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0, 14, 2, hws,
 					ccap_parent_idx, ARRAY_SIZE(ccap_parent_idx));
 	hws[CCAP1_DIV] = ma35d1_clk_divider(dev, "ccap1_div", "ccap1_mux",
 					    clk_base + REG_CLK_CLKDIV1,

-- 
2.56.0


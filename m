Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009089;
	b=kndMGxGPDDMD/au7Z3Q5MyyjenfT+9ju0KvWhVYWzyR/2wkXqcn1fFQ+sbPv0AkjCfTH
	 VXJXcWFgD/DzoUlLpZyqFooD7wOk+xytuZNs1LtVqoMuL/e9HgkTZqx7+lBWoWVct9M/J
	 0MTSoMEa6Faqjutd0A7JOC80ERd5VQObLBdy+ZfIkNZVROGg2JQp3t/4exvw7iekqid9y
	 ZL3DCO3qF0GXs8cDuOxXRUgNvhkqnN/Gh4zhGdUEPmT2U5WIZg1ZadDGW8BdbmMaY8KSO
	 M1dTfHhNQe/Oj1Lvxh1bd45E5Zwav+g/O3ES3EqN/fBh929uYksNqmd7EoGRlJvicrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009089;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=M/WWk6eenFHSjFbUZXdrNn/7ZFAfd7gMSf10fyAtf7E=;
	b=0S9GWRcNKqltHrU1BQ4SRpMHbcLKvXRc04U5s8To2v5Ce+ClSbw3C9Xfv+BWiD8AeP02
	 vTLMIyEmcgxcF4UNqjlOwwZ50R2ggROJdiqiHfAWqiXcQOdykF4su6Na8h7XR7AG5Fl37
	 fQIgg50x0IQg5Iy+nVaIeT/yAZpWgn70TS6bCK68yOQVpOmsVkrf9+p64xHVAWc84mU4+
	 J2wxkg2PgkwPO/0wLh/+359nwZRJZq+vcb96CGKxkaYyG+5GfqPy84hyOnAGIvuk3Fpok
	 ra09LT+Vd/2wRjLY3gXZ9exqyL18uBZKaqkKP7l6L+DV+2jdmHgr+NzCL3ugaXV/6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1R4zagwg;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4CC60A2612;
	Wed, 18 Nov 2026 13:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4CC60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1R4zagwg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC3B34E41627;
	Wed, 18 Nov 2026 13:38:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 779CA5FE9B;
	Wed, 18 Nov 2026 13:38:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FF1B11BC2076;
	Wed, 18 Nov 2026 14:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M/WWk6eenFHSjFbUZXdrNn/7ZFAfd7gMSf10fyAtf7E=;
	b=1R4zagwgRjUnhGAu88aDqTU9X4E5QVf/2ecNQ+cr/UTS3Y0GrhVz5C9JkldF1WjkNbwnm9
	QkPYt0VtjxnRh+0S7igREaQEFYxQNSDJhJIrO3Ig3jNLE2k3xzrksVuDIkeFoJeYS+vSJN
	Pr1G3VO4TLp5K0GBhsOlEjFYNjeebfgLt7+c4kwp7ZLG1CnhSal7byRxVg4PirJHpAPAhU
	i7ttPeG1x3aSwweCVyvWAaZHuBNGepQAs23mh2yONgKJ5ffazCF8DPkmCkYHQWaL/UZ9tG
	fhoe2bOpTacjRX3SMe3QZsmLqRBSJ4wf4etwr3xN10fCdSj16DLTUi8jL/sNtQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:10 +0100
Subject: [PATCH v11 03/10] clk: nuvoton: ma35d1: Avoid possible error
 pointer dereferencing
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-3-bd1d1e060926@bootlin.com>
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

MA35D1 registration helpers store their parent_hw argument straight into
the parent data, without checking it first. In case of registration
failure an error pointer will be stored in the table, which is then
forwarded to the clk core, which treats any non-NULL parent as valid
handles.

Bail out early when the parent is an error pointer, instead of building
the parent data.

This issue is mostly theoretical in practice, since reaching such an
error would involve a very early -ENOMEM.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c |  3 +++
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |  3 +++
 drivers/clk/nuvoton/clk-ma35d1.c         | 13 +++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..57a7b4ed3b5e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -90,6 +90,9 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	int ret;
 	int i;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index c7c0dc91a012..92424e9c669d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -336,6 +336,9 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 	struct clk_hw *hw;
 	int ret;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index ba3550c083ac..00d635cdb604 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -130,10 +130,19 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     const int *parent_idx, int num_parents)
 {
 	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] = {};
+	struct clk_hw *parent;
 	int i;
 
-	for (i = 0; i < num_parents; i++)
-		parent_hws[i] = (parent_idx[i] >= 0) ? hws[parent_idx[i]] : NULL;
+	for (i = 0; i < num_parents; i++) {
+		if (parent_idx[i] < 0)
+			continue;
+
+		parent = hws[parent_idx[i]];
+		if (IS_ERR(parent))
+			return parent;
+
+		parent_hws[i] = parent;
+	}
 
 	return devm_clk_hw_register_mux_parent_hws(dev, name, parent_hws, num_parents,
 						   CLK_SET_RATE_NO_REPARENT, reg, shift,

-- 
2.56.0


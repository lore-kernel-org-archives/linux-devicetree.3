Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021579;
	b=2OfkiF9ysTLXA94N7H/F7QlBPsP9e6lrN1UMEcKVaRewxwnpkF0GDW2Ug+XyE+pPnoU/
	 qumk9aDZPkAd+iLpIcjedEzXEOcZoEvPVIDsTdQ9Sr3kZvV8mRVEN3/geCohC4m217HwT
	 oCMIPZUKU06cvqUp88BVVkgfNZYNotdc84KDIm+0SxanLwK7+mqRhLDUfD2bg0PzFRVbI
	 kY9yhwz/Q9cFl8xfMGdwCZJscqCld+n3eXPjgsNHGnmTqLHhIaH8E03SYOWlw4wWozp7L
	 +pMKwfgntYaQ/jpAZKHO2aHKbabguiLy3SPvGO40JPFjl6SqPdtESoxTJIGnH9xSooQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021579;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Xw0wOfC+3llFp0mGNBsFubLaHT0v1FUo8R638rHnkY4=;
	b=Or7gEMPbQm0t02bPe9uRQFRxoNUOVNklHsSBgPskd1wnuGZGHRfGCnKIjl4E43m3Si2+
	 PGEM618utLHeS9IbC9NnQoXSAf90240zDQN0N+7Jo7eIVnzDAsmf1taM/RVNKLsjAWPSu
	 qJRhwIX0vTpVmicNzLqBq02QjxUKRk8KqQEsivLsOwMfZWrJPSRbaa7xlAl8nGjRVIuM/
	 2FY3oKWy5KP21zuHgFcV5YOXz2ztG/gfhUGAnwckLtQZb75oErWRXUrhXb7tqJzigfdeb
	 cgquv9JTyDJ12I5w5cYg17kF2XyrlS1G1vvNl5NvbxrMU/+QP231CPBbeSBN6LZMN+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IYAzvvlp;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6D606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C6D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IYAzvvlp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37CEA1A169B;
	Wed, 18 Nov 2026 17:06:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F29A65FE9B;
	Wed, 18 Nov 2026 17:06:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF39811BC29E0;
	Wed, 18 Nov 2026 18:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xw0wOfC+3llFp0mGNBsFubLaHT0v1FUo8R638rHnkY4=;
	b=IYAzvvlpXSExN12w27IREZ099UWJlchuxPNBytLvoDR0+Mt6DcIF11WYviRZs9KHpLZblz
	6/CjM82NXbKPCMLosowhd0EUYWw6C9AU9YifcggGUqGwv6V9bt7ITGqMTP33qUNHV46pM/
	TlOm1NAMSNq564XlzhWVXRNRqeJ6CwXXJquWfyFsnD5hrUIdePqFOO4DU5FEUWI2GQJesS
	+618gsUcEygSurq5Z6QObujDsLY8wcBZ+KfShzof8PnaIeC6VPuSgNCY6xyZ5gfJig94Tg
	D+yyGFtoIueNVjnYaFci5ox425NLNFf36LyPMV6TOklZo13FuiKUMxkdh+hayA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:12 +0100
Subject: [PATCH v12 03/10] clk: nuvoton: ma35d1: Avoid possible error
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-3-bee2c8dad4e1@bootlin.com>
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
index b70f460c48d5..3210ec8a1bcf 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -90,6 +90,9 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	int ret;
 	int i;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	div = devm_kzalloc_obj(dev, *div);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 8b7133284d46..79fe89d5b6f2 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -336,6 +336,9 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 	struct clk_hw *hw;
 	int ret;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	pll = devm_kzalloc_obj(dev, *pll);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index c65ceed2fd5e..ba12d4068e83 100644
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


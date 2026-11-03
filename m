Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739958;
	b=Gyk80YcvyKRSHgQyACdb/+KdQ+BemggfVll4839mw9X1QDOoOo4ALiKk1jTS9UAD9Xr8
	 oUWqk+R6M+VINqH5lZWOSbusPOzJycPtTatMgP5h4Y2kE1M780EwOlB7GN15KKZNZ0Q40
	 0jZ2f0enMRu/ICpf4qYJnvXnDmuqFlqFiZp4fjlCcYUC0VazLdY84zKYXTUra1m+8IU8L
	 FiiPJdBFbae3cOsR3OSt+pYqJwJItrAqXLVbOIlMie4Rqhb2Tpdf8BqZGglgvTLBPUtxH
	 vE0ClRrHbwD+cHFcuizvh1sAUIjhQADNiLTOj2T44eWYJrtIWKwr0fMP33INGGNBUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
	b=PaiqVifCpBp9I4CpBadoIt7d6gIWTu4po6n5oBz6XkLaMG5fK5PX+b2XJRwCR1INaOsk
	 K27eC1vfMdotpMzDKJwck8/0mnX0iub5iPoequyGyo6/K0P8c50RenccsG5YzHkrKxvp9
	 niYi1hxdOwbkj05CwMzTWktoCAKw13y1eOmC1ug9KiqT6vX/vU/ip05bM/C5S95fh19M+
	 HVrUt8Evk3iGag4j6F6+upfxBdQcLMjMUw6tpiWg2cqgDNRrc/9ja8F1kWyLM0fGGDihY
	 WFct4KengYgump9LSsBgdn7ubqjcFdU8+mNTV+LcScW6GATmDydmt38cykQMmEt3OcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJuvyz3j;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1041D606A332
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1041D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJuvyz3j
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso11400f8f.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739956; x=1794344756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=OJuvyz3j70MjV8XQJoIom1Q/RGba1SDSh9oDkAGWqCHZJvRt79oJJ2dNRgEpZ15hHx
         uSvh/CAjG0Rho1dTJn/GLNrpOw70dXusp2CcEOp40TMWvGOE0hbP8qaqjwuG7sVQAFYt
         9gFWE3VP2/KiQf1DEc1Z+KAp7G1Rs12rKa8/ztgrJ6/z6TOq/m7aWcbpEGjkdhMjKALG
         5vA90huOJO7qrWN20z3retMDkuDJZLYMlneIy5fQU8OG23qDiKOF4Wfk1rVNXf1q3Hcu
         J3EeQqX5nMKG6S98M0pEm3ZgkzGWX6VT/FYs6hTwa0EEAhQ9JD+98CBTfCDj0DArg9aO
         bcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739956; x=1794344756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=jZ5Vt1VDhxYylYF5RWgIksmp1igtMbSdKcB4moBkr6PEQ9xii6uKhXLNOuVyFvpShy
         58U2EGNXaquJ8vYtpnE+BH5doWbpl3wkSGlsGLuKZMEPvm0GaM4xTDjRnwQapTEko6vG
         zSAFi9i63Hzf2qRRNaoPpmlpS7eUxS8uFIRhLUD2wLz533sgOMi5C61PKry/eGdYVXIZ
         OuDgjVwom51mYHNGFZ+M5unAGAmfK3yMuHPB3DBO3KuwDlYTf8aa7scuXJr2ymnt1dOr
         erh6yDC9ra2tqj8cZAtpLJVCQcA5AhpPp1rTqFTUuUsr72UEu39sKEoWGBMMC7+jkDzT
         nu2g==
X-Forwarded-Encrypted: i=1; AKwUvBxSNg9hKe1w5C87yvpB6B8e8rW9bpgUMet0b4baaVsgyaLZrzdhoFt7UQRYZBkcQIdEuMwqJTZIibOF@vger.kernel.org
X-Gm-Message-State: APuU4Z+0IVvXWo1XC34iZbdynffSRywvDVgIexsN/4EmVCOxw54CboA9
	QSIYJirFeLBVxFqENsGmtuMhCmxQBq1Ca51vg9KmytBeyO/6scdXBNwS
X-Gm-Gg: AYBFou15ndpEs1H+PvDD5geqDfIMKsmNPwS/ozofsTYzoTAXRnNj/W96AchQbPNmdo8
	bNLaEyG5bnr8xunLmWb0qoCeNfp/BCJHsj8uxLGRGJ2K26hknozj8Eeak3SG2JAxpf6Jyi45Oyr
	1Rd0F8SCu4qw11LVdhfi7Tq5qZJv6HT2ygCH6jZ5fJz9RdXhs32F4BKZtJ2hIw5AVz5/4j1u426
	cP2bEbwt50Be+oZvjEl1zYuAr1e5CaFaZOKmWArtdo8/EZc5KndW3q3H67YfgobNOyNBK+iRBts
	0q26pVUmIkkI5B971plYkXE25hO5+r/QN59x+R/lgeFwBvM0qQfPPvWDhVcKbrEUf1Py478jNkN
	zo33TpMGIyrUhuImqZIrX3ThUsxFF7HYgg5boW5luFSWLNxPH+ChFd+yxgvl3eUOgfRmYsL6WQv
	GlG6CgVx5JuT+cWRicBDjiQ9NFEYY1j6A6GtmDqGUklN0kKECAB6OZS2R6zgqpt+vTNguJGM6me
	AwKcgFKsLAWZgBI4HKtxQ8q3yNhrJnvjkfEn8n2AKpRNvoPgN51sOpWVoB68BRPRNYridaQkTWc
	zIPoZ87ZuoCzKj6NGrIBlhZ6/+LWi7clQcW/p65gCVaB6TUmfEacmoBcA9qTz7txCUJ+gfB8dCl
	dxx9dSDDE231klvRPfyTI2iSzbniUV2u3EQ==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr345625415e9.4.1793739956406;
        Tue, 03 Nov 2026 13:05:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Tue,  3 Nov 2026 22:05:41 +0100
Message-ID: <20261103210542.15965-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103210542.15965-1-ansuelsmth@gmail.com>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
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

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
Mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Use match data for storage

 drivers/i2c/busses/i2c-mt7621.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..fa1f32d4f046 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -57,9 +57,14 @@
 /* timeout waiting for I2C devices to respond */
 #define TIMEOUT_MS		1000
 
+struct mtk_i2c_data {
+	bool have_scl_stretch;
+};
+
 struct mtk_i2c {
 	void __iomem *base;
 	struct device *dev;
+	const struct mtk_i2c_data *data;
 	struct i2c_adapter adap;
 	u32 bus_freq;
 	u32 clk_div;
@@ -83,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +99,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->data->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -247,8 +256,17 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 	.functionality = mtk_i2c_func,
 };
 
+static const struct mtk_i2c_data i2c_mt7621_data = {
+	.have_scl_stretch = true,
+};
+
+static const struct mtk_i2c_data i2c_an7581_data = {
+	.have_scl_stretch = false,
+};
+
 static const struct of_device_id i2c_mtk_dt_ids[] = {
-	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "mediatek,mt7621-i2c", .data = &i2c_mt7621_data },
+	{ .compatible = "airoha,an7581-i2c", .data = &i2c_an7581_data },
 	{ /* sentinel */ }
 };
 
@@ -286,6 +304,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c->dev = &pdev->dev;
+	i2c->data = device_get_match_data(&pdev->dev);
 
 	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				 &i2c->bus_freq))
-- 
2.55.0


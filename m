Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908482;
	b=KBSF2Wc/SrOg8Gdd/hTE/R/pXi4vOdj6JmUrjVXRZf9oGkbo8wcZ4UZ4kdLykkPoJeh5
	 bCVaYriJmy0ZUpgQfuUm7UnSNxmWlgU0900ReV6XvqUqJodWJpJ2lFfN3bFAe+V1OtOXj
	 t4MrIagnuT87ke0LY6+mluLS7iojdbrpXgH0QDZuja/fbk9wLaK1wxGMfH79olrlHhvCP
	 xAx/FDT4aXtny8yMYZCyYDuRfdSptlDUXtz38ui0QcAhG72ejUZHDrKULHuGxcVmsAbBy
	 fHv0M6hojhGk5X1rl9Omy6WZYxiZcvNiLUih7ttn7c4GsQk9zP2hKJfvJLLKO4wOUmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=B96M2F/sHBjVaXAcpOfICg6PSey6RctUrRInG30mAPyZ4o1VOTQ3VzVettK9o8JpB0la
	 1saz4KJYs8T5mpjotJRguM30RAGoIRILzv8nCRNikcIAyAZMmYvE1JGM/2wiFWaBDhO8C
	 e8Y+B2MQeiOCyMd8XBiIjAhF6srwl+xs1psOVJ6bU3yB+2RXUTcqhjB5V7zfaZHhHqPp7
	 6lYPqeaQtLt4hE/nwUq6fo6ENE0z+X/jsoem5s15ytB5ucxoYDLJ7ApevW3FUnWOt+vsu
	 n/sPLzK66pvoD4PCgaznyb2RskV39u8YdNknm9gSzQ6i3ca8p1Vlh99x9ZAgkq/QFpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mk74D3vu;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322C606D52A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 19:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D322C606D52A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mk74D3vu
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18672835e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908480; x=1794513280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=mk74D3vugzXXG3Z0UBbXjsO5vv9fwUFrHaLSmpnapaKLj59lrS9CIODh6FYPMUYZcS
         iuVOY6npIpTyECG3UKm/6DjRfv7Y/TDgKQ1AzFdDHjRsU0ZIkgyFcwOLF876FS1ICGvI
         ShCDrobFbRdiXrsDDMd+E8Ndr5ox5zt37iaWXNXgSrfPn9bC4VDrIuVqkGFJEzW644KS
         vQr0Yw2iDSyZoWugNjf/CoDAh2E9n+A8sCBFV/R38uNwSJQeE55efL7mlobvAzNnGm26
         s6XraeIyXitNtpKyEtON1RnF8IxIudfAmDMsnVB0ypomWp6eUkRr7KPemXgud+VYvlP5
         M/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908480; x=1794513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=kqcmj1NhPYKDJJirCFBLx9ACJJTO9a8nYWEXA6iA4jsMsd6Y2QjmyvAuKGQcWVF/V1
         8NeyY/qRqEGY+b7M+eRbjBfbYHSj9WMEy5qRVJamkbeLK4GINEkcSEgxw+8avZmllt0v
         jNIl922mACWQ9Kn7cE+bMYFO6BHyx7Z8z2cCJDz0Diqg4YhLEa7fWtTQg/6kR1nNWy2y
         lW7g8mU4WS4dXTYN2yhQqi/iXwPWgN0JGCuJAkq1XB1aIh2WBrnY6+V8LYVYrQ2yeexX
         we285H2qdwqhiWHveVjD1tlqyO/zD1s6AUb809JmYZXIqxbtuIH7CwB2nNsGWrhSorLT
         kyHw==
X-Forwarded-Encrypted: i=1; AKwUvBwifTfjCxXZxCs1OcJWpRs0itWb2HtAteJSILvScbUtdXYLeUdLsNbtBpHLz2YyTnYnw2ehrvHBpAF0@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hb6b0l1RniZaPJCcWBVBJtXMJV1AnsN1793k68QGw8z1ixZWy
	34I5/yKhxokABFmeqTbiv+SgmeEMjTIR77anSYAK6uGeTOPXNobV7Okj
X-Gm-Gg: AYBFou2zKDb6lzU7wYwO4pn4MgR8rGRzCP8LgwiS1DZ5O0kwuglaH68jV6ZhEJNOoAM
	I96UETxgvx0tiswXYvq7y+CarcQCDV4KZe4BcadMd0LrWLMOxnA3V/1n/AlJRKdKndAoS2tlubM
	kKclWXV4FdUzSpY8J2CsigveKASStbhg21DKqb4Hs9uklP+5BrdEHcX4miuzZ/OgmENDxgf/PDx
	+byxQSRXCWEz7lneNq/Z1FUayLSmlOivvngcWxY2EO2W7GGC6z/3NQKAqYfyfWrBRP0gj5i14i6
	RnzbCpdEAEGiEygFfCrpzN4U9la2Y9UeH/2Oo+y2L6vqKnkxo2qoTJ2NH2ewtIdf1gIHkl+MDM6
	8ykTG6XmuSDk+ubudw2FGtR+1KbvEZuD1x6tDRq3PzB8F9rJYEsiSmO1PVd/1BNTPkP/EIhvzZk
	/bARWLZDFMg/SgkMoU9DIfeWiJyj32QZDXTNjdqAi8NU8G6sU4lF9iMYVRvva+fY8Guldx1uJLU
	F9b8cWTgiMhV5WO5G0Bj4LExAGwXtT4iLAJq39TBmxogGNFr1oAseszh0oZvbhkuKBl5jeMlck1
	PFrJAMZt97/tQjkBh9DGSIK0
X-Received: by 2002:a05:600c:1f95:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b6e063f1e5mr3032495e9.29.1793908480210;
        Thu, 05 Nov 2026 11:54:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 5/8] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu,  5 Nov 2026 20:50:25 +0100
Message-ID: <20261105195206.3440-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


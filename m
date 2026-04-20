Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11040382F0A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721128; cv=none; b=KM7gOs3Ky7spCglF72caQmjGtyHe9tfKHokHw2k7KkNLYO0dGl9NUreoqXvwt1JfphMTnYN8BUqllKaOSvp2SRQMjH3Lue/NOwNIkr0Pjmpb8lYjC8Lplan3QibFWunvmRjXQm9l8x0ogLbca0tp+VscnC1ivTm8lmpDgXCW0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721128; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzwOMak6EVEHahBC0vTN3f7Vwn4AaOUUWWFNGzzBh0TUISfu5HENm4sAmxDWrGIbrJdeMAjtejlhU6A7IGLiDIPXitJRkolLGHN5ci5k39nE+JSlDCL19fIxMXK03fuysGXfw1DJtq3lXZ4xn9CEA+n2R6gliUbyXk5ujAK7UtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikqafPKd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikqafPKd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488c2690057so34938075e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721124; x=1777325924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=ikqafPKd4cs7KbLsgQuvv7ilKX55AdVT+VyJFu5Rn+NkhZ169tV0SBRZZbzmOuBov7
         wkXSzqi/Z5AD0S0Zzkav20uHMY6FZb1sPjQBbykMDr3bPuLSrX6lmtwfCIv/ViN6ML9D
         r3iFLyqrnm/aGS/bI1ZSwheZy8X7cbVVSqIm2gjHMac7J+0AMQb3ymMa42rbp5y+V2/S
         QaYMRiXeotnXiAapiGhd5uoOMM72Ljaq+vqYdyA9ioStq8rBici+TFsZ6pJVU+88/Anr
         yR45+QEUrwLkJ/ddyRnrhtYohRY9QMD9IUwzrR3WWniSvU8Bq3DibZ+BypropVcCzj5D
         RP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721124; x=1777325924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=qlOxnrCPxF2ViVDxbv/09vXQIwPx8hq1pIDlPsSb/36M85AMPCbg2Kq8MjCWqY3h1e
         V3VW4Hsh7aqHpiXACVM4YAauzaJSuYekKOakFAnpeqkrU4wQAfM5hunKlbTZB/AIYgrn
         FkNAUHfp+Igqskibq6xxZb3yO4h9LCfw+RS7DDx/2OQao/0rIVkdgB1MOnXo5Fh9BtKH
         AX0IHH4QQXNvo8QPOBAADWBCjjBOLEBcRaIJ1Df/TUqHGYGX7ZyQ6QXp28ibzrjumjmn
         93hoSfpfewzu+Yp8wCbABMN/vR3ztDwxjH9H0SMztAuCSzJEaQEhNtHklYnFgsDOjYAZ
         KaPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WHYaWCyTdLL9iSNwMTtgocAXZGTALfO/cRc0Z2THOqXu5JD0voXkFktk8E2d81PBXFs3Q4ej+AseY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1GH8jTtZMgqu3CXfWbGN9JbzaqKHY8ps2d9Y92cwcGhSJ3uH
	IYcivknWkk13iQV3dOAolXwtfLWjmc286+f/SoIF7qhyubVA9g9vW8Dc
X-Gm-Gg: AeBDievmdoU+WgNeerQ2hv892kHS/KHpP0FMqc7Mkm3h4mHDO2PMyC7kBm52jPLNiTf
	nqNfOcdn7VHe9iPQCgdxUb2MReIAGowRl86BxOc5hGD8A0NmO1oLrC1xPhN+JJxZGg6r6ljbZBm
	YKLx+Vmcwxr8ZHDle13jAGX50lfxxJCgxtTZY/EyJxFpwmJSVk5n03+3jFHF4+PYh6qdWclpKnp
	LNFA8PORtytTioTvcViGLdvZsGpHm1im46o1xn7Z/D0JLUIOe4JGfwyfOY4Xt8KL9tSMV0gM07r
	AKvuTTzwPGZQR1yJ1d4sfi0S6tH++m5/AfbeGRYkQaMwSroKWnxkSEpak2OQ5fuDT034Yd3IH5E
	SYNPAKaHJaDVi/63WNzKQMLR3aELxy1337cw0z1ePzMbd1ZERdhpqEc1NkaWPh355Iwu1u5A6A0
	9ANf3KkVPApiKU29piyyYeMvR2mr17xw==
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a53ea14d3mr22358675e9.25.1776721124372;
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 20 Apr 2026 22:30:05 +0100
Message-ID: <20260420213529.1645560-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
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
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
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
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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


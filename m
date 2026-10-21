Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580017;
	b=2KaL3qxNfXexho08jaZhBDPJ6aY/CUQPtmCo1jt4vPI7kqu4iG/Yqglha0z7Ix1O4RIf
	 lPM8udYdByjpLvRhfzM0BG+VVLwFow+iQnhtdTdaymEMyoVauZ7RX//I4/6Dl3Bngd3n/
	 465Fe4ZjoVnZa3Zm162GTnNGWIY4m07L86kUEWNW3AEddI5DOy5T6txru6aYVkHKHYXa8
	 nWlLq6ZW08yffWmLX2PVEOdt+qixONnNgHPSAK3UwANtwJLxMJcd8zYAkgKz1S85c67td
	 gnDFycCS+uA/CbZ3RJ0zWuF4fnw+oUWbpaUMvYLkdh2VqHi/TfZyNRwLw4X0s5Afg1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=3BdpEDzcOeH3Pj6MSGHwV6XtzCZ0jsaIbXjUNigXQ5N41NftVMCA+zszhUW8TiNeCV//
	 rdZ7ktY4zuiafXJwDTDskgLg56tvI0aExlpMBcYbaPzNFPq8C2OX8CM6HzsGkhr7GvpXT
	 luJ4XLKEQRPT09f8EpYxCAi/4igLbosL/LAwHLQ/OOo7lRFErrE9vr2bGZdNM/7WpnEit
	 j5NBRO9ZHjpnfgCv+GoDNQ2V3n94NEIU0kdcbyPxXCZ36YDk3W4o4GQ5tP7hH7C58EhOc
	 Bq9XLHSN2NEu/spUbSYpIms4SZJ1SFObR/15XtZ+wLSk7hEC3KITchdMT63Ofgf06Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqhnUmc+;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD2606A322
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEFD2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqhnUmc+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1129779f8f.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580015; x=1793184815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=VqhnUmc+IfS4dyLcwdf6o8jCet/Wr0E/jiJ3m3A47upXon3dtsVNqNWa67BzvlHBUg
         ctS27FXdI9Vsl+CAa7WYOzKIREPPU7di8eIWog/Ufj+GIrL+tg8tanndzUB7bHx+uhxt
         0JA3zlkJQxmu4y90tnFA8IGi9wup7y4n+aGLTxzHQmWNyaih7TvvP4H2cO37qcgB79oT
         KrAikpDILAnJbn6WW6nHFIcyUnyam7eA9xBRQ/ojAqAhpibdE3sCxV2qS6sd0FnAbvxq
         i4u4Fl/3EPgYMy1vfV2739UAO2TsCYI6ggwO9g5cPSpWXjmNe0zrB+BGOXoMiwif03e2
         +ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580015; x=1793184815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=zHY9qDCxC6KpeO04chJnGuVFEpha3JTmrX6JoqJDZ8ZxqXJFy2FciBBKdp/C+fQwyz
         +LCUI2cgPgNCsqcGmpDaFOBqJnHM7HMFHYCD392dI7iTQDdU6wyRsSBfPtA5RtokVQnC
         TTZqQXG4zaCmfNgxzyqtG4oWIa13vyv12QXlE7ezYahtJsjE7rIlRbO4vv7aOt14nzLr
         e1IGOy/Sqr4eqpaNeKzFAV6HgYT/RkxSIp8evsThrdshGKpDkeu/PE/ZULdQRz782kxG
         KK3kvbfcGPnadFj1XNK64++ibZcxHbJnlNdQyAXKlk2c4KgJyO9EB5MPgyey2m/OSIru
         S+Lg==
X-Forwarded-Encrypted: i=1; AKwUvByBIyn0+ySF2Qi7KOLmdiRPkIEm3HksCKbaPsyZfswENxWYvKCHMWCqef8puvbLwKek7jFKb5wAh+WO@vger.kernel.org
X-Gm-Message-State: AFq9FYJiZ59qTyoJzam5G/txoMQ9ws3aQzU9ZFGxEnax3Gxvejar9LHK
	2bP9lTLKufmVVDuJ98uu7xy4V33OAMQqTy1iwYjw8ogOkmvlYRcP59Ea
X-Gm-Gg: AYBFou2tm6I0xVPYrYWBfCVmw1POJkGDLH2O+0+lkaVg0RUihHbbDy2R5R1EiyxeYTu
	PdVidqnv3DrgfdwebOAUlL2Fr20eJ8YwyG+coFJrMh0IeixBAItqDBGcHjfHs049yjhp3C/EjMm
	8goBZASTWScTZoiS3lKiTi6d2/pVeZxuxjm7M9KINvuqbdgli9vgei2zOm1oQCa/o6It98S2n5H
	ZTcdk0r19c8GGLJ99VE2G5YFv8pTkmASLf5AkuUeaTe8+/PrR8EmCQny+r9dypFMFyznwJytJ43
	htpOsC+RFKf0Qmd2DfkskrcMQBQCWkoGQuuXYEkh/dTbZAolHAlqnHpLc67kM4yrqv+YLkpIdM4
	YkdJ+2OOhlOL5tiHgsxZ84cs/gG7XJD5HbZ/oILEt7BPxi+Znn2k+rJE0LetfjkTLL6gmwBRJDI
	SsqNee+SMx4c1E7hwEdbLSzfFanXzv6Z3sZsKjFcxvYsEh7qxr8WXZV36ixGf/wE5/vlCaroHSM
	XxnQkeKsiPNyzEh1LdixRtOOraKjC5DrIBb8O36oIhX+cYk6kBs
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr35588045e9.14.1792580015036;
        Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed, 21 Oct 2026 12:47:24 +0200
Message-ID: <20261021105109.199886-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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


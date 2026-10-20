Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517871;
	b=zic4/DPlNyUFJ7hhCsBKHx0rZ5RS7P/jYAjJmy6sSFVYKWsi4gRnTOUnQLRzCVvG5xDJ
	 KmYum1FrSXgr+k0ZG7d8yrflDjhLJdRwe6fEwo/4RANo0rFL1MxYDZT9MS75gHc+p0CHd
	 x3dNsNFyUGNckm/zssfwtVupSy8Zgyhd+EDqhRvtQxwQpLQuRngJ2xPh48kdRpgxleoX+
	 JAdgGXjQoI8hJBmW+P4e/ImN80U6weoeO67BplSdIQ9UeIQJu9cnEducehioaREWK/jlO
	 HANdOo/AEzT9RjMgHihdw543e0l/bKDwF3W26PDVYP42Jss0D6MZxrCUivhVa/5ip0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=Gp1vqnUFJlx72n3a1zAfm+xBXArEHjJqGI9+NQDe7nRq1HcluUUcGYAp8kxOubR/lkI+
	 mdtKj1bD2/UdUB+KW1+jdI8YfDUPDpZGyqFG5r0tNJWmI28t05gHNrfr7+QhYgxO8uU7u
	 S77bvqL3FwqooTPp3jRcfndPPKpMNWFPn51+UUM9z64RaYbhKihzWolC82UNLIR80XkTG
	 djvo7lDaq5fNgIpaTH/nT87uRkFoiFSuC2dQuQ32TLNZvOPKCc8sYQEFvGFN50PYOgiNQ
	 ZQCPflCpxJ4Kcs3ehKfsk+Lk1w9nD70A2L9RnPwRFqkrvMZ/zQVkrcxXeUD6ZwDI9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L48N4DES;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790D60A4AC7
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3790D60A4AC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L48N4DES
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so25058585e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517870; x=1793122670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=L48N4DESJPMuvTIdKy+bXJAL0dZnouK6wG/XF2R1DWSaZzsOTOsvBy/sGuBN3pyhEQ
         QAxIwReDLqmluK3WkWr/pb/iKA/CgH9xAf7bJUntUWGgIwRFGBOxJgAffbyEapj5s5Ax
         Q0WNz5FmO3zq1gD0DL+xeT8pKuIgd4ffIHSk06vnA1B9R6Nf3BwiTdapE5X7ZjQTSIbW
         IF57BlZ10S87JVLWyj5n2lu6oSZlmDckSMXEd3+A3l8+OyjNrLGxUK55CwPTE+OqhEik
         cKpe3KC2ALiE2wEBsknqgggnq0gITQtCLCSXTFp9yoYlHP7WAlPYS1LC9DOmKC+1cAHm
         BjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517870; x=1793122670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=zkmtBxZnXpR2vYT+875HxzsNxv1SVV/Iw+i+g0iTUX4zfomsWxBJrlohrZtU2bu9im
         eRuGw6gFwYHNs7VUiD7vT1Qbgw+CkDtzES3/nNudnPW/hY5thDSQyA6UF3klnLOUcsGh
         Yv6m5h/5cKWCaH2s/Li1cd8eiJMrbyo/O8e4sZtLI4ZwM/Oru9t4LSSNhk4UhIzRdzrV
         ZZl7UUWDttT8TqxH8S1JMha3NjU3rVUNUODrgg6gC7B/7/nz4o0dq6tqwyxaKJJRIBJk
         19Ll+Syvf1nXFV44VoU6zg5jYssr2M2N8er0rpLrcJGsLIfPKRn3SYqNhaykBYWQePbK
         DHZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+SVF0mAFLDEErHoFYqcyIk9fIdCE7xDshS1NiSmRFe/66aIByZgRQo0vXUkEjg0bPibb7F3N+sMKy@vger.kernel.org
X-Gm-Message-State: AFq9FYLSxeIHIDjFcE+05X27Vq2Vi7A4yaRvGiFvgnerwqoiigUHwKCa
	D2U4D/CYnfRdLEiwGrHuD2m2BK0iVw6c+WF7KcaDTWRyvRcsJW56ajgG
X-Gm-Gg: AYBFou00l0Lmc3pEkML7J3A7Dj+oAUtB1gNpRn1zXWP4z00wpS9PmgwENW7f2jjKzJx
	izQc6N3nKpTQuPjrhcS0Js5jfbCCEM0Owbirtk4Knh9CHDNvNcgb+SCfhK627PCYXn2ojTGpL/P
	JvMEy6Vt5A2DE7g3Q+mYHYteT0muA2izJvLoG5d/rUHQiM8CiJR2vK/ny0drqn1C9Z/WBW1yPdG
	IcARNW4yXTHYCfz/pNRcPXbl9IPQX1GQQ343NhXqztVbfBKcGrn9adtou8EaVgTVCHkTuNTvC2y
	DhhnblKXDV4+hZU4EuTZVnw3cOqBg7l78v+YxCdBlHVR080ZRmCudAAup3JfIiV5EuHFSBqtuyP
	Bhu69BdTZ6XV1MydbnhWK2qj/DYWgcRsKGst7OIfjK2VLH6uHzeL12B2M4DKhzZQQnyN8NGuM58
	gMYG1kSvROzC1fRGwUf6kdzTBh9NVNfHWdxri7Wt2QK/tVarYDW7eOmV1cOvPtePCObj9yTf+YE
	mF6
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr254696305e9.20.1792517869433;
        Tue, 20 Oct 2026 10:37:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Tue, 20 Oct 2026 19:33:27 +0200
Message-ID: <20261020173556.632798-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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


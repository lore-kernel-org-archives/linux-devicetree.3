Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821623BD06
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330251; cv=none; b=e2M4D8GLsQdYpDiGzBjz8EgixaI5ox/AYMv0JmY6WryBqijuEOQGOSVrK65MiwhwkuorRWjfu9ddUPeY8lxx8J3etvVSi5wmkPfEC2TlwSdOxlEEL4A4W8Qcdcgmw+qsGualbjiUuQ4DDvr6pvfttw95CzeOAfWC468AyXD/6x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330251; c=relaxed/simple;
	bh=EH2usWG3KiERchnJjFGk6OhIQgCb0oojySoktuR5Lmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhSjPJ/VKxDQUqbMD6vJLhRk5nKa5tbUQ7YqpoIG+miV06/TahvKTngq2Tf2XlmkLbVl3hxtSmi6OgFo6izLnjBD4GlK3g5HMOK+qjxeFXB9D5zUom0VPaxiSqTNXnYu6Ar920zkiEXERW9iO7E82iN+5yzFHsCSgBy/TcFG2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jVB0o0ZF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jVB0o0ZF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so4705014a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330250; x=1774935050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=;
        b=jVB0o0ZFXUq/aaUBWr1s2JPj/2OTbj1gROcrRN2n9cikdS+goVFl27SiVHBJ4QiKME
         ekSdhksNqcR0zjbL3vw5MWtAUcL6WSVNyGDkyS3/ns1r6qGK5KPaJoEweXDlQlRNirHl
         AjHS3r0ejDqWkNyiev/tYZlOQmFNIAXXNTLIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330250; x=1774935050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=;
        b=AM8sKl5YCRiHPTpWciSvrK+IzDKIL6QXD+APFj1xPzd6Sq2Mn6RdgLnw2j97KnFBRh
         a+9idttx2/+3QCurVRw48dy58C/Co950viXbwDALQ0UkZ3TDQ2cjB0DAQV5gUhdbiZwN
         YeDs6d3E/JbgNpXkFwPO5Mkq6uxUu1I2BWsVgzzkxYiL6j6mHXWOVQ8zGTddNBsYGCG4
         ZyqUYNp/tq3t9QnP1LuNVA0RWK3tFh+YWs9KVz4zowZ99maKHq7gkeBVHchIyJogiE7g
         2Rojc0txvlOXpb/qEL50jLl8wyIHoKpGVIWHiLogapJVUVOp2JL8IHjmwL0SSby7rOn/
         DTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2sLGdei5Rs3dM5QhQx4IE1OeRMla8hAmXmXxGLkIAuMwqjDJP5liSeaOxqxGviEQFZiJEKmUueUQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqdsZJU4DT6K2/Lyiwbn+F3AehREMF4cOoYs68u143Namr9/M
	5bWSpdAQdjlJEAIDbgH3cppeWK37GBMcelTB7e7uuBeiMOs4a0af51fqkKZqs1sF7g==
X-Gm-Gg: ATEYQzw5uV7KDpChLLf++oSJZTV35d8iRsZcbMPSWCztQKSvMmYOqBECHRp2io4MlCB
	yC2VinaFuxLC6+fHDsP2MupWIm3vhP7ykDzWH4dC1DMRXPIrdDebnEife9JALgcZrCTIitIOgsv
	bcLetYtgRN5KWAF8ep1iY8J6gPiIWVxDhSo1UTkzptwrKtQjgZGCFcdW4UIqJSBJTGMg/2UBBl9
	uFZhSymXGZ4w8zgXq2XokCW4h5EAiQUHUlg1yPlXNZyhr2cMiBIsdfW7LHYj5tagIuXS9bk5oe/
	tLFAH2AUwcXZG/JiTPjRIXkNVFxqenlOL+uoc8s+WJPHlzflrfQIXs3T6ugzcSE5EpABOJLIZ18
	dBjEkXmG3hvrqQrrjp0YY0a03erFqkiTpX4FmwJaxKKsqHYXGh8Qo/j625WEbAZPTMSj504Pzik
	TyU7S8OWjmZyvRt/rwFX6uyeDkdvEc6Qpmhdxfq+1dJwY/E0JrnbHFfzxTrE5zdiouNp9HEzjY3
	769AIfG
X-Received: by 2002:a17:90b:4e90:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35be551e7a9mr7465594a91.27.1774330250183;
        Mon, 23 Mar 2026 22:30:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 2/2] regulator: mt6315: Add regulator supplies
Date: Tue, 24 Mar 2026 13:30:29 +0800
Message-ID: <20260324053030.4077453-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324053030.4077453-1-wenst@chromium.org>
References: <20260324053030.4077453-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6315-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index d3f93aae0fc5..231e64fb0596 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -31,10 +31,11 @@ struct mt6315_chip {
 	struct regmap *regmap;
 };
 
-#define MT_BUCK(_name, _bid, _vsel)				\
+#define MT_BUCK(_name, _bid, _supply, _vsel)			\
 [_bid] = {							\
 	.desc = {						\
 		.name = _name,					\
+		.supply_name = _supply,				\
 		.of_match = of_match_ptr(_name),		\
 		.regulators_node = "regulators",		\
 		.ops = &mt6315_volt_range_ops,			\
@@ -190,10 +191,10 @@ static const struct regulator_ops mt6315_volt_range_ops = {
 };
 
 static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
-	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
-	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
-	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
-	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+	MT_BUCK("vbuck1", MT6315_VBUCK1, "pvdd1", MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, "pvdd2", MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, "pvdd3", MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, "pvdd4", MT6315_BUCK_TOP_ELR6),
 };
 
 static const struct regmap_config mt6315_regmap_config = {
-- 
2.53.0.983.g0bb29b3bc5-goog


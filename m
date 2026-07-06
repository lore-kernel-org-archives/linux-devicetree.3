Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3CA3F9F48
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360313; cv=none; b=PFU1YYhzYnEHMIQRXKTyl1mS2dtX1rnDNd6MvV57DGpDFCpLuRF1u5lewnD80l85mBF5lzCyTCspc5k1Dfv2JYP6nCox7PzYndN1TC3V8MYwSbYWr5sSKHTAvQ2cEfGV90Os0VY/3QfHgQ8yF1vPAgggro02o7DgMxDGhA0mSuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360313; c=relaxed/simple;
	bh=e5/5sHmL6JjVT+Mei4iKzqoEh5okE89N+VpCFX3rIM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+iBiM1Q+935YxGye2BxPBKHQmMJgZz6sfarYCzKXMxKrXz0qeHpbBxSb/I/T5zokHaccpyH+XzpI+hzijSINiu43s0KqtYVQ5/GLnNP/giszCty7GrvRwd5LIUUvyeS1HeKc4SN5bbYOzt0vvjRVkbw/gCFRg+QJr+LUzMrK2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/TxWyXi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/TxWyXi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b27c7451so828915e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360310; x=1783965110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H05lYk1vPsppXSmFPZIXLWTRe3vdv+ynA12o6Ofyqto=;
        b=N/TxWyXid+AmUF2eG2TsXzuL7eg3ekyouTN+Ud55u/5ROD8YZh6Q9QTdrMenEfs4gg
         cd1uwX06QwicD6HEoKzrd0IIo00OGHMoxzRiqtWlk9xhjTz6a7z/9XJqgfKkyJF4m/Kw
         jJFHs20gtnM/m93VIq9pMOcIxiiGqhEobYy7aLIRPkEgfLkeaX1GjGko7aYPUEN6isa8
         EmkiLuvTGaZY+swnGa2VM3iBhLCM0otASqB5DkCgtyLr2jANlCnmA70sJ7ULdAX6lhf8
         0z9OLiIOgv9oclcMewq/cXGhtAVygnxejZXVJviRH/tvTS+epmrVBOD4dC1y12HMgVYJ
         CSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360310; x=1783965110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H05lYk1vPsppXSmFPZIXLWTRe3vdv+ynA12o6Ofyqto=;
        b=A2CFgvkI0GYKVrQi3fwJ+xDfM1fgSOzGScHCCEIT2fCy/YjeNYm0zgEeR5J2AhwJIJ
         gzIxuTybf9LjNBLsDsfuow2sddx6RgZ/b96ZpoKx1eMB7bNEiNa4P/8Cqd6hVHxIDPNN
         k9BuSdxnBND4+hAl6MzlSLJ++jgmWS2l0KGsycMVU2ofFL0no8Bppr7yoIquV3RJ7Oei
         qWa2g9MeNRnon0NLotw58NOO850FmaZlOZ7kfpM0Vg79moIeMJTLAFuIStUMyWcN9ViQ
         YqlDU0rAAPDbHv1qPqBUPXj5vqDLj0LLADmDRGXkm5Blfo1Z3jv0qC5VKJddhDJ8Jja5
         z+mA==
X-Forwarded-Encrypted: i=1; AHgh+RodhtJJp9xlp0N5huoxK4dni7yPekqaHXNsOEbWyjweDm9LMtDZ7t1Z5e3oqy1XogSO4EmBA9lH39ID@vger.kernel.org
X-Gm-Message-State: AOJu0YyYTbbHTz1Z3YcSjvOnrHqqCw6EF4KuULwqSf5kdB8P7esXCClf
	PYB1exIhECM/PnkGXnPw2nzRE1IH/ZEjhLI1+JFuTiEqEaRwlLvC1slf
X-Gm-Gg: AfdE7cnIQjmcEiKpU7Rg7uviJvQFSf1ItyR8Y9cZ/x+PMPniNOAYBDin+VxBOU+K1Aa
	pBARUb0D/0G0EEoZsfio43rXeCFMBcai71P8NKxGnIjtL75hcFr7FPZfV0X5kZHGRIjjqjUxKVj
	9FUZ11ixbS/o4RfGeYAk30HWv3zjlHHt0Cy1P9k6nIo5A4yUBsNl7BRjqUWbiNMiuExjEGtnYNJ
	N69ZR2R+EHAsQy4HkpSWCHQHZSIbiUApQ51oCwhiAmDelqZWtAjU7RyP9Z2tZVlM0bJxfrTSPjb
	lbZPePOih3NyCEAkEaziYfqO2Jy/yxu4VudIh7BSt2rw12q4DOcUevppekdUjgxPp9ytZMFaBai
	2nsJ1wVog/wne4E3CY/FU4oF9ufHqpHfYjHF5jeZlHk/wQgtAaYr0a2XaEOUImudGpd9tLaAuZr
	601N8Z+bAVm2WsTgGXJJvWcW6R1n70V+AAS6Ay1LI9/D1T4mejhr7d25h+hwg/DDU34DREEP664
	J4LlX4yDy3t2+q9JO2ZRAAg+jLyaRXPh64N2Q==
X-Received: by 2002:a7b:ce08:0:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493decf58d8mr14260175e9.17.1783360310505;
        Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 04/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Mon,  6 Jul 2026 18:51:30 +0100
Message-ID: <20260706175138.12587-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 3c83f95c18c4..2a0f0362dd52 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.54.0


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59F3C4551
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684593; cv=none; b=sBHnZZ8BrzkdK2JQi33OeUZtC9Fq0md7pfWTzt6yqCg4jWhsEQA6OawzTA0+y38Uqw0CHpaEz6d70QyiBsoR8N1JLk10uzVwU/xFecBL/usfO+AeOXkeRza/PR04mh9vGCsXZCOrwQPMM6UAYxHwTDqLYQSitdbPyTdWsv09jSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684593; c=relaxed/simple;
	bh=rb+aNnHYdNqy1IYBy9/+KLzknx32nWz+/xZ4/3QurYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkrQ3XxdWpuEd3VKpQTXh8uuXceKbnZrsTToECoevrIW0mKMAFUp58ZOtAW7xBtZ4JvD7IWJ/x+hCzvN/0dXaB0sIFmaFQ/P7+EtpKeggtzPK0FtDOt+OEonk6fO0qk7ocuhFVND41OqEiyXi+10zxKU4gO6YLXkw9+tkZrE4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmpGAF21; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmpGAF21"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf125989f2so40912345ad.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684590; x=1782289390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=GmpGAF21dUROmTB/g+DLsA0Xos6FWbSHRb2jQRSVSq+vri0nHomyZRPAvcenYr+bWN
         zjpjIS/etwHAQqIT2nnimQ5tUc/aOJktrmb+6vxdBjzJJ3A6ycqt6HUw9JYJgP4tMC03
         NxDE5LpJjJeUnG7g4vgymc29x5NSIYXh9sZujdf+on1Nb9rQGvE86BnhubS1/iRHpuaI
         R61gBtmTg4aSHB1aLWOiPJOLSIA3Y0XYilsTCHYUvQs/AlNarzcwU1/yHiUvAdjAvhyi
         sQfO6qSiz9lBKjGBgB9OhbbVhrUR6NKCvvFa/uyyqSc/0wxQ8xe+5lZDUqwecuV4jRnE
         UqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684590; x=1782289390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=Yct1baipx8oFwDsKr0EDMcvbO4wnLOY+Ae7uUdR/tnjhWVXqOsmB59NqGUCAboAjl7
         Rtdqar/D5H4jWe0UzxbZ2+H1vnkBtcHi3vKXHvHZqzHAun6GiDlIxUDQmbLQoHrXcBY9
         y/e3GHgFoePfG/hs1cWTLJ556sGTVVC4ry4X6tfU0oRr/Oq/l9ky/DKYJzGnA4/k37vW
         jfrnKtYPaY6uh91Wd44JlF9KAXBET/eqCLWPN+IGKa8PZENnsF733nR3Atcqr6aT8bf2
         hCvP7pF1a9c+VgFo9R4C0iDr0Zb/QJEinNXLLHLaxu6PzAZrt6t/jKV9SIvXEF3Fpphv
         RPxA==
X-Forwarded-Encrypted: i=1; AFNElJ+hXMgKU1n4G6BL6BgNcsTouMG8SijyAt8FxTKf8cAupqGYW4m0IZ6+EAsF4vQoWm3eSjcAJ+Rv7xJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwtfrFLQfGx+4nCOZUFRwsE0RThudJ9pMi1RlIWVoIE7OPmMAy0
	Mm7HBx+MdNeqIPOlF7yLRJk593xpR+CgS2YZaTopYAt/XK+IN6MFkBU9
X-Gm-Gg: AfdE7ckMKwrtajsVKWVkTlRVG2aHcWQH/fcJySJaJvh1omkhmFTHIUoW22k86MiDy7I
	YJcCC0c1t7jYMrzpFNrn3hqJtT7+XSt22QgX+FAoZyoMMhHP3tnp8vQvT+X2Kf/PyLI/gyL3k+P
	gVoJKvE3ubbhehyguV8UEJ/6+FIxDPQsJV7loh1sXdnmIYm4lOqLoF4yLdl7fB1q3Oz+LJlF3ch
	eG/fMVYZGmQZFo458ukVxa9JacnQ+YVuSyff96c6/G6TYwVRKNnOqHiXpiOeWFuuQvr5R13d/TN
	0SYH3Ox8QyE6RVUQt6F7sLWGvB+UtJ/8zv450keRuUeRKs5Q5YooYBCNMSiU8bguLzc3WdNV+7K
	anTN2WjX6gmRU3E/lz5CUGi25uVF71wnLU7YQ2OE2s84bAh7xLVfV2GLPMaNmFWBVJshbiQeeBT
	g4KDWfZRhSzw==
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr27798855ad.8.1781684589730;
        Wed, 17 Jun 2026 01:23:09 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:09 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 17 Jun 2026 16:22:33 +0800
Message-ID: <20260617082239.645562-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


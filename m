Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E619402455
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976062; cv=none; b=pBgt0XBCY6OptLSjZ74wn1iIM+Nrwc8Gn3tv1F9cPJfCD4qb8ETyDOFipknBtQ7LO5+XuiQ0LzA2gX9KLEaoQAbdbSXJ8JQRQyhFj/aAva65Oqp9zWz1xEDPmwYQvkF1+bffihaVlo37hTnjCiOn9pt8J23p84zY4bEb0BTRGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976062; c=relaxed/simple;
	bh=3uwKBmKUbRrPvdSt8kHKyfmTfZec6aqlK6HFTGynQZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7SUB+mcY6xuzw7ySLC6wXbVBzO2beAXcQpGXxS/TCWWLN44uJZ42OW5jA6qCZZl6K9OqyvsGcfk6kyrSMPB4KLsFfPNm5ZlNS1s73F4wPYa9V40MQ7wQoGPAAQKXWkrlW+u5xUA/n/TEn4/SAzWeACqYDRoJquT1MwjPTcMsaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N6/6HZe2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N6/6HZe2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83659d38e38so938555b3a.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976061; x=1778580861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=;
        b=N6/6HZe2oXN7u9GopHElnRDWAj9rkcEJSR4XtwzwF0WocFgQfLlLiIK7frKY5Og19i
         b3UllkPhzT1J/ZbvCaPUtvRWMWTl3m+cHvbErO2ao+Z33P6O8bWCZCiA5WPtdY53wBku
         KK7zIjzXHf9/mSu3EwBWXrtkbk2Y114gUdzXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976061; x=1778580861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=;
        b=XEUMiKZKj9SUkJj/XNp6h2gKknd1Wlmm0MC1W4mHkudByP+ut5YWOqnsIw21Wu0eAl
         y4GtQP9oJuzOjKRcEy9ivrHy9vkKPSMRPIFAe/HS+j3txbpFJP07cLVze2JDtx7sFcMS
         XNZ1fPb5R2p6/pR1r/0hoyeZ/4+Gu9v1LjTvlqyji4ekboO41TZSRjMDvdcGy5MKdilt
         cTnaCJsM8p2uAm5etCRKs7SQ+6idBlZlYr3oOO0xbk/Y/9AzQIiu5ohyQzirV3+XdDNi
         omefJnC32gSD9pIhn0E5BbWW0X8g1ghsM+6jPeNcQEhbjgUZcZd5Ma2qV2ZFBfgwyVB5
         3ASg==
X-Forwarded-Encrypted: i=1; AFNElJ+ImB+jtnYWGXrAwR0OZxEh0hUXHdXgqXcxYmrFVtbLL6v5YwlzcJ/lhexk5YRnQP0aCvqz/RxBQRlK@vger.kernel.org
X-Gm-Message-State: AOJu0YzOO7bvvLx+MLmdhNhNVXUVhvhn2xoi6xTI5Wl6x4AoJtIuN8zk
	IWuin0Ra9+Mav2jsgmkz/CmARIFcEJQQUJ5WRIYMt9+Fzu8WCh40muH5nEXgTPsSxQ==
X-Gm-Gg: AeBDievQqkRojny6rR4RO+3hNLouAqA5xG5p5G5cJ7Wg12HNqlgu8JolmZZaHe9EfDo
	CrpLV4trz9u7fMs2qLXbnw8LJOjwg4CZlA9ZIt2u9F3eNHCAcy7fVNHg/VK0gwRefa4XX0QQriF
	0hDn+zyoGZ+2ZiQXw6oZ0eTu0ALsj1aPw6jP2yzJwoqLroEnpZA5TNV7Uheu0iWiKJi6yso7Pf3
	Sqi4c8ayrD9RnFk0bdGi4HJBGJjiHExRnNzPmY+qWkmi4xZbzwwdwexhEEmDNoMjp+w5bH2Z37b
	gS+IgTK3q4TD7A1MyLiYX3yE7yNufbNLAdIDNKT26NARn0Se5y1khNHwE7YQTesRq2CDUMgQq61
	2mP7IyaG4FKztB3W7R97SA/b2zWrMnV5Ju8xRDvoyXiMfNd4xQP1lN/bkiHRnPsHPOeHB/9Y3UB
	73gbeg8dkmlvNrmJ2dYyfWm40c++ww1iBDqpzWSwimUtJCe/hFokki+rZkyFdllhliR32zc3k1f
	dU1bgDiT5QHmRYsVRwKZqWR49b+ow==
X-Received: by 2002:a05:6a00:4143:b0:82c:e5d0:5249 with SMTP id d2e1a72fcca58-83921eeef5cmr2466196b3a.8.1777976060673;
        Tue, 05 May 2026 03:14:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:13:51 +0800
Message-ID: <20260505101408.1796563-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8186 Voltorb device has one MT6315 PMIC. The first 2 outputs
ganged together, and the other two unused.

Add supplies for this PMIC. Even though the outputs are unused, the
inputs are still connected.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index b495a241b443..0250b4eeadd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -73,6 +73,10 @@ &spmi {
 	pmic@6 {
 		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6319_buck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


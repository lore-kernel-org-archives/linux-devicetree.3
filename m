Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C8B34C140
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512679; cv=none; b=tYXZUY+UPwes7qowSfRsLi1MS7euDbkeGNwNY7z20rSIsumq0/RX03Fetn0itQMdfpkau1lE+f0/K3iJkBCAKWDJSW+qOQgh7HH18TdPBfEnavZPvdT0VG9MtfthRB23z0mkxcBOciLSLV5EdhsuRckpmmiwAumD6RzkCMf91kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512679; c=relaxed/simple;
	bh=EwuUqSjuq2TpsCXQyCsGq1NKjJLMxuw+FwCTlW/eit8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJzCIBE3roUXq7H1ZxoljtEa11TLqhig7SPHatdFnOZj8v6PLHlP77Sj20Ma6bczEQCwN3RRzal4EVCS0no4VuT1dJh/0q0RpQ9BAcukRbySMBSCxd4+/0lY2l2XcvHGVLFKe2w4m0i31L6aciuxMvnNczBuxIJ8b+xAepyBRaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XLgfpQUB; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XLgfpQUB"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c1107d4b7so596292a91.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512675; x=1775117475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=;
        b=XLgfpQUBwbykWXAf8HVrBD4jQYZ7bKkvDdqCm2im/JKD+aqKAfMCTjaKiPMxlgB/Ox
         HoRC73e181ue19DfYfilCyi6NvfzgGlAILMxBRZje48HYojBh+hjWH+F0APkhq2tlIy3
         OqTNZ2Qf9O0OUdSUR+UYd7ZvcZY+uiRtjZ9K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512675; x=1775117475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=;
        b=hO9dQeSgYpi6JJYi/ITooi6Ek3vRxcyoTyB/dom23Mday43d0LZMqZ2wmrFt3srExK
         TNJ3W5xJOOe31Ht5PbpKNa7wMBz15PS/6s3hqmyPmm0bfj84WNxJlpOUEM6zIA8mHfrl
         do39Fqt9VHJAZyKEtwqvcKMoPvJKIHr4hERQR7VSKmjDNSmim+x4UfnsUEOlRY9GsQv5
         qN82wHgfRGhu444Kdb2CYSmcDDFkaI7tH47HQPPrhZnGFkWr2qF2QfQe0qM+0mlX0tDQ
         Scmz/wJhr5O8bAN+c4anVN/rkORn89JKWFRHmTqSah+NSkbIU64ZIN6yzEedmsOXtAXG
         XPjg==
X-Forwarded-Encrypted: i=1; AJvYcCUz/Eqwo21/0p/Mu8GSPHNqTgduUHAr5kIiJOvDdzbwn6aBM9OIsBrsCZ3H2shNO/RAT3GD49jI2wIm@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdWwnLQpextBBivLAfj1oyFQ6OVMPhnvxNDdo1kajZIURYIOt
	NKnctzdb/nvaCnE38QNcnQr+0cv0Qc49DiVYO22xxJbgqmH59XFgO3hyRTY1Uu4MPA==
X-Gm-Gg: ATEYQzxbvtUsKowQvJH8Sl+zUSu+l+5aqka74TpwwyYUNCMrzLpfoAyHgtl+Bj8xdPl
	OQ1OHRo5n9TM2NxIfCTPiRc3CN7HuYWun4qd3+wCK+V+cB9Iq059GzpdnPXTTlEUNfWFxF/HSAC
	tfWvAXgbc/LTWTooBafRH3bhUC7Teanv6wE9yx2xGUi7dyMLgW1TbaLxs4l4PlT2icZJ928IJnb
	oR/k0lnJ9LiN/dfboyKf3V6UvxStp5P99Ymq6yxFrbqo1DdqUktmLKT4gu77YeE1F33TCJTzGdK
	i0pb8XvxNPOqQ1tf9GVyiKtIAKtzUDzThPjwpumxAO8m/iClp9oEE9lkflYc0zZi/H052xoWtSx
	r6qC73Da6hWM1RUWBrt9MMUrnMcvK9gSecKOYdnkrtudZ5jkB0dboq+Ie/o5mL54865fgeXtBL+
	ocj2BbIutX0KL4VkjzNRQJN6VRmVzpGn16ENcoYRwH+JpKju88b7QZVfE/Cmt4ocVdtl4m0SFA2
	2DLivJY
X-Received: by 2002:a17:90b:3a88:b0:35c:9fe:a58d with SMTP id 98e67ed59e1d1-35c0dd0949amr6018363a91.11.1774512674744;
        Thu, 26 Mar 2026 01:11:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Thu, 26 Mar 2026 16:10:48 +0800
Message-ID: <20260326081050.1115201-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the device tree binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved *-supply to top level, same level as compatible
---
 .../bindings/regulator/mt6315-regulator.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..1c63265907f1 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -25,6 +25,15 @@ properties:
   reg:
     maxItems: 1
 
+  pvdd1-supply:
+    description: Supply for regulator vbuck1
+  pvdd2-supply:
+    description: Supply for regulator vbuck2
+  pvdd3-supply:
+    description: Supply for regulator vbuck3
+  pvdd4-supply:
+    description: Supply for regulator vbuck4
+
   regulators:
     type: object
     description: List of regulators and its properties
@@ -49,8 +58,11 @@ examples:
     pmic@6 {
       compatible = "mediatek,mt6315-regulator";
       reg = <0x6 0>;
+      pvdd1-supply = <&pp4200_z2>;
+      pvdd3-supply = <&pp4200_z2>;
 
       regulators {
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.1018.g2bb0e51243-goog


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48583F7A87
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961708; cv=none; b=rRF3mBSUqLc+hj3D49mZhY8mqVMIL0x/6sJtWqU8mfqhi1b2OcJo0nSfaOGsA+zPLELUUCn4nyfJXnJBt0VJU4wyG6iIApzHRlL1Eb5Xf1qB2iNQQBRNd0ycFbNknVQE6tqTS04KFiuRMaanNJaXeGhvgnMF1EeM2lJ7Wb2jHss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961708; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9Bejunms7LcEM4OYdIdbqfGNm3sn53fM9PZ7idwef7ogE2q6xcwK6xJpOwJwXRat1WOyQ8qfPMgM63PBBsBoJwdLREnN1xZmxZh68gKUs0MDA5FA21dCfyRdbGFDnXrCBU0Gncd4Y/mPCT0ZQGO+ZD1xotWPKkjZsQbT7tcR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TJ5iRcym; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TJ5iRcym"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so29791495e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786961705; x=1787566505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=TJ5iRcymvPvgCwbT4ggwBvIwopS347JUMjptTsUE1KGh/hNhsuF7f/WeIh/ZsQb1lK
         49zX+3sRTKgZFUumC0bnYbyQgeqoXTGqDXqhrBWB0E161KNaHC2IBl2y+QepRT4wgzz0
         dxalwafQZ5mFcTPYOXIn0vAxwRy30NXGXDAbf3+koCLphv9t67riL3pqKYIBr4MLKNKi
         XiUHlGcpORPVxzfRc3SQM07ToWi7IIJRyl5W0Xg8LzJvlhZs2INlbU51QHeKM7IImFnB
         lk33dCzHKFM5ElYhCpKfNvMkVOl9aJwFgfwjkdE5UnSJbfMbU6KcBFkam1zgXPTaxeO8
         Y1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961705; x=1787566505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=a56k+AtUNJG6Fm7LWg7OfmuQNQjqA9WMTS4HBctyn+lhSL7oWMXka7qLQ6ehKT8nLR
         czzf4zMmj2OrNfbmYzB0L3cb7qqgRE6hQI/C55LThVn/rMan5C+f13/1dc8XluZxVIr4
         k1wkcSk5Y+sfBHyOP/JpDSO1sDIorNdLQOUX7fsmvZmpj3b5UVvMKpUWiRccKnXjKuNH
         NaDMBlZmT+lFIoWhfb7LwEM8lJNCw2+tiUoPDek682Sszllk5xDZJ3/RnlxhtbVGVD+r
         pB4tB+K6BrC26eF97VrFC52c04MP+WXUIP5NDsVC0B2qhNcDvwR4LvZacONPStbLBaej
         heoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpgDb1QrCLsm08tYQUvPvz4pvM6+IkqpANAbysEyFdQlZgpDsPHwqtULX8wa/C5e50SaE7CXRwyxOR@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLbSgdbE+BhT/rrfghiHu0QKyM9QMRiSWx7DjY5aFhwLBp15L
	oVs0QwkB3Y+Hc0XxUFS0EfTSLVZwbkUgRO6HWzM6ATQQc0TLyZcLeJzE1tGwLyA4eVY=
X-Gm-Gg: AR+sD106a+sK/+6I6NBgaGtX7o6qB2O3rUsrDIPFb20/zxslUKl1UVUe6LSIXZ270PY
	gvnfgryKEYsWnkVQ/KiApYuZNlwlbh5szwnx3TAKJfmHjirXjirqL/JuV7g0P5YY8OfbOkD/O3U
	loSPAQHvAB54obMt+TVy3+7lEfEsLbeMimeAWtY1CtwVS2hvLDVnd8V03WDfJJINypYPbUtGu+z
	0GIrbn3Q59l/oItueK69KEFxWDR3578p6fTp9EEZT1whk7tx3a4IqBQzI9Vmlv9nXSgYqA2lrGa
	XhI5mbbcMG/okOarAkY5X7Sf5Ph5rJXuV1Ryd1XSwdYAfG1ciANpdFG79CUaBZzfkQl414wYdmT
	lnMKq9dPDkD5iADfQ86YZuhuL/ldPv4J23+/zlT6F3VUjZzQ/pVVPRy8r303Lyl/ylriry+X/+I
	ajivxpJ0xKzsAp348ybrNntp9O7Etle+w5KR7+ktnzublnif5qMuKmJ7fqFFivsmVFZISCMfSoL
	SjUPj8tBfMd399fLYc3Gqrh3AxCREvCCdvyeI9l31f6L6TmuPLYMGslXnuSO81FCcz3ohLV3x3v
	aIH1k5pkTVLD45b93JK+6ar+/FkArSfBqZRA1C5N
X-Received: by 2002:a05:600c:4690:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-499879af606mr341527175e9.18.1786961705026;
        Mon, 17 Aug 2026 03:15:05 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d06167csm29542255e9.3.2026.08.17.03.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:15:04 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Mon, 17 Aug 2026 13:14:44 +0300
Message-ID: <20260817101455.3526260-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101455.3526260-1-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..63ccb67576df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -5,18 +5,20 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments TPS25990 Stackable eFuse
+title: Texas Instruments Stackable eFuses
 
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
 description:
-  The TI TPS25990 is an integrated, high-current circuit
+  The TI TPS25990 and TPS1689 are integrated, high-current circuit
   protection and power management device with PMBUS interface
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.43.0


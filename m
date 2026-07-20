Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C933BFAD7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579168; cv=none; b=qPMt6DmIwiVPnIefbFxw1XG+uHA81M3XvUoTPlrkjug9AIdUBP8YM5FMeH7LWTurRJqv+EiQIvnH2cLs+sA2v/kFTAH0qY0SnkNsfopBw/TL2SQnO4x/QjN1bSsQuqK75eTQ2tKaqUxKdwzmcdDts1/YWaZXMG1ffUmpp4pXhqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579168; c=relaxed/simple;
	bh=0k6bV3LH2ghjcSL5r5b8oHagkbu8nFD06A6dOv4SBPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrJ/8hWcXY8F7jA8GeNmhtUCotOSMU39yURouUF7cevOB6gOOb6w+4i15nKc7LWN+1Na5D3CCR67ux7PRnkGZH/5jQPx/OtSy+Zot1VPgxjISD9OA+CflsQb3ysjFMCwrcAGA4STqlkFnzU1CNA3HLaQDqVlV94M+Fj9+Q4Guqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrQoxkPJ; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrQoxkPJ"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4566a5bc186so2280398fac.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579166; x=1785183966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK+FG51ApM0c5ceijH9gfcRis3iTLtG8+LrJylpTuMY=;
        b=qrQoxkPJTVnGc+yZRU4GN9NCeCY/t3BtTw9edfhKrgWPPg3Kduil/zT7be2MXvwE8o
         IJBZN7hSjzWJiOAIQjxeQPXP4smMBPgauaJBS82Ecjj10XB9EUEbXtXjcgvUe/2of0P4
         4clJiK5Q2QPwXdp9S74yxj7ZP/u0cdlV2G5Ob4Hm0FmkhNrLgq1o/PVr8+hqeI4cb1J5
         0XIp0E46MquLUDFNDJPDGSCNYkcATjAQYXr15KRsoF8NXM5fFRc6l3atq0Jux/JW83Bo
         aX6hg7dbckwREZWuRoz4EEY6GJfM3cgKNAwDKKI8q/UvrflJ20SAfjE5fxq7U0Jw1McO
         IPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579166; x=1785183966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GK+FG51ApM0c5ceijH9gfcRis3iTLtG8+LrJylpTuMY=;
        b=KVyY6FJqVvkLOfCtpMlt0Ja+cNOf6mqThvINAY7Axcx+gPQ8cxwpsVwg6vO81rf0qd
         /be1HOcDs/Sz8nNSKVS8d5LNts2ygfl2fXw5fyOQ7A03dIFJko+QShbf1wBG9z8zz/JU
         A1o2zwLgt4lLHurt6qmzEcXxGAtnPP2+bcmn4A9gf1FZa0gdaETWXPegnoFH6+oePZwQ
         zgAUG4wekycYaOqk3eq+pG4BlVqzSz9184gU2gfp4IpFQbDPE0pipa/3QLTt75SD7/45
         4FGZliJtFTthxpR0F8lPrDLis+2M/Xh51kLRboZtgvMjhe6u1yBXeX4BQhfrdwZcfiCp
         lFUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF7vSPd5VqT+R6g+YNqNwVsHKgPY7PHhGFUZ6kiacbJjdf4xoXO8ocJbVpO40+tB6mW5qZKlAO/nfX@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgNhxq/AFr5/+SV2hGToOD3JwH8InDmVIGMYGHWLcGLXDkChj
	sP2EUJFwSsQS9JRvePc/x3LPEprSoqcsfuLJ2inlAzgbf/sr3ghI9V1L
X-Gm-Gg: AfdE7cl7PuELSjtowZlJZ7aU8RL+tLNxe779MoxpxF24lzl8+r9wMZQvrDoeD0NpFU4
	vIv4MsPhzBIHwsV1IEYcfF/yMFYRfgU25mftA4hXjU/3FE0Wu3CH4HTfqwcU4t+I68k0BPLYF6R
	JVbCbcmBEzNjgNyM/tsh5AjSKeK2w1OU7kJv4m+7sH54mrPzGExDiIDT0j/UCHfn+ePslunBALp
	rX9ZvwtO4kZ9qyGZ3rgXK8w71XxpnVMZA0P7Qx4PiiTlHtkcj3nqYCAEBL2vfM7YQJRIOlj7xJw
	miwiRzAQKPGya5RG/uxkt+t0iscU7zLvDgkAWlPeqj6DZ00ATzc/tfiqBtPc9hem0Gv7B/UJG1Q
	s7286JGqS4n9wGixFVeqQzrU9kXTFaZDOmtHUkGpL9UEwWGLe/NbVcco59bgqGhCBWExZhoJq0c
	7dDGXYBofOXIZ32mW0Bh1cog==
X-Received: by 2002:a05:6808:16a5:b0:496:dfe1:e8ce with SMTP id 5614622812f47-4a4d031daa1mr7693832b6e.22.1784579165871;
        Mon, 20 Jul 2026 13:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9988:5abf:3c51:d168])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3e5a0cdsm8029550b6e.18.2026.07.20.13.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:26:04 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V18 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Mon, 20 Jul 2026 15:23:34 -0500
Message-ID: <20260720202343.70138-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720202343.70138-1-macroalpha82@gmail.com>
References: <20260720202343.70138-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The icm42607 currently does not use an
interrupt because wake on movement and buffers are not supported, and
cannot be implemented on my test device which lacks an interrupt line.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..81b6e85decd5 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0


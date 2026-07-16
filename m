Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10D4314B0
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226546; cv=none; b=X2ilFOPqy/+QqV38/8oabShLak+62S0BtWUUsFtAAn+BDxR3wfEiF3od3q9/+1rVY/9PaY4HqHtxjOF/uGCtvOPiCB8vAi8z/igRtBf5ocLhvZ7qTP/sMNZgOvaZs+fr7esN7uKyB2rdJGjhp0IX94FjFuhSCe+95GSuks++O+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226546; c=relaxed/simple;
	bh=O83F5mb4uMnJzmc2/msxYxrX+19vruTkQvaEJ7jBfs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXFHLaYruetCfYtsBoJwqUnmOTPXy1r3ngt28idy7OFovAmWsGiONDG8cfGfLtatY8itKHJs2xLdftesWVUpskfRQTLVocvl0m7n/m/PRFdJf2O/9wtgjPlS+T0+foj6uAd0qcPzAT3GozMq9n8fqKHjUKi1nuaoLn8oSZ4QZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJYsl5nc; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJYsl5nc"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb64085c45so4533428a34.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226542; x=1784831342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeav82c+zHUEfGFTy6EKqJYIkUOVt3UnaQ/1FR4S0cQ=;
        b=iJYsl5nc/4wZQlij6A6Th/CJCdSW7FhLLvIJvqiR+V1oZ8soz7JOPIQc0mVyT5hpHV
         vrmNwz8zioB+UtKZ2R8rTfP9uPCx9OX9WH2ZqyfdaglLTRuPqZpWtGuMLXzXpz5Rvt2R
         xjgNkCARyhofE4KGZ98o/4nYWYOBInyKDrXp1VA12W4r9X7VF4ZDUEAhtdk0xhi/U/yR
         WiwqVIafbFoIIca8ou9qxZv/LQJS/GZg2ZtSPHTDfUrCiEmlj3BDqlX9D+Rlp3AtmnE4
         mwhPuFiiqhlJHgxgGgppEC2fkvkYEXVucvTQi/QS+1R2IiBr0zACqeiZR2Ji7qL9pXvZ
         pFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226542; x=1784831342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeav82c+zHUEfGFTy6EKqJYIkUOVt3UnaQ/1FR4S0cQ=;
        b=P5EIi0ACe7Gx7QkmBrFYP0Yr3gVjldjbqMtpgnSaRa+rvp2WCmIEcxi68fS/dNvc7N
         jOx9mCyygj7KspbE1f+Zn1zj2HnAznD6QQDvQ5pBosLNS9gU8CQfA43uTjDIjY6m8Wco
         qdl2wtSlFdnfxyUhQkEqR6VevVsLcaMy2dkCefJZhFCmOFOUNcp5GuyWI6JwZVz6cyG2
         C1DUtuYuTdkB0zklNkKUgYNHizPq7yHbjd9JtKOTZi1TWRfElomKeW7rCyw+vm0c+isN
         2ZLsuWKYUamxztMBmOTvFqNm+lkfLnGEp2bfFNzKtDfdlAA/iJ6iqeNmH2ponw0QlDle
         K5Xg==
X-Forwarded-Encrypted: i=1; AHgh+Rrlihjko5b0uVG69uNxUK4bNjyl0Ic28Oy4jjCU02UWpoN8jv5rORpHAOIhT/An27GeQk3QM6YhRQAC@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9oMxR9W9ljEFzhZ+fKxxhPXKnzw7ytvmC1opyCAraxZsNEBc
	N+YcFioL1RHRGRw40dES1FDuwNdgb1ywt+YFIbxX/x1V8W5TMVLo4KrT
X-Gm-Gg: AfdE7cnFchVabOoIpW5rQdiJcq8HUAj3ZxmCaB3gvKEXzYs8Re175PTEqKY6WKfJ7y8
	ChsgWJMtw9jhco1Tp8I8/Os2aXmpuB2u2iNFavv5ykjGMb5gsFw8rybRja/wgLgS1NvYjc2Qzqm
	EVUOaYuuVJXsqHlHr8uYGzockKy9njfacBylhrjGn7dJi3F2CTsCK8O7Vdy+5lkkPEkY7vHbTl+
	gnUVSDGQBqad3lwbW4nf0cvHjOlm8yrOpmA/bfx6LtYG5bKBnQNzA9Ek09m8rQ1fVoAWzLv9Roa
	09Hk9W9m+TCrv7mY/EfHtHT1oSKa7nfBBvwASPfAqf8hAI6yHypWa26fM42m6Uo+VBRbriAQ2he
	1APQ2X9oC00rhQeVKQFSAKZMzODbk82pTXqKtV1+cjGcdTq5K+m7LDeUnWyFYdzxAuTBOX6CeO/
	53
X-Received: by 2002:a05:6830:6aeb:b0:7e9:cc39:2ef0 with SMTP id 46e09a7af769-7ec59cc5592mr5016777a34.18.1784226542136;
        Thu, 16 Jul 2026 11:29:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm19939993a34.27.2026.07.16.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:29:01 -0700 (PDT)
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
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V17 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Thu, 16 Jul 2026 13:26:29 -0500
Message-ID: <20260716182637.24310-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716182637.24310-1-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
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


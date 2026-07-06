Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55B3DB323
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367966; cv=none; b=Eri4i6S9iJvVr/19l8QDK3CmLuhomU1IFNekMgA92Pxo6NQpvWYWicUxhCC+KH5y6HmZ7/YK2BHlVZX+2UTP4rofIq6fmarFMnVtAXN6efYUxeyKTgfXZ3l9H2tzCHIvsNocgiWbMgjyuIWMwqVxjc0Yqn+0S9m0SdexEmzr3EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367966; c=relaxed/simple;
	bh=rDIMkqIBSnBeoZ0DlWV9tc/nFy7fWVgDQi7pMH2AFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/eu6z2fxUqahCZTQbxThMv4305Ec95BA29dxOyMw8y9w8lC0bvgHVHkWquSafrsd90xzZWZKqnDcc0B7DU3j3WoEGa0kl3UMvEL42p6jq5mORu9RvOMbJ/gc/lJe3pm29YVYw1Ikw1LhYl8pmwm7GV00HDh3ge1gqCdBgaXnYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GKKEgTDv; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GKKEgTDv"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso3024435a34.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367961; x=1783972761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5hy3Z9jv0vrGFeBz0PtZBTuwjhzXWCPOOX3HmJCm3k=;
        b=GKKEgTDvlZM9kuk9y7FNFLM6iEHSHIGTCjPSEAe11VOvJFV++tFJ7FALCUktlf2g3w
         c92kcESBY4cSUzE/fqQjmLEM7yQp2mCRBMN7Zbxtrtc1JctmSOYc0YSf5vmeaL5gwMMR
         zAmPnuqRlx2lO86oKzhrwAOpJ9zOCJb49C8nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367961; x=1783972761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5hy3Z9jv0vrGFeBz0PtZBTuwjhzXWCPOOX3HmJCm3k=;
        b=jA22ST6EnQ1K+CieJDTfewnIs5iKTsyNuKWqnOTnyaEhh8TwI8YHtiu9ZqPCneu5KV
         i3qT8EdJCnuJREcoX69lMReGo49xQHfuUosS32UsPv8raLexc7SbxMhxe1pI401djiKW
         CVJwpvdLak2NqEJfRxIUlouPAa42JpdMYRucnjVfK4Ib2O4nrwQuwdoznegXU1tLOd3M
         fsOe5UehOetyx2ntFeupZtENfM7Q8kTLJPEncGPDLp6Q33gTPMEyebfFn4QRXvis+WeO
         CymXLUHVEWBIH87sP3oxYBpxtqXJ73oGFJ1zk3VA6QhU7ZqoCIDtyrHxj+D0W0Ue3UsK
         JZQg==
X-Forwarded-Encrypted: i=1; AFNElJ+RXBVMF9J1OYmAD6yq4jTTuDiC2G3/qbzJSkK/+BoIU/OnA4Xc1i6c2h9pMBY1XXFPfnRJPYJX0tA3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Xr6LogTqkYWpQMUo4BMfCXZXUIj9zDlRbq4t09Kedg7CnWe/
	5EgyR/djWdLGsEH/NHhfowfkIbRXM1eZXSuspnUsb5EC+9bYAHKMfwfJlpbSERNtjA==
X-Gm-Gg: AfdE7cnafgQ0mwBoB/ClBv4r/78kg5o39WzhEH13E4BDIhCSKB1EDDReU7v5f1Ue8v/
	9+PAkGAwtpFuRP15K7nzy4khMpugrLfnCpWQGaWrlW3IG8MLi6cYOBvU+CDcps+rkXzXF2KVX5J
	84wdJw8RvZVJCzbokUmpcLkcAUwlQOj68VGWayp0iLSPZVtzYYeZuHMAH9i4feAS+woEIx77xX1
	Gy4OD1P3bWMIdwDq8NxNsyKj5rptQNgNM7x+PrqhuhpgAu7pCQ0q5w13/xL0dXLhDapiGenJr4/
	e0HjcIHehCA37mHoANi04YaXVJjJ8/tZc0FsdIvHKn/JPMed1E0dzaWFWb5mJATT7fIxQBLU1OS
	AUSA0OUXa0aLeP0CW952XKzAXJ+GE3o2/dAlNpQU93HhwmInfwtxRVALcjl+CnBW88DptmO8Ear
	WrmXufXVw=
X-Received: by 2002:a05:6830:680e:b0:7e9:5de:cb93 with SMTP id 46e09a7af769-7ebb2346cefmr1219468a34.18.1783367961281;
        Mon, 06 Jul 2026 12:59:21 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:19 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Mon,  6 Jul 2026 13:58:01 -0600
Message-ID: <20260706195818.3906949-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatibles for the general register files of the Rockchip
RV1106: the main GRF with its clock-controller child, which provides
the MMC drive and sample phase clocks, and the IOC and PMU IOC blocks
used by the pin controller.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../devicetree/bindings/soc/rockchip/grf.yaml | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..349fd3393ac4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -64,6 +64,8 @@ properties:
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1103b-ioc
+              - rockchip,rv1106-ioc
+              - rockchip,rv1106-pmuioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -100,6 +102,7 @@ properties:
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
               - rockchip,rv1103b-pmu-grf
+              - rockchip,rv1106-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -244,6 +247,33 @@ allOf:
 
           unevaluatedProperties: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rv1106-grf
+
+    then:
+      properties:
+        clock-controller:
+          type: object
+          additionalProperties: false
+
+          properties:
+            compatible:
+              const: rockchip,rv1106-grf-cru
+
+            "#clock-cells":
+              const: 1
+
+          required:
+            - compatible
+            - "#clock-cells"
+
+          description:
+            Clock provider for the MMC drive and sample phase clocks,
+            whose control registers live in the GRF region.
+
   - if:
       properties:
         compatible:
-- 
2.43.0


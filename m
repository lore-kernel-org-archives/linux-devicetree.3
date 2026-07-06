Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F53426D16
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330355; cv=none; b=OsEOJAj121PGQa3m/jEW4n5DAgsTyC9Tjr0srMZqPmHhwTlPTJABSEYxv9qZ3F7D7QeMDnnigQXbxBQlitYSHjjg5RXfp0gaGeUpIj8UYHdheEur3XvbsAMk5vOyjfKizBzMYmz+cIeiwTA7TDh4twQlUYSKw1EiuMZ2wvrRDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330355; c=relaxed/simple;
	bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxwP/87toYgZMi59MxrWflF+EjGwdmzuZ5M5NFB/yi440KFeMdLdap9pXygA2BvLzEHsnvC2jwd6FiXzG7SCZBhYyFzHzw78OyKyO8rTpdVkAcdqpL8L8FXQf+UF5dQRcgmODaGgN3+7zpTdBXKGUewJ6ye+T3yTgecknuHkbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KGVSC1tN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KGVSC1tN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso28947075e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330349; x=1783935149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=KGVSC1tN+8gP10+03qB+OMQ6eQux1yX3pR80elByKlQTEWvRb+UZfw+/h5oCKPCAfO
         LUeFkNS5HiUPFiRN6XLYd0fWgRjv43LqHtOHkdy9m+XtHPthcwXdO6hyBNDK0KvBWJ8x
         P1B9xWXS1RF1s/Qiow4AwEdgfEfV97qLo7ZzroDXd0Kuie1xwDAvbBxHYYMOyojdzBr9
         u68WcC1H1KVqLz6jF5Gvl3ETXj1Q1h9LB9RgFrRul+1BkiFUXFhKQo5izMJn/HPgiDwa
         qPbkQiLLjf7Tqni5afJJsUvYCk92gQR3yaI6m1j8m8aou9iGmbnjxBxEtnpDQDRdEFTb
         +Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330349; x=1783935149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=la4EgbiBzJtHHVTEriwh5R+FweN+PXseFXSQYalNX/vopMtYz8Vu05ulxW4CabQm64
         kFm3dFgT4e2Ts3+U3aUdWLNrshG91NyeF95jIpCW+tMP9+ZbfPWRcs+s+yvvUCmXfLso
         m/4OEhjV7kN3ncwWRNgs60s2ShsYeD+L3Li7EGPzL2DGApVei89n8ImmaMx4BN0A83wp
         SPzplN1UWGm4NgrS4g62CVjib+KENvcTxzearzd+okt48LBk3haEmBuoLJ070srLUSqe
         LSnyA4v1dvIxXYJK1svylMecpPlzinM3jo28vb7zinjeyU9vBXkCkAcHZBVL6fPq0IsD
         pEEg==
X-Forwarded-Encrypted: i=1; AHgh+RrvXEAnnF0CPAJCD8pindje3dxrBgnmSEudBuSpUQk0zjwZOGH8wiT6CLANMSGphoGVh0tzkzLPW+Db@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ux4VZo6Ua7xKaBsHENOH4C8QfBBKIE3SGbA7eVWTOoehW99b
	DbZq4+sVMgrnE98BRdmdQqkH4obEvafzXdrbPK8e/jK46FqU8NYWTep1eI2xhPvBs1sanER9t55
	tIvoe
X-Gm-Gg: AfdE7clRvc1WF4hIhSevLBJa0mtPF8h61eKJdYDEmIEM00Szt2fhz9DjxfrTDEfZAsW
	6zqpyf+QLwf09lvq8sIn4hZHyAfag1lqbICGy1EYGXRrFl0CDcgtwvnP3aLeZv/m8GnpbQ9PyrS
	4g6lHAhWCMqIaxglf7fZTQ3sgXArH0/mC/B/IyWUl+6jl7yp/CnEOu3r6s0404K6RmMzMYAdiNC
	JAYe4k6nqbIFc0C8zQP/7efgT2Mxm1icioT4yJ2XLYzbdC6zLwhgbvyeBJdDjjDvp3rVgZ/pqdS
	9o9UFzFdvGyWtiwxruk09mGypU98ENPUKBfehRQAUTxrASnHYkgZnfVQ+LTD1R6LCEIsAic5hpz
	ShlGvW+tqbG6VvvsHzrcMwbznK5da1POCm667EuM1l9LeNeZ4WA3LYLgQGkjfAfIl0wAuf9tx9C
	BqIduGyyczDlg=
X-Received: by 2002:a05:600c:524a:b0:493:bcba:3d5f with SMTP id 5b1f17b1804b1-493d11d7fecmr118661335e9.13.1783330348753;
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm20505835f8f.34.2026.07.06.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:09 +0200
Subject: [PATCH v4 1/9] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-1-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YgZ1kmVhbAFJg++nhyvscPyVSYf6qHpsfzf
 Q5jILv6M+OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IAAKCRDm/A8cN/La
 hS2yD/9JC6LOTzoSad/DXBsiHV19K0GF3iopYtiTD2yka1JwfFAt56fW4Ql6js+tCDHjIR/8dNl
 ZCcQ37QX7+/ncxfGw35t5noFVL4eEv+HD0mAHkuiruSHXdtTQcc3TtTCtFdxRdg0WfjEIPUjCVl
 ecRZ3eMUxmbWUPEsSh6keNgpfZbmb+fow923az1r05IuTJZPvHCrp+h7kMHfAUfQv3jBW+Jitn2
 z1mXPL3Gp3GYRKAlruc7+fiwvN2dTZyzAH3v1Yzz+fLxz37C+XyK0djx/bbXdr1fLifB5rkCDSB
 14rD40d8cmUaKNROMLYfXMRTclaPfpxDyXldQLSn+0monEBssPO/tacKg32NUKJZ60Pc6oEKfYc
 tYxLDc0BE6z5jWxIC77CfkVuWwZULNDFT2BJPAKuj71gyThxusvr9rMIHlRu80ZFQY1xnZnOv52
 PBXVB9zZvmQkdbA7vZPwVVF7Rokh16UAHovkwZe+qOU99rQlDp+VaJSqXqYYqvxZTl4YE9Yf3N2
 AHiykcCHHT5HwgOsR/UlVThdLgH3dAvBJVF+7dnb+/e6T46AhEnI8WmeR66G8k+XgfXFh2ot6Lz
 wxebV68uC56VToYtAcrpAYtv9FpCPDy3HxCM8xErN232vbr9iAZPYICXQbCYACoOJTgIwdI/WY5
 /pSukiBC+wiN44Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3


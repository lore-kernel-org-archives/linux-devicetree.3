Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA883815DF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720445; cv=none; b=uGMm1tDrriaOBoMAiMADk471O/G9RTkZAs9H+Zk1QWx84uSzrkGrodEenGaq5grVuOvacFnVYEU82jEL5PYaY3WTp01sHlfEnsscE9OmX6z+N/18PKYFWlrhlN9y6cyyyY4Muh4lYwKZAx/wg7dk+KPkAMX8H1XASGGbijvmumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720445; c=relaxed/simple;
	bh=DLsg2y1+bliXCGG/reyDyV3bIVP7ZQeG9EfRj65TbF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYbQHfnMLqweEzoLt4B+XytUsmvtuFPNyJYgAdIJWv98FMe0oGNc0avmx/Y/OPgT1BshWz7mhKYeUnRGwuKgHvO8BBQJb5A8xZ6li8rFn4xo+YgbEy5Rca0kg7pROsxn9sX+78eeMYiT60HrfnrMt0ax2w1bwTQKNcNC4FJCNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGGlizXL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGGlizXL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-366375c4076so4076130a91.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720444; x=1780325244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=;
        b=JGGlizXLFOdXxSL3LwmSAX5532L9SEsX5fI4bLNm2kQmqrVgQG2+c/OyyHmAyDHS78
         N8butyk0xZ3eHFiXZExuQQaTWYC5/xiD8yKRSPR433jJ3q40G/6wJCe/MVthxSE17ar+
         f39ON8WjbjhavWzVG4VqinC7WcjHaMWDtW4v+zJS4KE7tabYpP++Jl+274wrLtBy4xPh
         Rsk6aD79zPGd128FUBX0d55bGRnqWO3o5p9YS8bJB2/hkiAtPD4FoA9Ezm5MK43KdQAF
         dfTgc+G6N9X6xfZYWrKpwoIurQT4DkvjHNwgDW530ppEazyRl5/dEXJLsSQQ0O0UdeVV
         LkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720444; x=1780325244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=;
        b=r1+lmS0OvblVUOjKhfjBgflAE6vMZzEdsKyluFJjdAIrDAK8xKCKjO/CmnS521cZvv
         sXmATW2BJtpF1CgjYFQI3RaFdAJGw8AiEw3FVCcLILnVgqKEDoopR2Nh0aom6HLTqhnN
         SBJLmWz97vBzz5AYzxDKb1Bn1CDYIMY++Qojf7lwMjEnCrQ3NgoUdyL2dx6+vWhIK+JI
         g/HsNkFE7vRoIyujh2CZDxAV+RzdWZG8kZ5zegD285jcTUIiL5zzmaclSZstaqlfx2Gx
         haUMeLWR3+vLll9WlBQ7J8UcDXHpf+4bmte8x0GYTaNXFJskvzUkI8PZhZh60b2PR8kl
         PEOg==
X-Forwarded-Encrypted: i=1; AFNElJ+/nrf14F3jwtHh/tLmuVzikLTnhaqxwQZ7xlpYAGZz0jx478ZwB3YZsI6UkquAZDrKaWz+CFBxdsUN@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqZOFq6GCd0ZUagLliUE1gqJ32RmTzZh7QH+VFSAowOaUZCJS
	w7lm15PDDJpb/h9JyGW637cWhr70yJvIitctPwfv/gm9YEHslNcn+lVY
X-Gm-Gg: Acq92OHpz6JG4ZkD/VEk2wmWoJVDYB/4aOxV8VRDEKN87p1Pe9iclC1sJ7MjV0uSCV7
	NC8b3tV/onbcLTEgSAfGmV1+j+FNOHCBHdsyO4hTdhkAcFU1DdmZZY229bX130NwGgxuRWhYRy/
	CX9HOcGsIx5Zdm6orQZllal22FICoxVNFRhLbOFUS15mU5KdX4gsB2rFaqMUmb8fapBK1WXyAB6
	kDicIPRYTL4Oq4Dtfh3UuAfMe7+4WiVuYOYUkOcA+6l5yS3cjMI72N5RsHs72uO7Gb055oWayzb
	hq4lyr5wsySbCtlVcaW3ugTwt7P4jX99IYuJLCobRkh5d0RklXhas/wQ929RF/waY4Z5rwpc3OW
	VehOo3rhySl/bRr/ItMWi9h6jxkxu5/l4h/mszZQpdzvUVtHm3PfHkGBzYsh6uldnGsLUz13FMf
	ycaRLnUnO7MDNlNt8zFzFnFPMY2+ja0ZBgbcOvbAw=
X-Received: by 2002:a17:90b:1b07:b0:369:a9e8:dbf5 with SMTP id 98e67ed59e1d1-36a6749ea42mr13774833a91.3.1779720443648;
        Mon, 25 May 2026 07:47:23 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:23 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wei Xu <xuwei5@hisilicon.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: leds: issi,is31fl319x: Update description for the shutdown-gpios property
Date: Mon, 25 May 2026 22:46:07 +0800
Message-ID: <20260525144629.498630-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL319X series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Update description for the shutdown down (SDB) pin and fix the example
device tree binding.

Fixes: dbc801b472c1 ("dt-bindings: leds: Convert is31fl319x to dtschema")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 906735acfbaf..ebf2bed51e7f 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -39,7 +39,12 @@ properties:
 
   shutdown-gpios:
     maxItems: 1
-    description: GPIO attached to the SDB pin.
+    description: |
+      GPIO attached to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
 
   audio-gain-db:
     default: 0
@@ -174,7 +179,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
 
             led@1 {
                 reg = <1>;
-- 
2.54.0


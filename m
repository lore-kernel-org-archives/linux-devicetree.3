Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874E366073
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918535; cv=none; b=D29akyuJo3Upj4ry+BecApPVBFTFhQ1B/f+qRUCuZYcUO0b6Nzg1xzgZie/RDeIRoTmjiSp0TsrrzQSvWturqnQECVeuWnKnE2FNCS77LBxlIiU5bpAAMOaQICZZytPAi/kjS9irVQj46SnP8xAsBXSSMEz5/PVS/fLWZUSwOgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918535; c=relaxed/simple;
	bh=MaVJxZC5N4/y1FpjaEauMKNmm2TOUxLoHybY7yZsvqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3/WRvw3e4q6CxMLglFBI6z10kiko9SqLe+0jzn3XK6TyvXfrAJiCG2WMzqaIPAhS7i1/2Qj2E1wP1tB2cBcQTPBA+eP1kKgExSNYof8ldPNMvMvgSl3kTEZZ1UKBi6Flaiy7wlZyvBS2ZdStr1Si/PxPvjCG+IkM/16zwL5sAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHIvxibC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHIvxibC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2d3a9e149so33803065ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 21:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776918534; x=1777523334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=;
        b=ZHIvxibCLJKVkqyWasFZS2KYUq4by+DiBTUkSpAYpRvZSMJO+Hz3iQEtPn5/eZTYSo
         h6z2wPAHOpepZsJF+WjoGhmXzMAz8ksvJVWrSQM8acG40gOhzNojl2657okjzEljWS+o
         uBmvn5RctAgAb9teyJhXL7VfKKCuWYHrx5dLWrqgl1SZkM0mBxAjgdH3eRA1qecg7ds/
         krmyMWb8SwRqoejEQ6MNJcubcDdJTbWZfy3q1RAYwpM6MfDCXVhZ2fgiiaMMUxl5XxcW
         8u5E+Q2edREOhD/xlmNZxzjPBuqz4hTU9lrwLwuPthoh0qNiuaD8dWcEx9il+6j8xgJ7
         zjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776918534; x=1777523334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=;
        b=Hktxws2tkH/sTRbtweaV8yA1vHdP7L6WIyKWN6TI7MQMFZMrVPGl62UNKc1Outoomn
         vSSuKmhBYlHQraWM2TXIDRqWxuJHLG5LxrDLwtHYQIk1CsoK3lmRU1q5fEKwLE1OzXZ+
         zMgHgZW2xSqqH/t6qgPJOPcQvpGWTXe5gSYXj9mfczakHQQR80l8LAQcFmfw+DoGJmOM
         R3XMky38/Plt1GLbXDwkZj7RNw5xLqnNuItcw/cagRKz6Kw3k9q8M+TOM4GZdirZSqy6
         PeDS3Dtllr4D5vjV23jvKyyDTaPF4BS83T2+dwyetDP9e6afoD2QdGhhma8b+0/kdJVF
         RLRA==
X-Forwarded-Encrypted: i=1; AFNElJ9qfP6flNNdsSKNBE2gjYTRftXDM5lHH+ZvwrOFwsX3c+/YYbBTpb3cLJd58bv0lmxP6R/oxRMR2PiH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+oIsL2i4ueWYSHbhnfImqMZguEOnkTKhTl8zPoXXJdTYTSHs1
	SfIJqf+wQCqg9Qd4rcifVoMYLkq56ieRtKP9yC+Fofj+DxOFm0T8cJLR
X-Gm-Gg: AeBDieuPwBiYj94+SPOAqqn4AKj38g3y8F/WSHs8ldtmXGcMSPIQk8jnjZHruSxWB8P
	rqQS6c3bzj8nXlhywAnCfkPmqyTW3RR4YyOxbCUw9e8IS5KUOGMPaewxj9m46vkINQaeUtnf3O2
	10PY7JF7IIdFuj0t/WML9Q5MTXrQTdtlTaO8Dk5W7BJadBbZbwkf4pKwjenc2hKSC8XZp2sTG4s
	nOAzOo7UECUvxOMKlbv7mJj8EWe2KPluijUJGrmfb008swdaJ6zYRb+Jv/+ZO6Ywv1aAtNSuXHy
	f30RPSqXQFeWW3s/blzmUcxFO/IeYJGFfOj2VBw/b7Tgzdc69kHO0IDKc3zjhucCdgHfiqCRmd9
	Asp0otLFXmXq3KEYoOOTEKP7L2gqeGl6vnxLirsXdeB06S39eKnkCjEJMzDFuKJX6GIKuGgpg1W
	+6lqmVc4sFu7pZwNSSaRgBan74iX3qVx+GIUFdETLG/J8PJ6mmoWgK4AzeGwV55/La58S9
X-Received: by 2002:a17:903:f8b:b0:2b4:6122:10f8 with SMTP id d9443c01a7336-2b5f9eb4a00mr190635855ad.21.1776918533945;
        Wed, 22 Apr 2026 21:28:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm165723755ad.77.2026.04.22.21.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 21:28:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mfd: rockchip: drop redundant wakeup-source definitions
Date: Thu, 23 Apr 2026 11:28:30 +0700
Message-ID: <20260423042831.21114-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. The Rockchip MFD bindings redundantly specify 'type: boolean'
and provide descriptions which only repeat the generic meaning of the
property. Drop these redundant definitions and descriptions to clean
up the binding files and rely on the core schema instead.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml | 5 +----
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447200ba..8e394ab6879b 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,10 +29,7 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..548ba1f30712 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,10 +48,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffac8fbf..40f8f23afad3 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,10 +43,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d176a84c..b99aaff100fb 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,10 +55,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c27ba1..b7af774b1395 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,10 +43,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
-- 
2.43.0


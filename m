Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE211524AF3
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 23:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911914; cv=none; b=oK8sAJjuu6grtSGc0lb++lrCfhvQ6phYegDPZoJbyvNmda/16OMzpcHJUMcw5kodpc/irAkNyU3UHMVCBYp5sELEHF7DBRzbl76rCjnfN+1qdaQWak3IzcAXWa0XKn6pikzQ9Fff1CxnbqsxrAySggW3UIBC6i82rnqa19nP7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911914; c=relaxed/simple;
	bh=sCerYXliWnW7OKF5MJ43wMqi6ktrBVsXjzRSNkhLDMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3eFaXVU21kAZ5b2baRaJ47Fax3cgZr+byRc1YTrSDX6K+ZsRLOOcSi4kx/qii8KU2WCfHpO8uyhrBftAie3rFksLVibBkXnsPK1CeYbcw1MwTHqldNMJZthfi/uVCAn4ALtGeva/SagugoYgm+4/qb+R0KlVB79j9y6v2Sl9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKeTx4en; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKeTx4en"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so4600440e87.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 16:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911911; x=1789516711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=;
        b=jKeTx4enRiXMb+7IcdAqLIayBUacxhU1dfTIuAR/Y7FVEG/ios5evD8O2tVw8I2vie
         NNpliC88T8fEnpfJMkuwNQrcnn7VH0kUUpJ8GlChl6j7eoqfQOOwGIIesvNpIaLi40jD
         6jJGUTidh0ruEIvA8oZ5r7IOEfQ2YgADzycsUHOL18ZOvYiqaJECDUDDxgo+RSw71d8r
         lT9ie9T9tFPCm90j4FrxO5dYPs5t4/tOSrq4SSlp09vwcQaBN0xdx0m/GRuWc01ZSwPb
         6BZjr/0sqYmHT/75n1QQGLwMEgbJIOBUKmyXe3pNBaII6BNll0deTflt0adqA2QAPAF2
         xEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911911; x=1789516711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=;
        b=jx+h+hW64BUC//zJv2RnY1jZ7PWV6JnwE8MVVLj8xMS+gYg4JyDbezLDmPPmdQuOxP
         1mcESkE5Tc/R+rcZdEGminvv5aJyOEpcmt/q2ylBoB7l0ab8cc+0uqskKU0t8mk3jxEa
         eDRkSAjeoqTx78uLhFff20J9I1zM1OKANHPxZkOnDTLkJbeOYgsCiLAEPnhEJ5Mo96xQ
         Udasa7LmzoFo+gls6YIIrXLsMDAfh/dALLnWGzedYU+Pjx+glgxsHXgy5yoBX+H7Ks/e
         qjTvuQb8IsNiLVaRmLRGExFfuy2iWnBUI5Bhrn2O9h2l5U1vFO1rcQ0JWhXUjnD4vCcz
         m8Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzMjTuY+96bnkyp2AJ3aWXDwkWqQEqFf32JaXo0KC5PMurAX840lzI0Q9og1t9tenJubWdApuoidz+f@vger.kernel.org
X-Gm-Message-State: AFuF++mVTZ21VQxK+kRb89qOYjBZ+9mZlL/qKf1VuZha4IBtyHcoUKck
	Winopvx1QMDDMjHJM6FasbVEX9mz2wvRRHm9HhEFbaH5ljfO+RrfG0u+
X-Gm-Gg: AYBFou0LG+mDJ7hjkyNZ0F11DTZk3cbAT4CM14n559gSxLlDsHYY2jdQT08oyNkIunc
	OMBKgDxPAdJiHXwIc7DJLPUE99Be5sCsnLRj1BfVjn9aa9V6fZ3IPDU/45bIh+Q5Q9+Le+aseqt
	0ImnSPTJgAT8JRSTsWws16f2PHS9emBYapehPDdEP5fkWUBhCHNHvuyBUwoN3WBXwkDSJBNhsM1
	xmaLEYjRLtF22bnEmR2nLs1/ZExm8QRRLwQGDR9rDWFwAo2UVtz3Y2VSozFFdQhhVl/nHmF8/XM
	34aDGpo7aIygEt8VH6JaVKo+U7rSsU+hAfqTXiukuY0ouElTK+33Kc06jcEjjms6zefXWFjuTyG
	L8H91Jtf8Mp+MqAYwI9295peKUfmV1lRua0r2+Epj6++LaL40CD8MuxKzxt4KG+gytIBU+U9mR8
	AtZq/o0e0GfNUjvJqDKVQLNEzywpgUdhYLEO8SHNPySsNXPQFyKfwDQsQ8L7wxD1s5NRTUr1m72
	oA=
X-Received: by 2002:a05:6512:3e27:b0:5b6:424:2b08 with SMTP id 2adb3069b0e04-5b616f5875dmr10045629e87.33.1788911910601;
        Tue, 08 Sep 2026 16:58:30 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765652d3esm127328e87.59.2026.09.08.16.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:58:30 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 02:58:22 +0300
Message-ID: <20260908235824.665-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NanoPi R28S is a router board from FriendlyElec with the Rockchip
RK3528A SoC.

Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843..1d937795a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -340,6 +340,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.54.0.windows.1


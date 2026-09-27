Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733533F8C1
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477809; cv=none; b=Fp/rqm4PazqAaRHfBTbiakFvZ5K1hUpaHVpsvZgTlGzadTFreKPyQwr4Oqaj2g53r5BSiPEnNLjEE3C5IhWkXJITnuv9+jnNN32JfSk4ek10wpgFHJoFO92cSGH8TGhgApaZ0FcwqJytRjS5LEEocz6/4TB8Cb2NUmUA9KgLIPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477809; c=relaxed/simple;
	bh=GNujY27sJq1QrMAiEnc4wu/PVjXA/qEQR0U1YSIve0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BjFVaiuog0s2dKZkI8ybzXGRbPXtMr8Go2Fn1E8SppUmD2fKBUMcFEWnGijnJH6trDkcUR8PAoZ57D5NNif5+/jBuNXL9fsQYHFhU/RzeNwlmJvLnUZie9C2qwfbz1EKdc1CTCLMOwvPmRAEDFCqc6Jdm4ypE44xL7qxtPFbZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=lkTPYaeU; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="lkTPYaeU"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df9754484aso8125225ad.0
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477807; x=1791082607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=lkTPYaeUuIKMPh2pq74BeIEAKmVudPfL5QWljFogQ1a2+9xZa0mAuboJJC4p3ubxiS
         F9ynAwY9hNfgrJJuJBBGNhzxdqB/34mPL3hUbwxXZLxbyoEUr8gzIUxqgilr2HPBeeEw
         v9EvSYh4+iZulyMMWKMy8pDinsHW7UHfp+BT4U0i9eeVk+BEYOHwU/k0xxmxqJYc6Z3H
         DVn8RhcNM+FNk+YHheYgAnXQmdT4v4ZHKomMb2Tc6BaH/vW7MXj5U4IL17cZ8IyybUCu
         +yJmK8SHds8kCd8B+SvP33GZwFZJAfS/gNIxGNqlLTls78mh/beunSiP1hATnl1CCHcD
         wDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477807; x=1791082607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=15Q801Fp8EkDuZTwn1j9cXfzl2yhodCy3qxT7pytqG3EpDDJTOrJxQZmU2KXgfri9R
         W92APOLOODe/33PgVTz+LpjZ5ibLHPy/5198tdMgETP6R7szCjcuqC2IHETHinA+G1yE
         NdURf0T8+MuvLmZay49ZOER6FcZKzolijgnEdwCe3QixJMo65HsUhggL/8s7VXAQU2Gc
         QnSdg6BFQQV478JEpZJqBe2tZC2ep5uO4fiUhVTh6y+oB56tlbK0oeLyfYKAXha++akD
         RDNlqTeow0bsqzAFhD05bok80CvL/psbA7/nG0A5ufK1qJ/SSn8ZBnMExXgDZEOcBBv1
         ZAFA==
X-Forwarded-Encrypted: i=1; AKwUvByRXcwJdm9J3aBuiJFrrA6/5HRC/W0HDZwzPXATAGA0jhl2d55LQybB6nGRjb0tcV+0S+q5/dR5nF6L@vger.kernel.org
X-Gm-Message-State: AFq9FYKOkp3+xvNGeVgm1ow7tVvQy4CqcwoJ6gLa4RqZYQClWaLbt6JX
	t20vQZAhRvRL61QqYkvoHQ/6lvE8CcjBbG8uI2jts1d8F6tMb4nbgwSQs6aUAEhYd2h4
X-Gm-Gg: AYBFou2y3KxcE26bPfae9/pZdpKHE0aKbFHYfeK0rmd6iDW6dbZpb6AK/popBejGFP0
	Icflbe1VYpn36jWTbFWEEcD/rsi4HPI0voPTYYMe9e6A+Y6LDAsZW4g53uriM4SwZTbMLPpmGfi
	stjhwnk+u6JfLziBC4Sgvdq0oHgN+7iiCZe+Qt46hHpK9Glyd6dkBP4vJ+EDeUze0cUW+tyHxOH
	satxiVjmAlkAPsWNwNIoV+KhEGH/f+PkCThcbk1zStw9j1a3tddQE6u+aWiitn3TOvl2T4d9hWT
	oFdW7RIgXgCpBoi+Njk+lvhH/0hpNSA9OGy9vt5exG/1ARxFUXpX+CguM77MBjJvV5Tsm/d9j7L
	Z6dGdzpxv3my6Xj6Qi3uDpXna6dLoCY5FzqDs5icYL9S7EGNMU/Q++V+MRsxypQ+F6GK4Qxsz3x
	Fhqihj6sNlXBhCU4W8GVqc2Zt46s5UPMIXfZ1tYt+gtmxwbGAKEZtpQc//uoAwRYCWEw==
X-Received: by 2002:a17:903:228c:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df7dc41d3cmr92788095ad.26.1790477807346;
        Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
Date: Sun, 27 Sep 2026 09:56:25 +0700
Message-Id: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The D1 and T113 have a hardware spinlock with the register layout the
sun6i driver handles. Add a compatible for it, with the A31 one as
fallback.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 584cce3211..13f9a20ae1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    oneOf:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-hwspinlock
+          - const: allwinner,sun6i-a31-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.34.1


Received: from mail-pz2-f3.google.com (mail-pz2-f3.google.com [74.125.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B5470454
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923800; cv=none; b=VtOFl7hSDrtZgfJHDDB2j4HNFJAQ/oeR3efNIg5Ljz3gHr0wljWVmoGf17rEV2D3D1IOKspW6ncnR9y3Q/RT5W7Hjx+jIrLM77CATmlg9VVcKBm7J3vLsh5zW46IDJWaiZudfFA7K0oS4+v5qdKfI41ZZumAm+hFYWmcdq88w2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923800; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdIC2CRA0GzqThhFa+w6bCHuLrEPIAB526jqyIDlHTARBrOnVCGXaBl7eLpTsGHFlHaayJI4RBWM6Hjt4qPhV1hBXxootyV0jClfmWBrq4DDrOR3+UTcpfhBXxn9kK+X5j8DApwrsn7JYOm9u+2Gcd56D/9t+OZLOkS05ORySVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwZTNyoe; arc=none smtp.client-ip=74.125.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwZTNyoe"
Received: by mail-pz2-f3.google.com with SMTP id 41be03b00d2f7-cc1beca96deso1322057a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923799; x=1790528599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=FwZTNyoeDaJNgBcS74Wppi5RIdDcvODv6K0TcGuasPWodeMiTjsZKUHMp36N6p2mn4
         eiUv7wtTLJYkoveeAr9FRfrcxvJ/jwEV3Wkl1dEWzRPkLZSrTYBm2+aLqEFlahQzlgok
         K1SmgOSBd6+4WF7xaFviAtEboUhMNhGzFl9OTZQB2EMefmhXICFFus6ETtWeWOrIq6D5
         /CjZgqHBZGGdNserLQHrapM2gLElH1TQi/DMofl6SXz8gngTz/z+IrhOJmOv0zjc/LfA
         AQrOuGrs9JLjzWt3BDYhpHGLgi7GZ64RqVSAfkHmhJgUQUwDB39xwDrCm/ufTr74A6aK
         9zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923799; x=1790528599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=FHrgs+b92EQeGepIy8SlCHy31hX2xQDEucuYelW9x4AlHVdWlY+Bfch3+K6vlxhGFo
         2pUs5Y243+As1RuPLJwShNH/SwgkvG9CQ+9ETnywGooBfF3SZ6pHNRvQJ8nMfeJQws9q
         kSG68LvSjhiQflthMp7DHmN739u8KPsokz/HwHAvdCo+FabSsccu04xj/udHTX2DI1xO
         /7uQjZqPgnHHhnF/HPwex2FreeG9Gei8lSeRHAUQEm3y/55j7smCx8Gxwji1R4orM0U+
         RlicLzhur8h0kGCTzdB8DBkbM0kNxeCoidLyrilN5zzFMk0NDnluZpsE7jSOVIA5PO/S
         rOIw==
X-Forwarded-Encrypted: i=1; AKwUvByt9a5Ur058yqe28p/K8w5HLhCXithOCZ6mtvbnmwZc7HYwTOPcdZ1YvaAwoNAg5+Byh7kaz1Jgl+xK@vger.kernel.org
X-Gm-Message-State: AFuF++k7hg38GJLukJD+RdUTMuE8zG51n+zVs9Deg9HOO3NZ+UUfsKOR
	XLNnO2PKvBtXsqYUeeyIAQET4zsL6wFjXmqEioruOzj6rpuDrI5RGuKL
X-Gm-Gg: AYBFou3thr2JqgAGmSjLycGjmINA7RJs/LqrOCdZVWVq/+HYN/yFnRgWHk9Yme3MvA8
	AxZf2SXp7fyf+zi0d2HfUaT8SPL8Sf//5i2mnGGd4+zwXmjiJB/KcFXyv4zvWraVvH3eGzF9i/m
	HF/f/qw1osDPjPbmJIGySDkthKlFDXYCQQt7AuYGHap5sm8uCfDySz5nzR3XQyk2WzVWYihNIwb
	qJS0gIQIJgMIW8R21hwo4aZ8QcVau1savtV9OChDFCN6Y5VJO+VurJ6y0txmaSAddVg+nL+eaOy
	EbDIzdqYBXaS+vyB0t4vTJA9wwvixlnjjxZkOWS7c9i1VtiO87j3IaLAOGkdTmc/UBHfK7ML37C
	W14Im7qlgc0YXA42sFmpxI7KwczjrhRStTAYV3PXGv41R78M1xRycEnz9euiF6tK7AM+nQtmuxO
	0R5fy2asLqwklUddxRyxR/+MKCzrjp929RuPNpDkjzmjZuJjrLACwWK3+lEQiLmyglXl7Ygg==
X-Received: by 2002:a05:6a00:4b05:b0:878:34d7:6a33 with SMTP id d2e1a72fcca58-87834d76e0emr5109717b3a.39.1789923798674;
        Sun, 20 Sep 2026 10:03:18 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:03:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v9 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Mon, 21 Sep 2026 01:01:12 +0800
Message-ID: <20260920170116.3624104-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3


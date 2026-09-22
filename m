Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D395B4B4870
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107508; cv=none; b=X2HcM2OLTBM4ZND/fLb/WSFvOZNQvsSx7RE0+1aRueKDzo2NItPqM00bpXjjjDiweNb1uGWeySltkaFZ24J5ZuFWYrn6zAZrrafevBk+EnqdETdr01zzhbIVOFs9Orr1Z/f9dJ/GP/Wq2za+tBhC15bqLpjeBVqRKuIiuwhfkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107508; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPpOwCD6+TAjZ+7dEiDPQlGUW/JxG8q3wT8Y95dsQbe88uJ12hF6hIU/tdn6RZ4AR1Flbni33g1Bw3G4ghN+RiB0Bso69WLu3rRVcjA8XWF7EtedONzEERVCxkY8gLOdFodwPwX9Raj6PzpV6P0rdYZ2zq+keAfLxVEalpCUw0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1xiJ9KJ; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1xiJ9KJ"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso1050455ad.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107489; x=1790712289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=W1xiJ9KJ4RWZ1iletsqCG6k9ZncFdwx37U+P0w1fFrMrWnw/4I9t/bQPpxy9gcQkWU
         G85wNCVv2ly5C5vc+utUv9IXzmdKs0XhDlbNPQ2U4MgclAkxsAq2cyBVTjIxg4B9cOpL
         mLtY8MNfe9iSl5Z5hL5lyW6cuK4o3Wwu6t/3cFmBS30UxQE/c//RIfwl9dNqlND60Yec
         eu+sj8j1tnWalosiHA5kjcaYNOGmYmYnkm2D2M0ebelE7z9uYuu/59jwCQjnt+sGUONH
         nQ9ZOT7mAprdAq/O9uRfwjUTyTzvXcYqxLoX0tjeUHHV4gE6X2/qgT71NGichSH6SbkH
         Bd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107489; x=1790712289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=yNxyZjTu8FVMGGrovfOct7BMMh1lrAnyUoJYxiuHcTpmSMppnUMPGGzYufHy1B1VW6
         MPVCLQQ5on6udn1zJRYONjyYMJ6LaPzlUAi7zH6GFM421EjBRNg1GRicqiQbzGBn+fSj
         xrzIIvVWh5WiVb5fisT4GJMbaLSPdNr7XplpbKPtqT4HLTBJDXr12W65NOp52viQuCqh
         kvdceEIXCe6+nJlr5N7G14W4jsJRSB3xFfdCUfQO3O9yD6LtCC5n00weSudI+hMR6BGB
         98I26o0vM0SvDpGayt+8LvsZW2zdZDxnXfGn5ExnThxiffOSm1YNW8FpeCBuxubqicW2
         KRaw==
X-Forwarded-Encrypted: i=1; AKwUvByaL00Ebe2+c0oacerKL3DmdqxnGtn2YUfXKkQ5+7cv5H9pTNn/8GsRynfkFdfU0rODnrXQjgsEbdQz@vger.kernel.org
X-Gm-Message-State: AFuF++mmS4MhWBbHAYr+ca5IRfb3nsK/Ve0f2hiLf7B3oH2NQuQcsQ2x
	EQ/rTpqpPIVHOhPII8/39FPSxUKSLSJI+OI0cy6AtXtiKj+qYsXMebrT
X-Gm-Gg: AYBFou2n7VHbxJ8qvKRKU8i8AuoJLcfI9t5VxkfdOGGlZ5im+mNPwAFms+7lxakwblu
	5VZAK/8DXzjWPhnUMHo8JTEPzu5eqTgg+sG3w/JmWGZu6IrCQ0GkYPL6pp3M8BnDzf7fOIZpvBY
	3Mo0qIrm9ZxG3eyEh/LS/avnMg+HBngbvKKFNHy8G8pSaB0sQkJeExl4ynql1MY+bho0Si6iIwx
	zW7WlFkseaV5EsqlDx7ABbMIXr6tpV3zVi1O9Oj1JKEbUiZceEuzA9xB1l18nGTd/TdxZPeRLkY
	8nww9ktQeHQn2abvhmnhicAUBpyh2O8k9T4dSR39XcPnOdRhRflzI9PWOIQbL7l7pYg/QMJapzi
	KiA6gVb+DxUeeqValxGooYGUiWT3qfm1vnSe9oOCz2fzV9NSIEjjfFcGqLMoJ73j2lJQ1e6XhSy
	2hX6AUVAR1eHBShUsg74IQVWSlkz9ItQK+JWG621T9fHShO2AGMUy2T35ylAEaPzWKFImE
X-Received: by 2002:a17:903:1a86:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2df69d1b106mr4415425ad.1.1790107488984;
        Tue, 22 Sep 2026 13:04:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:48 -0700 (PDT)
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
Subject: [PATCH net-next v10 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Wed, 23 Sep 2026 04:03:32 +0800
Message-ID: <20260922200336.2201212-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
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


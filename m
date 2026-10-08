Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0557E3B3C0F
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481999; cv=none; b=swDSxAEZotEgSQ5m0vwf59ngHTB9pKb3VXUCsluOJjvdJe3yxxNRcVhIUoTcyRuRZzc8s0iaiZpXHzYoLio/MxDAqg9007u3tXL7/1HKiyJ8Krzboc2R6S9BZtiM5oFyqPl5/Lvc04N5KeFWHTDXhzjMzYksV9TooZJFVmtN1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481999; c=relaxed/simple;
	bh=dmywluuTLhknLCsh6fks3p6crR7xS3s26oNpw013obU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1mhuoIRm37W4iboqyhgsq2vEryVcgcSzdTBTkDhjV5/9uybEpNvAPaE9bkIF8SSRY/1LsCOGzYE9H5jc3Z0utJTg5yNsVu1tgosgXxLohUfC1WtjvQbcliCe8Dkf1RlCSsL3k2qXQrQBZDo9n/Lz/lc780w461E8qPI0932YqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB/4umTh; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB/4umTh"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3a7026b3123so929499a91.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481997; x=1792086797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=;
        b=TB/4umThxUL1sslai4KgNU0eIEplZvJlSwypcvxzMfes9ORt/dXEt4NzTovyTvIEgp
         jmKoOzNrbp93u1fb7WLCCHjsnL0iEHHpGX5i6suc5uptYgw2Igu3jXwjwkwc2rexFFkg
         0aoEM8zKj1RUCRLggoD7n0O5gFd/RUEAS6h28QnSfMUvRn1XGvCa6FhoL6Xqdqt3gZL9
         0Rj0XQkpyCcoxStEXn8KGonxKFTas6djbGFIgpHRhEYaKEJVEzy5kB2Vce+7mVXontZY
         B6kg0GdNT91u74RC11qJAl0vIm+ojmdwTo7/NkREc4KWjjAUaAXXqiOH7D0GaDi3dMMh
         hkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481997; x=1792086797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=;
        b=pQrnUUq33ziOUq8O4oRNrUNLvXR2ZBJ3F++nHclAtWVJ891hchvQPUm0kpVBWH62S4
         Y+SeEpJ/+LALXLaIfuuMQpVs5V/kir4YYZjJKj0W0efQikJvuUcbyLPfze/q3QiyjcBT
         wViI6G9vn3QeJURIey0OFdeaE2W/YAMzrvY73fx63Ypcw6WKCttSipBzJv9xGtjC6E6A
         ppkCCS6sabBolW5EnRia6d/4ilGjxnkrSZwMoNZ2mC3m2QC2MUqQj/ctu6Rjzzs6ShVD
         dHY/oRYVe2dbQ2Yh3sTWoOeaAQ1OqUKW8sIH6PvDy8m7h88C+dsfa7hTPfMugkP1CW6K
         3w0g==
X-Forwarded-Encrypted: i=1; AKwUvBw5q5ArKGElua+H65zQeNDM5QJWof1dBjDtOrJM9hZ9XBnUyZghGDdOlUJFkzL51MrCwLljnTcED+7T@vger.kernel.org
X-Gm-Message-State: AFq9FYL794BfHZyszRy4e/M5fGEHdnVxp8rimnBa2gr0AaAiIYwq1hdf
	g4EFlZjCaUnm6ja0OZLBv+5EK4HAEwSSvutingWlhsnrd/rdQ5s9bwhL
X-Gm-Gg: AYBFou2qM0JUL+FahJ43Kzb5X6nKud51MBV3DAQZ0ujqNPUfCIzhcO2UGbstETfEONO
	6t20FFKYlZ1gUPy+J3pdQFJLrSy94MGEcThz0xlD6BonC+yIwcbkuyfJcJg0T3TdutbWVu7TlrF
	U2FzKXhGXXvS5fl2T07OP52OZun4kmy1hCsTq7olkziFY+AkC4muo4XuTpnoioUWAZrsQXmw9Z9
	yC6meAJBPzPGU3OQ7XYflvrAWawyPX47sDJTq4eRyjdNPodT7VHU2zok/06TBA3IQZ6on5NbKJo
	bSJPE9y5z3dpUhSo7eISTurTIqcb1NDVfvHGRsRjxxUXkN/P1Ko241NoRkYljmpheFm6Wg9sZss
	QFbfNyiJzD0DWoaIrOrHg4kNy3qtuH80LYTJo6pzmjFrq8O9I5FCvR8ALypGzMbijBTcoI+DzmE
	aA6WZwfUMIfsnbBEFYIhTO4NmnKJmOLPM36vaW9Ety70dL8mJV1lH8WrJfMANRCPfyiijp
X-Received: by 2002:a17:90a:749:b0:3a8:cb54:e132 with SMTP id 98e67ed59e1d1-3a8cb54e659mr2236926a91.49.1791481997269;
        Thu, 08 Oct 2026 10:53:17 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:53:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v11 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Fri,  9 Oct 2026 01:51:58 +0800
Message-ID: <20261008175225.3375274-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
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
 .../bindings/net/rockchip-dwmac.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..c434450fd07ff 100644
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
 
@@ -159,6 +165,27 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+    then:
+      required:
+        - phy-mode
+
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


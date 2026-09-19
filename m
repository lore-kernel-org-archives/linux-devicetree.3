Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93C3E1D0E
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822371; cv=none; b=qlKXr5qNvcoV29iid3g/Gvh2CYwNv8eqgLuW9WTfiUm5EtYv+si2BpislHti/fm0raW7yTcTjyqWfbCwo2e/sqD76frXFCT3WxLRYtDs1YZR8AjrDfbLS84qFpbQ1DAy3Y3mWW3L0zdko2jF7+sMnBA9SVh22JA2zBvmmEY5akI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822371; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9Bq8BmXfG09922qUHQvNQVmdko7wV3hRxBICn0/NiWyzs1zh9brFV+XGGdv2T+MQV12KYbjfxD+oMNcqMt2fJraDDX15zhFN8gieUwpIvdfKFTLcaFo1ZvVkyr8ihRLMb9vTj2YtBHV9r3302IQqncsMDEilonpPRKtzAVkWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVVXWk06; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVVXWk06"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1062714a12.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822369; x=1790427169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=YVVXWk06leO9wt4anGPX3PP3rdKwm8wO6H32qzeMRv1RLuJt4aRTIwZHx5dRSo5n47
         d6fkwSAL9Tsd1es09WuYwLl4JAnwRZLN1vhu4UWnCmh4Jl6qcYMcSV/yWgg/VwMSu5v9
         7FfZ+yojzRH+wCS0hQxZ22q8podyal0ZYHiNpxHo2foCfp8b+Tz4FNrbMciDabkxo2Tl
         ey8BjChT8lTEPoXLnbe0uji6Pn7L83dlW16zOHPMW/jTfRkYouDFxck22yvQit+Gsoc4
         ZvWCIklcb0+c3fe6QbZTGQqaFjqNjUSaYa31gEM0Bi+kYJr6cmYY9YeDudsASiDgtfT0
         hzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822369; x=1790427169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=tzQsLdzJ4oGOKGVDfWL+Yglm/jiBcIOZTUtcLIvH5PB3WbNlO2oBvLESXqf/vNiERg
         fmuVao36k2F4ye5wx5YC7kRtyUrE+/KNaX7EqX5m9Vl2n2Ehpk0hiaGZ8oL+vexd3ZZ/
         TTZZx37HL8Lx2rDL37d7uSgJIOp41DN/I1S5YwIsc9QYOSKG3bYcLzwa6AvkuZQ+2DMq
         QD3lKRRCx8moE97ca3BSsT3bXT+n23b+3ORbkTcTQOJlaDRtkGJJ1uiChbVgQt104e+0
         b9lZRn5oeTa1/+FrdjdyUkQGw8X+EVvN0K64jMo8VTvYrEkM2UbJ32wctY7FrXoIT7aB
         Gihw==
X-Forwarded-Encrypted: i=1; AKwUvBwYyMqIqy6fkYNjW2iRhYoIOqtYFrpvlGnkvyHvt5JsISL9UApbocNi1WoVbk/g0Kee05hsPfwyryAP@vger.kernel.org
X-Gm-Message-State: AFuF++nyARqttLVvYGPNSXN8NNMnTToCISEqYVlBgDb5BlF43uKNLzhe
	PicK1u/obiOI1zQ7fnR7YI7Kzuue0IRxEqEPuBkvCNiURzEsCqzgPj+H
X-Gm-Gg: AYBFou3RfX1ZTiQyR8oR70qGKESL7w9eY7ha690IiYyVI2zS2MAuTEcNPBYbquOyZu0
	mteB4D+ekMTIrIXAAvhEC6KW1a6oGAJ9vqQZ+PGrorid4pUK65taRSA2MXmKtMhY84y1l8cokZt
	ILThAu4qxiBgvY8qjvOoTiTjBc0EgkBg7gGlk0REUjw2SAboirzmXxMuWSCLaAB7NfEep8WZMo+
	DWbe0u+UwHyrJHiFyxrzJYyjrXaa0OK/PfwBQCJga8cFirVAjoc0OXjksBjKNvpRqECyB36QRhH
	qD+F0embm6SKoTJdspmsTXUR84D4nP9tr0DBtbIaeo1gfOR3zlj4rSRpi0gOdb3kDTbA4LfCQtV
	rDKwnnEFnFsnondZt6c1IrwSMVAjBmJpyQkUrk7v52jn1QDsgclwGUrYa4Oagnz5fwEkmmOUvZu
	15Di1eGHEtO3dD40YShN0Cw5GpHbUjgeBYuxDX43EcGM5L2NtjRG1pZnsfcsTSKlcwe1JkUcUUz
	BGNFn2p
X-Received: by 2002:a05:6a00:2990:b0:869:9298:ba59 with SMTP id d2e1a72fcca58-874d84a6257mr9842225b3a.0.1789822368852;
        Sat, 19 Sep 2026 05:52:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:48 -0700 (PDT)
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v8 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Sat, 19 Sep 2026 20:51:15 +0800
Message-ID: <20260919125119.2107089-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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


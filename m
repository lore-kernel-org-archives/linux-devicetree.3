Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CE83FD14C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507863; cv=none; b=TSd09BR80AvnWMozARH2f4+6LW7i2ayBQTpWMu5Oh3CYvsgsZEQjfPUadQv91dJkUJtksRdyrtbSvHoVBXGLwqPEPE7zZlB6GoFi3ZWIJVlPg5W4a5VQWHrX3y+bf2tDDN/OSF73xX2EKu5q90nItUmn5QZW4Z9POG8xzhn8874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507863; c=relaxed/simple;
	bh=Xp/TUYJI1eAs/D+9Nq+dELgCqu+Ss/welMktAjHcpbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVCoMocJNA3E9QSSfIVFNZIzUwbF2MtSTXLoSqTBYZRI0LEN1Qz869eWt11S6Z1NPCJjtFlLykQm6Bt3epLODxrKTLdBiQBuVCmUiZdViueJ2IKTs6AUzwAqeO8xmqDvwJgbmV3DxSbO3fFVdScjAJHv34AEzSF+RC9GvXqvMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTVG2x2U; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTVG2x2U"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so6653090a12.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507855; x=1779112655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnjnB0/XPfthXcOXqkhM1htDcff/BGb30MwU7TWoKRg=;
        b=jTVG2x2Uzv7Dt8V8cSlP4y777+8Umg8UZR4qC4X5tWhuFi4FWQFNdi99gObVcIVWYh
         oLpRMdYIKJRz+zUeMBhJnJe+itGJ90THEwF47hQ+KNBpGdZB6q5rFu9bf59ndsOdvCvM
         Pe+W8fTkPch001mxqd1ckVyc+AHxBBIQgZcEF0IqMap+LmMV52rvWEiXhqKR8Xn2SgxS
         SKuwV96wcJpgR+Ocjcc01yCZT91wqWZFCUf7QMF33+IHkiuZWvgV3uA5qGPksBook4i5
         2BuxZcWbQ9hMYGsLBMuuKGCerc0YwGOI6q9KSl4wRVofStDZ6PQBX7nYY3DJtUeE0fdq
         t1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507855; x=1779112655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnjnB0/XPfthXcOXqkhM1htDcff/BGb30MwU7TWoKRg=;
        b=dALEGeJ7Nfn5ivqsl45byqtMMTZDPDgQQazLxKkbxyzalkEj6gQDvDd0w7XBgdjZra
         ZvJGgn+lc5kEeBI+rigukTJteuptwx2sdKaC8UVGTIWij5YfU5K2TMBElAXuX/n4nOQz
         gn6517BKddpmFM6/StvxH0clpiaaUqkYGCkZTYnAZAHT6jq+6aooLE3RzuIzD2d1z65r
         FzzkuLwXlXg4AOimt1VUnIElLeMzP626G5g4SloVZa/38QdoOu0JiHvZrfC2yrJhMA1u
         amhhkEdyK/mDtPk6m4gfFa6KWEFcXK5mxtzvt1Xgvlm712IFmggQnzyoQzt2PjjgBcVP
         RRdA==
X-Forwarded-Encrypted: i=1; AFNElJ+hWR8+IRXvnAeAi2s8PPF+gbZOqMtVcwbdzkyhFLUIhdCYMYNOynciYCGuUKXvRGAx7tAB2KycUsJI@vger.kernel.org
X-Gm-Message-State: AOJu0YxDuxNekdiTWqFtDLp+qbnsVgJO9sLcOwrPg2AaK7Tx6qhXalqE
	0xrjQg19STxmmG3QZuJa3mgxdVNYg6t13EpiUYwQo4IzlRLCg8dfejyJ
X-Gm-Gg: Acq92OEg9jSRC983Ej8ze9LnDnBMeNy+LrZEvLhq+hhlQCqZFvFiaJ2mH2Mm02VwaEN
	Fjrjm/Jz76tYV5zaSbtioQKJP+NEtua89HttCar9jeSlyVxYjA/orcK47150UkZow+SP2l+pXEv
	MAj/iSdAWpgOth7etfoo2VTJxFwaoKF2aC6s565/m8KUoJll15mKBHPJbcpJPaG8tYY5Owx2psT
	agZj2CYfIgq86ZjeGYGMf4voPsaUs9DYiFRwVnPLpsZA9hyxRxnL1pZfOpsfQTAsnR6ulbDRVsQ
	DyoB3hpjjijMCdi88xJAfeRp/tgaoT828l4fpWAVrcnoETaVxcI1MddQmuZxdRJa521VWzsmYJ2
	eSeURoPb38cAcaWiszQlLR3H8BcEfoebrNWgF5NSYK3KSod1lPGdK03dSaGYC82vApm7/URufOJ
	xPPHeWeKQxBdfv
X-Received: by 2002:a05:6402:b8a:b0:671:9dec:ba3 with SMTP id 4fb4d7f45d1cf-67e0ee9abb2mr5590673a12.13.1778507854968;
        Mon, 11 May 2026 06:57:34 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
Date: Mon, 11 May 2026 16:57:00 +0300
Message-ID: <20260511135703.62470-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the XMM6260 PHY used by various devices based on the Nvidia Tegra
SoC, describing its usage

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
new file mode 100644
index 000000000000..0346433c9772
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra PHY for XMM6260 modem
+
+description:
+  A hardware configuration used in Tegra SoCs to provide proper interaction
+  between the application processor and the modem, as well as control over
+  one of the SoC's USB lines for the modem.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra-xmm6260
+
+  enable-gpios:
+    description: GPIO connected to the EINT1 pin
+    maxItems: 1
+
+  nvidia,usb-bus:
+    description:
+      Contains two phandles; the first is pointing to the Host's USB controller
+      and the second linking to the controller's PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 2
+
+  phy-supply:
+    description: Supply powering the PHY.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - nvidia,usb-bus
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    phy {
+        compatible = "nvidia,tegra-xmm6260";
+
+        enable-gpios = <&gpio 165 GPIO_ACTIVE_HIGH>;
+        phy-supply = <&vdd_3v3_vbat>;
+
+        nvidia,usb-bus = <&hsic_usb>, <&phy2>;
+        #phy-cells = <0>;
+    };
-- 
2.51.0


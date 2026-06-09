Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166E834DCD2
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973789; cv=none; b=S5ewgaNPi6HBjQHFNkfM+dnVfOBpPsm0+raWg7A9wBflC9vqwU+rgEeIC9qykwAudRRB42DZxEInwdiT5Beway2M9j+C5nm6vr1QaQMYwNwfhinVXlhZHd+a3kbjZoiEW5Swn4JdqzNN9Mdz5TpL7QSOnH2/dGJ0iCwPvEO0jZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973789; c=relaxed/simple;
	bh=GUCpEkCI21GzL/gpcRdDzxrJDPnhrj1s0kZ1Xv3AQDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=q0y831Wg83i8vaw8CvPce5VO6hxO9m61ihLgojGPhp2YmnZQSSX6FU+bLtswk5StzvOVODH5fOVUVQDuXj5WL7/DPlMgQRrepzQOdJ8k3zPyy6dhTRl2i3L3IB+/3MfMZsFPS5oS94bVLwzYwMfnfZ+yIB021Kch9B80zukKImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2780C700004488; Tue, 9 Jun 2026 10:56:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 7EC4E7931B284CB5A90653D807855822
X-SMAIL-UIID: 7EC4E7931B284CB5A90653D807855822-20260609-105615
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF
Date: Tue,  9 Jun 2026 10:56:05 +0800
Message-Id: <20260609025605.16945-8-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609025605.16945-1-zhangyi@everest-semi.com>
References: <20260609025605.16945-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add members related to HPF

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
index 75ce0bc48..be92014c0 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -38,6 +38,27 @@ properties:
     description:
       Interface power supply.
 
+  everest,mclk-from-sclk:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that SCLK is used as the internal clock.
+
+  everest,hpfl:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the HPF value of ADCL.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0a
+
+  everest,hpfr:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the HPF value of ADCR.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0a
+
 required:
   - compatible
   - reg
@@ -58,5 +79,7 @@ examples:
         #sound-dai-cells = <0>;
         vddd-supply = <&vdd3v3>;
         vdda-supply = <&vdd3v3>;
+        everest,hpfl = [0a];
+        everest,hpfr = [0a];
       };
     };
-- 
2.17.1


Received: from smtp153-182.sina.com.cn (smtp153-182.sina.com.cn [61.135.153.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB59336891
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974412; cv=none; b=LEUqETQsrPZoZwO2sdtNs1TIsKL/wZF7No8NMUNP2uihEFDVmvgc6LEBeWwgnqO415rCrPHztO3fNn2R2/jp4KvT6YTzSVd/+Aw2ejL6eZwQMIarObRqYjq6BjAI1acTFUMtnESQqKudmEtWCabLnO7Yjps5fGo6C5QLx1IiezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974412; c=relaxed/simple;
	bh=mEAgPbspjroupkPkgrEhICZ9xaV855GXoWdTYDZ3dHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PTx09PSDnIJbUF/8v6C5J1VvfzGaGZ2w1vmLyg074eiB4c1NhRzx+cxhgTA+Nj36GEc90lakbbUpPOOWV75mdGx0wKqxlWt0yF7u5ILO/1EkOavQjlsjSxxLD2Gcvp1+kvRFaUi3J9wYC8TYa4hkg49CIo0X3t0YGf6dPYtcPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A278331000011AE; Tue, 9 Jun 2026 11:06:29 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 91644FDEAD464A65A2EB1BD2E2454BAC
X-SMAIL-UIID: 91644FDEAD464A65A2EB1BD2E2454BAC-20260609-110629
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Tue,  9 Jun 2026 11:06:23 +0800
Message-Id: <20260609030623.17404-8-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609030623.17404-1-zhangyi@everest-semi.com>
References: <20260609030623.17404-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add members related to HPF and mclk_source

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


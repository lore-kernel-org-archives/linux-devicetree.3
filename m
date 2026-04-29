Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D439D6EC
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448494; cv=none; b=Ub7pAV4j7POahLTUInaNBWbGVHLDYoSaUl7St4jHQ6ILZaDJgZ/LkaL6LMQyf5OBSisdFweRV72fdD8DcLAGmeO0EsXE04OfxK9zW+rIk9DHGDbAiuUr0ooP0URn4r+68oS1ngG/YtiLf6YEEPB8dPoDspU8UrS74IURlJHAdj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448494; c=relaxed/simple;
	bh=8tOWHu6uZ90AtUHaIBCGODtBeugzMn9R0wSP4/7acF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWdm1TD0pZs5G7CJxHab4uXvmi1GqDRvUuj6OXAzPRwknWQ9T1r4aL1foNmS0x8qomCWoP/v8RPnwJOwMBIKR+q7RzC+BLRUb2fMcUXtifbV4KqL5Ls+WlZPBwnjyHiOyJZb9wqQCbqLsPGzx3SOxXNKOp4p6SurENPK45Occ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aK5Fwd0Y; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aK5Fwd0Y"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so10525842a91.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448492; x=1778053292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=;
        b=aK5Fwd0YYx0kGkfsKymmGiBUL2VZ1qr1Km1umcWMPOtBNjuUJFmY6Oqgf/kzeMx2Gs
         p16VRU0mhOil+JYv4ywfbU3cnDp3ywaOkPnYioE3J5H5tdBIN2mANXhXPENW1Jzl5dZI
         VSg0zUhKhDI4wBfAj2Mmq9CzsHHag/NP9Q2IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448492; x=1778053292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=;
        b=eWFop6f3mIcXUFe0kMOEn+Nu5kPA28Yh7kxqMfSmZgJID4ibmi83O+5hUBUv7zSYIz
         XFf2mq4kO7907yPX26tVEOBwhK9l2kb1h6Mi3sO7Mcooq/dXhAk9ztCAFB+ARZHQz9Z2
         YDE54DKOUiK46OhDO7gaAm4uwNiDkQ3V3bZIlBfw15CWF4pDTWYXMP/SngIVED/yqSkj
         /WCshQ3BN1vx2bCDf1UYVajR8XTNSlWV0S/EwdfTWWKRna0iSr81OmhPHPh9KcZk+6Dq
         Fboozl9//hkXUn2sBpf0lX8Rw0fWjOa5EdsjrWlf8vmy7xeL/fQgLEYwD8av8HUmJdz5
         lMFg==
X-Forwarded-Encrypted: i=1; AFNElJ+BUDa5lHiR2dZ729xMhAMY6Epj2+8HpdeZCNcMJjwpsW/kkxS5hFVLpkBMCbgR8Da9J71c7D1Z9ZM4@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbwfi3V58gKeSE3Y4OVbSH65LGfqkd/wC7BMFhN0a3Es/yUbv
	U6/F8yLUNPJg/PRlw8rB5cc9uOu4uMvtSgptnIWmjJ77Qd5lpSa1KZRkuVCfSkIuBQ==
X-Gm-Gg: AeBDiet8qHPjrpG1uqgrrsTf3WuxZ2Cs/D2QY5I/S37LC6D9e07cQf6f/N5JXj0zyEW
	nu41fkqFJh8KWK8A97MUchXDeWDG4PH+mXuDGxR7F7P013rhspmD7r/ielpkkvy0XuOYJzYdiuV
	YQrt7Z1a9XYsg8naicqHu/9+rtYGIE2QYL5WkqWoPvDGc7ywHvgC7wnX9HY1vJVFm2MR64+OBwg
	RJi/DDKQShLDVdm6Qmu5fx4dvLyFh2VWOLrtdxhYYCZCcmObH6JgBZcPIMXMPT8emwYs4bX+ILL
	MH3kp3H12ImNc9h7ViZZfDiE/C67B9KUa4ihY6rXOGwGZCYo0k/2Yz+nLvpDlr3tXd9Xsl10mk5
	pi1wNm10DUCqA4khT1jx4Hp1SMUtbEF3IK2DQg9zzzVlgWRMRYJDSkE+eghVlScOdIWWXzXVP8I
	QiXKYILAXf9JNJ6pDnT2R5vwKn/tAjmuQkcvdtqO84sTawtclktAAanvmaKgZDbkQr2y/8u+fBy
	oGBWT4/MiEczPLTkOw=
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7208188a91.13.1777448492355;
        Wed, 29 Apr 2026 00:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Wed, 29 Apr 2026 15:41:07 +0800
Message-ID: <20260429074113.3720271-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MT6397 family each buck regulator has a separate supply. LDOs are
split into various groups with independent supplies. There is also a
supply for the regulator control logic.

Add descriptions for all of the supplies for the MT6359.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
- Dropped ack from Krzysztof
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..7fbf07208d0f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsmps-supply:
+    description: Supply for regulator control logic
+
+patternProperties:
+  "^vsys-v[a-z]+[0-9]*-supply$":
+    description: Supplies for PMIC buck regulators
+  "^vs(ys|[12])-ldo[1-9]-supply$":
+    description: Supplies for PMIC LDO regulators
+
 required:
   - compatible
   - regulators
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        "compatible":
+          contains:
+            const: mediatek,mt6359
+    then:
+      properties:
+        vsys-ldo1-supply:
+          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
+        vsys-ldo2-supply:
+          description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfck, vrfck_1,
+            vemc, vsim1, vsim2, vusb
+        vsys-vcore-supply:
+          description: Supply for buck regulator vcore
+        vsys-vgpu11-supply:
+          description: Supply for buck regulator vgpu11
+        vsys-vmodem-supply:
+          description: Supply for buck regulator vmodem
+        vsys-vpa-supply:
+          description: Supply for buck regulator vpa
+        vsys-vproc1-supply:
+          description: Supply for buck regulator vproc1
+        vsys-vproc2-supply:
+          description: Supply for buck regulator vproc2
+        vsys-vpu-supply:
+          description: Supply for buck regulator vpu
+        vsys-vs1-supply:
+          description: Supply for buck regulator vs1
+        vsys-vs2-supply:
+          description: Supply for buck regulator vs2
+        vs1-ldo1-supply:
+          description: Supply for LDOs vaud18, vcamio, vm18, vufs
+        vs1-ldo2-supply:
+          description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+        vs2-ldo1-supply:
+          description:
+            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+        vs2-ldo2-supply:
+          description: Supply for LDOs va09, va12, vcn13, vrf12
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.54.0.545.g6539524ca2-goog


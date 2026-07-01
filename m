Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB7F3B3894
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920563; cv=none; b=QNftmLB0y4WdOkeJfvW4fT0V+wGpH1lLCkHTzmXmXE2ffYCCNCZXzdt7xCIud5WFEqU69wVkmqhVs+2jEpunqk9gMOMm/SEizLS291vUIU00ZN/CV6eiWfJkJFWJFgtPxj9QRE1Gbxk4il8tKIyc/eaIVQTLc6XfwW4ZUFeUVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920563; c=relaxed/simple;
	bh=QYXzOp6ZTSFVPoAGAC49rhJcrcMATpYeqRLf0POJWbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IdhBlZHVZR0Vm5UQwrGlZA/xfWOGP15U3F7VkQZGrDp/NM6iY7p/HxQMrstI2KPJtslKMzf9MJeqGFKCPlSnClznjNjBr/yYhtnC/sVkib26Hj+YY5O+gHaHDjxrvlHXZaBfo1TvpsVO8hoK9ZkYadFpkykWFWtOVeQGOxIRE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVjZS/rF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVjZS/rF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so6412215e9.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782920561; x=1783525361; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+NRBUp7hwQMTT79ULwyBxmmco53fwj7wXNTwiWQiWA=;
        b=LVjZS/rFsaf1KZkcYcqTQT1W101EIoZMl+NQYszuOCVvB6eo7ngNJ4Vo/XcKOnBQHa
         6UD+7Rv6vNAMI1Tj+RCY+6r2U381gDvUh9mdCPhrvLZpeAg6G/OOgGYRm++5YYfBFbPT
         geKyfly0x5+GlVq/RTMst891Br5FWECJE4SuFuF5aAubBGQnRij4b8PM3uAFg6OEfzhu
         U8P2EnbgdCukOX81Sa4oK/7goiZG+a7V2mkR7l3qfP6EyVJMTzeqnggi4WgcKXsEuETZ
         nvmBR/uRy3Ny95XLFLT7vvgBW46aq0dC9hGP94hHELSZ0tRON3H54Ic0m7IlqEzMZqq/
         dzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782920561; x=1783525361;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+NRBUp7hwQMTT79ULwyBxmmco53fwj7wXNTwiWQiWA=;
        b=QyBVRIOaRSNb2u3hv8vhhCcTMQCjIkPrMj1BgBBCYr9p1c8iYJG3xDdKJNO2OMJlu8
         gpitpu7z9zhdY2zqTHOy2U/HMZ1zE9yiayZ/cuMWBtGm/j/SkkLxjH1/u5aEXNJGM1w4
         5XiTrkvR/U87ZiYJh9z8O4O2+L39yxr0GvvURjiFeP+8vX+oBwi9jyGo0qYP2PGoNl5T
         dABwsxbVOIVbyDZv7sVMzZhVTjNsuRs/GkrIanHljpocpr9bRnu+yR6c8gmlIU9pWTAz
         MBlzPU7sJW2et4rveJBtHkRh+YjiP2VWUQt/MQq/i2j7dhqm9AMxuz8sw8vU7uLC2pSf
         HE2w==
X-Forwarded-Encrypted: i=1; AFNElJ/lGjwEVszGTMRBDZj1vXJSdU8ISWAI9DusUgBmoqIULKHSWEb61+nJa1F/yejNoOJq1G8tCtM1HcUU@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVWH1sJ3m3J6co6MP6oaorDPPciET9wR5LdkNWeHS+J5nc0UN
	SZmNKFNmZLB2klpI05ojM2gEpkd52L88AxFzx06Sm97zfv5MUe82cNPsj+ZviuM9
X-Gm-Gg: AfdE7cl+eB8wssnzsf/FbKB39pm3kaM+JiyCq8rl0SLJmQ6cadsa9uPogNZ0GHtVAvJ
	WDVyxJ+M/gaJjMKY4jgK6h+CqmmQx3JviwKrlyhQkMGrHBXQE8Rsxv7FusndVo5fBuvXmm1TppG
	1a4xnrTxXzZkUuM9aHDEql+EkATs3COUt5BLgS/f6wU/CwEbDEAUbnhlx1md59/YsdARaZatSBv
	pzq5C29VduPAckl9EfmlBRDkRi3K+37Ht2mZrxfEDHVreEJn6jCFy5ntgSx2l6tETukTAJ+rO/L
	xLfgE2dRESlj4g0gQrjzUxcNLt5qzNc/Dh1gtVsMJJEx9n0ITtnKfjdY/z3oHhF3Cqj5IlDWp9r
	dPrX4KJIY88xyXmylCqt+p4c1TE5/ra7G8iUf1vMuT1YC5I2JBWU+ZUR0RE6iU+zgsmkxxqHYW+
	17jomCmVleO9XDQGnyqAuFeVyPCAP9ORadTKNeQ2LgZqo47pZ1BslleaisJBdWItSRCZzMREUMa
	LwrR57Cri+/bk+E
X-Received: by 2002:a05:600c:212:b0:493:bb2e:11a5 with SMTP id 5b1f17b1804b1-493c3cd99c9mr13791975e9.15.1782920560613;
        Wed, 01 Jul 2026 08:42:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4bfdd5sm148048465e9.1.2026.07.01.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:42:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 01 Jul 2026 17:42:24 +0200
Subject: [PATCH] dt-bindings: wireless: ath12k: allow calibration variant
 for WCN7850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
X-B4-Tracking: v=1; b=H4sIAF81RWoC/x3MQQqEMAxA0atI1hNoC1qZq8gsYk01KB1Jiwji3
 S0uH3z+BZlVOMO3uUD5kCz/VGE/DYSF0swoUzU44zrjjUUqi3UrBtpkVCo1x4NUKBUcfd+a6GO
 cfIA62JWjnO98+N33A+ON1apsAAAA
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

qcom,calibration-variant selects board-specific calibration data for
systems where the bus and device IDs are not unique.

This is not specific to WSI-capable QCN9274 devices. The WSI binding
already allows the property, so allow it in the WCN7850 PCI binding too.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Document qcom,calibration-variant in the WCN7850 PCI binding. The
generic property is already documented for ath12k WSI devices in
qcom,ath12k-wsi.yaml, and selecting board-specific calibration data is
not specific to WSI-capable QCN9274 designs.

This complements Andrew LaMarche's ath12k driver series, which adds
driver support for reading qcom,calibration-variant from the device tree
and drops the deprecated qcom,ath12k-calibration-variant from the WSI
binding:

https://lore.kernel.org/ath12k/20260630133001.1426824-1-andrewjlamarche@gmail.com/T/#t

That series makes the generic property effective in the driver while
this patch closes the schema gap for WCN7850 devices.
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd59988f..cf3e1fd99c12 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -54,6 +54,12 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
 required:
   - compatible
   - reg

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


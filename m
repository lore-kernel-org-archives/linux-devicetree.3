Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BC48BD39
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312212; cv=none; b=OY1yHdsLpqQ6UX3xxHYotxFwzf8yg4s34Ah+qwiJq9BLCwLNEm0AXvObtf7uVFalKXL6FQ+tP6p+58ZKtiOzQO56xAMHL5iYgCylkzYIOb2TNa42TbaDC2HTPZeoYSi2FMiBARtKViGyz2/nwoXwLnKep4gu8Eum//bDmFxaX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312212; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5WWIStU5prjX5Js8GerLKjA5dnyin+zK37dQSBpcsT1nmJPuvL+MZGURqdXXuu63VvBH6FoJ6CRwcTieebgOXKOlHGFReDhrk+lRxq+cHwKhehyASnPUXLIXOPhvj1QQM5M8Zog6lb0bPZEahJPs1lu3n5gvugmu84RyL7RH9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPKYVMWq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPKYVMWq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so1753456a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312209; x=1787917009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=HPKYVMWqdrlpxRM4N4RNK6ltl5JL9UdDQ5hOqltqiGSeQ3HknGVYcQPX+fPaK1tWqs
         U/rCJu+RWn/L4fOdNnAR7Z1/qqB+uHYg+WV+ju/I5kN5rGlVRw/xosHPKkRehth+Oqj4
         1IKubAhmh2FZpPk4p4cBbfrG1Xccf8csw12j25nF+8depk8X0mDQ2Jd9EM9mzOfRr5EG
         1qqdRw/XVGYaoEXMoyZT7daePyGbT9P0NRj0s7B42S92MWow7VfnaGMJzvNxbRvYwrYz
         rJgOgRA6Nm+YaAW97dXZE6aTxB3fkDRRXOZDeLnKDMZcGhGbj+lduAaCHn/r/GvId8iX
         NXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312209; x=1787917009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=Xwd480xZ8WoQLztiitXdkcXDLFZYrB8UB90P5qKhttAEBvH9FdvFa07gbmlHsxgnvp
         ufs5OdD2+wjwvLi7HM4Wos1xdw74jrlx50dnb6jjoSnzVJ4YyvuWM3b+T3rY801GolaD
         SQlh24fDKN1CYkwtY7wDKD9lTq0o1o9v9r4SoEB/mXceC8Nvy+d5eF8V1lD2AbaIk/mo
         LvbnwD+omS8RIB6+tX8kfN+7hngHEEHiA7hyVmf+qPG55kP+CSBxKXmJ8pIb05sQ/udN
         5nPYr+UrzMfSWuR+ctBpETNFWt/r9HTl5M0JvOVEzDtEcmTmRUahFnyl+xChETDSZikG
         papQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVsKEgMrT6iBYLThburb+QwfkD2nQOX11xLizOH+SXnAyNF8pWdI8+OFXLPguARh9RgRnzmmF4/buC@vger.kernel.org
X-Gm-Message-State: AFuF++n65K+D7BJNQAQ7vBZ/O1iCZ7fWHwpbReE31zHq5ebUwRFK0VK0
	a3iEtWhFBtsn8d9eYDPK/BpZWFhvpJxvhan/F4aJJlaLooN0bhyvs3ls
X-Gm-Gg: AR+sD138pnoaChx5yFlZ/s4YQyG/A3ljvRUjsJeUqOrGyjFOunyxCnxx0ZA4t+GaBhS
	OzYL40ejRo60qlVQMRYREMaOVUs6iwLZtSnXVgJWsrv4NEryFEjCstECd3WtWkbPq/n0p73XQE9
	VHA6+ll8OK2CAbSp5E93gTHwUpzYBwzAR0O88HNWlKaqc30joHstBwqW+3oysC8vG/avGTk/jMb
	BuHXxdPHdxWIaA0j8csdLPb5v3yhEPQcQlxPLOntXzN5h5AmPZjDNOLFoWVmsER989xWCgFgO3D
	WUjEyJYMzyTCPedxEg+hU6PK3QaryXwZ36WZmhZFz9T3FeBpvcijJd3pSWhNuhjJsh8x+UjKHJr
	bhr3NrMHlSNzI1bTzFdXPhX13EOX+LH2ZAuHk1XKRw1zbWjaGsTI5DBiRoNXEinK3UQRxwZFZ5C
	VU9nzVE3ssR7yCKqhCoRtLwtZaSQw/wXg56d4fAAeBv4Eoe5dDFGMTP6Qc/gUZCmZT0fdHBd+ti
	mgcyyTMNlfA8OARt/Vfh3KM
X-Received: by 2002:a05:6402:458d:b0:6a3:87b7:b5a9 with SMTP id 4fb4d7f45d1cf-6a42f1f9d6cmr6197996a12.12.1787312208743;
        Fri, 21 Aug 2026 04:36:48 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:48 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:31 +0200
Subject: [PATCH v3 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-4-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
In-Reply-To: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0


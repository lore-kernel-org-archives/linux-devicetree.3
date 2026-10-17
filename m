Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A093D6497
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233215; cv=none; b=AmN11804RJxpBVM7pPA26GjJaZqfFAe1m0MDPTRbEFmeB73pEq5McpJAtnqo4iS+Q7xIi/y48NK2dG7OdbxCT6m6qteW2P0MsWuKyn15J+m5YAw31DyR6XAOXT15QcRrbPFMary19We5daccU+tgZHCeTLjhw++CBgCRtVCTPR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233215; c=relaxed/simple;
	bh=H+/PngVUyrVREnpYqPk0KT7pitaBFyX7wNqwwHkQmDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfUv7USvKZcdS11UXgmyGyOA+ATlwJiBcKzYocuo31QhTEFxJvo6VHqeaxtJYNDHCqDjXwAjyg4YPHhH2QCGXT6oAfcBxY04x0EiXEC4YlCooXiYyk9VEkPZz4XGFuj8ow2yfG2hhXfhgt0hg3sG+TLY7ngNGhT3P50mfLiQQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqB74/KU; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqB74/KU"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so165953a12.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792233214; x=1792838014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=NqB74/KUgwesx3xYGyZWogoVMpX9xc+qhVvLA0e/hQSqG21+JpostPRx2Ql6aQPnqQ
         8+XU68WhhSiArbOa+uzLAO3h+Gl9NnIjEvBU9TqZajMM01vqe4K0MxWYa3D0fjXJKLBB
         JbdNZsPEQtIdl8JYy315lUrp9lpgykjTXdf0FHhDjjdhY/81iNRQTqOULLdhCrRVtudl
         ueMzryAWMtB/HiP4pq/6FKdbfhtPLlBW28SCwg7QXTl1f0wXNvrq7p1/eohcZ8I+gnhR
         1Epww1qMp89wGMmu0RY//7d0+qX74UimA8GEsjcn9v7XywyzlxP/Z0WHyokBnrjn5UZm
         V8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233214; x=1792838014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=sMPzdvHfkvRmJMBKYcCqdf8q2QKrBLl1vJQgFGk0Lboxacn8grrT908qIKPBfcnTLT
         ch35h2uhvOLAUTVyWINawqB4bPU3kepCYQSJQTzEyoQp6eE8BUW0wzEQ5dBQ4hfZtPj2
         0zFgnLsoSQ/+XC2ydXdO9RpKGaNNx97D6Ak+KQrg99nZ8dX9rWHhYMG3GToo/3HCenFs
         C80J63HIanNjunQXbAZ24xP2D5mxUvQYTyOyDyVKAsCDCId5FcRiIVdaLPEVSsTS6uS+
         qekZSN564KTpbFJs5Dzt1aQiAuXaaWdxFGLNsisbcT/VgrjCujs4yR2XpK0Iad88yE8i
         IRCA==
X-Forwarded-Encrypted: i=1; AKwUvBxftzGagkXApEA3J5u5AspMfwbV9rM9di1laZsSi9o/SV1tA85jX4LahPvlV87z/iPEIEj8SILmVZeZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIO9z5c0pDkJN1JkhAr+tfn5enSRkwPhkVvh7Y8kPd362s/xPkd
	wQJAn3kY18Wt5LbO4rkXbKHHEdt7WZsH64KyxBSP+JPizJFvSnwCd3i0
X-Gm-Gg: AYBFou2EkXqTd32Uyr1JYOW36OwcYfFRbJCsmN7PzyWotVJ20M/D/ae8f9/ysWX4v6M
	TOwEumWNaNzdiSa9wpssGeVxwHTlEpuKkaZYWli+8rWM6MqJFCWs207jp4Co1ZHomdBE4Iqld6f
	d74uR2saLLh8z6OP4WHK1ZUWK22UWyagGSm6614PZ8odm5A6nmQRc0ptqeINDP8DiKXvzj4jny6
	R0NYM2SRiauwYKTilajxWgsG5+Unek3M3oxXGhUIpzJFhCw3cEkcrUd43PMU5BJvFOuDMhZum4f
	VhqTqYR3V+6AMvu2UeMMVghygkQWE4mcJkn2arXzO5/kkv+7o1oGJQiQ1Ven8P3yNxeJq40sqA7
	obB6dcpCCPKb3lZtdcMduHripVraFHqJGEd3J3Ig03CYl3VHC52pJt1VULiYT0ErWJNc78BxMWI
	QGy1ovW4dPKwyiJeTOfLdC5wB/X5HShSn75ak9OdMuWXxY2VyYyKsbo8E+
X-Received: by 2002:a05:6a20:d80f:b0:3df:5190:2275 with SMTP id adf61e73a8af0-3e22607d574mr1478512637.70.1792233213912;
        Sat, 17 Oct 2026 03:33:33 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:372d::57f:4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58414986sm2051585b3a.57.2026.10.17.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:33:33 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add smartisan
Date: Sat, 17 Oct 2026 18:32:48 +0800
Message-ID: <20261017103250.800109-2-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017103250.800109-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add a vendor prefix for Smartisan Technology, used by Smartisan
devices such as the R1 (trident).

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..6ad8d3499227 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1535,6 +1535,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
+  "^smartisan,.*":
+    description: Smartisan Technology Co., Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.56.0


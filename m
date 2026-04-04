Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D93347FEC
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332220; cv=none; b=MNzHvHZiLCD9EXou+pDk/gEbxvasaI8r2HasEh55ZKA+2g9gnMbTUP4oXc8enj6XxoAQNyW/4k67Qzy76VEl625EbJiWpwRv77ZSnEH9jXmVR5ysR/chtdIGRxT9Peln232gZQtUFqcunGpftc9rHPriiSvJ7fVxB+YWB5XoQQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332220; c=relaxed/simple;
	bh=3Xv4nibSd3YhIw/2HOiW6wCFpL+iM2oTO2BNgtZLMJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n9mZejxJ0S4yX2yofA83T0Zuafi4kLWX3Oph4aXzgGxTgFGG3czkXADIcl1MPiZsQxcWmu+GUoKkmhuvaAyc1eDTBORn+SJ2CZ1vHz1Pz9Tl7y+j1OAqyUCG37RR+GgvpHlbBTt6X81LtsEYkvF/tJchQmspGXm+fWSrPDU8t+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIu+lzDU; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIu+lzDU"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso2034636e0c.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775332217; x=1775937017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFw0d3YxVX0IoKpqo6KQF5VmNpCfzzBEIlKe5xv8oSw=;
        b=QIu+lzDUA0FhOpY70t8Sw5JbkcxV5u8OoTee1hPZrRpkkTiq9bY1UAObtoGFxNq1tr
         RkkopdiARmdz8wHX5Ulrio9X0mkyua2U98vxktzT3dmtdHTix6ECCrHUhaJOotT4Wxh3
         WaLZ7Bvd5Az/O4qiX+c9egfAm0SpTb46qiCaeq9xY+AWfT89uzznQqnMKVBUauMga/sJ
         jQhcPmjgv0DpiOLRAZjBPsKGIZ7sxlMqEZmVqjna/em7eDMUUa1QR7N4TZmdBpjGWlQv
         R+U8MyMNYIHXRX2gcFiRHrDgE7YytVDFxaw5qBiOGfKrLjuDrvkKbnFtlHsdvBN9w42b
         JS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775332217; x=1775937017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFw0d3YxVX0IoKpqo6KQF5VmNpCfzzBEIlKe5xv8oSw=;
        b=PbyYTEO2/aOOv3FWMGgstkozh1Ly52b9hm2kuZJEMptz1izUcHt37FUAK2VRfrA2Lm
         nZUlPhrVUCnbSTmwOQKMzezqXQqu9KOTs3qqYZ0kBqVcKBYjXZSRd8WQYoxBkTLOAjAi
         OAwSL0Arqy7UziJoU7jyek1NDowIlxhBL38n0K4bXzvsH6OxYnnCyTBqI2lE+y49+vaE
         BSN5e0ICnn8dhLV67HphzU581xWewm0LH5OwhIR5UT3+JYu3jM7LCe/G8oJDT5fmj472
         JxflzCyjkfSw2zlzDxyKaZ5ZGRzw0t7H2lzpvEKAUAtOleALk8coirZqFtzH4YOExE4m
         KngQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIvTWO4rHqgocqHcwXQEkFOLpZrC4incT/y3/XZQdJXWJYFLLgeHdGU1WOgYrtwEwe0wCSSzc0TPhg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7sYR9Y42rROFwhbaQ9jqnwtVH5wkdKw+26McxyuBBx86tCzNm
	smnT7MLOYeQRELi0dSLbcEP4+2pk1vgTI/CgngNA00XTFvVH9EsrgEmW
X-Gm-Gg: AeBDieuk3WocGykUsgZrNMP01cludGMWWi3ZzGAMPBUCQwIkFkoSRI9sCPjYMtCqh+v
	CVy2+A5f1hPTjne3ADLcybZuy/vN4S7o+rX4Huo5GgVGpWQTdM1lgHkAyKM+VbtKox0KIXAcE3M
	LWiYtiPXPgcQSBj8j0332FJv9/hVUAS35bqoSW7G7KB6ofrCGjscDl1JpJl4dXjqeLNkTcZ/LtE
	fJthdvGiZ6tlRB256ciiH4E23ThZ7DH82Ng0+JWqihZyuP0cMbf7ET55HO9JNLuh3flftfXwYL4
	0sVb/S4x8vPZrbb6mnDANIyhjZ/MP6KrtGHbk89Cnr33BWdz3wuZ8bSekqcW9t4F5A3vnLeo0VW
	0Za1Vf0d/siPBoud8BMFdcI2uMXBPpS5655MwCilxznWumx8LhRGmthJX9im8CZlNZ8+vHeoBgn
	DG+Pr4coYO59PVJ199UnIu2vnuAOV/KNACFyw6ipA/wjDxLWWcBwMGDd6nOv4v3+574wBOhg==
X-Received: by 2002:a05:6123:28:b0:56d:b337:4709 with SMTP id 71dfb90a1353d-56db3374a26mr1454973e0c.6.1775332217583;
        Sat, 04 Apr 2026 12:50:17 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:fafb:5a7b:510a:6309:f015])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm10695521e0c.0.2026.04.04.12.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:50:16 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-analog-audio
Date: Sat,  4 Apr 2026 16:50:08 -0300
Message-ID: <20260404195008.1951910-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The 'rockchip,mic-det-gpios' property is not documented anywhere.

The 'rockchip,hp-det-gpios' property is not a valid property for the
'rockchip,rockchip-audio-max98090' compatible.

Remove both invalid properties.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi
index 51208d161d65..25c7c0667856 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi
@@ -14,8 +14,6 @@ sound {
 		rockchip,model = "VEYRON-I2S";
 		rockchip,i2s-controller = <&i2s>;
 		rockchip,audio-codec = <&max98090>;
-		rockchip,hp-det-gpios = <&gpio6 RK_PA5 GPIO_ACTIVE_HIGH>;
-		rockchip,mic-det-gpios = <&gpio6 RK_PB3 GPIO_ACTIVE_LOW>;
 		rockchip,headset-codec = <&headsetcodec>;
 		rockchip,hdmi-codec = <&hdmi>;
 	};
-- 
2.43.0


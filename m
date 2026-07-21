Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4BC36495B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642106; cv=none; b=L3AVG7vTS+xsRgjLl2a3p7WG81VOA9lsGRiPuqP5qpmJYtkg8n36cTDJ0W2jSBtC7A5tKw8maGlN2IWQwwYH/M7FoBG8waRfSszSqFnoFw3smpgXvWhrU2zHetoQWSKOm3F1kd7ObP8ZyouoQuyjGkYa7vaTaVx1nVCdpCun3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642106; c=relaxed/simple;
	bh=leLHZ//GDTUu1quZEWLXSQuDm7u7ivHr4Wz+j92qI9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otoohT4MRQ+9X/78ER0eKh3dgVbVfeNae4DsWwTqP439UQ/7CmqFMmAOsrjnLoF6OPJdGBguLYBhmUUiWxVF7AviVJdv7z2J1HlD32GEKhug1ODVjBsGO/y81jdkgAPASZkzlz9KDwIGuuAfC3fvLAIijDL9h2tJPZrBd1LjBjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfBv1bhO; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfBv1bhO"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c276bd3692so2119303e0c.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784642104; x=1785246904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i2PlaeHicSjwm9RU3yTM3r1gOKB/KIi551qDeGreVpA=;
        b=DfBv1bhOQuq/BD/ozfAYk3QIj/6ywzn7/EZuPOgKTG7PwAouOcmFVkHZ7d6Gs2NGZi
         bLFRolBMcncC6jf6jF0QDfgTWRKNAayFQ5jZ/DOLzkoL4SKHYgs1uGdZVoYLVac0V/7b
         ZEps+CQN4gyTn0ke1A5MQ5NYDmrCH2Rz26P+UMt2yA3PdrDDb1bFq3yJoAe8yZ6CGZIL
         g8ieGPL5OQUQ0Uu+gIBIjJaLCe8YWB8fiYoCmDWJa2RwavierRZ59Y1Kq7gZST0XMxGx
         RziAh+SDrWQl9lbE8RxKKwvsrfcQgRHwtnXQJkOTpPdUsPExPWeFt5f0nY6L2I+dWyGa
         6n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642104; x=1785246904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2PlaeHicSjwm9RU3yTM3r1gOKB/KIi551qDeGreVpA=;
        b=OpPuFktsDMhr6j9+U1mmIvKgPKuX5Wabz9195QZqmgp7gTQWbB+UEsqOC0Ugq0aCwN
         Ke5tldiTUSXrCB9O2ZZ2StHzQ/JeyYWW7cP8isTci18oH6cU+RJiimvz6DVZwNwtVKpy
         PREJosPyLV+8sUMW4ixMw9YRNoLK3ld91cSBkFgvXK4LkMebmUpVljby8rRQqAskGVwm
         /f//2MazwOM+hybx2EuyWxl96oWMW4rarLx5SLgiMKBoyQwcTntQ/sjXvBngxAMJaMNT
         JTtvvfC2sv1oKLiXo4YStuZnop1aGuhHZOoz2IvlUvRzFW7+akOusWt+eRE21XMBWsoW
         O8Bw==
X-Forwarded-Encrypted: i=1; AHgh+RpCws1qmQkBShS/yPU9fEbpRT+lMhzS4xflw8EIW58yXn6Ypp9PBnEfvHIyysgn+gMUaJCZeLeLf6AF@vger.kernel.org
X-Gm-Message-State: AOJu0YzvY8oV7N/JHl3pCOR82G0eDIXZQMyyZzkJzhUbV9dro2k8jML7
	eWRLI+w0n1w1nnFXSdFu+FnzpdtFi1bVACz5A7+CZX5WZfwZ+ym93FrP
X-Gm-Gg: AR+sD10LGUP0kzkqHdjhIYt6CPX7zCsHAU/8yKuZS9DgsrDq//THLuFKKZDjqlm5Zao
	aJp0cfu9eG+TUuPluvdx81MlUtWfbOMzZErsHqdx5p6jypvmLhNC1waWAuvfGnOeVMGwiM9F3xk
	fT7Ex1M2NLgtL1OrD3jnIMq5g9izIf0hTpi0WZvmsSRCBM40tovzyg78bDWv6MiGQfUx+ohAEU9
	r6NueNe0LKfTxisdC/s+OnGqYCvfghj9DqOKZ68qlYXVSCLwZFFvoqkzenUd2bHxn15S8YV6n08
	KuUB0YXSTdG4DNUcr6ez17w61WQqAJO6BvXFyvGT2wZ+pqOrd8wrQDIP1FLjhS0tV9XNP0svINV
	lwHHKLhRauj3jdZFYx2x1FU/kVjJiiHNDgnB0/YSfsxQiEW1fOFdH7TsjmQE0/nYr5BByT5iQGR
	USqHcMJCcFsgUnNXSKOV2gWrIa/5Oe+OkbLE+/8RFpz6LMgSmA2w==
X-Received: by 2002:a05:6122:3119:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c1afc0dee1mr5588051e0c.0.1784642103839;
        Tue, 21 Jul 2026 06:55:03 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eecc9b1csm13271387e0c.2.2026.07.21.06.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:55:03 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	ivan8215145640@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
Date: Tue, 21 Jul 2026 10:54:50 -0300
Message-ID: <20260721135450.45286-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TSC2007 driver uses the ti,max-rt property to specify the maximum
touch resistance, but the rk3566-bigtreetech-cb2 device tree uses the
undocumented ti,rt-thr property instead.

As a result, the configured value is ignored and the driver falls back
to its default maximum resistance value of 4095.

Replace ti,rt-thr with ti,max-rt to preserve the intended resistance
threshold of 3000.

Fixes: bfbc663d2733 ("arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use the documented ti,max-rt instead. (Sashiko)

 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index b6cf03a7ba66..04cf285e6c2a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -569,7 +569,7 @@ tft_tp: touchscreen@48 {
 		reg = <0x48>;
 		status = "okay";
 		ti,x-plate-ohms = <660>;
-		ti,rt-thr = <3000>;
+		ti,max-rt = <3000>;
 		ti,fuzzx = <32>;
 		ti,fuzzy = <16>;
 	};
-- 
2.43.0


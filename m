Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75F30214B
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 23:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785022447; cv=none; b=tSghfTgEX+7l6Oa0QNE2ZI3NKr1cGzkj24lclsDWtFYzv4NNp554L2Kv7GmCIr4j440p60fa+4r22/kTc1XAI8jOFibbPANLkydEU1/Cr9PLaABfZ8JHlePOmqf0XkXIKHYeZHVgrI/8fPlw9Vn4B6ALr5w5KpVeEicXhN/5EKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785022447; c=relaxed/simple;
	bh=ZZlLK3XoNG8URV/25/ZYKSfm0WcLQR3kQ9/ERs/FKmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHYfU+BkJQZQxub4TLB8rMPnojufBINR0ofEe39/eN+Tlcbx+bP4ziUSVmXHQZMK+f+na9pbCGv28HX3+VCWAp+F9qsZmQIDFd3oGnvhyhyrzyJCPSVVEt5+IymcgSc41ct9TyUwhy2uWSYnoqUNBeOec4/6O6OZHZWo/cQPwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4ny9Y0T; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4ny9Y0T"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf27856f9cso20193335ad.2
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 16:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022446; x=1785627246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8xAuZcDnYP1eURYO2Kgu2iqMh9+qGDBIHwuMtSJqYI=;
        b=S4ny9Y0TfBo6BC0lJ/hfX3vZz0bYcg3N6gjeulKvRgeBn0GvgiLExKOX7IW4K0asKQ
         zi5h0Tikn6WccvA1+JJ5egNieLH31DA5nVfo4Ao+bnwEHfnA8nCG9uZIWLbFaF3+FX6r
         gHNG6XCEMXcCz8iCUwYZ5gROHu1Vkn/ltUhDe/aBCFjA02occsEBNS5m6mqcAJmTeSGb
         ZsCBrXex6n2C8ESuMUeBBmZBeD2+XflCU3YghStqWIu3RNM6sPxZFcrrFyofGILCvRfS
         f8bfjqBLlmcz0dafGDXXji9cdS1lYHh16CUSJybH13mXCm5JnXSpWlZ0/gcqKVKnzoYF
         Cvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022446; x=1785627246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8xAuZcDnYP1eURYO2Kgu2iqMh9+qGDBIHwuMtSJqYI=;
        b=I+bf5i+jC5hwB0T2ZcMDGkqIuPpEfC8L1Vpm18hAprWI+pIQFASzalPG647AyL/tLc
         biExsmaivFmYmJ/LF0jdzmdZZKppXcHKst306HyCDCjPTz2Qrl+jFUIp3luXPguR+MjM
         /miZGeHjEgNDo8I936W73JlpOuHMOVZD7UDPkMwAii2K8OCXQfsint45kU7EAY5bQoZA
         UwREzVXGVb9rGkALE7+LBz7QZcO/6lFvLTakgcO6xCCAqD0n0CPFVO1zFZHOt3b1Tc6n
         9jqMtYSZxd9PrRX52u1pL0CDaKmXIV0RoeNY+ycOzOHU5q/qRpEW16o3u8VcH65/AILC
         FJhA==
X-Gm-Message-State: AOJu0Yy0DBjt6utSKpGLDwwIw6TI2Qy71kzyT6rXAiLBFw2trSoFStcH
	TPfYF9i3dYZq5eZf5RhnZ98nojfVo0yF20vCZL3KHP5Hr1dTZdAychdG
X-Gm-Gg: AR+sD11X2AaZs4xawJbvSr4Ua7O/33Hy6bn1xHW30WJJDGfWG7LvW2Pn/QDMm3Gd7sD
	B63KMt6uvazdt78wejtje4yhECcImMHmLZJRRD5N5efKEAH2B2Uydnb9+gJboTu6y2oUn4E12ER
	O6uQiHC+aUiKeOSGG9SdYKWwvAYGLN/IMimMmxC6ogj7SwgS83y6Y8iGWdjLnK29EG4k41dG66n
	he/YCxmytscfLvTtjpLPldiqwanbglCH5FnrEfU5ADbCixwOuJQ3/e2FUSj21RgJFxuTJjRotYW
	Xk5EXDUcRNElzIUhOQDbQB8J2uD4Xb/vaXa7mx90zNqAYqVvxoMP1KBZarhzReMYJwXbYNnTRah
	GgSLg8mTQwLqwJX23oy9aMJf+lMmoVzVpWXhPzSxZybmbXSyLHnJOK/PaxNLIKdeokWSMGmuGh7
	Vo
X-Received: by 2002:a17:902:cf10:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cfde862db4mr31827595ad.32.1785022445940;
        Sat, 25 Jul 2026 16:34:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc413sm13661365ad.44.2026.07.25.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:34:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
Date: Sun, 26 Jul 2026 07:33:50 +0800
Message-ID: <20260725233351.55004-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>
References: <20260725233351.55004-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current phy framework can not re-initialize the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be read. Setting the
phy id of board com260 manually so the phy id dectection can be skipped.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index b704b537385c..2a07cd8f2a56 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -174,7 +174,7 @@ &eth1 {
 
 	mdio {
 		phy1: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0


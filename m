Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE643D4F7
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799617; cv=none; b=fLPaMzoBpfXOrp0GyzUpTVByWNZ8pvknqGWq49sIpVnVGKJ1V192JcvJ5BAwvrFVypSc3Fc4EnbA3LAx9m6fLMaL7H3Dc9QKpoI51mua4p/9k4QGFUW0RyfdgUEGjmDOeZTInTdBI5ZQ/KOyDcyjUFIUZ0FetMPPJOrgCGwAaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799617; c=relaxed/simple;
	bh=yHDhlavl9vHp0NqPh9jIiLQu4IZ5LAW/yrrGE6EGg+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2XMiVdyOzpMfJKoKli0mI5W9gF5YyN3aHUJcSPqCNVdwGIKabks8UPy4uVf3nIW2T4zZATQU6a4jfpVHWU3PkFytzKzOrYW4NQ/a+V7yxDXfm6zltDzTzoVWwcc6xCYykE26EGlbaKWtY4FSKJNZf2rb+hcZOOxwxK9IlbTH9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=fdhSsbHB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="fdhSsbHB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so4141765e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784799612; x=1785404412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Uqg9pdeMYpDqmcMIc9g/0AdIWRM6TR7uMO47bmc1pw=;
        b=fdhSsbHB+gbvukQD9XYxHIFnnfNry+D+Dj4RsJWhsRkjX1jgGiTs9Km22x2m8k0c4D
         cekM/PnXiWN5aCJUFvj9Bk+vJ2S9A3mK7ym76rPr4vrNR7d2ZiGzxIhDkMNBKgzwMi7b
         +5axYjQoP1GDAYvyak0pLOG8dqQ8k/5jmp/AvDXsrL6s3mtorK9E8FbBynWoJ7i0Jex2
         JxPFf2esRvdGuXtvjEm4sv4z8cgDD1UK2N7zK6NEvMDSAObdot14ow0jU5tye4l20IO7
         3PWAl/F8PVYw9Fc+YzBBPIahe2lIRRd8QD1dfeMSWit1s0k5WQEBf6tdvv/Vt0OI61J1
         gTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799612; x=1785404412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Uqg9pdeMYpDqmcMIc9g/0AdIWRM6TR7uMO47bmc1pw=;
        b=HyERdKO5SKW0DbXslbJ/36tv9dBzozDcu0XpHJV19GbRQU/Mb1wJ8IAfFUjV8ofL8D
         AvlP0H4LlDfAqXhWXT6wDIRchSMaOCivllDEYJ6O0TP3vYdoIycAA6Hn8B2L8MNhyuOy
         WrgEO6BUfDn5NHOtdgdnigy1VvXHLcnkNQCL8XBJBZDJR5YHaqMrVIPl2FpzgGMGMX+c
         52LPeEqJ5f80CW+bG1Tjx3RNgh7JHit0K9bx06oOJAXJ4Mb70noNKSo1u+uocQQmebJR
         jyXbBW2qPI/nF0N54czGgE9LjWK5w3edUlkD+tlmnq5ckY2EfOqBhCHEnn+poQQ52ZPT
         fEsg==
X-Forwarded-Encrypted: i=1; AHgh+Rqesep9OsH3tLZqiE0ZJ6eLABvNIkGEJkcx3BXyQYJ/ox+Zb8YiV23ono5R8LeH4txFCAcghA87rZmI@vger.kernel.org
X-Gm-Message-State: AOJu0YzvicaNqf6YeIMfHRFXYF6ETPOZSYp9Y+UgpzW4PwgT5p/4yQJd
	X07LThgxMonUHa0uK0vX7v3WLkERMxHn5Cszgab6VsA8gEmID22dZtbFLOkGtTYj+Ec=
X-Gm-Gg: AR+sD11qcv1SFJtaod5C3vxI433qPSlQcTPkkEk8Av5Y0xg74ewcs8iANKChZAJQ1hR
	lzQBRqGN5KieHfGSsNz5xww3DrF7SN2xfcIQJAEGx4qYhEgActkGR3sgOLvTUl+BKKQE8lv/42U
	IJ9hu/PfgsjvvlLLy+TzA0rJzdkgWUko4pfmVua1Naxl9VGmuuHPRsYnysQXCPZ3oMkrs37fo6A
	wGiY0Mf8Jx1JhjF+Q8W/O6G3s4o2yy5GZWwzkofCGxkDn1e/O9KI57nKN633TetcPrQh6cqO/R5
	BgyRHwDpBa5OIH/1HCfjjQ2j6C6f7q5X5xqNLolzqw3//+St7cXfEvGwRcOgKPK8mbtnB36b7XH
	eln9kA1Mzw4828uQ4fPiCIi4Cp2/BaUoOTJYoGle/UomcpfG+y5976s6o0NJhd6l7suO8iFIBxQ
	tY/JxiMLIP0fnoVmw38Bcl/dbc4od8/GSoIGlt/9NJyKYVTc8JuiU=
X-Received: by 2002:a05:600c:35d0:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-49573d13720mr23201225e9.34.1784799612187;
        Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b030a64sm100986245e9.3.2026.07.23.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:11 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v3 2/4] arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants for SYR828 regulator initial mode
Date: Thu, 23 Jul 2026 11:39:59 +0200
Message-ID: <20260723094001.120264-3-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723094001.120264-1-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using a device tree bindings constant over a hardcoded value

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index d9ff777b4913..0387172cb470 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/fcs,fan53555-regulator.h>
 #include "rk3399-t.dtsi"
 
 / {
@@ -448,7 +449,7 @@ vdd_gpu: regulator@41 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vcc5v0_sys>;
-		regulator-initial-mode = <1>; /* 1:force PWM 2:auto */
+		regulator-initial-mode = <FAN53555_REGULATOR_MODE_FORCE_PWM>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
-- 
2.43.0


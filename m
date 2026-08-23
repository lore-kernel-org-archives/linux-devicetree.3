Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D642D0C72
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787528741; cv=none; b=rEP21YMOyaEXvOdtyf2Cu5UgEzgPX7gTpbgLMlgLCmstJ5rRruOayFztnVFmdkIakQF3Cccjd3qORMS15lSZCDSOnuRQ0bDv/MJp+vKf8+I1dDcgnyRAjAreUAkpzMfbU8FjPxk45Y7F/1eir19KytDlUZzPOkIrtTPUAbEAYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787528741; c=relaxed/simple;
	bh=RzvLZKWyoGQrm1BbOeawIxREqfKPZuHBTiSw0ZacfMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MueqSBsQSw8j5ddRzRi3tHjKORJgG7vAj5KBKioX04XFAywDQf8h6fsfP6KyEf5LxiDKv/dnb5qJW3wafZ04+3pA5IIC9CA0HhlHQYqhl7C3xDr7fbnvjmLsMfIvX17lFuWuj4SOnN40YREgX5tUl+tvGby1fY5lhw8lcXwU8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBn4JyL4; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBn4JyL4"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52d590ce5cdso19290041cf.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 16:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787528739; x=1788133539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmy0i3VZMA4HR325lbcOKfgC/mnsKmGPoPBOA/3Q7xg=;
        b=fBn4JyL4YIwHmi7dHnQqiFzjr199sfj+P+u0S7svHsjpX9OgJBQeUlKul7dpg778y8
         yt4Ctvb3yv1lMmABUlVxHjGhQvjLilRBKEbd9hCF0DMe3WGAlsrQI6yfGvbrBPjVDYe2
         JF83kLDT3u9T0Cf6eMit+Zh/z+F2bpJSSRSaMi22Z73SSGc2BuaRveokunvNS7zwo5wL
         U+CicIN5nAucjhvBOMwcPb5Wbw5/WOAR9fZMa/lznWOyvJVKixjPyegVktFTptzYelTB
         LNoATCJ+qS+wSrJ5ofe/E67lw2t8TQ0yahVN4I38snvBDNCcQRoQe+u09d0U063HkLJc
         Qb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787528739; x=1788133539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmy0i3VZMA4HR325lbcOKfgC/mnsKmGPoPBOA/3Q7xg=;
        b=orN9xydNR285RLXoGV83xdwAsn1PdeWz96uWJviv/rX4I8pSJ8vbR8hZ36xkeh+/PW
         K4uCfpZuAjJtJZrTeESCjar7GYHzEJRYudLt4aoHdDflaz7ve+kx9DVc7CO9V9h7See0
         hzxbq7En+EaIqGLY6vi9Fijm2T7YKhptRcj8PfEYCFIlFhCkCpL7AWjD9jO3NEaYHDxP
         A2RBmanXyck+H/XFc5IaekGdE2hv4o8ao2koXuNKjVvIZBTd42+5Y+IX5qBKi/EaeSnn
         9+I071fnhuZebSJ2NdSjjsd28Xa4SehU0zDxvZVRvAuft8pdJVt5U0hyW25THxvVpyig
         ri/w==
X-Gm-Message-State: AFuF++lnrgqNXvuoPXiWO93RPwqrb+um314kGJ5zqqxhsubs9PplDTVA
	ia22+pLciWO95Vpwik8AoOxXWNYrv297P+kGW+INNDtJ8eusHbbIbUtBfQuLeQ==
X-Gm-Gg: AR+sD13hxJWH6B87lZg9TG+Q8Fbd0u5bkGQ3fyseqSKjYTAg7uGX14MmTN1hyFHRFXd
	sCibfaJvbluiYHeLIJTGixv0DACX6C1Tyj45Y23GIvmsLLO4wVC2ket5t1GHGwH2F4vGNGZ8HaD
	tIvU7TD8ABmsq/pMZ2JLM3jGC1vxJPaQStzu8y09HikdGdOLGkQdvp5LHwV3i/yi5BlSj9rL0bF
	gsRDbwWo5N0KCVfHN4cLDQYUNnWszExJ76J7N/OjJXRKrBzJZoU4qxC+A2oXw8PuP8XmRDUaoY6
	JgpB/a2U14LfCIuOKq32Jd9kV7nqdqXFBQPSkqva6Av0TW1U23dkuZgokkcshe81DDekghpxoMh
	pprPeHwN1hrOBsXq0DJjUGAMOKW59cHrskEBM2cOzL1LA9FDdPdVrU0WmHlccZu1ZAXb32G7jgR
	FNH8z7NyA2+tUmh2v8ZBuZe6VEn6jxX9SaOCz1LK18IvERITnNdtsoDgLQR1B3XJzSDfEKrj6O1
	Q56QBPN7+xd5Jivh5qCcXgBWgoymNIzdyD2j45EUSvIv2lwbqt+0e87xW3aXnjKZ8FeacZRRV9N
	Hcc+DWHpzztr3BR56b3ucxMWhRSF8+kTgYdPSg==
X-Received: by 2002:ac8:5916:0:b0:50d:e471:2d1e with SMTP id d75a77b69052e-52df5a7e229mr226286061cf.35.1787528739209;
        Sun, 23 Aug 2026 16:45:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099baf17sm36510031cf.12.2026.08.23.16.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:45:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
Date: Sun, 23 Aug 2026 16:45:35 -0700
Message-ID: <20260823234535.72052-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDHCI node references the 3.3V regulator through a bare "vmmc"
property, which is not part of the mmc controller DT binding; the
correct property is "vmmc-supply".

Fixes: aecc313490ae ("ARM: dts: mvebu: add support for SolidRun Clearfog GTR")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 48b09df53c60..3262b726a1c7 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -235,7 +235,7 @@ mmc@d8000 {
 				pinctrl-0 = <&cf_gtr_sdhci_pins>;
 				pinctrl-names = "default";
 				status = "okay";
-				vmmc = <&reg_3p3v>;
+				vmmc-supply = <&reg_3p3v>;
 				wp-inverted;
 			};
 
-- 
2.55.0


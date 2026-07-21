Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227A2505AA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640878; cv=none; b=P67Xs5FV8yo/TZI7kq67t4r2FXLFXpmCqPip7gacPUm/20EbuuhOFIy+TQ9akMqenRQAXt1oc0YKGXt/j8GN5Ktfa1ZWYtA4VtfyXk5460MXDLvevyGkktRNIPVW1xnlwm0/TTAjQs6uYbXW29V/mb+WJ4PERmETexlrLmyDurQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640878; c=relaxed/simple;
	bh=57ODJ0Ol1CCq1+bCYqvjBxGU8UYCuFNA0aJqLtZ/bQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dx+dLDSlmfFrUwyFW1VNPa3xr2Bvz+SF5RXNxFYZPGyC98czrJmXyh0foPqkpLif3rf6g6mONsLx8IfKdbynO+uE7UdSHABsYxEtCf+tQZG4Gl/mtsuCTxCJjFpABlX8daGwBeLhjmY5Cf5Ax8IJ79bLj3pyoGrLv56awi8gW4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTekraoI; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTekraoI"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9725084c547so3454845241.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640876; x=1785245676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U33s9q0SrsoXg6oom9RrhMBLEezVP00e66OiL4kp8fE=;
        b=NTekraoItXfazoa/VMZLaCY2p4/w3x8vj45bCB3jvwbov1jaopWhinSv7sRwsoJjcO
         SLiEZK7fjK1i7jV+4xaeHKW1S5BR75SYMHiAGaQy/G6dE2QSZT5fx8zv7brsfC7Ep1Bi
         5WPFW7xZLxOzsZ62y1xy7TB0AzNre6J26aoExC0smSAaVRuz6XNqQoDu06WTe+iL/uGA
         JWtHuhn42I4hDgvq+6Uu5Fm7I5vbF7Qrz2tVdYnPqyMbcod1E82ZaFoH83AXHPbUnZ0C
         NdC8oXtYIDkkp8BrAmbhejlcLm8lU6pD8CVaIFlm/F2fxi1+kPD42C4lxr46EjpyAua+
         /28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640876; x=1785245676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U33s9q0SrsoXg6oom9RrhMBLEezVP00e66OiL4kp8fE=;
        b=i5BNKPA2UQ9RYZXKMSmPnoILFj4lYSyutjt965fBYp5YPjYQ1ieHrK2em3/v79pjBR
         062puJ3VdHTxo8x6Coe/kU++eXTZ5lOCr8DiTIfMby20qFtjhxZouKUEx3JRtI6RtvOC
         nSU3GT6qediCcqYWqmCjUWPwkPLCkKpiJGHURZNn8sCmNFLkIB6xyr0RyQnT2rtieb67
         3lNuON1IPi58KjfcwnLoVeh+fQt5gXOQXxLc4Ndu3qZzJB/cfSH1irtHQ06PIPomOCyZ
         N34y78sYenSVyoWpHw4uDT14OetinpQBnYvM8F3XEAuAFHwSrFyZpK5KFtASf9VQQWYf
         YF9A==
X-Forwarded-Encrypted: i=1; AHgh+RpcHzlTs9A6vUerOb/x+TurgXKrCfvwrV66R4WE+yXdNbWuaw5sHkKDcz0b+kEOBn2ECv69fB+s6gca@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/U9TjDHHeAuGZsTcKWfHeDrYB3/cXizOIyGC+wpBSzV3fpTG
	PDthLDfDAxmaRJSc6ZPZTlDcLtabUc8HzdqA7I4NOFCf+g7s3fycOW96cnrDvg==
X-Gm-Gg: AR+sD10d/c7LWtwtM4kmszPad7M9OUoIxGvqzYkPfr7rAKBlQxC3uyc+ARpYyYz0Zko
	m/YXd0SqF5jUShB2k9adZeks5hgdmFi0xnBHd5Wh+TfM/F1x50ea8KDfjF3ebXqNUW1ov5Ysb0S
	F+TKvv8KkP7GQ0X+1eH0diEABPCZkL0tJl2L7FxtMD7M122s3NWH6Qb9bdugVpUZdMOPYPS6t+0
	uY6yo0mQc5ijrrtBB5mw0wCAPWKn56ZDUtSEVEU7a9TW9kpWprP4Vx7co65xbXwSS8p+XgU/Q/T
	knTXklqgFG2bB8DT4LQBJjpx+QtCN4SJW+FY1QuUjy6mvUtn0je14LGQHTD3kNM/u4dKAOEP1V6
	ltioHhIfxRx+YXeDt8Oxy/xL8ytYRn1Nte1AooJ+SAwlHywUn0ZfWEX1lhZbvRaZ8iGK7pnH44z
	im0JdEPBTo4IJB4ULGD8+OuY6m5qpfcAxszr+G5ozmQkc06Ep5oQ==
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr5980734137.20.1784640876163;
        Tue, 21 Jul 2026 06:34:36 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757fad06csm11850066137.4.2026.07.21.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
Date: Tue, 21 Jul 2026 10:34:21 -0300
Message-ID: <20260721133421.44258-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to brcm,bcm4329-fmac.yaml, "brcm,bcm43455-fmac" needs the
"brcm,bcm4329-fmac" fallback.

Change it accordingly to fix the following dt-schema warning:

['brcm,bcm43455-fmac'] is too short

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
index 8453f06c261c..73c72eba72e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
@@ -369,7 +369,7 @@ &sdmmc1 {
 	status = "okay";
 
 	wifi@1 {
-		compatible = "brcm,bcm43455-fmac";
+		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
 		reg = <1>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


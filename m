Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6833F65EA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174914; cv=none; b=ckevY3l8ciPrTttJRONO37hTHWHAtzUFQd6q7LU0TqHvELsb94mItMmXi962MAeBrQvGqVjhy++zSkIVx8tYE3eVYzROT41e5QQgu4Bo4+pA9Z3N2G64XCIIRSVHwrp2paGuYw7fpm+Z0lY0vBQIU92iNjk1OUx2jEqJfghp1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174914; c=relaxed/simple;
	bh=REZwqB8VviTuZqvVXVncQX5MzSgxhwXFRh+sP+als6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMAg+dklX141EONQSLrhMtpcd8NxeS4t/+nJzIOKVvYfgv5LIVFSs+5i1D1zLsFoUmCFhsRoSHkjqmTPKc9D7eqy7EVo+MP8xc+897Hr0U2ZxFw6dEEI8rvR/YtXLIRLegHq+uS25oSl2VXhepcFreYMNrbchqMWoRmQeTBDOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjeJ+/ks; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjeJ+/ks"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfff5f88dbso11049985ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174908; x=1785779708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldpUG3RjUj8mnzv+gkE4vA9SakuHuQZI5B3d0F4kgdI=;
        b=AjeJ+/ksB9Sle3EI/Gd+nZnOW9ieGQPWCfcSCuZVU+8sEU2HY2BSeCfx3J141mDPhl
         Ym0kHMlYLU+8e+IWwU5rYPUeUN19TwgFRr/W2PcQ+q5rXEoTGJ9kXhtl3PlRtO2pRBrQ
         M3vpPVQMmFAHIbEETHQWMSmUu5ZRcaAf48ZLuYbj2aBL4+kGw6ocuyVSIcF8wpo+V4VD
         aAVrhVQkryjXWUiGzB+/81zjQ4YQKlc+hakt18hqVad0kDTHOnehFOaaGqR7klwNomSw
         g/9wLdHtHEgcGa60Hbpqu6rpL8miucf7P+uRZYfpy/KqR+hnPhzEKBHz4YX/jHvp1jX3
         c+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174908; x=1785779708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldpUG3RjUj8mnzv+gkE4vA9SakuHuQZI5B3d0F4kgdI=;
        b=sTYMiFLwa+UQqFrHINK1rtXWTm7tzvZpEF4PaF63REMGvwTXcjWW0yXaTFXht5/orL
         Md4eZnopDzrdR18/02Bv9dOUfNL+2LMIbMP5ak2Es23datIIut3nHeWEJGQPXWwMoQk8
         cQ83ni+x4RuMoN9t4cuqya/cECjVsPKjbtyrI16Nv3OsnAwqcb7unQnREVBRzHDHhlOh
         RbZC3FME5kGoEqt/QxjVSaTuP83oy+fFGu1eAEjOnK2H/04WMTwc1vjlXtbbzmWMM06c
         ngfuK7CcFMl2Xnf5hv0kOyFeqgGpREANvjsFqwL6RP+wP84SPgfSZQCPWCiqLMKws1sn
         DIng==
X-Forwarded-Encrypted: i=1; AHgh+Rp2dLf/mi2lkvFr00+SYssaQwisKw4fPRNK0l2bga33GyoP/0QsiTsBT7DWo1UN+wS5fL/WIDeY50d8@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZpOmCkG+QeUJgd69qCaDD3eHSd+pc88W4enkmvzXOELvJfxy
	eBCAG9QqjhtD1tyPg1sBtDronwnF2+mOGOLqqQycSgR/sUrPPSPyu81f
X-Gm-Gg: AR+sD12CGaBb/qSErhaYtax9yJs8Geel1WPHAzkrU/5qZ2gjg5XPr0JzLmJpTz4jiOM
	d+25u/Za+6rfHaN8/lkNdiwPI5eDEK8YQ+5sr5yP31cNlXeCZ1mk0rEqJcqEM+0ne9H8Y3mOiCx
	vjTWIwdymM3VLigfhy/zd0XL6i4uNQSag31tmJ4WaJ+juO50pYkFlV9BKMQOvqYotnVkXS0ay9z
	BzwOcvtYJBxgljzWPLiq4qK4hxyjgQN0jorDi//v6aqt+fuo4WsYiPP4KyRatyO/ArvXE0bfCfC
	QmaUpPwQY6xAa7nUuCACXaH1M3rRsZFu5DgBq3TqvmwoawUVhEuGCzQWGzH/GSefWdazR9CMOZB
	xqb5LS9vLLdiln/Hzl9lHwdBXIW81MeuQ8Ggk51tEQuuL8YNWJlGEd2HEMIAsoxRqmaRQVzvICA
	rXdhVHO1L9ed++ZxqPY3XAvIVeAXAa6t4CaxrLzHLQOvjNyCdC8aE=
X-Received: by 2002:a05:6a20:7288:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c6c7d8a1b4mr557496637.40.1785174908362;
        Mon, 27 Jul 2026 10:55:08 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:21e4:da15:d321:6b72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59434fsm34566612eec.24.2026.07.27.10.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:55:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
Date: Mon, 27 Jul 2026 14:55:02 -0300
Message-ID: <20260727175502.2585290-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The panel-simple schema only allows data-mapping overrides for panels
whose mapping is not fixed by their compatible. Consequently, the property
on the Ampire AM-1280800N3TZQW-T00H panel fails validation:

(ampire,am-1280800n3tzqw-t00h): False schema does not allow ['vesa-24']

The panel descriptor already selects 8 bits per color and
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. The DRM OF helpers translate
"vesa-24" to that exact bus format, and panel-simple falls back to the
descriptor's format when the property is absent. Removing the property
therefore has no functional effect.

Drop the redundant property to satisfy the binding.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
index 47aa30505a42..aa636ce45e3a 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
@@ -28,7 +28,6 @@ panel {
 		compatible = "ampire,am-1280800n3tzqw-t00h";
 		backlight = <&backlight>;
 		power-supply = <&vcc3v3_lcd>;
-		data-mapping = "vesa-24";
 
 		port {
 			panel_in_lvds: endpoint {
-- 
2.43.0


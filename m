Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43DB48B379
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130747; cv=none; b=AanEUgHFVOvGwdB7aGgfVFozulpJ4aoiELt7KYlg1xSJpGLa436RY/x0mVdqJaYMMj3UEkkGLsAIn8X2e6yIXcONMBc44w6W/AV9VXvgCYyyEZdfnxMAXmjV5Idx13nddO+B55hLdvvGIfPbkblqRZjPSHcZuSb4nvy3MbZ2xNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130747; c=relaxed/simple;
	bh=48Dr6toFQewmMurjdimp0gH85wq3gmjl3g1VH01g5Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJ6oQ1KO3FfjhB5zq0MToRaQg9dg6cFICT/CKxXEMnpr5YeVaI1eTw5uZ/XqM/CI9UOm/2RKPng5gTeQhDhXwAYOXmyMhw3nFG+pjXJa0vJPciRQ2zyYipw7ION2rQBL5SJAj85YWKhTTIlsi1nLJYbxEwwSHU8IMJQIE8SBUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=YzJVVpG+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="YzJVVpG+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1627181f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784130743; x=1784735543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xraGPgOgTRCSl61+fc0AYOBRqBBUeEnaLroeU6Dcj3Y=;
        b=YzJVVpG+vZEG6mtopuEWeNzTI611Tmvh3feupn0LxtOzdcGPir62hSV1szDQQOHcc2
         H4OdfppGlhXzZApqQoG4rHJuzgS/ObPBbMER/2CkT5t6SNpMpk+i7AB2EF/xg0Rm8f32
         yXs6HqqXUbSuJHg7D7qdX0A+76tg2DgPTotNYUKqky5knIiSbtRj1jBbTZXMgF3nStTA
         i7ULhanTYEN47auqWZV7qfSRbyvwOkBRVWvXlJWWOSabqw3+6TY/QWckuYwJYLL7+EQV
         KKqVaKc5lf/1mi0ps5rs9kTaavodJB2J1Z9D0D4gfGs2IfO+2pZjUej+i3RenV8PvR3G
         fsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130743; x=1784735543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xraGPgOgTRCSl61+fc0AYOBRqBBUeEnaLroeU6Dcj3Y=;
        b=k8y6/g8hRrTKhWjZrpifVXLcNnkETTzfJFYvKDK4oF+JXP/Ib52HCBQZWzOuEAc32i
         B1BXJDa6qJEnOy4fcPUo79Rlk/8WFVHPh7cbIwUej5F865hFFx0y3Jxhx11pRznol5tL
         UGc59YX3tk2MAfnRQBj3CPKwRd1NdhigVKFf1rK4voM74HFOzoimyBtE47hVA4OhcZmT
         2hUdVo15TygmYZ81NTkhMBcgz4OQ71fSsjiLnZrYUp4xiWHeEZOwiu7otAavKSVk4JnO
         /blpAJA6ouMJ4sa1iJyn+icTGcy3dJBtL6euqvPI6i5xz7vOlkh19btLDyOx4y+AOCip
         CNGA==
X-Forwarded-Encrypted: i=1; AHgh+RomFszymTyhZciU8wKlBnX1E8yAzaceBr/XkPGuoOh1a3Ibp122c9H3c4xYUFx+CFXtlx+4Fbox2NeR@vger.kernel.org
X-Gm-Message-State: AOJu0YxshvIsPi/P3Gb3w94/ygCfsUC62le1BRymg8oy0Fi8cz4OqVdt
	xdzxw/I/IdUycjKnBstcprhDBhoPTCyg+VwzBN4ME7tijT8+pBgxGu0xxY1AFB4Aqv0=
X-Gm-Gg: AfdE7clJhAGmnv8JrA126cwEsPlaS1CH4prc+mM2uo8CmMrrwuTSxdXUu1JMhKlbLnR
	BGxv2QBMn2hRvxMyAZj2HKlmrcLgZ+w0dIn1zfSPhGbJNMB68EbsgMLfnnXeUX5CITjQd3kUZ+R
	xhWzzfIGlTA0r3Y33ho3FWA4BMU4wSC2nRSWrncRq0mm2wqOtvfNpHbtLwjjdcWezw1OtvMects
	qUfDDyWGVEk/Jl0EFjpcS6KLaSRgduu4dr4/XqrIcaMBLfPSGgDVFrEOTP+QTFufsW9SdhFKx3M
	Yyk+qXGB5K5UMuR7Bg31pTEZoXp2nhtYbgl3k9we9Ck/CSIOPv9GlnXsE5xaeJV50AGzuw7YvU3
	0iRVWldecs/ybB1lXRTwZmsNB1KU0eltIgDRCe4V8SgQPXVjbf0FNZ4IJ5aJiSeQTTxNs8DHc1b
	z6605DwxmV74n5ifH/xTqYP58/PueKr+mJj4Tc
X-Received: by 2002:a5d:64ef:0:b0:475:f0d1:eb5a with SMTP id ffacd0b85a97d-47f2dd132e0mr22351872f8f.53.1784130742740;
        Wed, 15 Jul 2026 08:52:22 -0700 (PDT)
Received: from vkrawiec.lan ([2001:861:2128:c8c0:8e98:aced:6862:3133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e5c3sm16621663f8f.1.2026.07.15.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:52:22 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH 3/4] arm64: dts: rockchip: rk3399-hugsun-x99: Update SYR828 regulator initial mode to use device tree bindings constants
Date: Wed, 15 Jul 2026 17:51:40 +0200
Message-ID: <20260715155141.128601-4-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715155141.128601-1-victor.krawiec@arturia.com>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
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
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..6d9ca6e7325b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -3,6 +3,7 @@
 #include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/silergy,syr82x.h>
 #include "rk3399.dtsi"
 
 / {
@@ -237,7 +238,7 @@ vdd_gpu: syr828@41 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vcc_sys>;
-		regulator-initial-mode = <1>;
+		regulator-initial-mode = <SYR82X_REGULATOR_MODE_FORCE_PWM>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
-- 
2.43.0


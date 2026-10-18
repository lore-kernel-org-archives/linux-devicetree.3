Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6C2E8DE3
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326772; cv=none; b=mZMZ4It6YjEuB19H4HGIGaQ8IDLrlt1uUWCmEqHPL/LPd1RjvI0+gBX22nKq4HT2yWxr8Zf4FYOYM3sWs77VL+UnwM890w0qU8yKkKffIx8GU0CKL6MYXM1Pu0WuPn7PWVksV3cku7PmvsvtVdAJnAN7cALx1Wk1r21ZVHTSJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326772; c=relaxed/simple;
	bh=kTz07uCPd3IIAU2tuW29eA2AVOLw4tb4lfqCUC95pLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6t3vX8TX7ZvQt1tDx3Ynu2w0J5Bltu50vlG9+kIWJTYHf/V2viqqD00XONxGunQnhq2RweVPG1AITgP4ORh+Enn14WBGLTc4x8AEdOC13DF0uHuPDRoSHPKMTz+Cbs82C3FGionFdYKGopirDLla9G/oDOmtoh800VjmUeyFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIzZjE0H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIzZjE0H"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so2660555e9.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326767; x=1792931567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=JIzZjE0He2Cskos8ENN1d9+3AAU7YsJU88+GdoVg3IeOvPu8VyKbYLUKOiMDCBaquT
         yFTb4iWGmI4HBsqiiZswBQqpnp38R5i8FpGzjaap9X69u+734+xp4t9EEEXClea5DCef
         IZQHQ8dptpgQ+2v2Hnyv+VPle5DbhBPWOPXYZt83oI/p+FGJPP3y/0gmLQ8lwikdN/Kv
         uFp9WXGiD7ilOVe7EeVth2z99qReaLCTMbW2hY4Biswc7PFgsOeFEi5wvDkr4kZRpSUk
         +qhCS+Qm46frt84XMtCnL/RnhDFR9orJx+zqy3yB7e7fMtxcZU4CsOQv6YgO7AkvETlK
         fNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326767; x=1792931567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=OASqbA5trXpIxs8s1CvvC6/LTurAYG6HUVPstPVzHKBTpiiLYt/PX7DOG2j0JotebD
         Sy/BJ4/Kj0rs6ZdF9d9/Z6a7f18zlgAiyGRc2Zr8XrvTjUisniJp24K6+B8j7mfknykb
         cYhHg4UVZXECfVf96WIrOn8/gGH55WwB6XjaXnD80I0fru/iYjhiCKoBZqrT0/oYX67R
         4cmT3LcNTZo+QtgA7yVI8TntR4E7DkeoyCLbtSNj7UmUlAvwi8OLbzzWqRpRMdjeA83r
         cISACUN0Gvijrlke+DUPW4jaVOGj2S1b9sxWBEF2j+NOnoKG0XcnrUXpGll1Wy7Dvkbp
         980A==
X-Forwarded-Encrypted: i=1; AKwUvBzccufjAQtEaxRurAeS0/Y5AbOjj6j7AQAAzIrg3ICPywcnwpcA017gOsZKYMFVTIjszuk0rBum68IX@vger.kernel.org
X-Gm-Message-State: AFq9FYLwbYnlPYDALidl25f0mHuG+qNkif+lydJNewwbweIa/OuBX0pI
	AC5ebFKzz/g9EKjR8B/bp9oOFMRVJKbeO8VcyuakzYsjEv0+xfigW4KJDFgFMA==
X-Gm-Gg: AYBFou0twZmrb9VZEnCn3DpWgKo3G8eJWkkwWbpsUb3CxxhwRIEbgflMpBgFbItV3ah
	frzoY5y4sd1LB5RbLa57xzDW6c5rWJwfhOy3cICxaopSIG9bwaWtl1l2eVtzT0NL6twtmh/Ah6p
	Or/dfX+i37S2YkLwlnTf0RV2Toh5aPOUAREigVHYuNcqbgZreslNlA0D1Uycw+VpryPxjrdjSp4
	rQId6IQsIbFrfubqKfhl6KszGSAyuztbIRLKuuK/iXEYa7bSCZPpSwVJoZY8ea5okmSrp/EzVYd
	EIW+YdGbPhSZfToTUtOf6P6P15bF7AlB/be2YuITSlUxhYp4MM4AG+2Gj7+9QPN4zEX/sBJDfoG
	yHHLn5TFcAnXsl9YhF699BlRUHx3seeY9qneRtrsG4FZwqesy1nBlAzTsGmLnM+GOwj+XR2C6hf
	q96prsj/3F/VPZwv+1IA92/B09xB0tbJNaOXltL/ITR6zfNObxwa2KlQzLkG09QcAOnlASyOeYP
	0NZyL5wg4de1lh0cmpIThWhX1pd1lwh0shvoebA7AU/ISzF8uxBvUCrmdiAMckIl3q1VpyvBgOa
	InrPTlErbnoppCQOgJLi4RU=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr103844675e9.34.1792326766510;
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/4] arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:24 +0200
Message-ID: <f591f8cde74ef4b3bd0e2fcc2108b8564b195e90.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
index b30a0d8a81ba..a90a784f1966 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
@@ -89,8 +89,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77049469859
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234493; cv=none; b=tVt0Uv/1Q4jkXSDHLmw4zlxXmTUZkok69MgWqnvlAM/lUztTsZ6XepAeHC1/5b4WTjGVn+lnPXamJKX0uH4nRLHTu7YkrYJhUb/cyrWrKWM3M891a1GNVgWnqlecH89KgzA9HmmONRt4XRtVV/vhdpZTQlPMgZSt3d36sbdAH8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234493; c=relaxed/simple;
	bh=bGK8ht4ZsYBRwxHCHXvcjD3xAuJ63yHglUCiy5arzTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jY1ckDh8CCvpj/oogmUTwHMlAoSvh52pafHOhyZM/rpQCbzDOppYmIhTGhvXnF8mJyNqxszk9l9F4+p91K1P73n8fSv77CoQ7wBJALDAaV9C1ThPDZ+DfItLOQiqGdEEigycYKaUCqzQb9AHhQoKZbaIsFL9VmQ+Ugg9vAaukLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIKgatz5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIKgatz5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49978908b35so16433405e9.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234488; x=1787839288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=LIKgatz51D/Xf9KJbE7iKDpvP5pN9xGk3CO7+FVnMhRZm/4X9svVSa24jHbIJMzZvK
         RHySGfJO96z/VC2O/xEl1fM7ztrhg6+3jmCjQJDVpEHTufq3k3HjWvVxL5GimFcjnw8B
         QPRd7xdwsdxADh+A8p5DMYk1X5P9WkY5OsgIBzwkv7pA/SOJGHoxLTQNNl3S862dHBob
         NxP2YHjRVDQbDzGhLXXhFge4jiVa1rUaWyyPQlyplaKzGfjfM+1+E+L7pmuRkjsIl7ih
         TXxrJ//aVR/ixrIqnHtrT5faB/YHyQY45QHU7oV9zGFi6h6jzqCUIYuXV5m4PDNbxvg1
         gqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234488; x=1787839288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=ThoW/yHauMpdJDB00sY4teiefcv8yx9ZH0hgkQcANIWNmOfbkGosurcPghyrfPQsPZ
         cVnQgL+zp0zQs7trNnAMD2Y5bQp6CGJuD91H0GIcK+c6Gixv+vG4heOz+eFnPLUwC1Uk
         NKKwcydFc9UZr7TSpQFIiW68IHjLfuy0XkjC2MFioZsZ0KyOvd69+ezdHX/9QqIfcEcw
         GVkxlD+r76Wwm728T3HYliAClnm1bc3+Cwb9DeoSgvTXMtq/4KcBCQ25oHPviV4YC60+
         tZfAw2A6k49dwTJqQQzzRUu8LEV2r9ls5R3KesFqU6NI3TQ6XjvbgWDkVJb0YSM1V7qm
         AInA==
X-Forwarded-Encrypted: i=1; AHgh+RpAQNz9tzig1aG8Pi6l1wZqYZmcUIyO/b+pOg/9vSuMak28LoHmqOa2Hi0aHTN30oV9oBfWDhkLFedp@vger.kernel.org
X-Gm-Message-State: AOJu0YzlilCzcolwbBn/9O1nd7eS4iGkFPublLkMZ5T5+cF1LVhvD1Go
	RnqBL/NwmOZsIFzzNb2EF3KVbviqEirzO0AQ7NH+pxck5c1NL5pONgiJ
X-Gm-Gg: AR+sD10tEOvr3sRNMzcd6u2X1d2GAvEw6bedmctsrSsKAKZCc6qeUB21HiRL88mNfbL
	rHuV1Gmwwl/Xg8vF9etIyVhKro4B4TogN/BIoAVeDEwWGoc7O5Gd5XQpm0IfYi1pEEv9wHpjwTG
	+YH/z5c9odKSWBJ4LsEzAc8gnbAe0IM2wtjQHy8md1Z5ZsUcyM7jm20+NWoRYl510pL1SAQdYBP
	D8QbcExj+U6V50aYfodHREROVj7YcKGk6a+hp1ZLQuKaAwO9wDZPntYsFP6pJ3ji3upJjLKKok+
	8JOwWwTs2t4ZlMsEE64ArAQHgKzji4075tjnaCzRzvzOvkmuQ0ToEMNCywtW4Ic0luvpF4akHzO
	jDVqAxBOhL/Crq7Fe+yp6gh8Geutas+zQSNKNWB9S3Vc3U/YTbc2DvIrr042+TovIVJ0c9d+NT7
	oCqWdD0PEwuIi6J+Rs14U2+M85r1gQWhaHfWEzKXLc+DxRwPbyNzcvgXzoBPo+D6dznYB4qPGMe
	Y3CI/yBS0p11MvPlI63f92y2ErutJXpMJKcynsOQqzfXLVGS+tPxPXucA==
X-Received: by 2002:a05:600c:190d:b0:499:873b:471c with SMTP id 5b1f17b1804b1-499aa1738e7mr212033545e9.6.1787234487497;
        Thu, 20 Aug 2026 07:01:27 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:27 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:11 +0200
Subject: [PATCH 4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-4-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=2044;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bGK8ht4ZsYBRwxHCHXvcjD3xAuJ63yHglUCiy5arzTU=;
 b=44XQHZryO6sGy33sUIcTlfpaikDf14UiSkCAI8QjIux3seiY5mPvwK9CfmRjJ91dTLd2ARq2C
 DFtOzYij4uWB57MbraTHamPWVk21d/zyK7wnc1Wjdlg9Xw97C2nmNO+
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..b7a527614243 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -973,11 +973,21 @@ sdgmac_grf: syscon@26038000 {
 			reg = <0x0 0x26038000 0x0 0x1000>;
 		};
 
+		csidphy0_grf: syscon@2603a000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2603a000 0x0 0x2000>;
+		};
+
 		ioc_grf: syscon@26040000 {
 			compatible = "rockchip,rk3576-ioc-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26040000 0x0 0xc000>;
 		};
 
+		csidphy1_grf: syscon@2604c000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2604c000 0x0 0x2000>;
+		};
+
 		cru: clock-controller@27200000 {
 			compatible = "rockchip,rk3576-cru";
 			reg = <0x0 0x27200000 0x0 0x50000>;
@@ -2848,6 +2858,30 @@ hdptxphy: hdmiphy@2b000000 {
 			status = "disabled";
 		};
 
+		csi_dphy0: phy@2b030000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b030000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIPHY>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy0_grf>;
+			status = "disabled";
+		};
+
+		csi_dphy1: phy@2b070000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b070000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY1>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIDPHY1>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;

-- 
2.43.0


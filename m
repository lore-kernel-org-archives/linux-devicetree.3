Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432A3BFE5C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141042; cv=none; b=fEI3WZqZklVVRoj+aSAH5XN9do067kFcd0FOdCWw+VqLIQG34TjaUuuExZcnLH3RV4+LB6GtptcLghQIjn83abCRXxpjLdQUVEQYNz5lNwbd5/+2znHlgyxG2MWFl5iov34K5+Ez3dXKp7rnEd/CebawvwmCNdgKfluKdiC2FqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141042; c=relaxed/simple;
	bh=4OavUBeyGqaDIQHOgA/IhtahRkKYw5WBMKHlgGZGkLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqJoXKsjysfll1h/UlZ8fRC3jlGMNPlk9KaPYZia+UJFJ0oSgCsMnlniOKVqnOv5hjPKLOGPaiCu92RGAOW9PUioqG7FtyZ+C2UciEp9Gqg+PxieLo+LfcDTRripVB4b5kitXgqNgSu/XRZeV2GOeN4ho2mABOMzhLM7y5bXHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjoNAwOB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjoNAwOB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so4019505ad.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141037; x=1792745837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=;
        b=FjoNAwOB7lPUcHG6vLkHgkswEQawzgQ5YdIjnPfDFSud8SqMtUuyhboxFmR5m6AWd1
         DV0mYvt9Rk/Ym0DvfhU/k7sVN4V0LIYTctRjh5Z2MoIyY9nCMsIxwo1IXcpStcZDkceQ
         eVLznCKc1RMWtIrKAryyMqew4tO6YNCEWPVBEqwF3R8jqMIMbcgJtNSdIXX/wc3ksPeV
         OjbKQhDk6zZdkUhCC+RsXMZnXFZnFdBn9K0r6ZtShQqXaNkSDLBi0Wxji6mKVU7FX26y
         XUzNRxPvex7TOky/ZV3IKRbUf1HKgDudsIxhv9Ak2WQyeO7UqWYXVtjSEWyV5oJmncjg
         7R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141037; x=1792745837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=;
        b=HF+WdZ5yxNuwDW/2EVfwX2L4Re8HJO0rfBKXqPqcsz3vBi+8xAm+SDUMOK2aA6QcKo
         gDEArvvB/LbLiUGVwjMHDp7PJyZXxqjtSZ+yb7Ca2C5F2yWLWMMkWgU87wnUbbJL9HEU
         sllvKpIGKwCUE9bluUsSsW2b2sFqLuZJ8hhDIDH/CEFP5D7Bi+4rg536TBTx4kwcjVj+
         aTjWqUEdPGiwaKgkNsDgoHNhDNF82wy2QQ6qwytld8cILmQvGURnkw9jYkc+Y3m9tc05
         eiholwma8Y9aJUMViKrGW/wYlygBfHoYEaNNLEDmTuALHeNGM6oX+sHx84s4G0dAshYD
         UeSg==
X-Forwarded-Encrypted: i=1; AKwUvBxO/W5/D2q5mPImKGmWspAx6GV++3jso0x5vWLDTrH1XRipL2S+pMeTEAF2XAIcaAxrQKOWiXKN6Men@vger.kernel.org
X-Gm-Message-State: AFq9FYIWbDqL68qijyIBWUNeBFbdX/cuqIkCpfl3F5eXqH2G88LGmypz
	QOdNLSG9BbQ5rk+7HdavcsYdDgOKCnnLZ94tFbFMttJtGNbNNQE2btau
X-Gm-Gg: AYBFou0pPPyyAgmEQRZKk5vnt/q61PzuHLDoU5E57AldCYtqj7GjYRsIFmiBVwyWHSy
	oGyTrH5B5LND3sXKMih/HJITwOakBUYyvrBjBdID1kh5ZUSgJoYlqquJaN+49iOGfXYmeTlS6mg
	N/yA2WKsKPgvN8wsZ6s2dif1ngI8SJ37uZ39xHZuPbBhpva8yB+z62ePADknGjdBofvo7zIBt5a
	eN7AEivaDl0EPRnZGwe4CP6X0kmLL3J3yhXGlsOT1pCHAYUvVLjPstTm7QI0pW2uX9eh2Fwsnb0
	Zc6JncjPT/WeIm/jpqijsNgfTVUUionnNG44BvP34dd9p4MyjZM2Kzxy6QVFG6/rU0bGozKMM+w
	jkYH6cBmMDKDE+Y88H6pJAWqUQ2RBGUzzACIYQC7CbNOwFAIvSzXRy042ROxU7KzItGa4kAyaSC
	tWoheZY7PHzjzbXQvJjwRtCVEcS4JDb7tlMqCzm8FqrNDD3hIF3bwp97QglOGtTPSlNsbxGkJ0q
	TesbiyfpMTr0nsYxn8vurgl2owwwQ==
X-Received: by 2002:a17:903:2407:b0:2e9:53b1:a3c8 with SMTP id d9443c01a7336-2e953b1a559mr91141175ad.0.1792141036442;
        Fri, 16 Oct 2026 01:57:16 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:15 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:41 +0800
Subject: [PATCH v5 7/8] arm64: dts: rockchip: use two phy cells for the
 rk3588 mipi dcphys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-7-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=1777;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4OavUBeyGqaDIQHOgA/IhtahRkKYw5WBMKHlgGZGkLg=;
 b=v4sInDUQ/7XkIMzK26fj1mNhWedwz2y1jAeJhVW/owd/Y+g6H8l/hQlvpgno7POd/zFYYL10J
 lVky0MG/7a6BXkIlwekLASsH7MOoF5G3njxjIvRURKOz+XEH0L9NH+L
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The MIPI DC-PHY binding takes a second cell that selects the transmitter
or the receiver. Switch mipidcphy0 and mipidcphy1 to two cells and let
dsi0 and dsi1 select the transmitter.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..94d68fd89753 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1788,7 +1788,7 @@ dsi0: dsi@fde20000 {
 		resets = <&cru SRST_P_DSIHOST0>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -1816,7 +1816,7 @@ dsi1: dsi@fde30000 {
 		resets = <&cru SRST_P_DSIHOST1>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy1 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -3429,7 +3429,7 @@ mipidcphy0: phy@feda0000 {
 			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY0>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
@@ -3445,7 +3445,7 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 

-- 
2.43.0


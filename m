Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2B3CB2D0
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788518; cv=none; b=U9tKEOoyi9DPe2FtvEqlPUuiSoa0tG+3/XY6CqsDDOI+aTe1zx/E19qidg8kyNhHe2/hjVhkeTDzsIhImL1nUUiRD3DggIqQCUPRzz1PB/YZrSE3zhqnRnsNGd22z/wjiXjckLdf/ROYbB6C3WxGiPIZ3az+8kiCZl72n0LIcZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788518; c=relaxed/simple;
	bh=8gu660Q0u7C0W8t7xo2+vLeynZsPh27OtCchUb5pAFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2ONHMTDljJiigQ2IK6ROaSVUN60SdPPPYp+EZ9cDVmCipDaHypugL2kHzs+ggjPn0PHcZ/HM3N7apj27TTGCBeNFyFtl6GHhMB7vRqUqe/vP5eYQQrslq7J7ShYvza6Z//CYu53Zb1DbSorHmsVqUqrEq+f3E+ILgZcBD7h78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJZXCd52; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJZXCd52"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f75f7172so9078965e9.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788514; x=1784393314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=ZJZXCd526PBGcsE275x8ElVB5+6uBnUiTv3kfpyHPiijdrzPAx48m6xnrLoysjOu8B
         CP35OhHD4nHawYQ2f1pBtMWeO99FknQCV8GUERmnQQZ1xqPSp7A8ijJ6MZXIK4KdeS2d
         kWwSEc4kOwG2x9cS4SO20/YWls86G2DOY5BqRgB3ERlDCcSd0St2dA4JnpZA0eaucKor
         NzSL1othtzt2aPKwKhVChHHy/4josABg1EAfSmVTKxDoDx/QvF5GZLqTpIkmon6Hsp8L
         Td9BhysOGZ3PL2Ikr2Rb3YGoozgbokUWpY83R1PvvYCHl8f9GjzmJYkUlTPzRYq8HpcQ
         L5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788514; x=1784393314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=PlOR6lGueoIKZaC91O5aSAp/UywJMsTVOGrjASDengf49ZNIuOpDY/orDzVEN7YyGJ
         sA9WhFe9mHOeZr0RBnWzB4Q48WcHlziUW6cd+PtM4zoy7Wgdj5XuLgh1tiJwbwCPJbZd
         dFeAw+S+9EGCT0YAJxBHmmts4VB59FYdlvogm/mIhuNEhJrYdXIW2zyoSr7hk04VFjCo
         MP3dPOObJGUfs9w4oPK97gs+UqBfLE7LplktHp0KZA5yy3RKufJYssELTVfjW0dtEdbp
         x/kZ1d1MKuHvIsgkr/TZPc0UUI1eaP/xPW+dJbRlBIbDJuTT2WugYcLfn80ueaOLgm6y
         dJXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEl9679FiELlxhQFb9WOUHZKPWapOvVWlldy99tpvPcpy37057gEMsaFO02ibJrmNygeigprBlDdPP@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXqF5rLa8m7pLzwvka8xStDYdRc62tFHHipF3vW3ki14nEp9N
	P72uqE9VAC9Fb2a3sY9WTv39i55UfNs3/YDiBf1E8pUSkEhOfJ1mSWQJ
X-Gm-Gg: AfdE7cnl8bIK00Z1h4ykuBbVYwSv8/2WkfoLBtVcGbzAIOdNl3plcjok4XJBb3K3P16
	1YtuEHUr0Q4vegti6Cg/hYkVt3mSEwSG9ME+rpLBtqHdETcHDqIzSOs5PdZtoEycCbTTwg5+zrZ
	Twh4cgLKKScnGzyyjkA9ZU3v36XIzQ2uKl35MRyIcpyfh8mOhwfzjQtnQ27habNCeel4u3E5SqX
	WknbvtI7Mtx21atNKdeY7zNBCV7mUR0Aorr2GqBzktlrAj8+/pfCIz9lau3s6lbDBcwSJhe54Dc
	TC8u/m59R5YJvM1Hfr0GDRRm870JZtorKzQPHCBelXSGeOnL0RYa2y0J+YUmHrEhIRB0PANCTAZ
	oaAb5IwcHngTlHpnwjpG9I8RiPkqPJLL2GvZCpMZ4isd4g3T2oEVObOssioVv/8f+Wtj9Edcmne
	B3Jfygtd7P3uangqpmWxxavWwmurFhlutsocp1HhaX4qEF
X-Received: by 2002:a05:600c:19c7:b0:493:fa7d:56a0 with SMTP id 5b1f17b1804b1-493fa7d589cmr22554885e9.13.1783788514279;
        Sat, 11 Jul 2026 09:48:34 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:33 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v4 5/6] ARM: dts: ti: cpcap-mapphone: add charger detection interrupt for CPCAP USB PHY
Date: Sat, 11 Jul 2026 19:47:53 +0300
Message-Id: <20260711164754.185565-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5


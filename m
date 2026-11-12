Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474898;
	b=Yvw2zkT1wlyHDrU1R9B3X40W6B4LC4gRzrs52/VB+nCjsk55ju/CwkaHX5Q28FC2XI/u
	 RBKtD3zVcChRQMRvR9iK1Zqt4xq0NgyuQv4B8yHhrFSu3dCPHbhOnK3MBhO36R6djwBa9
	 SXIn98Ij2fu60J2IEWBVYGSCk9UxwhJmnp3RZbnZIeaa2EbtHmtJ+nFtGW2zf1ZI/vWzR
	 IayrMap0j/VwLpNWM9wtGs8EmHwVKd69pYZoeUDZfRjGnGGEOuk3zSQB2gyAUFR7Y00N3
	 RYacHgcwvwyyAaPqJo3RshjA+7cNAH7r9xvluNWo6RlQgO0sUDag75ucBZ4UgcnAM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
	b=KCVGkkxVa+mq6NDO3X6aTPsgYP8t1nFOPhUcW7hkYsmfpLTnFvE4bgmXBsSy5QySUgho
	 wudsWsdUv19sZTs1muBoBTiwiYrSasM/ugdWHDT2m+V0BApkBCEvSTFhCSqD2fSXEXAeH
	 R7h/7FT9NfEkvao4LgnY+oL/KrxnDGmL/H0SHgrlu96wByLCWmOj0OR/8WXIFI9YqLgC5
	 TcV6Y5pUSj05X0qSivF9cdnyUOQlpr+Bs2yBgKMNA/wZhDiBiawt55DKeE86Dit0KoJeN
	 2e8FaCJSOsQOTPoTBiUub4B9/C0ZnaaLNZYRKJl2LgE2m2DACS2JwQphywxXY4vnBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DkmScuGE;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A3606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DkmScuGE
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b244fb7fffso5038710c88.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794474897; x=1795079697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
        b=DkmScuGE2S5W+J0x5xOGsHjzrmQcGkJEm2g+m0h+CavgHZx4UX/BruWSCdJ9BSx60b
         FmlWZ5FX+sYZCu6MsFeJbr+85tF+PAmL6gcLN15lICenKJC57YiePTzhgtmXZ5IQ8i5d
         nojV99O9BoRpeaC5qagbnN1pZh+62iOX6LCew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474897; x=1795079697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
        b=MSTwvvg/qqrqUmq1MWh9vXOffuHg2SVOzMno6S4AuKaYMOzFjtdYUj2FUoVT7vSGLr
         gcVQPVqMhO4wlSL2xqYte5TpPshnfhUlTd1DaPK/IIvobRF49sgkXmuzVv4zCbIA6eiz
         3KZMv3GsbzQSzW/Yc5WZ7/omLuK5enrDCP4fMXqzcjMP/Rinvzts6Jok1ujVJLdV4pJu
         uz/rU8MCySObME4sUsmEUnU9a2wQ8a35dqbu4TMOLlo9bTfol7xoY7zO7qHxaqdxp5Z1
         JPrXjMJwN2AOSmQpdFd7qR49aIggsPUn0omdjEGBu9MbdqFTHHRzicdgzpLRgG9idwQK
         XOzw==
X-Forwarded-Encrypted: i=1; AL+hErEoN7Go2RodXxg6DiUS6Utje9H0QBamBecqzqbtkyWUmWnHIjpwf+MMgFPOHhxpGXHhq2afwJz2sPJi@vger.kernel.org
X-Gm-Message-State: APuU4Z8F4ZQQUyS/WTUCGBLwwmNMBcRedtQaP1KnjU4kigaB+PE2Odks
	3r4biIU9JOi1zG6UT7//4z6/mtK8Z4bmUZEuai0tiNdv5orFMmkyqdUFE4lCQbkh6w==
X-Gm-Gg: AYBFou09mtojpp+z1B31POGJNJrEildHp0IBxM7S14lvZFfeJfWXlIkMdye66FLAy2h
	D51XB0jtnCQlI2RIPaGoCqhbn3RxO/PNpuw5nf/xVI5FjtuaHCBQKOyG5E/wQXcRth/sgwb13CG
	Wrmwwm3KFwISYcWNJreYpKyr1nLwXIMkuoX8my8yOfc5rPBLKICE4YXwzSSsja/uokPQfPzOykS
	sdivdJpqN7heiRAQMRcOtBYcsbniKVm0+hgUTdD6s1F46Xp0dDve0LZSrgD+ydFdlXL1PLD6a2n
	T6mqHCSRv8oUK+rhiXIOZL82erGLuptl2Pq7YhawuZuuz/DkKjU7eW4fLQiWO+qM5oQRTlDH5sq
	cXvPQ7H4Kd9mLgpNSAzwCtYlqUqrXh9oTCDeEc0z2LhKQI92VnEdsd9rQp8KtpSmGRz+bJ/s0TX
	8yYrMskRTuzmbobI1uA1niXT0aQKxHkbQEkx/lx0oOn/Toclu5188IJlCAI9YkXylY27DOUBp7/
	RV+FSN4fU+VPiYpPqYjUCDtRW0Y5Mk30kt7Zk4vvRumdTmF0x0ofu1CiRnNLaJtKH0+tP/TLWib
	Oqa9d5K1ZXZWSYuiZ9kteYvv3o2F6sQfqYscLyQV5mlQYkyLgLDNNUBQGHAD
X-Received: by 2002:a05:7023:d0d:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3c02f06b0mr4729658c88.15.1794474897295;
        Thu, 12 Nov 2026 01:14:57 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:3df7:8811:7670:7b44])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5b2eeffsm23794130c88.9.2026.11.12.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:14:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8390-grinn-genio-sbc: Fix PCIe pinmux node name
Date: Thu, 12 Nov 2026 17:14:46 +0800
Message-ID: <20261112091448.869620-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl bindings require that the pinmux node's name and the node
names of its children follow a certain pattern. The current names do
not, causing a DT validation error.

Fix up the names so that the validation passes.

Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 51f12328a1d6..7a31cf6f27db 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -228,8 +228,8 @@ pins {
 		};
 	};
 
-	pcie_pins_default: pcie-default {
-		mux {
+	pcie_pins_default: pcie-default-pins {
+		pins {
 			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
 				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
 				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;
-- 
2.56.0.567.gdb80ae8cd5-goog


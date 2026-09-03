Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EA36A364
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476374; cv=none; b=b5vT5XhvOZm/ULkoLYxd9zBcPDVfiEJMKxuJRkkNADu64NQ8oFwCcyemv/9DcQXU3G0cmzE/SusYofvWxUmkHHJOGv/tSfltBEulE5V6etD0YMFISMl0Wrqxj04SzcZ/GIMcuMe426ld2VIpx1OBo3E+2X/kdPAVexedgniTTag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476374; c=relaxed/simple;
	bh=5jGm6R10DrzDxLGqPcbj5OkHK+dKNQyDALZppEHj0fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpBWyv3aBkoaqyABk7krt52BR2IZ9Ff5Rrw9oha58cyQ7UvU7SMfT/VENEq0irBPt+yWc61IYuJ4FTEByEEk+cIuJwEWsNSIHZgz1p4O7vBlSqTWA4bn2I+QDsUiOYePeUvc6SRpGK2Ee6Snvh+9PdEARYVcGGF65dnabl67atI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e067e908so371861f8f.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476368; x=1789081168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhGerqxK/QM75//01MhplOsQVgwGpiUbFZaCJT3sfQs=;
        b=hcalNfwgszjxYPSn9VCjoIUJpx0qDQFjdlLa03T09oITRIrYZ3uvhC+tztD0b81yCV
         cv5FS71Ic5t9O0Gr4H/yT2TaqlwONJQe2P/gS/mj8quKFlgdzL8rZdXQwlMH9X2ZXKHe
         mkVFZcT7dFh/d/CJhwqTcARHtK9aN9KqxhQSs77XiN/aL7xA1HMgQ96I2tPiaXe6URPF
         d55pLvq9XLTcEcHbKL5DyCxXQc1CEP+/OgZ6p+6+/xp2tJCyZoCFTYQALMVn6La4GxUL
         DT4DKQU85FRTLLPcgHfiZJYqaSwDjKM3Q5rRVtTCGTFLITlayI15YxNbEFMjzjsnfoPv
         aWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFd6P2/kR7p1IHMf/Tu+5MMJblcETn82QPt/JsrhkrI52kRnenyZQN81ZiWWTaNLp6ocqo4pdz5prn@vger.kernel.org
X-Gm-Message-State: AFuF++k1upVEt4bhoyB5aW+U3QKi0/qiCqDVzeqF4U0HKQarmr+PPZ1K
	tJsZCLMQC4SnSpHTTmfbEvLe3iHhJxsBEVym6N5y+AIiW+WSlqAESuHm
X-Gm-Gg: AYBFou0aqTxTBAVUsxcTBl3fOti2ECsnzmwEczrSnsPjrJhrEO+09Ulx4Bw85+bND67
	Jx0klofYT9TJe1szUa8jUtN39XSXxrgPYCsCpkiqDYZNrOcY8YOSZvJowj2Xt7+rdafKjd7oVc6
	ZrBDu3mDNGptHlOg94tDzHpz3wwjkimeYqAptbhttApLjU4fngpeOftNt0dUos5u+PCOu8kQf4g
	NYq9PKTMufn79Iv48FZyJuQmzerbUABQvUAWBd4iFEqO7TpmXslwp7IDU3SSMkpFqzU85NlTbcT
	uNqBg+zJH/JNyKxI0YBUPg+WxVn6eCr0DcXcsO8U4izMvhCnpKLFMRmeJ1WRcEKvRYPaGHVKWc0
	UOgKD93flURziEiPRCBbl2969EUe99wkRc3aMGdSjq6qbHzh7YZwF1fAV0yRfP3y8JU48LuGKvo
	2bLIagAop/IseL5Q2o3QGVFsx2pasQd/r7MRXYvNupjYQshJyxeg/eaxUtyuVk6hFz6l9a2j5jD
	+0cOW4Zbg7yW7iLrTRyb11knA==
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id ffacd0b85a97d-4858a467215mr292343f8f.29.1788476367923;
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Thu,  3 Sep 2026 23:59:20 +0100
Message-ID: <20260903225921.2290441-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/eMMC controllers reach the DRAM through a pipeline stage that
the hardware design inserts in the bus path to the NIC_MATRIX fabric,
clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
controller that starts a DMA transfer can never complete it.

Reference the clock from the three MMC controller nodes so the driver
keeps it running, instead of relying on the clock being marked critical
in the clock controller.

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 719e111bc3dd..8f3f1c0579a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -762,8 +762,9 @@ sd_emmc_a: mmc@88000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -776,8 +777,9 @@ sd_emmc_b: mmc@8a000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -790,8 +792,9 @@ sd_emmc_c: mmc@8c000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
-- 
2.55.0


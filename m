Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969083D47AF
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295090; cv=none; b=ebu14eKd/o59lFvowwhZv/x1C5c/S1ICyF4Y5p9BMmNUF+DIdiDaZSATS9GoRIiPf3RQiv7CDAxgW/YE2dvCcV18vbQv4xhi2hc9Y4q+QQPWd4bh2uhEqZtY0owGcboutB7OALNW1yW04ggE2JSLqUvUfBp1c/HojIUCq+crztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295090; c=relaxed/simple;
	bh=2eP39sb43Kgh9fhyqShnq22EdSMyNVuTucPevw7/1pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8uaD5LECaOOX5lQCBfICBcXeACzEOVEFMaYOC96If6UG6y2nkWGZmQN1gIyQJVUdJ2L/Vy6LoknwDlZqFVpSkDth7VpZTA0hPBcl9B/89EvUVzZ7cIMoZTTqjSoUen8uvR/kPkIAw97vou6FYS+cbGxyYBeiXFfwdLAwAXcbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvZnlfhO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvZnlfhO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaf43014d0so30717775ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295089; x=1774899889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5NEDQbOtjDud7bnDY+GwHBPLXpf4/JRpvLsQ7SzQtg=;
        b=SvZnlfhOk/69WscY1rDeLh3LwazJjekJb8/E5q4KumsRMOz5DATdsLJwLdxtgVBx1C
         bijWObxAdn9nMpRpD7jC3Pc6TGc4hvMYKR7EcCWRVLhHOqBenONXAlELSqUtgLcp9zlm
         dbq8lNTlkDei5iwk4Kc9m1J+eHCLhYuRMLZvMPqx5UvmReoNTzVJARAXUs6z022WO7V6
         QAGBnIhpo0WuBN/7UalVUKxbZzHTdyICAjV8HS40YSrUIHe5o4t+Ky+ve2W37gisecsJ
         u2BU3BAzPAyDrcdR3X9SP4XvFLuqpSVeAaapskzpQqeTSSIRAHpLgfUyIHmtypCsswx1
         JpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295089; x=1774899889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5NEDQbOtjDud7bnDY+GwHBPLXpf4/JRpvLsQ7SzQtg=;
        b=fanpfbJoFYrXdMMxcdNm0CqKFz1egYCdi/BFmLhDgzuSAttlmS3ceoq9Nlq+ZH8EU8
         6AHtItHhLyUizDDHzCAVeeszTtlKkRFFTyNRnSzx689jSkwn/QEIc24I+kcFNN54j0ef
         2/vaVo6TOqKyRmWcNpQPhn4lhk9Dg3iVTgSg86rCZJrX6KichcvHGkSTKdztHObnPEa5
         eRXL+KAzyB/P4AxZZ+WEwQFxZOwIl7M5yn+mV1FJnaNEKzn8n4jYw6ssSL/A08alEzcg
         YxwvakTUaEDjKxcxnSjoNKogBsQiWOl8EmPqExFs6ZWuR/8xtLvCq/0+PQWzKWxCBYsx
         vm+A==
X-Gm-Message-State: AOJu0Yw1l/HjZCJUxFwaXlWUnQTO/KW3oNWY6VupqDvV+pR94hwXuMpC
	z7c8Z4G6TDeGNIQgEmaHXgavoUgwZB6ynSIPH+q6BvNnBsvKa1aPHuu83bloqQ==
X-Gm-Gg: ATEYQzyhTg6vaklJGJ1zSuxFOmnoVfBcJ2OSdrh9vTYDutm3jkN3d1MRmUKDKlA9eOO
	bZVWoYUThYrARO9rzXodq6au2ceZKbSW3DIHAjaExds64uXJ6QWNdzu1iQKLq8v0fRICt+MvO+M
	SycXdcJvVaLhNwZydqLIjtsodDoiPHPjoVEryY77peHriPH/UXh1n52ZZgt4wSQHGUbz2QtMskM
	eBaQ41chjjR+qYHev2rk88/UFu21R4rY5HDSXhSG+NALKiZL675o6mHTVXprzAta8w0eQ/gwUjK
	UU07vuTtNaPV13zmmjv2YzPfnDUbL5XKvvw0qXgLCaUqIYkcORMUeWNuTyK7U1B2i+PJRBs4gwr
	Iz2dAlxBR9oAF2DSQX2sSX6y1POrqVTDvxSWlndaJ2jlWdWnCMBzgIGu04a3dK3Naa1uVpRuZLE
	y04hDTt+M8te0WimeE7CY2gG57AuJ71HRntw==
X-Received: by 2002:a17:902:c950:b0:2b0:60f1:de58 with SMTP id d9443c01a7336-2b0827d1a18mr131462675ad.45.1774295088929;
        Mon, 23 Mar 2026 12:44:48 -0700 (PDT)
Received: from arch ([2409:40c2:5005:bea7:1ec:aaa7:ee5b:2371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm152080805ad.60.2026.03.23.12.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:44:48 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com
Subject: [PATCH 2/2] arm64: dts: hisilicon: Rename dwmmc nodes to mmc
Date: Tue, 24 Mar 2026 01:14:00 +0530
Message-ID: <20260323194400.22886-3-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323194400.22886-1-rougueprince47@gmail.com>
References: <20260323194400.22886-1-rougueprince47@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core mmc devicetree schema expects mmc controller nodes to be named
using '^mmc(@.*)?$' pattern.

The legacy Hisilicon SoC files (hi3660, hi3670, and hi6220) previously
used the 'dwmmc' prefix for their nodes. This caused warnings during
dtbs_check.

Rename the 'dwmmc' nodes to 'mmc' to comply with the standard schema and
dtbs_check warnings. The legacy phandle labels are kept intact.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 957a1b41f19b..374aa173bec6 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -1057,7 +1057,7 @@ ufs: ufs@ff3b0000 {
 		};
 
 		/* SD */
-		dwmmc1: dwmmc1@ff37f000 {
+		dwmmc1: mmc@ff37f000 {
 			compatible = "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff37f000 0x0 0x1000>;
 			#address-cells = <1>;
@@ -1075,7 +1075,7 @@ dwmmc1: dwmmc1@ff37f000 {
 		};
 
 		/* SDIO */
-		dwmmc2: dwmmc2@ff3ff000 {
+		dwmmc2: mmc@ff3ff000 {
 			compatible = "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff3ff000 0x0 0x1000>;
 			#address-cells = <0x1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 886b93c5893a..0db1849a2878 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -679,7 +679,7 @@ ufs: ufs@ff3c0000 {
 		};
 
 		/* SD */
-		dwmmc1: dwmmc1@ff37f000 {
+		dwmmc1: mmc@ff37f000 {
 			compatible = "hisilicon,hi3670-dw-mshc",
 				     "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff37f000 0x0 0x1000>;
@@ -698,7 +698,7 @@ dwmmc1: dwmmc1@ff37f000 {
 		};
 
 		/* SDIO */
-		dwmmc2: dwmmc2@fc183000 {
+		dwmmc2: mmc@fc183000 {
 			compatible = "hisilicon,hi3670-dw-mshc",
 				     "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xfc183000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index f8b56d443850..61eaa7f8c1c9 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -799,7 +799,7 @@ mailbox: mailbox@f7510000 {
 			#mbox-cells = <3>;
 		};
 
-		dwmmc_0: dwmmc0@f723d000 {
+		dwmmc_0: mmc@f723d000 {
 			compatible = "hisilicon,hi6220-dw-mshc";
 			reg = <0x0 0xf723d000 0x0 0x1000>;
 			interrupts = <0x0 0x48 0x4>;
@@ -812,7 +812,7 @@ dwmmc_0: dwmmc0@f723d000 {
 				     &emmc_cfg_func &emmc_rst_cfg_func>;
 		};
 
-		dwmmc_1: dwmmc1@f723e000 {
+		dwmmc_1: mmc@f723e000 {
 			compatible = "hisilicon,hi6220-dw-mshc";
 			hisilicon,peripheral-syscon = <&ao_ctrl>;
 			reg = <0x0 0xf723e000 0x0 0x1000>;
@@ -828,7 +828,7 @@ dwmmc_1: dwmmc1@f723e000 {
 			pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
 		};
 
-		dwmmc_2: dwmmc2@f723f000 {
+		dwmmc_2: mmc@f723f000 {
 			compatible = "hisilicon,hi6220-dw-mshc";
 			reg = <0x0 0xf723f000 0x0 0x1000>;
 			interrupts = <0x0 0x4a 0x4>;
-- 
2.53.0


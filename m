Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D683B6C13
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193300; cv=none; b=DNsJvJ4whe0Sz7Ki3swYaiGOlj4DZ8oMC0c7ujO+b5vbKLLBRVqepvSNMQgbHORsdqnNrFTXmIC940aZUXuYwmOfevFO2ibmtquyldKmVaOpKokkRvNT1ppkGbUAEkAqlBpwtKLvpvu9fkrzehuh3byFA4M5YdO2V9qJF03nUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193300; c=relaxed/simple;
	bh=o6kdkAZEToRtv0bcStkT85Ju116In3ipVIQYN1vFQ+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKS2gVu2O/cz/y05FS7TI6KWLhUWb7+1u65Hqh17NvsFuWJk7LGqTWXPju53D6uDe+0x1VLcFeUGVkaDlTZIC5ltXnKDCYuj3GRwbDDbOL1YB7tk/5VQ7iNn6pGt8O1rKRHaAl8FJCXfiYDSYltyD0WTOqq/ZtOLO0z9xh14XNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCkEbz70; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCkEbz70"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e4d95e3e55so142029e0c.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792193298; x=1792798098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=;
        b=tCkEbz70daDBfGVysLFWA+jL1QBnVxROzjopkkBTt+fYxUDZouVLfHaFw3+8Nydwih
         cPXHXRDoXHJulF2fAXMlRp3Cj4XnLkVZCw2idAQNV9zKKx8mCAw6AcypfHguHj6Xjst1
         3ZlH7O0KmONPk7Ua7+/dce8IvSCKka8AdI7ty65iug9do+K5sFYZGcRDUiSx7eIxQDYz
         91U3zx554AyEPvwV7e53fpSupg0vi8k24+8VyR0/C4SCmHwfKFTkGHCIfR43nM8uXOiG
         rD9BUCoiL/73oUzqrfV/caJhvaiRp0ipf9Xb+KFeGgY7q5rwL8ZIajc6q7PCmPsLLSHI
         MiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792193298; x=1792798098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=;
        b=YEXcIIFzpXGHziki8TVOPIHXbC2Gb07jlaCZGStuYAlvSNfEdtbJykHtyurLc0+0aE
         CZSghkal7zVutCMbZParFmhtP9MI2oc3OyhVV88d5OQOaM60p4amrGnfc+1yLHv/uG9H
         hk+TX7DNcYc+jA+scGKS4k3aQuhPsE3QvP0aropndiyoYpHqDC93RAAeFehiYJdcUAnp
         y1TC+4Dx1oX4NFgURzyM/qRuCIQA+UYgFRuXMKlwONDcq4Y+wquJ4/lUzAc1foB5SM7A
         cRzOVN/iyw9Go4yiC12kSDWX78WhEx+NWnRwWeLpPdRsyMY3opqfGBG7/Ea4eYA25L8I
         VELA==
X-Forwarded-Encrypted: i=1; AKwUvBzsfFemwrROk+o3NF7ZmPVLyiNcmZWGNTq1huerXi0pcw4Uroxcb+ETOsrAlW68i0sWvgYRGvkPWi+v@vger.kernel.org
X-Gm-Message-State: AFq9FYLiEe2hmcN8ZOKj6rXnNU4kleqSW+DW1n/85EdU0htmFQw558JE
	Y+jkHWJjbbbftn3t+tDSa+URaC295wzqF/zqY76ic+fKoJRfpDqp1HPL
X-Gm-Gg: AYBFou0vZrF9cH7ooPm2oIJY4ThwAy+aI0MdAtqm09aVHo3UgfXLUldC5AepuIuAlMP
	ezxPj28hQrIfkKhbUiUu4321Ba04nS60r9Cb3K3GF0VYwL3pU8VOcQWsZPB4eYZTxXlx8dw2Lwf
	rpRBbID1aerieWrYaz2NqCYsk3rQ2+/BXbwn1iJ0J5avudyjJtLdAmSH6QDGR7tDq7T29K4cHys
	vyDlRmdeAuvNVvk9pWUN84MK5dlYFGPjrijmxOQypIqlq5cuV6vxnaHq29cceAU1AyO3nqopT/h
	I7IQ30nP7YROryt+/3RiGdgTZnPnEWIw/KWwC6YCSTfiHarsgI2R65Z37cjv3uUOjwkeKrrrITk
	DpROsbGHW6eHtxtiqSWq5O34ojzLbFVSpVky57+fQWs1ZV/WGQ2Bd3/ako0CARx1hPpiuVCkKhR
	6HQDnn1w4F5TsIqCZRSIzLJC/uxzmZcDUPfojZraKIr/dgI2jxfoMdzeISmVVJiM1zA6YDWVc+F
	QsrfKPwDVkxcP3NJjHocxUVGwYQT+ezaP50fFWlWPI2vnj7qNn4irQDGw==
X-Received: by 2002:ac5:c007:0:20b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5eaaa61b5e1mr428147e0c.13.1792193297779;
        Fri, 16 Oct 2026 16:28:17 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4f58bbsm2804299e0c.10.2026.10.16.16.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:28:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: imx5: Restore IIM syscon fallback
Date: Fri, 16 Oct 2026 20:28:00 -0300
Message-ID: <20261016232800.536654-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016232800.536654-1-festevam@gmail.com>
References: <20261016232800.536654-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
removed all IIM fallback compatibles because the binding only accepted one
compatible. The i.MX51 and i.MX53 SoC device code still looks up the IIM
with syscon_regmap_lookup_by_compatible(), though. Without the syscon
fallback, syscon_node_to_regmap() cannot instantiate the regmap and boot
reports:

  imx_soc_device_init: failed to find fsl,imx53-iim regmap!

Restore the syscon fallback on i.MX51 and i.MX53.

Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
Cc: stable@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index c8698a9af1a7..e0494aa30a6b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -476,7 +476,7 @@ aipstz2: bridge@83f00000 {
 			};
 
 			iim: efuse@83f98000 {
-				compatible = "fsl,imx51-iim";
+				compatible = "fsl,imx51-iim", "syscon";
 				reg = <0x83f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 93225a56896f..13550d12f694 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -668,7 +668,7 @@ aipstz2: bridge@63f00000 {
 			};
 
 			iim: efuse@63f98000 {
-				compatible = "fsl,imx53-iim";
+				compatible = "fsl,imx53-iim", "syscon";
 				reg = <0x63f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.43.0


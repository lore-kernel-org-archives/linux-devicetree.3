Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425832;
	b=bgNN0VO2Dfn4rj14pzckxq+w0kd3HuE0q9VhRysY8prDSwCows/ufVt2vNCOWiVFp5TZ
	 6QPdk1TEDU9qiprsq6N96F+LyYYE7GEibxTy2Wo/Ex/p2+MXuGoGp8HDXpzT3yhshPDzM
	 I8iJ+Li7Ods2V+GnTQVGN+jLwydavrNzdKsvrRE2oe7kQqbdEUkb5MALfQbLa3LWgEl9Y
	 3tVoqC5EoMRPQcU1wF5C657NSo0zB2Lp3Gxk9Vrj0fRnuXLqKk0wDRE3Mm51+8C2Revh2
	 cO1ow2LL0wm7g8KNRat/lp4QE8l4Z8v86uQNEZOjOusdo+8APbcKK5KLU7Sl+bFCl/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
	b=NhB1cpf9QkTUDTWEiIZ0dBjKnF6Qe+BnamKPdf1QghpBYuoh3od+m3Mv+7NxB4Bm/2np
	 e50QpqqddzFnSEIB9Y1RfVh2Fryd9JGQL5/eThr1LbjMujZxtU4yBV2M7DAJcFUcXoWV+
	 vGAxBkD7xuq2nzlcyGojZ8JSw+Li6ZMnFP+SFrFiGRzOKOfLrLXXV3OT45U7nm1Z4XWCR
	 2m/ePld9XWafXEgIa5BLDGVei2gjA57jeLVfk8T9YUTSTL0SnTKwKy2EoJKJBJrEsnQVz
	 6Aw1HJd8pORj5br0lBS6tHyajHKKeUoh5MwaSVR+XwVUBkJ5HTUGtUQ4Pa1Et9+sZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/LZQ7kX";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0222606A698
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0222606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/LZQ7kX
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1630095f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425830; x=1796030630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=e/LZQ7kXPiQooHLAgyHKV7edFi8YVHtSFrT4dN5NfrCLdlmwE27ntYV79oKPxmGTFy
         MMxE7oOFvYDfbzH1HgCCf6MOf05aewMXjiXILlwAJy/t72RfjxUp/0/iIgcEbVcF4ck3
         qGtYlw0wvf/adDw12V9VwGYAsMOESarpH1mrhw3fog8iwXSC0oWgnnJnX03UsIGyoQQu
         UJDWWzIoggI4Tb9VIjlzQCPTA/Bn53pPiX1W3Jq196oH3VwArIMQhMcRBJr1pwUmDyoI
         tAF/2AbW9oT1pKNIkvxlN4hhc5KBWnf/scogxU1GB9Pzvaf92uxDZLSiH/BnaCKbzpQv
         qU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425830; x=1796030630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=VmmmRIw7QSsIrcCjMku9WAfdGgoHpf/CBtyQF70cb7JVwVcnyVAf65x/ERqHpy5AxY
         V3M9JiPde257IuGLNBCl4Ldhu8vQxYRVbsQLiQqVReOA2wrYdtbLR0nI53KmGAAjB1Ia
         WJToJAPRcflVBKNFxL7dWNbqz3WNQFa2GvutvauHa2VO760sIVGy1/mTC7YVr7P8rZVZ
         56xKOlAdHqWrn4nwEp3MOzdF/qA2Ms68vVWfmaXfgZ4nBnh+DavlmehzSu+fgiocBMjt
         s3/MU2qMljSbhfauqErfyXGLiRMr4xTRv/G1w7XChp3Du11noTgxa2kFkG05C/Ni3+aD
         Hy+w==
X-Forwarded-Encrypted: i=1; AL+hErGfq8NX4/YrcQn51Awj7oO82YiKC+gBgtU5Zbid8rEeMLXeg+8gdS6kmB6ZkzGkCiOXphBeRoODjPZ8@vger.kernel.org
X-Gm-Message-State: APuU4Z9NKW/YjCCTnCrrct9ZP/3X2dPbWeGPVDG0LXpo/Jg3gf5GfTnE
	LhrtS0wV3aZVAbmpBPuARx3/UCmhfB7yj4E9WUvYW8T3Ay/0m/jPHkSl
X-Gm-Gg: AZFdTZd6f4n0fRig9wwl5bSIHrO81qCogj3DlPifuLDIY1KhYEd9d0mxO/lrn1ALjb6
	I+/N+bWg3PY5iE1ZI5MBc0paqzmNMFQLPo9RodvQNYHKdh86j4g9cGbx8QMwfr5MgBXp4UsGr7l
	+YL/w2FlyJKKe6SJzztzwI8wGUp0/svyTQkTDMBM21GllpwR9ouTDO2mKYiUhoYUPuDfZe8zSSg
	3ar6Ly8iy7LvofC46zDZFwCF4dWfYedmwmqdPhNpPWUC0AvzHiF+ZlMJe/Mo97Bi2PdXGV0p9Vo
	oMkM3SA27iHnN3NQm/xyIX9y7bl0XbgvCnV2udzav1Zv3IX5+916UXchn9Mn04JUGHyaEah082x
	LoYW09AeOM9jfzQMYCsx531k3JU/JireMxcx/IBgbZQe52YItOfReX4nYSvnWjGvGqNoML9L0q0
	8nqKpV/RAXLaO4W3dtZtl4QhT0Xwhq8X184GEUGdybsnHic+DS88NXvleMi5Kcjrg7oCk/yTJWj
	JbBCJrhmBb+G381TJEhQbmu+eV95osLyDlFB+rhzydoCfiWkvH2bz/QnGCXiXwlmCQ1TxxE4UF+
	pLoT+Y9oPGferXD3AVibSOFHYvHazvHXS5wQxknZsb5TX5jyKTFNxeOKq4B6ixYCrRWKOZdXuZ8
	9UFR+qBUUWbLcR6X/BNmFTNd8bStiRTor55VXSSSa7TIIXEZaGbG81UQ=
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr21423643f8f.12.1795425830233;
        Mon, 23 Nov 2026 01:23:50 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Mon, 23 Nov 2026 10:22:41 +0100
Message-ID: <20261123092244.1792040-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..8dd8d666b9bf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,42 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+				/*
+				 * SoC in theory supports SS but no device has it.
+				 * Actual capabilities unknown.
+				 */
+				maximum-speed = "high-speed";
+			};
+		};
 	};
 };
 
-- 
2.56.1


Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC7448BD34
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997196; cv=none; b=Rw5+hDW0lZboLbHS1kiT3C/IUj9cy80PHaLd6/VsP4fy8OEzxgFs7VkAKzcWkg/BG9tGo/EydB9EMA5bb9JwmOWvyqfXYkzdH9wna9/7JpE2Iqcgjp2KMuYnM2JM9sIS3A8515bxC3Rwc3XSeFW8Z3rvB4Hlzy16HYYoH+vRJMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997196; c=relaxed/simple;
	bh=yLrMEgg4xUBImfWNRLDWNHWRHZxsFqAJv4OtvTgaMXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrxlO8xnmv9MBBh+tzgINIcam4wkUdFHcnmuEdc2qNzCLCLao5RfYjHRGxpWWBsRXM6f/19DbGyFj0U1Xd8nxdpXEV/JHkDpegLs81BmJrh358heMAvu9upTc6Tchaeu/QljDSOpk13fa8icCRChmIhiry/PA53TaI0NuYHuYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBsAL2va; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBsAL2va"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso41782095e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997193; x=1778601993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elff6sJSJLFcwOZe6Ulwo5Af/tGUXh4RTvYGAUpcEAQ=;
        b=mBsAL2vatez5Y4vclQK4ISNPGzKQqpFdxwzO9T64/NUK1aQY/e4xFUQMSNd89SSX9Y
         Y+5mA2tx5VBjzzfl/vNWtjalGv0zzMUNnZlZ0xY0HCsLnx0o1T39cqpA2n7kISCR5RSG
         m/JzR77gMOnAtoeu9u+KNJAZzzQSTlTHTSinvsLh/ZLqLoEvkyZTmODKEgOi6mQbwLmC
         MK9SrTRs4QegAy/kPKJ0sb1t88f7Wys2DzQCbn20l/dQqi4onoEqCBEQbHURRMpvfy36
         6kxS0jr7sVNe3w6lhU+lkpXeRvLsxyGys3+VqsClvRsE2g9coi+Z7/ayIQUZ+xCD5eG+
         vdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997193; x=1778601993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elff6sJSJLFcwOZe6Ulwo5Af/tGUXh4RTvYGAUpcEAQ=;
        b=Msrkzoy2Pvn7ZHTJlxG0NTOhqmIpQ08wOgPUlyHITSjM0G+FDdQg+MdbqZMR6s8sjA
         tFJAcLaVdehs0gNymoajyevK/9Ccug7biGQmTVEzlXUPAyg/CoPIYH2q09PnbWs5MqHO
         4qj3yuPgxLm0d7rmLKVs1t6RCnplTFo60/5TEqs/bdSsOGNt3qqUNGlP5dDdl5STWSgs
         q3VuBz5wsG3OkS3Zbs1mNA90QBkDdtMGxYgb57BDBahznIfj647HVhtzzx2RAe3BkL7M
         JPcN/CnsOCqDSBA7GqJxdHAtBsjdPLDWTRC0cgUaf67KFA8xLfTy1tD8ckMtXpKT69eA
         Unmg==
X-Gm-Message-State: AOJu0YyBPkvSapmLehbHQvCmv0KPsrPhCctYrtCTYHGclS8HZN+06tyn
	HNzyhOQUZlc5lyj4Oge4pJ3Gjq7iJsOCVujBHLSu3uGraQ/3l8605ps/
X-Gm-Gg: AeBDiethUo5RvcjcAKn0n5fsTN8rjzPMJygd1ipz3Ki6T7kB1RCRjY63dlSMgV3lrnf
	L8wZxwqjB14EGIhGPFZL8n7xJdt4Szim3BJ1MHO+0Tj5s557A+Zzpt+z0ERTHYMRQwsCohbEdSj
	bAjRT8bb/KitBBwN1VsXGjG8WYNld1BDhzI/KaXhUNn2clBdSneYmtU70xdhe1ioASL2zYYRwn6
	bDpulQKG4b0OJa0E2ga/NIPKGQfr17smqD3Zmk7jAsfb2t2KytBWIKLbMxXJXTdlZb3rNAg1Dzo
	p5wCBfSAt2P3HHVAwF3LYmzR68oyN/qH+ZUIPNm3gKbf737AeRKP2GgcgHuibbY1Ybj8jI/Hh13
	I8+qqhlcgPYSL77l3Ghfh4q8zXx3KY6cce7SUmBJ26kSMGFim1M0hbLGY/v2wYlRh55BnVavUPt
	8viTuDb4SMl3xUd7zqxSTSq5Y4FPfLg6BW39+oO7qGcjeDFWN2Mrak6RTaAmZB2juk8JkElqlY0
	LGBYETC/eB6yF0AFg==
X-Received: by 2002:a05:600c:83c3:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48a986713e7mr250556915e9.26.1777997192411;
        Tue, 05 May 2026 09:06:32 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:32 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Tue,  5 May 2026 18:06:19 +0200
Message-ID: <20260505160623.1369347-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the two PCIe controller along with and their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 869172d23e259..3ba6244952b63 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,24 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
+	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MPCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBVBUS";
@@ -275,6 +293,38 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0


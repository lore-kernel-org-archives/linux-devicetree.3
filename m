Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A3A366553
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497885; cv=none; b=Yvp5sxvILmY5MFSTxFpNON+iK+OuQcBYCV803H3bR5wnPA58RE+WdOvLIPQ03CbpPCArzaF8fKY38q4khQCB03UUI8hb2CTlgDc/a5Dc5G3l4fb98RaXGUcU+tSV7bKHISOnOutbEtKNYNoMhY5cD995D2C+LAn8Wl/wtFK966E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497885; c=relaxed/simple;
	bh=ACfYTENujjxxbI6dHCTiFazUiQcwMopzM5/RtPNXh4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOwjbLpfp4ktgn6IDkod32e4k4tu625sw0ZGll3EAprqB1jQ7ZJIa+2rBARGIMIBJEUek5GteVgv5o2tnAdR/mzlQfEgcq2zCIR5/ZmbY1tbSXifyajnYxWkuKJRtOvxlJjygX7Bruz23+9i4oNmvHHuyWDLWf03cXcgrPec2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QArOD5Lj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QArOD5Lj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so44944485e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497882; x=1779102682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+BDkQR0yOyma2a6dWvMQJlddEtkYzccD9yu5cOlZj8=;
        b=QArOD5LjmA11D18w1brBjxugO9MbyROgBuokcK7FS4f80IXpn+xzPE1HXYW2dCISKd
         4QGB3W5AfBQQIghblUwvJ5ojEcr+Tm/NT3xdkZtIKPr5ssluxUI9e9R6fIL/cJFIzDtd
         3vI9VzIFw3GtVNdkV0gXVfOzchpWY14kONmXMyGWCQQkjnCRi+qHsSN3XUCYeBNhv1/e
         JWla0RH3AnwzsgmTE5bJ2OqPYPqAejYJ7+u3MeXDidMyIXgeefpl+Q6XVeaWixJknypX
         S4GLf6uolBf4qehg0Y1yCGo8mUgitzbky5mawZBIzEGT8W65rNEemMTc5laGXuuNwMyK
         cshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497882; x=1779102682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+BDkQR0yOyma2a6dWvMQJlddEtkYzccD9yu5cOlZj8=;
        b=pmsC9QbJXsLErxqUR2aFgeCmbJlRTnEoNrkScyQ38Isni8NrVXTclt4DO/MUxmZa4u
         jN6FIRLFJyuchUXTETAaF1nG5n24FK3cY+UCLRMAgjqBPT/KscCYQ9IiXVGPSu2KBq9M
         jGaUxJ18CVSytOdO497DFhQikzHtz5is3ZVtlXVt7+80ztOw6rPTgwdqSYpC/x89v3l2
         VbGdFsCd64jyeGNIf2G+M+3cXylucKxu4JFU9OnSg9tOmUvOhoP8cPpEIKCbRh43U5d7
         NnkaOG9Ck/P4Zm1fBn82uH8Q+yPAGhnNammchRRsV53umLaVCcrNvbm1sFlk8Rdv2tC1
         OCyA==
X-Gm-Message-State: AOJu0YwLWgISXzQavmk8VWWieF6OjGrLUXVS4DVJLTh87sNrzlfG3xV1
	WYl/sfYn2upAA2IrZBP6OQ7HuXjWT1iAv0BW3ocCqZIkkripOL1oBfHx
X-Gm-Gg: Acq92OG/XtWjRspkH1zQMxdDwq2ft+ARGO2/Axg/0iS7528iPxdyM7aajXn+ofgMHf1
	SI7hGhVCMsvimUz3IJMQW4WeoqDlWw5W9ohZCGfsVsgJ9iRMcvFzFT+Gm0Z+sHhRCgVWvx5eisk
	6N/04eVgTaf1/Tg1nTalBdUpkY9DpRfLFnsxjTiC5o/0A3AldseRVBcbG16BuyRDbRODbLdcGq+
	7JRg65npOxDIg7St8KCrRmXYPfCBcibjwIcYKNx8zVoVS/9G5c74+r8r5QCASE/LW9wYtJImDki
	16wABEFbpeKinkQsOVMj7TXl554hhtBBm7SrRrSU9CtDsWkWHogLbStdRE7BuZJ+OzTkvVhxdH2
	t/wr9TCpNaJ7oGaVVsZJgEfcUdvMQfMpR7wZ/QKokzdM+hZkzykNWi0f+7W38PNT/65iYy85ilJ
	fhiEnVILM6jSLuCV31RxJ1fSbfBgeibshTrvot5nBoWBZ7BVjBJ0wlCPm9+R0n5QhZQQ==
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr407079165e9.10.1778497881912;
        Mon, 11 May 2026 04:11:21 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:21 -0700 (PDT)
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
Subject: [PATCH v2 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
Date: Mon, 11 May 2026 13:11:09 +0200
Message-ID: <20260511111116.1109643-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c2 and add the connected 24c04 EEPROM.

It contains an ONIE TLV table:
=> tlv_eeprom
TLV: 0
[  12.162] TlvInfo Header:
[  12.162]    Id String:    TlvInfo
[  12.165]    Version:      1
[  12.168]    Total Length: 58
[  12.171] TLV Name             Code Len Value
[  12.175] -------------------- ---- --- -----
[  12.179] Product Name         0x21  16 k1-x_MUSE-Pi-Pro
[  12.184] Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
[  12.189] Unknown              0x41   1  0x02
[  12.194] Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
[  12.199] MAC Addresses        0x2A   2 2
[  12.203] CRC-32               0xFE   4 0x395ECD34
[  12.207] Checksum is valid.

(With 0x41 as TLV_CODE_DDR_CSNUM)

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 88c35ad1ef2ae..79415d760f162 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
 
@@ -92,6 +93,38 @@ &pdma {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+
+			serial-number {
+			};
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
@@ -126,7 +159,7 @@ buck2 {
 				regulator-always-on;
 			};
 
-			buck3 {
+			buck3_1v8: buck3 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0


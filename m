Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBC448AE09
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997192; cv=none; b=nWOInlKrRmM0HRngUDHUXc1lI4gL4BIPpeBUnhBa/uQlnISyLzh0DWsutN1IMa7U4cK+SQM5j9nTrV5CmSf1H31RRAdkvKdc1BK9bWoB83gHhYjQKgChaBXy2Ot4MOqgAuiXazzkOwFqaUqhzFJaJ4OY9T+Cr7IuVvtCA9lDwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997192; c=relaxed/simple;
	bh=s0a1FjNhS9AzlMuS0v730wkh8+Mf9/cJKGztcs8gosw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOdMFCoGMYiks3sc0ethstDHqDSwWYPp7Wznz1dtpqph86hIbO4trELQ6R6W+bN4HvYOvX1v+c/d7NAAYLZXGdlRO/Hq9cdr5DHtNpExxby66GbPb2sHzx5Blw1D7t37VBj7DJLqgJIrZ+1FyVCxxll2RFEBvCHgp19flf/W06Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrSjXR34; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrSjXR34"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a14580111so3465619f8f.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997188; x=1778601988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bw/a4OrYGymLdr8R52mjU12m0LbF359cidTN+DYJNE=;
        b=ZrSjXR34pJoubTc1FDuKT9UWcFQnUXM2DAAN0qKqZPMBC+te67+V/Ek0YRxUNSLCE1
         7dcGU9PtY+EzTJth0czOYTtewS3KSHq+kNJnOTJoLiNu+rsqnk8A8e+XRQxuFGovexUA
         d0bRL1jQQ4jOJinSR7q5h4gmbVdCIg/SnvsgQ3IeNbqLFRH/VV4KQTWwI47wIBtTP6aQ
         cdzV8icM3wWIOha52Ic0FjiCJRmxORcX73skCxDK32KZz4cV2TszV83pNvBzW3rtX+cr
         XDj3QAippWLT/IWF9eg/L8FYBqfpBxN5DKyQZZW1VLVpLbak0anOrsP9MX5fiGz2dcTd
         qIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997188; x=1778601988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bw/a4OrYGymLdr8R52mjU12m0LbF359cidTN+DYJNE=;
        b=O/6lFgi8nS59HKoLTIUtpW2dUp/BVElI+7d3gUHT57qvA+s1X/Fc3PbA7oCMKTu5oe
         /j4ReYdWFy8oTBBqMJj9tvcShy/e8r0BQcX5SeNPq7ShmQEV3mJcm7hciTJ54Lv77Tjg
         WPEegSC6Not/PEl+FJjKKJSnShftfbxGdK64QpuaSw5YzjaqCPIN19GlpLm9d8QTw38c
         dhS3KSJ/A8khwuu45vWbMPiaEtFpFI6TW6tIds5EtutFwzTIbxHMb1MsCVyPaafoYv+C
         yBy24DmMkfGOazp675mYoMAHfVhCKgyZNIEElJOV+RntuxxU6qphs4Lepkz0SpEy/A7v
         m9NA==
X-Gm-Message-State: AOJu0YwmAhbrTGNzCxllWANhtx3BDH3YZQEowhBNA8SqnBWPyTS8yyIY
	HeeuVXJYJRb5bJ185bJf7gEfBb0QEzjqQLGFUPWsbSQr/IL/vPWWEr30
X-Gm-Gg: AeBDies6QFyIK4rEtRs4VaucnjbmRC9LGatZsMu9o6IyCHPxlOQ22WBsW/Uxrz0Jgo+
	Mdrh8DWnPJfdvXFnfJ24R85kg70RZ6spH2Bc0OZCFNF7iZccJdC1MeijhplqUNeHlotjMlncjRc
	7AYakr7zUTOwHQzddG9Krm/JFzm+yIPA2H33ONI0L4F7hlWb6/TPU7Dc/COCkejVQETLEdghq7k
	QYsbRoqjYinG3jIpJmfG6M7CEV2IU27fj7llH5rPDuVZPHMfBqVZvKHFJeWZlFrkXV7ReNh+dQP
	EOovvWo9HonB7cq9mKHueFKjiRy8XONe5Vbmcb2uMVh+l1Xg6QglO1RQ9zdgR0WNveaARSq5NF+
	4ECy/TAV4IN/coAMLAcoqDqKu531yIvGBH1msWmL08dOyVax4pi2zRclTjCKbtFvYyJpV2Cllc2
	fYTRZ+MnFqT2IUPnvRz89xKZTQyQnsUcvl+cgRa5Px9xdz52+BN9JnfmVxtMmOksfrz0wIt1fBt
	1VJg44=
X-Received: by 2002:a05:6000:1acf:b0:43f:ea25:c965 with SMTP id ffacd0b85a97d-44bb6205eb6mr24336002f8f.32.1777997188159;
        Tue, 05 May 2026 09:06:28 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:27 -0700 (PDT)
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
Subject: [PATCH 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
Date: Tue,  5 May 2026 18:06:16 +0200
Message-ID: <20260505160623.1369347-3-a.heider@gmail.com>
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
index 07eef3274192c..8bb85b5ba1943 100644
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


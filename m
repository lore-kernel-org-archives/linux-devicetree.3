Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F173CB55D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192890; cv=none; b=kNXUqYlcSLfTYUWJVqY0kDXHPoUwU8UyU9xnTJrEw2jp4VBZTH9+4bLUJiBNmGoYn+QmxatpxeXpMH4/eOczaO61AqVUxo3CYNwM8XaJmxq1F9W0OKIN1WE9nUa0XOajp2pt0rmox45SaIklzahAPj39VzaWbuHn95siaNdE94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192890; c=relaxed/simple;
	bh=gwaYzdTldxWQoXA+MMWFKg+LrApmLF77aZMvQUY44SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikpQAL4UUa4toYRsgzROcSjz7ldulXvUeSzi7p4RgOtUrvXjgzmUbMvRuYoT8+7DiGC+64ePczMYFi7t0jtpKr9gXZtOJUCvgg90RnEOtDdHuBK6Z7G6Z5a+JTAWn1uMQtQyOYSWnyLCaGduL5RR6DUm4UldN133hKY6xwKs/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbkygqly; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbkygqly"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceaf8a1265so39232815ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785192888; x=1785797688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvGJD9G3Em4wuv3pnLTAT55HTjU2fJsMmfkdhBzv54o=;
        b=HbkygqlyOY7YqkNkf2cmFVElBnaKvmQBlaYVff2dTJIeRzne/+3SXfuWHzcZgySaPY
         3fjTDLnWTn2xELVdpgns5sBvQRemTvyNkkc/R7CblubVmC08yg/9XNPmK2sUP4/ZsSxB
         c+DotNd8TJh1GiFT/Xjn62aqIMfGGJVfMpATHnCavZH5wB6hMyJGFdzj9yvsuMbvRv3p
         y9GYqzGBTmLvG5yaC/s+JVR4USoyvNYW6cDTLDBnCDwKdhITdxipvdDRbRtK4wC3hXyT
         UhDabRXtmf84Jj+QKnZQJZyIg2c8Kh4DFyZAwJcdeyslfo7JcJtksBUJbk3sgVDkAiTC
         cLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192888; x=1785797688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvGJD9G3Em4wuv3pnLTAT55HTjU2fJsMmfkdhBzv54o=;
        b=UJzKWm/C7fm5+fuTF3WqvLFpiqka70rfkYrE8nDwAVNmqIUva3UWLDlT94W6n6U7xL
         Q9oEhlSYB4fCjTvBRpDPz9zMbw8JEbNeqJgf/YzDepaS8Xa9Hl3pYeRplExttkA0LRO/
         j8YmZv5ldTfosMlR9+crMv5Y5PU72Z6TvrXSJWkBCB/Jd4H/yaKKbXmDiqZSjeMDbvgL
         +BN5/Beno9YJFeuHs4RGyATMtIOSwmALTWhJ5WL4QFiIWSv/VMFIaHENvZ4c2oQoSsz/
         euSl2gwNG3E8VupFOuHKYNjdmgmhqgkeJixUW2EM8ssbXKf4qgM4yaPoKJcFBd9lwPLQ
         WVOw==
X-Gm-Message-State: AOJu0YzgoVWCutXqWjEPlBT4ocAwJ+7Ei3RvsuxVuabubSIh+4Xj1a8X
	P9Md86XnpEmgYJmov9aiVTIySzS3pUHijr8LUOszjyNi9rGwcwuqYPg9CVtuYizW
X-Gm-Gg: AR+sD12KJlBwiLJfju64Bx83OIkw+sXfkJug5eqO8KTsEUlD9vEZwH0/58ZyjolL0D3
	8HdVoMocdD81jjfy6V1xhS3oa8qum51y139SKd3Fycb2nvd0/y6ptHy5K+Sd9qCy9MteWXPGgj7
	M9b8xWsrUIGGHMvWywZpoS9c+6VW7gKu2NYsuofigqiTzh5rlny4IIOqRlBL8BYa1Pdg6kyg8ik
	35ZructrlfwozJD8hC8yO6cSvjJzXjuhh9loum0Ujg4/6lJSPI7HfKS4vMcxdSO3i+2LeaGjzGi
	qhpRvc++gHqxoKEmKUlxDOzD2p3r/rbfOWbZGGiwq1b4lJNUJhNPskvEkMT0bxLkQTsDLP884hY
	MLVerTqvjjEsmYPhArNOFdmmPRdtOZy1iMqx5NjKElVSU3Ix+mnlcL6o/D2MiYqESliSzQ5fok6
	XDoj4ueIrZNV8dScj66CPMkHjmfcJeZhzMo/5vZpM4ofKxlu+qojPC0PEENAAiJVY0FYriy0Ofp
	s/6aKi3O3p3b6Sas2b7c2L5oTWoClplE0mkG3Esi0NW6i+f7G8nl8c=
X-Received: by 2002:a17:902:d4cc:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2d00f433620mr11477055ad.42.1785192888141;
        Mon, 27 Jul 2026 15:54:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2881sm41442215ad.25.2026.07.27.15.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:54:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA9200: add wifi definitions
Date: Mon, 27 Jul 2026 15:54:46 -0700
Message-ID: <20260727225446.267097-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
some of them for proper operation.

Also add an nvmem definition for the MAC addresses.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 87569408bb69..9041dc6bfa8d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -93,6 +93,63 @@ led-3 {
 	};
 };
 
+&pcie_bridge0 {
+	pcie@0,0 {
+		device_type = "pci";
+		reg = <0x0000 0 0 0 0>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		pcie@1,0 {
+			device_type = "pci";
+			reg = <0x800 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				ieee80211-freq-limit = <5170000 5250000>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+				nvmem-cells = <&et2macaddr 2>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+
+		pcie@2,0 {
+			device_type = "pci";
+			reg = <0x1000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+				nvmem-cells = <&et2macaddr 3>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+	};
+};
+
+&pcie_bridge1 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+		reg = <0x0000 0 0 0 0>;
+		ieee80211-freq-limit = <5735000 5835000>;
+		brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+		nvmem-cells = <&et2macaddr 4>;
+		nvmem-cell-names = "mac-address";
+	};
+};
+
 &usb3_phy {
 	status = "okay";
 };
-- 
2.55.0


Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222E296BCB
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699167; cv=none; b=QPfvICukT7MCnGKXxc47TjY9ln8YDIYo5O6w0JScanG9DuS6zuxIPVCFOJGWkWD1UaVMQql8La4b9oasbipcUYKql6M2C3j3BGXXvr77otN7QDXUYHvu2rnr54xYMqAGFhgPd1Sehbk6Zm1b57l676aBcl+6Nsqu3HnnuHZ1g0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699167; c=relaxed/simple;
	bh=Cr0Mx1E/3Apsa6hk7IxjHbM3hxEvqBbDpRTia+baFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Va7zoD6xUQoEox/NJ6CRX2Mluepcs5CASWyvTbCDNCnJXskIJ2maRfrHbM7aOCS/cXk6q4eKfvDWhxxUVnczwfHWBYxUcyhrB+twt+71qp/4GGRQaOscDlnBzoTWySYkFQL7i9JeeTyOTi536u6DJYUCKrlYbsvbDoFgZsiU1no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiNqrB9G; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiNqrB9G"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-834da62e52dso1241464b3a.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699165; x=1778303965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yn4Ikrliqtn1tmBnkwrqopx2vI+LbVSo/RlQYheF60=;
        b=WiNqrB9GWf8mQHDH69U8RUXmUdAvqxZuYpkQC09dDmgecpYWQJUsYHwCiaA8fJEr8z
         ocqtZQ8g9rHEei5RXDfAjnK+fuKcgdqVJ5qS/7qADTSTcCRHAPZ2MokePCBobbYgrHo6
         8jsgMtqYU0qER7YqddycXknLHKItkAaaQy83W5QuXeTOdO4gJpYNR5tvkH8AAv7tQXVK
         x+hFP/p4D570IORxP3WDD4htD5diUSvZe671I2xcwKBtJMX52Ba3hdyjHLYmbbC5X6wc
         GbMDHtCJJxkwtdmADlMaPvJUkvl0bLkYC+Y678/cSVgyi3OK8UDBLMSfeU1KbiD8r38V
         P73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699165; x=1778303965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2yn4Ikrliqtn1tmBnkwrqopx2vI+LbVSo/RlQYheF60=;
        b=SSfY+0cJ/Y1LKKiGJ5faOxGiYow3ELEd7Y2gcrtPKiRmUzvduD10cJqTsGwrDYTkBM
         YPWF9J80TzKcZFuLyAS3IVbk4LA0SJseWnmi9g3Rub8y0avJhIjmIppV90H1SHBgrTPy
         ymSO+SrWPNJaGGzpDkZ7JksUAQU02Avq7DfdG4Fsc1B6+UuLvOfO10m8ir61y+2hakf0
         LlFVCuzN68bIDt2DrSX/QbMX1VGKtm+81+9DWsaKvnjCnDERaIodyxK8JmTKWWq0/LAH
         8VyqVzhGfJ2Xx0uQk/F02Lqd4LDMqFkppVQtFyUK9AD7XULv9kwFKuDAsDY3TdQ7KRre
         7+lw==
X-Forwarded-Encrypted: i=1; AFNElJ+M6ppppcPPuPd7YQ7hnPQG+Cnod1qnal6/C1Eea1AWAEYjNbIAhN/Z2FNunHTRaePHE+hCKIU7ctrF@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtGI+fzNFrWk+ZxeEstf/oCM2yl+NZuTaxDeZh/iu82boDO70
	f4wDj8MpB9isFlwWRCDaSz9FhMigsFkb7VDTgHSapbs8ZMv8+BZ+nt/A
X-Gm-Gg: AeBDieu43I+MU4PHMoinQm1c3tFdFU9WC8vQn/48HRRJ6s9qsKNM0z1bzHACfLV2urS
	Gi1MfoSKWTd64711bSuLE3B6Jz5YPAhfm7ksEiDUIJpHASuAp3cEM0KNNmmESDroPbNR/Y4iF8k
	yvBKYynzf+KY6Qcg30oXs0LWzaRP73caLRvGh719BsYs7iSV4KlmoLsHg0L/IU7RbO+vSy3Ww6G
	7YTm1LWsGHA8Hgo0Wbpf9qOW8kvnHw7HxCuhEzitRrTo7i+L7uF663zL7AaDrK3/RAUkmXKKMob
	2VXn4TeVAusZBhs37Ve4ylLeaeghxynd7ehb0FFXmwV6hIzqHnrdMDubv2py8TC7N+jQ4MF6L2I
	1U7PT8fpnLyF0R/Nll8dH9eR1i909pymNKPEBwoUIb+fqhUPERKQT/IiNr3fPVnmSuT31D6ZZem
	cDbPc0d8wixo8JnQR1UazIUFXrWPnXsw==
X-Received: by 2002:a05:6a00:b610:b0:82a:ea3:c172 with SMTP id d2e1a72fcca58-8352d3283d7mr1705636b3a.46.1777699165158;
        Fri, 01 May 2026 22:19:25 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for Banana Pi F3
Date: Sat,  2 May 2026 10:48:54 +0530
Message-ID: <20260502051906.8160-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
DC input. As per the schematics, vcc5v0_sys is the input power source
for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
to correctly reference vcc5v0_sys as their parent (vin-supply).

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..9727ecdd9f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
 		regulator-always-on;
 	};
 
+	reg_vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
@@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
@@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 		regulator-name = "USB30_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
-- 
2.50.1


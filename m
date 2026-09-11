Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6D38DC43
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 19:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154428; cv=none; b=pjVwkaFzjkKgVob76sWI1Qdmi5nFMI9AKUhKNd5gTZyQH+5kplLUW3gv+YlJt3G2+hVYU9itFLDj3P9yHC7lGeN3yUPbqm+lmuiben/FFbLJ1SNbDLXq0vThTNogohw3tZdFKf8uYP3qRR0A43s02A+mWuTO7x/VbTQ+CqgmTk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154428; c=relaxed/simple;
	bh=+PC7doOFzPG+ojV9Rhed2dlFn8Y4H/2XSh3B+i6O49o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f6vaztJM3IcvL8NpRcgjcwW3xgHnP/PPHgj4zyvqGJwytLbS3ALyldj4k4tnbCXn1PI5KFoh6y1+8c1vHO2QOS33X65xj3WiwAk6YTZHfU80LQy7uNoezaCieAbe3RNg/HkcROAXgRxtoqVGqcboiPMgPgLUDP3m2c4hpsbQLLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2UL3jb+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2UL3jb+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso1309875a91.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154414; x=1789759214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=;
        b=s2UL3jb+LJzP+Sx7DWs5xymJrgMT8vRDBzUzqRhjYyauYw5Yz7h0Ml8Dmoizk0OAXN
         Zbf/G0PbLBcvMAlWs6nWJTVjj+hQdJeMjWcFueOpz1VrHYgpQbXMlpdCpMKK1/ayQMRg
         vqceM0kFpLsH31p7rBjVNmQsoldRK8GwOTBW1tKiVVJMSYnvJ8wlueTIlDMP+otTeycz
         eFwQLzOd1/2VF1Lw98wMxxYMAjpTYIbJoeB+3qJLK65UbpWR3auNQBdtiYmfj6cXgwQU
         mlxWQfPqEXGOZj6PLSBVxCw3DYLhZcWhmjdrrBi5M4pXiTQeuRxu+PffEIHU6MQHONRg
         kkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154414; x=1789759214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=;
        b=h99PVJNg08nTqZOoiRKT0N4HsRD+qjLzRSb6uVtBWAvVs4J/t1BauI9Vm+Py9/z85A
         8ChL/S69TmxaZO3Y0KjCkIv9uXGTgdgemXpwiHnH3qoVgkUTp6OaNFuZrnzNIsQ3KLSJ
         KjYB8dXo5acL8SoV/8HZOPGISoNi+4nIPivjIXn+g+Q8ESl7sZxuMyYJKNYt12fHTlQd
         Yx31qh50DALyBdmSpCkPoyvcfuzTeFmJ4owgQheFcjpoInmQGpzSNsOAQoXVIlffhlOJ
         9etvrBChL+btTa0dgb5/bWJcnozr6l6yCe7jjKAH318/6HiHNwOpU5Wku3isnKcKn4tG
         KNPA==
X-Gm-Message-State: AFuF++kmjsuX4UHOTdGb3SP+NaAfKQ5u4AtgXPUWAr7fjkom3IyYnNzd
	NfWyPaUGShAHRu+6w1bc/8/A+KeUjHwdHibmpJMj6YojXsMnNqykYQ8AkT+Xew==
X-Gm-Gg: AYBFou1Oai3GkuzeOAPhwxBjKuO25RiCzNvvDrcX9IUofTmEKXUx5uh3wrqQuAZZNmq
	i1Aasd+OQ03hWmmpoQH+vU/RvBb8nSx6YIcqcIovlwtfHSK9RQzn8LhCL18cWiP6OPR4VLaNCNM
	6FGdARNh3lCx0q/S3Hdhhh/3USNTbKsFiI105XCqfv2Hty1WYk1p6x3gkoBN5UPPz4eBylaCrNo
	p8I4ZbWplcYHKfSV/W+CU9L5WFaHGVa7mBmEXObzjIwzquTgL4CNChAebA8bec4IYWR9EO60B4C
	EXxi+WmfOGQnrmiG1+sEzWtAIUttpBEf5/SpgnnCFgwUcwVJLmunF119Htgw4zEL838QXAOs/Lm
	Ipq8qNhWzDgc4bxY01Q58RDUZQE/eBWTx3GF4NBRjFZOYw0dhk2B4oMD2CUtE0EDGwkTDrc8Ajj
	4N4x9ykpk8zpz8rgCToXEE6zghVHegGT8Fs1SacriIj9MPSXFmHRMds9rKpqBMFsNLrOYiRR/Qc
	yLgDtuNSI/r3XPM79VW8cbgZhMtu0uyvAtZhi2CqSn9zTZXU5lIiAAmvCsoHpD07WWImQrPmfOU
	YnQIlb7DXM/xSoT7cW62VX+cGflB5ch6oZSWn66/jeIibiz2
X-Received: by 2002:a17:90b:2b44:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39d9c1bf032mr9565003a91.12.1789154413950;
        Fri, 11 Sep 2026 12:20:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm6375296a91.17.2026.09.11.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:20:13 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: AC68U: add nvram node
Date: Fri, 11 Sep 2026 12:20:12 -0700
Message-ID: <20260911192012.81280-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for MAC gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..6e82d2af9f1c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -83,3 +92,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


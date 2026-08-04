Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9A3DFC86
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850365; cv=none; b=AOt4mDsX5RudwxQlpYNh37I8Byv3bHH3H9x0593OzFmEgEuYX1kMHv31+5wCIQ9W+/zAeiozkiQTcnJef/IkNaQG7qy31CZZlhexmlhWC6LlDucdbqI8onL7JftGXs1RnfFjK5O/chvNUujroWVnffxoDzdtSwj+ebrimBfPSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850365; c=relaxed/simple;
	bh=Q5OzRrFfKB7ZEg61vspKHHA9bBG3TB7iUl10MdO8dmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKeWipIF/iZ9kzDR+RYgNJC9LsqyNsMgXAJBddxQEIi1zVz0Zqr/IOM28L1nQiA2dRvXzUH4GvN+AC4EtODYAEtZP7z/BTfFSXFWzlO5IvYg0zikd7kDBZJcK4Z29OxKizwhQXYFuNtiHrwXhvQasa9c2AueI0/Mu4CLuSY6fnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B27c/jkD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B27c/jkD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49548e01d02so18478065e9.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850362; x=1786455162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJTTynjrZI3L0c+LsouF5x5Hoy6mUynsSGeU0YuLyBs=;
        b=B27c/jkDuxyYkMlhdLu0a7sgo+wgORSCf/8pnJbQxuxQJwKW1BOfD6UWA2bcUeVkv3
         1GaTPCD9fDjQmEiFGq7rJOi3jmDqJD8TLB9ezH5nRgrmVQhlIgG9ZWXAg2SngYy0MCHP
         XtorWkY5wnzRkt/4sDo1sgTgiotNTTUePyj8qrVHSrHVkYlHrEnWnkGG1WozFJXCfrZk
         wk+t0k26CLb/XDTC9VgOskla6eXJW/RY6Vl2+wP/I0z/RtWUiKjVr+DweqOKgf4ZJqwS
         dHDQHIceVI+7GwclUaZlt4U2uTx9nmPVgt2ZhuLFbLU88+uWgInqGqTSnXgx1uKRRLlH
         Trig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850362; x=1786455162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJTTynjrZI3L0c+LsouF5x5Hoy6mUynsSGeU0YuLyBs=;
        b=Yh/z2ZmlmU+qdTazY7NmEqTNOAQ6cae8SSyuBlAATYG+C/pqKxYMLPRQUlDPwetR2q
         PgwdfDgI99XLxX7R4QOYyHFWHsTF2R3DohqsKetAFbn56l3gFaSZSV0TysFZ26t4otTA
         syvEj9rxLCYUU5rQkQRLEpjRW/+XGKPJpWj6Ct7xjERfsYggmqBZVrPkNHcAAbKVGxa1
         Z5FvMnaHG/6/bS5Xv1VRuy4o8wL5UvZq08SGRvuWn5meQxOzsU17FeRyx+X02uw0ry1j
         XialDnbO55O4QRzToQO/R4HVps75fO6q8mcWJ/WBpDwEoCfgtj40a7vgp4ALim19bf8o
         PKLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE4ySNVKc2XcAne6+XZixkTkBisItqV3wSvtHvW5Plc/bakug8uc1z7edxg3rR8ldJ6pcaOBn1DjCj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz264H6Kkf2c8OEGvJXCxqEPVYPfr1PBbNNSU2XPio9rqy6dOWU
	mARU5T6F6f/OEw+LfeE5F/7UH8MTaziGV7V41N/VDCvY8wxvQ/+42Pp8
X-Gm-Gg: AR+sD13mJ/ndcdgzOtdiyFoN411XyaAiO24o7wzeYk2gwE2eBkUkonBSpTaIHDd04zc
	r27BJPJ+49nDYKQhwzmOn7fkLVe/Q4qDC4dn0UKy6fum80Ew4yAOWuqQVMqbxRCW9w+q12snxWE
	UQANeUsToZ37UnYAvowzvEjeLwar0jIKnFAfEF3W175ZYcv0/ODjlBP6x1C8AUk7BpunqoszG8N
	pb6dPpsBIfPKiArRMahfiQLy7xdr09HhjZBjfbCuJxqTzoGqXf3aGxk2hqO5hYhd9E0N2eGupz+
	hwa+8FG/CHlEcxZhwocQ+9zIghYrqbIK9CA3IOGWACYHOM48byrUO6pfQMYKZtVFrekM/qo+/B9
	boBIkMuLJCwoVHVioYGNUIDMZPSlgUNz652Pw7ZY5CaScO4norwVkR80cP+tMU4aXmLOuLDn9rQ
	nRXxQ4A3RJL/mb8IKtE07wVqGne1aOqK4pLr0JC2ftEwTzG5dzf49mumFwNYMKrwg41txpHd2G7
	3kQDmeVUpXJ9M1QfJVB/To7MvYeWeQ=
X-Received: by 2002:a05:600c:3550:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-4980c679513mr335803925e9.17.1785850361445;
        Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Vincent Legoll <vincent.legoll@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
Date: Tue,  4 Aug 2026 15:32:33 +0200
Message-ID: <20260804133236.205668-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vincent Legoll <vincent.legoll@gmail.com>

Enable CPU DVFS on OrangePi RV2

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..dc6836ff7f1c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -80,6 +81,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+       cpu-supply = <&buck1_0v9>;
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -162,7 +195,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0


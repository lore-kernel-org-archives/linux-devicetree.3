Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5587509EFB
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 23:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997715; cv=none; b=jSJuFfasFRaMOOJdmnHR6mWOYoyhD4nGrRZgqFwT/phxaVU9LfxNtRfiuTx2F/nN3O4IoXyWJ6cxgsZPb4FkW7O3PcWE+bC8K8XTk5dsZ0Q/9qA0k0eT/HPtccKYIWVdpXqg8RG9S+RYQgluiJ4CUp8xNBNaYt05XNRtrLZAwZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997715; c=relaxed/simple;
	bh=e8dMr4f1lftzqjuMaGOMoLD/h2xtn1XixeP1l8uWEvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIR9Ctde7PyI+TrEFzzCOuMpobCFEoEI6oRmMfvVB3pizBXlMm9wOiA4FgRHY+quBV9p7K3jela6NdSy8NJl5qSfQfQ3rEad0Z+LZzhNNSikmoiSbjdZhtHJj2CPm4RBzf8lYQfvedgEEaUZX5q4Fm/WLccBa33FRQQ5FhGqVJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRAbIhBB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRAbIhBB"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4b037a2c1so5607002e87.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 16:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997710; x=1789602510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXMJykHKFWPZ0jyTho5hTbIzJ+mvaOVStcU57671ubI=;
        b=eRAbIhBBrPWDOG94y2ZrSZe5NGSbcho5be8tVbFbFraegQHYCOrxv1EbkHN+H2QPLT
         BmOa/WCiduCc0EnBpkGGfCmzsxxch3lGvKOSVWtJ0ePOsNrZtnvXanmL/JbO9KN6mrQK
         enOcWUoWmc00+ifCRlvYBcphKHCefuNQN43lB0/TcN1qO+wc4yTQXVH4BlJWQ+qG9oCY
         kuqREw5QVTBcZLYagIABZ6JxibJ96ak3H1Dmbza2RFV/JUic4BXRGm/Juq/wC0yJeHTt
         Td501/bDGDF5sJCw8ENChENa2GuYwKCtCD7lOhGQu8Mn3SEc7pJ95sNvg8yCXHPGtLpQ
         n4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997710; x=1789602510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXMJykHKFWPZ0jyTho5hTbIzJ+mvaOVStcU57671ubI=;
        b=CpSVd2qXL1TzqkUGvi7s/Z4D3GcAekQ9adTWMpfweSZodr0o3iIhhYmaZC6xCdCMiu
         MVvHSmKCPc339mbDC/UEM1QVsjRPZzjG29ksff5ysB8SRGDi6QPPXcN/6KTTeZS7MVyH
         8C3+Cnd1JSBvBl00jKMyyvHYOuFYsWc+1e9k8Eaj28mQfZ1uA2nOijCIKaDlobehlp0Z
         WB7ekVTFqj1hka48C4vxZmt5YiCgYSNwlxniwoaMBcbHr/0/FolkvseZV945GkG2PMwf
         PQhzc6RFPVQYIL2kCLGh1v0bAs6jkxaTxU5oYAwXXGmKP78t5k5vTPDE4kvZPNupYFOM
         Zmow==
X-Forwarded-Encrypted: i=1; AKwUvByh7/Cl38hQ3jkKPAqDo8tdBo1tG4vd5WbHZwq9YEwRkjDYKVmaLvTf3kkF7q9RLsiuu0/8IG3XQ0qQ@vger.kernel.org
X-Gm-Message-State: AFuF++n+PGgi75pBXAVT+PqmLw0oFpDC688LY3t4/yBffDYu+wW1sMVS
	oZkZuDaX/OCH6Wsr1vdDPVFPg377FQFf6h1eBwrRk3Z1vz02ydRcvZG+
X-Gm-Gg: AYBFou1ZoJn8lo1kSx6S9dbvLXpa0/2hyfS4Iku8dG7qp+2WbaTuuWHRI1tQiJDrLB5
	QX4HoLlQVDNVgcvf77h9nv4AHkxlt9BjEx+rl32BZkQXObTXc8e8Ira2fxITCH2OJFvd53YHF4W
	Z5yFA8uSLKmcVIGnDbeHgWeIbKBCI482G38j7lhWwxugkK9oYzjyfLs6Kud0e3uD8/6DWMzw7kY
	RMuKu0NvCDY68MmUQ2/9YWiFIsvgTAsitqwsXQ1Qxh5MbGvpJGljUk+06N1hmTz3KX2eA6Mi9Zm
	IYrKKxU4OfzWM3deLUynq1Z88A/KSfDR0ISUO7+FoFT6KM7tfAKMNLRgskqtm5ymz2Is6V2upni
	GtYAklMNCkNM1JhGRf6OomiinzscWxcvZnd9tvqBNet0GgLy1HOQ8krLFv2aUFQZzHheLlr3BDR
	XqiGt/jyg0kOCnA5F2sysKJmLgheYrFT9TqlFNo+6Fjn/kNBFt1/CBT42BUsj+EM7PmxRod4SoM
	OKqnasuhr3yj0mxLQr6EfP6i44M3y7jlol8IEAc
X-Received: by 2002:a05:6512:b8d:b0:5b6:1a7c:28 with SMTP id 2adb3069b0e04-5b61a7c0215mr6090288e87.43.1788997709683;
        Wed, 09 Sep 2026 16:48:29 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:28 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-oneplus: use generic fuel gauge compatible
Date: Thu, 10 Sep 2026 02:47:44 +0300
Message-ID: <20260909234744.1177153-4-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnePlus 6 and OnePlus 6T battery packs may contain either a TI
bq27411 or bq27541 fuel gauge. Use the generic ti,bq27xxx compatible
so the driver can select the register map from DeviceType at probe
time.

Tested on OnePlus 6T (fajita) with a bq27541 (DeviceType 0x0541):
after booting the new kernel, the battery reported 4.360 V, 100% state
of charge, 27.8 C, and Full status.

Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 948a0dd..8c5cd94 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -790,8 +790,8 @@ &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	bq27441_fg: bq27441-battery@55 {
-		compatible = "ti,bq27411";
+	bq27xxx_fg: fuel-gauge@55 {
+		compatible = "ti,bq27xxx";
 		status = "okay";
 		reg = <0x55>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 5f01115..cf40842 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -44,7 +44,7 @@ main_cam_ois: main-cam-ois-regulator {
 	};
 };
 
-&bq27441_fg {
+&bq27xxx_fg {
 	monitored-battery = <&battery>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7ffcad2..9436027 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -67,7 +67,7 @@ tfa9894_codec: tfa9894@34 {
 
 };
 
-&bq27441_fg {
+&bq27xxx_fg {
 	monitored-battery = <&battery>;
 };
 
-- 
2.55.0


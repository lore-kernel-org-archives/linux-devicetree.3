Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406EE334C3D
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128738; cv=none; b=H4Q03hRWz6s4hS4JRHSdgX80oq/1y5ma9p5Ped7pYgxu/DlLzpogCLlReFyehaR9+yBz2lQE2nrpKkmSe32Kw/M3PLIKhZCel4SZSl8dAUscYihIkO7BfcXS6u/r1OqJbFts3IHsOKs09zBperHhW5reT1YPU/Qq5ucqdLIxcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128738; c=relaxed/simple;
	bh=qmTEYa5y2X3+a9MjlGMmJzQReb8UU2q6dn0mmgoCa10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gK16pSng4AGuR0RNxtt0sftOiYFx74zVrH7STbjWZME9sISHWoEYiip7bgElTOV88xZ75IZQ2RQDnXF4DTb0pux8Q8znX1WBMW4I2xAlXpHg124IAvmrZB+slhMCK+43swZexvIDKxcsdQ9ge8Ekjlm2fJhazJx/ajCaF2y7shg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd9AzdDf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd9AzdDf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so7020495e9.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128734; x=1791733534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwhnaXbSFDvMNkUsi1olAMp+iADX8Y1MVVoz5Bte/90=;
        b=Qd9AzdDfztJvxLg15rb07D0VGTiBAG2+cPW+fOHehaEFDypqXR2Xf0nWjYkRKLSaca
         oYQEzGkOdryh+iMuJY2hsafQMYODaHk7vW9caKQVczTcsDXKf/QQ+NYsmym+WxblwneI
         2mTYADXW+VRwl8Y2uDIX1FvuqEbs48SungmzT23SMQ+wgqH4AAaDZ9Y+f7lhqq0bJJFH
         wcmSQGcOlyxgln3NQkPh3PGJ4MGGJTrMGhODJKqDuPZJe60VFRtUgt6njBTjid9ui+lL
         hIvUuFAAwrcIWXUXm2iM3uIFCsxV4dN3FtnvZvA8lDH4ZNOeGwgdMy6W4fXyrWD2eGg5
         PohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128734; x=1791733534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwhnaXbSFDvMNkUsi1olAMp+iADX8Y1MVVoz5Bte/90=;
        b=QqK5BFWQHnRl5lnlZS/1r+4sSlXhiDWYhvi/r9MIbbwt+OS11nXIepr/l9TnGJHw7J
         9QJBjhuIAC6M7Uf5vfVqVXcF5te9D8pzJ9kTO9HY/5ZljKz+WFhCsUe35ieGZAvtGnRg
         sUgh4lkYNuZumbP0X3gd40A675WMMEsgCN1Th9dUevPtR56ei49kOmDDYmatBCytk3zg
         yqkV7fjHw/lzKcSLx+PlYiBzm66XlJNFoR23EFSUSgZXaij+tvr2nspsDmURXE2yAQs2
         2FuSGUFrH++aSoIboMXzXCV4rlHSBUN6vzrqa/NHtvlToAFqRnxqoQRz/rl5T73/T1bh
         EHeQ==
X-Gm-Message-State: AFuF++kPAhJIEKlPpUr/v8qNoeEiXq1+Ntg+LjAT4CUH0Z5bpbUjJP27
	uzFY6mv5FmgY59FvvGNz7G4Kfzlu3rpN/W0CiZbZ2/LrIG8rTi7sjba7
X-Gm-Gg: AYBFou3i6xFrjIH2NqH1Zf1ePLY5mJpCNzeufKZXlU76S3jBmSHbQeZFIeIVPR0icbY
	8JBzTpoGdcB8Q6FR+VricTIq7/PqEQKULUoAED3K57k/xZmn7qSrnWqmEY+KUr/O9aygXuQEk+A
	LF5WZykAaxONmvxHzto+OefftkOIAzJWBQQa9B7hOTSPKsLX2ugXTlYUolUKovc2RRC9iM97iCJ
	bDWAeIEUg7pNpzNmZC8YawcZjqvTGP0ePTWzvW/zU9lKPpggEwZvYrbHFFOshXt3m8XZB6IlexU
	fbbAFvMkbY/tLTlFXUtQvnZUHIdHe0Kq9YEzmfUxXqjFmvD7GN0kufgk2SY95NoVveO9a+MT0C+
	hKt8Bm7dLCKjjMdng43uzNwmROTBcHVZRRVTYQOi++HY3qIz6KBapWcQ4lPJ4YloF77MrRm+531
	InkJ7bZyaio24YhABuBd3j8A15ktv5bSGR8WcUJIYxkY71KyS2dv988KToN7lr2xRI0TgoP1oxE
	cQ3TyvbCnP6CRdqFXw=
X-Received: by 2002:a05:600c:c116:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a0eae0b82fmr110002475e9.22.1791128733806;
        Sun, 04 Oct 2026 08:45:33 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] ARM: tegra: lg-x3: Adjust WiFi node
Date: Sun,  4 Oct 2026 18:44:48 +0300
Message-ID: <20261004154456.145362-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing BCM4330 compatible along with keeping fallback according to
current schema. Add missing lpo clock used by the module.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 60e8a19aa70ec..7010d8c01abcb 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1669,9 +1669,12 @@ sdmmc1: mmc@78000000 {
 
 		/* BCM4330B1 37.4 MHz Class 1.5 ExtLNA */
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&ext_lpo_in>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
@@ -1714,6 +1717,14 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	/* PMIC's 32KHz oscillator for WiFi/GPS LPO input */
+	ext_lpo_in: clock-elpo-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext-lpo-32k-in";
+		#clock-cells = <0>;
+	};
+
 	gps_refclk: clock-gps {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
-- 
2.53.0


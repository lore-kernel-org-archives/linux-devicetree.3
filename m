Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B2A1D555
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777703755; cv=none; b=D4b4njHdhusn+kmd81MMVCE39Fk0u80BcMwxe2AjFdbTQuF7wik84Y74AFQgsZ+bpd7VdZB8m8Rk1HCX1ihtauTaOJoR8mDTOlvFq5ueKvOcexmsG2cPVQRcMX9yvsBa54MRXAPnjcupRjFgxDCJsFN9+SLVK5tIKpsM/tK1cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777703755; c=relaxed/simple;
	bh=deSn5Xt5tw22V/d31H1pgAVTJOwNWODnuOnfe+76xvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7hecG+FWeLJ9CPaS++kY4rlp+kLY5fCMQQxyi/qzO77JR/BKN0JMylmLNS2Z3aInSCWmA4fuR/ZrJJJxKY74d57sIhGC8btDar/CENMPPjBpQHUu8FZP7NFSHrQB/CSX0XtRuT0MJBZTenIXtjVtJ9X3YOBWYvfOjyU2Y6My+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qzWjWPv5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qzWjWPv5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so658370a91.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 23:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1777703754; x=1778308554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3eiLhT2Xek0PquJfvL2goLYfKOInax72e42XoBPjztE=;
        b=qzWjWPv5If6zkBM1z3KqEnlckI98W30hnjSESRNbLlS8R0DUqIjl4/4huw1HiCso/0
         vFib8Tl884cSavjKU+XOiI/YBR/O7m3Ih9OYYmhXJNdJKQjc0T8AhARwPpsmHsvHAKx0
         EngZ3eX5X3wXTh0aJr812Kn3++/yelI+TRJcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777703754; x=1778308554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eiLhT2Xek0PquJfvL2goLYfKOInax72e42XoBPjztE=;
        b=HfZpjbbyUFftxPbvJyaroFb2kqk3vH+7TcspgMYMtRmAifZDZd4XjSc8ghDZv4GC1Q
         LRnsu8uHQIr9ms2rpxPdqPwXPmWOre19iw6e2DnkP68S5htMSO5pI4YPbLsIth1qt0q0
         yexiwIe9S9Gyf9yN/y0M+xZrrQRg+Q2cGRrFjtTGEFWgBXYwYoZNt2ik9eNkxNXGJWkt
         M9IPGYkZajbWg3NlYU1DWCKm5NNGtNOdYOTNClm8bMdpjObn9vyOtmngAIRJlkJ2ECwO
         xn56iD4Bayx0PPejjbyGnq0TkMwEEfgpDzX6oCrjH8zP1HocIOBZGDhYf6G65o3ho5Qc
         7bDg==
X-Forwarded-Encrypted: i=1; AFNElJ8mYdeaK8Z1QKJTpppsPD8V5G50vG1EKIs3FdeCCOsFFBB27gCSleAq/5HlxlNu51b3kmYnR8w9ehsf@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvfr8IOEH4BRApmuggJwEadjP85XuLx49X7A4ghhOXRiCNmX2
	0LGAvZCF0JsH7UTMc6ggCkd7rny4bybQeOPehAMP6dQLXUFQ6PyjHzSTDxnOlxwta0Q=
X-Gm-Gg: AeBDieu4NHwwsx/EPMkvrtoeHDHGGJ1rHt7UQhq86m/IHOt/VHHE+rZ3YW3UM1k1zwO
	fMkO2/wujuDw5FJprACpR8fR+7RBPCKZqehVhub80irzSN+VQMygnlw8wgr6xVYk7KMN0HygAfC
	JZ9k9nW5ZvPlnf17UWpyvU4K01ZnLq9U8A8bDfmKDJEtwvGQ5whm3x39hjtUWhEibXad8JpQvXL
	Gu/V4oWqvtyMw+nhN+/H4lOwB7A1zE5vi9EBxgjUtI2OlxcpqarrKGb7ICX+gDsx0mTXpL9L6eT
	ruP94GevsSoi/51EuHD5B/BpT9BHHpGItmZ4JOvDa3slu0f3UV0xdLmpM2xm0AgtgcRhSTxl87W
	QKE2rrX/lLnVqrTBNF64SMlJ04R9OCtGvxVBdX2yKvTa9fQEGPszxpwn48ynlZfP4WJ9jnlgU1j
	eRhxLnCYEG/dwHwlBh4/pjbQx7F2xNEDWyMb+JDazz2F0d698GxRgQEN0gdGpgIwx50h+tYGyR0
	E21dr4kUJuYeuOLGVIyEY+O70XNsSg/tBfHqe5hWmK6DsQW/Kym+G1nXhKYU8lf0K12EhaHGp4I
	JVQfYQtVWsZimXxH332Afh1LYYt+7A8nF0uk4vfeDkKXVxE1Rr5h16gPo5MxoPr2KIHRvVuMeeQ
	=
X-Received: by 2002:a17:903:2a8d:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2b9f25fad82mr16490825ad.28.1777703754179;
        Fri, 01 May 2026 23:35:54 -0700 (PDT)
Received: from aegis ([2001:fd8:4d00:5302:f723:328c:6ae4:ddd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e827sm36859575ad.1.2026.05.01.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 23:35:53 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konradybcio@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v2] arm64: dts: qcom: slim7x: Add Embedded Controller node
Date: Sat,  2 May 2026 14:35:17 +0800
Message-ID: <20260502063518.15153-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
Hamoa Customer Reference Device (X1). Wire it up for fan control,
thermal sensor and suspend behaviour.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changes in v2:
- corrected DT compatible node
- v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/

Dependencies:
https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..1ee2a2296129 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1352,6 +1368,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.53.0


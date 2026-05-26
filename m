Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F33DA7EC
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794796; cv=none; b=CsCXbCuiLUWIxmnjfJtYU34CHQyDc1hgdVd2WTmja7CzMrcaunPyIUDkimy4/Hn+r07yqsKmGdp6zrNyGCr9vvxmo1pRzWyCc7hQnIi0obghPh1Bda1xb5sy+bJQsvm1VrLXovbUBY5vvdzMhn6HrsEapqyE59ai0XczSMSQEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794796; c=relaxed/simple;
	bh=IFm8Dx/iXRffdnKm8nRykcQLPzVQShjAiSz4mRtDJP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaFZ9r4MSy+5SFBWF8O3PWLkNjOzCnKJfPkpCveP0BoxSUmC93pZm29sltSsSZnI+YuqTWlmKNkL2zxTcFxAXBwgBonBUjC+lamxJIOgwQI94tZbSK5FzzuqcFUPsUcbObp8OH5HQlZ+QVZkqkf5RvbY82VQxxVx8IpcmeXL5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ieCZi6Fi; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ieCZi6Fi"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3695bf7d082so9384902a91.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779794793; x=1780399593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9Hma8PgXDcu3st6AylvLJQOw7l5KSEEmW11TEw/EAA=;
        b=ieCZi6Ficd1Cy/CzRFl0FAxduLV9M4o8qzLXDG6Vj9liAst4auoevInya8EQoDK1+F
         QtAIZCyMwrmVbC6db4Y5vG7GFPXHN0+1tTQZvI2aiY+VfEP9Qcpz/rniFiUZr2v8Vc66
         AODwlOiY5wisEOQYKFnlB+4gLY/qBnrvVCtNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794793; x=1780399593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9Hma8PgXDcu3st6AylvLJQOw7l5KSEEmW11TEw/EAA=;
        b=i2lE5pn+8t2VfHkXHcsp2iSmBQD40dbtwCsH1JfZIDG6ENEHBP9THwmLEl2Hcpdsvi
         X9DyWyMbT3XJhcWrIlXfrjqdE8rniMi5R9i3J8Ojw1hsP+udw2ZrCEbaUWcLhQmPjIPL
         +oDFE1B5K5crw9DJJqzH0TbLBMKvybCRRKckNwFXlJk9u750KfEFe32/WdibzUqTV2ST
         FVIxKUF0e5AU3rpS/w4poieyu7IwABySsdoQR0Cjae16dZrTU0Dh8nIpVrp6tbaelA9w
         mlj+yrJDGpyXNhPlMytdhkkYFTgfaM2Ymu04wrf77H47bM2Youc8v7T2mHeUWlgdVgRR
         9yJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3Q9omEhhdgW9GUaVCT0qJs/oqzcTneohP8v0/+CcVc0Gh6YMURdk8+SkPSGcZi2IvYCFvc2IZ6l/a@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvn9WLqFIFnqrk8UqoS5+b+JXbTbLPdgrApMwTzRra+7OMDeRs
	LOnRJ/9NdUrZcHSYBO4ZA/6R+oknU20o+WPvG/oZmrE+EQVwiThkW/wGkp0Xx9yZiAM=
X-Gm-Gg: Acq92OGXfqhn404tO0od4QmwgonACIffOjp7CtXKIaUOwuJUMtyyNrz5SjGUYC0fVy4
	ggoZ4PLKXhNSKheBpRgGpubB6GJAHmfGiP67PW8OU03hX4zlCV9dTIPbTuaycu/BXL7G/Do18PV
	zYdbQ+Pnja4j/MLIcywiq7NaongyY9JFwq/aPWQyyN/NqMK+dkXVBJMRet5t/cNoHRRNJ1qeyeW
	FLSMeGBPctR9SaLxO8WwbgvtcM7fV8PcwKwjblrVaHGEmPDp0n6EXm0yoglI2vkS5mNaa1dxagh
	QVaNkn1dWldE8tB1Baeqb2go2AAE8nC33U9xuWen3iX++vr7RgVzUwZRCMz8i3O2GMNJRBYI0JR
	jGLNao71XZ7YvzwLgo511bTpArtRmmoMEs5wpE4b2R+S/igZNER2oDY0LRBCqJmPbTEV1kta+a4
	WkiAXi/A4uXw8zAyQj7IYC0/cXh66f7ocOHLdOTSy616QD5K7GRpFO5RtVzvSbmDTMUgiAd/+C4
	LRwQE41c/Pdh47f/ZcE4eavIgq0+KztgQMkg5X0nDRIEnohLF6l43NZocd1Mwuv3+R3VnYAOqAX
	E0rOa7w3yPlvDm57MKeoWAH3PX4AzM4efZ1+sB7MtCVHUwCESGo2eYc/gp0HOvlQC56Z
X-Received: by 2002:a17:90b:3505:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36a671ddedcmr17594019a91.0.1779794793227;
        Tue, 26 May 2026 04:26:33 -0700 (PDT)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm12188091a91.0.2026.05.26.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:26:32 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node
Date: Tue, 26 May 2026 19:24:05 +0800
Message-ID: <20260526112409.66325-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526112409.66325-1-daniel@quora.org>
References: <20260526112409.66325-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
introduced by patch 1 for fan control, thermal sensor and suspend
behaviour.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changes in v3:
- use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
- v2 link: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
Changes in v2:
- corrected DT compatible node
- v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/

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
+		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
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


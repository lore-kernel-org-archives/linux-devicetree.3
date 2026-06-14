Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C6031DDBB
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442423; cv=none; b=jcqnCdJRXmfCBfsV44i2V3mloE+n7mdQOg8G4JsjTmSD4DTif37hhujOmmEC9lWOn2KYs6VmIlk+E8i2tICdtZ3rpuBpB2SDvKfGUrLdtWyy0+K6iDzTpwhTpG15kYOWo+VohNPnm+e8fHg9blsL7HGu4kC/fpeO3GftEwUJtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442423; c=relaxed/simple;
	bh=QsoPhsS9WzNC0uacJrOCe3ywqXN5XqTFFBgMo6hKexk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrLyEycyDa1WJy+a60SHAB5rlTlLcKe1PdAC1ZnR9A7snF3el7lPQ2YUxacAWmEL3vd7drxL75HS7PHwZOkW71ycY331Fai2sVkTb38im/Kc/9njNeixDgfWyx/OOqtJ+DMglBBwjUsI58BL9rJfn2bA3+s5j2qIPY57bfwcWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=YkbY6FoP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="YkbY6FoP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso1332394a91.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781442420; x=1782047220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tmAlJB2ngMbanaT32XezSYB4jpA6Xw7VV1hV0X6tFw=;
        b=YkbY6FoP/k1UF9KEKevfctniAA3sJT+CORZnRJUGXBLjqCEEi1CLk9K5cOdpZ/d3Kg
         7GZcflQlUst4E0NWQeMbEHCJ8/S2YyBQBZxP1wg/KBC7/yQ/pRKgpMfGdxENb+utm7T0
         b1MR/WOAwx3sFCk1SohQzUPunlBjzmKMj8Dmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442420; x=1782047220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tmAlJB2ngMbanaT32XezSYB4jpA6Xw7VV1hV0X6tFw=;
        b=E01RWhFizEfzZt0+2Qvz9AzJ7i2BLb+Mjf/kUgxdRMu9MkqybJ+gGDfNbBmHhA79Ts
         DOQTzgKScnn71TNfY4a9Ba5E19VKlco4vPwqAQ0EALPa4ZWLCtaXNOIstbrRSbuGoUqV
         xmDRSEWAr3dVvjpUUHUGfjIP+7EPOMA8v90oEKgzjyoTwoXEHVOMay8Qsqtyo42IUtvZ
         KrNbaV6W7ivPGSRhy2eG3rJOQhkmgoNOA9s5OX8CmZskXqz2zHaQwPTcS4iLedSHKCJl
         HfGivKglVA/TNAipR1bFgHR2AF9JRYIi1EfQawJY9kacfNXDANT4VMnD8O3NXirDHTnN
         kN6A==
X-Forwarded-Encrypted: i=1; AFNElJ+8nXqKfreMnU830IMpkNbJWnBOIIckX/t3h1rfJtGXe5CEufIfNMN0ROr5M7j03/4LjePq/D6wzO9O@vger.kernel.org
X-Gm-Message-State: AOJu0YxOm0SCiy9iZUrS97Z5Tfl8TOUoaSjqY6xmAsJWpj0bHOKdW6G3
	yta3RYuIZ8XLmS2XO+SY1N0LTSVAcml+c/dNWqYWpLQSOaQbWTcE1sUvufsSxAsSkGg=
X-Gm-Gg: Acq92OH1CN1StiORTLBrzyruDmpyPzTUCHDC50tXPkO9C9nugJ2vVGrzcHof4kYzMaL
	9kq2+kLUlkW39UzVySuhgFG7panjOkuULI5gb0BAveBQXsqJx72rieXzR6fjuhyA2gu0zC0bWSM
	zl07vHoaFJGXX4WnMXwKb7IBpwg/k38RbZhjEefT2Z1HLLMV0fTqK2ElKWWvUPAeNR43hoNb3jd
	5fVEPM6WPb1MSOAf1UyETaxs6C7D6RUv/JXumGHDdznVcraJ5wGyx2/PVHDKxDmL/f3mxyGrSJO
	RRreiW6lMWOt9XdFoLLhQH3IbJX0KQmdtIgZU3cv17PEw9G4MnjrvDvb7qSAT8OtBKOk+fje4PZ
	bYSkueJtJ4qPUDb+JiaLZyj6DbxdpHsB8WVtxXZwYPRC7eEj0uxtD7qcvA8X+Pilgn+0u6uv7ac
	SllYjhr12IRSo/FHMEpFepTgcwvKevKECUg5cqvIe2Wc/kSqfRHgBW8c2iaCmfviTfJiLq9gV9K
	FymJ6oeQTq5w7pDbbQADpUWl+On4knPaosgFW7ySPj4Vi6aF2j+TDYsbBgS5MiKCd+Ks/Y1sFLZ
	/DnTYTTJ95z4FPEy2MbjjU1mn7t24P+7PXV5wKgLs3VTCgAT85QIatg786//wGKxpNHIdUPf
X-Received: by 2002:a17:90b:3a05:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37a01845ec7mr10301235a91.4.1781442419833;
        Sun, 14 Jun 2026 06:06:59 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1c4abe46sm7758344a91.0.2026.06.14.06.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:06:59 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Bjorn Andersson" <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node
Date: Sun, 14 Jun 2026 21:06:18 +0800
Message-ID: <20260614130621.68811-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614130621.68811-1-daniel@quora.org>
References: <20260614130621.68811-1-daniel@quora.org>
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v4:
- add reviews
v3:
- use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
v2:
- corrected DT compatible node

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


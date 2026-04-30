Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841444D696
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572569; cv=none; b=gjmdb531YBWJRwzhGWoG1POLxOrff1W2iBvXIjEJT/OlVj44CqSd4jJg6Vyp/YJB4c8zQKI1Ir0h3hZFbJENf2QG9cha9WLN5u7YAM9P1X+8bjQfJkWLobHOBOzYiu484u8Quv605EhKz5VARm0KVWLk4hRKcm51qtzfKOyT4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572569; c=relaxed/simple;
	bh=ahOXd49CvxGz9ZeJi/DF+g0yvx3WazJQtMUYBMCZeCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr9BgD+H93SjBsY4ikMI35CTIqz8w2N0BnjsRF9Nl9SIhxfUMOWCqUQb4MUDg1El4VOxPPUy7+5e1fExTS4GCRP1Yzzu66bgzrzRVmH8Gibhp6ZSUIbXAF+Q+45Jc15NekEHJQLaH0iv3+w9xE54/e8hG7/cvfIW5tlQBgihm+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGoDkEnj; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGoDkEnj"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8acae26e564so14135116d6.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572567; x=1778177367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzDYNSmj+UyxcyQfn/KDw8OdpCfyjj2E+yxdJS6VrfQ=;
        b=RGoDkEnjBdFZIcHUuZhg5ex/5Hy9T5y9eiMSkLMTATpCFcxXhPQ69XvR3APU67aY9B
         ix8fE2zgUBfyVhm8IB5IyDOGSCN95JpPyXNUPl0j7xmqZmI/AwjjTvzY2AP/HJLMz+Zi
         6J6ipRFOjaEePO5ThSXtjsJyb1/Kbef3GjBWnb9mq8M0VPVqIscgfhaQKppPXXv9Mcod
         K7F66COj/CJoQwUrVHbV2mine+IGn/u/iDmu57dGhOhDyVRPP/yQ1jwg6I+wEMnXqtMs
         7OTZWl/UXEsAeigyBR3es74c5W0KD2bhtx8+8XX+nUEl9+4u4/AR8O8SoqJubkYYHQhu
         5mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572567; x=1778177367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzDYNSmj+UyxcyQfn/KDw8OdpCfyjj2E+yxdJS6VrfQ=;
        b=E1c+Upb5DGZsJeGazHyet+Cr5jX5mQsvM2yoSIRpJt52B2W8phjdGxGWz7LwGaUEba
         s/d+s5O8soVg8ksLApKJlovC1NU3u6k24mdY7yR9m27IWsC1fNCpWE00UutQDjyVHbQy
         sy8HCI3r8iSG60YV58lgWLoJfb16CRVO/ol/veox7JWuQOhTl4itcptB3sDbeqXUD8b7
         aTtKT4NHv4SMgSh8Taiet2BW+3T3rBoJhVyDY5Ii7ZMGiaG7LAXbMUhOzMDzyIZ2z6tc
         9Cyvvi5wR2EANCwQs7hkT7uooY2VAgV9ua/eT4KBO6LsCSeEJtCTElKVvX3yBDWydn1V
         ZMOw==
X-Forwarded-Encrypted: i=1; AFNElJ/BlhiRfU2S3WcSaqqFAbab/wPv1esbkYPfQ7Un9cpWxRW3c6RwTYU044FROsuZp4JyONM+I9jLUapb@vger.kernel.org
X-Gm-Message-State: AOJu0YxKohRzxXkWNklnJ0evyDlIn/ryR+RO5kPO8+yDT8s8qBWm4AFB
	CO3Y67F7TlNvQ4Iacb+hk1zzPrC0eYn28RFofaFIJMbxvlzsYzp1UenU
X-Gm-Gg: AeBDievGJDHCc4u+faXHdqMvMXg7ztBGPY2as8YC8TncGufmwjDfLdx9J1fft07YqZd
	npTR+NePYvvZWvvl9RR1lYKFklBW3bDsF8IIH3gk3E92ZcqxdFDk1Yw8yKokt6rfND76xLGsJ2K
	j7/DyenOLRr+DmD/8x9yYVmLcm8PDnDLnetj7ojscDPVGpnxzRo51MzoB1Fyrsfu8Tp6RxwVrK6
	wvAB8UQr2ZKWH3wNdfMSWKb+5axra1DXBZIhxrpGxmCZXwfuTroArwETcsVDSt0fhEiOylMcPEH
	5yGKbESpuJX60tZvrp8BRx8qoOkpz+1b2yxE/eXRK41qRcQta2IeXaRLprERZZDS1w4cgazkdct
	JeSN5wPPVf1iOQUz3HTZeZjRfD6jOH9AdD2atlZHyaq0GWiqEroXg8TOhQfK641X2UNbWvUEJtf
	6lizi12ozhQMORggkavHVF14ecFkWsDso8Z/Am
X-Received: by 2002:a05:6214:b6e:b0:8ac:a4f2:69d7 with SMTP id 6a1803df08f44-8b3fe733bd2mr65212836d6.14.1777572567556;
        Thu, 30 Apr 2026 11:09:27 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff301ba6sm24911646d6.1.2026.04.30.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:27 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 2/3] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Thu, 30 Apr 2026 14:10:00 -0400
Message-ID: <20260430181001.9256-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 1613c66f92b3..e13ced9479b7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1207,6 +1207,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.54.0


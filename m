Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBC47CA77
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216117; cv=none; b=k0/GBWxow2hQdIfsLJRZUs8VUwjvIGSsXhFXNWymw4q90mDLB++sgF6kkFlOhNQl59FpAA+GK9t+Xm6XlQ5BR6AYeHvBS7rYXH6ome0NUIxIe1Xr56ArWoM1wp+LC4yJ1263ysGYahffDBDHLjpm9Gsht3KxJKTpE0s89i9khlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216117; c=relaxed/simple;
	bh=yUyedlztWXbA3lwvxrO/styw1IzAPB86ioonRT5zCKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eW1vylMhIW+2pnsokOhwWClVZbKc3q9Qnx/JURI5ecBgba1dhEmg9oyjd4/vlfnXT0DeuuY2w9lw4jJFmK9LnuGsJTcSG8A0kdUwbWPwb4PlM7wjWHs5FUe3723fio7JLRvrbE/ifEL/80SuCBX/WCXTYsR5quGutR+lKBgPo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQMGHtNX; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQMGHtNX"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-85469b35601so204377b3a.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 05:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216114; x=1789820914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NujR5wP2r0gRxOSsqzPbYYRli2E0gkVnbRP1/4DKQ0s=;
        b=FQMGHtNXnLSv3hx05ZffmV9mTCQwmOmkig6m+l4oAeJJIyusqLx6maD60McHA53IG4
         CohFJbO11R593vSPuqvVtGgMDf3U5sjV2ZH6FeSihHI99PXnltnrUZZGBUWpoayo4XhZ
         8x1HLTsiuskSsls5XWpQ9F+1s6lioJnZRA4FBy5bjwKUi/cHnyqMOelT+CPIctt5K2ZX
         Zvub1Rox9JK8pmnKpIYhd9lRD1+LtCzIl04rAYW/vRt0c/dBp95fe0T5g3VVAuSBGDgv
         yyZEg9QScLZcxDMF90TZIQG34imUmf5DEtIy6L2dI5Nl7gR0Pbzgoiherc8KKVElmZTG
         asHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216114; x=1789820914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NujR5wP2r0gRxOSsqzPbYYRli2E0gkVnbRP1/4DKQ0s=;
        b=kU1+ye2M7FMiAZcI8oVYsKh4upgnNHHqCtXD6BstmqFCbnX433PD8Uq/I2baGbhdLI
         3V0hAundCX4/VX3QTKB8H2iGK8d3NXlV4mnpUU6K4e9MckLClRgA1nMr8LsxBq7gLM/m
         xGpLnoCf648RxOwbeqSsOcAURAWnViBfg3THaXX3/TJkvl362DlI2kU7JCGJzJWMzpfp
         9gF7IsXFO/BHu9WCJsmX5akTVnwuOD+we/KNaxbyxTQaZf3uG9eg1pU/HjPx5azmjuYA
         wfFWvhwhagFuxTt+qHId/hpTZ74fE3kx5QZWh71NbaHCs1SPh1gaVSRWXLxr7IMCLEs9
         E1Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxtx37n3mHdJZlqHwLdgXXy7aVXUBV6ngYNElC1RfjjuRjck5VBv3YF2R1Aw/JwqNw3ox4Zgvw/QYgh@vger.kernel.org
X-Gm-Message-State: AFuF++knVPgIG/W/uvR86KvfyHftvwWJAfXEtgJ7nawDlwa3Ya4nKOz7
	4XE3IDHOKOFC+QwccEWoGQauiv/k0Q+pIYH0/LNRGXWMa6ahOwCYR7VZ
X-Gm-Gg: AYBFou0tzHTpBTD+YTKWSwYQRPADkGcZsu3cWoahZL9BDaihEydCFbrB8YCpeH+2qsX
	VcPODjVzcpOVGBozD/AMZfNDdevdMSFx+BT31ifm2WNS0NyuTUCD+t6uoqalhM1buRY62v3oORU
	BoRUGi0ca1cwRRX9R2u6zKfbPLIl5tt21H2bH2+5mhsh2UgFaBlCMAQjjvQ3FL2qO5wOzPKHk9k
	hChJAA9GtD21OBMVu/nIO6w79J+iIu+aw2AK99TE31zpHz58WGJRqViplYJXsQuSK6BmQDA9DB1
	veoVxOoQrUsnpS6jjy8jA6Eg40A8k7+MdUcPl9Qr9f+d2+4gNMEWbHimuPdpdxGmRxSKUN1dftd
	lRBLvbl/6UzQCUwMSznebmnyTX/1DUjGf7det8YM66mMVf9DtuvHOgVFj8SbQ/ip0meAe4Pkku4
	7ZQLLotxWuzy/ZyAJqoXtKc9xwt+VF1rDlE8ofz9hN2huw9SKLL+2fWZcPsD+cpxs=
X-Received: by 2002:a05:6300:6684:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3db0e1f7d7bmr4991615637.16.1789216114472;
        Sat, 12 Sep 2026 05:28:34 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:aab7:8c01:68f1:4912])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm2512427a12.31.2026.09.12.05.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:28:33 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 12 Sep 2026 12:27:34 +0000
Subject: [PATCH 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-riva-usb-v1-2-0acd5cf8c62a@gmail.com>
References: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
In-Reply-To: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

Enable USB node and PHY. Since VBUS is wired to the charger IC, also
set extcon of the USB node to inform the USB driver of cable events
emitted by the charger driver.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 7c323214a..c47aad978 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -69,7 +69,7 @@ power-monitor@55 {
 		monitored-battery = <&battery>;
 	};
 
-	charger@6b {
+	bq25601_charger: charger@6b {
 		compatible = "ti,bq25601";
 		reg = <0x6b>;
 		interrupts-extended = <&tlmm 61 IRQ_TYPE_EDGE_FALLING>;
@@ -89,3 +89,18 @@ bq25601_int_default: bq25601-int-default-state {
 		bias-pull-up;
 	};
 };
+
+&usb {
+	dr_mode = "peripheral";
+	extcon = <&bq25601_charger>;
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&pm8937_l2>;
+	vdda1p8-supply = <&pm8937_l7>;
+	vdda3p3-supply = <&pm8937_l13>;
+
+	status = "okay";
+};

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438947;
	b=GD3dJRrIp6DP5mtXBih/klpuaPL7esBdNhb2GUnRLiT8WB4CmwLc7RxlagTriB4FZjGg
	 ckgfR2wJNFyIb6+ykiQIJoJgUcvRxvuIx4NCR/qTbW5tppcMy1CZGO+WneiJHfRDgTa2r
	 EWjvxb8gXPc7w8wdwrFwWnERGSk+6in7T1dsbYYGVMQkJl0jTl8a4Rck8n0QkYGY88WLH
	 vapOzwtrTgg/9+AnutMLKSXZG4+0FcnluriKmeRxRKyvqlxyofVOIQiuO4YMqnH0FAcPe
	 YEPczSIqqhxWaoxiQCzkzDpUb0EL/gAWuWcDkjO7wqc4ct4jliOEmzySdOfdRs81S5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
	b=rn0OzDZXFW4QVDk6cnh+2H8EcALuGEuQwPKqoo6zHCW4T9p6CYP/VW03aaYz7RUJtbvC
	 vkLwZV3wkpAD9iwPVCedKhUDp+iTa2ZiGH0pMRDCR2xbXtFQUs5JAtOSPtj6oyMEeghcB
	 39/Z2EP2FCWiLoS4bxjwO/2/qfmt1rFjbuqwItMhK6wyJQjX9XakRThK0woMGe6/liuWl
	 TOQHIydf3LQdS0Ym8tUsd5pJZM+qxwY3NjC1gx/J3mUv/xuYcnNss6rN3r8ouGWH367bA
	 VAF0juCZtfKwylBGV0T5SLcxm+IByrL3BWU52baSmMPkdRxVsCmxddDK7/32OudhI0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+93h+Nj;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD6606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+93h+Nj
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so531822566b.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438946; x=1796043746; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
        b=I+93h+NjMVPVj9yGSCa9Yr9/aLoxakDF33sxW0hA4Me2ZHmBigmgD3nvRHdVyy6Czf
         TA/CH/xVRgsZgVksQ6GlXxKXQMyND+oozcSLvV7DsUdVi2By+27y/9qKXG+i+00JbPRH
         2+KHo13vwZdmzbaFnGRiyzihcwP27TD3RrfomFbXAZorz6bUacz43tU99G3ycQ0LAORs
         T60Xd0qBHSzRgz5ln+D3CnLdPNMxPAqcmxpmoswe1W2kkMfVhTW3bEmWuelr475lx/Cd
         SwZybLGNsQNPoVMmgOulEj9ahnKNw9Jy0lOnJOUQ5mE9UAHbofILR8xJYb6M7RFc5kXY
         0THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438946; x=1796043746;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
        b=PQkZv82bOD1fckS0C6J+WC8iuem7yOJJtEEXGk195R6uNAvWIvwB9DII9930Qx5WJG
         2Yy/Alpph0OdwWCRPErAJiE3wjAFPg1Jf33co9ZIsgCFIdzXAuypXq6ZVQfN6X4QPY+a
         A1hnvPeszqPOx/kopCEPSGUJKGu1GPvk3VKtuHxB2CxLiR5K+tAZy9yJD2Ox7m2Pg8VA
         zhr1D1dTbJiQ8weZ7V3jPNP6RKmLoNSgIKdtlnzc7bB9t/sRVb4VkSnMKLTYOIxgLgqx
         sUxL6nHY9BM3VVRaX1PDierP+WN6ng1qi2nM9hC7+brNow8O1cwnSczd8D381nf7foJu
         jBIA==
X-Forwarded-Encrypted: i=1; AL+hErFMhGEwpTK3PQRpBV1n4LNNJ5GnnoLtmAs5FYQo01U41F/dij08d9smwUpF+cBM2AZO7SWiiLqv3qxQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8/MO2N2f4MZK9G91l2G71zH6/sDt6Rr7dbPClbik66JByfucaN
	dSkk5vwDbVOzJaaOqtMEsU1IhMEibfuHiP0LxCDuAoQx1LHbxpprnD1b
X-Gm-Gg: AZFdTZeorloF39WpWgSHb9CbmhDEruhDvjdvzuqtzRNa7YD7E4A/cwaMEQUJ3/mTRF0
	488oHE/1b7EiYOeaHeHAXRTCLDeCPWKe3FGmGdUjC4lJs1KpBwQWmKUHgUbTfdGUkVn3r8WIRMv
	el9useyZpsOcZ45NhxPyOePQshmChfvULwGTGicL1GZrVuizsgwA9zdeg37VQdGzo51YnrBmqt2
	Ouu1M3gVl7d+mRXU9CJGsFipSwQVRaz+SR+MAYtLJBVlXqSKWEiKgdi4HRyvlbx9aBI/98PA9V5
	BRzf5607bFlBjK4TffyLQhHrfsJqJkkalv5XXQtcKR2NksAKzRiFtYjQX8GUDSJL5iGHLknSj0M
	shnpAXhR0x2kEJi3hn0YOsjxTlDfC8ysQbsk63k4JmPlDDnNjQ0uT5NQBSUx8zVtsDCM9/mnm9D
	4ziTSoQSZla9NUGMGu9iHsho5lf1PKj56POx+LNkEwkMlhSmhq+oNiAVSgUGVa0L88ePP6zPNW9
	eYTMXnEtFz25SYyd80tBMdi2zlrO3EatFoPlF6mjF8SE3Iy1q8VtP+lY6ZFf9wDllN1SQddNwcU
	lgOcWCAifr8/teLOk2tt+mHGpIkfR5xlD81vuVfAnr/A
X-Received: by 2002:a17:907:9584:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c513a88223amr879508266b.28.1795438945419;
        Mon, 23 Nov 2026 05:02:25 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm412660366b.25.2026.11.23.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:02:24 -0800 (PST)
From: Erikas Bitovtas <erikas99876@gmail.com>
Date: Mon, 23 Nov 2026 15:02:12 +0200
Subject: [PATCH] arm64: dts: qcom: sm7125-samsung: add fuel gauge
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-sm7125-samsung-fuelgauge-v1-1-edcdef00a6ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOQQqDMBBFryJZd8CxmFSvUlzEcUxTGm0TI4J49
 8YqdPnhzXuzisDechB1tgrPsw12HNLASybooQfDYLu0RZEXErFACE5hUULQLsTBQB/5ZXRMnC4
 VSZ1ThZJEOn977u3yU9+bY4fYPpmm3XcSnj8xNacD+yfr7AhiCpLCWw7mbaFzGrRSlbx2FSNRP
 ePuaXVgoNE5O9XZwMsE57e5aLbtC13hJprjAAAA
X-Change-ID: 20261121-sm7125-samsung-fuelgauge-a57c6a0c916c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <erikas99876@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use Silicon Mitus SM5714 interface PMIC,
which includes a fuel gauge as one of its features. Enable GPI DMA and
I2C controllers, add battery bindings and enable the interface PMIC fuel
gauge.

Signed-off-by: Erikas Bitovtas <erikas99876@gmail.com>
---
Samsung Galaxy A52 and A72 use Silicon Mitus SM5714 interface PMIC which
includes a fuel gauge to measure battery state of charge. Add device
tree bindings for their lithium-ion 4,500 and 5,000 mAh batteries
respectfully, enable GPI DMA and I2C controllers and enable the SM5714
fuel gauge.

Tested on Samsung Galaxy A72. The driver reports the same SoC and energy
as on Android.

This patch depends on a currently unmerged series for SC7180 GPI DMA:
https://lore.kernel.org/all/20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com/
---
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  4 +++
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  4 +++
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 38 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
index ecba5be8164e..cd58f1449290 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
@@ -15,6 +15,10 @@ / {
 	qcom,board-id = <0x22 0x6>;
 };
 
+&battery {
+	charge-full-design-microamp-hours = <4500000>;
+};
+
 &rmtfs_mem {
 	reg = <0x0 0xf4f00000 0x0 0x202000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
index f18d03de1585..73a1c3b7facc 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
@@ -15,6 +15,10 @@ / {
 	qcom,board-id = <0x22 0x5>;
 };
 
+&battery {
+	charge-full-design-microamp-hours = <5000000>;
+};
+
 &rmtfs_mem {
 	reg = <0x0 0xf3700000 0x0 0x202000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 59ef4921f31e..5d854a76bb21 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -22,6 +22,11 @@ / {
 
 	qcom,msm-id = <QCOM_ID_SM7125 0x0>;
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion";
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -379,6 +384,25 @@ &dispcc {
 	status = "disabled";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	fuel-gauge@71 {
+		compatible = "siliconmitus,sm5714-fuel-gauge";
+		reg = <0x71>;
+
+		monitored-battery = <&battery>;
+	};
+};
+
 &pm6150l_gpios {
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio8";
@@ -421,6 +445,20 @@ &qfprom {
 	vcc-supply = <&vreg_l11a_1p8>;
 };
 
+/* External pull-up */
+&qup_i2c4_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9c_2p95>;
 	vqmmc-supply = <&vreg_l6c_3p0>;

---
base-commit: 2c0da72bad5631bda9c70dcfbe3497a0ebd9f936
change-id: 20261121-sm7125-samsung-fuelgauge-a57c6a0c916c
prerequisite-change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc:v1
prerequisite-patch-id: 70dc64e33232cae6744eeb11e8f53e099eb49c1f
prerequisite-patch-id: 1ba00e1d0ffd80fa49f64e8b627ab07ce9478e74

Best regards,
--  
Erikas Bitovtas <erikas99876@gmail.com>


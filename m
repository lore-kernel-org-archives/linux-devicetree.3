Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740592;
	b=YvlGiCkbAuUSKBbgkZcNjG0Gu0vaBt4wYmlo2i3ABUNVEpO0scoj7i9Eouv1ImFx1NG6
	 4rEAmMEw5vjrdLuEU7n2sFvWXej3zDGDgWSYP46QcFegLMWbaMmJ3oMfAAiJaG/G4HFyT
	 b4UlvkbgYmZ+moVRi7HWNwgrsj+wdVB35IvIRXPLOjppdYn/IeRxnIAXSK7ESTJFCcjvC
	 Cq10YSa6g2KQuqDKmlk4M7C/1DRaBA7qliVBw46mLwpmlbAqiESyU30gvxyWkaHGEmAEl
	 pob9EvjnYZGUyHa894BhZ1K/3o2TyFj3vj7NUBjujXNZPPSoDagukmXk3wiyG9o/0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cgibLyVqQMBa2cmfJ2c6ThKSZBzwvxbUEp3TwyA7rEI=;
	b=irgN5j8Y5OoTnj9dMMtwnG/8xPMn76nupjZ/MDJi8Y9EijYzKiAUW1cRVz5PGRvk3WdA
	 dR8TADaLxljNaE/zEgeO+vZZGUbiNcBe0htfQu5+y34QIYDXSZeMXPhWjnfFkSaPHQPc7
	 2YwWuZX31urvwikwBCIai/DMitgxhDeNyGAIu+fcEfxCZjYXs4W60Sj2vIz9tLhQY3k0u
	 9L1FYiK1lTanIrz7YpgDznrZuON/ckPbdwoICT2nRhiOIV21J4SEmMvqt018eUGZoxjpa
	 JPJ6W/nA4plyuGnd3SYjpgd+h4gCoVRe+g+gKKEpH10vj8mCPBdVNYEzNmNghk4CFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WaG1oIVe;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4FF606A323
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4FF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WaG1oIVe
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5378b281aso2717765ad.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740591; x=1793345391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgibLyVqQMBa2cmfJ2c6ThKSZBzwvxbUEp3TwyA7rEI=;
        b=WaG1oIVeloaj2WDlvkNWpkCyIGKDF59I/GqRPFBXuT1rzcRMPLEoeRFyJe60diZT+5
         mTBM9CQGD665ZpG1IfhPNZ15/m0NtcAGcQnCBMOuIHPF8zeik4G2zq0/WsQiVjTAgYax
         jFyyIYmPViDkAn5Eh038XfuVUsNlX3Vhw47EA1auP0y4W0+yz2fMhoanCow4l63YztFp
         rP2Dhpk+5c0AifMDuSeWKJ+cRPsMT48MW7eOYhsUFP0U00AQVJkM4c8dIA99995k3IvE
         Tlpzr4RI1vEwy7dEzARdbkR0Y28rVos+M5OkBjzUtB56lNVvCxMczyoX4GNj9/qDS//0
         5BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740591; x=1793345391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgibLyVqQMBa2cmfJ2c6ThKSZBzwvxbUEp3TwyA7rEI=;
        b=cTV0u6k/DlOu/O0W/DRjdNC76TD451Z730fXFVktz6Td5ds9CjGtMSmdn9Cuowf6DT
         k9YMi5TjsDCsnyxfyp5+gPgDHuqJHKhsZ7kOTuXyHBgj5Rm7qjn/RbctQt+Pm6wRai12
         O5uV1EfD8XETEyrnaTnFNankFq+fpJr3SgamAZj3sudijQBpQoU73NrJncuatTwcarUG
         BzZJ7eCB2juztL9E/UbNSeXfMMw08V2BQImYkxrXV3H9oaAQWkMr8GQsSuTtxnb99hL1
         pnl5cxrbjykyPlXIlMnPHatJMtHglXSdOys/R6Vj1ZeO2SssCbDNRtRD7bTDRweVXHF2
         P+jw==
X-Forwarded-Encrypted: i=1; AKwUvBxRHVmr2qIsj2N5ECemOMqs1GM3ZDP9f85hG4yoc0QtHV2ZWByLgbaaDQyUdfENUX4cmLxl6RGxuktT@vger.kernel.org
X-Gm-Message-State: AFq9FYJBairiSHLO1KL8VcaAfyDoA8KNorU2S7zmjAkVnP+XE+45hawK
	Q2pQNm/Md8iFQ7L8G/IhP8DEKncszOExWJSmO8kotfkU4hUl2LAe3JcJ3TRoXg==
X-Gm-Gg: AYBFou2o90IE+9nQO+uBmFQRHwwvSQKE+l9MRfWR6uRrDVpOZxkYOMfa7385vP8OsGT
	JEOE5d+Etn4FaYESUHIHimbw884qlddH5a1iTK39LCW8DUvUOmhlW8EDHoOK/1V5javZlZLPHy4
	+N5F0sApacQydlEFkEE9NBK6J/eu7rGqnqW76/+CIO392tZFNWc5vzgAKf5gP0S07v9Ks1WXBaU
	Tv/LgPQToAYFQTj9TjKmDKF5VF8v9mjQRXKypD5zZJjSxwddHp2rNxYKwS9K3ltaHnRyUaPPEAS
	v21iF3JzzUdpBXX9XG+kWOP23tEB2Zw4erCTvQAINJieIZHJjC8p/4bv1IUF0uOF3m4w3D2Vl30
	fYq744ulOO0wR5+B9KwXt0+Qo7qAt1nB5y5Stfqpq1g8e5syzv17cAS7FyX2YhqJFg1lXYyJpad
	7Q5I46DdFgsYlr5PmZy5WHCzr5EVSR6HZuE6ERy2gTOtsh/4W6gSDCB2if7AZM893DobjwNvviY
	Bq0jNTykEsWM2kLRMBL7T5hqnfiX70iW/DGESjBk5cNP4+CdLs+PFuiegoAHaiG0csyK7ebTQ==
X-Received: by 2002:a17:902:ffcf:b0:2ea:7180:3ab9 with SMTP id d9443c01a7336-2ea7c18a456mr14410265ad.43.1792740591010;
        Fri, 23 Oct 2026 00:29:51 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:50 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
Date: Fri, 23 Oct 2026 15:28:32 +0800
Message-ID: <20261023072832.2642647-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 2 LEDs controlled by PM8150b on sm8250-hdk
which are not added in the dts file.
The LED1 is for heartbeat indicator,
the LED2 is for wifi activity.

Enable the LED controller of PM8150b,
add the LED nodes with proper triggers into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 57c282bdb..e321fe9c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -157,6 +158,24 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		function = LED_FUNCTION_HEARTBEAT;
+		linux,default-trigger = "heartbeat";
+		color = <LED_COLOR_ID_GREEN>;
+	};
+
+	led@2 {
+		reg = <2>;
+		function = LED_FUNCTION_WLAN;
+		linux,default-trigger = "phy0tx";
+		color = <LED_COLOR_ID_RED>;
+	};
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8150-rpmh-regulators";
-- 
2.47.3


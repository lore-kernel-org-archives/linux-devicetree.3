Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740571;
	b=zHQEFQ1HCA+3UyROXOpCwJR2bL56v9NqyoOgWh5g4rAAnviMBRQTwQWQ0d5TaLB9O7Fa
	 j3K1co3VUwdiUCOTSlODz5DLYPSekKngVfdKdWIoiaeKYaqLUjI7WYJU9ndH61n9ZtmxU
	 JvUipuTTvHKch8z5wQ9EXkqF4ExiHMjUyy9aOtdSwjcgSpibjozH0sQXwzYc9ZM2ORXeI
	 JuFtohI2NVmLgPG1UigrhreGRNu+F6Rk1xI3Vg3n6RltCFGoSe+HCX1P/qJNKWHM6rlV+
	 uO98clA3ndIzs5BqtNDZ0cQO58T6kbpu6RCOPyl88mgLmh4HvLlto4V3B4BRwi4Rt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+5UHV1G0YVSK/YoGiO0tozDo+nOza612odgEK6eiNJE=;
	b=LlIcFkhOIjc45RCMRKF4CXSzX6bom+cEgYnmcwk/iRGcPzSmOfdiyw2Ec1T4OehzUXK5
	 jfhMCFenuBlw4aPTyS7nHWnnP1AsDxPYud3EBP+96P1eERTDB0gbQtbrI8lafKXIf+Lwx
	 pljBEZripbJTBApGM9ClGYT3ZuBXoXtAVB1h13pcLTH4mLVGCFKWoRovy22uQNkl5ny5X
	 nIVV2+Yvqhbeq2OBlmtvV7zWrmvocj+gz48NhU6KABHxxqRf5t5QvItd9egnYFp9m2vc5
	 Qk2feC3TUKqlW9/VoItrRg6vwhQOiHtxR85rdP76n6VXai7FQkL5awFEdHMU/4W8jRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GpEoGB4A;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643A606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2643A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GpEoGB4A
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9eb579c0eso2803715ad.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740570; x=1793345370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5UHV1G0YVSK/YoGiO0tozDo+nOza612odgEK6eiNJE=;
        b=GpEoGB4ActhJ17tme5qS49n3VkDxo91rpsAwE+aaUy7pqELCSZbbmFdbMNCp4Bg9EY
         sZPJU/zII4O7Z5F5k+jRVNIBSu4JTvFwHvNnpFLrkWXMUNxm7hp7vSoRkQbC7vKImuiO
         GEi81FnsHdjurtXKSbPc5VuVPnmkim8os3p9mmphJvZ/5Drp+iVMbgsGAHjeTq1VbzT1
         qbVsIYKaBdbxJJWYRn/w6sffafAxYbub4iAN6X2XGRwMJu6mCJa12pT8JtHsnbpEgIwK
         5nIPEPyfGoSdIiMVTTl9SGK+EeJv/Xs4M6v7MdDqcsZ6QqR1yGA6Bem8p38AuCesaDmB
         d5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740570; x=1793345370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5UHV1G0YVSK/YoGiO0tozDo+nOza612odgEK6eiNJE=;
        b=KCE7xE4E7OYP3c4/3vnowss8XGPqNqcElzP1F2lA8w694qSvF0myd9XMsV4acPAbPw
         I0tUA2rSsro1gOhdwfKhbcl+98QeonhxqFO9JdmFPB4SUMKM8kTb60Zk+wrX/HAtgxUG
         o/oOlwzdNi2F1smPoTrVtdyfHZy525oJuTjne/5SzKSNfc7dcaiKgcxHWAzV2KBEhK57
         yS19FcBExQWblqaMKwAsl4vkY2Vl2C5ZV3PEsM4d1aLC6x+tqHlwNTQetsXg8EQnNXEo
         9aX3SPZNU0u7zEMqAXM6x8brt3fNmSMUmnLSLjzPOZssaRwup1QK0Q/uEW6uapq6NwIJ
         dWhw==
X-Forwarded-Encrypted: i=1; AKwUvBz0toKyFmf8BLNqzqReiBJ+DojcLq6qW5rDhm7cr3vqRyCGi+6+9g1NWs+hG/9JHVoxayGD+WpR8lYK@vger.kernel.org
X-Gm-Message-State: AFq9FYKadfMakfLaF4h/q/cCj5ocBHbsq0+Qdk2c6LilimyuZc91xgEo
	JtLhE+O/2PTspRXEXRogzKtRrBVc7d0E0NNvS/lwHSHVVpE0RNxsQjkH
X-Gm-Gg: AYBFou1rCcsuZg/8M48BRVLVCKVbWIwIYJ+sqlLgt82IaEbIcFMk9n9Ky5fcFqyhVzD
	4JALBpix+wm1qegdVD/oWZqBFqqWq21Lh1Mel9vKhRJCXDz1riN9OSKo8IiR/a4+QMwR5Keq8vx
	3QbBF3axo7gDLwqcBbnJQnxnEvJoIWJS8KdvbS0ikFIBKBMeUAhR0XnH8hjPa6BvTtKWfT5BR36
	zl6TFuB6LSt/gD5xMeG7346Tmt5AjPz1JcjSfWkDOzdPI5VThk8OMRpgBn0O8bvtEHeNmZ6IYWK
	i4JR5zD6qsdbkBw5MpSanTXXSGOdsL9gL+jJ0BnQi3Df8uhV977wPaoqh5dZ1WaQQCLfWVFR92K
	W8/oifBRELaVdP6s20lBCb9HkMmv2qvcTao4xrkFhmUSmrUnllZRIuND96CcRlSfxwJ4ZPmRi+R
	F7PzY0u8u5idCf/Dcb3/zIwIZaYPG88P82u1xe/cal4SHPOByzYxU1lfvDuhrdp42YRdMype+OT
	Nz1z+qvJj4noaCrTmZtk8TlxJzVFYC2MlgBxWcMJoH3c2xaY6HbgAbw/QBI/XS1TQ9QUIkTdQ==
X-Received: by 2002:a17:903:2b0e:b0:2e9:6788:9373 with SMTP id d9443c01a7336-2ea7c2bf29amr15867445ad.17.1792740570393;
        Fri, 23 Oct 2026 00:29:30 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:29 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Fri, 23 Oct 2026 15:28:27 +0800
Message-ID: <20261023072832.2642647-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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

The sm8250-hdk has an on-board SD/UFS card slot,
but the SDHCI port hasn't been enabled in the dts,
so we can't use it after booting.

Enable the dts node of SDHCI for the on-board SD card slot.
Add the pinctrl node of the SD card pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..a049d78f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -398,6 +398,32 @@ &qupv3_id_1 {
 
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	sd_ufs_cd_pins: sd-ufs-cd-default-state {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sdc2_default: sdc2-default-state {
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
 };
 
 &uart12 {
@@ -467,3 +493,16 @@ &usb_2_dwc3 {
 &venus {
 	status = "okay";
 };
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+};
-- 
2.47.3


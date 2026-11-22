Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378491;
	b=YNo2XSvLoBSSgm2BvdU1jjrjgUUWkRPwRc40LQ19wLbyI9qstQu9Vzok9m3pT7fzUU8K
	 HAF9Ar1skYuyzOyW817IcTb+R1ku7gZjju6tu8JU+G3Hnmh5xKFD8Diq0k5+3S58ewTYd
	 WvDUxvFCsawnvbWZAuyMrzCot+kiFttPsufPh6d1t1dfRgMCyFH1Be2mhyoZhjl7NF5Ds
	 0I6YPzUeYwhYcA9CKw273vjeqXzZk3VfcFHpGtkGFfPvVz6bzMOOzYsQiAlH5OTmbAV7v
	 HD2NGp/473CYxySODpR+EXIv7GX6pS7Qq8NYJXh55cZPppbS91mUD+6/WW+NPFpWLhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
	b=QG07COtlLwz50qstZHF9p8nKmLuWKuxi0WqiIzJjam9tPwW72+Mf83VZbZmN/Gl4xadd
	 y27n7Chl/H9j6V9Hw0HeOX78sVTJzSyOAjqWl3GN6lnRq4F+3gUG49RedPz7RbpQx1Dd+
	 3xSLaYIonSMuTiGjeqZqTHhSaLtxrLf43sp2TK09S26cM28M4GUUC4A9cIWEXPeBzLxQQ
	 5nD4+13Pf5GL1opPYeqFCcCA9+gPnJ1C+F81b6x8jk54VWkYD60GOqJmgJ7SkebDKSd52
	 hpG7qm/vEGuHaesnVNwUoxdbyf7he4B0t2w60gtn/V3dpBPMACxb2Che+BSEKvPRpwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDqZuRao;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F8C606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F8C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDqZuRao
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4418156a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378488; x=1795983288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
        b=TDqZuRaoquGiGZvATVP8pSlepL2t8A0gvwLUfyOmbcP10HP7Qhn1od0ZyvZde3LLJ8
         qEnIiKoKBRd3YFaXpALugXXywd+cit4w2y1wnsJ6FC9JtBKTCoEjFOImrmIJS7RnqYyL
         hctyJ3WTseAMn/0RbdoYzLF3GIHyYT/y5pgpdZv7SL8iVEFyy9M8p2wp8KAc/vanlhBy
         5um1WX0Ojr46IqnNW+3utS/Nf+h4fwGq90VhprWiOg0S9fDa8xIqtVkHKRT45HCbD1R4
         35XII89NyqHbAm1zaj04Ll3qxe822TvzczULj59a7Ku0RbsTULMJc6RvicEBa/ka658Z
         rKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378488; x=1795983288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
        b=pDqvmxjwPg90qgwiyvJeUKLvjJfZcmUM1IgEktEUs81FyVyy+VWk947POCVRvwaZBN
         S8mftzX0gu0b9LBpY3xA3gnk3XmHICFK3fbrvCaSWDUYE7w8n3Hb+64bwU2NrXS4SLHG
         eb7EF0BkrKb7HeV5KVsYM3uJp6/XVYrfc8RKNe8wMMbkN/xBeOngf5uvCddQZi4MkSQt
         seTmSGeBD4+kDQQe9w1kDou+BGhnXiav7mJVQPoAIzH2K5EZMexCM5EVgPOcZsiBNWkc
         r2UaAXs8iwOlLEymtqfutadExbrRXizlTYWJXNaCF9M8M9EPRP8+xd4vIF72RPoPaK5D
         PFiA==
X-Gm-Message-State: APuU4Z+Bj4qxYPDjHWXf62vCeDB6aXrcVlxWSEK0/6mhsb7kzzFkrJyx
	1l1vzzBJVT2pLMOnLE4lC5YyNsrBhsiuv7U6uEdCq7lDIhM36RKQMWL3
X-Gm-Gg: AZFdTZcmaKlKkmszDMrFB8OiJW4YrNDrslLpEdIrmPrptsTg4AxeLp3u/yAQufzOjME
	ENfvYYHjeBnyzzpTi764nYb1Tes1/e5C/TsrXuqeFzT4HYXQPbBckSB7zWSq8UBffMuuUhosh9k
	7De+JDf6DJgVtrk/XTiZGy/Ade6SfUfpuVKD6AJGBqyTOCnqfwjhQsZXqRm2wKQZneSApy59JFq
	oLB6xrejPElk6eu8yBE66cVvlHLXJm+77QZPb7Tvn0ITchLLhWrd+rM6IEt/2+7clQgfBqr+Dwv
	42IEG2mY2K2WiKsJRQGE2aLi0o5wCa4jh+dKfiYxX8LK4TD/YUe5S/ysW2TH4oK+lnglFPP8GPq
	FoUMwzY0jfKjNRuog8X9ReJUl8/wG+bHRWOEEuaKRXhaP7igwjVbZWryFfngB5A+69FKiL8dvCL
	0G3RNF5sQ2ghzZQwjZ8T5aHGbzWUloesy7mcjNnKqZso0IZxHlbFyNVV0IhcZ5utkhPBFigvlbv
	olYZiAlTJ8aIU1Zmau34tWeQO7May+jNkMomKsn4yAaNVSTjFncQuY/yP+wX67BcY83gsF45cPG
	FWHHzawmQw0GuZSbG/JUI/BRxkmsZHn6GajU67e7Z7Im7DlaaXy4HRE2+CKMa3T0eY766OPKgEw
	XLB0huuRxbG4sEDqKL7Ze4ojhwMGMZag=
X-Received: by 2002:aa7:d794:0:b0:6ac:bd53:d29a with SMTP id 4fb4d7f45d1cf-6ba37c7a764mr4696990a12.3.1795378488047;
        Sun, 22 Nov 2026 12:14:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/18] ARM: tegra: tegratab: Configure HDMI
Date: Sun, 22 Nov 2026 22:13:59 +0200
Message-ID: <20261122201407.23742-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add nodes required for HDMI support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index cbf9b45284033..911e5e9d8a0db 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -37,6 +37,20 @@ memory@80000000 {
 	};
 
 	host1x@50000000 {
+		hdmi@54280000 {
+			status = "okay";
+
+			hdmi-supply = <&vdd_5v0_hdmi>;
+			pll-supply = <&avdd_hdmi_pll>;
+			vdd-supply = <&avdd_hdmi>;
+
+			port@0 {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+
 		dsi@54300000 {
 			status = "okay";
 
@@ -1031,6 +1045,11 @@ power-sensor@44 {
 		};
 	};
 
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -1323,6 +1342,10 @@ i2c-thermtrip {
 		};
 	};
 
+	hda@70030000 {
+		status = "okay";
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
@@ -1452,6 +1475,20 @@ clk32k_in: clock-32k {
 		#clock-cells = <0>;
 	};
 
+	connector-hdmi {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	connector-usb {
 		compatible = "usb-b-connector";
 		type = "micro";
-- 
2.53.0


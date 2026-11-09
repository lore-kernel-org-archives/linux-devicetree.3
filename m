Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233578;
	b=VCry3bHKiPdJFRW/TCgVmbGelCM1TH5Fl3/hww9reDzHTxOBK4FC9M+D3yiXb6LbCO1w
	 h9X/sO+T5z3qes3bnr9nPSeiw5EecewgQl3HFe2RFV5O3lxynk4Y2hftVOSNb18QEvAwf
	 kMFaRrUT+pPzF8uAQMsjbz95jhfabHQuJVbI2VtD6Tg7+AKyFvFDWi/cnlKLximLCdj2G
	 0Gbj3wOdxSqLR5MR8p+XQlPUqwHB2ArC9zkfViiH1TIib02pq0Ii/YDnKpQBaGKdHmxZ1
	 yunf3w6Mo7Yh2KTIdwrAlP7ylkZkFOdsVU/WsToQxTihuNC/wFiZqxscgq1X4qLYd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=klIxjWCSCyeIyNyPcN11805WdHiHiffCHGRnbaOYfKI=;
	b=TPJCxLGD1scX+iJViRbil1dMsTp7rBzjGVk2DYH7wldYLx+i4pWqlgzWxHgNIdMJ39Gn
	 ZgxliVVrPOhTDYuMtuYMS2ufO5VJrsJ1AntFZR8MD/KJ+dToSKdZ6q8cJ/JfYrVzUusZD
	 2jJcPdf3DbRWsrTxUsTeMDlNHOLXRpGUO6r3W/vL9bJQYIMOM3sA1Bah0E/1qc920y+pA
	 8cWazMMtxVmnGYP9fbDT7K5nQdnemQbZs1jfwi7XYGrkaURYKRyH+MMYNaP0uYOYmfz+h
	 rvNUd/7LNwQR/pNEp7Y9eyfsI00g+3LsXfyhwRGa9cQ52xkoR6QtTQTlZucVxZYbpqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DntfjXht;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3901A606D81F
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3901A606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DntfjXht
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso775068c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233577; x=1794838377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klIxjWCSCyeIyNyPcN11805WdHiHiffCHGRnbaOYfKI=;
        b=DntfjXhtZaVJi6YCdLNvwSc64FhamaDCWsW0NnVYpzNOcGEssYq/JVqM/xpMz8tmks
         x0UQYhaxgJIMewsH2kw133xY5W5buOjrM7m2zaOGYuPtOG025YSky+KpuL3Nmkayf8kJ
         GxDsmPOYpig4w2wQPzQqZyHX3Nc+AwULqSfx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233577; x=1794838377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klIxjWCSCyeIyNyPcN11805WdHiHiffCHGRnbaOYfKI=;
        b=q+1jjA6PZDyT7sqTCl7RlubB2c13JAO5NWfL4iuxIks8pIBHfOGIMOez1Hw6M3wiZd
         HDB+Mbu1LMLbHu8ICzRros/e1YOn4eFE4t13Q4DwDBLMsZ1xNDs63BDVeKDBWytiFINx
         bbkJfSSfvUKujw2twE1j4MxGJsvSpeiLE1vdIswpyJk5ofNz6TYEIx1rd/L6ZscgAx/r
         6+TO2ogR8bHhRboAA0BiQas4/ydUNNDfmvMI7QCRg7jn6bNwTEA6MeBPFVryiqiSHgVd
         P0z0ix8bMN+DR2JiY5dFT75x1cUu4a5jJWxagNf/mrcOJ0KFZ7vM2FBWj4ha4Om5zAbo
         lwFw==
X-Forwarded-Encrypted: i=1; AL+hErGZej1oDTNdnQXBdbQdxfAzke3MJt0dPJua/5RvIpeP9S0t74IWKoPIIhSMIulzMJ3Lm4eykLXxJa6V@vger.kernel.org
X-Gm-Message-State: APuU4Z9q48cS+c0Arp4wau79bwSfyaeH3VROtu6EXIDXMvggP2dYp+sW
	++jIGhKNHN9zurVIkieACDAwx76hot38+zst7hOh6EFDTdnVKA2hVeLC34byBGF5aQ==
X-Gm-Gg: AYBFou2ra2yOOpdik/878uzKfoSFvPqdBKPf4WSEkfZWcwVGnTIe214punjltFgRk+k
	JtHzkdrfLBkK105WhJotXsYjrPMgGatGYo7WdDgJZ7AP3iLtsqhP2PKw3kDd3SBDzJZeP4PY0sO
	Bkfg+JdGTKrU5CWFVIXLhOR/K1pGO+esa45zAQdaIY8Ckyzm3NL0K7rrirklGSail0BpQbDqNT7
	luNoq3Uhbu+EIyToNuEC1VvXNCm+I0PSCyWrbvqgCkMKAVpDMzQKXblYaV1VZVO4kOcN6yO5YIJ
	dgknD3qcBU8HkH6G0ZJc8p4y8J7QoggbFuW9qZHxT0ebOc7efuUQPwM+1KhQ+OxUfP+A6JQnKsM
	IzIuDx+0dDoBH50fQ3PyjalHmv6s3GJoEKjmbEBBhSr1YirL4OY3TeCRiLPIHy0OhlzxlF8CLrg
	H1bV8tyMKgZHlzjnwQ+7te8QrL7VXadCAaZdL587GwSzOQjED9COUH/37EKS9B9StpcGK68NLAK
	Q3R1h7BMX2RaTGrMb0XEQF7tew4XJIr+JOujLPIS8g1ukanzdNk2WzwB+kJFeByC0/gr/3/BiOv
	6Fp6wLdKthgC0ujfVLGn21DMaElR5YlB8d8bweTBY23Of/l5qMBUHrRoyI98
X-Received: by 2002:a05:7022:ea8b:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b3a8eea140mr4053093c88.2.1794233577260;
        Mon, 09 Nov 2026 06:12:57 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b375726fd1sm13297103c88.14.2026.11.09.06.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage ranges
Date: Mon,  9 Nov 2026 22:12:31 +0800
Message-ID: <20261109141233.983830-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
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

Most of the MT6397 regulator voltage ranges in mt8173-elm.dtsi were
copied from the EVB dts, and are much wider than what the supplied
parts allow. Tighten them according to the board schematics, the
MT8173 datasheet, and the CPU OPP tables in mt8173.dtsi:

- buck_vpca15 supplies DVDD_DVFS2 (the Cortex-A53 cluster), rated for
  0.72V to 1.131V. Limit it to 0.725V to 1.125V, which still covers
  all the operating points in cluster0_opp, up to 1.125V.
- buck_vpca7 only supplies the 1.2V rail of the USB hub. Fix it at
  1.2V.
- buck_vsramca15 and buck_vsramca7 supply DVDD_SRAM2 and DVDD_SRAM1, the
  SRAM of the Cortex-A53 and Cortex-A72 clusters respectively. The
  datasheet requires the SRAM supply to be higher than the CPU supply,
  but by no more than 200mV. Since both cluster0_opp and cluster1_opp
  go up to 1.125V, the SRAM supplies must be able to go above that.
  Limit them to 0.93125V to 1.15V. The lower limit comes from the
  datasheet's recommended operating conditions. The upper limit is
  slightly above the 1.131V given there, but matches the tracking upper
  limit read back from the PMIC. buck_vsramca7 uses the same limit.
- buck_vcore supplies DVDD_CORE, rated for up to 1.125V. Limit it to
  1.125V, the voltage firmware sets.
- buck_vdrm supplies the LPDDR3 memory, DDRV and VCC12IO_HSIC, all
  rated for up to 1.3V. Limit it to 1.3V. Firmware sets it to 1.225V.
- ldo_vgp5 supplies DVDD18_EFUSE, which is nominally 1.8V. Fix it at
  1.8V. However it is normally disabled.

Note that buck_vsramca15 is actually controlled by the PMIC's voltage
tracking function, which is set up by firmware. The rail tracks
buck_vpca15 with +100mV until it reaches a set upper bound of 1.15V.
Under this mode the register used to set the voltage does not change. If
the OS driver wants to read real time voltage, there is a separate
register that can be read out. buck_vsramca7 has tracking disabled by
firmware and is controlled by software, which is correct since the rail
providing power to the CPU cores is from a different chip.

Comparing the voltage ranges against the schematics, datasheets, drivers
and OPP tables, and drafting the change, were done by an agent. Manually
tested on a Hana (Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index c6751adb1c2a..579ce73de7ad 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -948,8 +948,8 @@ regulators {
 
 			mt6397_vpca15_reg: buck_vpca15 {
 				regulator-name = "vpca15";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1125000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 				regulator-allowed-modes = <0 1>;
@@ -957,8 +957,8 @@ mt6397_vpca15_reg: buck_vpca15 {
 
 			mt6397_vpca7_reg: buck_vpca7 {
 				regulator-name = "vpca7";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
 				regulator-ramp-delay = <12500>;
 				regulator-enable-ramp-delay = <115>;
 				regulator-always-on;
@@ -966,16 +966,16 @@ mt6397_vpca7_reg: buck_vpca7 {
 
 			mt6397_vsramca15_reg: buck_vsramca15 {
 				regulator-name = "vsramca15";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
 
 			mt6397_vsramca7_reg: buck_vsramca7 {
 				regulator-name = "vsramca7";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
@@ -983,7 +983,7 @@ mt6397_vsramca7_reg: buck_vsramca7 {
 			mt6397_vcore_reg: buck_vcore {
 				regulator-name = "vcore";
 				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-max-microvolt = <1125000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
@@ -995,7 +995,7 @@ buck_vgpu {
 			mt6397_vdrm_reg: buck_vdrm {
 				regulator-name = "vdrm";
 				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1400000>;
+				regulator-max-microvolt = <1300000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
@@ -1081,8 +1081,8 @@ ldo_vgp4 {
 
 			mt6397_vgp5_reg: ldo_vgp5 {
 				regulator-name = "vgp5";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3000000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-enable-ramp-delay = <218>;
 			};
 
-- 
2.56.0.455.g6c5a503b38-goog


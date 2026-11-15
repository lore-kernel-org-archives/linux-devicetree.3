Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702734;
	b=j0uJhp3EZn0B82XF9NKXDtB/CU015lBemPhnY1xfTQP+qeIp0oPkWPoGU5ws5VxTjscr
	 OmQPLdwH/Rn78HSVqhy89J6/fPpOdHuqf+VNfuicllf8EStu3xFAW6E2suGmFKOvj2YTP
	 2SKRfXYCsciClQ9ajJUzfNZaNKhnxASuUBx7p1N+5DPRLLiPVVEtlNcDEBtEwkfXVYiTd
	 avzTvCE88y9lODQgf5mpIEFj7DqN3yzlQxZTlh+6Ct+/K/B5A02vxx3m/vqB2oYQw8lSF
	 pyGPMRCkZnpOyMFRf1O4YBgS+ETt6Kv7S8hjOIFS2ybL61urU48S6dYU0wJTZW4cUuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
	b=BgyYTLW+OZBSsKDZA3NuOvhU0mmEv0nhsJKUgGaQG15BEhpdEAgvdJplVjKQ+/lcXEom
	 bkrqhC+9vb23zei9aKINMzLecOexWzRVAFMBOUGEwIM4vM7hl2YDTGa4yXqGY28qIXrjr
	 Jw27m2RIvOCLkeC93HkSHlRzmu0qONCQ8i33XAe75+1vH7L5cRRrX1hs8q0g4agAZEaHV
	 +heu8d5uTIhD3dNmAsnkIPeSXENFbNu2PXrdxlDiMoJpP7Q5l9092hYPeXAYkTHBZ1yca
	 kmGoylQqMLZdcs+ErsUPOalCpjfSJk6/i47CfyhS/0fX0M6XQm9rHAEK6K9KSPLpRBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NuB+pYQG;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A87606A8B1
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A87606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NuB+pYQG
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so3819104a12.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702732; x=1795307532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
        b=NuB+pYQG05P8vQsvSqK8FGXmuv6ceF9SEljR1BuShW+W/8vSijjlGoVxffAOL1Xuit
         FVKS/QagbramNrGHQ7YQcw0KXf5Z1rEHgu8J9YT+7duzmX+5k+DIm70GcYL1Aj0moXUo
         ZbSgnLz7FveQGyQDM9sNm2M8Bu+DDGoSDYyOnUujpQBR5IqA/cb8XvQ35+n2qf68Lwle
         +nPHPawZqGNoYKcpYs4YYZHnqEEt9MeLiKNt34QXOpZLGMndedcl94C89CAAGK2Jc/W8
         mvtkgZtTYqmUa8XMvuu8WvWp8r7vaoHxmm8RsNTnDfAWmDWKMzHpkttLgwVJ1m14oeK1
         TvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702732; x=1795307532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
        b=PTbk8Taf5IKTROeUSb6KBEfqku7A6K/9QrhPgwZwf1uj2z6R3phtxooHmcJqWLkNe0
         DPFcjpURcNmWaH3prqWMJaoj3svgcEon6I2x81c1tFg+5vJG1RyWjkBSHUeUVqjh9Nwm
         yg2QuH6YwDS6gCKzNIyQcesqkbfvqzs3glIhKm+ARDyLAJ7j8eYFoVZLfJ3yyyk6Pcy0
         uC/b/2Zsp4BboEC4/RVejExDS2wdw7zw/TFli4QuvIhKd34slHKNnCRQ3mPhYyIMIrGj
         FNdApIXyZXxl08Sf2tvsjw+OF7I8iBEq6a2hjYrIpiIlp3LZVG720o+dbe13ZcIHFn6F
         krIQ==
X-Forwarded-Encrypted: i=1; AL+hErFhlkjQzTRk8z/c4AJksmz/PvFHfcRUsSs+502mUyw7A+cp9Zil3ORa03nicRcco7F1FQWzHPZUCHb3@vger.kernel.org
X-Gm-Message-State: APuU4Z/zaRsBLh43biso62LnzLsuP0p8maQKHgiQFfy7I0I34FrEcMqu
	On+bfolb84KLz55u+3jgw/m+pAr3py1pxUrB0NeBao6t8jC0NqNRWZ0=
X-Gm-Gg: AYBFou0XVJnAvWExI68Gd3tIoXThYAJIYJQEaQKUc1E0bAAArvYAK3JCPSf03dMBfIr
	Bz1GpSmeOgbUQltc/Uj+1mkgRyKuZ3rtxOz9kMrzMMi1VUjeGLVo0uUyCuXWb4F+9lGAP6c8wkp
	7/qXR6nrpx96+LmNWUHzsu2UeiDxEOI1wRlTxCzMvTtNQ4Gp6xW74rIZFIYAOkyHA4xvo3GMEjI
	uGYCInhRYxdIrCXu907peE0HjfUDjx8UJkgyhoXTzBgrF2dKNQxfOBgobrzrhMomZApGmAKzZTF
	2wtoU3OfoMrp6O/NP2b1HrNtpATEm/uQBxF1B0AZ1+jUaai2963e4UibS1A5kIcEEf4dX/7nopV
	izJ4KnzZjMwHjsbzR2KcD3w0ACBjV2aBS9V1PExuHN50M89xFox5GfFLUrDmsO2OiEz4jN3fMTU
	kQt8F8fqqilWPE+KMlSzgUSZnw1wg3CayzoHfnHAA6IYiEtRnHOr73z8ghdoy4KMIlwlXBlhEMF
	fZF+Q8AvBGIR4y1kRqZNY1olMj+k/JYjtvJLyK0spb8vkvPN9tIQUOxP9fIty0OqFoUmrxsI6+y
	j6/TuhoeTlV64lrxTpDoxoizIrNrt2yZok3C2IYA6NX+h9ZCDf7Gp9pn/x0S1ERSCks3AGDT2me
	IoygaLZ49WQV7uiZGbAFDHVqnVaTq612yDck=
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr660429766b.24.1794702732209;
        Sat, 14 Nov 2026 16:32:12 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:11 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm6125: Add CPU idle states
Date: Sun, 15 Nov 2026 01:31:58 +0100
Message-ID: <20261115003158.391171-4-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
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

Add per-CPU power collapse states. The downstream "trinket" low power
levels use exactly the SM6115 numbers (silver: entry 290 us, exit
376 us, min residency 1182 us; gold: 297/324/1110 us; PSCI CPU mode 3),
so reuse them in platform-coordinated mode.

Cluster (domain) idle states are left for later; their PSCI parameters
still need to be checked against the downstream levels.

Tested on a Xiaomi Mi A3: WFI and cpu-sleep-N-0 show up in cpuidle and
the usage counters increase.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 1b148e453..c06842c0c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -44,6 +44,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -93,6 +97,7 @@ cpu4: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -109,6 +114,7 @@ cpu5: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -120,6 +126,7 @@ cpu6: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -131,6 +138,7 @@ cpu7: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -173,6 +181,30 @@ core3 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <290>;
+				exit-latency-us = <376>;
+				min-residency-us = <1182>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <297>;
+				exit-latency-us = <324>;
+				min-residency-us = <1110>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.56.1


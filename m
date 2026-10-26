Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008659;
	b=xsnExGqxy73GLlwYHpESJ2M4dufS4KzlYzGr3AqvJfaTj8peXIN6FsKbkqw4khvBZYxy
	 s7uyqEo74hzWD9KUPl4mJwqNhSE04zVrvoWE9TK16q/ig438mozGKJiQbTx11IZ0QfsRi
	 sq1BZZBV12ch+l8WWnHP8/2EhM9yD4/u3Q37mUHJreHRYl0GnwwWVlN69R43gIRKdvNnD
	 80T5J2Y6U0UOyt8EsOEvn40LCzKOhV2e8HPT6XY4zekU4w4FMG0RjTC9CcYXYMBffdMP3
	 zyygtYXiq88ey0jgT7yxXLOyuiESYyGqK/hb6jEG0l4F25cqYTfsDx+mFycuIUbasmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
	b=OelUbiqa/GjsbCstDuTCd/H+m4BgjlHFIGr6qxTKM5vWmQ50bzoy5+UiNzFR+k0gQc5d
	 w5fgLiwCmgZKZ6wFOv3Oc2jSGqSBLSDKDwvTlbJ8WS9eUednYPgqnKgtTpS77tGelvV71
	 OVG9RZIj714hLXZEEEzf4VRgdQezONIoQpVMqSprdMuNm5g1Re3t7RwSDgFDmdXMM6ikk
	 2idIPJ2XiSpHK8+Hvn9LiQpQpJ/mcV6L2eBFusS7d52by/cl/o9m8L/3b5PjB16lqzsZW
	 7bWzhPdtj2IBkijWIMIZH+ZTLwBKR4Cvj6PLyyyDs5wGZ6yzE/y10RR++AjnfbQaxew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wh7ZW6Wu;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891E60A3802
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3891E60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wh7ZW6Wu
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17311685e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008657; x=1793613457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
        b=Wh7ZW6Wufbb9/HHgWXkto90YwrR72qh9cO6pZovp5WXkyrdt9oqM81y4MymKRy5Ekl
         L5ZfvI8oq9QXBz/UFC3C7UaL5bW6nYN6/O3UlOgb7UwXkasDXPRt/KCcGHBCfww8zTpY
         L4PXQz59K1WRtu43BCX8CJCU1RJAaGEN7iJwV4/Esn+E+6Fqr7NBOJ1zqOo0z/BuEzi8
         EE2+ohgtyiVst5wWDO3npJiZ9VLcASo7NBi+UEMhdegKPEoNDF8i26c/3jiWpTKeYJW9
         cVCo/JaDJUng843Kkz4s3Xy/Am8vYPigyvJVM55m8xfzK7etfGTnUmvpBPfDo9FO/ePL
         izLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008657; x=1793613457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
        b=QVO1G3AKDLdTH1EgAPGNP00tKFUhxP600Egj/4YkdJtAYTCHo4BrcLoflokAc9HcJg
         V1mNThuxpJt41vl0tE3u/bw0IUZYwXTI4auTwuBsbUzOYmcHm0JhfDREnhsJKP3w/vGb
         PIj2z1j36t0eGfiYGLZxrWvdyOt8nS0Z5YgNzsswCcWYzjCUjn8rH0iFQBs2eAfQ782H
         duA3sYWs4yuR2v6vq/gwGmI1anL5tk8+njYIW3GJviJKHrsZ/A7dpWLz4/zpKiDbdXER
         QZWAd/gCsdGDzdQVDXdeuCDZMFs0A5fyRklITo0cHXiBOIRoAWvAlzrDSo6DrV6l1eyk
         ZSww==
X-Forwarded-Encrypted: i=1; AKwUvBxO4FyNi/RT0MQr6wLTxx8hfSQU3C2BE3UJvPSjXKW/eoRf3HUnmM0gOpaE14l8csNh7XbgGDQHPckX@vger.kernel.org
X-Gm-Message-State: AFq9FYKcUSEaGcaMK32QRWa7LROwu5u6g7TuLsKVmzVLQU6zxH8XWo5k
	7V0PBtZUWRlRwyYRD+rePvmHdyWocU88xaGpci36iKP64SNgMp25bSN5
X-Gm-Gg: AYBFou0tZ9MjYsRJIPXKuK3q3B+Ji1iR/fDwKe1odLesYKDSxX69NQcaT9hAF8DTG/j
	sTSOSTqIVeXJhNSllCPN17cpdfhYeWTnIRZWAsIoiK7zxvgFAeKw7Dabz2fbWzxTjZEZ/G+b1CE
	2rz0iKnFOLh7YH46zOmPQPJAhle/p7vMtJYUk75kJIx/1vOSWlHE87fEaTX0PyroomgL8GC6gGd
	hBWZUWPSnxo45xlmUf9aOoIZHDYbgS4hfwxPLYvBcV+4v4adGz/N5p7p4MoRvBbCnJqbScN9FKN
	QBtDLCMg7mfWi9U8uyiRAJFFAAK0TF3RWrcwl/9an4XFlOQaS4Zx6a8561qwPE+vpJIQCKH6wY/
	UfHvdSGsQQhSCyfa1gtj6eJnGnJGv1UNLGxvTU0Ci1mUUBmygthwSoLvPF2dA7zUOn0E8UEXbMG
	M8dPYcLjGK+PlZUuPQfgd0c67JHbtDII16RZF7AeQOCxXaMib2JQG1ioN7yUQDWhAgn1zrX5yvx
	n7LDts6GacKRNz3bJARQwwTwbHOtJZwiTfwKFDWygcMGBN/e2/nbYQEH9vJKW6gsCebKQ+WnFPW
	cpPPrqCR3qhsHybnBUgJCR0Kw00GiMgfslBjIvut1hoBYLjehk60v89OPEMJ
X-Received: by 2002:a05:600c:6095:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a35ac8bf3amr98760375e9.11.1793008657479;
        Mon, 26 Oct 2026 02:57:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
Date: Mon, 26 Oct 2026 10:57:08 +0100
Message-ID: <20261026095727.31708-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add required CPU OPP and PD nodes to support CPU frequency scaling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 177 ++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 83b30a340950..c5a335086741 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -74,8 +74,12 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -83,8 +87,12 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -92,8 +100,12 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -101,8 +113,12 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -115,6 +131,159 @@ l2: l2-cache {
 		};
 	};
 
+	cpufreq: cpufreq {
+		compatible = "airoha,en7581-cpufreq";
+
+		operating-points-v2 = <&cpu_smcc_opp_table>;
+
+		#power-domain-cells = <0>;
+		#clock-cells = <0>;
+	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&smcc_opp0>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			required-opps = <&smcc_opp1>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			required-opps = <&smcc_opp2>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&smcc_opp3>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			required-opps = <&smcc_opp4>;
+		};
+
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			required-opps = <&smcc_opp5>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			required-opps = <&smcc_opp6>;
+		};
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			required-opps = <&smcc_opp7>;
+		};
+
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			required-opps = <&smcc_opp8>;
+		};
+
+		opp-950000000 {
+			opp-hz = /bits/ 64 <950000000>;
+			required-opps = <&smcc_opp9>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			required-opps = <&smcc_opp10>;
+		};
+
+		opp-1050000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			required-opps = <&smcc_opp11>;
+		};
+
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			required-opps = <&smcc_opp12>;
+		};
+
+		opp-1150000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			required-opps = <&smcc_opp13>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			required-opps = <&smcc_opp14>;
+		};
+	};
+
+	cpu_smcc_opp_table: opp-table-smcc {
+		compatible = "operating-points-v2";
+
+		smcc_opp0: opp-0 {
+			opp-level = <0>;
+		};
+
+		smcc_opp1: opp-1 {
+			opp-level = <1>;
+		};
+
+		smcc_opp2: opp-2 {
+			opp-level = <2>;
+		};
+
+		smcc_opp3: opp-3 {
+			opp-level = <3>;
+		};
+
+		smcc_opp4: opp-4 {
+			opp-level = <4>;
+		};
+
+		smcc_opp5: opp-5 {
+			opp-level = <5>;
+		};
+
+		smcc_opp6: opp-6 {
+			opp-level = <6>;
+		};
+
+		smcc_opp7: opp-7 {
+			opp-level = <7>;
+		};
+
+		smcc_opp8: opp-8 {
+			opp-level = <8>;
+		};
+
+		smcc_opp9: opp-9 {
+			opp-level = <9>;
+		};
+
+		smcc_opp10: opp-10 {
+			opp-level = <10>;
+		};
+
+		smcc_opp11: opp-11 {
+			opp-level = <11>;
+		};
+
+		smcc_opp12: opp-12 {
+			opp-level = <12>;
+		};
+
+		smcc_opp13: opp-13 {
+			opp-level = <13>;
+		};
+
+		smcc_opp14: opp-14 {
+			opp-level = <14>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.55.0


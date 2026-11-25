Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643756;
	b=e8hNR1QQKTOk6OIqk0XfAvihJnXcFAlQpPpTXETeU8AeLvYz/hqzWoWPhJgSDwcgMIKW
	 qYw58hNyCGX+5HTMUseL2fUq2ENLWYsfMhJgEq3ZXDEcvjGVipi2F320RMFkrNsTaDgm2
	 SzOrZnvzYQzrLBVjN9FqkriXcfZtMtbXliLfy7VSYr2Zpx1xr5DXPH2x31RMEMkZqsWDH
	 eutgXQ9DaHK/d2MLSuvx1J0cTjqWxkmQf7eJ18C3ibinZvFBrPoEoWaIJcqzcgagXTbBX
	 MdYptouMF3Env/4e4IkhKbLxffJaG6VDfeI1Z/vvJgnPy7ZFch9+YlzIatax3y9UsJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wyP7vH2rGlbYhb8q27/m4UJghzd8eGwKK/Q/LPzbUrM=;
	b=BGarB4WluteQWOMNKGHM8LLh8mbioW5HMeUmhn2oTHUjkTAmrCZUCG5p2qFogFioTSyy
	 ssa9mfnRsepzmozKKLUBTWRjG4gSFjluTWxwdDGyOaz5NUWAIwqA2pfLYBFLFn+Myc7SV
	 PlxanVuqoPjbijn8XGAWbD7qLUuBJ2XkWSSjYJMBYzaXHy/AAuNSs5b+9hRaRsr/iX3Zv
	 6c3cwu7OBVJHqU0KngPmyVXQ31ARG0vETNFYBRejo5Z5bvzhE0fvaeRTCSkxn0OzL3fNq
	 39cT74hBBP9UTxPDjMtX20VI8xx82KcgphuPVprjetppRd1zxfuUGEkzNlLIcFzq+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpBzx8g9;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F9606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpBzx8g9
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so7888009a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643754; x=1796248554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyP7vH2rGlbYhb8q27/m4UJghzd8eGwKK/Q/LPzbUrM=;
        b=MpBzx8g93Uj8Ruy6RhF/in7IdZprugMOEFUfAZDRaIrjPOdZUZq9XsDQ2SSnsFGOz2
         EQvQuVnTQnPQ23H0ERkowHhW0yTsOv5RR818+V2z1TFdHne1R7OzQf28D/KdNx87Se33
         /3HJNGeIvVtLK9ctktr5ipsu2GPmb5Zzp0yHQjucklNfC1LIo97ZhjBUENwdL45IzXmp
         Lj5ObQ8mhFPlZetzP21vaFRyIpMcxkp2Fjv4zzyvMulQkvMJ+heiSHh+oFEyTThMC6CW
         IhnD13e/mBZO9XUUx6GG8EJehae4Cy/Jcp0x4dClozTx++VvrXyKe1n78BcbFe6bM1l7
         Qyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643754; x=1796248554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyP7vH2rGlbYhb8q27/m4UJghzd8eGwKK/Q/LPzbUrM=;
        b=tdO9olNTMLQ7uv52170xo2DupDD6lEyaFPIdHwzK10J4LLJXx3t8j5rt1n+W4Lz0KA
         sNLymvjiJ5NOIWtwU+QzSOu5iDU0HDUcY6Z/ReV7TORqawp2hteJCKrNHOI6MtkNuD11
         mnJFs2eozIo24tv92lRn1WHbOQ9Iw6BJTxfpyMXd7ENjXuFQd7Jda4mKZdTx7qj5xg5y
         HqpuI5gnUkRTOAqAZAP8aIKz+osmVYNNxDVQeugUPr6Iv8f+QLZEfbT8EkWPh8QtGTCi
         G/I9dmZ/z8azzroiSFExwzhovyFbGPQCJdaVx/BkVS9zZh6HiBlTufcv0kTWTdaScofl
         1u0g==
X-Forwarded-Encrypted: i=1; AL+hErHiB7i6n9OZjagH/FBkTeGu1Gs9JidrQot8mKlk3nBLDej+cl2gKIWEYHZ4mJdePE2FkDg9BM7Gms44@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oyu4APLoisyH/tPXpR/MHVU0/rdHpDcrFHrnb5qzTfyoVYdm5
	v9adUTe0BSj55yzUYkmmeyLvUBEAJP7YCUeAjP0CgEKkwDrXXMUXJ4A=
X-Gm-Gg: AZFdTZeWHIX/DELXK/d4XCXrzeytQTeh2Wd9GA/B0c8KsDwftP9ulaFIChc0OwiWy6J
	6+/D47Fb6Ngub+RZgJKZhGuaCmp/GkeefpqblOPmT3s1m6Ic5PPLg1y4Fl10p9ZnIlsg1cfjypI
	VcnMcTrDmli4OCuc1TtfKlX/c/Idt4l0ij/fYgFfz5dM9NbAl2CvskHaHsSbTxydkx8g0KbFmD+
	ho2mURe7+D2ZR9GmM1T6XTW/1Vgr8CJOxP1VSs4vHnKh0yNA1GBlHN+91gX0kJclYck0MCdX90w
	qKdAR5bfGrQu3uf1JZPKL1SxNZujhXlk5DQWck2PFBntq3HktfE5Ob0ZJYAPeMI8a9+T0n17OAF
	8kHs3VqugFmMTXViGu5P18H49AOrco0nj9/1TBddnG0Z8IU3NLL4myCfFLXxLpIzXmc5am7vSR6
	rYgS8tkK7YIUZO/IUIVu9A6vzEZd95+4mr+lVRwqCXfcy8JVi2TizhCMy3/b/VDr5Rmp5LLPGo+
	4cYFOxkINDw8bKLyVSVkCV2X6qCxA2QpIIikIGhkEQbsTI9hSavd/JUlZHjfIAQ56ZdD6MeHz50
	KmIXrt2tbJYCwtmyUx7BvdwvG71vVMFChQenM8SM+hZKmAlSOrm5sm9b8iGIs7kN4Zy4C706LqA
	YvVaGfVLs3NMCd15zCQSANsyJ
X-Received: by 2002:a05:6402:22e9:b0:6b6:edfb:5885 with SMTP id 4fb4d7f45d1cf-6ba37c75eeemr11786385a12.1.1795643753754;
        Wed, 25 Nov 2026 13:55:53 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm8608871a12.14.2026.11.25.13.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:52 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Roman Linev <admin@mswin.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm6125: Add cpufreq-hw node
Date: Wed, 25 Nov 2026 22:55:49 +0100
Message-ID: <20261125215550.1834075-2-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125215550.1834075-1-majidhhdri@gmail.com>
References: <20261125215550.1834075-1-majidhhdri@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SM6125 has cpufreq-hw (OSM) blocks at 0xf521000 (silver cluster) and
0xf523000 (gold cluster), each 0x1400 long, per the downstream
"trinket" device tree. Describe them and hook up the CPUs so the
frequency can scale instead of staying at the bootloader setting.

GCC on SM6125 has no plain GPLL0 output; GPLL0_OUT_EARLY is the PLL
itself and is used as the alternate source.

Tested on a Xiaomi Mi A3: policy0 300 MHz - 1.80 GHz, policy4
300 MHz - 2.02 GHz, scaling with schedutil; a single gold core holds
1998 MHz under 7-Zip.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
Changes in v2:
- Region size 0x1400 as in the downstream device tree (Barnabás)

 arch/arm64/boot/dts/qcom/sm6125.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 5f558b548..cbc500d69 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -43,6 +43,8 @@ cpu0: cpu@0 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 			l2_0: l2-cache {
@@ -57,6 +59,8 @@ cpu1: cpu@1 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -66,6 +70,8 @@ cpu2: cpu@2 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -75,6 +81,8 @@ cpu3: cpu@3 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -84,6 +92,8 @@ cpu4: cpu@100 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 			l2_1: l2-cache {
@@ -98,6 +108,8 @@ cpu5: cpu@101 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -107,6 +119,8 @@ cpu6: cpu@102 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -116,6 +130,8 @@ cpu7: cpu@103 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -1633,6 +1649,19 @@ intc: interrupt-controller@f200000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		cpufreq_hw: cpufreq@f521000 {
+			compatible = "qcom,sm6125-cpufreq-hw", "qcom,cpufreq-hw";
+			reg = <0x0 0x0f521000 0x0 0x1400>,
+			      <0x0 0x0f523000 0x0 0x1400>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0_OUT_EARLY>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.56.0


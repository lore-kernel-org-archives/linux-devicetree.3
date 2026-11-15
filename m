Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702731;
	b=sw0w7xHVHJ7YHzUCXnpDfdyBXlwSBUSjuw5zXDz4mBzDu3WCKCymvWzLUA0+Y5GDDqCA
	 mzO46VmcOySp4R6X7tEIt2s8IU0rffubJiDWh7xJpxpqOA8ZklfoZaobbJXR98Iy0QAgQ
	 lbP1hQSuAEq6s0b4M3WghUANYg8Ip4AGcy+E9pMA8wr+Se/2xcYnwpCc5FKYTC2HBoI0H
	 P5nCbfg3IZxW0mFAU4hCs43oydPO4cs71+1ae6DwRJnx6daU8pteZob2QCsIaoKwu8Iwc
	 utT46ad9NG4pMfbWhbYXdhAS1TSOHOEZ5hcHpHKECcYrsFBdoux0jWdk9SwO3nyeLaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
	b=pXCvlNFvTzLS5x6Aj+QC4Hy7pZewn32T7QvM+Hqrb+F3+s8DI17oJRfoPdvP1Ghm2Amr
	 MdW4jGRMczDFYIFSoVZdziRP7d5X+KEQzoF74afN0BzM6a+1wVuHOWcrrzH/LDiSKY/1V
	 YbiU/lCUksFkvzxXVSHI/+O7pwCkEbRsRbUcjst2lBj5g7mq5J/OQ/3W7f+OFIaYue4wp
	 ADqHmbw9yHbz52bi2nnVyiGbzY2+a5EPxhMmRv8HgVkARPWMuiFU+iUHIlkgvjj6C7y64
	 aiqOK68vyfsyjyw930AJEOpsliu7VJJx6injkBZcHprk52h4Jh+/RYYmFMrVLzJzbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+MAAQqn;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947C606A899
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B947C606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+MAAQqn
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505186727fso424887066b.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702729; x=1795307529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
        b=I+MAAQqnmdX816Yuya9hYCTG1HjEcrD96aKoQbrYdMjff5KADXulZWqJpg66oJy1zG
         yuagg7rqaGsybkAKhlX15mmm1bEMZFz2D2rNI0rZcYaaPSbRV5cz4taVJ4waTfHc44/3
         XmGc+XX5lLLPBL8jt6DQSVVzK+JqC8njNusX0d29uCM5HJlMtUH5ZIDlubk0x53fqX7D
         aR5ExrfbHMlrTa1s6EIsR54gkUzfSWyX73bZIYnd10l6OERnBkF4GjT64T/DOr5pDCgZ
         p671Mw+++D30ttsUaxYspVeYxl3NbwXYNlveZePNB9EG1ste+MRqEj6qds+Exo9Qh1tO
         mEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702729; x=1795307529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
        b=AzSlEPvuJLH+j1A4M/EUTHq4sdNyNpfRaM9M6C4IZbqi0QwXNnNo7i1sdNgc8BQIpa
         g85BpH9E0dPTvJXJUd4rQ9Sxrmn+SNl8wBfiptV3dwcldAcD5d6iWO2qsQSdy8OSN9Vc
         W0PSq9vqPpOEMv0Km1veqMBDnIKW7Kvt3AB9nFeQ7DmECSACe/9sMlLaCSB3ag2rNG3D
         FpddjxAfOiMUfmUvmcriDLrbGgEZEll1JU68d5uR0+tuxyhh98JLOuifCUPPZL637XkC
         jrevTM0f2ps/kD+CJVRg1ndfDdIw3XtI4Dw5c7WO1BhBjyiVTn+kesOBhFOS466E5Lb7
         1ccA==
X-Forwarded-Encrypted: i=1; AL+hErEhAuTG+nvLF34kQR2nJxrSpurmK7Zi3K4pTDdwGMaFwLIwSmT6zGyTP8pWzNod1oPaJl3NT4Zhdu//@vger.kernel.org
X-Gm-Message-State: APuU4Z+GYBzXBBKpvZZNo854tMS9r02M2ud9sRKPnI4zwmXd4Y1y1fLN
	H3u3FFI18I0BRtnMuq72/L0YFlwshjpdDH2mC8LnDAOjkZpj/Medy8s=
X-Gm-Gg: AYBFou2WK0ZTkT9Nsy+LsdrfCkS8O12Jt0uEsyKYg65X7plLsdKJa0QRzENySLrPc4E
	0wv3qLSM5H9PGha9KyXlTZc5B/o5MWpKp92qohvLQ3DJaEfZpncX2mLJMVZ/dQ39rrlUH37jFo3
	gR+dP23VvQrNM7U1gufxzoPo3LoTukStrqVnADL4ff6HokL35WNpkbSZKT2NP2JLwljaITz4ho0
	tFX4HMLFlhPv9bH2lXrdDsRGgyBi8F1D8VOsi8MvhX/iaxWuaqvLbFEdZIP/t+TjqsyXEzVAMK5
	eq5f71bXK66gmNU44U1gej0h8pGkz6gJM5lhO9ukSggTkpjCyv+vXCZzOf3cT5MnHZBuPBfQt/6
	l2M1H58djjQRBEdei+O8v2egO2JB3DNXBu2ip1ftGBrq3KHxj6xHtY8hCAr/at7K2hnzj2uaAUO
	LP60ibOSyIqCs8sMX3+GKdCaN4loODwjOu71zYWLLk18SH8DudWIESgJ3f1DEpga1VYx49ucmJw
	3fRsW+DTJYHg00/sqikRFwtkvrb3DECd7qACipkh+n1VVZWrXFL/Hkk56KOrTU1bt/DLpuVIyKU
	lyT8OQI30MxT5Iz1cBeonjZqeGlXpw+qJwNkH4Ov5Akz/Aj8eBcJJz72GzxoG2XcwH9cvQwQGkn
	PTbBLqY3FXtovzg8kTjHfB7cfJ0wgaLJOVuc=
X-Received: by 2002:a17:906:9f8f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50963cf771mr521124166b.42.1794702729152;
        Sat, 14 Nov 2026 16:32:09 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:07 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: qcom: sm6125: Add cpufreq-hw node
Date: Sun, 15 Nov 2026 01:31:57 +0100
Message-ID: <20261115003158.391171-3-majidhhdri@gmail.com>
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

SM6125 has the same cpufreq-hw (OSM) blocks as SM6115, at 0xf521000
(silver cluster) and 0xf523000 (gold cluster), per the downstream
"trinket" device tree. Describe them and hook up the CPUs so the
frequency can scale instead of staying at the bootloader setting.

GCC on SM6125 has no plain GPLL0 output; GPLL0_OUT_EARLY is the PLL
itself and is used as the alternate source.

Tested on a Xiaomi Mi A3: policy0 300 MHz - 1.80 GHz, policy4
300 MHz - 2.02 GHz, scaling with schedutil; a single gold core holds
1998 MHz under 7-Zip.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 5f558b548..1b148e453 100644
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
+			reg = <0x0 0x0f521000 0x0 0x1000>,
+			      <0x0 0x0f523000 0x0 0x1000>;
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
2.56.1


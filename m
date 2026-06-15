Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F425389E13
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555679; cv=none; b=TckqwU/SYFrwEK1z4rY1PpZp/dDpbDIxquuoel+lmCxym6l+0MSvhbdMxrYiiIfihsexFRxJcTNaAzXVoKWHAClJzw80SSl9igq5G+I+BfuIWgWKTJndnvxaijtl0r7S2nrVLDDEUz4LcTUvoyTyA091kR3KHSFq/E8FmuYcJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555679; c=relaxed/simple;
	bh=DtOWUCEOYn4g9JxT/PZO+XX7FO9qvojsnEYX7Sk1qCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wf9t5o9thS9hY46igIrrOXnpKIpKCVO7O0hFxutUZroFXmypp8CN0EkUqXpUOUsX+6k2MwFgGceSuOokrbzaefYC0RxCvaHO2HTxspTvZILvecCFiJ5MpBgq2A8JInnvia1fcu+xinjdTL8OpGNXQsKNgKtOqkn39kANDSWv6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qxo89C5U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qxo89C5U"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac10e337so26135575e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781555676; x=1782160476; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlEk+div6nGGh0ueIq6wYoXxweMlzOM7O4EcszKdFpY=;
        b=Qxo89C5U9b6+Hz1w5jELSLd221pjbcNfXKvrEBLqpyRCLu2SIdowQkQ32Y/GD3lzkj
         5Z+QlUGhVCpYt7YWo4Suq2wFIpbBJPc/rTgWit+CHJmW6M2vq9LK9k/6Nywadh3OELe+
         jnQRUgGR44LO8mxmRDVu2ynsg0JMhGUZSFoFXROhc6Qcjs5B5hjyDsGbvDJ5YSxo+voJ
         VpVS84iGiwoYgG8BJMt3mjOWnRm2IxqS8MLf0a2L8ImwtDhDjkSzMfoZh+5rj0cnOvBH
         qqFbHKnv+nFLx8Q0UzRkw8DWirjAMu3QK8BD09rkr+n0GK5VShQIR2GnyA+dBj9EjlLQ
         vfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555676; x=1782160476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlEk+div6nGGh0ueIq6wYoXxweMlzOM7O4EcszKdFpY=;
        b=favcP+83YEh90zaIUderpEYP/JzWPWWzaAT5dbv8R4bPLpQ4Xp6OlBRPiYH7WNxCGG
         hqVebFC+lpe3hq+xL5c6iuFmfgvuq3BZWQjG4Lq9TVx/PllzZkkWOJfDjg7lCpKvv+Lj
         KhM9Q35n+tWHwAXwsLVy5r1dKb6vOzbT+oIqXoyB1rRO6bPwmBy7iJ/KedlLYCErgcRh
         SpAJL7grv+O64YRvDs6/4o55nwf5whrkC9Ee14dsmN+dGInTjCI1KBzJeF+MbkCiUVKX
         sjr3VFfwEteXthqwDEqaaco6v2PyYaZm8dFJKuvOBlBjcm9OK9JBQalAChD7q1keCUM4
         RubQ==
X-Gm-Message-State: AOJu0YwGKZOjcyxrCy1VMQeCtixIsIxmOwg+95wsmKsvqnRTrHnYrUBn
	joR0bN42j2rkENNvPHppm21S+RBSeGHZz3276K/dM35Km7LvIjB9h4oT
X-Gm-Gg: Acq92OHAXfU+I+aFhYUoTCW1kraSi4wVs16nLbnSm+zRS5QN/11prw5MgATs6tUuNV2
	OMmKg5mtTVEYEbVCNWnvRm1jT1Vos1tc7dUh/8aMBra15/w+oGB5r2HqS+jlWotn0zCTS+RXQfY
	9G3tvhZ60Us+5Sgr9OZ+VNUMwAljD9EDcMDCQ+F8GqXfUG7IoEblMeJ8uYoJFb1GnBa47VMqmHX
	etHmo80uVFVyl/X/B++b3ba2chsdXVkMzxopsoe4Z0zhJSwVaqlNZRVyPmd7JIe94U3GiPmz2uh
	PfYBHpv96Z9Tw5gpWgvBzXHwvDTsTyzv4K22CxASOzjsrEj9tpleGcmuS6A0IHRPSoWd2e8pUCE
	vs754vq4s9zyWhHalZL4X6Bk1E941f1ZokJAfzWhxxl7CkquC7EosDp5v9RuSJ1TTa9/qcRQVN9
	VICSS2bL06xlzfNC/BcksoqwksgRgUMIwx+ln0HrYCROMIdghOIAJY
X-Received: by 2002:a05:600c:4e0e:b0:492:2e1c:1d19 with SMTP id 5b1f17b1804b1-4922e1c1d3dmr48342575e9.31.1781555675807;
        Mon, 15 Jun 2026 13:34:35 -0700 (PDT)
Received: from 10.0.0.2 (82-65-243-93.subs.proxad.net. [82.65.243.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922f9cd140sm18001655e9.0.2026.06.15.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:34:35 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Mon, 15 Jun 2026 22:34:34 +0200
Subject: [PATCH v2] riscv: dts: spacemit: k1-orangepi-rv2: Add cpu scaling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOQQ6DIBAAv2I4dxtAIdpT/9F4QFgqbQMW1LQx/
 r1om/Q4m9nZXUjC6DCRU7GQiLNLLvgM/FAQ3St/RXAmM+GUSyqZgDsDPUw24hNC3ITBQZw5CNT
 Y1ILJUhuSt4eI1r328qX9cpq6G+pxy/2MXJnyyfGv9S6NIb73f2a2TYmlJUNWIpjGCqhYpaBrK
 IIqjVCSdrWh4hz8w3k82kjadV0/ViVhtdcAAAA=
X-Change-ID: 20260615-k1-cpufreq-orangepi-rv2-5ece985163cd
To: Shuwei Wu <shuwei.wu@mailbox.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Vincent Legoll <vincent.legoll@gmail.com>
X-Mailer: b4 0.16-dev

Enable CPU DVFS on OrangePi RV2

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
Tested on a 2GB RAM OrangePi RV2 board, patch applied over
spacemit/for-next + Shuwei Wu's V3 series.

On Void linux (musl libc):

uname -a
Linux opirv2 7.1.0-rc1-00043-gb860bca13be4 #14 SMP PREEMPT Sat Jun 13 
11:02:13 CEST 2026 riscv64 GNU/Linux

awk --version | head -1
GNU Awk 5.3.2, API 4.0

echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.300s
user    0m0.299s
sys     0m0.001s

echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.432s
user    0m0.429s
sys     0m0.004s

echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.476s
user    0m0.476s
sys     0m0.001s

echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.582s
user    0m0.581s
sys     0m0.001s

echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.778s
user    0m0.773s
sys     0m0.005s

Changes in v2:
- Fix indentation with TABs
Feedback from Yixun Lan (dlan)
- sort includes in alphabetical order
- use b4
- Link to v1: https://patch.msgid.link/f031e13e-d9f5-414a-b90e-a3d5a60b8d05@online.fr
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 35 +++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f3..2c2542e02d6a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -80,6 +81,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -162,7 +195,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

---
base-commit: 32cb211965ea0ba0ab8568959f006c7fa10e9f23
change-id: 20260615-k1-cpufreq-orangepi-rv2-5ece985163cd

Best regards,
--  
Vincent Legoll <vincent.legoll@gmail.com>


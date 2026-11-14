Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675146;
	b=LXBmruvjeBSB+isK7Vh1b0UxP28bW6DPY2vKiOWS6R9eeAfxgPQhmYMFMzysCZzDtP6x
	 NjCiGnkrj1ZUxOtnr1bW7hBehIVheNRwAJ1u8ptB6FpLZ0xwQ64/j7OuUuMP9rrquA9d0
	 VmdR9//9bUu3GcEsUqIy03/X8pgGHCtGHsiHhldXgsz4p+LjJzWCxMQFOgagS/pOFqrOg
	 xw+9R2n2zyTHU18XvZK518ByAJemd7f4ppZGzFY/h3JWbZBQv3KZn98K9uG/Z88MgDK/D
	 3rJGC5qQpsgl7TW18vr9yzq30HDr6OH6rxGTqsZ6TWTplkGFgQ4MJv5TiHpkuf+A3oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQ/h2xJmHfHF1kr2P2KfFjzjewHnVPr88Pq0nhSFTMg=;
	b=v7VHORPY6jgEfGAgBk6sc4khlE5x0LFTfTh4qgEd9/V1RVlDXbo0VxAtBfPeDQ5aT1jP
	 sto5XQtsSnI6WSyahs787t1F263S6heGiQuwny/hFh5Pc/3IGJn5SE7K5w71nZqKDbzNQ
	 knYVsEbpZOBPG6GrDJrNxHlHgSVNoU+EkLKqHWOagE7tjsI10qlU3VHWtoqrZD+OXIItw
	 BIBpB48neCxOwjPCXiZ5JAbOeRX4hOUFWKcs/+RpeNoPXf4FmSEFYHooB8TgFF1UKQ+ps
	 lcmS62egsGaWUKoeOhXGphypjgW5wVfX71NL0AW8DpEwbhO0sHMyUxlXf8RvpHDuZ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tdr/SSph";
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9E606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C9E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdr/SSph
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644ab1f7bso23814091cf.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675144; x=1795279944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQ/h2xJmHfHF1kr2P2KfFjzjewHnVPr88Pq0nhSFTMg=;
        b=Tdr/SSph4bL3uPoPNTAiRt39kpSkq3axC8GHbRy/sVm6783VsM9QjvdkO9U9lx9p33
         j7ABSqraFUxV01ofQfM/5QnuGJucaLcpnxSGJM9mNsjFXPtDL+nyIRhDKs2Y/+8K4wE7
         n6lAuwc9tcMJZ3PUA/r0r/bq585EO1qnbROUv+BQI9QI8FvlAo1ouSD25tJCV3lQwqch
         dHYnmv1luoRdERcx3e9zuaUv1p8yrluWRDZTYpLh6s3wDULEGPscFl7KdXMjQtN3eUsx
         z36ceq5+TBEpDr6TTmVWs263cCOEOyiqw7tslymuppTTTe3uCb8vt7umurRZ5q6DnJB4
         rVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675144; x=1795279944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ/h2xJmHfHF1kr2P2KfFjzjewHnVPr88Pq0nhSFTMg=;
        b=2QmBjMZcXSt/tVehrrWdA9Ozbob0968NBD4gWDXNY4wQk1vphyT1EWWjRwCCiCDXol
         0llcBpp/e/o4iO9nd1OUztZloWBXtiiQn7XVcersrYyMT8UymjN+W6MtSNC3O48Tu3SB
         UOHfzMfDQ35rtLax2xIFcl26UeBk9zCPgLidm3paTBlSvPGxt0DUlOFtkNxx5fltbuBk
         p2CVsxr34T4CpbxNsCOhO7LWPXCWo/2isa8hmZFQdZM1lJWXLP/Nc4a0BaDEIDEOsWZq
         PfEtCJrmb/l49IXZoLv7B78ceB4QlWam4gbXwt1FNQimL0q8+ZF97XJkAeusfwZLe2D0
         ROuQ==
X-Forwarded-Encrypted: i=1; AL+hErEOGp3++xEBRRWQ/pbUAERu8pVDI3tKkYe+V6iBqYJ7c49N5ABXXStHQiSft3oNlhzEaulNjJFodE1I@vger.kernel.org
X-Gm-Message-State: APuU4Z+i8qZns3y30Yz1aCojvqqKg4Sc47y6LPW7xvWm5XDRedxKiE/7
	6CIAfRwDlrF0vAy7V/qh+Pdt4+mtju+mtnyopQnfWgc8BjexYwpeid2P
X-Gm-Gg: AYBFou2RSh/CUYwA5/K6rQq0cwdBaTisaq3hpaVYDZWzLOcIyMvjInEHXvgcBuGlsHL
	wZJkAiIb+fzKqPMxFuOA+udbsxWx+y3OgVgoORXqCP7lmLnXcffU84luasOARfmv4FAHRoAX2YB
	URY2qtRII4nUo5EuR0hdDXqmZ6GMnd8xZKCMm3mDbKloXQ8iAgs+wFydfZdmAnix/j8elbJyN66
	uSY4qmKpqx9vYOPzAa652ePCuUMf5n2g/ujmdVbfMeP+i/7DmA4lTh6qlDWxveo0Kn2PlNSAGsc
	4QHqhXzwoc0kFGXxG+tfAFTt6vqKO8wuuVPLhFxCK8M+o/ELiKWb6EOYmT0yvCaEjL01Anp/Ih+
	KTQ20HyEEB6Ly1rHrjcHQcy6sWPjnvSOy6/e5OKIa4ftz4jRg9t5zyfYZDMIV+uOFGGRzqzNKMh
	H+j6CA8Ndcj+LdSiBVH/AjrxYrldECjk9T4SJYBZJvY8E6kdHDTJcLyc8FJvQ/3WjbmeXIvkK2a
	O6IrI1MbtrfShqQAeRBO6a+63QfsnH3gQ3Y9s1AIn8m0qoYiCow55TyFF0Y3CjkxI7M/VpyO2sP
	cotSGBHvs4eLfqVfXXiPNG8QCWOYBHXtKQhX54/frcwput1bst2PUYDHphtpJKzT8rosNerDyWa
	YWA/67kCF/Z1Ctyb8fWOi2TNpsuxo9kUUZG3jZXOUkCpbM+NNPpvw7+Vy0ns7ijTvel8ihCSTkV
	aaswgpw2WO93sv4X2oA4o610wHHwVOe+wkEF96RtWOycs7oRcDi94JD56slfn1jIpW9y9Wpi/w9
	de5oDjYhn6q63jVTHiiAPPKCiwn4/s2q7GbVMPlWGmZzw==
X-Received: by 2002:a05:622a:1ba1:b0:533:3868:1f6d with SMTP id d75a77b69052e-55ac8b998b7mr99136571cf.59.1794675143733;
        Sat, 14 Nov 2026 08:52:23 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:7961:9008:8b93:d491])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d2df66cb7sm2635421cf.21.2026.11.14.08.52.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 08:52:22 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Describe BOB1 and the IR emitter
Date: Sat, 14 Nov 2026 11:52:21 -0500
Message-ID: <20261114165221.70310-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

PMH0101 BOB1 feeds the PM8010 camera LDOs and the PMH0101 flash module.
Describe it, and wire the IR illuminator: flash channels 1 and 4 ganged,
350 mA torch, 700 mA flash, attached to the HM1092 via flash-leds.

Values:
- channels 1+4, 350 mA torch, 700 mA flash, 1280 ms timeout: Windows
  LEDFLASH configuration (FlashLED_1)
- BOB1 3.384-3.512 V: within the AOP OTP limits for B1B_E0
  (3.296-3.520 V); BOB2 is not populated

Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
Konrad, this goes on top of your A16 PM8010 and IR camera commits in
qcom-laptops; feel free to fold it in. Tested on a 7.3 kernel with the
same DT: ir:flash probes with no faults and lights the HM1092 scene.

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c2ecabb3..75018ccc 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -379,6 +379,17 @@
 		compatible = "qcom,pmh0101-rpmh-regulators";
 		qcom,pmic-id = "B_E0";
 
+		vdd-l6-l7-supply = <&vreg_bob1_e0>;
+		vdd-l8-l9-supply = <&vreg_bob1_e0>;
+
+		/* B2B_E0 (BOB2) is not populated on this board */
+		vreg_bob1_e0: bob1 {
+			regulator-name = "vreg_bob1_e0";
+			regulator-min-microvolt = <3384000>;
+			regulator-max-microvolt = <3512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1b_e0: ldo1 {
 			regulator-name = "vreg_l1b_e0";
 			regulator-min-microvolt = <1800000>;
@@ -624,6 +635,7 @@
 
 		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 
+		flash-leds = <&ir_led>;
 		leds = <&privacy_led>;
 		led-names = "privacy";
 
@@ -751,10 +763,10 @@
 
 		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
 
-		// vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
 		// vdd-l5-supply = <&vreg_bob>;
 		// vdd-l6-supply = <&vreg_bob>;
-		// vdd-l7-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
 
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -1037,6 +1049,19 @@
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
 };
 
+&pmh0101_flash {
+	status = "okay";
+
+	ir_led: led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_IR>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <350000>;
+		flash-max-microamp = <700000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pmh0101_gpios {
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio14";

base-commit: 2010e0d9557fe1d37d04f13e539adf24cbb785f6
-- 
2.56.0


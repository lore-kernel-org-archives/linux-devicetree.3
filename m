Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC2426D0C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633544; cv=none; b=DbpOkv+6x0vcHvS3hVoHAkJ/bRNerfq3YVqkfgFCzRwCw4DBJTGrlEx1wS6K23HMfpew1isYZpjPVdGqBps0qLWblyey+ZDjSjRU3PrGNHCrPYZd3yDNZWqLvfgFBLH7TU/Xvjp5OaIoivgqEYEMju7yfkXeBd16VZ4Ko/ndruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633544; c=relaxed/simple;
	bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/vfwynIOPtAlZI4qmEviQ6zeIYCrjQGtdz6GkVsJhOlZj+jGunAx3gxG/RW9rzJxDjxRW+DzYE6FdwmaBKPdYOlsG6YGCfzYEEEbkYi6Wc8nFG4vDF/sMak+Bjmbs7JqbDanQObSKqSj+VlO83BOsB2oEo0SVjtx3T0ccGg19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IDVJg5Aq; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IDVJg5Aq"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so87122366b.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789633529; x=1790238329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=IDVJg5AqZ5Y8c7H7zSYinlG5tIi5AwD653xe1nqKmyj7tZsrPP9eDHFCoxu5+v78XZ
         z7r//+jXaK1ItG7a4lVzO7wNdC8OvvPBW9rwzaghfbZRGCpL9OTTXT+bcu6z5nLUYjdJ
         yCOwUOpys8DQEkxk8s5PQcVfCbou9UeEz85BbUOsCx864wVz6ta7gT4ZNFL96mTKSDUi
         eRchZgctIDCvFsKTcHyJZdQSHo4jymsw3XwHlA5L29oFrH6slArNj5p73/AN3O3I+QYI
         1HhU7ixTJPSeHDAq8b2G57TiwRcAe+fmO95w8JTMSxTzivHi8kmnrlTAYQHLZU/jDnAy
         dzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633529; x=1790238329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=azZtUVrPvPqDz60tKoQPQw5baFGsBjlfloJlpg2GrA9KIZ8oXIWpizkDV7GK7hpWwE
         YVMgoZQYx29kG28bzELbsKjjyHri7u22a/HJOyK1WuD2CHsz6cYaIev42oUedvP5XCUX
         UDJ+4tYVzWgdZN05mGpEDKI2w5UKJBeHdXwGkbGJjMBqysmlEHMkrxyyS1B/VxIJZM3X
         PBr1QSoPAn18UqH9xQJ0XYJ3H/gVtuoCwfwmiQCXHoHPNNIH7Qe8zZUWMinkFd1E1j/r
         Q5S8smS4bvuA2hgHxxFlffDfgS2IZG9wEzQhz3JTduS9MbEHdprcYXx8nFihTX/fbARE
         oznA==
X-Forwarded-Encrypted: i=1; AKwUvBwU3RA8G7dOohaUcubh4EG+Ic9X66hmtTjBw83akTn7szjMEiKFjJd48W90VDYvWEyS/+0kku2PlvHH@vger.kernel.org
X-Gm-Message-State: AFuF++m0Wx244crZnTrSDdHAcpG4luLIFZj2nfYe1YiMiPlyArGWDHL3
	Btt/45/GblgYxMn6LmSzoumVodRo+UUFUQ1BBkw5vvS12YVr2xDieX+TL6Ir/+k0zxkST3R/W8U
	mUB/F
X-Gm-Gg: AYBFou0tFFsOcFU3Nn8B6wlGMTBtjfmvrfyXdRoPc+QutCOsmUHvtx2mAWvh3qNqi4B
	gW/dqjvPPe9EqJIAwqwq3MBYf0me3Oqa4IMbCZxYH76b0dhc25Q5q+bkfhMpanuFw9rKjR/NNun
	j6bqY+HwbEQ2tnYS8vUWWNXHf+YvWrIhfoBJWw2+2s0hKGeq8EpJn9bBi+fCX38wgTJccsqIieD
	P8XEOd7UFu3nkuf7aty+lJxb38Ktr174mNCAkTH0LW13NUz6NwiOgDHJe+gKSiSkYAuiGdM8iql
	vzE4JtITmrVtLfyZUdJEZScKp1rDEYX68NcelE5xFKQESUDEKfSRE21kry2z/vl7PGBXhlaIqBM
	zgmJdDEEZYz4N8KKLTR3Meb+a64oshBU7BsB8kRE46qiIY1sXTPtYTkSsWTXnVHjv+5P4hZIAcH
	yKS4BsA9g3jv35aDMIEI3BiVuJC1V3GR+XLUh7T/bMzavA+Z4IYrCtRF7uavc/lwZvC2EoEif+X
	5PjJypYNVjvfLbMLEAC8rfCnaZpj+qDj35dtiGh7PAZgRseUnr8kw/MZm5D1Hc=
X-Received: by 2002:a17:907:7205:b0:c29:59ea:5bf9 with SMTP id a640c23a62f3a-c29e52085bamr405665266b.14.1789633529521;
        Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0851ebsm242943966b.4.2026.09.17.01.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 17 Sep 2026 10:25:25 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-eswin-eph8621-v2-3-f534080a6338@fairphone.com>
References: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
In-Reply-To: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789633524; l=1602;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
 b=UXnL3U0l+wxPa6dEX/B0T61AEQAmzOv/3SA2eDzB+9GPdURRWB1b9TGmZdmBpcE0PZyPxTwsc
 j0/hz+WM++LBcUzDuhnIkvW3795KB3LK3CwcFy3Zl97BxeSBbPLw6ph
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
pinctrl state for the two GPIOs connected to the touchscreen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4b7ae87270ac..498fde3d3d18 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -983,7 +983,27 @@ &sdhc_2 {
 };
 
 &spi0 {
-	/* Eswin EPH8621 touchscreen @ 0 */
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "eswin,eph8621";
+		reg = <0>;
+
+		avdd-supply = <&vreg_l22b>;
+		vddio-supply = <&vreg_l9b>;
+
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		spi-max-frequency = <2000000>;
+
+		touchscreen-size-x = <1116>;
+		touchscreen-size-y = <2484>;
+		touchscreen-inverted-x;
+	};
 };
 
 &tlmm {
@@ -991,6 +1011,13 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio19", "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.55.0


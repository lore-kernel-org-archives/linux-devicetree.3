Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503399;
	b=d9jDWPuhMecQS1IYGNHNaJf1g5y2DbQFmyvZF4SGcghaY+gWxShlqld+/ZtjezobpKHI
	 MLkRxS9KIHMTXCxVP/02qZ0ElsEYk0wMUCuwHIhjybuM++gIuj/AofkwVOjVu7U93CzpQ
	 7SUFwQmCK3kM4ssmifz//nVKiuvBw0rMjhEId/gBH7mU57cbJPXDKLFB00SYEm1WC7BNU
	 p0Us4euP5W0Gg42bzbAdJ28Yd8YzOlQjhb/FjKm3nkOG1P5X5DkA02HEOPUzfTNmajfmZ
	 UkRqu33wSvZj+2twvRdkHdBFJcvhPCuTnJ2EPwvAS4WxF4ICW6rFDzb2U89E+uTpSkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503399;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TO5hZF60fpsvaG7wW/pQxTHc33GQs6tLzXWQ6VKBs6w=;
	b=vMXmY7v4jVVLgnsVoC+iZyEbRwwaCuYEgYEl5JJ0LVcTwpIr+ol74eBGy2cx80jW1kRt
	 SllAUcQshV9+a8vm6ZMRNQ85C2HqBENpbbE+ucPMfMrpiOSvsjNy1xEMpRE6T6zqLM0BD
	 aQb5TfclWUzdY7kNroKqqlhWUYvScD4Png4+0QhrLhEid7yjrf+ZWsjhkpuX39Z8v30Ve
	 MZi5CPX4tKFymfc3ykGn5nUKMM9TmaOTGNdkS9VUNHUwVmRvPxS4viLo5XO6AwNw448Oj
	 KhqX/tT6O3C7pSrmmPDlcDNUqujne3SEQIB2TzBslSJRy8kZa+x2ufBwoZm72kr7L0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=cpcIslPG;
	arc=none smtp.remote-ip=95.215.58.215
Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C003606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C003606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=cpcIslPG
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q718G4IRORkXt111lb1vaKDUhjnIbg9uCJWm7J0ppfo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794503396; v=1; x=1795108196;
 b=cpcIslPG9I+dA6Np8LmxDtYP6jNNlb8ptLb0MfC+l2eq07jBhW/gMO5Hu9qwF198n9OVrT9W
 QwM3RULDmQQv+Wf80F0vnX5N0xFsdZg+p2IfH4G1y65xS2Fetv4GzCmyqiY7yQjfFIdHXtJOQ87
 liUWpwlEf/7cKjKNfo24c7en+4euUsB43fecNqwx1GrTmYfwxmt9/eivrWe4rZQnd4f7BuDsx/V
 i5Hwnmbou93gpac1lSA4UKOw3fkbzehWZ6dRZZi3kP5cujPsrzIOkjFpEZLYe8pVHLbjCIK4EO4
 KBtqixIJX7I118TQzxUeOsqF2zOxs8XpDStZSBLPROoiA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 33f881be3497a386;
	Thu, 12 Nov 2026 17:09:56 +0000
X-Mizu-Trace-ID: 33f881be3497a386
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Marc Lainez <marc.lainez@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Sebastian Reichel <sre@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: pmi632: Add battery fuel gauge node
Date: Thu, 12 Nov 2026 14:07:31 -0300
Message-ID: <20261112170841.2189322-6-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
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

Add a node for the "qgauge" battery fuel gauge at 0x4800, and for the
SDAM region at 0xb100 which contains the full charge capacity.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 82b5d7b7bb5b..5e9e82563884 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -163,11 +163,44 @@ pmi632_adc_tm: adc-tm@3500 {
 			status = "disabled";
 		};
 
+		pmi632_qgauge: fuel-gauge@4800 {
+			compatible = "qcom,pmi632-qg";
+
+			reg = <0x4800>;
+
+			interrupts = <0x2 0x48 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x48 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x48 0x2 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x48 0x3 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x48 0x4 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x48 0x5 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x48 0x6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "batt-missing",
+					  "vbat-low",
+					  "vbat-empty",
+					  "fifo-done",
+					  "good-ocv",
+					  "fsm-state-chg",
+					  "event";
+
+			nvmem = <&pmi632_sdam_2>;
+
+			status = "disabled";
+		};
+
 		pmi632_pbs_client3: pbs@7400 {
 			compatible = "qcom,pmi632-pbs", "qcom,pbs";
 			reg = <0x7400>;
 		};
 
+		pmi632_sdam_2: nvram@b100 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0xb100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xb100 0x100>;
+		};
+
 		pmi632_sdam_7: nvram@b600 {
 			compatible = "qcom,spmi-sdam";
 			reg = <0xb600>;
-- 
2.56.0


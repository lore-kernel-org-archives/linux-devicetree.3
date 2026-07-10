Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE6A3DF00B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675380; cv=none; b=Kr37QQ/11UzdJUxxwsSq7BK7vWsZgyu3ug3peYTyaKhXz/FQ5p+iUssv+3hWMjRnSXw9CDE3uO4S/RjgTcleFx1Nq4ewHQ9NA4VvkEU/HLZqKgBpwxVIyy/RPTxyzrYQ1NzwStSdti+a6KkYoWBIfrVfP08Cf4ZbOhylJJr7kPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675380; c=relaxed/simple;
	bh=MKOhRPK9BzP+Ba1kQzcE+8jxLp4Hbza+J3F5k7LQQLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHWXFgiNFbOyXICMhSrPSZCXmKJ7nz1oko+QvDaLSpJs2msMv5iuUG/fClczItFTGB4D+7VqP0R2xKuh7XwgK4E44smFhWzmFjDbXV/8wKIISdJwJMvFyGt8Cgk9nk2YvwRYvDg1HGljpyy4Cblc47fmaAeyxS0qDXd5gpHbJSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FUrzNPQo; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FUrzNPQo"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15d47266baso88757466b.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675377; x=1784280177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2PljI4ZF98i/3jw94W7rpF3nBz83urTcSx2ZEy+Me0=;
        b=FUrzNPQosMBvoBVHxYq7yYmSg7EcDwfXQ1QSVG1BAUbTYsLEelQqmx0FtqUBR9JGo7
         ffsfM067neuMHOWVbhNgFaH9e/yiKciWjXymaQRFd/Fjf3+EsMZGNbMl5ZTH8293XacJ
         5uskzyP1w/mqfPnqT5UXxlsJkjEUDJhZ7TqCsVsyNRi0LyM84RdGfB6g+PE+23t25B2C
         xrSXUbHLJtG3SadijssjYzTnxqIFhwtd5rZuc0fFEevJJ9EfqLiBtdQEkoFAKws3YzdG
         7Tfrqt9LxoXo8Q4m3rKp1J4pGj04X9V/uoGw3/Je0ZQl5SqXEsCHIm9zmmpfSArlGtDP
         mztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675377; x=1784280177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2PljI4ZF98i/3jw94W7rpF3nBz83urTcSx2ZEy+Me0=;
        b=R7kh7DKu90JyadmYAprdI0KYePCrPR18/40gRe+i5HruGfXKWqbTdao/xur9TXeRud
         UOYeFFlsK/PHR+YHKg/+PO+Dll7DoUp0DyHLofXHwXEVKIr9qn9CW6gV/ZFlRaenO5En
         tqRv0kr+7PRnodOR6qI/suPpuA/omlCXt8aeI0M4Wr1Bv/sU7g6UC2hYfoOxCDZaKq7P
         QmHFDyC868NafUDdYq75/OOLCRszHyuItmcTnRiXK4KgIHrR9gf3/OTTbyimoUCxY6K4
         InF73r8WR0nLmoDqHYjofmAPVEGDnrZfeGPqHpoUVMVNphnxVRh8L60gH516bO/hPYEC
         IWZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/UGCv+Cjk02qESq2gnBUrkUJ39JMmfKp1aHrgdm0zZZDAQs+uRn15x8glZPX55cPl8B+9SU9jlMfs@vger.kernel.org
X-Gm-Message-State: AOJu0YxRD5pkuEuhNLc9TiExAvCXebqRenc4ZRonBjp3/t3kYxXczmWt
	jJS7CaKWDild8EKWOD/v+ImmtiVHisWYCb6uFYuCqkcDY3YBbzC2/4jLFr2zYaBx25r0ukfSA2k
	du23R9bY=
X-Gm-Gg: AfdE7clMVJLeLfGB55DK2Ihx3V1kJxurBmKZL8HUY0RSRp+22OQ2igSYZfGmbod9S/0
	zMJj63ywgp1VKf3wUXDjUOwuHbegP93M9TmfhzBGGD4JpGi5Ob8cA/p7DpQhFEwE99dyIwvyLrF
	H76m74srg9j7JlKdNtMLbgFtJOaXKK/yiknTSmsMy/6dtY9Qns3b3FtFqepUxJNTRy7fEUA3Vi3
	5BLaKCtsvqUZKwyazAGt2tUGz4zSsVgROfLQR0sr09/aHbzgziSF3un0fGrgCJdmuvt07oEXLu8
	kgPe8pWM5u+g7DnYvVGkp9TLyae1SHBTnRdksNEJqi4MrF67StMJjiRbCT/hi1ykGvb7P8GNGtM
	P60iMa4Ti7XRvYF8wbfoBT9iSBn2NXVgLpAFxvF9QfJuu6w7IEg08enfEUOHW4lC48NOXWJroGC
	1SZimUzQGzNz1+pSSCd0Ddud9TzDMtMqVJeiQLfxLpYPxjktCLGa6m0+If0yJXuoYqWjU=
X-Received: by 2002:a17:907:76d2:b0:c12:7c80:8844 with SMTP id a640c23a62f3a-c15ce0c0b28mr312764666b.41.1783675377205;
        Fri, 10 Jul 2026 02:22:57 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:41 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: milos: add CPU interconnect
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-3-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=3619;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MKOhRPK9BzP+Ba1kQzcE+8jxLp4Hbza+J3F5k7LQQLE=;
 b=mJD3v2Seb0xmqYIKaKsx0e+KlFU1SZrgJW2OdoDBPr3JfIv9SYXWkvffUlTG+bZV5kOSR2efg
 7uWrnUEnWqcCm5aUZf93Sz17FlJtoXMz/KpAWPvedkjxG4A2sd/PG/6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the interconnect entry for each CPU, with 2 different paths:
- CPU to DDR
- L3 Cache from CPU to DDR interface

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 1172a4f6adab..8e288b5dfc58 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -65,6 +66,11 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -98,6 +104,11 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -118,6 +129,11 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_2: l2-cache {
@@ -145,6 +161,11 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -165,6 +186,11 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_4: l2-cache {
@@ -192,6 +218,11 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_5: l2-cache {
@@ -219,6 +250,11 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_6: l2-cache {
@@ -246,6 +282,11 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_7: l2-cache {

-- 
2.55.0


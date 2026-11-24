Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485431;
	b=Qdm5x+9n/GxVXcITJx9+1OADFSZiu/9+qYJl5TmiX9Zv82OfVdqgzWzBr5BiXshMykfK
	 uXhLNncP4/sAj5w1BVnLTGg0yBHWpVhPIWtjYMwtWnkvvSdXuyVwg4gqXWuT4AZDtITYw
	 R/FyWx/kV/FyJ81ZiB2F8SLBr5Z/lwLBIwhv5URuxY7zctTq1ltGAfrBdxZonohX9DAee
	 UgJp8JCjKfCJ/pDgqkeFYCC4zgWnO9436ejoQL1SGCqcXH1u9Tgx5o/zg20g87enPKLOp
	 HziNh1GuQ4JRnNsxFCR6+obDUTr+szMWzz7fQwY9b+hf+x7/UnpPJGXGMvmP/zhUWPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
	b=auDKEL+yuI2YPkxtUvTp41RrY5R4Ya9+BnAZQrkXNt/FGkvjBBzbBOlsvq6wexI+ZOnY
	 N/r3O9Cg3OjwSqg5VHawpWyHlzo4EkfnobjStt728JSlutk8b8Yiu76wUufkFni5GsTml
	 GYyvAv9uGHO2ks1apmk5XPsjGG4vsH4P/MeQgOi0RZgZnTS8SauGKUevukTxVJ0AWSe8+
	 O3V67So5VVxDOT+7xAXgFygCR8dylqEWcHD4RzdzqUGqKlIaDyNJw3tn0D4WcN2Ply/sw
	 rtWpaTZMMm49DSLdArsdXf2PNzQripngsdHwO2LRSMNZeNwzuzh6/k/HxV65W1NXM+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRi7EmBy;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC5606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFC5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRi7EmBy
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94961ed97bcso422135285a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485429; x=1796090229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
        b=tRi7EmByIhgObATe2GhCUv1TEXldNm7csFsBg3QUKYAWyf08f+rm/gIc2r4Ill6JBS
         5cQimg2e0+HXf2MShkwB2vJK4bYC+knCV/6RjTDTLik3iLj8Qc5PqXat78HpQ7u2NaDu
         v4yysu0OgBfsj3rh/Sq4QK6Q/GKrP33rVTcozklXk3kfsGrqhInSt2y/v3JkkYQWwoBs
         OhcOQcNND3TRi7+zq/S7dz4KcDhkTbcTKiC3MyAVsG4xjCgnPhJo0H2SLmBhqlQ52plw
         Z29O/0zZ2gF73f058JTUYATU3c/+MxVam3sVkQZ3jIQQEHrVAGZv4Z2QQnhNKuOk5YVJ
         wO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485429; x=1796090229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
        b=esd3yVt9zBTxVeA3I2h/gow3YyPxHY1vRRXbuWUue7WiBLYzSjRow2rD+64TkAqmRn
         N0Yl8OLagtiu7/b+SwDOIYce8Rhi1toI8Gt04wU7TJ0yV8CjJnYmS8CR3mr0arjOVC0x
         UEA/ERF+Mh8nzff4X9Hvi/VIqpclsp/iN2sl7f342fGzcHCgSmP3GH0DCh39nB9NT8zz
         ytrvpujofpUY+KJ3nrLOGkdaOVgE5Kkqp47K6Lo+a/iqnuZPqLimIJp47X7zPq1yxrB/
         HU0SnoS4kOKu8c59CBnSiVtTicrLjECILTNhjCbclMZjrOz30aSvu3TU6yRYf0jFMJzz
         Qyqg==
X-Forwarded-Encrypted: i=1; AL+hErHhCxsR187MP8aIjaofuEIGNOC0W3TNKe1Ww0++koOVfFO7e5hQzuTY1P90WWI7OtA/6T1jmrOpDh+l@vger.kernel.org
X-Gm-Message-State: APuU4Z8SS88MM5maJIsTn9i1IzK6ayFNrghpLWe9ejx+AtNlLPCtWG5C
	SycfqCH1/QQQ4VpJ53K+PvQxV54z+r6WNuJrpGCeHpZFEHcqoY4o+EBn
X-Gm-Gg: AZFdTZez85NN5pWnuH8K6wAf0SLvVtMjUptKOXSRsM34ispguapfnRlBoqSDuW0Na2d
	WcSAdyZQC4uVbVNyTGieWwf7LSMUK9iF7oIeoaEAGpueL0j7QeabNaMFNDiQbvtShHyKDO249qH
	DL2y9mN/BPb99O78GoRf/KsuvY6f7LxObGt2+ifIokWWNUsV7vgO6TnCuUqqvVA/qx4XSTTv47N
	Ov1yTUXS4cify6vLMPxHrO3K0C+oCBdykjvx/ka9u5b6gN3dmm1jUaqRPQjer09x/uwOBoU/ylc
	tL++F61DpEgB1GuNSFDJng9+uFdsCRKHwrJWNWcQY3bAlJf7CQCInN14LV7bR9tmRdF/Vc1QGT5
	8A8vxJSvBJ3PzA1Gs7c+juNwfiwYcPVDBlI62pWVJVdgujCXlBcXVE01NuHD5JBTAllpi6G/+k/
	OVodmk7JzGjtbZgswh2HJbKB+W3OojywCU0D3FnoG11KXvD3smumwJJ1zcMAPehW6XZ3RrII/A9
	5EHzwDxHHpqtFx5kO1PdxqKdu17C82jxEcuvkdVp7yjUwCefphBj4Ez8F05JZhM09Shlq1SzLaq
	JVADSC1P4zdRdUxxeXmiiAb5lO/W
X-Received: by 2002:a05:620a:601b:b0:949:76ed:591f with SMTP id af79cd13be357-949ba82851fmr2343857285a.8.1795485429482;
        Mon, 23 Nov 2026 17:57:09 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm946256185a.5.2026.11.23.17.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:09 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add digital audio codec
Date: Mon, 23 Nov 2026 20:56:10 -0500
Message-ID: <20261124015611.187024-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index e99183c22208..54d903b89cc1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -33,6 +34,12 @@ / {
 	chosen { };
 
 	clocks {
+		lpass_cdc_bclk: lpass-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -2822,5 +2829,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&lpass_cdc_bclk>,
+				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "ahbix-clk", "mclk";
+
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669176;
	b=sHI/oH5CRZYOP6oMWN2kBrTxwSclAkNKAkz9qJcI0k6I0zGLb8syB+KsFSZ5eAVczJ94
	 br+5x9ChOVZvvwhCQWu4JIKJ/z/N1bwV3g4/hx6Dqz+SgWOij7a4jv0LVbKBuHAuXkGos
	 Zus0ie/EjgBkvi6Pio/N+cujVIxJfcpd5YHEDG4RB6THAyDTlWnJCioDeMgA6itPSvMbo
	 gmlc1bkxauQ/MDbpSgF57CyUGYB9Cn9HKtP0JpXssFuJybYdVOkhNxSQgclOsXDzCslaY
	 zOb5UoTrjNY2I1VSF/m4q819CJhGVmtAga47uYSuo/oe0C+1AykginQ0Z+DfUo2SThw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=HaoMg0njtkiLY65BRNIHxwvX6HEHWjxOL9I2njwI2AUcPtS0xuOfRf0Ejd8cBuFPjEIR
	 Gj283vp+7cjXB/a347Djar/6oRPdwwlh09D6rD4Gz4dXGrGNWlLjZklWLF+ZXALKGOBpN
	 sb43mM8+R4w/KL9Sy62VhqSaDhBe2eKHa3L7rZOmtybCAlcCCvj0LTuzcQtRy+Z3OAHGj
	 ZgKEp5ihduvDxnJPS+/yLmPwop+KD5IWmVMyZelILd9JG6nIi5wMNzPz0jkDqnK7Jb1gv
	 DEgdKSJFj1CWACIUyO7TvszvCv/SvM7pDJ4K4NUNwjCqpehf02Y2Bhk5QEt1i2FpXPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E4606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so10953804c88.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669175; x=1796273975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=NFzPJxa7EhtRIB8MazICb1dZm6fNciu0+eLItxW0oiWruoT5aOguqNE9G7jmzxP/nA
         RkpbDJiqDE5/e/XWOmDUN9BV9cSiaDUdMuaUhMM5Z1F+/uyFtVQotT/LTzXewNqPOcrK
         541FmdJagqAoifV30pAUDCG4f8L7RW4NhtqiSqPAIzbhUAc+6zECJG7U9IjNiZrzGU6Q
         t+0xX+hdpAo23j3UIy+7AbGneIcGJTSZpbhmnjOS00LsvKUAP5XNqSiAFcbuW89YxiVX
         0ifHTVOKgbf+QXew0DyLfF/gaqOm2d43nuwGJtKoPISb2Lrlip4DV0RUkvymXqVvE1aX
         1tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669175; x=1796273975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=gcMGBoMtTUPKUyDahPPutiBWVeCq93b7+b30AwkfrqwCVL9bWp6UyvwxE+uIBfOBRI
         cA/uRwJO/uXjJ1sX6OD4HZOfK2SJbmr6wQCRSvdMGeS+t5TdSmzqx2bcwq5bJ7DPmnQ+
         pgMTtx6b0YKa4hI2suhqKW/UzUgjJ3DVeIbaK9w9VSH7wC5kZn5dRNH4CESDx9Xxq1Gv
         1XxZYq2lhU0GlyGWZukmm3a3ZS5jgIPtcTlPWWN/ejzQOQxSjHa6q2G0xzNXzcGYzFX7
         00ioMY10Xv8zBHAzU/Er9m0EgMtyWATSammGPgBrKV1dpgwkdn2xnQAlemJD6XhACxG1
         Uxcg==
X-Forwarded-Encrypted: i=1; AL+hErFmBUmHA8VEHhZ2o3HdUdXnuF3wbqsaU9hIIV/NJVljdq7ZjfxDOmrC7iWAGjtBY9RLQmmunCKGUFbN@vger.kernel.org
X-Gm-Message-State: APuU4Z+9nPwzR6AdeZ2Z2d22jt0WnGObGe+gmZ24KFiNNQPt4jroL7Xn
	ptvNdzOTFppiokzkE5V5WNldTL5kUwlno7EoEK5PmuQ9aH1wKUClJdS0
X-Gm-Gg: AZFdTZe+x1GZhfv2S7Lu/0gijrdF21A8HQa8V9B9vAdJcW7TOA+GkZ5DZIuc4NkgSQd
	IRpoLigQaC98HpC8i9Qbsu+kUh3543x8opQa4vlQVs1y5OJDWLYOGXYC2TKPM+KmAPg2z4fi9Hv
	G/agG2fa6eVcupnNQwlPTPjFpL2VAlGYxN4RuFUG/jgFJyjymUisB6KPxPyMMuFZFUATkKB/COq
	Q3nVXSQkeOSp+fOCl4hAY4C2lwJyQJzXLw4Qip55PrGPEtqwqGKdED4f/k8epSWXUF8Wcru7X8T
	0oFuDMcXBKFK235QrR0q93J9i+goBbBFXA+EMYvUtJhONfJIeWyZS/foAuhVvIsgB1UCRXTwO3a
	O84XU400i8ljB7NH7iXpO0PzsWpHD8QSUG3CB85vEqHwYeWiiBBhQ4cPGuOXcE1k1NrbndOCcI3
	/JkSubf7p6p5KX/OeLKtEGv1GxwIMBV9Mfn7zMY7YgjdxSVbIMJFDiuoS2X1k/nmq7rcnNTLyVM
	vw/H7n0xnDWvCQ9JWFmxeCmCtG6MXCTGctnWRZ2e3Petp/ksbA2XLko0SU+vXIGLDfcy33vhCF8
	670j3wLrHL5v0Z/oeb/KD+a9KSbWU8BqiIIFztkx6dyBikcNVp2vzMMzhrcxKO0oags2t/abNjY
	4IzCx+TE=
X-Received: by 2002:a05:7300:430a:b0:382:7375:1306 with SMTP id 5a478bee46e88-3856fc603eemr27572642eec.14.1795669175490;
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:12 +0000
Subject: [PATCH RESEND v15 7/8] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-sm7250-v15-7-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=8XP+FxMcNtFvSYN8lg3S9ocnbk4kDsIE+kYG7fw3nlTEyPSnWVN5CZnQShpMnN17s5A1283xW
 e+Hz0YVjyQNCExYfLFHhn0nc2qpGwYHJGGrY6U07WfxPHY8D44hRghs
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0


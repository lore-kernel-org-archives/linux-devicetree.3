Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864471;
	b=ypd4CQscjwg0CaXyaTE2cHp34UDRTZjdO7nyG1mpW+bvNQehjjNbzij50WWz14Nl2SQq
	 fn9SloZOdKJUS7PoU/lRWxipZYktt09YNC/M5ziE9aC316Q5+r7Gfbttp1pceRzsRi7PF
	 8/PgOavS7g+ZLQGJRM8MAzE1dtiJ0kgrVXEBN+0HL/5/symV30fpZ+tW9XhvajinGrNFb
	 HfPJlscyDcvMD2pqKIW613FqJWpXGaL8P22KhRaWguGaAwYTju/jmSE7C2jL2KqIN6efN
	 lk5nUmaK4M6gJju+LVVlPHUzxu4HuEp7d035WuB1VLC9aqbwBBQObzEyiBynhYF3s0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
	b=U+bg2g4EUEBpNNsZUJgEvwwDqG64U+1lIfIdnB6FAxbEEvqDgnkzkt7jBhUBN81NQvVj
	 hJLIRHp8afYc9mlgdv5ze+rWQSyRPLnlmzI/kXfHW2JPdAjr69Aq5JiwkU2O7bEVq6dmf
	 w/yxkHVfFX9n/JzI9nplIa1Sbly/85u7vbLQYxhfbA2Ku1hO3Mb/0C9Ch4JWaZ39tf9RA
	 TW8ZKYGfD3gEe2cnwwqh+L/35uSqHGFmct01x9K96KQEZjDxS4wwc1/ZXADIO1yuEn+je
	 E4jVWGZ45p3ErxS3ewt3nCqaE38L8sFx6i21bLLcaJorTyetPR9kslNkVcTIg741NGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtED5PjB;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A58606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A58606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtED5PjB
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49a92144733so1592761f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864469; x=1795469269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=MtED5PjBAUUX1nqVGeH4O2AqQAjGqMw2pZItkYtDZ5VuJIZvXrHDLRfGKUVRSYLhp7
         SadZH7H7v/4qecL7/xx2hxUwP5FH2yzEb4U1goYIN1px1JLPzYcbJc7lIrXIsf/wUUr9
         ldEtI2Kct9DtBpn9tXWr/qn5WDybofiIEEv8VD4ie80R2GT3qTq7ODRV/NuWeMXgnwb3
         PiMDYdzQuEcQdcwInEl7C5imlPaeMrmHswtQT14y31JumH5ZADHni9BebTh0lCs7FRak
         9U2NHqnAUtq8m5l+s2JJLL/33S6lQDYaM8x7ZoOjmFVDpE/S52nepPydk4iJbkjH5CDk
         UlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864469; x=1795469269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=NVHMSov0GFIhiRSgNoZPNrZAOPm+PUgoQSNPHWOicRXkoXCiJRj6h/Z9n8GDjQK24N
         pUG21whoe5el5stKLEYXy7B5Y/MwlouSCnUpR4bxh2tJIzZShjPHmNLkHcFsbTvqZqmt
         S7tipFL0dKg5oqi72CuSGiMvc56WMRis8zfkOiyzpmuW0Gbcs5rwJOTIxzDTkJacZTu/
         A+6rl2ENCuHbRUivKP/bqoaGlgAQRU9nmvTlxrNDqDZoj50a3vWcwYN56NTMyngnbtQM
         TaH09pQTv9MXo1VrNQSSdZD315iiOlWp8h0n3yN7ZXn+BZi4uV/cZUCR2LwOm/6QDS7f
         wIyw==
X-Forwarded-Encrypted: i=1; AL+hErHkPg2gntUZZCSH/ZHEkALgd0MIqWgvumHs9UfA5xi8pd7jfNAq7p5v+hWfjN/nhX4JVmPdTuy9a41c@vger.kernel.org
X-Gm-Message-State: APuU4Z/lkVfjlleAnbpLd4Sl/VlLnX6PgVynGLmTF8nJcthSFgUz3yVN
	9UWSmDsC4LphejE+Ma+sg3CgysYoFURvj+eY5KRoFNVAmLjP/1qzjhqs
X-Gm-Gg: AZFdTZfDwNnzZ+70BseF/KF6vpmsXQg477N5dSS6cOtEXCIZQQ8pSFNH4ofkfo4qJ8j
	PBjSZUakuQSEKhXBjeCTxbNzWMliT+UhFHwU5uqSEu8R076OdkuAW9jn48VTIhhn0KUVw3NDH6a
	SaZ9rghuZM40cGUqwMeshCCDtaN7yLNpZhuJTvBMCAgJMVOryEL7jJDDOTRoHipP1xcM20uQzjx
	/iefiKP1XfgJ2kxrkmjdKQpGd+KSD4lxj78GsfQHP80k4Yxu8gQCVBr8waEqXb2xpihEcO4fAIN
	QrlhHEbw7TQZtNlJPOuDc2au8p63lNb7PdphrDuS2GZl7mTGOcCVmyLr7tPJi5qrshdRVV5n2RU
	tfOoAkShLKNyMZuKTtOQ/JzynMdWEDEhbDrUp4oeeQgLrYiVbBAbYp8JUeTdnb7Wc3XVTcALzmO
	t/FrTo+ijxh4Ty6PwGnQqXCdm6qjcHB1DHPJWfVtzZzycZ6qlw1ElzH+9zJieB/LAOCG+YxuOZm
	bxsQmv0h3Xk92Ytspg32ItJKGKG7DoTMYVuBSZrc6Cryb8YdBq8qQ7Ru+aCD52/XW4ZSGfYrwFn
	5l8vCeIFrDZQlwvOi3sXwamVL6xwOz8TEwrntBiA
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr24445384f8f.13.1794864469242;
        Mon, 16 Nov 2026 13:27:49 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:48 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:28 +0000
Subject: [PATCH v2 12/16] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=2338;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=8VdPKIubIS5rrskEMQXxsc4CH/xmK2NlYtvs6kfcSuc=;
 b=t9apGIuBdbCgnaj0/1UJjnpEZvArnjOHWwiMxnYe/9rnq7pKBOWl7S4p0La1YJLjWlXweFSEs
 dlcpSLrFw/hDB74P8wfi7SGdvZuxbRKq1frXt0fWIbXohJzyyH4p/WF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P), and register the "halliday" codename in the
SoC naming convention schema.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..9d392329d437 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2a77382a9f25 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -106,6 +106,11 @@ properties:
               - qcom,glymur-sip-crd
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0


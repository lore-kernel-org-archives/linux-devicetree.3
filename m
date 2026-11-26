Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678821;
	b=jpg5zwRhajXL5D4ZL0wkTxbRqmAtI7ywwVzebzU7XK3xJCxfyDPsaE5OeJEgH8NsheJN
	 jwn2+IhaD6Uv4vUlmQp2Vdu/XId9iFzBgYr6kP+D5PBw6SGrx0nZo1d3bXlo4oVZFVRjv
	 RuCMrwkqQ9E3VMVVz4jSud7m6daAxd4pc/KZMEWSHUL5S+DigAVICa9zASSdrPmSY4MlS
	 /IQXauMNZnHVpiI247f64AptOulzxBcrdAdbCN7rkkd8l3n5CTeu0PSmQ2DwnlcDraCxL
	 LMM4IfdoGmY7zq8zzrCCQOw01RM6oq/vrc2lI6wgGJLasf/YY8VYiwfsvaFdSQpUoIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678821;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lxHAr2aDDIPj1BMVKDWD03/y8nvtXYSGHPNIDsNsMVI=;
	b=4STEu3uGmMR5pxF8Cjum8pNUCePmFAwVTH3EaliHCbJBa1dMrVOxQE7ZxuAiC21d9Jdz
	 bIxvkMR+GK0ZLi8BKohrN9JFCtYlX5wkFGprLBDCO1g3mZ6CrvsgZPFbuTKxT/splKFGL
	 dps0eTe0TZPoS1rsamgiZXc6GMEj438ZS/jn8HbsVF87/ksOTvBqAlTZ3Blwn9BjjeRZr
	 UpPl0Db4AFT0XaBwzuVq15AAaVl9M5/RHt1QfGqafThRTqShu8YcgXQEimlNvY/MetO8V
	 ZkZrzli8LmxEwCsZy5bKV/+pCwI/NxUfp9o/E5pk1RCHrUtvLbkaoPNHdxS6ztZLxyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5458E606A31E;
	Thu, 26 Nov 2026 07:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5458E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id D8C8A83B;
	Thu, 26 Nov 2026 13:10:17 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Thu, 26 Nov 2026 15:39:11 +0800
Subject: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Add PM6450
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
Message-Id: <20261126-netrani-pm6450-v1-v3-1-2343209bbf4c@krgm.moe>
References: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe>
In-Reply-To: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=OYzN0SSU+GFmqJ+bqw/2nn0SEOaprRp4OPWUads4sCE=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB+I4GXz+z6J1/6Z8giFRH22i7y4hZk45M//Zr
 2zSd46ztPOJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawfiOBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmMmOwv/XmqEClc0frMmqNKt/GA9YV9UhggW5oE
 dYA9A0TKZIIMZpmDLCGb45t5bD1GjKiSyyxVuv0J6Vi34tT8p2tDAZ5RtssEODkn7U3Pt4YEfsM
 mjJs0ECBfC48pUVZehoxSMqzwoiXcME329jVyQgLfGpXDIcY0k6hNqfZzpu1zh2vsFazui/f7cD
 kiWP7+/V/wRUbRQAdxGg+l58PEZ6a9JHEuMoV7vX+/KwgiZn5zX3mp7HRdqadJj+3rCI7+/VygG
 ASRuRByj8h2W9kLWi6Y2zDmtu2qOgrATlP9/0ej9Tt/GPijrnD57Q9HduUrJVgsIWB9AzfkVgSU
 lDAUWml34knHXYlh0XooUecUvefzbsKgwIobpv4Owtejl3QR8c4fuk2vP+fXSuLSgme37pl910w
 FPZZzO7Q0TnzJzxv8kkACosz049EvyguqQgoAI9dG7sRpe5nbgIhb5aQgpUzSq2IhzKytbdIVGA
 fSfNLtwf57Akd22AT7Ny9fdmXMbzbaG
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Document the PM6450 compatible and the eight RPMh LDO resources used by
Motorola Portov (SM7435). Add the parent supply properties for the
PM6450 package input groups used by those LDOs.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 9115885e7985b..c91f01d785174 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -37,6 +37,7 @@ description: |
       For PM6150, smps1 - smps5, ldo1 - ldo19
       For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
       For PM6350, smps1 - smps5, ldo1 - ldo22
+      For PM6450, ldo5, ldo7, ldo13, ldo16, ldo19, ldo23 - ldo25
       For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
       For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
       For PM7325, smps1 - smps8, ldo1 - ldo19
@@ -72,6 +73,7 @@ properties:
       - qcom,pm6150-rpmh-regulators
       - qcom,pm6150l-rpmh-regulators
       - qcom,pm6350-rpmh-regulators
+      - qcom,pm6450-rpmh-regulators
       - qcom,pm660-rpmh-regulators
       - qcom,pm660l-rpmh-regulators
       - qcom,pm7325-rpmh-regulators
@@ -203,6 +205,19 @@ allOf:
         "^vdd-l([14]|1[1367])-supply$": true
         "^vdd-s[1-6]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm6450-rpmh-regulators
+    then:
+      properties:
+        vdd-l5-l7-l9-l11-supply: true
+        vdd-l13-supply: true
+        vdd-l16-supply: true
+        vdd-l19-l23-supply: true
+        vdd-l24-l25-l26-l27-l28-supply: true
+
   - if:
       properties:
         compatible:

-- 
2.56.0


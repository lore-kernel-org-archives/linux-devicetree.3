Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541547;
	b=ljTO40nqYLIepJhlPieJFwzcQTfWDZhmS3aTO+QgUGqZwbqCMsESvAqENvtKWsY1+shf
	 DkDtVpVgwuD7Gh2LBGANrp4R/bVckzy26do9w9vFOqAzap5S5VYmgMx5xaFMnQAnab4Jp
	 ES/4cP6QF2LGeDdjDW6nWrH48Rk83lR5WhaTZqa9XMlSjrgGtmgvil2+nNd7Nkf7uhWfF
	 j/2aDZXe5uMOYnD7T05DirRkjRkDB/BKQ2FUI1aC85Nq6ox13819Tqeaj3SpvE2lsFIdq
	 H21/+AFdH/jp1zGP3mQEmDLi49w9WDRJ3CLBKyzoKyPu+FCIAPvjdZ7snZEd7sxMwXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9SvbCg7Ps5Nq9N8nXx7dRohF/YVoRnfTVKAxW5AGeuk=;
	b=ir9NGntg4Jy5mFwsq4TTYqh8qBpMoJFb9crSyY62iMJNRwlVlA0oPBEnZBc/MSMxEmPF
	 UVjufAWMRcmXsrfG1y07oMsr32vQP95LAKI3mtcrMuisn9exrJ+ansxNWXg5sYddza9ND
	 UpKFZeqg9UsLzmM813F6EqoF36WQkusgMaDqay9tmTKdkMvIKmQUYNZ+uY4wcFLYmMQMy
	 qY9PoUXBenG0pB7DQ4FiLn1Jqm+ZRKahVdx9XrLBW138IaZH0hqzefkPEX8wKy3gM2w9O
	 vA0ARsa/1yn7wEs7WYqFDwzm4LJyvNOvk9PDyTvg7ISXwSxpH1wlidec0CYt/VjRhAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMdOiAWe;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA902606A692
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA902606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMdOiAWe
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-497614c95f0so2725215f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541545; x=1796146345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SvbCg7Ps5Nq9N8nXx7dRohF/YVoRnfTVKAxW5AGeuk=;
        b=OMdOiAWeNGehUvoWHF11Ewvcv7JrnE+5P4gdU+sKW4N/flR9Xra1mEe9VTKPga+pCy
         9GhIT1NZqKgoPJWEX7fXU1gpYOYAh3T39giXjwPzJIS+AVc5V/T9Jt8skxkCSW+Xt9gM
         aQioNdQLLzVMnv4K054mqTOqHmi/pfGFYe2eRBAm8gclFT4p5pt1cCmZRQIq1rPtyZqV
         1cTWJcO00Ua+qIiJZMpg+QnyrFRZzkBWifZC4oHKeG0kqYJRD3Ugk6PAJp3apXx2PORj
         0TbTAPWrQDpfBgULH6k6TWpGuXw2jcyDVSAV4LbPhVjuE34AbX2o2kAqhmdA8FcbQbcF
         UPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541545; x=1796146345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SvbCg7Ps5Nq9N8nXx7dRohF/YVoRnfTVKAxW5AGeuk=;
        b=SQIdgvxKxqGWyWEd4YEe3fXfL8Eech+wP9Ib5yc0XmYv+7keU6NEHe8iqm7Trqxo2F
         hhTUN1g3lb0IMyoex8mhoyHlY38/DTcCrYQHLEzJFKHQ8gYKN5PlsRSMddrU6yg0Ukly
         RpeTVev729VG23vZtq1Ogrrt2FwM46oGtJVWzsLtArvRO6kFCGlKhDx5W+8w3CK52xWr
         1fuIEOji/VuQWHrwvcsT17x/7RgZaqVo3FmFiPFT/noFWOAF/GZ1vZFRPGkpMY5r4Prh
         vv0pKPXIOnrRIpUrI4JuxqEnf1q/VLG8XopAwBRQvaUWZhkTUm2BIYPsU+DyKgE/EHx6
         RAoQ==
X-Forwarded-Encrypted: i=1; AL+hErFqg4KUsip6TaAFvMP7wj/crOhvQdoGLXsrufWVxuuSqn/WnsAbyMXsDF8FXVBqGv04c+QwUnG7yIW2@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ro2ea5gIAXi0oivGmWH9VcRMGEsagP8fFlSGK6I/eI8UGX/mz
	8wKJ5bX+pVY3sstKzy/ytyUg8Fvl3p9YEI1po9Zyka9yrN6Q+OK0XYN8Tx3hnaTsFCo=
X-Gm-Gg: AZFdTZezHN22i43TrZKbtxjS7QBqp6Pupv6JdbYG1IA+Z4t20XdgrBr5lrYdxboYXTy
	bvOneHARE2QZCJE/TbGKZY5BebOJWaQ7fq5CxgFirES9QvQnhQxYssIbTSgxPjkmzDUZo1lso4U
	B+nEQ0lA6qRxokoOOQIAvjFZi0hLoCeChZlQSwaoW6iYl3rpUr3lcPyfTgvrdTIQDpBV/gTp3Pj
	QMyAh+CVXrrtEqxN7ffbuZXXQKif1Mq+XQykAPI6XWKUy4fJcu0uBY1pJV3CphSPj5KR+PYhkZQ
	sqDXXrpm/GOl57Ur9Nwx0Ns8upt6HO3UgBCx6aB+gvo2tVYIVVfBHLXxI+IfDvI2/wH7ti5Z5xu
	ywF56j4CO3b78H94ggTzJB0kxIMZVcDpEiict4fhFg+ISNrnPwR1bx/6qTPPJQiEfGoInGzufSW
	gkS+mrAbVHxJ0JjtMlROhimhXJrt60XyOx3QXX0NA2TcnIZzv5fTgeEBib8qcVRs2oo90VPJUOZ
	VB+tkV4R43YzG/G88hCc8hZRhpATh5L0E+sAfwdGuB3n0+n5Z4PN2bSYCPOSZeeDM+/XnmbBW/Y
	GnIFD1CKDfD+DgkOCayiZkRrHwojZXZZL75uI+UUi262sJBYNA==
X-Received: by 2002:adf:e010:0:20b0:492:b221:ac38 with SMTP id ffacd0b85a97d-4abb2ce4bb5mr22650837f8f.26.1795541545190;
        Tue, 24 Nov 2026 09:32:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:12 +0100
Subject: [PATCH v2 05/19] ASoC: dt-bindings: qcom,lpass-*-macro: document
 less clock when ADSP is not used
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
Message-Id: <20261124-topic-sm8650-el2-v2-5-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5362;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=do4Pmf+OVu07K8cj6AtpBZmoXVp+LaC/8m6b8cSv7gg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcocYv9+888ZgnQroXtUIA8JcUnztIEsC5bdXRJy
 DDjRFMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHAAKCRB33NvayMhJ0YNwD/
 42F6P7p/IOzgCWAv7VWdS4T77nO3fg9sWC5QbrR1LcEK51x4KxUWpf+z/cOg5HDUMYS54DDBL9w7ve
 a+5ft1K7AOOvJbInIHltppdlJfBwEI2cMelcSBt4/7+cYILBNxeh9O2qz7JzsyZPP78wD5YY0sUlyM
 fRVc/GruFa2+Sgo0l/JwBYmhFKNauLebKecEqvJ59EgqwUO1tq8QIhu/lqipeJEoANevWAcjWcB8BE
 aUhGXsceO15KEqMolIM83kTNHQwPXRJdOCi8wOzAGstvjgf1ril8d9Hu7eio+NMRy20O6sfus88xBI
 DeV7V6EeEh8Nx8Liu65JjyInFBvNlpN7JvVLpDyvfsIwrirGQ3oRDzOvY1b8Xd+nVnXpscScoJDRbA
 7h5FdXL1baJvYd5e/rjS0wQPfBQTD9nQKqkIest2EfWi2s9WXoPOY5/s3dYKV7aJBreh13Tc7aNTKp
 cf+DaPOtlMUY/GTF3f02J2hEPt7Y+BZdfP4BrWW3jdPmn6M4oS1caMcxZAvRwSttfR8rPJjJ5U2ZX0
 EHKkd7XrWp5rT4zoyGpKLkg/GIfhzE1QTkmI9roNtey+ggzok+yRlOFdRi+igl278HLXDh0JVJv7H2
 XRR88/fc+IUiqsZYLZ06KKx5QkrPkImdLxG2j1xLH4mAVIOH08iaC5QjaMeg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the RX/TX/VA/WSA macros
are entirely handled by the OS, the macros blocks requires a different
set of clocks and power-domains to replace the clocks exposed by the
ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        | 17 ++++++++-----
 .../bindings/sound/qcom,lpass-tx-macro.yaml        | 20 +++++++++------
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 13 ++++++----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       | 29 ++++++++++++++++------
 4 files changed, 52 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..62ddc577a345 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -133,14 +133,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: macro
+                - const: fsgen
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..e593b84bdbc2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -41,11 +41,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 5
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 5
 
   clock-output-names:
@@ -137,14 +137,18 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 2
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: fsgen
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index a5466e61b0b1..3f8d0b4cbde2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -163,13 +163,16 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 3
+          minItems: 1
           maxItems: 3
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9fedd80532e2..432839f05c58 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -38,16 +38,24 @@ properties:
     const: 0
 
   clocks:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-names:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-output-names:
     maxItems: 1
 
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: macro
+      - const: dcodec
+
   qcom,dmic-sample-rate:
     description: dmic sample rate
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -93,14 +101,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: fsgen
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: macro
+                - const: fsgen
 
 unevaluatedProperties: false
 

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540468;
	b=MSo2eg9CXTh/wckyBX02fOrWwoT4BSM+C7+2zgDmaykYWbc7vUf7HT+8aqUUb46z0iz4
	 swvGvgZfk/o5LOrirwXfe934Mo6lo8qzEqy0GryGKgRrXJGJS3AVhcMIvBIucQpahodKi
	 TeTGrSAcvlVIE8CHrkQhkITt6HjrLnBFfxLcGUvdpGToP9gUkhzOIzMWEjaT6MSh/jvQ9
	 fJCdMxRxKCqH5GWVZ6XMMupAT4p6Z1vKBkg3NCOvK0yetT3yPMP4QRnDZHYk0iR5dWCjl
	 mHwwmXwjukMq3inI50I6M4SLFLF0DKM4jkMPWb6afwzUP18mPq9xIVbewhLX9O3kH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7uTzZjFbfwiCl5CZePRaHtIXwUWPwQMotNCrGINBjVY=;
	b=4EHDbQrUjCsmDKP840/nGe1bInyyFxFKFQ4blMfS5JT+XXStV3+6ODHJDXrFq0l9FM+H
	 zkD8/IAastPT49ySOZLpepRdswJuEvb52rrrIoUTEiM7UUSRJqdfyeur2sd/mO3QqvLdI
	 Em17FpaWUWzICzhXBndimMUvb+fN2YexBTCBg0fcb3b3Gz3AGxfyBbXj0gCrW5svCvJ9K
	 TZF4irpjwaqwX69vBY5cTCUhjMw7njLgb5ziNkVYPyKCBPNReqEm7fwDlkP9yapREl7KN
	 kFsUhP8y+OSATtDsDhwmyCrYUd6wpoAlk+jKW7r+kPERu24AAzP4E7u03Ctruc70SvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q+K15bUt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE314606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE314606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q+K15bUt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so61271505e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540466; x=1796145266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uTzZjFbfwiCl5CZePRaHtIXwUWPwQMotNCrGINBjVY=;
        b=Q+K15bUto5aLPWj8V4Iau5HxYR2cBzQG64tQ8DJxpyyhoHEWxgYsh5Y0cCWK+lM6BL
         P2/7iDemph38FoCEL/UtjY5F0JPq/INEmw5kkmChS5Vw7b3r/jXNd6Pa25VgfPufoXpU
         rAbOwLjiKnjJ9r+rZDoV0uoec5kNdau+iCD08XoZ9NtZfS9mx3TpvckITJvv8eoHy2j3
         I4BInlDKrlIt/mvyDGH0pSjPNK59Y0UQS8Sm1cyaIB0jOfll/8RrUrBLwa03YyW6OFuY
         oSckjxzLehJvgYm7LtcBgMoZOBRDil8Cu1u2aE3e8u231/Tr1CdTwTMlI/g4Wk1uTq10
         SWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540466; x=1796145266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uTzZjFbfwiCl5CZePRaHtIXwUWPwQMotNCrGINBjVY=;
        b=kRT6JfCE+0LkcFWOGs4NL6qGq65shEEzzybN9Br6jYEFNVNdISTQccaV6aLAOqQAyI
         qMUmcLYBdpPcby48271ZiRI2+VpfptmACUMZpyR5GaGOJ0pMhH0ciXiB+4JErpiP9zvK
         MIyoCDP+783UfUpnl1ZBl6XxNv20HdFLL46soFmN5icfOakFwqnDVquTlsvRwYKUXpCS
         VaNO/U1+9cfMmuePS3XCIY8Z8spT1Q8vQpYSoMlhq1ltd/NSN4EBSF+Tb5+T19n8iy4W
         UzWZNsOdeXuHjWl+GgTR3ySMx7PnUz4bLnJWfmGGkhf1IA6o//j2lb/09IFDIWIEqeks
         gyaw==
X-Forwarded-Encrypted: i=1; AL+hErHqFPcLip3RN/2N2oFJmB7lX3AWOOvakki6bYXJgbteOCxUWPN8XBYxfFa65vjSOvw4jDEmUt7S5WvQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/3O93gkFFc2wmQfwyO2P4U5QNY+t81mjPUGV5wyT2C3wyj3E18
	srydYaMlN+VLtYe1TmXB4jL9uZe9OumQwWP4zz1aa+lFtwgD+i9PBqClDw9te2jVJGc=
X-Gm-Gg: AZFdTZeYdGVYzjsOtfCgskcuPnFQCvAf8JGfuI6+DIoXdQrHa8Mj80PZLk9F6UsG9m8
	0L4Mywv8VAljBw7QEL2jvrg+jnnpcI76RxVRTDhhocNdBkS8MPaBXaQS1gNmHp7JmYV/thof0TB
	nfhduQ8iY8jgcBK7rfpfeaUo33eQnacz54z9Jqt1F7ghXN44icaegsgGFwyrHPaBwE2TuKGoYlm
	p+rMXsUPSXMgl0v5mwKjVh2Ah50X8LDyi6Itud4IaGLgVdQm41s4W7aMiYU8gTYNGyvroemxx/B
	HkavBog84XIPMMdnzQDVrkY+e6Se8fLZQ98cGhMmD8mkaGG5gtl0oU4hm+/Tx5PhOTAKCJiFPJR
	MPvvCkxYWGtClCXM391o+ky3STUcNQB6t7dF3VuiNpPlgTkLD8FUm8Tfqh5RA0FFgs9fF5ZaUTA
	2bm5eir0L8FHf7g/HfmdEfY54NfZI6Qf5NZrIPvwiUpC1nc4pSZbZtwkPUwuISivDv+6tPTgXgd
	OijibrW4LvQY/FH79/t+FcHckQamDX+tFljNqE+3GaMXwVdiT+WETDbYsVgDTrjeLLDwsP6ryOq
	TrOsEprcTCfsEjht97OEnH0dSmn8rz4vX5Y/gz24F+ESJYzoNiw=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr307426055e9.0.1795540466090;
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:14:22 +0100
Subject: [PATCH v2 1/2] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when
 ADSP is not used
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
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-1-fd05c8378a08@linaro.org>
References: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vqNo3GM+A7DfxIT/hVIqFbnwUFqt7CTExTLyNqE/XHE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXvWM97daWaPFipwES2SGc0Ov/oFxGUwx9p+vQz
 LbQ1apyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF7wAKCRB33NvayMhJ0TgREA
 CiQBZ/P2rFgLNgGP2YHvKZe+aKwVt3K54uoN7CMU6R1nl5OIeK9BB+oURuIHh003E7DX3eNpQWJvId
 C51cdB9AY37m9GtbAt75UyTxrVRpDYYX8VC2n7U8mO5kRWWOSLaLhelp19mcMixNVP65MPGmnkKpCp
 3cikncHfuFNpO4fHGJ+u1geYj4ZeHWAfU9L7b3+CZm/FLs3dYf1+x2UO5kNnXFWzO0+0wwb0MPN47x
 Lv3UP7KXWWj1jMoXnMI0JoHFN8RwwVTC1jH9SYhMstU97ECO+MKTnkqu3x7EvvxIRsvoVxAE/2w74g
 5PJJFMA7mfI1COwDLVsXJLpJ3Wefc2UjURbUJIU0Ql+7zRUe5afQwyARxySQrVE+m1ES6kkMfARvdm
 z3f4hBjErLptCz4INcXU+/cGWg6ZAoscQ4ZShZUSqp7NAbP2P9/W7QhcSFkR2H7aSZhrYh6dxnWps7
 dQRT15yig4XtUNAEBqy8OrabwAoKGSx6UG9XuDuCrgjNzMp3agzwTtO2DCfkB6Q9Yqljy4dluit66u
 J0CVLVSHhWdOAROT8tbpRU/x1SndjApe5tNFQPLzoiGhPiysqzyaMN28mlUQHEci61CcSeVU9jTN/4
 vc/YXRze6ci/ayes2idqo7oVZkl24BftEdcYZCZ7isJBWbBWSpNLzQTVgqxA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the LPASS TLMM
is entirely handled by the OS, the LPASS TLMM block requires
a different set of clocks and power-domains to replace the
clocks exposed by the ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index 1bf08860a4ba..7ca09c2c2dea 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -29,11 +29,21 @@ properties:
       - description: LPASS LPI TLMM Control and Status registers
 
   clocks:
+    minItems: 1
     items:
       - description: LPASS Core voting clock
-      - description: LPASS Audio voting clock
+      - description: LPASS Audio voting clock, only for ADSP based platforms
 
   clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: audio
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
     items:
       - const: core
       - const: audio

-- 
2.34.1


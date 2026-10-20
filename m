Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515863;
	b=D4xIkrqtX9ADDwSX18dZUJVKcfR/icYhwaYI2UO0c2MR4nJoO5LGbLp6GRLWLFpEVhEA
	 0OhPE9xHLL4P893UEcjmDH1tykxsplJQZs+vXUah1c1D/jkh2sbQATsJr/yxYdn+brjsz
	 3KHitF7JX9E3o6ujBf3RpdxfhPt16/rO7Q70DjCsg+XmCfZp8e2JksOVxVVn1La3nk+3T
	 L0lXIgzo0tCFxFdSvKOOvN326Czk+wV5SEZ6T0/TPFvTT+ufO5bYQ2XDqhSYGUbvr/WGg
	 +aMmmlFLoTCv3DTk4Lru9MnMvPPHCIsg4Js89CgOK5+6QUGwzm1nhg/+ry2ah7jQVcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515863;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sR+zDzMi9HFrsdnqSgy6DAeaNbWllNx84H/JCpIZzw=;
	b=dWuxyjh4tsFqS8g0OKFX9VNv4n9Dpy6LauIvylPnNxXQJ2BZP3cpPtRL+KRooR3uoOh9
	 loV8HwOcbelxO0CxBPNn12fjcg/EMR+b9F4JuraQVdSypwfG1hd/tIk3WxtFoY05Iynir
	 1uFTa5XA2ebiyqB907UrOAPGXy1hObtPyD2HqWBLVtiE6kyCqTLSB1qVICflNgp5EEyKn
	 Rz5+iJO3WIEwiWQG6LqT12av8q5ciiYqKVZZWli/c0qJGw9zIQ5kq0Yu7o8G1uX6ZFg4B
	 oFIhSr5Utj7mqkgL+PK1Xnu+Tmsplvn8MaQm3ZfUDEb5HKYpQO+D7JzK0RDQAfV3wcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F+6g9+a6;
	arc=none smtp.remote-ip=91.218.175.109
Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F4606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F+6g9+a6
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h7y1OEuGysqMDVk0RdcCkB7ieMe6BbeWyLj9fbcPZIY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515860; v=1; x=1793120660;
 b=F+6g9+a62CwMiy7K+Blyc3Im53Bi8PCt8BDwigujfXrnpSgOkNxLC8V9CIbvD9g1D9oLb75T
 tAh71WQMyKnsmaDEf5ZVtPeHmWbJ8l/T259KY0v93f0VdzCs36hpm3Iwla5Q+8TAlrwpS+uEJpW
 cxzHded2KGcPDLaAib3HyFjLq54pLz98GWG31fjUxHWsmMpzV8iiZk9RdGVy+2fgqL2UmLjtaAu
 Me5TrJpebsNDEN37J+chFLXDLse8CHkXhyBhyKGtWoqiHrCoEENBuzeU2GXu65UNsKiifvsPKga
 BIppkm+bIDaOrbDZZs6rXiCuiRxsFyFciQClVbK4mhqoA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28b23032f6087e65;
	Tue, 20 Oct 2026 17:04:20 +0000
X-Mizu-Trace-ID: 28b23032f6087e65
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
Date: Tue, 20 Oct 2026 14:03:25 -0300
Message-ID: <20261020170341.1641325-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
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

This codec can be used with a USB-C SBU mux to support analog headphone
adapters. Describe the mode-switch, orientation-switch and port
properties similarly to wcd939x.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..f15b9a9d90b1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -25,6 +25,21 @@ properties:
           - const: qcom,wcd9375-codec
           - const: qcom,wcd9370-codec
 
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD937x Codec node to an external USB-C MUX IC for
+      handling altmode muxing and orientation switching to detect and enable
+      Audio Accessory Mode.
+
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
-- 
2.55.0


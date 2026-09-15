Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13F4BB26D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491453; cv=none; b=lZ07lOdtVNuOrbhODp8mi35MjlA8DUglzLLjD0mBuIwFgONipg233VKcUP1sXnln3luos/s9Rz46CuZkEksYGzsNBSmPzgiLTEqDXtSyWUnZS8cCikg447KiKG1urHUkeyE9G77hZcNDUELH307txTVIgai9Bw0gaPXVYPy4PPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491453; c=relaxed/simple;
	bh=5BRFpMT2458/X4jlA/c8yR3sX4VMh8e71LTTWl+feMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1477TmI4eU8FDhr0V8TEKBTQeE7N545c3Mxyuobn6K0lDWxZVOylylMisLdIzKKQPpKpw8tifexQ2jumMAcJr7mkzoCUI4Tb8bIX+rcNZVtTarrbNqDrzonymWjfWPPW0Ge7NQaCYU9Bff4snrtqF7r6q+r89CUajdkNNj16w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNVxQ8v9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jx/wwdZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNVxQ8v9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jx/wwdZM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAf4E2836608
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDLD18vZOwo
	NWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=; b=cNVxQ8v9uOTf9/R2DFp7g4MNG03
	u/yaymYjBKxwwDwIxBHg/wABot4H9dgoJdX8cubcg7kTt1CMUWruht/iNPEoh+C4
	7mmm+886ck6QUkhmMudWdNzr9PjxQFk9twkHDFoQ4YxMK1gvyP3LuCKH3Zz9wLmc
	/ZxpQvceF+vJg3JksThxQM79sVBGYutX/CpMqUQA5yE1Tn57/RKKE5huUHsBnFPp
	jIeKBiD5LVR5RpdmuagDQ3dm6zwKlefcCK2tujn8xO3U1pckhaKGcoXK1WXGnoWY
	IEmHsXRNkv2UIY308/f6sWjGTvPpTQ7XouDRnsg2xDBx4W2sslJy5tWbpSw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpb4aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79014f0b44cso4174236137.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491443; x=1790096243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDLD18vZOwoNWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=;
        b=jx/wwdZML2nUTqxOe2uXuNuU0vM8uGndQw0ZZRHPDf6auVXy703sZii/d+OFlCfb1/
         LTSrscIYlBiiw9D6TFCbL/7aVlrGeAmOn/2UC2iqVjzshIpsSk7n/amHH+HmyAqFezJM
         WCCTyni/nC6BJsylgU7Oidka/Wex85uQDYyoby8WwG1hLHLc2SgN30pmekw82fGvnJMO
         iamWkAHNaa935fMBysoMz8C6l4RSJl+e29ep5z9VKRU4Ii2sIt3+YiW9G8/zAljdnR58
         0Xek7B5iXZslnGt+1A9UvabmZ+0OTzrirY0ZyIfgKebiXa/7Xr27e4ubTt33VFRjy5PO
         M+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491443; x=1790096243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDLD18vZOwoNWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=;
        b=dBlFyRj6EYGMb1ANL3LMweK+HrTOE5rDXa97cbUyuQSMCa93wkBtWk7s0wiEVbc+oq
         pzah+agAuUu+SrSEjY5AeqhEIt3fuP0eQwiY7ILI/nFXnHsjOoQVwvaxzlOeR26qnU6L
         z0IBoh/fqEVE8yugNqou6Nr3BHcKGVxIyxMXGVmVOLRl1r1FgUjm/+80PZNI3nyF80xx
         N4aWTWCs9L92idX41McQ60mk+155SvJS45IEZaa8JoxaWX4sEq1KIi4nnZR9UOn9FYCR
         G6aqCIdqWMQTl+v3d6eHOUqqqKXLrwsT5wUHfkpx4TvkF7f3LJTGdTUFmEQgXrxsS5te
         bJ7g==
X-Forwarded-Encrypted: i=1; AKwUvBzqkRwB2+sU1WFHWJLJcYW7lkuKNF2v1Af5SYYLGBUG+ghf7Ez30NV9wDYxUg7lipnknDQ0sPhdTYRA@vger.kernel.org
X-Gm-Message-State: AFuF++nLC5bDWvD1W0YhJEFtRnHSLXEL/c9JGAXHumIwyyQj5g5v0teF
	i/EoTuPtlmn9TIbEI52K4Z/kOMiSJPrpq8H7VBWDmM6KvNutZj+FclvNVaeUEVJKNGtfWTW0RtE
	DAvnhNYZtDjG51gHtbrQ8GQHtRxWN18eMWu+H1TZ0RXxV1V+vDaG63adpZfKrLhU4Vnzx/Qz5
X-Gm-Gg: AYBFou1lQPIR2CVmn8fDZCQXd8DOY1sF9eU0XmvMYeBxnUs4sGOQcPW5Hlw3x0mGr6z
	0GkrFvhsC3NzWFMkbyQ2H+PzguC5mIDjKOUtVDmwpaMKn8Ri/T+VNBRX3otcedcfsO1Z3P0rrl7
	dRigearEmVkcAgv8cjNoF8xkrNbHTV0FkFSBBJbbvU3JpH2WVsBZ0DYFDJ+vneaoge3qIyxJiPZ
	Vk/8cAnObyFxrwHV1zytlBBOTCAkzygTLrI1XRpd0wWFwrP0zguvgyLBr1GFhutjkgxmOjf3j6g
	vv0vMptGmbcXWF/a3FrDKO+mjd0NZMEjFY636Yf5BW5z6O3nvG6hUX2fkjIqNmD3TaPbIdKICyd
	T+dOwNMoUi69Ptg==
X-Received: by 2002:a05:6102:5e84:b0:79b:b389:d6d9 with SMTP id ada2fe7eead31-79ed744036bmr4241264137.9.1789491443430;
        Tue, 15 Sep 2026 09:57:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5e84:b0:79b:b389:d6d9 with SMTP id ada2fe7eead31-79ed744036bmr4241153137.9.1789491442906;
        Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Tue, 15 Sep 2026 17:56:49 +0100
Message-ID: <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXz0hiu/6WWSkL
 bHSTm1PYOQumdf1qVgx+yG05i2eIWhR/+FnjYZsCImimTQlyTFbA+mRRnf8FgpSjXbTXszoqfRr
 WAUKo6YPNxoxUAGwvKTTv4L7m3sdT18=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa978f4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Cry4eicYa5fmWYJFy3iRVpW4p1P1fY3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX9x/IQJ2WiFsj
 bBG2ZkePMqQkLaclL+GtzKaHc3n/+znPC8J9mh4vdfpUtxSDHw/ek2X3+e3N2Tr6M2SWaegI5zt
 Im+rR0wP5Vy4Pl7OFRbay7JV50PQIwADcAktBp9kRowSfkayZnW+S+MzBDGbcLoJcQb6xqkvpms
 tT4FDGXOcV43Py6sDtAKeytvcEct3VtVb10bjwZxaAg3cFCMN+I+MVZ9LE6KWMrTLKHFqJMz7fI
 PgnTwot2Kt4p4V+ac5Urm0Wh96ofxfhyvDPqKJSTVZl9pgPmAwEPtugj4t8Apm1YMDAGzWso+Hj
 5CNl0EKjwBskohHEv8wp3doV7pM+akSFK+C17nMx1EIUaTy3+tGkkDPB/+geLYnWOl3j6sLhXAM
 zXOfH9OCMScTHhl+K5VQDO0TpOl4Vm6gMKZJUx1E0ns3Z62hSEBRGptL7H4nDyC4r7tJtsqNo7K
 9WaOFy95gNISk6X0mzA==
X-Proofpoint-GUID: Cry4eicYa5fmWYJFy3iRVpW4p1P1fY3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150247

Describe the WCD9378 SoundWire peripheral which is SDCA compatible
soundwire device. It provides SDCA SimpleJack for headphone playback
headset mic capture and MBHC jack detection.

The same silicon is integrated in two ways and enumerates with the
same SoundWire class ID:

  mobile mode: two slaves (tx, rx) on separate SoundWire masters.

  SDCA / compute mode: one aggregated slave on a multi-lane
  master.

Note: both of them have different bus toplogies 1 device vs 2 devices.

Currently only compute mode is supported by this bindings, mobile mode
will extend this binding as required.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..9a6c309018ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 (Tambora) SoundWire codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  Qualcomm WCD9378 (Tambora) SoundWire codec in SDCA compute mode.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,wcd9378c
+      - const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,port-mapping:
+    description: |
+      Each entry maps a slave data port to a master data port.
+      Entries are in order starting from slave port 1; slave port 0
+      is reserved and not represented.  Compute mode uses 8 entries
+      covering DP1..DP8.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+
+  reset-gpios:
+    description: GPIO used to release the codec from reset.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: 1.8 V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: 1.8 V RX/TX supply.
+
+  vdd-io-supply:
+    description: Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: Mic bias supply.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,port-mapping
+  - reset-gpios
+  - vdd-buck-supply
+  - vdd-rxtx-supply
+  - vdd-io-supply
+  - vdd-mic-bias-supply
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378c_sdw: audio-codec@0,3 {
+            compatible = "qcom,wcd9378c", "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
-- 
2.53.0


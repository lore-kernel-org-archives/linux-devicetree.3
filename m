Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444CB44A41D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770326; cv=none; b=cR7O2JWvJcK53YdLf+dcEjNTORGol/c8qTX9gZalIyZp35LmLf5A23lnsVFQcvU3O9ImC2QSqmQguOkFefDvVF/LBqLfilm7t6s55eqlVDVJ7PwVM38kWC7Ke3+hTgh3QMsEpvER8NGL5KBpfgC6wkjSnlIF/ctLZJ2Fhi4ufSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770326; c=relaxed/simple;
	bh=5BRFpMT2458/X4jlA/c8yR3sX4VMh8e71LTTWl+feMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vjo//bm8v9ihsGcugL9/hdqJ3ZBFdSgeSsgwMKEVZOOhF7zvjS/NedYSsKVAj49eQKJRsAht6JxufdwSHgPaKhWkW6J7p30mydI7yeQGQOxojVzx3Y7gVejgAsSVcggk3Oc3YWpO43HS3UCQyXvMF74pW8D+L/+LWcUKHzKSADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+ZVwGFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezz8Edl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+ZVwGFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezz8Edl8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777N2A3352439
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDLD18vZOwo
	NWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=; b=S+ZVwGFX9MAu9gFBtvFndu3TRM4
	IU6/knzwcEG56mpDCbEzlFgBJT6X5ALKdPqzwWvlYwXTrRjZ9kztxdKlKNnp3e5H
	gEz9FvOVbVs4POPWBHUYslA1WibdPhgNSbETKNmSZj0535JinTEo8B2JUnmWBgub
	WKbDsr7dEOMC9E1NrZYaEp4Gd0a7NrvG0/y3bv6p9XaBfUZyTckrxtS0ZSzLPK8x
	8w1vuaSQfbpB/hbTW3G7JnpUq+pJ8p97RZr47obGShqMdWLwmBD6b/DAYFEoDs36
	1aZ/czedRfMb7DISmFJercsPcA8sEcEVZOj3BYDkP9qMY2o6i1CZVUVmjiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gv11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:38:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93975d63ffcso378566485a.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770321; x=1789375121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDLD18vZOwoNWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=;
        b=ezz8Edl8uk2ijm8lLfpqNo9+nMJ01YWPGj6rOFB6zLQJRuVneXfXRG8fdkfYwQMvC3
         9CTwM7/xyLSjojc2SakwAwV4vHplUCp3rKGcnE07WtcJjB+GzMMU2v1vgt3OXQBHn+vt
         3VCty6cycuslvQULkRjxBgEN8xEKT7XVL/h2mp5AZx31Aa1PKEsTYpYi4oCe/nBb1ItF
         uB1RAvNGTV7nVm2f+TFSiRetoi1jqqLbIo2RUOOdTYArDihjScxREDa+gx7jQSeEUsBO
         zyiZSB4ezRjRY0ybF5Iw35GQrd+JldyasKL4bKj62neu4aBIg0Cg7X9p5Sq8OHFgWy/Q
         ViRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770321; x=1789375121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDLD18vZOwoNWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=;
        b=V76xuMtoT2jjYDMRrH/o8hdUAx6stcJyyOwvJLP7oJtVPY9+rq2Lr5Te178jYk3O1v
         khlpG/ju6QIABFcNmG+0qtvz8g4DuRdjAw+a4/113Cthpc4RVOF2iv1glh+BwHOfzL9s
         uJyNEpo+QUifNGMxVaPRoAkbR87mlL68is2G552mRn1rTrNBdOTZocbmxd2AHXFqm8ef
         XfeydyDDeFvHAE+j0ICVGX6mhSN7k9ME1PQVMGyyia1/BtuQx4O+a4ft8l2tCh/MntMg
         wRjTx6wFvhDw8AvT73zWijjJDCyIusIIK58XMnQB7SYCmKV3nuXzaDthHnxBbwKF0qzx
         SoyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwLu1NXJVJwS5Hc6kj9G9AUSnVSLKtgYQxaH8L+iBcKzS19WgtFCu6qeEUeu0bPxndmjG4VJ12uwoC@vger.kernel.org
X-Gm-Message-State: AFuF++nPuTK0ZEiZW4jNcsvjar+f+h7THrgBNrUiZL2bf4l8XGz/SOHb
	ikQ20p8dTDV4L0fOqWfb7WwhnGBZ5Ck+Rm22XyPWrXJ0oUm5rsdrboy+Fyg47RjJzz2zcpVRqcM
	5aegpyYV/kwugLEK5EXpLULo8T3ersv5hGn0omvq2H/1XB+8HqXh3vEAqUMvgDOhr
X-Gm-Gg: AYBFou3it8xqkLhQ8g6S0l8KxoO/308vXxasEncE4tF/CO0cqyUWieQpZr/qF//+cyD
	y1QJDvLVCErS9/SLgoHjTs70Nq6w8gfKS4JWQcef7rWYGM0HvSxkYZMf3YY+5WQqT2o0LVCrhDQ
	JoNC9+Hbo9bapeK0r5A8QVXFJXo813VeIi6D3zMdiXxhCSmKc6ULb/sTg6Qqsa2ddciijykOXdQ
	hrmjRngLbDwQ5h/SS/s/FliTVvqZDE5BelFvLe0m8MMWuRkVXuenmm5UAvb4LCpCr7vLCPEPMwk
	G7CJ4tfYTebHlk5+YTZQiIXipfZwlFgWYICAZ3GZ7Ntn5OjYqQkV22lY8tdo+7Wt8cQ4oIUmtPG
	bah8NMsogIPNNqQ==
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2040000485a.2.1788770321110;
        Mon, 07 Sep 2026 01:38:41 -0700 (PDT)
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2039997385a.2.1788770320710;
        Mon, 07 Sep 2026 01:38:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 10/11] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Mon,  7 Sep 2026 09:37:24 +0100
Message-ID: <20260907083727.733705-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e7811 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: -mXMtg1xGsEOSa9T3Mr7nFeX7ATeh6np
X-Proofpoint-ORIG-GUID: -mXMtg1xGsEOSa9T3Mr7nFeX7ATeh6np
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX44iCd0UhK2Bk
 5ZEmJlmpjKHk/2aUeoYxMmhth3jDdZdzicRBmoMlSN60eRzTfYO+PynyrvDZjXn2l+ufqk88F8u
 HeusJfqhUTqWRH877qZ6KplM/NSJRqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX7LB2yu6kX40l
 bILvih7i6W282RFvIue1bTgKoghifqCXQUk5Mn1aTH3l5UTBZoPwllJgeOnZDHDAesB9Uk+1KfB
 bbhrB/IF1Fw9o6wIvYFkrVZIY5ITVjDH3xBZ65udAhdTyOSpBxD6BtFLR7rYqdeO30X3Y8+eMB/
 C6dFOO0nCY68jRG0gg5DzVIzngQ+OGP8hT8elDHvRGDp3agyvc6LPlp3bSU2yRsPfONLj5/mDTY
 7JBUTE4fIUazxgLM9N1dw1LuBfnGDmnNZREqZw54wxboF5+q4nI6fQ6Xry31jPR9zst0qW5eNx6
 IQRYRg6705E22wXFemvpjvhaTV1gNWWr8c62M0tdrZZjPXL7wDQ5BLCaqgKDCNTYxPUNfqU9o2/
 yJyZeDwZcXua7Kw5DDgd7BplzZ1ui/54Qb4+9hgW5cEbbHm5irYx92fQW++5HWz1gLpYvhzEAVt
 xXxCnqYChLj15v9OIaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

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


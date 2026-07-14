Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281443E48E
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040794; cv=none; b=PO7Kb+GfHvm5ouw7pZEdGiqD+zesIkZUa8HBcSI7tqqDouPcUMS1nNyVK38x77FvWyWMLDcrmbCmWGyMTrDBARJrhaP7zqkgCjxrP51vmBEciuCWKQS22U7TOXamia/XQ1tnymqAYxLAghfAGrT2ku71KIf9/AhJM2AA5loxu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040794; c=relaxed/simple;
	bh=mUsS+GvxnVmAQvX3tN/URUtS6qia41RXJhMZqg1lKGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NByuycy6UVbRUuBh2sT1TM6m1AlbvwKj7HZvJGsVQ1C1MKyhOMhmutc2Bn6mQ9XctWRn6p6sHZBSSiIMmpywMKTHOek+Pd4DUJwSHJ/n7pZ/JO++JHKFVmExDBMND87X08svQUKP4KV+XnFCHTj+Nh5AfdB/Ilo7140QZhh6wk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqqu5J1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCDDkfQb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqqu5J1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCDDkfQb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcLrv673940
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4zDumXgGqT
	zNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=; b=pqqu5J1A99a7ase9nLil+XdLSNQ
	ms1RkoTw0SogpVKN3ZJw8cbvZXJyrC5UP+Rbm9X5gYViDZPuPuuaDj1DLy3igNof
	PpSrTtNjbLn+CyaVl2UFN3blLzLPrZJwKhRFw5205SgLySBBlrNretFN3N+VJv06
	kTVv2PSak4LEsCvhilPNBFTunv6UKYM8B+3bH1b5H2b3i9K324vnnm+nA6dsifZK
	TK6KU+8xBWQughpzw04GXTeZBkVnXP6obYuFZ8jEAv6TXeJLpXms1Wo/YSopc6Xw
	EXJNojROoE2UtQonCKTvGiRgIP16k6S1N4hlDLrrjodDBS2gaJHzwg2LdMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0gg7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811ae55313so1095551a91.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040788; x=1784645588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4zDumXgGqTzNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=;
        b=bCDDkfQbqlZZdt0tV0MX/R9XOJyhMdewPFEr6wMb/fDhE4I6iqzqcwBJ+eNC9cagtZ
         MRfag3zctz6x8BWkOZIXrhmWvHfm/hNIbOswBv6xR+fm6zjnMjcwO7FMrmRrf7rwT0YL
         I0KY5BemJaKTp8fQNLuHuSBH56d3c0ZcrAxzWZe45MpaxDx1rwvR/2XVJxwAUwRX18Zo
         OUlWp0ZhNyTrhDSuaZHq/bTnvmM6iDwBvzaHl/koOUjdClWQf+3engy2wtFXVBHQFhL4
         hz1pDXoPbWOpVlGiBc90f18I+brVAYXsdHtjsTlNuhKoq0NnYKXdMGZYesPPMPr6/GOk
         aDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040788; x=1784645588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4zDumXgGqTzNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=;
        b=OG8uGTlSpIp3TpvVEYowoss7oxsbWsQP1s1nQj0IjBbMjO60rHFaWlIm+Ggh1mP5xb
         f2RpdczH1nuCahNWF4g7REzcqUDeLyzQ9xZek/kKGBJlwOEzmDcVi4YzCVxyObckp4UF
         7qUIpzhrR/+myCTuXrxoQnWGUeI2UwcN/DaWDVzbu3piunmaS4JqGaqVvxunJ+600NRH
         WfXVuKAd3FHjOMK7+n8Lfu1HR3we4Q6ZZWQmf62pvxtpuliGmZ15KrneOZZvtgDO6n3f
         Ta55nKTFq2gWhRSgcAgKVISDczxrE4XIeb2WkCj1uTlF5TZIPDqbgX/Hnj1Vh0z2uIUv
         5U/g==
X-Forwarded-Encrypted: i=1; AHgh+RrCB5n4aWZNf2EAi9BCU7ezj0rGVSmSpadg892eygM/VJQpS1j8uj7Kah9aO3D99JhwdFqlMxHTv+RH@vger.kernel.org
X-Gm-Message-State: AOJu0YxFB4hXHgQNWuVrA2FAOUpGuS8N/QyJRpq7h35HcXhN+qpKw3/i
	c5JHCLsnRArzHl689Two0Ir9JayC3clIBLnmq3XvMeuCmqgHIaalND/Y+EyPphfPYtGRNHHXgad
	lJuIX6VZGIMNfVEW/Ewi17oQePIEA9C5ZyRxZLzNmtiNcGI1LUh2sOZBWJiwbo6rq
X-Gm-Gg: AfdE7ckVt8oVmW/JsGM74cZtquK/i7SgTRypxbZFG/wCiYl7UrEYCCZGSPc4yBbjF7A
	3Gl0WDn+K4Zw36qeJEj1/gBPUMPkaU6Z5ru42Q7qwunUt+2FdSDXV7aeumLCGjwH0iBnh5NP5mu
	9ZBkSRsmTO3Q5Wd4Lrjm9Xrc6ohIRd+FHHeBOnDhBFyhLl6JqpL7gmap620VcnEtUfbZ124TSWc
	DIxIyMp7yPUSaPuPURpZ2maSTO+ze9lWHVC8qHOXC3vwgut/aDUizykg0m+exYXzAW1CW+JfaTj
	/3PZ/lzrkU/A+4g6MtGikHqnx2fmVqTLWThyugKL01mKSoVe6tZycCPpf++OP1c/Rl9nXpS7Pj+
	f/LIXBhNUvGwnWurIi+ECOMa7BbzHcVcye36xLunEdSoZaPM=
X-Received: by 2002:a17:90a:2ec4:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38dc7b3f843mr9709051a91.21.1784040788236;
        Tue, 14 Jul 2026 07:53:08 -0700 (PDT)
X-Received: by 2002:a17:90a:2ec4:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38dc7b3f843mr9709020a91.21.1784040787736;
        Tue, 14 Jul 2026 07:53:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Tue, 14 Jul 2026 20:22:48 +0530
Message-Id: <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX+iQrnpAUvauF
 z1q4lR9Y4F2pTWtXnyTrHS/clYRj+ZzEKa8QekZyYg9k7GaYlXAM3TU/EIxu++OYswneMZhFFd1
 GqgXL/sX0R9vcEwZq7OHnVmJfgLkKIg=
X-Proofpoint-GUID: ATFr-MId80yGdZiPQimi9YR9XOgWicyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfXwgcZHnmO7Reu
 Kbxqv97b/qbZ9qcrsQ4XPB52kOAHk3WagP2AAnNx74FhusOYsrT7yxxRvnIvqe1QJ3U+8NgX0F7
 KKiDPDt2v3sB4F63xg3/WqaygW8KEHDEuV72TE05ASYgafCdAVXV3a+3kN2/UmRnhMuLKvSoVgt
 DCDCRDAN+oNUeLboCjfLNvkVwlPvyzmvYDj0IyB4MuSWAjAME8GrzbX+w5WYtgGDC9hepbRF+dB
 h3a07W1CqMLfg9+UQEww220V7UmNruaW1LINkSRSJ/jfXhB2w2uXG+dp9JHixTo9GFm0mGE+kuB
 nAj6SzRSwIFNtjuSNVxBzL8sUxe015L/HRYZ871KHn8Uvg4LQcbYHnMomGecjs/dBww6uImZyMv
 9GieQj29DArueR3acDoT+O6xEnZ9quL+XjhrphiOsbPuwQXhEQ3n3eiSS4BsWYdpc3D7cN03dNd
 5xZq6CjUYn4C3amgMYw==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a564d55 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VOP_JMduspszKC0JWG4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ATFr-MId80yGdZiPQimi9YR9XOgWicyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140155

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..b37c62ccd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,82 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        maxItems: 2
+        description: MI2S clocks (mclk, bclk and/or eclk).
+
+      clock-names:
+        minItems: 1
+        maxItems: 2
+
+    allOf:
+      - oneOf:
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: bclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: eclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+                  - const: bclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+                  - const: eclk
+            additionalProperties: false
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +105,20 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@10 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk";
+        };
     };
-- 
2.34.1


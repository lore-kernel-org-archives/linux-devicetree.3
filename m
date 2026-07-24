Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FC44CAE6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917515; cv=none; b=hddK4d15BDUoeF/HIyYPf0TmKVbOfBHBuHTI6mzHG0uac7w9uBZJ3Li0MbYlpYiyDQM140onxBPVNlajmU4uzjaFnD31dxeSHAXr6OeFwaWVcf2awhpbK5VRuxBVltYQyeEEfzxBGF65tyHE3nE/DfaNP6eeXkI8RsDAB5891Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917515; c=relaxed/simple;
	bh=fplq4MhiYbjZ4gR4KmwJS2Gi90zzUaka3YGluovCwTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3OLp+nu4fVaxlNMTrb30WYFMffdFMaNEYAJYlNZB0RdgZ1nvkzQhASc2tle+60Y/vtchmJSZ37X8pxGgWpJGCBNJwo4p8u51rfucitSIuhSueb+dcr+WUMxpxRgdgeG/ECgqhy7M7JBJ4UiMD8VfyLUbSyhgrD8v15HubePQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4SdRi0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5lcuFEs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4SdRi0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5lcuFEs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqj3G3755687
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Boq2riYmih
	qWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=; b=o4SdRi0HVRtn1DQM9PQMXSDDD88
	d1ybj0+92oxGebYkNGXjV93hqAYQVwUNlyTlKiA2kCuDftNDQzd1N1dafNxm2P2W
	DaCWhyErW0czdgxiWTNfF/fFpalP1NYGPXzh35RTWq7KtSL0dmcQyiQvAJBGTHLp
	9yG5TSh7Ft5qOutp/uE2PxzHg3ixmLUSgugRKwmtIzTqo+w5HyEV7i7WJofonK91
	e702KIKKnBktZUX0sK5Sm+mvcq+hasCLiey6Hyf0UGARsQnWAfjsJUBCmXxPzjkB
	iWjtrUShWJbdk0e2/HnRULWV2H1J0ebXBRU2qCqWGwgwuGDuQN1V5eqRUHA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmb9nrfrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:25:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so987136a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917512; x=1785522312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Boq2riYmihqWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=;
        b=X5lcuFEsH6dVeaV6UAxOlUxIx5kPL8vJANpn1bCp1cdvAjihXarW/9IUC75dKOzy85
         brtIdA6p//aqTyYaZRsZVxH5Qhlw/6DyseJJI+c8yepTGNe9kZW7tmMRPPKJV9ZWAQ2U
         7RDFbV7/dTtjwF6OtaCMEkKnHoSIidJQM80xHXW+07Ac/XZXm7REPMboBN3gZjX72Ix2
         RtwZnO5p8DY/jXb4kmYpP23EDKkMHrtbH/9L8pMqVo1mJA9EZG5ExG/cYX5aDpyVkVX8
         A/Adob3YKjeoTKqKi5o/6w6qnYd9oggjMI3YqqQZYvvsKRwBQNtfvHr112o8f35lYsBe
         lKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917512; x=1785522312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Boq2riYmihqWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=;
        b=S/LQzz/jJ63A9vRPDZY62/ad8HCocR0Mj1fKwNK8KsLDVDEzwKOvBFnHzBZ5xWLVE0
         SIPRaanUBqrywRb6Y257WphUHNj00tqtBJyhkxobKPsw/Eu66GUEbBbIdOTOYOv7RuK/
         0Az7CB8Y5I8khnNIDhGbfe+EwNGp9dAvhPd29qFWxU/PALJgW1mbKPVgtqSheKx2vF2o
         2GtFc2ct77pW1shOGJ+Hpdq6rXtfSALTeMaRx66Rh0rubV8UqxojaiMhg9PolNhFokxF
         nvp+Uf4Mk0878uBKM+QOt0S9DBY6nzfbw0uSAvOB0622Lih9leF64cpNPUOiVPNi6jBa
         mp6A==
X-Forwarded-Encrypted: i=1; AHgh+RrhhqITB9M5bn8zNFEVymqTsUgjFUg7uwv5aGbpGVXPQK4pnvYjkPGkZ0xxyNrB7r/vgp9N1lYGqR7H@vger.kernel.org
X-Gm-Message-State: AOJu0YxgutnV+F+hNSh4h/UUiegRukc31ecjZpHqoEBeyQ1K7WlSuzZ6
	ZyFZbl78ax0qc5qW6uh3AobxpoNPnCdaiyd4qOl35Ij4tnRlpc47ME5T/wEqv3vIrgRBYuxSbEx
	MWfuYA1pLANQXK1Lw7YhojMzkavHnMHkcqAgviCpd3Wq1BlTjbRlDkc64O4cbVp1a
X-Gm-Gg: AR+sD11AZEtgKGzYLTln7dKTUGTWJue4IeKykZIIsTPzuyqZjpqE1BEA6nTY0v55o+l
	AyadIv1Lw1/qSOyNRc5xzkNeS9wIEjI6zJv0Fh3K0b9PM4tk1pBftcKNaLbGLEedcNfbLkLv47Y
	x2Z5w2vR3na7Xk9ijKhRlHzluDmRdkRwfxnRQ8IstLTzmBk//iSXV+/6Th7kge0aivbGAgzyXxX
	wJPenK0QCegiwoqhoceP2dN0FVXiu6f3tHd5CfWRmqsVi0SAE0tlWzBqoPxefKjYEiFy+NtMBhs
	O3QCV4O+S2XQEWu18edkb/odOwC9g9e6nFsP4ryBnTTcO9sbnKWTJ+pgYBPuIF9IJF8dna5PHDv
	MulocIz82QwPgRBQ5Ui/8RXH2gekXbMhCrmLw
X-Received: by 2002:a05:6a21:4613:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3c44af76896mr9889596637.5.1784917511934;
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4613:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3c44af76896mr9889571637.5.1784917511518;
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a67f3sm1669324eec.29.2026.07.24.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
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
Subject: [PATCH v7 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Fri, 24 Jul 2026 23:54:44 +0530
Message-Id: <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XeS5Co55 c=1 sm=1 tr=0 ts=6a63ae08 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3jZq6FF4vXrVA1D6PBYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: DOYqIWmnmXqmROAhA6mr5BIPhdin280W
X-Proofpoint-ORIG-GUID: DOYqIWmnmXqmROAhA6mr5BIPhdin280W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX3WOgZ4q+wK1Q
 WA76bZdJSBhiPgqqo7ZlsoVtta7LnIGQPKT+1KhdDTo0ul1Ycc7oCo4mn1BU0aGZ7py2AsYNbVy
 eUT15xLjqhnzHBrT3RQJgcQfXUn80uU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfXy9qx6KNgf55u
 iZ1EyhY0lz73CPqD0JlTLTXo9yaYxNdaS7h0bH7CYwt2QlEljdzca01P47/41I9kc3hMTrZsHMQ
 tSzWGLqD+1qJZcYiLYQl7/oz8cl97c2U4rd34GaAaJ1fmmRVEfkGnG7orTsifqdDp8KWizs+L1O
 4BUGISFfQwQZ6dczHk9uQ39FWj5HEclnDTeVWlapVP+D8mOPbR7vRztrZpLn5De0h/m05H/gpI/
 UTkQJwM7WfNvcYygDHqzUwe+u26kdLRUUz5Ferbk2W8NPWVP3PI3VZfM6Rkv34VzjKkC3A7dQXO
 OdrvqnrbgPkci7KpUsw+F/nFP5WzY5UKb2yOe46hWX2YFzyKpPtazzA4iE1c/KjXGeaYy7en0nV
 FRpbrsxoCBvE1ZkPKPpnAjdDUl+UdyY2VXB2H+Czkh5x/vJ4KY6jpJ+O+SforL1L6A3WkUmdOIi
 3CJkkndhvxYj+8vI+Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240165

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
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..4878c424ef03 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,43 @@ properties:
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
+
+      clock-names:
+        minItems: 1
+        items:
+          - enum: [bclk, mclk]
+          - const: mclk
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
@@ -29,7 +66,20 @@ unevaluatedProperties: false
 
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
+           clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "bclk", "mclk";
+        };
     };
-- 
2.34.1


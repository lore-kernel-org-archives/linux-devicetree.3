Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45733101A6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885841; cv=none; b=n5TF/wsPbiS7AB2u8TytECtmIRyELtXnnsms5uFWPr0QJhAactgkd2L1mvOElPcZpdR+EUY3d+uxmE38qKBdHk6IMZWrcCIMwGHixabhBWemzEue3cOIHGHzHEUzIuHn1NhFYmift97kTtdioAbJYKl2FJ8Ez4BHqduCbRAQXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885841; c=relaxed/simple;
	bh=42VpR8ugAARHyI0wmOQZp/rBCGxgBSiRrJQELIHnh8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VkL7izlF/noGSJt9jrnG5xKMOH2CwmZYuXrj9PPJh71JTASMgL3RYvFpVU7OzLdViD6CC7EpfcJIFmRlkciD+fde4v06+LQpmBQzGYssHmw7fJQb/gatj36TLYHwBKZ5AGmnVIRww9vhl7vIkRKQ5qWlO2c7Zw+Mb7cIVEWeckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWBhz2m0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5t8OE34; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWBhz2m0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5t8OE34"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EuA31957902
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 02:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IKc5Obhm1v3
	/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=; b=eWBhz2m0o4dB3nYeHqRL9JMfo3G
	/Wq8MjhNV0VpLkdkPjX1kI04Zrf0vL4n0OM0CqINRu6ka+nOQtzQ71uG59PvZg+1
	+cZBtUkfxRllUzcKbxJCZhUwMq7OAWnGOVwAS+6ijcXhk8sHKgHGSNTgC3EjxZDY
	UfOliPtgSg34AYcWEOhBMs61iuWx5nP008FTBFFRKL6eVm5rqJaJ0YEOoqrZd1S/
	xhflQXyx6kDrGIJiaRhqhG0uRCcdmWzkDspBNjS5bqRE3C7udDdzRQxdUme8a5WR
	hFhLZIeAT3ddHuamm2Sc4ev/r5dlOkG5obBM1JBBW0wNqLguGo+hlDYWujA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6db9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:30:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so28092575ad.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885838; x=1781490638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKc5Obhm1v3/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=;
        b=K5t8OE34B29tH9uCHbnM6suinHcCqyE8n62KSh70HJdEQiHBPyLa9vkn0C5finBn/r
         YB8C2n/w7doOzgmrIhDoZcDKcoIojfPdR2uEBstisNAupOsoG/XTTra6cNnw2xa763xR
         PD/arZWyZy4wfvwFRSpqVpkzOapY9JRsZi/bPJe2ChRl9nBMaz/I2RpNaGCOIqUHaO2F
         QRXlvlaLqQd4zNQp3IOXo1KcaM1SLKfNMYi/U2SO//YbMaT2m8bZzL5WB8kd63BNSxkq
         aXhT8u/rz19OmvuKdRngTL9Dw6dZ9t9MZUvvwlnDdd6//x8yagDNGbMS/7q/8ZmmE04b
         nwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885838; x=1781490638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKc5Obhm1v3/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=;
        b=O+8Og3ubcZbqBlEOWps9Dx6o54e9ZTkU1n+AG6ABWRHjFRHkma+W2iiyUn/OVX9aMa
         eMCM/tvstWPcNNczjUhTn6jV3OKLo59t65fzsAYHIBqLslkZUosTVDZk9HStJRVWezjx
         0jvudX98SkNZ+QoC/M9B5oq67OckzRQQUrmb2Fp74OU7IE+lIPGwuILIrVKuNjK7Sg8F
         RZYFg8oS5e8iVHXxBEXUs/PO+quJocCW21oinoDXTffwPSKWdOuZCvO1UJP/26MZAJSE
         PZglO02ETsuYi50zkVVWS6DVRnpVwA0fdVizRLLxfIawTsgs3uyjRv4+1jy3jyLiKUCM
         ypKA==
X-Forwarded-Encrypted: i=1; AFNElJ/syL+RKjZjI2Z4NEXRSu0xz0nX1QGdIPjZzNVFfTxBbKWg/6B8skBsVBywrVR4HrQ/BQVIZLykvxTq@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVz3h/bC4oQPRWcxSwV440x0jVuxmh9iIANIwU1x/7U49xUDj
	UuZ8U2DHq+SVvAedhpCPYYD+DUOy9C40+naYgV6CU7BJzcosVkbDjGLmVqf2PsTSUk2/po7bLVp
	umImigwWtiS3Ff61gmsVNZjni4abdfibMt7N+e0raSb/KxuB0heWJdhAOo4EuKBbL
X-Gm-Gg: Acq92OFjPo2sU9D5Eeb8pKtmYmMB38INFs/BG4HsPQi59jEdruG7lGk3O+TbVrUC6X/
	qb16BiF1rbqfyZ806BmX8XPnGe0tSIfkdoDNBNMPYWUrJfc0NyEIUq7nGpiilK9GU4tmN/J29X5
	5SzsqT1cmt2nQLhSZ204mQ8P62X37/D1XZibsKDzZn9Mno/bkHuZcrjNBTR0pUWHtIxRCanB3Fo
	PQ7AetzGRPbzaHcWY/y2WbFr05wmO3W1qqCg39eUjtg8EJgest3P8iGR3zrxg2GoK9amMRyXDnK
	chLJSUVdRnQl+Lmv7/AgcVTC/tKRX7YDJT+TqQBkPdwf963TUCUwkMNSq3BJhOQXJZekeG8vITC
	da9N4ylopnqKjWkeS6S8KG0bETJw+CZfD0L2P9SN/ftn8CiGs+0oyE8n/efYusOW1Qt1S
X-Received: by 2002:a17:903:2348:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2c1ee755854mr149411855ad.20.1780885837687;
        Sun, 07 Jun 2026 19:30:37 -0700 (PDT)
X-Received: by 2002:a17:903:2348:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2c1ee755854mr149411295ad.20.1780885837094;
        Sun, 07 Jun 2026 19:30:37 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:36 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  8 Jun 2026 08:00:09 +0530
Message-Id: <20260608023011.942228-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a26294e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NrbrONOL4QpDeGKfLFoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfXwj3Y6oIwJ2bU
 ELQnHuNoz0rlcxWroCU1X/v6aWcg+rfnCno7RSHBO8BkCXV2PPYNfW0y+pk2FgHHikPv3axj7tJ
 MR0N+Mn6z2oFJsAM39RIHghUr/8wZ1i/Cu1d45glxPpJT7/4QbbbsqV/V3mcAH9pY8+LSU2pMW9
 PnIKC+q2BUFy0jh15idnhw81ESYvt8HP4J0KzUwNs+xEDVKGwGyxjX67m24FJ5K2hrOHCxwIeOY
 TG2bXGwFAEK6mJFjuaCUrE6SdsVHm9s9pLK1sozh121p1YyVebkstLakVyFiUuEsNTQiWv7gmyt
 CrN+nuid6AwCSC5eEyZUPxdwRlAuTYwKbQEdxHs+Qf0Pde+oQkRepOX1MZwRcGftEhLyecPeEks
 TWyXn9Pdg7yHCaVO1FC5oUCmNWFWLSdURiac0jnJZqv/ObjAfPouU/N5RP1RluVLhwn9t3WZ2Ql
 ixCnMrw5g9BxA9xX8sw==
X-Proofpoint-GUID: 4YuR1sSFDfdmgLMiLZFWwXc81thBlF8I
X-Proofpoint-ORIG-GUID: 4YuR1sSFDfdmgLMiLZFWwXc81thBlF8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080020

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
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..4c4c73778 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,48 @@ properties:
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
+  '^dai@[0-9]+$':
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
+        items:
+          - description: MI2S master clock
+          - description: MI2S bit clock
+          - description: MI2S external bit clock
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: mclk
+          - const: bclk
+          - const: eclk
+
+    dependencies:
+      clocks: [ clock-names ]
+      clock-names: [ clocks ]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +71,22 @@ unevaluatedProperties: false
 
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
+        dai@16 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_EBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk", "eclk";
+        };
     };
-- 
2.34.1


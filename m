Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB041B8C8
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800358; cv=none; b=E1DKWovM+Z8h0roEA1nXB0SQwzSXv14Dzr/bqfGBwgNgrAL2Xa10oVJ7Ddfc/HqU+xjScUk2nUvRO10EyCZGzLOMbgUPXZXb+Ntl9X5+W3nYaFQ6/FCy1OQWJSrnePZa53+YSJXD3lq30Cv86hDSkUAenb12bOaNJevfCUbFIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800358; c=relaxed/simple;
	bh=QfGSFGB2zUjQpsQr9TXhbDCh5TDz42RLzw1jqZANOg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLdV9E08hyIQ3JkpxE9DfswJo9YbtRqtFFWcBcLTwOoowLibJGc0ALqT9ArmZRhfUSOjaxaeKe2Ncd82vNXxB5Fq/kZMr25HAYtsUdiOltsPvthSGTjWylsJCqWQNGyF9ZjlPscYTCOcgzbuCyUFL6oIsoWbXxa6+IgXYEkmvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4wl1OrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp6HHZNQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4wl1OrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp6HHZNQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDO3ei667563
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nn+nmVjR3Vk
	7Fg6ZHUBKdnc9okFTEAK8UP/Bxa+B2zA=; b=n4wl1OrEpXCV1JNkjJXrepFx87O
	3Qte7hMwYJpMJBhBnBvuqrfl3ZasVCklQro5CStLrxHNh0KJXLHDKk564AQTUGb6
	y45U1TGRH3vIzaAGSQycqT2Jl4wRKVr1he6k0j5GJvLLbpeEjfbjcWWoD+1lVGFj
	iORjk3rUOT4yblKK3CAq4YAk/D2A/hSX/jkDKTNLQptU3rZnnHFhtI+vR7wHgOL4
	LcyPbAOmQqmKWD5Mu0sMNJ97wVU3rabt3ghEdm3bMrRncx8YWUJE+PMPGfRTO/5n
	m7VBo//OrPGZ9TO4FNf5a47asdjWUQLIDbE5kEw0rSmL8adSJo1+TxJ5CsA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gheh367-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so2444621a12.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800354; x=1787405154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn+nmVjR3Vk7Fg6ZHUBKdnc9okFTEAK8UP/Bxa+B2zA=;
        b=kp6HHZNQ/wGLYyaVAKR0IKoyu9GQUb4kOjOFJPz1H2hFXHQq0QYNg6fwHMLGJsAKdv
         qrHvTOSIjJtQBIG0zV4XHainKm9+dgs/B89hIZe+W2tJ2phjkZC0fUNzRZ6YwGoogTtZ
         Eil/LCjurazMUx5QvIHmY0L/+oKl6irFviYhTEqiVNnRt4nRE7J1Ne40iu3IJUXzhWGb
         PRvS8VCTNXOdx0DAUtsk7pmPrc0k01npuaC20kN58CxYt0uY88TlswESMrZ92tx2kxTK
         PICP3+h1koQdXyllx+DULpzlsngujkcm2aWZ0q4dW4+SPx2nXj9DFyj+YmPalNtQbvAV
         S1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800354; x=1787405154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn+nmVjR3Vk7Fg6ZHUBKdnc9okFTEAK8UP/Bxa+B2zA=;
        b=IfmOiC4xdw9N4q4J8iQqLdXcN0eufOoF3HaxTeac4LqvTo2Nrgv6xGhqoTbjiclpDL
         fkMsV6YgCzygc9jBFXJI7SkXMtmfV3ObEhjPMg47bnfub/LZxSBRCZXefmnJTMMWhT8B
         Ht1HvzAzvpeiYvwz39e/IrVfswwIFmycrTWcm9TXfZRuX5ZaB1Y3d/Ly7YS7LdqcZGGZ
         8I3k42r6clZw+D9TTDOAjHg9LlU2WGziF+i8f9eN1c00f/nBgiP6CCLrXnhGUPdypVav
         9nykeMx8LYaRPrLdU8skgQlgBy7e8huGFL/SObqaNsUiBuZIHJw9WJe48MeJhhM1RRWX
         mxZw==
X-Forwarded-Encrypted: i=1; AHgh+RrUPx9A5GgldyPP9J8ksMYQDIzAq9WwDabm7/CF1iVwhreEb4ukI3RQWDw/NCqQEa6ud6gi8P8eEYrv@vger.kernel.org
X-Gm-Message-State: AOJu0YzWA0ul29s5z4aRN4dCcW9YsJd2eOgJz7IC6WFEUGqMITKT4Uij
	XRKFcC+Lp2j+TIe5KIyElpf9uc8SDvGMH+nS5/xyZUBae3Ftk+pYFMzhq8HNgzddZu2jb4rGA+3
	co+kMNi1IWunB3wsB5T+iq4fVOSBlNUmZsEBt4mp8YGd9tx5ASVrJupwT0fi535E4
X-Gm-Gg: AR+sD12iQ0KcDkwLI2H0fW9rftuGBlmYQW8bEse5WKEd/7thhNtGhXV6+TTknQVmFvR
	UjYt53x7cxVxSEoV4BCyFQ5QqIwPI7PcO45FyNG17d6WjyU/ygCkKTMPQI8LsJEdYZSOpDBNnJn
	94xt4GaErp1HqE9+ytYRBHnj5j6hW8GnPRjs3nF885CeWh+GdMUzBJ+gdSxaDrLJ7/hYbeFmhrD
	ZCgM6No9dHrp4XUTYSvlbf7OO/E7wP4OfNb6MmklgK4fKHt/mRj+264J4AWzK66/jTibAVNkVNB
	Vk0BLqMVyBcDUngXKXrPcvoKi5YnfUVu7YJx89aat7Pz2xJVeQsqrfrGhpjFzbWC+zE8R1nU23y
	3Wp8cawDPEUh2je8NQXWDgDFJO5KE6YhXG0ILHdk7wxeD5CX2rv9JavClXYLw
X-Received: by 2002:a05:6a20:d808:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cc71e3381cmr15339881637.33.1786800354440;
        Sat, 15 Aug 2026 06:25:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:d808:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cc71e3381cmr15339838637.33.1786800354021;
        Sat, 15 Aug 2026 06:25:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/8] dt-bindings: remoteproc: qcom,nord-pas: Add qcom,cluster-root property
Date: Sat, 15 Aug 2026 21:25:34 +0800
Message-ID: <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a8068e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JpIEW95_PAHRj95Iza8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX0cAcBsRTkvVt
 2HGySpIxOfOnI9zEI3RN9UP4BV4dcpn/7kDLIMpIE92CJA4qGDdduAljwAze5+g5fIm8JN7G4I4
 4wFivIE5QkCHDRCYuk5D5oCi05Q9qJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXwmQwTlwTsjX5
 DOEkseH1fQ4vm2ClnbthTxM+/pC2qTZP8LMQoq0CC8kqRSqdhHOg/e8RfHHnyAjcQw1VW+jmUcT
 73EfNoVp2x1MFlxWOg6xotrqMbOxWOHVLTw5EmJeDzYT7N00Kw1pKjPIb0e4dTaIX7XVnYwv0rF
 1CMzgYfMXtflw+Z1HSlYWI7ETHXi8dwluv0HS5lmHwfVrYi/1U/ppxX3exE25Nl+WWwifLPSwEE
 YGq28EvfUvwGl+rO3zn3umQHrpBvqi2XWp+8SChCK39Q/aCYj76YATC1KO7W5Aw1eFxrSoEf1n5
 uDE+lpPkSWtr9UHnKdvOdEEjjIDHaNeaq9wG567GNYwJDzLp/lHq0eIOA9rK/yONERNV1BdlGnP
 2Jyt/GN7gh6xnMpJrBh+WY1fsqpSKcbAeWlqoRM7EqZAw/uZRiJx2Jzh44TWaa0DfPk8Y7ZHHS/
 4NomEegPDSgW4jgIlFA==
X-Proofpoint-GUID: yIdm0cd2zLvDaG_7y5xNvfkiOXFMwIPK
X-Proofpoint-ORIG-GUID: yIdm0cd2zLvDaG_7y5xNvfkiOXFMwIPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Document the qcom,cluster-root phandle property used to describe HPASS's
ADSP0/1/2 cluster relationship. Every member of a cluster carries the
property, including the instance owning the shared resources, which
references itself; instances referencing the same node form one cluster
that boots in order and is torn down as a single unit.

The relationship is described with a phandle rather than by containment
in a parent node, as ti,k3-r5f-rproc and xlnx,zynqmp-r5fss do, because
the hardware does not express it by containment either: the three QDSP6SS
blocks are register-independent, with no shared register window for a
container node to describe.

Also add the qcom,nord-adsp1-pas and qcom,nord-adsp2-pas compatible
strings used by the non-root cluster members.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
index e90d2953ba69..58d88cb07e52 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,nord-adsp-pas
+      - qcom,nord-adsp1-pas
+      - qcom,nord-adsp2-pas
       - qcom,nord-cdsp0-pas
       - qcom,nord-cdsp1-pas
       - qcom,nord-cdsp2-pas
@@ -89,6 +91,19 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  qcom,cluster-root:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the Peripheral Authentication Service instance that owns the
+      resources shared across this DSP's cluster. HPASS shares clock/reset/NoC
+      resources between its ADSP0/1/2 QDSP6 instances, and the owning instance
+      (ADSP0) has to boot first to initialize them before ADSP1/ADSP2 can cold
+      boot. Every member of a cluster carries this property, the owning instance
+      included, which references itself; instances whose property references the
+      same node form one cluster. A cluster is always brought down as a single
+      unit; any member crashing or being stopped forces every other member to
+      crash or stop with it.
+
 required:
   - compatible
   - reg
@@ -101,6 +116,8 @@ allOf:
         compatible:
           enum:
             - qcom,nord-adsp-pas
+            - qcom,nord-adsp1-pas
+            - qcom,nord-adsp2-pas
     then:
       properties:
         power-domains:
-- 
2.43.0


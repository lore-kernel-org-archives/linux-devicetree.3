Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441F3C4575
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782532; cv=none; b=flHFyfPqwBZ64GDeMt0p11Cv2o9FnkSMtzG8LAEOa5xJ0pu3B3mxVrHrzKOgd7ubBeZk7kYm5tR/jxkW1SYQaWkw/R3xyJnvX2dNoW/65aM1yaWC6oQ7YGETb7PJzyeR3x6324PJXPlMaldiC9Hi5tXD8gLJlsklr8KBDKtBIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782532; c=relaxed/simple;
	bh=iRtdvRTDQSfdyEQ1b2qU5Q6iD9i2989RKufwXpCNRqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0RFc+X+BgOHKAFtezQQqKdPAssT21fQ1pfCTZlicT8+FOGlQCCmU3/m10U36q61DRPFrtZLEBTnVv6TxzG1SB9GsM9CNpxx2/YlxZPw8AD58EGymP9tFirRF+lQqaGS5VvN52Tsujcg/lLAuxP3u9pZMagkvjq4bVAJ1CBljfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q077ZOca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frz1cNpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q077ZOca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frz1cNpH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArmTE1055101
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LiOrWOZcYYg
	JyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=; b=Q077ZOcav2PPM0hXuwhBfXYt8nQ
	z7eEWw/LAFmplWbLmjnWVrlr1ylG2/8e0GyIpOsSMOVakpJTxkx/IqRIIjBxHqlT
	RyviRx7KXJN7Z9VLK+NJZJWl/IBzCmJi78LjI+2mEDCJy3yJhzTa4MzGptMsmJdj
	hIMV3Oy3WcevZaw55vr3DLy+yfd9IW7yHFGDP6UhBr/AX9XA4R0pFyB69qOXeUxB
	jrYPZc1kh/5FJhXiyGaFnstKzmY385C3BKfjUVE33Jh9YVuwBxGHiBQk0Jw1vVSi
	VmwoL1pI7sw0USmKhitgDo5W/DcMrXDSk/IuYzkGjCTzHoBQcA90foOIQOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cca8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so984258a91.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782529; x=1782387329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiOrWOZcYYgJyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=;
        b=frz1cNpHjjhDbFEtzB1EADcPOxVNQ6Oymg5VOS8VFD7fXi4kKNeC8/2bzQk2X8DPce
         zqPFjUVuerlCoRi+ZuCQOFTOee0ZxJwboEH3wcDk7Fykyf3ZRop7JmAe9grSIlgZeNsk
         3iXkoFB7HIJF9aHQFPUPbY3m4N9wnx07tMa5JjohX77iOyPWuPMtB30sksCmsnVYYc5L
         q4KCEsbwlOR/e75L2lck7JBJCBII46W+NBG1vGdIcYm8TjG00FS+ZDM1X4HZBBFeAm6n
         R/wN+ekwdiAN6597ePnjMZipNn2gFNkAat9jbg3U6iT2O3/26220v3hnWi4xH1WHACIC
         TFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782529; x=1782387329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiOrWOZcYYgJyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=;
        b=fz7YJqU9MnkYCqr1FfCB5xzwvWdVEYhE+XQ0uVMI4tReqX9WaarqrywCumtH9zyyD0
         xCraE5AcAR7OKdsu/BV4S0eHKU8zuEIdKPpqn6QqCFIN+BXFJnNRqp0AeCKNCTAdcDge
         RZur8R/Ae5SjAd1T3UPd93UwZKsegjQgJ7cp848K/TJSdYZtwyn88In6c81yJtObQmcw
         Se+ZcHn+UyX70ev/xN7lUy2/g9n0ZFxaBv9gj0/XBq/Y73AnAlNb9FTHbFqhQErJNs7D
         8LixKzycCfZpvOP2kVd9HNttbIPwvB1BI+/t3/2EcYnkXKe2oJZo0PKV0u6yTzIZN4BJ
         Nc9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9dD0odxDzj2y0kn1d1Ibxz99BBBmkgHi7QYny9qJer6KkvPrH7UdVpNPmyGzPqvtCSaxRR+/58Tyu1@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvsKRPuxc6Cwu+qbHAXRPBgwqnrDjNdfXxmN9R3GodDRcu/me
	J2b/ixZ7Tikx7PVHslnM/ONCd4zEQ82p0aNpBJSnn7PNyl1n5Xf8j5Wm/tvwYmjyf1IfXMhBDXg
	K2zFw4rR4X5CY+1ajYBGkCcdFS5jWS7QcW2AbexkSD8w1VNa12PC+D4C46j7hoNc6
X-Gm-Gg: AfdE7cnOGcekriTc//Eba8VIDn4AwFXaynvoF7ucmRV69QNhFQJdrG969SBlFxw5CGH
	WP1P+dD8ZNYUFl2Kk+s/B31MBaKPD7JFbv51By9RpdOSsHejRBq5OTc2FjOrytRdPJLDEflr0jt
	nWoluGZX0i0+NHiTAkZd6xtW50DwL3LWM75l31GqenkZrXy1TxiMh2Evosy6WdxAiMiT8yi2gBF
	piOTVVXsTt9n08J1Otx/CY880EYbnt3iFjeOkR9/DwAVZHW3pgBxdMQ+ymp+E88s5ADrXlns85f
	/VLyc3MtWOmjEjB5/hHsHMy09xUT//ivAMkKtqzalHUukYldgioGUcVt4BsjmRKohZZ13bG0CmW
	X0MJ6LTizbmRVUaW+MZT1mIghb7C2qlUSwZyMJP8=
X-Received: by 2002:a17:90b:390f:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37c936a1d28mr8713785a91.3.1781782529349;
        Thu, 18 Jun 2026 04:35:29 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37c936a1d28mr8713756a91.3.1781782528920;
        Thu, 18 Jun 2026 04:35:28 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:28 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: sound: qcom,q6apm-dai: add memory-region property
Date: Thu, 18 Jun 2026 17:05:08 +0530
Message-Id: <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX6HV0JVQgHPqX
 BFfL+yPmRgkIYlfR1NCRYueFcsTYYcdRMqL4HaOuq+PVR8xW0r2CNnA7cHz2KKm/ZQNxGIY0vE0
 SKj0g8C1UXCfn6f8UsbmORCzuiCRLhY3IYmJ2V/axz8lyoAaV7Mqvz6ZMo4pXcMxGrCAWqQARmB
 e/mXZH6qGvz6hxmw0hunWi2VVK55t1Z6oEUSbKeVbUnm1iVCLhnO+kVu0e58KA0NasCbP2uTiHg
 qthZXI+u0UCwY1EFy1pIvMYO17sU+Xzqz/i13/FNikN1KNvW2beo3xHm/afYGRaFlyieb22aGga
 FeMM6zDqAcLDsDg/dgcxslZaukrKmUlqPyq33CZFXjW5q4czQlDKZzdUjPKXYBpzbJM25zRXcFi
 6Cg+xFJncBgvXxiTNY9eeGcdCWKsnqUXanF0paZ6q/pUXx/mPgOsfB03uZYsbCjgpwk8y6PgK9N
 D3zWUY2w3ow97DaO82A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfXw9ByQ6LoC9Yz
 1auW1cKbhwbwU9hOqfGhxn3/AM9x7ePAyaZRY2k/72lpERnRkO6vBs1RDwsgZa0yvKUExTvXDSv
 klA98u8E3U3lBqjGUvDXbStcSSeh22E=
X-Proofpoint-GUID: e8R5nXJMf84i7nn0R1hf8UDCa5uxNbTy
X-Proofpoint-ORIG-GUID: e8R5nXJMf84i7nn0R1hf8UDCa5uxNbTy
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33d802 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PVp8ma6cCIai9-343ekA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180107

Document the new memory-region property that allows one or more
reserved-memory carveout regions to be SCM-assigned to the VMIDs
listed in qcom,vmid.

- Add memory-region as an optional phandle-array (1-8 entries).
  Each entry must point to a shared-dma-pool, no-map reserved-memory
  node. Index 0 is the control-path buffer; subsequent entries are
  data-path buffers.
- Enforce via dependentRequired that memory-region is only valid
  when qcom,vmid is also present.
- Expand qcom,vmid description to mention carveout regions and the
  qcom_scm_is_available() probe-defer requirement.
- Add a second example showing both properties in use with two
  carveout regions and two destination VMIDs.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index b767625985a7..601055182da6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -10,7 +10,11 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APM DAIs in DSP
+  This binding describes the Qualcomm APM DAIs in DSP.
+  When qcom,vmid is present, the driver performs SCM memory
+  assignment for PCM DMA buffers and any reserved-memory regions
+  listed in memory-region, granting the specified VMIDs RW access
+  while retaining HLOS as a co-owner.
 
 properties:
   compatible:
@@ -20,9 +24,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    description:
+      List of phandles to reserved-memory regions (shared-dma-pool,
+      no-map) that must be SCM-assigned to the VMIDs in qcom,vmid.
+      The first entry is the control-path buffer; subsequent entries
+      are data-path buffers. Only meaningful when qcom,vmid is present.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    minItems: 1
+    maxItems: 8
+
   qcom,vmid:
-    description: Optional list of destination VMIDs to share PCM DMA buffers with.
-      HLOS retains RW access as source owner and must not be listed.
+    description:
+      Optional list of destination VMIDs to grant RW access to PCM DMA
+      buffers and any memory-region carveouts. HLOS retains RW access
+      as source owner and must not be listed. When present,
+      qcom_scm_is_available() must return true at probe time.
     $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       minimum: 1
@@ -34,6 +53,10 @@ required:
   - compatible
   - iommus
 
+dependentRequired:
+  memory-region:
+    - qcom,vmid
+
 additionalProperties: false
 
 examples:
@@ -42,3 +65,12 @@ examples:
         compatible = "qcom,q6apm-dais";
         iommus = <&apps_smmu 0x1801 0x0>;
     };
+  - |
+    #include <dt-bindings/firmware/qcom,scm.h>
+    dais {
+        compatible = "qcom,q6apm-dais";
+        iommus = <&apps_smmu 0x0c01 0x0>;
+        /* index 0: control path, index 1: data path */
+        memory-region = <&audio_heap_mem &audio_mdsp_carveout_mem>;
+        qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_LPASS>;
+    };
-- 
2.34.1


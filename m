Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968409;
	b=D/UcIHFzkRGFczRu85cRJmSEOa6Y6OosB9UdLk0vdEAaxKODHXeDaOHxz8WfvvUk6Ez9
	 Bxo6p72lcnC0eHyy/w0UxO3VaNHsakJmaoORWqpMvqjoa9k561gTRJbogmXfpjn3vaUKJ
	 pHViO2K5ggkex84RLZV3qz+l+2cW73Wk3bXOYSTuR6lYQxnEgyWAKFDb7NvhyHqL7fefI
	 RbPjM+KEbQ4n+5z8qb2EpKKui9NMPqgTXeF1l8Pfc5RfATxtXawsLySLOCviYKn1Ostso
	 DoWiLVoqQmKFL3Rz5YpYm1j79DNK9pGmVc64A6dS+M3L/cZUVH0vzulSlDKEBvLGccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
	b=X7qBV6/czdqAkKH10lWB01YHKusOpoxsERqGRStYszsaxuzCFxZQxUseal9mf/H/W8nF
	 cYMnwbgEFRLE48kioftpcUFu0NqpyvsqQbj2A3dKPfT5OUOMqoiWEo4nh4NUVBbTTkSmQ
	 ip0JYQ7dcCOTxSPcg/2lT4msEWrgj0VHyyVD5ttEghgKyIZkEvqn19+07b6trG9LQilf9
	 4WGfrSmMzy24c3Djq6fY69s5BtOS9CYI2Q5fYwxbrukm6F4t/C+bov9X8QeeI9qeCQy1E
	 F6CBK5w0/by+nDr7JhoSU/kdTZFuJDPGClbVDo7xYT5VOB0UXpXJS/JSKmga5xotb3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FCC606A333
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 12:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FCC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APWvA444670
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=; b=Fu3AmKKcEYz/xx1l
	IoH2xAcg3CddEvzgqhaeRcMq7G4D2vpA3MO5xK5BU17vfbJsnOFJM/inoG9qGC55
	T+6kjTulZessePNg0CvMBDkjaCdipYQV5qq5ERh/oHbnKtLBdRpASuJ97tMzkzZt
	0uL5VdVi4liyPQN4V+qrR51Fe10ncGhoP2aDnWLQ6I+n39xMaC7rKjQ24MHPeTPD
	WXM+Euj4mA1SPbAK8lC+LC+gKXmPRahM8YkghucdpFACXx2YCqQHFr4vaCGgF1oY
	RdkssO+soMRt/AyhYgcT5YGpOO7s7p9L47FUPON+2dVcY3DsrS04pYwvIK9PESeF
	qcnUuA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ttp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 12:33:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1123297eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968407; x=1794573207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=hxCCIg2I8Hy5Pg6aUXOPc8LmjCpe3corpgQHAPiMfZ9WXXgno4Rkvc7FUmrW/10zFA
         VNLCBkFsAZK+15QhOdfq6/6L2a2GItNDeL2g3nx874IJqfEJg/MhR0AoKK00yJdbjRWM
         h8oSVr0QFn+59EYoDbU5H6R/ocybrfx1E1zRCe8YhphHQR64B4AaBymo16Cnl4igZO9q
         lCo3/WoxlaAeYj4IDg0kS9rwe7VF3bv7A1urody3yhuANzz+CTOg4blFlvVF9ttUWuRS
         OIsLTbyNCGQaGCcw9+RahbO5lVGxBEik57gFpkOyK5UOu6E0ZRbit0ps3vxDOU3WkIAl
         dyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968407; x=1794573207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=rCEvMg/sIVw7J5TXS3Rbq7woVBQr9aoaEI1NPnqcR9q6P7X6br+aVrAgk9TB7pl1QR
         2s76GLo3UWGTsTjmLmW+qE5RzR/6eL52YXSXGe8lNAbMopHxPBXytp9MLCo3YuXTVsgb
         2sCpwtJyYXLWsei+1UyFYxitiXEkIjHI3QpDzoR9/cQe96/kuAKVQvvUL4xsynbJsnoE
         8S0dCIQnuRszQFnFHJNoHOlu+Jl9iXDp3ye5u3RKDvpK/dyj/ipJk3pieTTqaNMubbps
         dFoSgc7Oosvt9NkqYV3sRrZ7tqjO6GEGQU3ps/VflnRhc84T+rL+FmA4LjKjFLJBIrdd
         FNbQ==
X-Forwarded-Encrypted: i=1; AL+hErFB1Gpp77aaNLMX76Xdvm5kiXAHIM3oqR9okIaXncd+0T/Q4cW+iiOVx0OCCARbYB18zcPkXDA/lDHn@vger.kernel.org
X-Gm-Message-State: APuU4Z8DeCOBkN9TB9zxPnvpuEdYvxCdyW8rbFbuRpGR+wrWlnEZ1qJE
	/3X1DQlR6zNnYHYli3br0iyUmv+k0K6ityXRWg1kjw1C/HLrfuND5w0vDIFXJRtOSUgaM3n6Vni
	1w4kiY4rF0BDPZszlFp1ZLSYZREx06W8SsH32kETEGiqGCBXy6+6/2y0Z21TCX6JQXShbyXNw
X-Gm-Gg: AYBFou2IWcCXrHn625ULji+JrRYQb6nzhiM+C3BE/iGVo6iOMElgzgQ5GyjWHgKivmu
	ZHXaJYheunkIacWEbjwh1jVNF9MKNccytfKeTmc+qXaAawfqUabyXHXEAgjuHHExDdwtcnR35a1
	eIxC0oa2WFHVFmDP5xjPdsuXopl9qo6JPunnS7C5y4Z5y8AptvLoTP+VTmUK+1W6YU39xQiQ8b1
	PlyJInobp6nbb9LhrqO6eI6rAb0z9iT/VsGpEy3wQifLLFolmMKr+IME459Q8CiMlZ5DHpbHY4X
	9WslFDt2kzGNR0MuQxmWknF5bBmiefH5o258qFzum5rNvuDQWjArqqjoxFMKhrQXt7ZAtWPh58j
	twAm6YG/dlQDUDJd7ag5XJCwI79F89LDmN5PYMzwBaHk976JugfJ77yrUtetTSM+q2Qfo7/FhzW
	vFUdVV4raC
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148772eec.27.1793968407118;
        Fri, 06 Nov 2026 04:33:27 -0800 (PST)
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148723eec.27.1793968406370;
        Fri, 06 Nov 2026 04:33:26 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:25 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:00 +0530
Subject: [PATCH v6 v6 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
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
Message-Id: <20261106-add_shikra_support-v6-1-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=vsQiZmFC+ZXQTQ0lUOQFxllYT5f/JYtRbkSGpdjvRBg=;
 b=HLz9BdEh8/qiFIXkZbf4Rj8A9mKmTNbB1Veg+lgSeibcOithsRhztMi2M3t+GlrkvkExNtV38
 VDP4iSOR2CTBnRVk9uaySFlblpxYUjmG0Fsypf3vkNUzUoI186SfDwS
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0hRaYpVJ8DwZ
 xQYlr4z0WwxEXtj0lCsYlaetoWgxO4OoZR6zKhHWYk5BiFFKfwVzGKfu1Wiaqw0N9C55yQbIKn1
 0bT7ZetRPKfcvgUcpdT/q7smpTwfia4=
X-Proofpoint-GUID: xCOnU29aCcYY9vBuIYicDFabmUIjKTyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX4uCzw9x45DTb
 n5VVF6OV7VSxHagZmiGVOwdlfUq40CD/kXQ0O/tFrjMLXE1A3rMFcH3lhiAmSPBRmIxfeQrGMs9
 bLCB/zbNH9d6tiRXG/wY/ZQYVpuUR5ImMtMOrQhWPTZRqbnCtugqzuakH/pJF4vuyR+gu7LgJQM
 /xMifFH5iIyqDD+pq9640/LoaxIJfTXHgwub4I8NXyZMsshkovWXh2sVpG3iPL9Ae3zK7i97JgH
 viOPuPNL4RWDuGaNRdQZJ6yj06RzzyL2wysOC6Rldk76dSpS1Yhlf76ldyf6YCjluESPDkO7YM4
 5Np2QYZhoLB4OuvsToG9w39gEzQH6LgQZrXfeMtwEiLh+fwkPeQZnTw+P97scWJNlFF38Ul3N6s
 eAPPXQaCLUHjGY5OIJS2bDTNxd63HfBj2qes4xQB+dtt/gdbAW+J4mKDgUuZiNMOeAK1llIXq/s
 LlC37CO/3jxlPNwDPlQ==
X-Proofpoint-ORIG-GUID: xCOnU29aCcYY9vBuIYicDFabmUIjKTyv
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedc917 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..db63a75f108a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,21 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..683ebf702ba8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


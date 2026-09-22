Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F304BEE42
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070231; cv=none; b=gmfZyC4r0g7rUkaTz0LNqYTEKu8Y392WVCjkWV1Oc/wfcGMvtHh1XNoRhvqzVZYcAZ22qlUarMS+STWPPzCAaAshsgZ/FVog3RbNE9j49ObXgbX8fxwMZIhp08MkijecyyE6/4StKEt+6k/kZGFm1aR4cUdZEZ/RzNjkevN2FCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070231; c=relaxed/simple;
	bh=1lZSGnPNgUW6lCoeybZ1SgZKOfBzc+qFGv0vS4XPsUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tB+poLO0ts9z2cmJBS5s4UKodivBv/7ByV3pWwPC1wVcWeInFR5mUAlNcvnULsg4q3hCcGLM8yoOcFNDwXHgFK8zKkI3MJjiywiMGO3w0i9kGRm1slOvPOPIJIq3SGS778VFm+Mt898TI7JlC5R8yVDoP/CZYTbZU+o+HQOCrmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJDvBSJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdCiKfiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJDvBSJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdCiKfiy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6qxes2165608
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gpT+BmN3K7YyXf5LDWuXbBctqgxHBqFnTc99/u0KEng=; b=IJDvBSJsp+bcQINd
	RZVDEG3dPeAlD1TZmXjztXb25SIHJx8GCT5JSd+JQtS6hpal/8ggbXetGq6ScQOR
	DlbgWlNndzi5yKAXtgR/nSw8+ULIU3ec3Av8/fZNPwxbao1VAUV5lZ5sQRHq9kpK
	yrPTe3ObrEMw5S58DAEXVkUqAEf7w9Ehkt08m6mWJgEzM1CKf4z4jxoP85FJQraF
	K0ACvLwYWPbXN0vY15zTqrrDYPks36Q7Dz7ZbWEl8iGgM+DWLzIL6Nc58bqW5Ici
	8YwWk15fve1TewQHAVp3fnxbTugW6HIGzgjsU/H3q76K+ufr1Q88LvpPLW6kuV4h
	MmZgjw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeub6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so695225a12.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070227; x=1790675027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpT+BmN3K7YyXf5LDWuXbBctqgxHBqFnTc99/u0KEng=;
        b=UdCiKfiyg2GFDw0QIiFg5PRI6fSty5c6sJf9bGsqxqRavJ+ovRXnq9R/Jz67p+E93d
         WM45Qwcg2jLvRNHGHVcBqvAIO7JLQ46P6RtP+LhynxTdKV1OAwyGhdLIMkEVbpB005Fb
         yVcpayiLxA0wkXZGPAT6u4Sk7xIDhwEW+oUvvLB3yC/a5WtyrqfKI99+hBauZIbvJzuA
         rDIxaNb1iTtmMmRLYxY8LlMoftpGkUyIAxmczAiNN3v6ptWRhcI5GEJyJqvlPFTPnhqe
         uBWvemJH5GOiRfW/Jom9x10XnsForOSkntjtda9gDA6zGMTf4c4nopURowjCE68vK0YK
         scRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070227; x=1790675027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpT+BmN3K7YyXf5LDWuXbBctqgxHBqFnTc99/u0KEng=;
        b=rYlEetRjZ3JJub7GmTRji1R7tdsl7LO76elh04jGdwJrfhnXnJYXurE/jCTZHEWuyb
         hWrHYMlNb11/cruxkevWlXP765Os/y4OgpkPX6IlQ1n6PCxIarlh3XTDJhOU2eCYRlYj
         vhc1WIDRnYW0NFHCEtNxxAXtEDXH4U8zhx9C2wEOyhwZthLuEOvHypnF03f11MbKM9a7
         64vH7dwud8HjUfZ2WmS1iFwcag9tiX9WReS232FOXSLYmux2LU+PgmkWX/yPo1qIBx0A
         SEnRdKN3uQLwqE3oQl6U3zu45WnNYZkifiOhi208LFGHGMmWYlFQDZqAM26a+T7FYrb5
         8Psw==
X-Forwarded-Encrypted: i=1; AKwUvBwxWn9tRFgbuKbY8iluXloUIBvmuGeMPCTDlp2pPyD7Z/xzLHvJBvs3CWHI7rTbDmDxab8P4OmdD4GA@vger.kernel.org
X-Gm-Message-State: AFuF++kA8Zqr7oWB3RfhtpffzDzUi95sZRe1jHDC+Aty1J64HhJPW0TS
	XCQCMfcYFDDr20XZ/9o5Hv5gQFcVPzO6U9xH2XHeG0hPOMa8xIU3Q2ancLS1jh4NwpHIz/acjgE
	SGml8Cg0Mhzl2YLaiF8LIYsCpwWKQXVKxOj+iTrQqtcEtn2PPrNjuGbuhbP81BLH4
X-Gm-Gg: AYBFou0Ids7gZ7t0Zr22l5sGjb2hqp4CYmftN/AfrklKTP8x4Ij1jjVjtCWyxqicj5p
	1LFFGXZfXeif85XKn8u9UC2YNAfdnD4oK0dDxW38xNJ8mxVY6jAOxAkpEpP+1Y2aielAI4h1heT
	rBKAzQr9+F16pUeyCuUGpHxEiwU/M2CrUYAblywEbRGiW9R1tcc7kYDwpp6YbSsCHAN6t1wdMaX
	DEGvxCkIkQZXM+um4yubEumyV95mqa7nnBVhccmgOD2pgO19gORbAKk3FtLHUFAy2uiQzsOJdlq
	ihp0WCBVg9T6IF6NgNareFA5i5bB08zFDKVTxGMUlQ96B39Stj5oy2SK+icCSOeh2vYWsbYcSGz
	FAKTd3n6KEUb/FZ4hGtz4UkbcTNzR9JfFD2w=
X-Received: by 2002:a17:90b:4a0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a07308cedamr563336a91.6.1790070226891;
        Tue, 22 Sep 2026 02:43:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a07308cedamr563312a91.6.1790070226369;
        Tue, 22 Sep 2026 02:43:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:35 +0530
Subject: [PATCH v4 6/8] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-6-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=4222;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KVgaVRGJbpLL89dqvffhwrk/D2FqT70NA6HkMKnCdwE=;
 b=e4UagyTwv+76gXdrJcMQc1L6gMBVdCgkeTpPBHwxPf8ASkeSobe9fum54TROFlvAJwcb9kTne
 F5fnQPUS8yPDlwDK5ofSRW3YDSQzgmu/KKKjR6ze4EXwRIPzN2H3+/M
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: xhHcIt6fystQZScbJX8tJ-lTNu-OYaH1
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab24dd3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MdR4w2dFWrRrHIxOyxQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xhHcIt6fystQZScbJX8tJ-lTNu-OYaH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX97fDFPCMJOFt
 xxQNSoYfQueOetvqXtgD8RzNuTdH9QGu0f8C1Z93CYCxLBU0Plg1WYRk9awuPQBJtfX3d8h1JZZ
 32RIXXeOEWpr3+sDjZovrsK8T26qnl8GwsKWDVNgRYRl6Nq5aamn/opWm38G4cZcLdAtbAziljo
 LBWRC1R7tP9LNjdeQNQS9wnEE0MsAtcfa3wBfQX7vGqY/jnbSwB0+3HPmiqH/rtGx1EgyEQZhWb
 2jDnM7QIDSIi+/jGxOK2sS9kklYEyC4eEmbhalP6iKSmAv7M8wzA2oiLk8t5JrVBCiXzBelu4SO
 91knJUQpiygcjXZ2gA+zy8QUpvX9efhR1wEHuND0qeV6iBc6DHvRtWJ+IZR+TzxKs0V5vu+VNMN
 SvhcA7OOLXLxvs1D2eSNSL43V43cNM8BdbPIUQgZqWzmytedKrl1XGp71i5WZ+i+cyDMVgy3Ybh
 ZjY5lgO0ir/tEJ+u3MA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX1uHRbmYSj4tE
 qYT8poJq1FvtltWjQCtQYdCQ+HKv5hGzoXFVZcU31OnTogsquMYI0FABjkgj6K8XbhI7Yxg5a6R
 J2qQ/TMxRVvQwIbTqYXO/Nr/0MUx7/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document compatibles for the RX, TX and VA macro codecs found in the
Low Power Audio SubSystem (LPASS) of the Qualcomm Hawi SoC.

All three macros differ from SM8550, so describe them as standalone
compatibles with their own clock constraints rather than as SM8550
fallbacks: the RX macro uses the 'lpr' clock instead of the 'macro'
clock, the TX macro is based on Bolero v4.0, and the VA macro takes an
additional "heartbeatpulse" clock sourced from the LPASS VA CSR rate
generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 18 ++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 69d7b7332d36..1d3945190c1d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -139,6 +140,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e82c..2df72450d36f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -142,6 +143,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 683ebf702ba8..7d56f9c36056 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -185,6 +186,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


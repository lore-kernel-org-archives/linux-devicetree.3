Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB53A8384
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780034; cv=none; b=qUH4YsX0U0lcDAW45aVmuve/OgrI3BCyQKlO9NhH12LhjmtZhK5rk6doTLj74QAmrnbVaHUf7hYzaLX29lqmo559dBDoyDG2HEx77WXdvYH4JTagjpaBoHOhznRuyOejauTbxqwwgFbVVZq96rPQH3eVuBL0cPGk/zcLrr7pIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780034; c=relaxed/simple;
	bh=Lx5qLwYek3xBbqB6Gyk2KNpSn1xl+lJXHvDuK/KX52s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcSO1AZPT5n4t02Z8hO4MbBOo9V6v8Oli6M7IXQW2bxk72pDnhBhNQTkJGV3nzi3w4HAE6RoSoMGonModJh90lDCiOpygEDE6+iAS+icsoex9ROMttnX9l23D1b6goJRNcxGLOfxVrqggbe5mfV9h7lZbu2SBjp0+fbbZLwBu5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3EYhGVa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/m253zd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3EYhGVa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/m253zd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6tP01534677
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 18:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dhwJwuiCJeDAcgQZ39mym4QMu671SPGhRko
	VcMsbpUw=; b=Y3EYhGVaJwSeesJ4FunGRfoCd8YSJ1qdvQAzJF5o5+gOFPG7tFi
	PPRGMmmHvSuhogJeeiHB+t4Au9u6tydboXmyb1Cp576i/u93TreCRWLczPVbvynn
	8CAZIAdBhTMbeklwq1DV/ni/MxxOI353bhkzi408RkrxSp8O/E2V3MXbb/N5GNA5
	KTpOHEdbBiKH/cLUGtaJ0hP+HOXhGGT1qvna7ypTvDt/di8HsQUS5cmgB2WRpvXS
	MgSx4AZT4R4T4D5wI4NLqLXRzstmd2laO2dvSQbaPbNf4PiqcZPBwBHxTssRlHS7
	ItGASydylQhCkr5bz6clhIgbSJhbDWEX44g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sg7fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 18:00:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84842381150so7284763b3a.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780030; x=1786384830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhwJwuiCJeDAcgQZ39mym4QMu671SPGhRkoVcMsbpUw=;
        b=H/m253zdYnWyMyll4J7pIB6R8/Pljn5UwNdX3G7ynAC3TjyyaEQCyegXP2Hg1WYND+
         FkC5AYD2UEelrbDwDN1OrAsxgpc3daKGdNUZFfpy9Z5EzcckT1MKQDL3V3xiP2hHqUKM
         dcoKO+U0yex9C0M6z2jJ3nQf00tlzX8e+spqPBgLSuSlLUsdX7J7hhlZvcUUhelPHqO9
         EOV5VS+p3w0MuhASI9EGNHipGcak/kz7BWD45rjskCO1Ck3GponXunFGjcWZG1zL/SJz
         yP5vPeF46H3VMmDjx8Qzys1aY7jgdxaaLofd0zYZP2Zei98AK2PiuVJlRNa2nVtG50rX
         Kbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780030; x=1786384830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhwJwuiCJeDAcgQZ39mym4QMu671SPGhRkoVcMsbpUw=;
        b=MmohZyvi/cfI0/M4RgSepr16WBZZ/vko+L6tPMUZpa8LFXyyUdWKCYE/dCMzzsf2rF
         goPqsw4TbJQS3RFYXGBZKYg2CYU0GGKOqoty3Rkw31KejBvqY2XqVnL3mrAATNPbk52q
         mg5mALSissrL+21+v3FHOha4CTjQQAIZTac1HgIYBiDnJrDG8JUZTF64MnkCqTwQUuWH
         JoGKg9txqbyDPJ/3qlj3AazDTuVaR9svTk6yVrZViJbiFxlMerO1WW7h+Vfmdy5xYdH9
         ukuezGltXfLj6fZLKduHJkRXiJpO3jSllW3ihDnAFfQOuR6oD8n3gZDnDUAClUSG+pit
         mucw==
X-Forwarded-Encrypted: i=1; AHgh+RogVNt7KY5/+Vpmk8PXb4wkEJW910tMzVJEg+ceJWAH/+EC/6SyqvpfhPHF8UcjJ8RN0LSf0VifZs4v@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRf7Cbe6eFdNHl6MbfqHrdXQfUjDZP4iz5hnh1/FqpWJZohc5
	eY1Ej6CUYaKOVX6LtYKvYa/pegANE3zTl/g1OdCqWIdn3uY/2g6QzD0UuEJA5GThBySaDZ0JvE5
	1FUyUato8xDzCCWkV1QzToBGN70SQ/LkbdGL2gqe1Bw+rzC+8ob2Li/iWrrepnwCY
X-Gm-Gg: AR+sD101GbTYszFR3ezFQeMG37yt3dGMgcNQjpTlcgqVjL8221t0I/5Jn3HsZufIPlA
	izrZ5Gyd9pbgGKloYWnBF0O2cHX/3Erot/4sreLKT6bMEtek6w9VKRQ84c0e6JCSwg4GXDDg4F5
	ul1HEKUPae2oiv2ZjLhEkipMJidZfhVZ7v1FBBy93lOZlWuCdofH5me1/AWYgOENRlJnu96ix0j
	lOMwRbdnRO4i02nbg5KtLI7NznNgpeFzBkYbrqS1zJwEt0B45Ibd6m3yegDFRkRUVHrxH/t/fr2
	xMjIE+GP3zbh480a8RtsrltHZ5H/NL21ShLLox5UOqibracKIrQkCIutl0aniLQ/IsO/0gzuJ+H
	ra9IlfWf/ruXEpSPhdiVZJ15qBog=
X-Received: by 2002:a05:6a00:13aa:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-84ee48977c1mr9682506b3a.37.1785780030302;
        Mon, 03 Aug 2026 11:00:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:13aa:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-84ee48977c1mr9682448b3a.37.1785780029519;
        Mon, 03 Aug 2026 11:00:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb9bbsm3920533a12.32.2026.08.03.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:00:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75, Hawi and Maili MPSS fallback to SM8650
Date: Mon,  3 Aug 2026 23:30:20 +0530
Message-ID: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX0E2BCC4M9fri
 tztrcNDlpkk03pgnLizr4Fnba9XvTg1ReyeO3A26EiwHNbmEqtAD6DotOMlV0kfUG2VRHRa2RWz
 F9UBcHVGdX6PcBnZamnCZy1Olcz2Hqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX0j8lkMqqXI4E
 mtc99t/Fp4hRsbEmY64S3thuY61ED2iV7n+HQwqXwe9jGC50M9+xdtzjcApSF9Gqo1ddVkXNemr
 ImJP4qvMdJ/XiNTI40/ArWU8niLz3V5qRwP2N5YsI0c94nRxXR8s7nVESpGBhBHrDct3haJAfKQ
 Na+zSpxvVC3X60i39RSUHFtmDJuqb46QWY8tGYbZTww3RgEydTYVdXWRR9msl8L9KfK4Owug1la
 BpHs+jaEMt1VrDsxxuFm27aLrYZOyQ3FWg/OgWIW4Gnkq4PWDlhxeZueYFmOqX/BJGfKp1iQfzu
 VMnGs3dHCar9KhcmcZ+deBa/nJZ2nGcK8x/C0QZqPKOMD1TKiPGu3zprug96RvxcdVW7rNevHjQ
 gXUiZ2inblH16GDodCYG3QwRjWKmhEtAP+nKEiHozGc4u54v8Bbqs3OuKPtBb+TaO1etqg7FizQ
 DZgsy+pJFm7SfU7dSMw==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70d73f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nGdlRpcIv1g6ZF3IhIQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: KpxXEXS46y2qCzLBIxfeiXRtoDOSrjsB
X-Proofpoint-GUID: KpxXEXS46y2qCzLBIxfeiXRtoDOSrjsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030160

SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
they share the same set of interrupts, memory regions and power domains.
Rather than describing them as standalone compatibles, model them as
fallbacks to qcom,sm8650-mpss-pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a062188861ff..f722c55aadf4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,9 +18,6 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
-          - qcom,hawi-mpss-pas
-          - qcom,maili-mpss-pas
-          - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -49,6 +46,12 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,hawi-mpss-pas
+              - qcom,maili-mpss-pas
+              - qcom,sdx75-mpss-pas
+          - const: qcom,sm8650-mpss-pas
 
   reg:
     maxItems: 1
@@ -205,11 +208,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,hawi-mpss-pas
-            - qcom,maili-mpss-pas
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8650-mpss-pas
+          contains:
+            enum:
+              - qcom,sm8650-mpss-pas
     then:
       properties:
         interrupts:
@@ -257,13 +258,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,hawi-mpss-pas
-            - qcom,maili-mpss-pas
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8550-mpss-pas
-            - qcom,sm8650-mpss-pas
-            - qcom,sm8750-mpss-pas
+          contains:
+            enum:
+              - qcom,sm8550-mpss-pas
+              - qcom,sm8650-mpss-pas
+              - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.53.0


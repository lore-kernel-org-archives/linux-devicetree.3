Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665539901C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977781; cv=none; b=WFfgEerQTx0UjCpXEkCSs8d5T88D4ef05lxj503BE4rNVa+/bJiai1umyBp6CkNRKDChePRM7A3JMwaQ7G8NFiCQagnCpNEEmZfusqRTI08zXcivGVr32WbBBJvut2IQZd831hx90BdST7nxYAr9dwjCsxeicrJUYcqNIXCE37Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977781; c=relaxed/simple;
	bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfLDpU2Du6Gpjaqf6fkak2tgi3x00C9QzTWNuQOnN/d1Dtf72j7LhisZPEY+sV7Wg+SJZvWT5Vy6oSt9DpP7vI3UR1mnxiR4L00Zpqn+QVIt3EPAJHhooomFn1ogTvrDTsnmcEWQYkeecs1sV0sVgVwRG38dU38kCY/Eahk7xVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uqt+DPBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccmGrHiL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uqt+DPBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccmGrHiL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KFQb3009447
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=; b=Uqt+DPBqPVjQg8Rh
	O1c92CKhiIB1D31zY5kMDb+gysPIpFIzQYvUicrjJX6YFkkcQFdUyEvYTAVZX+d+
	xMMJ/lnhEzPXZs6/hKyfbxOtY54STqaRSmSOREu//e1BxW/KGaBGbZJMdY2r5FeT
	FY7D1cA24uGcjkZLnO7BdQXvWLRzmPydSgrsPWFZqhqo7v1pGlB9Luy/5cDmnkq3
	nPEqGTI25fLDAlGmj6VTfDq8fXbyqe0rcPlDCFxDQhhgyyWSwLEY2c3DznuMO9LW
	cWEbrGZ+QXqPaXWupkeHJFWrKsRCT6JhOtEXA2xjbZQiyaxEnEwRxG8GeuseA4H9
	BB66Xg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rttgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:36:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso2381325ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977778; x=1783582578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=ccmGrHiLSZa83X4+Qo41pRR9tDo77hT/bhqKEFKK2K8D2jGQkPadqBszmSLhuV/8to
         x3239opp8W1amyYhDLpiSWABtkIj47r2ASnRdxklDv0gBeIZYnpWoiHFSuHxcCZHIOsT
         SEHLSCrlADl8qndYukpLNaf1wsAhis+hLARkVKtrRvMZ0seS8yBirf3hNJduFCQgOmdG
         gyYzvIMs+QyVpH4U7vddoI2YBOyA/qVnXTSxca4hzlv0vnqKO3uxAzs4ElNrygYa5UsJ
         SjXLgWqqFp1y0Qbq+7s32gv3OC8tFui42ZOHZQurDqd6tzQcxRFQ4keEZ9KgAqXE+3Pp
         luOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977778; x=1783582578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=c/Vadv/b8GOYAg5244MZVmodiV4p4iBulVn27SjOMU4m2F5yiXFYeFR1l/B274HDTX
         ST41WepyXqU+77WtoBOcbxDY6m2XJboUXG+zR2xNbuTfVkMNHVLKpLvVd62xB/73HARB
         LoGLuqXSS8kCDs3y43vd7rRCas/ytgtBBXLxtjx3MXBv72XUGbrsfT51/E9YJWVDrsSv
         PdSOUBQtTcH4b9/dZN7vVgTnz1MIJDCieJJ4DaPb+yuxJC/FEAWI8qfm7ImbKbqu500a
         EZ7pdVE9pAyO/q5Y0c6dnU5Gji104Cvp0M5PNvJRdKpmkKZM29a/dqQh1/+IHqrrHdyF
         BF7w==
X-Forwarded-Encrypted: i=1; AHgh+RrvMDuZqlhW8w8hVZpJt/Xb6S4dexY9BMoL8nNnAlyxacUug2wpbMTIG7mlactGjiF0DY0w7kO6eBdp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MiYrfdfJ6dGPh3UxpYyme5D+t6U9c38NiZo8oZLd+Sva1qOA
	cgu3PYnk+gRxnwmDgq0wneRe0/REQYAH+55zIlk8Q7oG4Xace8/T8maWYikNBnZ3kVWjQJJdy5y
	T9L6xwz62NGDPkms1ns6eBQnn0aN8AvWVFreT0hruoEnMmRaBVIDUVIUvkex1shZv
X-Gm-Gg: AfdE7cmPSWGPMHXy2ckhEHsMnK/ZoAKr3ht4eH8nopePMPDMsca1YEjqBTXqXXPkoNY
	vh0ZKj2maiM8laS4rwNBwizJ33uieSeiyw91i4R78hLiYTUQuECIYW/Asr4Yg4Y9CPSKLoGtTkE
	jGmXPkfbpbtVXMfPONmI//Z56lLcuIXMKPvwKA+6txrtbu7GhLKk0zGzhDhUZyUIAfwCAF2zOqj
	aVIJ5Bc1Vom4gFsFUs4kD0waR8mnujp7lUxRXPx7tuoFF7WXKxbctGQGoNu9ZPlree1MqzgmWI3
	Yv2cNwObqLbYjX6imWnMdUnn+nsWvuxWhOxnpbRYpyuz82Al7XlTcn3IciJ2R0ZTpsm2ZKraBWM
	blXw7tgUA7iL/9Ve+fklsUJM7MGkgNgGq/N1wnNK9SxU7SKsRTHmXW82/Pw==
X-Received: by 2002:a17:902:e841:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2ca7e6996ffmr39874905ad.7.1782977777928;
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2ca7e6996ffmr39874595ad.7.1782977777321;
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:12 -0700
Subject: [PATCH v7 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-2-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977772; l=1807;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
 b=7wmyaXZcZxqklH289+3yUAWAyBTcA/URY/dEc6HP983ynw686PNOtey+Nci3MJoHFab2d2rnr
 XRG24QenDklAdmc2Pg3dXtg72hvMVytRSKUbakMu7hSQ6RhIGWGC7l5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX9AB+OxqKfUI4
 q/A3fv9G0RzIPyypDesZBDJiZC/9jyxj5XLCdI3SXYtMrwU6NJf9O2iz6PAphraUyRemOPM5QT4
 ZiHbbXujfZgMD0dgETC7y/cpxYn5wBmqg2GdiRZ9TCI4TRbx6a8Lz/c7xyTo+U1vBRLyRHgTNMc
 11jesPirNeUvfw7G8iuf0RKnTHrJadekgxnRCLdsWexptVsjlS2akNwCZ4GtmCtVbA1Cu3Xn9o6
 kUl9+tsZORVlCuJmhTGQFYyvqMiGNWM8jJKr9vQikoZBpFKpaR/fKxwHdtiTFRea5UGuLTPgUOz
 wCHnsP2aPFDKP8X0C7wCCo3YUNBrFPWa9vc+ARTO9iX5yHy9Cghj3neRJzChXLRb930GvExBB96
 vJlcv4JAlXkrbWAlH9dr6mkodCHN3EP8JO8tHavByAFyccZ/8O7A+uPR92J+3zXSd8TLKAhvLbe
 xWygcOdUQqBF7H2Gu4g==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4614f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 4DWw_f7STygiHlA7HQNg-ocgj50uUQRb
X-Proofpoint-ORIG-GUID: 4DWw_f7STygiHlA7HQNg-ocgj50uUQRb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfXwuCbWEhCPdSk
 qTprAMsxKt0nSR1NawiLPFVsRDtCUPKuHE1XL70Z2tJvtE2VpO09WCllZojtAmNCdB36qy0SZAx
 AqxcpMYLH0jTsISrWT1yqj68ixM8y/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1


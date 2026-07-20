Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D338C414
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537060; cv=none; b=mX50xsrZKKO4k1Xrq14M3lSvAx2KoCtVQsqGiNZLCgJYfhFbJirYZZfRqTPj4qsW77O2EM/YTUVP4c3LzMmjHo2rBEqbhvPieMC/dovz8ZXnywIQ0XvxufbweODJ8zEeqa19Hb5HFf0ViTNdIDAWPc0eZycOchr6/4R+EcbBNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537060; c=relaxed/simple;
	bh=/6L2ekPpAxec/7uyCjbq9UCoVdswxCOmDhBbBr2sCa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IO1yw01VnIEGntX5LPZm72RygnjQAyAmDRc7rhb98IbB/xnVjaOEiLChk1C2bjVRs5+P135n0imAWCgkOfTWAA/bfHCFEeo/GpQJoxRSkjRTaSZQLIX+p0wmr52TLJepe89DTg4FBjgPEcHcIbR7UBKb2TeID7X7pq6vKp3YZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1Xs86Tj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a21zMEB0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1Xs86Tj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a21zMEB0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76uB71896128
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39qqxcbfuYiiqBLw2ZuDhkt8UPE0aaVomriT1BAsCCY=; b=G1Xs86TjnUq/HFcZ
	KyT3NY7vZxg+XCo6IFo5fBJgPIWLEXrcrZNTFBePN16omNIzsL33oIumc07jasPc
	5SsH0yJXxr8WJdeHa2o338BbGiSkFX3lpxfABFPWAmbayUbgH5S69gipIfOpV36t
	tv/rzg73S8HoaVvPb2np7gfwMdsN8qhCKDMYCcVNi7eO7z8o4zxHzfOM5FNcEO0t
	tu+APhRvKJfk1akDL2WFw0Db2P6PKt6iXoCG+rTQ/ypODgzG2s7kg/sAbEFHw1xU
	0GUOXhbjcIzKr8NOO3r+/3O5GUojZHrMgb6JX0F7GnON1vJikEGqs9KCUSBEpOUm
	zd+QZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0krcfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904ee4473a8so159760206d6.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537056; x=1785141856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39qqxcbfuYiiqBLw2ZuDhkt8UPE0aaVomriT1BAsCCY=;
        b=a21zMEB0biiEHygfws2aDoKW09TmXyCwsfZkQFUvU5vNCtu210YOYHZeFslrIzZ1ml
         l23dLgnZTTO4hywrhBoc36WvKzkgHEbza1T6D5+QhBmuzH9KPWPDieoU8XgTQ6y1Tpfk
         4TRNvjenAiiyPWbIfqqIvf0OzT0TemcvRiegfwZmhdXIpjoFtA+3yJGErX3RC2+Hv/gg
         CW14+P8ntQHty4Fn6Cvw8QLCJRF+MdRt+w+A2+mH8wgB8f+RJUzGQefqJfAsR63TBXFT
         4qqi4TOuxu4zz7/pfbnETeHCebn/t7FwX9hR4IqFGTk8wCZ31OZXQBot8HA6+7aGieon
         yuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537056; x=1785141856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39qqxcbfuYiiqBLw2ZuDhkt8UPE0aaVomriT1BAsCCY=;
        b=AJWV1kS4qqLKMoxCXmqPJmy8rDIRIoVRWaRqTBZTz4gnKtpJVCn85ZLEgTYeBaIAfE
         lN4zLOEbxVLzM5hzvzTcQvbj5inVcLRRn91Cj02//gCkTuglIZGXdLaboQ42mLo3VyMJ
         5qUqfl7kI0PrD4P1x6N3BZug0A1/kIxKISuVAouW7oVyGR4ckJCvWVhV6MNT2ppyP4cO
         8VFcBC2yyEUhBv9/ykyzH4u+7niDlF909Lhk/5IywAhD9/4WBrhLXfFxEmXk1cozBVRR
         yVZ4bq5qxap/KTvGDljwpp1vX345L7u8JSqlQ3qAYZ4JNhzRGl93cxK+4YGyLqXAwlNt
         Zxxw==
X-Forwarded-Encrypted: i=1; AHgh+RovCq24KXtye1M3TMzvg1IEb81JOe5je/uhGns4tFIL4yZs4+1nAtKEHU8VDuWP2toL/JXyYY+Dajsv@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJ2VziyBP2aeNKJ7y8ri8Ys11gTyd/4vlm32nkP/YukRgvHeH
	f4kprSdDQ2WR6otLR/maKNqpOu4vY97Sgi0wMGe/uENxIjLui+c1/MUmQ0VosUpW5SxwtC7hHu7
	/xO76E63LRRPN9YFI2c1Dnqk8QjOytwBkjtXeRYs4OTK2+6XdyeDLhfOgeVFYl3op
X-Gm-Gg: AfdE7clbL5XNSVdE8/fB/4swVi30NliEglaNJiJJ6GK4tt4GY9fEzBSocH/+7uMRvr2
	SyzFHJlDYId3+HOXmPcXMbv/YPNWPLWiJtkt6iK1kAEOvXMiQlxFIU1US/30Yjwr2AIHKhxk4p1
	LdrMFbOIBU2VMmXXmq6m5zNduGHP9/lvdqD4us+HGRQ4gM+xgNhROkWIZxE7zM8ea6C05gyJDZt
	f1MGfTMVuEYny+mWkSzN+c4tFmUG1edT8M1gRoTZsdErqPgPGHeSEjjmP8PiivRW24o7IeIvQnU
	BW/hY9t38WAhlJbwS4FOzB9vbUX8ifBJCCUhaCQDhzQaYpx3qbGyuc4avk9rrjAYzclGos80eAM
	VaJ2eIfZKBYK+fjdmYUcxEhYL2i/Fyhd69eJMehYu99w9vUl5J9/vKJT7z1GxNp0=
X-Received: by 2002:a05:6214:5502:b0:8ee:7c26:8bb8 with SMTP id 6a1803df08f44-907783184bdmr137248176d6.9.1784537055733;
        Mon, 20 Jul 2026 01:44:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5502:b0:8ee:7c26:8bb8 with SMTP id 6a1803df08f44-907783184bdmr137247906d6.9.1784537055337;
        Mon, 20 Jul 2026 01:44:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm87061716d6.45.2026.07.20.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:44:14 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:43:53 +0800
Subject: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
In-Reply-To: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784537040; l=3201;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=/6L2ekPpAxec/7uyCjbq9UCoVdswxCOmDhBbBr2sCa8=;
 b=KY5Qshg6p+4uwwzypEcbJv1/JWBhvrQpn04OPdUBO5ESYEw8Zf/tkYyK8jZI9/2454dUilHaz
 khtp7I3splQAcXdU7lFyliJc/KznWeZhOgii0k3H0vNP/kgfgt/0nn9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: mVt6xXO6K4iX35k-ZhVgax33XW0dSmxn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXxzT7NWRe1XTW
 u5BL3EE8k921UOvOO4uFRrXJ/uNDf0UvRPS0JGfmLl3wmDWgqC1bosgnOrt9jgo6E45K9zZ1t1R
 CekEt8/f9R5pXjR8HMWF4+SiJpRnFH4=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5ddfe0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0Rkz6-gpJEd4cPyUuX0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXzzIAedocGXyQ
 gEvjPAoWwaufbHVw2zJrKtCU8U4IDG37lZXI4eorExh/u8FNnyDBbGssC6RUlXI7NKhkDu0u3q5
 4WSuUKXfdY7D/tm2R/3jN5hp2AaLh7xQLYNtOyQ6Br7hbY2e5FGKnWRFux+DKbzu2JqgWykhYyX
 nLf39Ixr7zuadBh90bce95gvrBP9cSKMrc8RV0SuX+FMh0OuCS3xui4yfp7JRJW4NmbS4m/wm6j
 QR+qs5BsNklcgqPWWwuuQw0bSw8KnLDK8CeXBmNi5WqSkDGhmyoINVOuUZNVGCk5nL4Snl2LItX
 /vojCWxvFH90hjjLlVsDT7xA2b5F8zs6/uxo1bigBsOw1IMCvThlKVi9747iHa6DobfxyJacpUY
 abIXZWolsazQg2WGpD4hIDYUcoso8faz6iRXZlfCv+WdrbFPtj8Fa1Bf8TpWLMeioidcEHE6lPI
 qEx12PPOJtL2y2/gI1A==
X-Proofpoint-GUID: mVt6xXO6K4iX35k-ZhVgax33XW0dSmxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200096

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC
powers a subset of SSPP blocks.

Allow the MDSS bindings to describe both power domains and
their corresponding power-domain-names values.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
 .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index c6305a6e0334..c0b650ffd9ef 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -31,7 +31,8 @@ properties:
     const: mdss
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 2
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
index 64dde43373ac..685bedb26a12 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
@@ -38,6 +38,16 @@ properties:
       - const: mdp0-mem
       - const: cpu-cfg
 
+  power-domains:
+    items:
+      - description: MDSS core GDSC power domain
+      - description: MDSS INT2 GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: int2
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
@@ -95,7 +105,8 @@ examples:
 
             resets = <&disp_cc_mdss_core_bcr>;
 
-            power-domains = <&mdss_gdsc>;
+            power-domains = <&mdss_gdsc>, <&mdss_int2_gdsc>;
+            power-domain-names = "core", "int2";
 
             iommus = <&apps_smmu 0x1c00 0x2>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..088010f464c3 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -40,6 +40,16 @@ properties:
       - const: mdp0-mem
       - const: cpu-cfg
 
+  power-domains:
+    items:
+      - description: MDSS core GDSC power domain
+      - description: MDSS INT2 GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: int2
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
@@ -89,7 +99,8 @@ examples:
                  <&disp_cc_mdss_ahb_swi_clk>;
         resets = <&disp_cc_mdss_core_bcr>;
 
-        power-domains = <&mdss_gdsc>;
+        power-domains = <&mdss_gdsc>, <&mdss_int2_gdsc>;
+        power-domain-names = "core", "int2";
 
         iommus = <&apps_smmu 0x800 0x2>;
 

-- 
2.43.0


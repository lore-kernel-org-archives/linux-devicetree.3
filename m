Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C40A48EBC0
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045282; cv=none; b=jn0MEfIUp+tvw4hMo/xtN5AEkPpXSbGYk5Ux7hTiYBUiXjaC3yuF4Ez1GDRxCO+YpCKo9qT4idnImSEgyBwE3YqDmxt3CzQzxPBNUl7Mcdj8HefVGYT7oxwxFUvLg4yJhtzaEayoAGHPrVoqGWwi4DkURcd5syUkGBIEtycKAxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045282; c=relaxed/simple;
	bh=LC9mRgiYkzTZ2U6TbeyqAk3KahVEL9js5PsQVWbvhA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiYCq6TcA87fYMpIb7+uLWzT4aRyDSEiTNq1kdBLRrlkKpGXNxme7pxqsEywFWEH97ffm+O2gRuujLPsJKtQr+QF2026KPWbIA+vn9tNf5ZCtgkeeo6i+I7xBniNdrNHHpNdihfku3a27WalJJlKkXnglPTpcBGknPua1ZYqfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCvyfCQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr0eBuXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCvyfCQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr0eBuXQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ntn1242074
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=; b=mCvyfCQXtZJyq348
	ODy5xXFurIYF6Hyc3nz2MKKpygNb3CjPCvpnjY4QNMdD3yct2SBXgiRkqYQwxSA6
	g+9a8+ihNiDIu1pqv2h+Ls1Ue4pBJtQt+GsT5EGETrUSdzQKJWtGICbHvIxx9xqt
	zBt4DHIlnNHFHdtkzEcQnEgjwIhMyKxu+Bo2ZJ7yQ4KmAW55T+DC/7JZ3PUKeZ3n
	8J9eIHg3/OnK1bohwQpjc4OnUITzpZl4Mq8yV4MMW/kcWkuCk4mHi0A2c2CMWYJP
	4JmiC+5/xmlZmo12wT4ZkjkoxhLGJX+xav5j8oU1S5CMNNznOLmK3M6TKmRHa7Ai
	eaDB5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjs7c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so126429935ad.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045273; x=1789650073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=;
        b=Rr0eBuXQK/5T6BCoA4cMTiW+jqTrhRGz3HtLxWD6ZL/NncI5wfRyl+TiApntPZctxU
         8UpJV4hiFOQq88lyd/SesPH1xTL+yrhxqr7LFruo1nsD1uzyPM1BQRZnKBLQjcPjI2Ct
         70GB0o/r0NBae2FdBE3MtEg6Mzv4wYt9H9pg+GvzNqNLYJjRqDxR+0wKXVHfvoAAquJM
         RQdkYfnUEQmdSlZwluETEqheW60JXe0BhAY9GJYJh5uPhxNTTX5r/DQwAlokll2ifmnT
         SfPXcR0v9FIC0pGY3GCU75znJINSFZe/ZW/DYIgO/xan0rXXwcF5R8BkkxkzPbaghvYm
         6nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045273; x=1789650073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=;
        b=lBImj1byplVHHLxaS29u8cPMQAG8d1qHAfi6WqbwGRYXKxwbLzus0IiGMSI+l+2CdF
         0kujZ6e78Llk20i+1D/DUitfKm0tIIfAHiVMCNgUSLd08KZEj1SR7frqRIx1tSfsUvCl
         YWH0YPg7P2jZqZYy2Og0B/j3BCMvsvBzwLdem5TNWjsB14PGWakt1EZ5wA5e4SlYnFXa
         wYh3rj2WDH5nCY8YPOImCLXx+czgjd9+Es06rjYcu/Q6QmkR7gVglsR9l0c3oXk4juuO
         ELqqB/mnV90o13i6RV4Nmnifdo4cvOVWAWcHl5F+fQKPXyRIW40fra1LDtunD8VUdb8n
         3rGw==
X-Forwarded-Encrypted: i=1; AKwUvByan36QnhqyJqpOX/6tk4unQIeN5VTUw64RF+Aawp5ei5c4TlwT6JzdHsfAjKwdpn+EK1qeXaXTFMcW@vger.kernel.org
X-Gm-Message-State: AFuF++mSIt4RzjX6H2touObOx/p2TnJkqFysSiCZ+zI47NhUHvwfRHN2
	UmLwFk0iKkjAt2OMj3Ipe+1py5+vg26a81tfrKo9zz8hATTFmPaL0fxcrRnRm+FGjwvrrI2mFDw
	0IUef4MI73fFf2wCtIJmj6B8W0JCTLcaP6dS0ivPQ7IOkzhaDwHzB/pTbas4EM77K
X-Gm-Gg: AYBFou0aIodZHWnURA1N73I8S/p32dM9ll2xy5AtScxpYYmh8vdHh0vDnbcldrgiBOX
	kboI1Pbx9S7Y5IFjy/eV0J5pHX2cN5OcY+gCcRb5qAFvWasmthLxry5hhMZl2Wsgh37W7NCUdMm
	tbYCergHUxaVvJXJTcLDPKDPQKk/+DbMrrxnSI3CWYoHCay8vJWHLYbB9E3BhtY4Mb2GbQny4+I
	qvTS1RJ8vkEN/keoB0V2OGTe7z8Tl9J90mwUrEIgOAsxn++mO379KRPWSiHH4QHwViLMMxyzGl6
	xMUT6T7OaliwT//aJe8cmoEkM7m3KqKVl0P+Cek2J4G0wCWYddt2iJgp7/98+ggSPXoFjD6K4et
	Y1dUSSf96xrZORsH7zOraJpAkCxgpLUOX/wSm
X-Received: by 2002:a17:903:46cd:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2db8dfe7322mr175297945ad.19.1789045273122;
        Thu, 10 Sep 2026 06:01:13 -0700 (PDT)
X-Received: by 2002:a17:903:46cd:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2db8dfe7322mr175296835ad.19.1789045272576;
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b9f0sm88424805ad.20.2026.09.10.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:30:43 +0530
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        zhangfei.gao@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2aa1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Nsn_4hRXuT6My6vqaXwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NSBTYWx0ZWRfX/OioNt20hTFx
 6u13Yi+zX52ZBoLU+XHsSR03oKcmsFt04nridC2vCVRgVvZxXOZ4WVvvCOtzb9d82ZO7cvdf4oU
 r7lm8Z992g34TdmzWUlyK/OU6tw7D27X/1ncZFqskC2d4HXIdIcvfYbMBJnoB/MW7L0Lr7uHdEr
 IaKgJ/yZlWRaF1pirwo+RdRyliwTibCtBK2HxIo9/Ev/ogDtt/9ArtPdrQG7x5ZE3oLsKC9co08
 SMeNL9KnCRqyhRVJaQDPLhKTCRUDM9CKSf8kBfklwNq/me1qYXAxv8DHKqLDmaT+P3dDcF08VkR
 FHdNt8UAhtNVB7fg8Tkw+PCJSf8XZ5xT8jZaqVgVsY1DRNKBVvX8fCypO+5ZQpjFK/mp/IFqmrf
 akIO2ZK7HSnaHL6aAYU86T01sKN9Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NSBTYWx0ZWRfX0ePXEukJwJsz
 P5EZHUF6kPL9FWsuLECEAreNNZ7oopOW1KA7tkWMGVZGbsArGs4Kg5Pa8f4JtI6tY004j5i7zQQ
 lhQoKji3dnTBQY0paiLNOIHOTpAWCtk=
X-Proofpoint-ORIG-GUID: sKPkO7LeUf2HFXQ2wk8inw9WaJt80PKL
X-Proofpoint-GUID: sKPkO7LeUf2HFXQ2wk8inw9WaJt80PKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100155

Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
sixteen bank regions plus the shared broadcast OR/AND pair. Add its
compatible with a matching reg/reg-names group and raise the top level
maxItems to eighteen.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 55 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index a1340226a0d0..2141e5d4de63 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
           - qcom,kaanapali-llcc
+          - qcom,nord-llcc
           - qcom,qcs615-llcc
           - qcom,qcs8300-llcc
           - qcom,qdu1000-llcc
@@ -56,11 +57,11 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 14
+    maxItems: 18
 
   reg-names:
     minItems: 1
-    maxItems: 14
+    maxItems: 18
 
   interrupts:
     maxItems: 1
@@ -355,6 +356,56 @@ allOf:
             - const: llcc3_base
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC6 base register region
+            - description: LLCC7 base register region
+            - description: LLCC8 base register region
+            - description: LLCC9 base register region
+            - description: LLCC10 base register region
+            - description: LLCC11 base register region
+            - description: LLCC12 base register region
+            - description: LLCC13 base register region
+            - description: LLCC14 base register region
+            - description: LLCC15 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc6_base
+            - const: llcc7_base
+            - const: llcc8_base
+            - const: llcc9_base
+            - const: llcc10_base
+            - const: llcc11_base
+            - const: llcc12_base
+            - const: llcc13_base
+            - const: llcc14_base
+            - const: llcc15_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
   - if:
       properties:
         compatible:

-- 
2.43.0


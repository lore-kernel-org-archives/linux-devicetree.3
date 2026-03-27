Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274763AA1B2
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606065; cv=none; b=uUpcgGPAz92ydn9HNozQWeUbHNenpn4L86/BBiJ5x0Bmo5nU9/LxlfOsE6/PFXmuhVn0px03tsu3aVUfZJrb1MSv5LZvEwFdT+/Q9dXrn+r+hEE8vtIT6sgtCW2yYpSUt4diN3fe7piqxeRfHv7tuLTJOwywwdlYnEgNwBVZ9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606065; c=relaxed/simple;
	bh=LRBZoOlhD4QhajDvi1iS4W8pu7wzXHs+aBpDePBF8k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pbrhp37k2HASRRw/3kcPkXwuCuaDk0mVuKy/rN6rnFn1C18nYmG+EIHlCH5wYR/q6IwydLntduwRSJgZWNLuTfCfLbcBcWAc2S81mAsamHXYFpnDK0U6gpcMbODPHJuhvMiJiH1DrRKwlj1JPhZMcTRn9FG74mSOeI+k+WwoKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCtF862V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibxs73zd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCtF862V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibxs73zd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6veCP2378974
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PEZ0hX967yZ75mDXtph7mpwO8D/NCBv8vGp
	kfdjyKFc=; b=JCtF862V3MdqVf9BPNonaUVB78PWImRx2muyG0tp0vZQ3BLFdJh
	KejxVPz/2vIBZXRyJnSPfiIHbSB34Mpr5/87ND/uZeDb7+PaqvSOe6SS4+hvZT1e
	460p11RnUAQ1i2xwwVChmNrw0wFyQZ1MuS3jdkMufsbUYpY7KHJdt33VWDQdjsgf
	vcLBzgxSmX+BXSQR3+DLjCSLXNjadC+UzHM8QFHwXnx5XY92+Oo/ZeoPG/vqVS5J
	9++aMYvbLlViFrr5GGtnTH6JCFAStN0nHHiDeUCKP50nVpSrr8wNsCkZJ2hsMeAV
	5L/tH41JPZqQKdtwFxop8qOd1+jP/eB0TPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx1c9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:07:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso27506121cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606060; x=1775210860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEZ0hX967yZ75mDXtph7mpwO8D/NCBv8vGpkfdjyKFc=;
        b=ibxs73zdyoqRJyXedFeBbyGPTlPSmls1I7zwBKiq/tvYiDaIsPhV/fFWoqBeR10i0b
         Tv69yo+DRhO3vZvi+ue8OO3ThEFJVK/B/Gj235wionT+tUDOPonPnGLwd0S+bi/UDrCA
         cu2Poa7jL9mvKEMpb5H4z0K8xwStwnOJpBUw3dV7622CJh3PdOjuW7QEKiAZYnuB4mbM
         5hkxtNzwCA9vvP76rrVAYZIpIh5rg0mSb2UD2+OPIfGKbBkzdEGDH/1cEnb+bhefC7Ws
         4EJWLaa96mVX6cV0myOgW/96vSYNAB4oZHkStPM+5XnkrT15+S2r/qpchntLGStULVWt
         pM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606060; x=1775210860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEZ0hX967yZ75mDXtph7mpwO8D/NCBv8vGpkfdjyKFc=;
        b=efgEF127qKn2Elh8FQZoyWZMywmy4MMa50lmwj8CgZ077PtUZn+KwP0/bAKFCp/LFp
         lIIbnKmETxVbLmMNu319gIOvtAQvtniSVPqaW5sz5fBCNsr971ZpebR7tgfdXqN6i0U1
         QPqE4xrUuZDMWvqcP8iy+rDysJveHj8MRBWHw5exZ9ka4c4RtlEbGyFodCJeV3xiH7jQ
         E+li1BGfvK3eInJmHwzMqBTXdPjuMccOnBu0kJK9WnR6Emj3O1p4nJaozqpoLZgOJxcB
         zfr2Li8E7KX6TFQfyHCL9ol71B9KGqymTvvEO5NMq5HDWuYTZQttmNcGzT8yymZicx+U
         RCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj5wYQTqiuA/k8ryLAf+jrtYqpEzLLj+361WshaLoojsubAFXgCtXHLo9VIeciVPK4P8uD3euK/t1E@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3McnvW59CQvvVqLo03sTFh/s0nL6P6pzH9oei+VL9t66g5FO
	RQMteMISpfIC5ZfOJUgQpORoYHtqJ5bvSW88fjcmePdR0shjkWGeAxj7XYmuyBQmP+9yslwLwZ4
	ilr1Ggl0aoaUAUr4D8XcW3kAUFXkR+ihhVFAH7cdjuuZm1jRncsssjxPt3hi3PSBF
X-Gm-Gg: ATEYQzyEYeNDIf728+APi5+7toiDj9pJVx8AMrVUEoIxXvXEe0TISzNBDSgv3BIvdpX
	/pw3HN0G/IU0NSBrpUdtYApY8V192mRE6bOD9aSejqawkBY2t5f6cdmhzfbCKO2A2G42I+vggQp
	m0f5FP8qTi3r7zdNPW3ns8IvuOyQi7w2POO3RQBpfpl6rDU9gNs+cv08rHJGHh1BkMcvpStCSaQ
	KY6f01kbAC29IbIHI2FlrcVNlS8egT1OHBfqpnCMf/kHGGpqH10RkX8v70VyaWdecTM+sBwniIV
	YKm4yyz+fBDhM7spUcYAW0YCSPnIRYSuNsjS3DkqypKytgRgzgFg2xA5yQxbmXAW0v4hKUoVNYJ
	ixrsq7uw9g6z/CvLmJ0/UDLRZ8AQ9gL94faxG
X-Received: by 2002:a05:622a:4a8b:b0:50b:4e9d:14a8 with SMTP id d75a77b69052e-50ba3918d54mr23626981cf.43.1774606060196;
        Fri, 27 Mar 2026 03:07:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:50b:4e9d:14a8 with SMTP id d75a77b69052e-50ba3918d54mr23626511cf.43.1774606059711;
        Fri, 27 Mar 2026 03:07:39 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm138248935e9.2.2026.03.27.03.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:07:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: thermal: qcom-tsens: Add Eliza SoC TSENS
Date: Fri, 27 Mar 2026 11:07:34 +0100
Message-ID: <20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=LRBZoOlhD4QhajDvi1iS4W8pu7wzXHs+aBpDePBF8k4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpxlbmK0qTX5cHm85DPSUAUuOpycDEDkTx+JBAt
 2P8bIuzWzmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacZW5gAKCRDBN2bmhouD
 13R+D/0aHkJL8+N54xEo0Mmn3l9lQp+OsODFRZUgffJh1ahcGZRzYmiBmuRdqcBceXyjdOV+CLv
 VZbnhc+oSEfVZLHJPDH71R4e1Qi2qx9SsiVdEfQStAbV6qPt1OaubtY1V4QF4RLVuYPuTYh7an1
 4t7wbUEJgy+9nlk4goaRkCw5+Jw6BHdjtfeqKgKLV5kXe40iA1YFDHFgg51I5rKGr5g09w9CgUv
 Li0rwEweMOh8EGWfb5zo/i9p/P1o+ju36+Wj9IThcDZkHI+TgeGVYpRzsdFhEF2ubjHlhPd+ZDl
 x6p7CXy/SERNq+xAjaQ9Z3P1gHOE9Qt+fmsjAWYdEPVtoWP1Zurku8xrZKjEQzsq0cZnC21ZxcN
 j5vjfOWKLcVaGgypY7bq6jBdW+VHt04hx09QVm/9MeQPExDwJXeeCTNg8CTFPTTEtpaNHKEOlQ6
 J7DM4fFHt2lxkPdHLEMOElWOi1JeMpwk1oGdQ/bpYe6khP2iIlBakRUXVr6ZbVa+4vyqhM5Ff+H
 l8KuP0ik4sFKGu1WfhbZuqDq7BpEbQ60JYk8WurFKOxxZe/Tjuv7jeed127PoN2fzkbilfSIhCd
 9OBjmFddUv+sFzGhjlpyGTHpdD6g5BKG1o9p04gvz7t4aResbKcxnOG+nQrt06Aw8bIREoC3lGO /R5a9zL500pLc4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c656ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JZNZZRbEe_HiLwd6sRAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: OOGXJ6x4VQgs3lAvQxWcmarf2kEkncxI
X-Proofpoint-ORIG-GUID: OOGXJ6x4VQgs3lAvQxWcmarf2kEkncxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX+DjXnj0MKKLp
 JpmQjqD+kZi4EdQn5RFnzE3QNBEPFsd8Jr8jebWnXsU94CGEBlN4WrM1BgrtRA/AbMGJsS2+OFg
 kHzdRz55zzauftzprTf1/6dkMppkuMKSqHs2JHSJnHd0ZQnY6091turE9Q9CjY+sLkNWy9O7Tyk
 6UGELKTF+7d93VqGP31klnxHzfpPRzDodIdRtv2+ACyoGNMY8I/2RlJhnSatVKRB4b8KfM1dsj4
 tIACQ9q4SYslJARWcqcGUHKJJzHGkm41Q04eO5X1NlOEj0fo0Ry4kqdKX5DU+TjpDPi2nfbRw6y
 ci5PTcUUfhy3tGfp6kUkiU9eFdYdLNhsIS7HAj4N6CyyIDefCOAqcBrPwOL28hKu8DGo1Xryeg4
 i1zfldiXuWrPduFLeEGJFsBv1YaF3/i6ho0b3QvLqQlmPwiLQ8gqzLpHZJ4zvIM6pZT5mKWE94s
 WV+a/4ddqspA+0fh98Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

Document the compatible for Qualcomm Eliza SoC TSENS module, fully
compatible with TSENS v2 generation (e.g. SM8650).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 928243cd2883..7d34ba00e684 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -54,6 +54,7 @@ properties:
       - description: v2 of TSENS
         items:
           - enum:
+              - qcom,eliza-tsens
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
-- 
2.51.0


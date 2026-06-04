Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C43F5BFE
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563950; cv=none; b=tN9Q6yN+nWgq4BVgQrCsT/ChlUlyU6YKIEvoj8yyCv9Css3Lmg+cg3+ovzJHVcPq57dNlthp+ePh/+7nvBdr2Io7DCIA/d9CSdIK0sLfID7h1gpyg3NQmTHSs6xpg2hvf3znqEKpZKXwxQSi8Bvn7ASqd51vLiRiC8P+t0k+WXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563950; c=relaxed/simple;
	bh=BaKUM2UywPsrZfjC3kDRqaq/kXfkQJdiHLSSxwmanmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=duq7s26Cw9KgTU2JsTvtfQnClaYCSsXbaoNRtrStKlbxNR/1KDGtXe4Lf7rt4f2KnD1ssN+waEiku/mWAcKdkKlEUnjibjWG9XpSZe2BUfFlRAHe9TSj/JtKsbXbcmBzRcokKP9FWDsWaYPtD70QkoY6wiR+1vbUSjz3p9O2aMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ/+XyA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkLu6D+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ/+XyA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkLu6D+s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548Nul0313885
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDv
	f44rXKjE=; b=FJ/+XyA7UyXEUcoAfTkYHKRGhTy++zgGzmIEsSgJoHO0OlmBWHM
	DpSVKj9/boz2X77ECCeIE+sTgzSrwL5wsVYWc3BB/xr4swjJ3o0QJh9bLxatC6Js
	R+/B+BLGxHDX2VkVEonJ0ue6u5lKK+/GszjF08Bd8A32+yLeNXgBUcDYfunE8SRD
	/rSP42O5QYxQdT0hE0k4LVS3CcQwwjoIDm/xV44BCMdu0d8Krs7DhaMVBCGIm/gC
	owcFrXPSYh7gqi54Su4lQYySF32KVfGxER16jLp0E8XLbjjvx/3O9UzhSHMGMWS8
	APxB2KJqrMJ9WycDu9hLoIqiJf2Qrj+fVVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v1jsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:05:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c1e08848so8224035ad.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563947; x=1781168747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDvf44rXKjE=;
        b=WkLu6D+stmDYX54OQnPs7aZB0dg9aIYvA3SvXlbjMSqCjPAlZLJXkxHhkPRFKfOguC
         dulpkvaizDt9/do3rAsh+oQqqbnqdjG3GqUcqB5l+/LFg3gtx+gU3DDeK9akMoQ26Q1l
         /yQ+GLTLdZyqq91hqKVbHpq8Xa0neETZ68Psfo0GjpcF/PM9kFZHaetKLDLbYr+K+fpA
         YacGeLaVFneZUl4weKVahKoCLJS0FkJOoScF3vsUhEpaWe9y46KtmCq4j2wEepTdZJie
         18w5+gCR4CsMgF1hMYJ47T++B6D310Hb2WDocQTU1yCYj9Jdh6dDgLvjy1LK+TY2iNhd
         +vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563947; x=1781168747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDvf44rXKjE=;
        b=g1vBTrMUct5nDCsYVyubAy1NfaCwtfe/LsJqehq31PhINOQsC+qFFavAUClfvOnbal
         eP7cwBG0flNiJju2dGKbIuCL3xOCSB8dud8wGgT9m1XUPAxnD350345IruwUCupiD9iQ
         kxHHIlC4RaH7ju7hplNmZ468DFynO2UmBduxt6GEuKvGOHhj2i/13m1f8udMEdCFN+Ez
         lclPf/QgODt0OCUxkIRFTSW7IxNErFr/JqQ+hzXpcTUc5RWp+sGIpTswS/5UCotVfkUM
         2ZOAUn0aEBW44WrC3TdO1r0fmAI3KIkQvOXip/BXXJKW0EX7CBvjEUOO93+5el51UKUW
         2sTg==
X-Forwarded-Encrypted: i=1; AFNElJ/OJULke67wZ4/kDQVkgJBVp+Hs/9s2E5FhEyqn+kMXbzE5wLQw52kB2ZQ/aMP/QKldltlpnXFFxNxr@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjRxU8X90nvb72Xz+1vb3Nl3mCWbd2xem2mVfjQMzaBJaSQVz
	cpiG2yrioIRrJmlB1LYnvaMSEVyM9vRxtBTnsU/dJSABYVwUvjQc4q5U6aDAIu6WMNNzTO4Ix0Q
	QVJ41u2y32uubAJlrEPp5LEA9EyHrF+6KlqwmLIyDOpqklpY9jX3iOXXfIE1rWn2t
X-Gm-Gg: Acq92OGqROYEeHs/Jc4UeLBKBDHguzdo/RfF0FidTYdgFT9aXW2pUrC9tXJBgz0s/h6
	PbLD4J85hVspL7GAaGYAbKeh4ngxTqNq0CN1B5RAVMzrOfp4x6grfdnY0IphblrqjBR0nwy1Zrb
	ppb+g+h++irBxUMjc/QsVcaIC+c6Ps61NTGII1cW8FMVb3DmiIYVNx4frr9bBDbcEKf0IBIBwKX
	pS0Lg0wHYfaaqfVb+ekManh8EMHJeevUkQkoQySSrjCcc5Mmx5qB00yEXuGHRAxGBSfXptjYDxJ
	W3PBBX0H5Ga2vaoAPFMaUVLI1r94IxniIqvlA7x2+grm/yNzYb58O3hGw+g3V64Imlid89qomCr
	BiI1e219AOUNQRj5NtgxK9x/S+Mgbxyrfhx56EB9Ib+4VRLw+95O5hIBChIrVatKt0h7XiwCEgk
	xwIAu87O2E/phPgygAF78YDUeFO2aMVRWZuUYSzUVBjRoPwXaGy3NxSVFtEJdXQw==
X-Received: by 2002:a17:903:2f0d:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2c1640aab54mr69291805ad.26.1780563947327;
        Thu, 04 Jun 2026 02:05:47 -0700 (PDT)
X-Received: by 2002:a17:903:2f0d:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2c1640aab54mr69291555ad.26.1780563946848;
        Thu, 04 Jun 2026 02:05:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm63211845ad.18.2026.06.04.02.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:05:46 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add ipq5210 to USB DWC3
Date: Thu,  4 Jun 2026 14:35:28 +0530
Message-Id: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NiBTYWx0ZWRfX0HO3KgVSYYTU
 R14neTwzAjdvHnHSvoa79kAAFN8IfyTvPs8zCNrdBNB5Zj/vq6d3eqPEAh+dWHwdna0aXJ/Srbv
 udQ+7VCMqJy9FucXgtnmtzOhchZPeZnnv3m8TbOHQVG5KBof53dEp7/Aq7uq/SXi99y1vIFsdz0
 QVS/8CT4JlGZNiNPvWH62oF0ssu5SCGNf9S6KkbPP0F6wJ9YAhZAvm9HxDMOInuZEPjaDclwxDI
 ei9amsuAeIV81AZkCIO1m8NO3prUwy3QdMfyLVZH17xJilGLd5CZ3JRgE75h8nIak0UV+bKGkBF
 Jn8zgEsLlpokzgJdGM5E5wKLhZnvZLxrCbM/Ul2QjL28CplrQ5AblgXunxEp1MaNgJbeOh3zCPn
 O0KzyD857Msyy0V5kLkjR+rH9eWbYjvm493k6ym1v5/l0gWdWVP4tWg5Qmt6SfXWJGnVegQHfti
 77hW+tBjtACWTUIylzw==
X-Proofpoint-ORIG-GUID: UPeU0shnf_J_k9fAg-bYeAGfwPjxYuyO
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a213fec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pdNo10f9niJiPu__wPQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UPeU0shnf_J_k9fAg-bYeAGfwPjxYuyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040086

IPQ5210 includes a Qualcomm DWC3 USB controller supported by the existing
binding. Add its compatible string to the schema and include it in the
matching conditional constraints.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Separated out from phy related patches
    Moved from deprecated qcom,dwc3.yaml to qcom,snps-dwc3.yaml.
    Included ipq5210 in clocks and interrupts constraints.

v1: https://lore.kernel.org/linux-arm-msm/20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..932d7aea43c5 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
+          - qcom,ipq5210-dwc3
           - qcom,ipq5332-dwc3
           - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -497,6 +499,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
     then:
-- 
2.34.1


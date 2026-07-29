Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1313B42DD
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315082; cv=none; b=GroVA8MA9TJBDZTkKzZkRGpHsTi+drhyKccfugXzuShfi0g+TAfSLiED/YGK0ek/1094I5SsuPrZmlXKRlugbIYiJa617+HiKFII1I7KfYPbS4/A6GPhqGhFghmoZZBUOBqLe0SummbWGgGqNUgWdJJBlvOL2sW5Ra6UyWTfnI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315082; c=relaxed/simple;
	bh=JPb4mh/lcoR4hStiesvG0JTpEOv13ZG7MeBKtDJcAZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rVPuv2eeZi60nZfvpxZ4L4xH+ba2+Lo36lqjW0E04K6mnnUZiuaNUYBXieByTS2RgclVk+5I+2/oSlsDyqjaGExZWXNIic/hNU9Ol05eGt+OlPWVvjr6iWXdeemXaUMmljoWxero0VqpBRH0pNwi1SeCz/kwr2by3kxinMYB5Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXhSYcWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJPdLSlY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXhSYcWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJPdLSlY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fBod1569303
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dX5yusLcAsWcliIf1X5ctV
	TzZQfa4f6t3wL4b8cfL1A=; b=QXhSYcWeA56dPh8WN+KsNelUrFCRmkbRZJArsQ
	SY27Mvxu+UrgBwPdTf7hmP09CmbdEEnUMcfthHNsEje7GfSD/T50iry8ZVfM1WV9
	Z1PKd7na7fv7H3BjbwKATprIOmZ95bvT6AKOzYABGAT6D0b9OQDdfJ7kq+0Tw47B
	c17NPGIRZZBD597srJcEMjSKNSWn2PAMA9mHgAD/0CWXYMYSOixK5paY1OH2RA/q
	uWyQw7F+dMUISQvzq8EdSwRdIbIVMtEh/4iOF7vS3T5NABJ7phgh2837oVJ21xDa
	qfETcHtQiemg14xfy8RtfCUixYZQ49AxyxVfrNgk6BX9prgg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108u2cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so1003822b3a.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785315074; x=1785919874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dX5yusLcAsWcliIf1X5ctVTzZQfa4f6t3wL4b8cfL1A=;
        b=IJPdLSlYcqWtOklCSfkGoLYM9URAzBIkdnQ0QDMwLXiSWqtUZAQab+QPuWpT7fyb4q
         Tewpq5XLvYFcMmgGQ23zoSKGPD3w77tiwj0r/eW0jWBywr/XT88+QOPYWay6zflsrzvX
         eB8IF/6pRlhzT4s5PTqR/QUhWMu//nCu9+5tpbdCyt+J717oN0frCPWxJjo88ven0DfQ
         GnWHES9UBFWAhT8zcJqMD9BA4oNz3Wz9LUyU9o/ByClT9JZWkamrPH50xBvccAW9URFD
         VRFVUApGeBkZ3k4o7c+Z+5FjLQ7P4wjKGjUIx6bit4xyW7uedzUP2e/ZjaBrcqDnshJR
         87Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315074; x=1785919874;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dX5yusLcAsWcliIf1X5ctVTzZQfa4f6t3wL4b8cfL1A=;
        b=EoDjkjKxIfCJ7bjHQeJHaa+ruLNv/tkGepqvpujBmprBxunVJ9v4dchCybk25pluQo
         Ako5bnROpH9x1GgnBc5/G44wf8T98A/Udiz1ea2qcS+1OtRHYO69GMU791OYIMrANIAe
         3967rh6yak8rQMoAKZLAF6tGz/lpSYQtgQwne+wNmY/ONi7tPKezIBRb/0wN5ltscVoE
         dGyNwlckT/c5/rcuUzbKv9eOQY43c9x0f5uNUmZIcL5w1Qz9HFfQ2w2eP+qR/wi8uZf0
         Unx5Xv52x0ld7vZ+SJVPU+r7NL0BolDFyoPMwJMJvt6ouLTSNpp+i3C1qEHecuvFS83R
         I8+w==
X-Forwarded-Encrypted: i=1; AHgh+RoTqExpIpUlmuRQMiXXRCDa8tlF5bBwUlh0ucc3E7lKeOQPcctXMdV5y2rpJfpPOogCRL5T4YAbqAVD@vger.kernel.org
X-Gm-Message-State: AOJu0YwQjYYcfO6a7xKwn02rQWOeY8ckZamxlfSvNymYhR4HYN5PlByp
	5rvkiFZHax+12kLJ13wp4uCfy/qM+8MZQKcPgMrFrxXZDTnkWd2KcN4gQV90wLKDcFBY2+SV+Kj
	KsYvo1m1/aq5PJYVhSHjlnpjRL36fNOAYRyO+Cq3L62dgFvPBweJpzbgi8r13083H
X-Gm-Gg: AR+sD10k0oWRw6QjdTDnVltlXPBDcWnFxoFPyNGS5j7A10Mvv/C3iMMmfl6pBr4q91O
	4JUGbwEuiDiHTaUT59nRWRDKbQERGQFVSPat8YRKD6dguYd+D3+C1nYOIVxCEmeKeLq9g1sUqy4
	zOnclYhVfS1luceC4WBqvu2LoV/ufsnmtE/jNSfbFZZALdHZRfpGwYXe/5mTed8ZU07Mzld9kdx
	ErZNplEU8cE2Rsum2AbDVDFKKMfzvaEyZ605J/D6zh5fbNniQGSipdI5WOsGok63OjZD056FWc9
	/vmvvpKMZbLQVEeKt5zvzpjGSb5yE003G8C0A5U4XlG//3uLK1bK0do1hjAn4LqnMvShvBAKuXn
	l5qqo3YkMupMAJhr/fgZE+7cVKYCmnDWDvKRD
X-Received: by 2002:a05:6a00:3991:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84e931d34a0mr5767535b3a.18.1785315073716;
        Wed, 29 Jul 2026 01:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:3991:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84e931d34a0mr5767507b3a.18.1785315073258;
        Wed, 29 Jul 2026 01:51:13 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373ad9sm1032879b3a.40.2026.07.29.01.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:51:12 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:21:01 +0530
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPS+aWoC/42NQQ6CMBBFr0K6dgitQsGV9zAsSltgom2xIwRDu
 LuVE7j5yfuL9zZGNqIlds02Fu2ChMEnEKeM6VH5wQKaxEwUoiqkkEAjPqKCSRF0yoFx8wodeoN
 +AFGrqusbWZdSs2SYou1xPez3NvGI9A7xc8QW/nv/8y4cOOiCl42W+mzN5RaI8tesnjo4l6dh7
 b7vX2kAk6XNAAAA
X-Change-ID: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785315069; l=2197;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=JPb4mh/lcoR4hStiesvG0JTpEOv13ZG7MeBKtDJcAZE=;
 b=jsDkA59GHIKBKgGtN+CoU88k2YtUaaRecEK2D2P6ECAFBlpvyLOtWex8kvJrey2dPK1qecF2m
 hHx7hxfvVD5Beizercp70Qifbis8u8mZQBo1Ge0F1hnWPiqZxipKx35
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: toH-vz9nCD7q3F-lUAOgx6R_SU8d8MxL
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a69bf02 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XH-foFg1LfkvKcJC160A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: toH-vz9nCD7q3F-lUAOgx6R_SU8d8MxL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3MSBTYWx0ZWRfX/Ni47m5xf58M
 JM7QRd+EetZsNxxwxBPcxNFUv06uGuWVT2nNWlbOdiQK4XeeLWo9EGyliGojb30/SECN+qLvWCz
 r7PLcUY9AtNVoijDUrnCXrvpbtR1Qnc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3MSBTYWx0ZWRfXwVEH4cbljBXJ
 Q2RbQtDiXXDZWAu7RK2mTI2vFX16bU0u++PVyOSi9mPMYTP4ff5V4FDy1tEdIrbgBGWPC16dRUd
 pHp9HzNfLNlw0kW+c3XF/14V4v2c/mMFno1DlWNp4OzMCTvHmjWLaIz9Y2LbONDmD+iMFaS5XHp
 QH+rcLiNaPiU+Wl+IvRNLJULFSKf66hIGayj4mCTsUkZJpDsMTbLlEjOXCeTSVlfKnkt6lFLyt3
 9rIw/bRqg9Xw5mK7QknMBvVwqqzZVCmwY++Y/fF58b/2ITHTiId9Xjk6p4/hHYC1bJEJ2NBRbPE
 JlSazdd77Q4iEl9zlVmKI7CPjSfXZnzBNhOPsHWr3Y/cAquUQfyJACHEt5RSznREpG6gl2Hm9rB
 dXuBDXURF+emPX4Ewk3385IZY/ZtTy62Aqhg/7V2+l4maecoyYSLl7AcZ9mDs60v7Mtu39Rg9ln
 Zffu9yEelVua+c8kmcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290071

The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
does not list bam-dmux, so any DT adding this subnode fails schema
validation.

Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
mirroring qcom,msm8916-mss-pil.yaml.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Restrict bam-dmux to the qcom,shikra-mpss-pas compatible.
- Link to v1: https://lore.kernel.org/r/20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b598f0ca91854c8ff4d0b785090e621..eeb87aa5fae7ad9022fc800075c2f9e906b16ae6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -44,6 +44,11 @@ properties:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
 
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -117,6 +122,16 @@ allOf:
         power-domains: false
         power-domain-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        bam-dmux: false
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


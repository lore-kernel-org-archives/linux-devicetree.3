Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF572478870
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844124; cv=none; b=WVZY41Dw7CKHwrlpxHG2TbjBz8h82G4i5/vzMcuMLq2aqZDR6yGyZNqXzQBXZEzZXRZgQDBg8I1crevqyTsvyLehrxO6qDrKWOsIpAXsowMrLQfY777dsZxzHhUPkz4snJ4PPdeph2kkaQDpg3ihNRyLOkKF6EnixzZp72FbCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844124; c=relaxed/simple;
	bh=GCagT5/UUux/qXyPO83GkqwqURmvjqqrJMXH71wcSdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTMMxhncZYVP1dSz4V5hWpUtvAgX2oCp8oJoF4VCy4RYqeWHC5AiBmaGfLFQIbvKvd0dIUr2SKKJthYKSprSlQoXgcQBEeADP3DBuj3klL/tZuwTWuExIAmHVnP3cQxVn/g7GiFVZCzpxw6nyDzm9mUDO368i/ip1hy3cGd1ns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8oG5DKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkMlldeY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8oG5DKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkMlldeY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5BW7N1847945
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29eN7brQ9toN+Y0GHSPBAue/u/p4I7SNtJeSFWoBlpc=; b=b8oG5DKOJ5TGqNPF
	5LyiPbgpThDDTi1nTxq1Q8KafUIyeF8gy8V0lGRapCIVBXPgwOIP9iPg2a/o8bKV
	/9iH9OMsyxjScjyVs7GC/6j0nr0fZ6fy76Bpl9L9dNGKYE486Kck5tMc+o7hdXxC
	cY8NKUCIEJehGasjlml4KlNb0vlg9YlEIdtBxGu9qGSJPdX9kzzD/h8tqqDwMIPk
	mhavTKLSSoek7Z6zweiV8Yc+iRe0XwE0X9IPOofSzU6I/S7jpm423IYQHQdufqxa
	Fokzb6cid0QEIsb07AycTnxftTfgBV2exu0kcVIm7rGlJpnLmeCoiA5oE7cGdxLj
	w7KsOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2yra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so20529931cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844121; x=1779448921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29eN7brQ9toN+Y0GHSPBAue/u/p4I7SNtJeSFWoBlpc=;
        b=kkMlldeYo1rfte9nEf/tCXFSCBQjGyKkikX06CF2uy3+zjYfkLor+aA9airfiGpWzm
         P8QIBjY32Wkqxg/y3YEpcn9j1+KfRdJJhqnAq3WH8k+9JhEJAMwyt2CZmGOn2gmhfs3u
         AERGCh5tRvlX108sA4WNfM/fxslL3i2rU07FhAOWiG4jhPATPz8NiXbLCVhsQtLTVGLF
         w6a9t1U8eAsMp/LJMVjL8Lz9hTZGnrsWAnK0FvRGP3YIsLKrGkxqj//HP4AfhzCMdUNl
         FhSHJKNgy+rkktMN/2ozDywX83ZVLooMzMkFfB1XoFiv8xjUCfFjNlM5LNmWnUsgJ0tI
         xOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844121; x=1779448921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29eN7brQ9toN+Y0GHSPBAue/u/p4I7SNtJeSFWoBlpc=;
        b=FeEYvfS0zqY48gjstRsu6hwjFabrDFSzEXkm5cps3hdS4DprcZB72z8ueU3ZudmEiD
         Q5lJohZAhAnndfsOUEIzW2CE+jIpDpYNE4Ban33/L6N5xLwgtlIixnh78ERaNUfLnKUY
         CqG6TnotgBd4LwPILDqxa0sxz2UvvKtqeKjvrOclBdFCVCSfi22CD2XY3mQipsQtiaxG
         hB6VLfSt8ABJMVmYJ8R/sCxl9YP59x56m2YGUeujMhxxNtziJvfEhqccs4dHLeDiuLUm
         OMMkAtyxF2LxdNoJLOx6wbrklC858r4Cu2RzYa2Hoq+yLB1AJ/nHPlSewo3B2l+uRShG
         J8TQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OudQcsoAYTHYrAd65IBcbYNjyAecjCrYpWxkFAGSW2bX2LA96VHlvCi2u1lwmZafUkqfom5oSOrTW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pF3/lvPR55Teo8ATAtQlyYTTFk8xkwND23NOvN3CrBqm3/ok
	x+z/IE9vxY7oSyKAPvobrbnox7Hxkm7gAadmAdMJIt2d2/T+ixPBygxawvRwhQ1AOj5v3PMpahR
	4JSuQ7mLbFe9UKJdzJnf5QPlY33mvHAIuNEYIRuVOxSSTwCrkNC35m43xyJSHkNWv
X-Gm-Gg: Acq92OEPbBRRmW9SnA/xIpy67oYRDxzZsRMsBhNc16iPsFgQgb5fW7VbTJYrjDxQ7vJ
	S3XmOUHGjN71bdHp022NPBRGGtsDtpXeJIsPY0Sq7hOq5ooNQ9VrctTfTrGi0Z5ORUNFrDniukL
	HCGqaXkcaYwNXf5b05iPwAm/r7E9iiEJTYuxhYvkmzimrQiru8Vx67V+/k5jwN5XpZC8cEq/5Y7
	TwQEkgYmxWAuaE9GqBKNwjGTp8tzopZJioDb7/DerR6wKbhius2d0xuOrmABoUBozZKQlByak5K
	hxSQlFNl5Ut4HGtOP7BfrCOT8RsqbjsSMdSEkeOvp7pajOmyR2x2Fa9pDUTkCPO1heilE82Rstc
	IYF+RsC+qiqRS1jfTz89Q09oWuk3v
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr97169131cf.12.1778844120860;
        Fri, 15 May 2026 04:22:00 -0700 (PDT)
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr97168541cf.12.1778844120324;
        Fri, 15 May 2026 04:22:00 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14059726f8f.20.2026.05.15.04.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:21:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:21:51 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,eliza-tlmm: Merge
 QUP1_SE4 lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-1-ebb630de0dcf@oss.qualcomm.com>
References: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCagT5/UUux/qXyPO83GkqwqURmvjqqrJMXH71wcSdc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwHSE2gSiBNqQzFYHAU6gJ+cGTu6/7uoBjLEh
 xehyNIA1jyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcB0gAKCRAbX0TJAJUV
 VnQ5EADFcV9CTWgPH1RcOSToY38XFxsH1YHeX5STBPQype4yEC0YXwwbVtSR2nIpnVxJR6q9Cs9
 QOGb/OQS8esGZpwlnLB8wXXQfYkJGKvNmT5Aw8HjJeSNOtxufLTIaTrcDPkotFdpr2CPXT7HeDK
 9/5wKGuuCVKQVL1sJBROB5lN2YStAdEEOckMBREnbeWx8463VH8MXHO3KPJrSjKeMFox1Hil0bt
 pX+hT/u/PdVHX00K0eOVa0f73TSAvxaxPCXX1yckjsya7Im14AUI67mctVj2X/BTl9buPli+zAk
 y6rFZhqT7TtdztVh6hh7EewOEQb80XkHv9Firurm5B8AVIxl7hVEGBRDRDnHAun4noK0GOs8H4l
 8E5bPHwJ3pg1Jcoci/GyQFjcHvCWQZp7nskFKNfUS0/UGfqIJU0qpllmExu0l2w6P+i6Z/mQszz
 rjxsXnGL75KArKInKem7W7zG3SWPKU11jK5uAj1fGrEfKgNI2X/Qti3zLly+S99vK34eFwZNBSe
 ogcTmqfUvnskrM+Ntdielg9tC5j6L3Q69GGB/Cf2pyP/NcCg+BFvLMlNULrUuc3STzMkzRi3lHd
 MWNUdfUsuHrNueYrORKRELGhiEQBiY+TCTwSeUn3GBCfmE3UZ5K1XnFnYdAS7NCHIJvPfiJPnYA
 Nq8fqQLHkzZAj6g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a0701d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vTIpTUZqmxZYEWQhA6AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX7/DuSvQkvn2d
 OOLjYeslyVWjEaScsHQaljXj6mDhkD1YhfSHZY+i/KqYGbvtCMGTzo+TfINaCU8T7g1ra4/CRK2
 9Ga5cxCbrHqhPbfgZhBwoCC1OSWYid77VhRwiK5WBDG6DoEshvobf1cIMZumPuqef5GdzwqD8dz
 gcdmTstk6se6t1u7L35KdzrEdDYNFPEdZ2YoZhEoE232AIsy8hIxLoc92G79Flyfd3pR+R48pqK
 Lsf/if3XTldhQz1O81h+0tqb96lFHwFCSYeYp3MPz3NIsD2Mkpo0FksP7JIRSpZ8OZFdgh1dwLj
 SA0vAI5ygApsWzYd7cOHO4QAwBQr/izYQzyEVlMKde3BENDxYFs7xivvLVy3hliMUc7Ush84qmm
 v24AkTSi02jvr6T/r7UAPvdxHO0AEXhG7euFRK4R6s/12XInVqaUQ6iEdsd0RIlIHefsKnccYXf
 6cnRUK3QbY+/VKF/0Rg==
X-Proofpoint-ORIG-GUID: WVY4Bdgai0YuGOoTHbVVuDZCp4PIIUCG
X-Proofpoint-GUID: WVY4Bdgai0YuGOoTHbVVuDZCp4PIIUCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
previous split added one function name per lane. Since these are usually
configured in pairs in devicetree, it makes more sense to have them
grouped.

So replace the per-lane qup1_se4_l[0-3] names with names for the two
selectable pairs, qup1_se4_01 and qup1_se4_23.

Fixes: 1bd5c56253c5 ("dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index fa0177529277..aaaeca8e7bb7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -88,8 +88,8 @@ $defs:
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
                 qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2_mira,
                 qup1_se2_l2_mirb, qup1_se2_l3_mira, qup1_se2_l3_mirb,
-                qup1_se3, qup1_se4_l0, qup1_se4_l1, qup1_se4_l2,
-                qup1_se4_l3, qup1_se5, qup1_se6, qup1_se6_l1_mira,
+                qup1_se3, qup1_se4_01, qup1_se4_23,
+                qup1_se5, qup1_se6, qup1_se6_l1_mira,
                 qup1_se6_l1_mirb, qup1_se6_l3_mira, qup1_se6_l3_mirb,
                 qup1_se7, qup1_se7_l0_mira, qup1_se7_l0_mirb,
                 qup1_se7_l1_mira, qup1_se7_l1_mirb, qup2_se0, qup2_se1,

-- 
2.54.0


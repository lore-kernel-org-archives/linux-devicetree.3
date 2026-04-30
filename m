Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6840B6F0
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557723; cv=none; b=HsCJR29mc4xuOVHysC9Y9ynQzHDNcz89gFpATnul0AtXfs/CFUGfVGj5mCRFPRa+54LwOi8I93Ug9uaAHA5VtGmsbyxD1HIiqurH7p+HTVnR28hqB96GDKSfLjSngGaPSc/3DUY23PwsltV2He3MN8S5V4fCouWG4hDiHSA058Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557723; c=relaxed/simple;
	bh=iRqdUt0yocz/+7auDO3oR6q8zPntvhLalwYqwpTPTUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gxNX/OLRkCI9MFrChpLWuJoS0NHCcuNuucnOJFpytgWR2RYY45peF6dafA/FZaKDPSO4Y9X9XFMB4W7FOWKoooKf2Or+Idq7Jmt/tNHJgF0xsy4+W2KJM8Eaaq6jddJ4BQ/XidF+O5+IBE+4idem+T6qRNS0HqOy9KDKEy+3x1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5ozEa43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0c3LH3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5ozEa43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0c3LH3L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UC6kbQ3886235
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYN
	AvuvmDlk=; b=L5ozEa43L4tvU/Zje5gH07kE24miikviYHWDUdJZgsDDvI8PagF
	C0glsopCbpnikButh1qzLG05TdDVPhctG6IqixiBZRdtLdJWlzwwSygIld5/OH6T
	0KWxqZeOWGPnxLuiceyORyIGw0gKdCohkko8bk8FF3OYq25f3k1CmtJKRU/VCrvA
	tJUKWZ3LSr8xKRyC5xHnYZLApgzX8UJ3Pf83gevqcHbmLOgcE3MOAk9agg5IZez4
	7ecO28a3qJARLWT1il9WxunxvzNNSakmn9EMZA38SpXKi0HI4EB408r0KdLoQy/P
	xVzHbsDlCMjwHW4Dvx+Id6/f6Ott2dINlFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmakgte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:01:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so672980b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557718; x=1778162518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYNAvuvmDlk=;
        b=B0c3LH3LNJtF+8Hem7AN04Nctq92ZlwpPvRm3FsHRm8ircuGsJLZ6yeGGW605EuWzZ
         OAYmi73sAXczXSzgsNm/fu4AJ4OHErgLmfBstmY6wLG2FHYZ/DyQDqzj+sBEsQ7ztbI2
         1g6pNTbj0S+GrSX5gvRNB0napCh1CTmbN/rU4sarcNAkP2QZU/l6Q7iw0pQVjZr+8M7x
         LqnEl9Cl8sVQGytmyhqKGX1i7R/6I85J05a/NFPqQm5cM3ZXA6a1RDjlwkcVvPwjYJCZ
         pLdoFK1DckZfo4OuTPeZcv1IZ9N22/0xS9vyBomGQijT30HgTCyP9loWduXqgxmWQDi+
         QKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557718; x=1778162518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYNAvuvmDlk=;
        b=KjGAdj6F7u3YPjKKW8E50T4W88nuw273VQth+tzNTTcUBkWdUWPNtPFe3fKLRJ0mK3
         zrDBMdIKX7Py1BQU7E7eA9N/wHWEIqLsI2zzMDDPLYMvYjzpJ49zzQbvDiF2Qx+zj3Nx
         tD/K/u2Xx8HkSXDfKGhLe8CBRXS6hEUfL5M4rAo6z9RY+tk3C15M/rqSZ1h6fIUx5b87
         t3pZDWQHH8dxks5ycedZnKg6guy2N+3QV/VgEd3B3ilAvnhC8ZPL+KeQXy2zm27FHGLb
         nHq9FFFcUwGFPCQC9DwAV9uBEgjqDfyjdfu+CpVZgyz9yMPWX+fdd0NxdpBfzJfEzOQ+
         W0Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/+nNs0fntSiQbwuTAR9GuigIFhtu3UEr10K1CH0lUmhze+OqlkPJc4uyLO7qg+UQ/QgThWoePYE/3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6C0MAumcvop3aIw9/+3bMWNgt6cHgft12Bs6aTZhhPx9QzHGB
	EH4zHeJdDUmiQxHrC26R33QV0RfwU+3UXfQJNpewiQYApkWb3ogKlP2O2MEkrbYXxszt7zfCVvI
	dwdeYeSWzqvBWSSybyRVU5WGoQG8XuyRS5qLwpPrOQpeXVgxR8UKIsGGb6ZbXKdaM
X-Gm-Gg: AeBDiesw6pcH2M5y/ZpZ3JGby5FmjPSZwKgOFChwqyBYNT6Oyfy6/ltDuB6zmvMZSB4
	dDeCP2B71esqOp+A5XiJyEVk76VhJ5tXmGgyQElc+JQ+Tfkx4L1z2B7ruZpee9r0bQk8JxVYxt3
	XkvtHTbH+VsM6FThOElGgrV0dOlsK9fOndksNxYG8Sn+huNMIAmqInwzSXeoBiRua+cwDCqVmIn
	2EXZRR2YpCuFz7tDYIac5DyZTHuh0riojBqo39sS8nLxP9FZGmMo3zgf/34ykBzHpxmzjSrOqyv
	2pZdO4ZteiG3tGGTspkJxzXqshgLaM/1MzA9Y76+1CzQwP1DU75LwEfsVGxbeo/CK4+VCp9xFD/
	J532oXdWExiur2GISsrtFl9447jfv+WfzTG9jyn1Mvdz1zTtQa+wTnYInHrUZPdwDZw==
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr3424570b3a.48.1777557716094;
        Thu, 30 Apr 2026 07:01:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr3424508b3a.48.1777557715330;
        Thu, 30 Apr 2026 07:01:55 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7ecf57sm5314312b3a.50.2026.04.30.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:01:54 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
Date: Thu, 30 Apr 2026 19:31:18 +0530
Message-Id: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KK_nCX1XzaN8rfkEXMtkjHUeeN0G8Trb
X-Proofpoint-GUID: KK_nCX1XzaN8rfkEXMtkjHUeeN0G8Trb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NCBTYWx0ZWRfX/oM44u30SzTM
 6ddbb1yRzEt2jkbaYX197jba87cQWyuByYLOx/xIa6erAVr9RE9uoMgrhnJ8eTGca8silGnqR0U
 ucReLJsZSZa3C2oFaNQWZEgX+CGVMyqDRSI1bcsWHdFiPQywXam8LDshHu/iXnkdDSaAQXunE6G
 JgK+59WgBM4vFSG9nUakQyaJLbkeHx1fVeJ/ZqEnlulatN4OCaH83zuHQ+Y7cIIAfW0FYU+b3Cf
 LjbYKrmJYTGCYM/nxB4ReDZgbPjgDRNtKSFajrm9azIIClS63b5nAXtaDs4x0lAF4oC0csJ8lg2
 Jb8E2CDFAMH6aPlVZKzD2apYQRas5hLL8l5Olh477Ih4OcE9l9Vjjhoz2Gqmo39ahsTt0DFj6sK
 Y7SRdKA3FEqRwf1Hf+8QdELh5jJZhZ+n1MGLSmpIooQnSfj6xupbTBp5InM3KXZiIFaL68hvNpH
 FpXetKhlZ4b3oUPq4qQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f360d6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uk8a1l6paNbkfHKRL0QA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300144

Qualcomm TLMM-based pin controllers share the same gpio-hog binding
semantics across multiple SoCs. The gpio-hog pattern currently defined in
qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
controllers.

Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
duplication.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v2:
Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
---
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 4fcac2e55b55..3b33daedc018 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -42,11 +42,6 @@ patternProperties:
             $ref: "#/$defs/qcom-sdm845-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-sdm845-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aae3dcf6cac8..aec72e8c0621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -51,6 +51,12 @@ properties:
       should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
       information.
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - $ref: pinctrl.yaml#
 
-- 
2.34.1


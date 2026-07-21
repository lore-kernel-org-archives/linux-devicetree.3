Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B2434E32
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629839; cv=none; b=nYtmzHZV6T4g/tDrxEDVeH9eVYFMiA+o+BcNitUDi0SwmgQMg86K5f4ymlPuIfE/+PtzGN2gtSYBuKVUSY3cJ3DodPdKsSsF5i+IZ9ytiRCmN/X3fRZkU3DwuwvSJKLAQA7oMB6Nt+y3DIT+pR19MKNLRGsTb3KmomK3v3+47Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629839; c=relaxed/simple;
	bh=VXp3k0UXGtS2N774D+8ONtRUpSpEedS/ekIRBur6ZRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FR5np9Op6OpU6pU1xW8tsGYRrpZVDm2NQWmYQ2/CaLk0BFZ+lnaOR0HZpuVCAZ/lGhxHuAi0Hkjp5J8z8XO4BIhZltFc1ZX9edpc2WZ+vs+Uw+EQL7YdBwJgGtv4FevtAmDpSV0tUgFpQt2XtnOQgUVAricUZ7u988VMlOuSKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMZvn52p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3UfiiIF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMZvn52p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3UfiiIF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARNrf1499956
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jtMUteilMGu16R/fI7SwZkhUF5xp6JcX/GI
	sEXTTNGE=; b=GMZvn52pNSCassQX2C8hvvGt7b8w9CFDtKYAtUzuL9xnkpgwiYL
	+CwDK1VA9s3aCvj3FERGWUXZNAWlTdhm2hNNEGWo/QD5DFCS6OA5ms9ChgvCjdO4
	zNJWRUb3oiwN4NAP/ZUU1nk0NV9eKEWXngxs5b3iES6s7cRKkvv17vW9n9Fc38ZN
	yK4Ye7IQxukAYr/7Rnn3eJlab0AVbPm/cTo1iV9VXQRU4psZqkMiUauoLvrSn/1e
	+AjGhWojzGY8vZKhCYISPqoa48kELH3rBoFACJ+TumW5QLS0g6SjFkYJeFejL1Jf
	BwCBxdNYZ90aeXun3eeqsJSH7WW+OMeZjQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvsrre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:30:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso7223641cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629837; x=1785234637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtMUteilMGu16R/fI7SwZkhUF5xp6JcX/GIsEXTTNGE=;
        b=S3UfiiIFvknu2JkKQbOncx2IKu40TRYHIF3Nj4Ye1AZZ/fe5W6pFxEnxyBAE9zmT56
         Qhl1BLGaYSKQ6BijkMTE2dw991Cghs9rh64sfojT1W31QwfQoGv+1DVYsBkffb+G3ham
         VWOhETslVc0JcSx1Yr9F1Ed/MSClYB7Cms4TIjiJF9inyHg6vgXGh1Os+73+m7dQWtYx
         gUNkZjQbZ2tZjGmrJdB0LAt4nPzK2KCW/RRbuvlANz3B/SgcxUSzFHTOIUKi1330efR6
         E0jvqz7beHRlL+2dUfKVlt03N7yCXTyOrYyQqjmN0rrqBLZK6aLKj0AiWfDivMAAOXFd
         HWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629837; x=1785234637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtMUteilMGu16R/fI7SwZkhUF5xp6JcX/GIsEXTTNGE=;
        b=koxyj47o/bRQv+C80bTISmcgVSWVmB4EmYNG6ZW9M4IM2JKy3Yrnc+DPD67m/FrtH4
         lLmPfAG3EZ6axA3gfUsKVwx8FlpvVKulEMNBeshq/8BYGzyqWnJDRa3lVxQnI7GzIcfj
         eUJ38cn2PdzG4CgzUq97bCXmJqLT/VRh+/Ifm/uOSgIlGVfX4xuLBNlXyc4y+VjA/h2k
         UassucQqO/ZdlBHUCBn0cEzMVRMWG0+RZiTT+Pvx1dBrBrYOy98+Id3ihO8aIsvvY4El
         ymWzuwXlYrU+QmiKHyK6nTFCUGIY/WeHUgFJaifc3KCOU8hVtpjmzAPX0owzHppBG2Ps
         /LrA==
X-Forwarded-Encrypted: i=1; AHgh+Rrq06OWIZExPJduAHvsEPHYNj59CvrIlilLVppiOG8+IjnlvVKrpCUa1TO7fu2qU02qQodYZcTT4zKq@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSYzbiPvyMmt+0pC5wHvskVvCnYUVdvRvi9YaddM5G4eegE8u
	dPiZ7kpAU/lRwlfAv56TON63jR8OxYRzU81YzH8YSijX1+y2FmPbFn0Vc0nYHp7OBcZf47PShNx
	Uci5Oc2Pknycp/5eh0qvDgU5QPmmfyHViy7a/KVfwBULCuMcbisdTuyzEp+KypyT3
X-Gm-Gg: AfdE7clYB1JnoKruYDVch0nRgK43h6Y88O7+uJESjital6rORHleIGR2mLCUDy9477i
	ioBcTMk/OP4D4wmVGdDeriN6qUYXwON8UZtWCZ4rIv6KMrPKtFoNIRjJ7jYO2hv94MIpQjvhhWu
	plRhqHsrXknzPDWcvfGYVx/HE9r9kX0m/g2+6BdUovEgJChT1Vfp1C1MEQwh+nUCnxBPc8BbZ5u
	UrySe0C3B+HZJv/1K2OhgKZbuwfnE9VI2vly5whGDP97FBwaT5Mmekb4mJnQg6bzOAKy8D2GBqF
	JfEhHGIGr2ELDhzXdHr4b26ndxZgrbogxemp9rhsFn5XjiHZRiANxffBdVTxIJgROhPM5tXQ2fz
	ZBsk3thUD+cYWOya1
X-Received: by 2002:a05:622a:909:b0:51c:99b:d668 with SMTP id d75a77b69052e-5213e28f16dmr176176891cf.49.1784629836490;
        Tue, 21 Jul 2026 03:30:36 -0700 (PDT)
X-Received: by 2002:a05:622a:909:b0:51c:99b:d668 with SMTP id d75a77b69052e-5213e28f16dmr176176671cf.49.1784629836035;
        Tue, 21 Jul 2026 03:30:36 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956546de4fsm60985945e9.1.2026.07.21.03.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:30:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: dt: writing-schema: Extend expectations about example part of binding
Date: Tue, 21 Jul 2026 12:30:32 +0200
Message-ID: <20260721103031.82188-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VXp3k0UXGtS2N774D+8ONtRUpSpEedS/ekIRBur6ZRs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX0pHkve/+xqHHTTD2HdrWaQKC6N/d//LaQnV9
 BZb3PkTbuuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal9KRwAKCRDBN2bmhouD
 1wwvEACPF56K6PzBBwDigmC6CoX5DB/xE4b+zLdKsT/PZmYRTC2NTPT0bOnajOsTJ7O2v6PLZlT
 wHNUXyc+lROl+CLv9l3SQ+eN4Cg81DxJ7mvCAo6xxTq1pzDIKyhnahvNr6TgNU2ZRzmxTFHqSyA
 gtGGx6zweexs7Q8DH2KefOm/fJ+PPG4W4wZns1pjebqO80MxpAR5mzila0VMuyoo+J8y84U7BvI
 PG6hJBzc/8q/ylJ9HcS/lJdfPEMkkGh1DvlIfyT3Ojs2Vbk6eDxsyCEKQV1+GodyEuLNM/SC7zp
 R8s5H3kE9f8BPfpeUXuOR9zW26OK81rYIlhygvjKOPmCvfw2hT1CCNe8inn79G9T8l9vSP9fsg1
 5K5QKyqtqRexA/OFmqJwKT//6D7sixt/pWQH2t0uyMuIRNz0M0qJairSb2S3uT73B/nq/fyLVsZ
 JlN08wOnFeoMEuxcrC8lDGv5GVglVzKifXVMYd3I3xjHQa0UFpZ0fjcnH+o1CezHKT3toAJ0dax
 xx9CRnPJ3FLBOjDQihwxJFrn3lMGd60CN7hT7KJOvcg+kxCHpavyDlIYav9W5h71cI2R003lmQz
 HPLVs4ArOTg0d0FK5JU5QSXUBIDZ8h+AGvPTvNJvU5GPeCbnnD5PrC1C4TFBeGH19xhRGcdt7Pe u8WxrQuvKmp3gzA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z9VTJZYtdWRStx9kcjpdCYFcrdtzG1Z4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfXwQUPE1ufJ8dU
 dKfn9EKuXlOutxFZ/wL2E5a4HYnTQQw5rhJ1WzFA4RdipqOHmZIVL602flybCR4TETjBto0zrCV
 tbDGb4k2L7cYC1wokyWDQIs+5OnFzhA=
X-Proofpoint-GUID: z9VTJZYtdWRStx9kcjpdCYFcrdtzG1Z4
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f4a4d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=e1H8DJF7dWPT80t_t4YA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfXz0p1bNVYRSoy
 /Fw7GpLYsHrBeJrQ4G1reLm43cttZJRixZ4zB/ekqDGeDeeMz8X6rPRJgpxaTkI+uUg1m8etl4F
 /V18JP46SrVEt2NiMSvNJ3OMlNaV5iXEvXvN1U5qHJMe/og/+cqAq56NfpSN8oxmj2jUc4XywCr
 IwbckaAvFKCpoBbfNQO5aUBbH8Wv24wYnad8o8UZdGU0ThT/Wyzt0J2voDUeH3qQ5krLDnq3z2Y
 YkjCf1ZW00MCF67Zf5RZvsgTOFxv2ymtAhlzCtfMJHgl7zgWtAMI31h81r6pHkcVV0X2O5MzLtr
 bfjfHcLYQBBuvDiWMOp9iUYgsdJd5KRkwPgxYOIwDRgY2u6lvqzMSaUizIfqmOA3l7AnTLtZQDP
 DdMFYPJKNoJJZQBQN4NoF23E5vGr4IBJLu0+ksL7bDIGe1i1ecBd4okZbh302qZrToJnRUCTnyA
 HYwTtvn3GPLf+T3AxGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210110

Document already used rules about example DTS in the binding:

 - All final device bindings (except sub-block of more complex devices)
   should have an example.

 - Phandles do not need to be resolvable - Sashiko already provided
   incorrect review, so this might help it to understand the concept.

 - Example should be complete, readable (use known defines), without
   'status' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/writing-schema.rst          | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 3ffd0828617a..0f665b13c126 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -127,9 +127,16 @@ additionalProperties / unevaluatedProperties
         two above cases ('false').
 
 examples
-  Optional. A list of one or more DTS hunks implementing this binding only.
-  Example should not contain unrelated device nodes, e.g. consumer nodes in a
-  provider binding, other nodes referenced by phandle.
+  Optional, although expected in every device binding. A list of one or more
+  DTS hunks implementing this binding only.  Example should not contain
+  unrelated device nodes, e.g. consumer nodes in a provider binding, other
+  nodes referenced by phandles or node labels which are not directly referenced
+  in the example itself. Phandles in the example do not have to be resolvable.
+  The example must be complete as much as possible - have most of the
+  properties - and look readable to developers, thus for example use known
+  defines for interrupt or GPIO flags. Example should not contain 'status'
+  property in normal cases.
+
   Note: YAML doesn't allow leading tabs, so spaces must be used instead.
 
 Unless noted otherwise, all above schema properties are required.
-- 
2.53.0


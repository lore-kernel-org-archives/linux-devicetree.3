Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2731E3D6CD4
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313780; cv=none; b=PcCPgtfY2kgd+SQCBsmRMa6KiY2Dk44cZ+0RSeUGRSktHE/AlYzthRRMquE+WS6L7Es5R9tq+5pKfY4m2WfRsW0liP17IDzjkYO9Qx2rYzJice2/8Ecb23qq8bM2wRFiNSru7b5HKoQUveN1YC+Yx/KvIJjWkhldlhU5Yr9Xwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313780; c=relaxed/simple;
	bh=YprplocZURA1lKVLjcB+psbpqSxBxjQw83uHxzj/+9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXE6RxTZzftFVstDHtRymGRbgmLfvSLrwx6JgRWl0k51jq5aj2WkpVCwpJdlFvJyWxSXH2fRQ/kn1tYolmZKlunt8kuZIzyhWCfZoRStuEY9vYrFYQAM/qoz/CcjMcEWfCsfcVlNAdk0Mk8NzG+a9gjHV+VE5n60NpSjS8gtyA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBb8du5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhnoDFnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBb8du5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhnoDFnA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLnMj3761355
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BxPqoSIfk5SgqjJr+ogyo0XMyzNwZ9IP9oz
	1ubebmgg=; b=UBb8du5qyegAl+J7udmO7dJa7C8XwFjNDEnQUA3MqV9J+KcvfHG
	/2/mD1LGRCJQlblAlHuX/VjilGRjr2wPXtNg/Mm3Pfk1ESSyWI2yBzpZrJ5tp4/9
	gePi6dcC0ETvQ2fj2f7wMUJxT52HnI1tOxZcRUtph83h5oqW7RO6IXs1xxo0IvwR
	pck71eX3n59Tj9+cHkCn6xH+rbapoqHSQ1rJk2XfqXMmb/aQ9AjBoJFWh55sjzpJ
	xc+uUzdQD3m64NRLKbjIOvkXMEIth+b4h4V7qXvT2fpG3r0Gl42z2HCSLjtlYEx5
	+q356O6rh7jWASpI05XmZQSyDz1JtREQPSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdrnjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:16:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82d40278103so6849420b3a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777313778; x=1777918578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxPqoSIfk5SgqjJr+ogyo0XMyzNwZ9IP9oz1ubebmgg=;
        b=GhnoDFnAyrLKMgzGNbj6Y6VcX92h0qnavk61uasW+/jyS1umTg+nVuAvzk/gFmT7W3
         +F/z0fjW5a7YCDOgXcV19qBi2yxWYU2fvNgJHdjtlmk5enEr77XSVw8AUlmlxUQQVtzZ
         bfY/WYlRRp0RIkrw42wB3fM/JiqUKr0HzUXxRqKwanK+JPXYm1R+I+CvngnUExPpNbKo
         eykfqJj94/Q9ZiuGibkqM5lpZLfRP+z0YZYqRf6gFsbtuFgg5g61tnXCPFhMDxeRrIZJ
         dV9kR+LtED2BNeN2xT9g3CFKJ3crK+Cd8RBAsKfC3exnwT9DldkQSsABHxxoyLQGFL0g
         AhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313778; x=1777918578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxPqoSIfk5SgqjJr+ogyo0XMyzNwZ9IP9oz1ubebmgg=;
        b=BWNKDspPBR/O972sxk79SbcNJG3bpg1WNpouTp7dpqxtL5Jm9e4jPam3VBrRNMAEjJ
         Fb0AHJMxPGYPFAQcNeRTojKjaXtxmgcgknPdZ7lHEYKoHyF0I3fhn/vfPdoW/1WF+vhx
         Y/WM+CYv1Evq/g5EWGTbh1kprLB/9Zyhu+FG3V1e1NtLVRtUyIoRhfqeYufV1bQTXvI8
         DGWrn8nyjJB2OPfVjm16KGAToKEEoxARAP5QECy5N7qpy/ZLLFuyB8B2pT9SCoT0cTV5
         a5kFm6bkedHvjCyUiuIIvxBzplbz6o3rQWThGXawgnWNQmck13vKkNN4tXCCWpppSiyj
         UmGQ==
X-Forwarded-Encrypted: i=1; AFNElJ99fZKG/8PKBECyybdn0m8nyhgX8njtIdnyLyhiyK/KS/oTgM5Oq1ZPqDC5mdrYJVlWl3FAYF066ITG@vger.kernel.org
X-Gm-Message-State: AOJu0YwYfKq1SrQmqDiRKlMhkls+blDk+3wDV/XAMvAJASQ0iteqod35
	3slU0lk0TddOcUbY6ZEJmClaRfvK0RZGXpH9NkTRpXlCJS+gSULFIkw/1nJzfI6H7P7C3S71RjE
	Ah1q3jDJwqCAD2k6P1Hwk3JhYjX+5+HTo57IBSQ6a1W9ny7g61L1whMhQnjXRdA4U
X-Gm-Gg: AeBDiesKUWooLxT70abc8SMfLlG4DZwum4ZwkXFoO5XGc/Qge85uhjsYIii/Q2mwtCP
	fQc/ASP99nadiYGDCZYjGSkReY4jfkv4KCqHsn17KHGlzxq3ye9WXq9ZM2uTIGSwQdv0Xz3ho4p
	52ffB1RooeoTLaR+x/kelsAz5qHgqkYWktqbMZCBIOZ0OISKTN/2ZUEG3f5ik0bGYAGS233hYTV
	j2mW9Q+S2xUa1fpzsNEsG/5YD7iTYOPJj81nA8xItYBNOdjRmGsQbhvp39NU2y89z0LuewXpzKq
	cssfxrMYJSeWPWNwp6ICS2I5SQPuhvqSCWsrBxIUTCXHl++PJiFBggScZqplRn7eUTUXBegyE0n
	VRRF0Ulw/or3xYLVBWAB9Hkd4o9OVSvZ8kl1brEWlU140hZa4pejtfzqD5Ho=
X-Received: by 2002:a05:6a00:ab0a:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-834dc265f94mr83133b3a.25.1777313777602;
        Mon, 27 Apr 2026 11:16:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab0a:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-834dc265f94mr83095b3a.25.1777313776918;
        Mon, 27 Apr 2026 11:16:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae1fd83sm154353b3a.14.2026.04.27.11.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:16:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Hawi AOSS side channel
Date: Mon, 27 Apr 2026 23:46:09 +0530
Message-ID: <20260427181609.3648384-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NSBTYWx0ZWRfX4P8rVCb2rVdT
 zdL/uECXAAb5XM9XfjRJSVgXxTViiVIRL30gPVF7jMC5RDP416Z9DrjMkumlvtF0BQy2ISFnKAA
 ecWPqXXuxroTIa5dgu87UL4flGxH8+edHWJ0PKq2Psor7yBkc06CgmqBOo/WFrrLZtzOW8jvKrP
 gFXdzefYQEX6MN7flqzt9nYMchZV81BxXmrGLfGrnMb/W0g9z4L0MAlOOK7Bi/TuzsJBUD3jHSm
 3deTvg7YxlJ6ffLJyWjS90WW5/Yi0ZF2LD6s4aV88rzXdMJLf+ql2tOj9nV1bnop2qY3Dv5wvNJ
 7fK/u+Y5pXRNMrA87jepdECL9773C1vdfWHeTd0a80dL5PHZ/AdDWnI/gi8tJGuUpRWN9VIDv24
 +bnf9LsKLmCAM0Ov0zNurfOnsv7NIuPsgtJ98VuaondntjjhXtkyF5TGFLDGwl9r3NW8JSBHtWd
 UfLt4xWQ8EDJKD5dVpw==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69efa7f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=M8R6JNo6oyjcFb5i_SoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: FUpQS_3PMT8YMo85xvFMVFN7cpTNCWRX
X-Proofpoint-ORIG-GUID: FUpQS_3PMT8YMo85xvFMVFN7cpTNCWRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270195

Document the Always-on Subsystem side channel on Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index c5c1bac2db01..c8f95ae563ae 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -26,6 +26,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-aoss-qmp
+          - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
-- 
2.53.0


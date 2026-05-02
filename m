Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF4628C84A
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777737915; cv=none; b=Z45UhsgUkCgdx2bqrozhzwiQk/ZQZTYb/OPw0pNm4xNGipp0xI2gyh4AizAlQXPnHrRxnae1gd64S0Bu4XyrKqKuyBs9YYq2kxKXzFFOff1UllyynEA50Nt/SBeAzi9UX+K+9R1/4Sa88qRfmCmgX7lM75rR4XB9R2mDgCBXfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777737915; c=relaxed/simple;
	bh=rgwAduSAuGAmKuanH3/72r2nsTWd3UBmyeg4wlC1vPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eUuH/nKlMLoE/K/23E68YMY3+Z9Oc0rjQcxxe/XaBf1PjGYFoj5iy3WmBk35pRIJrDmV9o+YwmFRof1CIJsr0pH+Ntg0BNbXszTJ+mWuR3kFhIER8Gz245d623zBUabGiXoSIbpk1VrhFN9tZx7+gTi1VysCyesIgQLjP12ei1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biwTrTfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7Fy3FZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biwTrTfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7Fy3FZH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6424lrNc657324
	for <devicetree@vger.kernel.org>; Sat, 2 May 2026 16:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pxskkpGelqJ3sL/OAiT1fM
	BOJD29inpnuAT49FPBKr0=; b=biwTrTfOWobm1f3X2zYcf16QNTZbwutP4RbIJM
	Wek9fALtgdkW8UQX50UogJv2psSOA7AjiqBxP9ZRAgOzFWBuXPbP/zt02eWMPyOI
	30xF56+mV2Zu/JTgqP7YeX8QHnilyiPwLT7H51ViU/ExMb430VJZ27T0YDIPuqSx
	qJI7IbrCEevuzNr19P/7mkKuv+L6NVvxb2eq/CeZ3YpvnE/C3v6ZojS0MSorFVdi
	HKGqaA0/N8bQzlvlnof5OFmkFF75Aspf8rq1qMHENMfMbnyUNMzIFo/5U0X0vl+5
	DDNC6T17o/3WnTFyzVL9CkfMBICZkw6YVzZ3Vo8iE56RJg/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj792wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 02 May 2026 16:05:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36524e2c5dfso147580a91.3
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777737912; x=1778342712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxskkpGelqJ3sL/OAiT1fMBOJD29inpnuAT49FPBKr0=;
        b=d7Fy3FZHP+0/AkiJ55fAIp9p4LzZPqyMHXK6QSt71TUwchPyGbYb8pCf9xylfJfox/
         UToiGTAuF7cFMY9F6G1+mogGaJqQ5utG1+ZIQT2QyF+oQ4GxGAmmrT+/GKVlgJaZ9MLF
         CoCmXiDDk8MccJXcZrDG0/q7uXdZJybexZp9DQzRiNoAi78kwHbCMT9JC0UqiA5WQEKl
         JDL5yOaaTjWmyITgYPej0tCl/JdmPZPEHLDQCDUCBr5cUvtIQi+uhfSUdXihx4dfVGgP
         Fbqj8IzNh/EUcsBYW43/OW7HCG0vMHE3zR6ynemV8/yCLeGbBDbuSnOSjaqXlqgxwRHg
         14Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777737912; x=1778342712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxskkpGelqJ3sL/OAiT1fMBOJD29inpnuAT49FPBKr0=;
        b=R1il7IHKcAblyHlXRtEh+QRYkN2MLjL4/orWHJ+dPGXqewQ++RNwg2cd2p95iPl/pm
         g92YfyND1VsVc1227Iwxx2lgtifaGP1mSpUI/SOAZ088bCbpCm4KUolUH8MMm6Jh+0qQ
         D4gDYleKIfaNHmerv1se3HeF/q2nnGT1cJwtDizx6R7RC2jxd9+rz8ydLash+10MHERw
         ejY4HXSPHpGbC+ALLAgM33jahN7x4JXabmJoBuSglID9jkACax6VIx9GGMlGDYvc2iYr
         IR/1dNycHO8cHcpNXuAr1xu2xmlRifV1MpnBffOonDWUVMfEP08UDXO0j9IIGDfiCf8D
         IxGw==
X-Forwarded-Encrypted: i=1; AFNElJ/AwDOSNJTQ/Mq+c2CRR7nouXsd/5QK5Tszhfeah1BEzmIxaWsOUmT+Q5OeJ5nyTe684/cujLpsp3eE@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtvCprkL6ycNWb22cCzIsDkq/zoaT++ytX8BxZaV9aU+MjEs0
	rXOrDZdS2Ixu0dujX8WlV9B94eevsmh4Kni5vpq5rmIHSLFJ0PkVC6JjK4vrcdaVSXrk3WO7ONj
	IS4JqqhndfASXbsljyxBneUtZ6GIM/nhM1W5ZP7e3vXqmoxKzlxNBW//5p3GTh/Tu
X-Gm-Gg: AeBDievWIQ4j9yGe9RViNWCM20fcVe5Q2bSE/ZT61EaCHU3Imo1Bk4oUm7oPkTmEICh
	IowC/gyCJoNuhvOmIAX3+ilXQcFO51U30/m0Nl/I3MmZvNy9mnfDwPJ9UwfWxuRQmoUD7bFBVvu
	URYoEhe7gI1LcH1jehh8+eU8X4Zj5UGNLxRpVa4hw6HsxTIuTFZzpP7+f0JbZiQ6sH8DqO2ueaG
	dY1yTT2rcJe1clQpK78dtTpxXwPexcEjC2LOvwNP51pg76oiJTDnmZCTQa2hjiDagal5MY816Xt
	l1jWk5E1nPB5leyN6Jf87Z/6eHSOosaG7WG3yshmI+5yhCL4XQaolfSCxx/ym+SKpOiWil2fc4k
	MEWQ2dVTMTtY4IL1BwfO2GX7RRN0MYdC+7+/OcN3CV9YNS48=
X-Received: by 2002:a17:90b:5830:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-3650ce6f2c7mr3516893a91.19.1777737912438;
        Sat, 02 May 2026 09:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5830:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-3650ce6f2c7mr3516858a91.19.1777737911995;
        Sat, 02 May 2026 09:05:11 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4b0d5sm56787875ad.68.2026.05.02.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:05:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 02 May 2026 21:35:06 +0530
Subject: [PATCH] dt-bindings: cache: qcom,llcc: Document Shikra LLCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALEg9mkC/x3MTQqAIBBA4avErBuw6ZeuEi1MxxoKC4UIpLsnL
 b/FewkiB+EIY5Eg8C1RTp9RlQWYTfuVUWw2kKJOtYowbrIHjcdhDC7irfgV+6GmhRp2feMgl1d
 gJ89/neb3/QB5cdO1ZQAAAA==
X-Change-ID: 20260502-shikra-llcc-binding-7832b24ef74f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777737908; l=1118;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rgwAduSAuGAmKuanH3/72r2nsTWd3UBmyeg4wlC1vPw=;
 b=pU52dA3MXR/qqW0EniFYgiOF3WauK+5LJ/2thRQ99bdIai6hnXqhHkKYj+6x0rXnnCQ8RoODS
 J+APRjJQGaMAyl3JA6yfMs+zzSax9cnErbsPUVSuygSnPdyjJFYH7ME
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 6XBNszXeDHvI791CtF-Ve6q50VfXAYjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAyMDE2MSBTYWx0ZWRfX39QqLIn+86jD
 jILXE6qUs+jdOu7VhfN7SRWxTan3zM9VfEhLHTNDZYgECV34445VKUlYTFcN1UNUed822CMkGGb
 iVr6Cgj9/4z4sYaZ7Dahl5Aoa44gNileEqiDJVztNlzxA2UXojl2/1zQMDYqdFlfPYQhCdjeuiV
 ku7Na3uAVt8ib2MzAKbmnjz8/RVB4BvBNlEeFRzuRsHY0qB1VeLbeslpaFNEIijDHWcDqdZtSij
 JANOj8ZG1bPY13yNoiPFIm+g9185LpAGAlVMm9tVukDwJBfWwuwra5tYcPA3w5BvPOk2ANPd16e
 UM5V2a0x9VRWzGCgQbFvZhuWZQ08uXYZyo6TtQbRs9ig84MksmQTI7ftuMoRu22Uu9h4W+tySV5
 j2uCXgYuAixrqRbxj9qIiIfBcVVkjp70szDyFp7v0tj/UO1/zSGEaEBlBR+0PQYs4/YOWHpgdNp
 jE+Sa9chqLKoCQcAeRw==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f620b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6XBNszXeDHvI791CtF-Ve6q50VfXAYjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-02_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605020161

Document the Last Level Cache Controller on Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..730556184a59 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sc8280xp-llcc
       - qcom,sdm670-llcc
       - qcom,sdm845-llcc
+      - qcom,shikra-llcc
       - qcom,sm6350-llcc
       - qcom,sm7150-llcc
       - qcom,sm8150-llcc
@@ -206,6 +207,7 @@ allOf:
             enum:
               - qcom,sc7280-llcc
               - qcom,sdm670-llcc
+              - qcom,shikra-llcc
     then:
       properties:
         reg:

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260502-shikra-llcc-binding-7832b24ef74f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D2284883
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047895; cv=none; b=XRSYabPsZMXl8FcCwo6SGj/8eBlcgE8yumDkDVH4DyWDUgzmHsZbBIB2TElAW6pIHJMD82LxIpfKfXQYbsty8JLmRYJHFCqz0PYphzI9g71V2byKW1p1THCzzF4GLCDiS6ygBVSLGQNQ5Sbbc3TTrKnD5Zjyf0xgwLNcDxondSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047895; c=relaxed/simple;
	bh=P9EWS2HwoWEJHCZzZcdMPtH3zC8HKCi+f3oLHKre2XA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ldoyh639Y2V8cK+qjkCpPaRx5FtKekDn0G/6m+jzURnOqoyIkQyu0sqZzLnN2ovacqXigo1+RIuFFU7ytQ51YIAv12FrX4Rulh/ZNYgHaevSNrSW38TKJQ1UunY6P0YB59jpRoyfCRivSY9wk7WbhycC+q39I9ihW9SgxS+ZUro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiGQcWWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7bSG+I2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiGQcWWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7bSG+I2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C4sca2398387
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mNf1y06fxqQ06Whs5aztg9LwFEIyFIfQgR4
	WfWBDfDg=; b=hiGQcWWRD6yWuLceFErn+kXs9OrHvf/Q3Bay7L/163Ey2x5JaoC
	ubqQkn4Iqoz1SgN04lyghqnr8zytGH4hUcyvhieDgJCNmMiPtomg/Q0h7tIxZOAm
	om5QaoMo/ZprRXaXZSgU/8k1IJNMEjTIszyeXXzBh87SvJZ3cdkRZeCbeFjlbaCm
	tmS+cNVuJ5EAj84xHY/Y4/GBlX2n7NUYpZ9EBu802VD+/TOlhaWDqsV35rCdtrkE
	MlN5lVUiVNZwomOyC+gyxNShNTZJDNIE+jS77nycxxqoLza0EwGU8G3O1Z9ec6i8
	ApTcdmXPNQ/Qr1iiiqisVC9iUGavIFFkfmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324g634-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:51:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d96923dd2so4606540a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047893; x=1775652693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNf1y06fxqQ06Whs5aztg9LwFEIyFIfQgR4WfWBDfDg=;
        b=Y7bSG+I2uhqd8FitHz6nklyZ9dP3VGhuMGOVNzO8qXQMqsazJrDNu0ZwwoUQg4Cbnq
         Ys0Fa/DpWTUNVqtub2jMX7kU4O/xgr/jQCvrYsjD0U9NqsGBAUtXS+w4QYTJP7oSX0P5
         GZw1BaH64tisVvFZlHJEeaOBuO0PnShxOGnU4Kt+huWFP5LoHaaIvWV5WA/ntZjSt7zs
         ffmdqWEU6OD6aASDWaiqHt4lH575/RlV4bn9BLB2agXs51QH0FtAOBoMADbgA1B4pSJP
         KyqVw6FXX/bU6TqoYKHC9HOGKPNVBb2jDXvie479p7gouxv+RoVR6BN3qim9rDlM07xM
         YC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047893; x=1775652693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNf1y06fxqQ06Whs5aztg9LwFEIyFIfQgR4WfWBDfDg=;
        b=V0i4OvkaJhQRZAHLzcJ6LsvOXVgfLMU136pujJxavgENRyqAna5zwmyowibvee8RVL
         eTwz8+aevDgK07gfRa4NZ8rGor38x+yeZlwOLuNg7dfFx5Nr4ioQkDFozsBlj7mOp0Zc
         ExFXeGRjoM1bDCQvEBbXIdQEfl6ke0g6in/WFyEPb5oI7on7sQFgRPit7SoVY/JeM88b
         IW7d+4sJl0/NKIJ2of32DhCWMQ+6HK/c47g0i/A6DY4T6oNiFK5dyVdHQigkUzpgPnXe
         8q03wWl4Ycg5MwO7Q8/Wc0Q2hRq8eB+seOZc+rs/OfyemjuiiOLwr8JDqEzzXbZLXLkm
         PZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt5kfWZsUH2nFEA4yUUIyUKQ0rlT1SyoicGCxo4wosNyRk2ufOKdeowgTF8mTxYIGUDJ0XUtCJ1AHn@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlgLnzNJT2QRGp6BRVzvRLZefzglIZ7WM3LElF7s1BkKV4yYt
	aYiAjyfnWzbKM0+L8aYZ2QhzVCCM58JfdsA1kwmAX9joqrX2CuQrC4hIW1bQQ6bNjobhhLPAT7r
	OS/aX6/vajiPr+7n0dvNqx3SyVpgEFNco43KbHuuOym0wnlaJteXGG+jW1EtunyvZ
X-Gm-Gg: ATEYQzxxrUrfD9vpl9jT9kjfAQjLEPlGU6iO/o8HmTdDmxBnfm6IfadCfLkBnntzMHn
	NpWv9uYCUsac3Xxt8PYX/YwaqRkbEtkuONY4ucPA58jPLhgIQOr3HDgu8sjGgJpebjCDOvDwGOW
	5fjfmMWTsKz9YIOA9HL3PtjtK/sirgstAx/ef7qw4R3AvLLes9tRPN7i0AbtCzlq0kttf/O+suZ
	QpeZxlP97Wu+uV4/r0cHeoRXMWJkJwzyZlYHuQ3c/W+eoWOmfHdqk8WVYQ/uZy4zQYg27tW0iOS
	fnKIgCDRyjt+SJcGRr4PjH4aKNDuTXynM7uwQgs2dlfnb8f3wO1qbyvYUbp45ya0GoxAeFtopj4
	lOObruejCtkbUxWeM9T+ACTXDnMTl0BSUIOhwjxCg7c9wX1uS
X-Received: by 2002:a05:6a21:32a6:b0:398:7d6e:4db9 with SMTP id adf61e73a8af0-39ef71d9517mr3581379637.9.1775047893147;
        Wed, 01 Apr 2026 05:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:398:7d6e:4db9 with SMTP id adf61e73a8af0-39ef71d9517mr3581342637.9.1775047892580;
        Wed, 01 Apr 2026 05:51:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cefa82b24sm2199735b3a.31.2026.04.01.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:51:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi Platform
Date: Wed,  1 Apr 2026 18:21:26 +0530
Message-ID: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c-DEpcrCt-8OrRehWAXgp3f3eGb801sx
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69cd14d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1_gLH79sc8AW4wFG6YQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExOSBTYWx0ZWRfX5PVeNC4kDJIO
 +Fmm/agf9GNP/JqUgi6DFswzXr+2nkfm8GhRDa3l4P9sTSNM3ySyeLnSnWwUaHWiz4gdqjIrdZ3
 Ko6W8o/OGAEuuydMo0uZTcMwIxT+WYUIyIkftB0LUW/w9cksg1ZbOVUVLp4+koLi2XW/Vq74CGM
 KKX0qZ4XCiUUHuNp5Ds3BiUMT0a8FCbqw/1Hb6j9GK9C2YYKEGJr08+Jk/3kSzcsrjEYK/Kfdbq
 nyqR5SpsyoybW1wr0BeKOrses9F0AkSyuUprHdmBVRXieB57GN7lOVpjXxl4nXYUHoqdNXjSswq
 AIJqDhyfBPGlxmm46EzuyxXxE9oV2PqKGPgQms+NKDxwVWbU+qJj3l/fIJE8+rzOeeuFyuRGjfB
 7FC447g5Sfb4TW+pnuv6YtfsUBcKr4iW8GymL9Ph8vuSj1+c23BHdLj4xQaHEdpQY/7SYO/UUol
 3i9cxwDNr36Pnlrp7Og==
X-Proofpoint-ORIG-GUID: c-DEpcrCt-8OrRehWAXgp3f3eGb801sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010119

Document the Inter-Processor Communication Controller on the Qualcomm
Hawi Platform, which will be used to route interrupts across various
subsystems found on the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 7c4d6170491d..7dbc3ac6c5c9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-ipcc
+          - qcom,hawi-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
-- 
2.53.0


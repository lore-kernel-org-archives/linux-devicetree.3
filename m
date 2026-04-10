Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71313E5ED2
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846586; cv=none; b=b6pq6YDRrc6iIANEqO6yDqJ8RPHdAoXSzFQCYq0CDuem8YXcQ/Dbq2lKnHNZtbLi1H901XaM/4RzBy1cMKyUhys9ssb1ph6yZwmU3/TA1tbUgnAubYlQWhAC01nbr5YxctlMuM8TtGYvsSZguWVJbY4Ulp3yOc+aCUUn+9ZOxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846586; c=relaxed/simple;
	bh=xkv0LZA0DeKxEDR7Xs5BHACka47JPOCDqUGZUWDcuzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W67Tw9w6fIgOTdOzxAoBMpzlmz8qb3rPMMW8BFfM9Uxi3naqWCybeO4sFiiH95eP7+Yu79URqittr1zeUBj3oC9lHd8ybisXiC+SPMLLbmOW1ypScUcLnSl4Yejrk/6zwPjeoT0qMNaBUudMeTfhdKpJMpJ54ExIBPEI/dViqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+PT8+2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/aLU4Tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+PT8+2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/aLU4Tr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1SAT1322653
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=byNP7MlHeAg
	DUInAEfAlHW6RWFsmEUK6lAUo8q0+9PE=; b=Q+PT8+2Vg/DNmkiUhZxnY5u2nZU
	JtEZ4VKxAaVhPN1WEEazVaLwk0IZ6h6P31JXDC3SO/f0U5q4+vbgqJ6jbl1TI0ph
	jvchY55TbcXaJxnLkzKSF7Q8yffcHom/k+5uIS6bOlyRpEfy+Hhe7JNkAVAvLZx7
	pvnj/R1QUdx6wt31WscpodjwtFnEipM+mSm1y7vTDjVhVOeAcG1tMjkXjtngWR2L
	eiw1TiXm9V1ggDWF3GKI0ZP0QWZp8yZVreAEqkVyESiLE1mZxgJ0eBVPcUdR1MNZ
	ti3ZqVK//oI6M1+sMiokZmVP9pt+SMFQZCnrSUC0ednbBQDIEKDFb44o+ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh9dfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c769b25315eso2828279a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846583; x=1776451383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byNP7MlHeAgDUInAEfAlHW6RWFsmEUK6lAUo8q0+9PE=;
        b=j/aLU4TrkGXGczVlSClfhHHfT+D6ORxFJibK5mXwUPq3xGs5T/QMr5kDSPqgpXZRXl
         ER5mBaaEFkT3nvQFZDOcihVnZoPnfOm58MIjS0FhZVMQKtO6ek//XZACntpyVCEUNOBg
         CsVMByZxqj9fOcZ+AwoL77VsOFuCRKMEupdJ3Z0OZTkSeoQwKdi/Kgp5oufIX4Nv9sbR
         p0dU02wtrdVIJeoHPvrNVGGR3lKzhn+yQV+x0fCMv+iGOy1O2SxHgUIo1DE5KfqaOyCm
         gD/wYhhZuTxj3TdIKlzd/pGOx6sWpS32RJDqrMJqa4opmE4rHfrCtoOJAXs/Ozq1EM9h
         SvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846583; x=1776451383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byNP7MlHeAgDUInAEfAlHW6RWFsmEUK6lAUo8q0+9PE=;
        b=OnprCaLv5TE3j03vhM2BCAmDgzOvqT/5Juj7/+FSWDqagMPz6a+G8MTm7z6r3LPA2H
         EJs6McEB+b+uTSHZboCAf69R9stKQ+Do8SUrdAFyQRvXJe1jZ0LKWekp3U3RhwWNS1KC
         bmaRLRayL0tXmwxa3hsEQCn3e1byWrQ/wlvu85vy1yQ7u0jWui/XxfEcwxr3I/Q6zwuG
         KH8DV3NhkQkWKFePAulK0CgNYt76s/U5ow6Ok/VhN09k0A0w+/jW9mUc5IXDbh26LGuD
         uHM78J5Yfw+TaoEewqkkjd/AuXesvd08M69DetMid7SK+P0BQsv9lWVXSkNQt7z6jNOE
         lmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV42Kb9KJbCp+DRsvEoN2ZejLufAELAl/AcpKnkXDoRfyxWnr0azOvoIl5YCSg0k5Z04Yyciz8sAhDW@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7cixLZ7mnc1skK9mcJlIIQd1cjQCCbqvMdzCld/r/5kA2bKa
	yNNMdASSZqtIB+UiRj5/DZPnW5Oh0hK54zqQHCveDDrSjfoHSLOAy9Rj1kCchlIsHhf+2DTWHB7
	9Dzp8jwg4TOFzZ+6BL9bmjoE8oYdIMp+yMf8spw+mCU7Df1vqXdabbPJKiwCJ8KH8
X-Gm-Gg: AeBDiesR071U1v+c/hneBpUme+jTt2tHnZvn/bFxUbkgWV8tKi0Tg0JbM04vUINzotg
	pXmqvVOYgM+4+d9o9TaB7QwF+RjmcNIxrXXFWjVVx8dmvQkpna2dXPydMHJKts+ig+ikkNmxbdg
	4WOTPZ6sa3RJjI3pV8NqXJKllCtWyL0Dq9XJIbDRsSY8TouRXIt+fYVkE1KqFwlswfsyUfDhTNn
	WVUQWpNTqvfKOHcfiX2fdf9fdrLLjTQskeZJt9VDqmD3idKc0ijjWop41oMiT2PZtledamwGFuS
	nn4wz7hlXmqCxBtdyG/pp4CxvsXkhHZedCOOaN/NF+ffOicqym7Tvlq9zZt3Qi2uI3iimNcuqgu
	N35cLfI3ZFT0VirU20Jvca9NxppXmGGJ0ziAZBgeXheSyDlHm
X-Received: by 2002:a05:6a00:2447:b0:82f:37:f590 with SMTP id d2e1a72fcca58-82f0c3459a8mr5224552b3a.42.1775846582959;
        Fri, 10 Apr 2026 11:43:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2447:b0:82f:37:f590 with SMTP id d2e1a72fcca58-82f0c3459a8mr5224526b3a.42.1775846582314;
        Fri, 10 Apr 2026 11:43:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 15/35] arm64: dts: qcom: sm8350: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:52 +0530
Message-ID: <20260410184124.1068210-16-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX3C4Ykzpp4wwU
 gfDtUfqMqrqFG/nzBiCVJ+7fPdEiOX3mgGtUY05a5LSR5YInj4JvC1X/4hBUj/QnLq2lrT9ibsg
 paz5yR/CML1GPGAlhW2vCZRy7iJ70gzZeZIXhqweT+DLZOHj6C/62GdxSMLxdJLvvQ5jQrTnqWy
 Z7sWEWmi7Hc122cIcmpcFwRnZlQ3RL9kdShMAKL6Z3MnPma7nXmkBiZD7bs2duIXrjbt/s4pmr4
 FNSuAGHEm4fKYVWdhNi5O9HWjmK3Frk4eFNWepifGQKLcP4DGoka6aPFEAiZm0R85VHp0nQD7Lm
 NsG9rVIVAIjTV54Q5qnPpmoOnao36WEyoe3dl6Y3jNfcc6ivq5EL4vLh4remy+08WKKth8q+/tI
 9H8oyGkL5iSzfPmM+RPFAydR353oM5ASDuzzN4asfJfnsIzWnwTsNZ2oT+FMhPkgyCnJToFdVnX
 CnqBAdjfpIG1NjLL5Sg==
X-Proofpoint-GUID: mkS5QcvpI1uIzdtmW-kFxwqAbYrjMgY6
X-Proofpoint-ORIG-GUID: mkS5QcvpI1uIzdtmW-kFxwqAbYrjMgY6
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d944b7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ml30YaW89uiewqHgnPoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..a183212b12c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3172,7 +3172,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
 					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
 					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82B43E009F
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875034; cv=none; b=maJUmsm0T1ESwegy72Q7Mp0avuTc/ekBHm8Pboo65QAWdQsKv60bJlwVsCtFHajIDmrffQwGxGbj6kNnCuFsSMAgAKBW16h75sMBuUWD+rKn4E1BT7AbnC2r3PTMYNwtuNocL8JWNEsRjefV/PxUtwxXSj6RZpnaPZPJUhiE66g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875034; c=relaxed/simple;
	bh=NaZtrlng8k5QQTwI11Hfr2WExcKBZiCHogIKHB5f264=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaKmmiH6TuUyXS9eiLq9YkZC47nEwRQstt34KdedA2L/NDoxMZrGKj1NP/3DBQ40y/GGcVKbsG7Skyqv77FL0Y7Euk6KFJ8kB/LLrFX8fUMO1lEIP2lPqKWPeEmhqM4zUOL5AXsd98pCo1esSRxFbdnhtnKC5HhaJ+I7XhV+2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O47sm6Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+dwfF2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O47sm6Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+dwfF2b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mQwh871133
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ybOfpiqWajv
	H3os9MDhLdbdl0lEm7GdvEUSE4MFqraA=; b=O47sm6Cm1+vjG7tab1LIpY5awgE
	BiA+x+nWS7WVhJiXunW3QhRLrFgO0uSVEPx856YRc8YNCx89XbereZxV8K2ZSqdy
	239J3H2OoCJGh/RO0jiGr71SpR1qkv2WZuYsNxml6BKiZs6QCRVeFNlB6xAseH4b
	G25oCtFRvQSgZYtwu2NIsQo9dV5lS9zlZ5NxuEc9IrqF4oVLxJ4qH4R5PRto05+i
	56wxEqjPE4eHqTTnfBQpmP/4groa+gr20un9xWlgVko9G40PVwCoLi+KXxLx0aCc
	q6Kly1wMREyqSLki7tBG89ZTWsCDv+c35HGR//QcSjgaor2ENvZXW0TWAHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eduru8mrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc977e6aedso124197945ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875031; x=1780479831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybOfpiqWajvH3os9MDhLdbdl0lEm7GdvEUSE4MFqraA=;
        b=Z+dwfF2bP5yVRBd9BEhLHH0f6LzdC/ozJXM+aF+aSKUW/adobI+H7JeJdDxIx+Jt3o
         1a3ujUF+r2RN5YMTfur3U9F9GNdC5uduZ+D9uEcoRTYPw4Uple1g7B7tZD6G1mHuigsk
         +2fVoo6N3rZvUEKYlWPe+CTtNuP18OLCYKEXVLIe3V6dhDJUK1WwsoxUM1PVNjRsSBox
         e0AwNPHAooyZ3HVM0jxNfqzr69yWVOmFuM4Rp9TASGrY0q4tNV1FqJzFF57WbipUHQNX
         HdTji5mXmVmIo1/rXmf+iNWKAD0E+t7naGykBlYRii0tDnc99jTf3CzZFtwy3bzgKCV7
         a+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875031; x=1780479831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybOfpiqWajvH3os9MDhLdbdl0lEm7GdvEUSE4MFqraA=;
        b=CkVmrCNLhMchQ053j3+JEC5F0uQe4dsn+eCRCb70ryM2rm0RX7QglF06mMIYkcC/dZ
         2+K39CGf1AY9aVTOKSCQLitRFtPMYwFLcsq2DvoTSi3HXBZd/cFpr4lsPDeMIFOtOSBq
         aN70+shgChKnCG2In/rbF8ztENiyuMfTSHx19FlUelAh+w+JP+CqUxIPgEYpwex9pFZp
         cUJJzs+npd/xoiHlzP7Km+1CjDyQ4oPlUM28Aj5BAB/wM4TkSPYhK6sPzsfkQ/GpzmJi
         DLOf3GrZjONQOZAgW/AL7GxmNJFQYbX2rvfJtEqaEcQTWwQ3R8ZAEh3QysjtwGJ9PlpC
         CpHA==
X-Forwarded-Encrypted: i=1; AFNElJ/xoFAZkFjFDUdTpv9aW2skSKOXNFBxCJXLBNqSOK6HFQmVEhdks/nV4/1oiMqunRkACZ++o9bchweY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOsviZLnI/GcaxHENorAeIZ9nTJ2QcxaWdm31hj1A01Y4Z0PqR
	o2ZLafKuiX4h/ThWq9TQ21Yj+hGnp7+Ym2rklUco0mF1PSM0QBL9XlBCAkq5NziK9Q+4MXh1LQ9
	Jgb+kOHJRsdiVZQ/wVOJqkDoiv/ahW0bZvpILxULkNSPsncGYn+bLY2a7ECR0K2Th
X-Gm-Gg: Acq92OFto+P9RHOqTcVdxv4OKSHfF7jwQUZzFxpupuQB4EeTTC7qj1SZeDNhh5I+/JU
	TznwBqenome/oRdKWgbBjVn9C3vyjm05h+wFwM+JEYm+8S+QMTxO01VOLqC+EOCRASlnKfMOv2/
	X0LLSZFTHrbqBReHV5BcRDIkoOJGLMdTDL9nn++Z8K3Vr8qPbYqBBqPRsIb42XkJobqp8WMvu4q
	tPk/LklcdMlgX7Sx78AzQexS5ofS5Uy3jdDk1dTHEmCnpYKCqpL7JF6vStXf2iYEsi86I4BqKru
	ziru9baRXagwHfN8bDFbyIkHeW2DeQgJsQbasdqq4WFFSvOLdPiLUSsk7qI8Itib1FAyYi9mNYr
	lH5vgJv6ujLP5/rJF/FDqfZqxWOzhZb3A9tS9Urf6sBBR6aRm
X-Received: by 2002:a17:903:2b0e:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2beb06319ffmr247566985ad.25.1779875030571;
        Wed, 27 May 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a17:903:2b0e:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2beb06319ffmr247566695ad.25.1779875029971;
        Wed, 27 May 2026 02:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 02/24] arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:07 +0530
Message-ID: <20260527094333.2311731-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VY3H+lp9 c=1 sm=1 tr=0 ts=6a16bcd7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iT1TFoq1hZWo4dtrjgkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: UKWIRFE3Y8MBucIoOHVikoJEAPkjtzxN
X-Proofpoint-GUID: UKWIRFE3Y8MBucIoOHVikoJEAPkjtzxN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX+p3zgrsnm4VV
 HGxLN8k2/msxZ8y2Ti/C9eZlSZR8n08ElF+dMyZ4965UAv/U4egtnwz83OKLHanKAaI9yu1JUpT
 EPxYfT3cAaY1r0hTRLUEMjFW1OXCT5IyxpPrqnqTUaVlQPFy/+cAv+8ZHhToQukt80aGrWjhJpH
 Bu5FbSfqV7pEGiyjIF4OzOcUtPiZunQnxYukVehFc8TDkxRkoeCpw5FBIhpxFlibFGeF1qI4HBV
 KAALcVlZvo2F89foyfRHNrYSOEVTZTicHDx+bhKgKmzBBrZbSoIMjcSZa9TTxpYLYymL1sbXGZ4
 ydYRsGWhGfFkUnUu9A1WdbBaueQqalPda70RYM0paf0sZJeuLn5DkNyFBJ5I3TeYB4c+thLrN8A
 pm21uqBh7soMkdQypuxATvX41jHi+IQPy9FyDOdHVADvKtiglB4gMr/OjbBFN2cDhoOVJ8zp4a/
 QB922OV8+tZgLaWQgtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sdm845 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..e9a31a5ff04f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5102,7 +5102,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc_intc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm845-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


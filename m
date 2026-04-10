Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7C23E51ED
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846569; cv=none; b=uJaoz/w1/y6f9ugYCMrONi09V4dNQyLMlBI5TW10vGHmf7jGUvny67ovIVId3xiS4GzgR3anbLr0CYxZTDwWOqWx3G2aqQW9eExQehBOdloH/WVmS+H9jYauUZmkb5bM07404oh/wMIErL+fZrHKivpnz29dghjOU06cWicL6kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846569; c=relaxed/simple;
	bh=JM+iAspZzS1P9NSkiE0IuayTYjc5337vba18eqBxpDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQPfi7Ynv4/BLmxc6KyQlrbQ1LAUE7rma8bQvlMHCstYxZGjMNtjhpOVM8co4gMYCOPCDC1egOKSSyA4kECAbuCRFdB7KibRu9lmmT7T5yGIShYxTrwudB4yiwZ3V0S2ZUOm1snP2Nk9AAAYFnAywbTzKFtfC3zBL8xIhTMdLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoCUvJW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAYV/Mns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoCUvJW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAYV/Mns"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AILEec439252
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3029K6ZUJsw
	xLAFWZhQegntyU5RPU1LZo6umua+P11U=; b=RoCUvJW5GPWkhFvhQMCc0LAJmst
	ggWdNe40EXpSY5hJvVwugcN7Ivpw5pGX2pGIKW2YyAAwxToms0b66RlPEl5ZaSqS
	8Xq70bSAQyNwusjsgB45udMa5LBZJCpcy0Byf80n20qGvXxyo4nnXF/t5lVPsnSR
	ungmvIA4A3JQ9zjG1zCGnDgQ59mNfkgEcTaB6dPCgiijzRLd/DZp5YG0+jsYZo7M
	N87q+KoDBOhF907/AglUhbnmJkh7mk+vwDIBanzkoYP8j0K+hVpk7SnT0U7/IEkm
	xZkSpglFny7W39h+ayTY7Zmhibiyqczkr31rEQgYNRKHQ8sXxi7Kv4tOG8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9sed9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a6906e35fso1918745b3a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846567; x=1776451367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3029K6ZUJswxLAFWZhQegntyU5RPU1LZo6umua+P11U=;
        b=WAYV/Mnsd1RNaQU1utP6dX3dlliHoH8Q3+ikS/c84WuhCcbX61p+PGMCNmpZZ1pkui
         rV8P8sUb4FBiIf+0d81LtAZLOjwQwi2Zu0vdWx6Nzz7femAZyDWRYBleuiyfEA7zAf9V
         rJmm+tUzqEWjSxCc18zwdFRWez8enIKt/i1DD3t2jcWum7Vh1CIZ7LMiVZVF2Ltn14cO
         Gb65vSl0w0fp/qtDy9yMLPp5IhmepZ/F92aMQc6ZjkQwoLRSoU3aTs0nFcZdNmGyNdkN
         oyDeKYPZrHm0+9SPky8VhUTi5PGFg8LIGjLwColjGSEtr2I/l6i5cgGTIpEJuHzn6FYm
         6MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846567; x=1776451367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3029K6ZUJswxLAFWZhQegntyU5RPU1LZo6umua+P11U=;
        b=B0eVaAI/idrgtj+XsRZa5qsfDCA8DG9/BTY27RJAsrCwE+rl117eRq+2XVYRGORK3t
         g8C+JwFSzbicGi4BNYddTRmRZbwCYWBgAukVMXVA77riHgw9nxrB47nfCx/UbqTxpSDW
         SoLxE2ZQv+RnBKI6KTjEkwNXqOhXniF0a9UY13T71iTQmkrzDcUUjPTuP0ZLB+UKwKze
         Jhuy7dYsUDdB07d3xcnhW7RRsUC0FB0onfke4PyTbtdby0tVHdBrQJ37+ugzHgl8GxwP
         eHwSpcd3niBApRSphgHE14DH5K99Z1aW63su2UJD9L2/vGk8rEKhxHD4lKzM5uJT0+b5
         8vhg==
X-Forwarded-Encrypted: i=1; AJvYcCUsRqjPLuAtYM7+v1Dq+g8iF6jKmTXkPf+fefnMX3AD6r5yCw/dqXP9qUt6jlKKfxtBN61xsBVyK3BR@vger.kernel.org
X-Gm-Message-State: AOJu0YxhrJHbQd7vAiPD6RxklyPGmSBaQI/WEgNM6G2OtVptFvW2ofyY
	reqQAsvf/xnN7y0gDqeuDKV8+zMAoCUtC4FgFKTufSQstK/jKoPNFw/kLbqQsOy0z7U1BayUUsF
	0Sj2ioOa5jVNJPttvRpkdbeL0csxl/zsuf980FgY+LxNMlgXCMAdFCQ+n+kTZKjtZ
X-Gm-Gg: AeBDies0NzwARmqBKGbnXCOS1sVFOB33UlHjmCeZ/LNmPO4+KDXdCt+1ghEcm6gl3k8
	YLOvdGFKZflGyAm7qpiRmfmedAHm2WcmjUWFh1qe5ONjhuZFcE5clijwiAOdJtKCUwenFtmt19l
	id8XPhTCLEZv1PzShjOqQ/DyjAkzVhJJFLw1R+6PWXyPwLU7gwLBq1QNVWdZ7QJjMMXdsL4cGfP
	LJxgYZGhr+wBQlg0oC/XTOvLAh9VxHhamwqv6/txc/xIqs9jzW0iMTnC6nptf+q+48Dq724LjzI
	OfC8qWDzvF4OemxzS5MrSC/XXXfyv/d7AcFnSVqJuD1xQkraNYBmN4y2i10Cy0XdM3J5C91r0B5
	/z8kY6ZBlQK99HFMRTnxeJMj44LAkY5RKLStSTjM8ITEMdSpY
X-Received: by 2002:a05:6a00:4c08:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-82dd8a88f10mr7750924b3a.13.1775846567229;
        Fri, 10 Apr 2026 11:42:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c08:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-82dd8a88f10mr7750898b3a.13.1775846566690;
        Fri, 10 Apr 2026 11:42:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 11/35] arm64: dts: qcom: sc8180x: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:48 +0530
Message-ID: <20260410184124.1068210-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX0GbREGkYWgOX
 yRAEgpHPlLg6wHM03FQBrMP9CTvw7wXmk0LjpteGJ44eoRf3QBhhRBFWfwJyJ+YSm7yc/cBcy5J
 3yAz+OLgji7FK0qxop5bREWEtfl/1iIN+uCaGWgkXpMzTHEU50xoChfU4N+S1oSbmhFXC2vblda
 Qwq+in6y0901SdFgMeCzwsgVogXHt3yW9JO5GOwDh5FuB0dSSDQ/hNoontYg+2bPKuVjviNvIVU
 4WwtT8MgHh+jI907eEpsu4Zh+3t9izQiYE9VGbZP/NU49vV8a9FLVkfywgeZuUDO+DZko25b9xw
 AzZ276b9Hb9ngin3qbwWLPUONOj9GzenCs0ONYxEx25+HAnx2vN0igAU3XUHqaRpNq9TKolRvo1
 ht3w4Qecf2rIVCYvD5hjR8NYy+j91qGexv5jnF+vKJRV3tUO6xYyNEMMj7bflOZDs2JRUWgox6s
 2BTWCkoyK+hzNoySV+Q==
X-Proofpoint-GUID: GTadZsl45aBcWJu2GgfaphKDuNccWMC4
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d944a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: GTadZsl45aBcWJu2GgfaphKDuNccWMC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8319d892c6e4..319b93c66107 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3554,7 +3554,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8180x-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


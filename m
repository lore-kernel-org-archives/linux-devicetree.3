Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942D83EDE71
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875072; cv=none; b=cHXn3eVcmpkDLa91OA0incjkS1sIVCfhh+cmbz4d28MC8VKThdRyjxSOzKHPDPKU4OR4GjQl/iVSHaj1B0CFpbuuHxwmDcEKzFb4qzgyiG4PCSJxaA8aw+E9xbdbR7RGpHlYZplspQAJj5zdaZM8RFVIJ/awrUfY9kvL8Jld44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875072; c=relaxed/simple;
	bh=ziuI+6zAz6kb8Z/tBoWKEY++m8psxFjDv1dhkKmoUw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Phes68peywDuA4jeFLnSGOkxsrruZ9kf7fRU2nLzbhxus70vKKWQ71F/39qHNMVE/1jQPbZbWCAxlfgfoFT+CtukyiOXFwfnNJBOFCXN2Xn6KPHcHIYh86gvXsYNlPbLivHp2axaOlOSyndF9S6zAUcMQtUHSczakDeWOOMHZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwImZobC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIXQnKKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwImZobC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIXQnKKW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mYB81350603
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rTbyMw4P3z/
	TCsHI/LBdeGe5xHH9ZiqP3nDpkTkTCs8=; b=PwImZobCuCeDhZMAWWGFGtIGyMt
	4v89Kp3fGada2y5h8qJ1q2QbNKNPOTPLj6z9sb50V6wuIxUMQpHQyMIvXCum6HqU
	KxjPel7U1y+HKwxM4uzj3AZIGv1wuTwFEb37uta+GjuGFCQHVKN8WEWa0NQIx6vw
	WCEEPPlJsloMjQLUMZBO0m1f3qArgTDd3BqL6tci5nSDdid0UImtH3cqtmg/oI6+
	o6kSQCr1yToHcAMcBxHROPo9rf7h4SpyQqHYd9AVcGsum2xLrxCAQacgAmQXg8Jh
	Pl+MkS7J1za+nAlrWYX8afpnZP8HHVbxAPOT7ucOupUmL4x+a48kYBzygHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso61068725ad.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875067; x=1780479867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTbyMw4P3z/TCsHI/LBdeGe5xHH9ZiqP3nDpkTkTCs8=;
        b=jIXQnKKWmGUOQnPieG1JOMncQGk6WyoiaerzdvqAlfqfCEaGJgiXJCdOGZYl9UMPOl
         b4tL/MDz7NoP/ZSwTSkzIrXFVlKtoUOb6WL6jwoZ7FtH6ea5UqGNPkCiTNbVstHKqPV2
         bYscsscvJSBTGmP+tHdD1BmBeFcb6P2kEBiKoLse9le6y5iheNz1nRigZd5gZYhiEVdZ
         NqF7xdm5DMw5K3lVqmtK5c73niSDi1gFFHC2C5ciErn3X7t5UE/VBX7EuVXSBJzd0eVD
         pyLMTt4zZUF6puWYRKB0Zwg9z3100NIAdbtDa945XAKcVzsDvvjzGjGSnygTieylkvDn
         411w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875067; x=1780479867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTbyMw4P3z/TCsHI/LBdeGe5xHH9ZiqP3nDpkTkTCs8=;
        b=P0DBJbhhxIJxpnT8IcxY0edCpy4TwRIdCtUAnLfvRmlPrWAGaPGW8t3thaI6EdrfqD
         uTK1I63nBlVa+3VknknHg8msVmeT7x/EWsUmQpuw/e3Ne1p5700A8u37Gnsistd2mB8U
         xW8Fun1kBaZIh+/cCeSbrsjQaEkmvS1mO8D5K248+s5LsKz5HQnOr0yxZqQfhy/VBLNY
         LuIiU6E9ofOzKoHUmY3fR2asXP+F7Mtv8ApOhzYs4k0y9KntLYOhcxVvwVV/zN0TBA4V
         Y2hH6CfRG6G2nG9vOtVZyS4EIYSu0GQpKrtYy5c2VqGIHcNnBG1ZnQDWg5xrs8YYIn1z
         /Qbg==
X-Forwarded-Encrypted: i=1; AFNElJ+GjwpAeGB11qnszIN9GQsor2yquKN7wpu81CuiAkGgJ8ZfYUHxkZGQj8wneGaV46bq16ItykAAk2xc@vger.kernel.org
X-Gm-Message-State: AOJu0YzvFJ9N5cP/eoMZ8JjXZyzZs6kRSlxI3EWvjF2ugzH0+GUTjpoH
	KjLOpd2H1JD8RvECzB6TIob73UPVqIGc6qC7kzHCL0E4pK2szXrVtIu7i4vSevqYY0atV8x9OvB
	W/VrMdqZujLw/sXizz+RcVl5yVyBL8+HXUFSbhz0/q1OeKdPJ48JlXpRz13EgsojA
X-Gm-Gg: Acq92OFCc9ts/ZZcfpxr8Yfpdfmcg8c4MmeBN/TrazCWRDqevBwlC+tZxtS8me9ENcy
	9YuZz6K60u2DwwZf2IUSiBS2VcFLIo0X8/GaWISaV8NoImOSUyCO5hx8Cy6tFExVJQnsW/ntlca
	fX4hrhP9O/Wahjk7AlnBkpXRXlYNOSC3RiBIS8jd9JaLNu16xzQkchAXmMt9YccKjESikQDUExv
	yRB8tvYRT4JJU+k+UYrynxPOfByQVBuuizA2vwk9eBDOjZauEM0oOhQR95aa0zN2EmQNoMX6bXc
	Ax4FOwpDj99w1LnwRNGAai/eNnivDMrqrY18NMvU5DZm4Dptjubk+V89SgVBwHmL0Q1Hev5J+yO
	moV/C0PU2VfnjCAFLzW/PNP1Cj5mILGinyP8XSbPMFMcLy0Vw0HQqNhAppMo=
X-Received: by 2002:a17:903:4b48:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2beb05dcb5emr261617325ad.15.1779875066659;
        Wed, 27 May 2026 02:44:26 -0700 (PDT)
X-Received: by 2002:a17:903:4b48:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2beb05dcb5emr261616955ad.15.1779875066181;
        Wed, 27 May 2026 02:44:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 11/24] arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:16 +0530
Message-ID: <20260527094333.2311731-12-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bcfb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aMdznzVkWBi7sdx7J6cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: GxjEsT096ELgG2xn65YZPRaERI_ScsVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX1PsTKbpxHc7D
 SRshHPCEKgN5DhXZ+0VrSXo8FN7nlpFUMdmcJRPAn77tUfnhFZGy7ug0ZR+E1IbdVYUTU8Y0xD2
 4DCHTrFDclNP8//EpaNalvXpgNOYTdvn4g/Hju+sIxI5sCphiNkSrlB+NBetAIHiCEmUEO4OC/Y
 9/SYNppkAze6r3VobV7mx3GCuQo6Zml9X5N9IEOtNDR9e4rQUZHlM8vYq/13bmByxjyH9Vc/G2o
 1CwZzXjaczNPlxwM6BSs7JiOLXJsPAqmxYUhY/hzUz/sOpDQ0tb4T0g110+Vxc/QI9oqHZ/nfYu
 IXtBZETdI2wJW66LqpYLhCT9VWXxaBRpnYZJTsPBCTjaYSLA/caheuhe5aCW7k3hZmTIfR21hi8
 cfNX7Wqa3m1xl3QF8ICGX5u1xZ3ax/vfarAVeBf9ScrsVCxjWXRHxPAexlIGdZDL6K1QnIVaqgD
 WIKccnTj8AqYtn2yuWA==
X-Proofpoint-GUID: GxjEsT096ELgG2xn65YZPRaERI_ScsVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm8450 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e0c37ce3042a..04b15ee62681 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3728,7 +3728,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0


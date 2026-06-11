Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9336B05C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153974; cv=none; b=qNffQrL7SmmVVZYLJf8LBOI6KfCNCMEii3+sKgXL713FcmruRggpXhnMnfuchBbYPK98V8V7vHa1Zo5VxsWnAtd8fX2l5eOaWg5GRK0C7yL0EFHK0xBS+B18JFTwFPQOkAfR4AYy161sPP27dQgq4HZFX3LamcXLwGqzXFhMX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153974; c=relaxed/simple;
	bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nfg5H6hKe7LgxekBlMtevrdRH3TXvjThCGNxd80nHSX8Rwar9kstge157RQFnYDWUDYSl+OHHHu2L2IskWwOtOFQp1c63h2+ZwUH0kznshm8FyfCVnULwDnfnA/qVlPOd/nFQ1OHD9sePnVPerJd+wnpjw/zJ36np/ufK2ND1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRG/i9Ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB+juEo+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRG/i9Ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB+juEo+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXYU3159569
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=; b=JRG/i9Ss0cdiY2bG
	0d6pPaEFwP8aVRJd1kokBWl21bJR4NlChp4ZX60g6yPRDoVuNPrJtNgvRGC2iWjY
	4on8EjdFCxXdg9kcEvMCrD80jai5fjroOCfeJu+fHu+KtRuOfHhR7shuEdcDAkx4
	RGfYLm7eK5bhYmYOHROs87CZV5K7H7h3mJIhFTb3QWSjFfvLmB2pmfIFNFQzaP9E
	c27NcsGXFJ2xeY0kER6kqqshNcqOxdJY24lwdq+kf0OT0XJLHfbbtoojMyjxbwng
	muguK1BnTmMUBHholUU+vg62L7aouh1hy2Ub1TXcWoTQpdT2FwJLxdZpWQUeGEt1
	BrXHJA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2d65d9773so8989785ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153962; x=1781758762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=aB+juEo+3twLYkR7HY5p7ykFqI4XqSZoEMAU4ziLlhv6vRSL0g0vgcm/+Rjz9SgMf+
         xTe1aULKb0f/GlBOd31hhUnubS/kihiDNq/fTLqwRR2tmBSIlhsMnnx59zlMyv+KOLow
         Rg9qE5h5+qH6AgWrN4PgxF2Yuq2qlSn0dhHZ4SOklAYGl5L911ymvzemEmj0m1rzAmqA
         2O9G4/Wfdpv1bRYAaqJHnhDdc2XiJWX313XtFSrw4j0KP9V5JV/nl2A+LnbZzUlWXFfC
         Hqx2u19Ly0XcaXlSN7V57yhLlJRcojsP9LBi57qp0iBjNl6mZdC7dDisjoibWESzqvNA
         NPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153962; x=1781758762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=o6CMlfiLu6edxBuOhr7+S/sR0RRPb8KvXjtFIhRaYSQ1KFwwr+DqwZNC6lDYWskJPz
         aLnEn26UKh9WooYzO7AnylimjCnpo6SzKJodo2ENdNeHyJlaFYcLvi8q8zCE6nuuRXUX
         hhQN4UD1mBLqPRHImVQjM0BYp+6AB7WESoBFQaNjw3zgrUSfaGqzZ2KQooGeZo3BMGGM
         9eGuAiVE3NjWy/BFoxn2d8GR4GVoTiS6/W+UTAxgf1CTRZLhK+NcVy/DWHhmnEiUvEPL
         qkho+WOac20RATSK+2Of+HPY+R1JR0GUNCB7WomhqQVNK5BqaajOLYeZTyO+IFrBuWh7
         DvNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MnIoQGu9BvSCM8uZK6OR2KCBx250zLPBYLeL0sb7crO5xuuICaRZJS0KRWuiZwg+CJK87tB611MMV@vger.kernel.org
X-Gm-Message-State: AOJu0YxytiPNxyKa1/18QjgjBcFiY9cdmF4rpoZcjf1m5x874r/ca8r7
	Tny8bW+RSUDAJZixtXPJIzjRnHRi/N+MADfGqXGyW7Rgm0hIEaKms3Q0OVU8jzr+CHQKvayb5mQ
	00hu7UjQrsOFSubJLjDpYLhjQqnfPNjuXa8/4BTzW36gCaqcfx5RdlbjPoNjJbnEO
X-Gm-Gg: Acq92OGHEzf3GkCXe6nCxX/s8kLclohfyDVZDz2SGRvmwohH9CH8fduhgvx+h4i5ctx
	f9NXFCf4Rc3/5HHYW4eMslose7mF1rewTDHRBzXs4uRyf0EYRUef4xMPX6AaNPsYLlhYCAYzazV
	iWmpDS/QJJwdS6CY+oFz38ui6pBpOJLUBnzIfcyTQIkFLWM+2VakWD2Vv4S+7ChwzmuSAoSJgAq
	cgdv8UYNZujoCWInqmnJeB1DOuzET3MW/0N0qwAUyZITUWfJ/1W0QRVlBn828D6jTDrjcfXweB1
	CERBcnisoJuZs20Zm+budOuyyGqwqoB735miZYs0u5DPMRP1lHMwPoYWlAi6nqnYGzU9Vl3RAF4
	eSBww3nTJdWe7lpKvanN/+nNHq1ZXfxx7owdf9kug8HtPY2O4mYogMMIvHGOyjxzxySU=
X-Received: by 2002:a17:903:2f04:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2f024e464mr14431665ad.9.1781153962095;
        Wed, 10 Jun 2026 21:59:22 -0700 (PDT)
X-Received: by 2002:a17:903:2f04:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2f024e464mr14431405ad.9.1781153961709;
        Wed, 10 Jun 2026 21:59:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:43 +0530
Subject: [PATCH v2 07/37] arm64: dts: qcom: sm8350: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-7-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
 b=daBMvekOqyq0+bomyJ8cqwhEwCMJyrzpy7rI6eIrkR4hT8fgOVOBUogyNzUhYHVBGrNkM7CfX
 mChdYrPebv1CbUlUa43WUCGBorADCNqr5wmITHK/K1OfM5TW2DtL6RY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxcgzGD+OI5gf
 6dCcuc0dSDnNIzPwgeCZWiue4hCyHHOEHGi3mr0F7q1pCp7c925/zt2xBpuKKWEyge/9F7zPgQ2
 qZ9CyTTPvqhyO2O8XJgpxfdLGDhd0cQguRpEi3Wxy0F94K9JIFkhjjYYo59PsDxBNGsWKnkCZIs
 Ev3KT2oLFwN5XrveY9MHz8t4ak6/PMGpS+Bs2aZEj3FJcZadK8SSR9smAIwq+c2uoq22wmU33M7
 rJUioI7WDraaGIyWQI5WJNqig3uYJHjPg6Ns0Qe/su9yBW9zIPII74XAqcErVKspaVnIoDAVAPl
 pJLROKsaaD8Bfz7bW4kRl/lE2ghE7SJ27vsQNKE84NBWt4F3zyrFELjOBEMtE/QN2Kq8TM2FI3n
 esmBAmX7lpGZvddLnuHK3OKJT0j/lPhAS68b45Z9l7nLw+m0SXc2eCZOl2EbVCJ2x11XK9tLd2Y
 mnF5VT4KK+Y0fvzS/zQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXypoZhWFea0jD
 DQ+Oemxs0f/jUdymslgtFsaU8bmfQjtbCuDMiwNJKgrLnRQfEaotZPtK320Jtj/4LhlC+UW51oE
 BIodODno6AE4dn4xhg7C7V7YPPfyaHE=
X-Proofpoint-GUID: 5RwD2LBdwX2daaUslks2nUHZGQs4ktIy
X-Proofpoint-ORIG-GUID: 5RwD2LBdwX2daaUslks2nUHZGQs4ktIy
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a40aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..0897ed1bbc6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -494,7 +494,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -508,7 +508,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


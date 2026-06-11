Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0139374E59
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153993; cv=none; b=AwV9G0ICz74o8MqnelaT1NBoVlWX0F91ddmir2FXNilPYKHr0XNSigqBieNxoZ8gWfsV+t8cvtBkNB40nV1+MvDZjQOa7LwTwvXn+dIssBSDsvqFN2NjKWMkdgS+n1iM5/wSRdHQ3Bok2Eq6pEtl+RTNPABZAOhFgRtqPi7fxRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153993; c=relaxed/simple;
	bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvBgbBC0ZXufYv0mJlAu1hQSpF6lDItC8B9Jhi01Sh5pYoBFliXw5hXBrnu638lkgngXy0fzHLNzHL0XG76vHdRhTSoJTpV80YQbjyakjXOpckIDTsAINKZMSgNc69izbogyU02G+9PHrb6Z9Ew178jB20Zuu28YEqw57kYXlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETHnIXyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PW7NHGDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETHnIXyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PW7NHGDe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nbik3212588
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=; b=ETHnIXyQmMj0z3lx
	02bjJdnAmmcUz4t989QHSJuJi0Pq+dRcEZA78WdOXnJtTugn3ysNAwyl8jQ/ofU9
	XBFNrD+/bO37P6eFFgU5e+PVXi8eB0OxsrUGLJmIVzNQaOIf4C6/tVwWPkKMRFMb
	ow6PKinvX/LUqZ2IJRrABKoptkPgllCPC0hZzzf5JJIX++CUPdaEmY9+4UNoDP1T
	VRwdlCot74aLem4EaLbc9oM6K70s4vi2RaNQ9t8dULlwaA1N50Yq2RnuCtkD0mMU
	Pc6zUTuSf3f1oN8KBl+wJUG7O1+++DNXzFw9+cnWvAc+N9fhB4WX1TtGu3g+Hub4
	PmVDaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701nag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf0b7425bbso143057145ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153978; x=1781758778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=PW7NHGDea7g3CnFpeDc1lnWPOlwZTXflTC5DKNikmQQ67PvVKpPK3dOcgFL3QvXdaA
         2jEtMzQrWGICiO18rF/2VjyN9aJO/o9Ptrm6zY7Mg65HUHIRkgy88Kh5EvvSqPhkeYGj
         sIThs33R1Vg1J31oF7tSCVAj1M07cGiyOrgzQVwaPS44iMlZlgD8xlFwuSxOAOCDw9P9
         y+b4HjCpStI5kYu4gNAO3VDVn2tvPU77I4OST97Z7iV6amS0zta+nj67SaA8rJdRhRbw
         E59s7FhYe7Quc4VZkqeH4vtILMx8YjBzN6XH5ezS6k5yZ/0m6DUzehuC52P6/OHy+Ims
         fqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153978; x=1781758778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=eR9hHrZn2OyMqP2Go3p1PNoe75mqDXCwTkJia1CjnSa3tCjb/6uAzfWYwM4vT102Vu
         whsSUVdD5L4Aoq2n+QJbMpt55XDjc5EOzphefc6BsT/4WIsX6InDoVdM6CADb8eF4h9r
         3xLU9uVLqzB/Z3LYZnh2cxFCxxCUmQ47ty9xc+LV0bpFOFo3QmTJ3YBmT4fJtHzgmVNn
         db/5sHA5mcubIWyZo82Qkh2vViwUMffkZlxsC7go3ryYhgD+2uEz/lEA9Ie6/0P0kPYq
         ZPsWn7IhosBk12DMC+Te9KOtyc13BptlvDnCk8n53GFPIuxXz2brYRCheHqT2QXL8MbV
         6HVg==
X-Forwarded-Encrypted: i=1; AFNElJ9GLt+/X8J9ad7w2t+BSy21b6f73bd9pAFFJELQ6NFOuLPbHUxOqR3RqrHDBkSBGizsI8ffxRq9YuQb@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgukAdBalhv+Fsyi2oD4OAyom2do8opFhAbb49GRSK2Ga0tnp
	R9AFhk1Zs1EEuyJ/f9exdVe65SFK35H/UpnM9qSCcjiEChAZmryWg8UV9WqQV9LNKOuYiW9mDP8
	FodLW5zACLjOrmQi1CD004p5WrXMc2+LWOyqjjAoAsuteDwcgYYZLtgLIXusR4zDj
X-Gm-Gg: Acq92OGlP8INshuNMtn22xPvmfiRJi/91wWMJfYlf8KoDdSS8n6vzpqFIpqbB0yo4J0
	zWts+aXJjNytH3DwFzczrZeyZtAyy2qUuITp+Ic3U1tdt0f/gar9y+RsMsIeSK7RlJQ9czCI/3k
	R/ilsBQ2RqiGs7h+iLinMhT/tpLX8LPtZwgYm49ZLGxw+nuiZs5uTNQ7dxj1430sws30fyyQzMK
	vi7K3Ll8q/xrMJ/XHEmlHzNNw5jRImO8hQb670d4fHIBIxnHsEzIhmT4GUrpmltU5gfjPknFnS8
	gNZx7Z5TJhmXFXh3mmkdJy8UXW8C/Vay+qOwnfNqI+dyjrDScAbTbQviERcWyCK635758BXVS5l
	Ax5Z1DioUhiJpfgfzvppR7RcTAl3qIGOSeQzvbP/boGd8b83rnRrkOjlO0QYCuKOmtsg=
X-Received: by 2002:a17:902:fc8e:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c2f297d57amr13980045ad.15.1781153978322;
        Wed, 10 Jun 2026 21:59:38 -0700 (PDT)
X-Received: by 2002:a17:902:fc8e:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c2f297d57amr13979835ad.15.1781153977896;
        Wed, 10 Jun 2026 21:59:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:47 +0530
Subject: [PATCH v2 11/37] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-11-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
 b=WWOhIuxKJLuog1Pmn1ccnG1/brJmdzs+6DeRrViN5X+2fVfCnHzhP9BYAQtzDyErJCkNO35fj
 UzUc+TNh4k7AGyI3rskES3V7JStvn37k0btx66mT3BmsgPFY4uoyOEC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: VDzaDv5hO15fo86tS14_sKUvcBOCtk5M
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a40bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4GEslL0L0mxG
 R/+g+sdYNPO1dzFVV3255FukCyNs9qxMN+t/t8m/BoCCODvQun1J5dQoDn42u7KKH7TiAB3cz5h
 MhmT0tSbXMIASJhZKnDFacYAF4SCTneghvCeVKgH6GriNrXEMCCCMNnbxr/57oZxyDP66kXbNz7
 3hbp2eFacXLv96tLFs6tNPy22KsJMka6dL1pR7iejrxpeBXx9p/Rg7fNUQPUZr+ZzBsu2d+FpzL
 mh7nYzU7gL2x5QfRYq7j1FbciVUwBEGpcPVdV/SCac4z9Umw4dU3MZmltwORk6VpUOOIKtSIPMH
 D6tADDRd9sprYitTsGuqpu0VZrIs+JSC/LSylouGN9oArySxCK5Jk0kODdACY9YPjajZvMxwWkw
 o7EVhFPvhhoj3X18rpM72uDeAWCYTByEgibeclg/+Uhzv8zZ7E56ZZ8DYnIB8QYbhxQmGQU4Pxi
 Gho6T1k7BEmbhjd41XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX44dhdpISs0sI
 +BA9AcFtctE9V/NFbjk5sdht2cOGVf8Sfh+/qbGH+zknDQ3jEXpSPA/vi49EpezLsZMA9GpPpjn
 4dhG9qrH6BMYu5T+z4rcMW5Gu6Yirjs=
X-Proofpoint-ORIG-GUID: VDzaDv5hO15fo86tS14_sKUvcBOCtk5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..2c2753683c69 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


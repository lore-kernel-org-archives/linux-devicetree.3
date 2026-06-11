Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A435AC10
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153997; cv=none; b=koTSyXUiuSwr1gPZCACL3mdUa9T1q8nhQhb93EUjN3ytb9tFSoXfgYxQSnIQPjFruPaoTfOYhcoj/lYH0zyozAcl4TzTBIc8BNkXfbj42WDK+KKBV3ba5JXJ7CgQezfvXjYt8lWCgmwiTDyX5lGonuLh+oGDZOBT0FDvwRCwcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153997; c=relaxed/simple;
	bh=YirJWrRqQcQlSKweDeLmHrzIa7EXeT47ncvGBD26WCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a03cXLHo8pbM2KDsI4U8BxTnrY2IRq9cSWyBaJPIZMwrtfFOCmw+TOFBdlAtsxgWgO5CN9uvzWKuI9BRgkUMse4Bx0/D1zZL2AfnY9t8FWVHA3v3jxPBxvvlc7LIZHiOGV5Jy0FGRuK96siUON7XXB0NcINd10/mNsZRILRcQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csSFA+Px; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3zShKlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csSFA+Px";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3zShKlN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0PVNE3085771
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=; b=csSFA+PxnUu4XI7l
	16pSor2vIK9glcDe91PdA5zO4Y6dGH74frRHDLEtlM5lwpIJ+tsFa3LwsNFq+zoe
	yU4FRb0iWitCyJRbchpg3lWa7h1CGMQOdGaqSvm3Mu4iC1z4vKQeslpsCHUDwffr
	UO8u4UeuTTvuzAcMTU2ahIZ8R/kHsXZGJeVNG52JGiif0BR4T7CQpl+FNGvMzLwB
	rqUApIrj+Pbzfgbebr5p+01cUChzLUra3lj3Y2ZlVfR598tzWhAuK3gFhqiEmWDl
	voE50N9CMO/tJFaQmc6ffVYoSwKF3kroVXl3/fpPakTYdByvPgSBPvzFHiJT5X7S
	RF+2AQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2beff6b6e74so76140895ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153982; x=1781758782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=;
        b=d3zShKlNJyL5wzbD0LSxpyDDCyr4CD8IF2MWCx3X5lj+FPrjWoJfTX6p1uf2cmGtTo
         XcrcRu82s/JxjvPB5ANgMw5BNGCQ6+BciXlTseoWAXdqZy4XfS74T3wqOTnuW9gKXRzI
         9tlv6kHT+Sgkb809uCrCVWPUlVuCObtWHcuQIBJ0AxNuICqwC1yCBT2Pitd9zMmKZkl8
         7TEV/oh1/HoR9ybIBzHB//U16SLAu9Ptbq0ZIQmmMMTjqQYrB7w/sJlwHVZpj8KyFuG4
         dOqUcU92ZocBYmDBlSipFapSRZ3lu0BlaiEna8b9WndSy2g9LyQLwUf7OAw8yaPgsM8U
         /AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153982; x=1781758782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=;
        b=Tq6UACUEvJo4B18aBQbJW6L/wVXAGPfCe5WtHCcCnCkMRYDuRt77XmG5NlPS9EDgJo
         zfAvGXz/15TT/II2DUH066YlZaTqR3tVYhzeV0elX/8kPZrmTOPk8Yu4sKYIqula+sq8
         UMX3wALWVekhcCBNLqd8pjPK1b2qdXhiJiVhD1Jwg8mkc/2VXdO1JwMAJ252vYsJGBJz
         HjtF/V7tLLOYPWkywXuS2tJnr4Bc1rtbLPpk4a8dqADVGYekFaR7hk9ihZAz/rpqkYlF
         thI/cjRkVkmr6KnO7M/9UMmpH8gLG8Jx3KmhOiDh6KTEra+binrQ7MTi609D+2yTGhbh
         8Rdg==
X-Forwarded-Encrypted: i=1; AFNElJ9KPLaObPx8Agqv5C8ckr/cZU9puJ4Px4E4hQecPpt6P8MQOxK/6EvwN4irbBk/QP0YszpawD8lunne@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0bV4iQXoMsbmgJ28akK/MYDsu6rCDR5becHwrgO7e8GahB7c
	Wec/SSGN6j5aP+oYExFLqmFJhxYUb7H/9p2I2Zq/92zgWPRBsTyXHvqxdfMf/5nCYXU3pODbQNP
	D8aspONjtZS1MD+uBE7HIx4+th7PvnHKdPzaqjJ5LQGMW+1m4onCBhYTKfak11U6/
X-Gm-Gg: Acq92OHKFurB9bzvPdN86ZTEwtUcm40YB5+xQAfIbMBS/L6bNrONOS0+mWZCU827YdL
	J1WkBnHZQAdGhghY/LHralwe7KabP3U3K6k22sx/408JGls3uhFTjdiYpx3kcclf7qscERBsIiP
	7Xp9emvW8bBqxf08nTF60dZgwM7rAhPg6LtLku0KGIzjtdEOdqDyiXPT+d6E8IXX4YO9fyaO9IE
	aONOnFDolXzzOck4Atl/K3Mh59DiHkt+alhrqhl7mw0BtJO7Xh4n+5CCNZi8kEuXIoDh5Sk3ktj
	Y+9qN1Yd7jhkv7QQPQNAlpRVB/jR7atBuY171t78zN7K6x92Ve1PXmMR43WNVvWLFf3I2vEC80D
	x3ViQ62OSFhKvxtp9wfzT9V7EOaJwTyHyZ+iqG1puqW37cGoeAomEAlayPVfcgOnr1yw=
X-Received: by 2002:a17:902:ebc3:b0:2c0:dd75:e830 with SMTP id d9443c01a7336-2c2f0b20ff1mr11992755ad.5.1781153982424;
        Wed, 10 Jun 2026 21:59:42 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2c0:dd75:e830 with SMTP id d9443c01a7336-2c2f0b20ff1mr11992505ad.5.1781153981962;
        Wed, 10 Jun 2026 21:59:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:48 +0530
Subject: [PATCH v2 12/37] arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-12-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YirJWrRqQcQlSKweDeLmHrzIa7EXeT47ncvGBD26WCU=;
 b=vEGrsVbHVBpNcBE2tCmeraqgFGzUwx2WZo7wn18QPO+Gcg7hlfNNXYwEnrW2F5frep8F64DM/
 hEAn/Ju6hIMASDoz4u1aONizCHZ5lmjVQRIpSmbMqvHmdmB/NnU8Rmg
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9hjtcaIoWyKK
 CAvIeaJzZommYViC0ioOCMexAh14JhOgrUMxPo06Rn4IVu1fPoVfU8UChGqnvaiGJTbsPm8P9w/
 icFFSsBA55fhmUlknkMkQbWeYcqO8mI=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40bf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX0dPGPjgW6MqH
 uJwrqJ86OmQKSjq3qdDmnyLasGymOMzIAznomBVJuLCn41R7WwsEJ3A+049iHHHQJ6nAORvPs4j
 KzUWE1vVKhctAyL2INq9iOTLupxvyEZg/sib2aOdXitmciIjAjtS9g1fFvWPPuwjsnt68Rm0M6y
 8ge2102fUgvjxcflxbDCc5FU2VDE55wkFdRnPU8yUhc6J5ZY4ap6LVhZTHk2VI/cSAUSJuMR1BC
 1d0zgdysvYRMt3J0iitsAzmOGtGSBwpZsFXehnIPMR6xWUtIjUcKaeGIrOWoCUYAROpJEPfe9uz
 VxG8qH7MLXGouhlIAb/q09iq4vmhnP7bglElJGUdJOt6mDzhV3aDbm9VJemfBTuYxPPpZ2uvmfy
 fkEbDZEdMuOoS+qdz6cCyCHcqeaCGh/uCvKrvpxMd86iNlBcUWV4NvkbsYxEbuYqZ7wDWa5/Gym
 bs4uyr7fjoaMxbewjaQ==
X-Proofpoint-GUID: cCDfNLMo5RDgygwrP0CVUUDY1FmDw5ja
X-Proofpoint-ORIG-GUID: cCDfNLMo5RDgygwrP0CVUUDY1FmDw5ja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..dc773da863c0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -933,7 +933,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


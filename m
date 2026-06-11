Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3ED361DD5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204455; cv=none; b=Wy5IJJ1JZZgj3zIxzKGEXf5FmVrM+RPoq+/2Fd6yDYQUSnSwCMtv0lM3lx/J8jpv/G5PwqzJDowgIwvEUtRbXVCs4UO68PCtvGmK3Tdarr+oBSZKlhvd+yeyZS4yc0XwaAkSYacqdSlK9OJwP51uAzjLe01a3souyxYdNQF/7jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204455; c=relaxed/simple;
	bh=dNJQoite6AIg7TYkGXQpEcEOt87bY7eJFMNvUxKib2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SSeKKrCfQHiXerur1tvl3oqwQ3u/RACROpIhs0t5xB889nnf82fPX4YnM3OHApC0ihE+YDORYvOGaDJPg/cNE6JKSTOx/YGqERrjwmD4+W+XjrgzWGIEW/qGhv9hg9VP7puX4SNegLHk/FePhmEGOf1z5Bb7gstkpaWoBd1vx5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqdLMbtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tn7/7lUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqdLMbtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tn7/7lUC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQDCc1307652
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8GKjJL/Uiei3OZXuy/oX4Z
	O7laqPRfNHUXY1uQc5X88=; b=MqdLMbtBRH3SldMOmZO5e/Sp9kjXoVFIu1ibuY
	Ufw/DB5/AND/WcCFdSjfMEY5RkXg6PiKIO6gzEGm12xllYyX8umIey3p8YzGlLde
	oywgxsjjTPEFrLwp767wnXRMbr19Kzpc5CbexzyzOYRyjrMQO0gKwTc12ElzMCJ1
	89S1kmD4AUyGiYwlTjJd+7M2XEipbqoTwVMlGX2VwlrDvPneJmGl/hEPT+95+9O1
	cb40jY3lsWYRay9Arxmny7ie/NSRiHTtZ/Ofj1twmb1gqXkH9RRFx/94IYqV6ODb
	9YSc3MEojHfzNv+4TmKX77xa6qaGC7DFJA3UE/KklKt4yKCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658ga4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:00:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3080bb0267dso434141eec.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781204453; x=1781809253; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GKjJL/Uiei3OZXuy/oX4ZO7laqPRfNHUXY1uQc5X88=;
        b=Tn7/7lUC7jT1d/C0mGskOBdph9vl8hLNmz4janv8eeNZk9VgZ8zh1J0OWotMD5L4O3
         LtN/9JtYtzVM6HVvBTxKQbm2d5iSHEd6Wte9X9cnI+aH6qauOThTMarEXrnpUne7eZLY
         YRXMUiYoLR40TFz9NLGTLcn5tUq49zpCF0dvVcODGVoRbquF8OpSWH00bfDzTRyGa1Yg
         f8omURtgD89j6Wgs4FixSOfRAxWlSQCD0vdzGj3BR/9EMUfBN70qWO+MCYKyAZXokykk
         JSFdzEsSvfzL7dMzISny5dUPL2of4Sws1PlIjRM6NZcWxmIl9pIL1abXTGhDe/zB1LnQ
         o7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781204453; x=1781809253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GKjJL/Uiei3OZXuy/oX4ZO7laqPRfNHUXY1uQc5X88=;
        b=a/rP3tEqZbu/zFOFEyk44x+Cc/mDAHzFU/mjozu9IzW+AX5he+yMqwr7iOlFU5gQCO
         RSL5+Gzz7JyM8NmhaU9HKh4mk5U2JMqu9sYKfVWvkBCUc1ICyD+coadyM5FmOraZj7Ow
         i4x4NsmkbSenYi9Fr96Lyo1GKRfbeAWaOsA8q+gyNcm5pHOKcBNsQAag49GpS9n2GxcM
         Y1osIYdqOfEd1FHiOX8fm+t2daC904HDLx5xs33xmII7i2mlGqOOf9Ixd7CwrA0LqQqf
         siH+dPeoYxOVahoN9VIiYvVaSDvpljvqyo4aL3Xl0b5RSDNBsp+Nyhgz2VIDbSQigByF
         LDnA==
X-Forwarded-Encrypted: i=1; AFNElJ/QgZDFM34UutluyMhRQ5w4c06HAlK+0+nfDrmQooJeTkZ6YsdPNCAjPMHk4QlNvZOGguCiJvOdxA2N@vger.kernel.org
X-Gm-Message-State: AOJu0YyRiGCam9mvUH+4F0FPki+6ZjNnMTHYElg2I1Dvjle/hfOubacn
	b1/XD6kwCMClDS7uuS1sGBFESHnYmjomgLMlvgP2fS7qf9BXt9nt9kHY1ho8WrI19BmKFrgeD1V
	pYUWnmXWFJWjB2V7K+37LkPC43o249kq3RWfc/HRzlPnmA2lTNmwzJbzaAUhGzvFb
X-Gm-Gg: Acq92OEoXzZNBtIYB0gblwrhFUVyvsRfVCn1co6EW88Fi5T+ZQsB0+XQCHXUEzWmjOR
	vhEClEgPKybLyoZ8OyGnrnhsIFegAZxPS471rSVkNNaNkOE3BsLJ8OFzhpyo19a8URJWWF3MwZI
	bQ+a+tGzkZLPEZv6tKDXwkSBcKK2qiuuYnFe7fv/h/zyns6GTEKQJkyLRsoRpmHXm9SrNh8o6jp
	cvjRnfByvwbNwT61yEwS4b7eUhHS89k6LT1GpBCk9JDEkC1X4dKRUMNRTi18Cv3Ap3fZsMrPVxx
	fUge8AjibfE/8CuZp/AbUJwIw0tj6/TmxLC98Obw27mYVlqpDtXyzT6dzfgdAOTLszgDDNO9T6c
	+BFc4vK5wD4oPhPAufdys++Ca1uqz2Z56uN0638qDYK1s3+4OF6896FV/9roWXQ==
X-Received: by 2002:a05:693c:25c6:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30804a25fb4mr2989940eec.29.1781204453075;
        Thu, 11 Jun 2026 12:00:53 -0700 (PDT)
X-Received: by 2002:a05:693c:25c6:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30804a25fb4mr2989905eec.29.1781204452521;
        Thu, 11 Jun 2026 12:00:52 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806e8a402sm3161023eec.17.2026.06.11.12.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:00:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 19:00:44 +0000
Subject: [PATCH] arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-glymur-pcie-smmu-espi-v1-1-5effbaa3e1af@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANwFK2oC/yXMQQ6CMBBA0auQWTMJJVLFqxAWpR1xCMWmQw2Ec
 HerLt/i/wOEIpPAvTgg0puFX0uGKguwT7OMhOyyoa5qXWmlcJx3nyIGy4TifUKSwOhu5tI2g7u
 2uoHchkgP3n7frv9b0jCRXb8zOM8PMwZ1TnkAAAA=
X-Change-ID: 20260611-glymur-pcie-smmu-espi-d8a495bd7965
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781204451; l=1431;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=dNJQoite6AIg7TYkGXQpEcEOt87bY7eJFMNvUxKib2A=;
 b=S5J2B6Zby6ZQDPRc5S57iC0EQBQKymF/ZsZiCN8txeZmeTkCaGTUH9da5AKjCGUs3MRD1GPnn
 MLIiENINJ5ADZwCwA8hNLXCLneC5QzaSJTrvpcn8QkerggsA4J/GdEn
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5MSBTYWx0ZWRfX91f+aXySUEFk
 zHqY8kA1MqH/Er586KxKlu4g+laOZvF7a6eE7vOY+FN/HP7GWObazfAfLQ9I+ZW31qtPTIdLjp8
 7QtGLojedMQQ8L7Bcc3jQPYcjqJbCGj1cNvZ1BnZqvmx+w8uIdpM5dKsM2PcrgtvQi9eTe2TC31
 k1Hu2FOkxDF+eHm1m4smIUuaEOhpJ/qjQ91OjdYiAnT365508sluB2EvcKLxdOGeK5oh4J9N9h3
 UsoKR7kgQpSZmfPda0ziPYp6Tut+uSh1y95Fh10eS1r4Opol8yaUlao7mBTs5QNjITB08ml5zcO
 IqtZ7QLBFtydS+/zmHf3PfZgEscVK3Q5TyFQWylN2aWoRIhiNmvtLVS79FZSjlQ5u+UAiApl6Jt
 vPpW7lv4fLxIQju86oMGMrf41DsnQZARxokSEK7AFFVLn0DK25tjiggC5PYNn1zjiN9a8zgulY3
 jH1UsT5Esf2N6F1X7Ww==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b05e5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=u7QxXnNj1dXMMgLrEtEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 2DNKEzo5XRONWFtH-dkUO21fbkd4px0z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5MSBTYWx0ZWRfX4vLe1q6EsMrN
 GEfVotMzCfAkz7mVUpMFoC8jByVSW43u07n84XyBRUgGJry1ByyfnjPCR2UNvCRzhJQiMW4+4nK
 R5NPaSGNBzf9bSDDqWeXcNqZ6g1kRxs=
X-Proofpoint-GUID: 2DNKEzo5XRONWFtH-dkUO21fbkd4px0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110191

The PCIe SMMUv3 wired interrupts are routed to GIC extended SPI INTIDs
4100, 4098 and 4096. Describe them as ESPIs with the ESPI-relative
interrupt numbers instead of regular SPIs 964, 962 and 960.

Assisted-by: Codex:GPT-5.5
Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..c7edfa8156f3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6874,9 +6874,9 @@ apps_smmu: iommu@15000000 {
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;
-			interrupts = <GIC_SPI 964 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 962 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 960 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "eventq", "cmdq-sync", "gerror";
 			dma-coherent;
 			#iommu-cells = <1>;

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260611-glymur-pcie-smmu-espi-d8a495bd7965

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


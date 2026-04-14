Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AA3876D3
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186554; cv=none; b=C9We+vgVqaDWuB7UQhKuxnFTI9uJwG0nZ2b8OyXgbE2B/+9K7qNPFQvHGDwcSwia2YfCFTImInnDomnOCicGVO5m1bIXw7/VxMgaZUWQv4CArlAg23X4CqQs2h3/Jcgr76UK9enQ7O6eIXZdjkyL1LaaYa3LCklSrGPMLeIullM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186554; c=relaxed/simple;
	bh=+gxqB3T3OdbImJ4VCq9TEOT8bV8gp0vR7BsLFzk6w6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS6ocL0R48MrnsYA2oyBLCJmZXZ9eMimDY0Yz43fqiCnwTxwJeoxWM+ExHrWWt8EQ4YOw5Sjw6xF3vKLUFOjTEjDdR1RpdQvNL8MH4yaG10prVzxyt0dmwboKBkcu9s0eo9iwAwB8tk7E1GM+1g0zsYon3IOHh4LTZbUWRpra4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtbhGj+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYwdmPi7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtbhGj+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYwdmPi7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECHCAA280804
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dd4QHJYVnx6VF6HE+2NsnZgJNpywRvKRQw4uXzySa84=; b=RtbhGj+nqzHJLG+n
	edranAJcyrzLkG2HOj0O7LJE+MXC1UwSTEbW/KC45fmyASOWMARpkPmPRwPHnrwQ
	4Jn4LjzL21bha5Y8i+5R5lVsqooz7OssbVxfGM+gUqdIrRs1s9O/3VEHQ/GXInQQ
	OlrC1L1TFTABvW7JcWQdhV0YB6mISpMve59gUR6lQnCR+qi3d9aVkCZhqrjqLxvs
	I8wLyN9LqK2QaTJziWBkyWysT+Z8WqjGZtXzuqfdd8IsLO7tFm0FcLdtmnen7IMb
	tJ0vuysdFNoAhUA+2f4l4g7nzG+yGmZ+LPIXJ2nY+aDei/GtSQUwWt5usrj9SOmW
	kEf51w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkrkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e91add2aso31358495ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186550; x=1776791350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dd4QHJYVnx6VF6HE+2NsnZgJNpywRvKRQw4uXzySa84=;
        b=QYwdmPi7VkED19gZ2WBV0qIAY7SGBteEn6BnHlLUqb9jWszexsrCfJIkFKvN3Z5KuF
         35NORQ5D1PvrOkQG1odKU1UIJwDwxbU3hk8g0tTfsT0E+tPuoYq1ap7gsUptERn12gLZ
         vTSX/YhOvStTQTRUUe4A2NdvBXf2mSRPJkpNHXpuKuCazoqspTnlgeZtBHzBizCHl5jm
         XsxURVtrGva7GwL8YkzJGZ4P55kdaK/9ohe80KhpM9la6LiEi0tbBcQBR+xj2UOfa02R
         +/VyoHErG6Qv6yu1e/U2BedQj+Zoiohsc8rcuvH/waAO7lM8B2wiA/Vm1AhTSkxDPkLI
         R3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186550; x=1776791350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dd4QHJYVnx6VF6HE+2NsnZgJNpywRvKRQw4uXzySa84=;
        b=JtF0MCiluUOgqywMtC9qlA3zeoBDt3H8OpJi2sf/InPwyDPHHwyRhgUatlisJxAbQG
         8eMcdn+p0HZyFV+o12sY+CT94JXdq9AwwBr5Pifuzg7k+0qvUPe4ItEjD4EqkEihMlUY
         GZ7x2azdS11GGGIC7JZDgtWZhciknFESrHjN93Td7jZvF9L0IoCNeefKDhLG0aftnueO
         hwFsJh4BL05f2hJru+xpdp0qT2C6tJYOUTA/Oo1mcXkEH1aVQmrdQGWfw54z1ugBt9e0
         ziT2W6XXrsjkYRC8nsfAplIK2Da2MU43en5Ks/f/vW4Z+7+iIEhk174RDYN4en5uJQJa
         em8A==
X-Forwarded-Encrypted: i=1; AFNElJ/lYItqG9n1Y1qb/3LlrnpwA9Hldg78FzWjMQkJAdouNuQpkpnC2E5hE+FEjOEB1FICPHANXf/Zr1UY@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPz0qcJFHPSEQ0NC3RaHD2uvo9RNbgeTh9NV1nDV0p1R5/hqV
	tRO/UpmvAqsPS3medUdpdPjm5jwYKEEQuftceY2bjbzxep9D9zLPSoze1CXykXsNb+eN+8stLiB
	9ekSOAqc7D1N68/cM6MeHOailIoDpXBodw1i8gnlmx8uhxXHG5izai61KfvkN7fTl
X-Gm-Gg: AeBDieuifpantIeGNYiyueG3aDKesg3nGgii0TjSF3BI2Au7LFWKAOnTwdL7UeN+7OP
	1x4evggZu4Xh2KEd8yiNgJyXqEghWJ9RnqbJG+JbhgzwWlbNvVQzh5gKZARMmy1zPVKU8NuLFYz
	4K4XqPkvxYtvqgpmOBC1uN2KMSA1J/fWqaREPm4v5M1xgcC0gY5PblEgn3MSU/H05n1mrm8Fo/J
	g8cyUtlRMjB80oREk+42vIoo+G6txwtJfW9hALUpkjPQIdF2X78dF7DNkG/DR+oDvvAlRZ65xl0
	tE0V04Hn1+BNF83TSIEIRuJRpj9NRE8c+PNhez2bjG/mTzvqKNUaBWHuZC73BLaiBcZ8nxbZ7d+
	xwFn0MnhQK9dDBoL6j+eF7JuOx3eTQGDFKn82GoflaBwmANBvkbD5znQO6Ng2BOdq8K/4
X-Received: by 2002:a17:903:f84:b0:2b2:596d:594 with SMTP id d9443c01a7336-2b2d59619a5mr173831705ad.13.1776186550019;
        Tue, 14 Apr 2026 10:09:10 -0700 (PDT)
X-Received: by 2002:a17:903:f84:b0:2b2:596d:594 with SMTP id d9443c01a7336-2b2d59619a5mr173831195ad.13.1776186549375;
        Tue, 14 Apr 2026 10:09:09 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:09:09 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:25 +0530
Subject: [PATCH v2 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-7-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=1351;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=+gxqB3T3OdbImJ4VCq9TEOT8bV8gp0vR7BsLFzk6w6Y=;
 b=et35ye3TT8hP/p/UmotWrLocjyo9UNMdTIMftwurVRDTSfNLhD9wJwbrSupVnpxrJsRXXRGjW
 XXZZu6wANn0C/wxoiYumvT1CrCdZtAei04Ut7o60Mj+NMM9NTBhS9Ox
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: a6af06ieSHwNzSRTAwePZxyP4PC1riKc
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de74b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=va74t0jcI0ebB8ul8YAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: a6af06ieSHwNzSRTAwePZxyP4PC1riKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX83jJnnBayTs/
 pPfGXv6Lk2nDm9TrksJhA7A8El75ifrEZi0HXMLH1Qsl42df21uLdqCCf303HjYxvK8yMZOhdp5
 Pq8GYG9PmCxfXzYIdsEHG9E8dB9kvXPv0bS92nnmp8Sw21b1KEC8gNDl+5ey+QcQWcrzJpv8yUk
 uzDLimkNQjB9zHtTePKD7ngTBeLLGTflodxsj7olszhCkyARXA8GJHCb3H4tVMhKadZsPozCVy+
 59zlnLM8OSY0stobSp2bL9YKy/3ZY9SgZ8kb0b+ZzOeOv6XrV6MRo7/oKONQAAKsApIo6eMF81y
 0hG81alIj1PoSNvAn7gSiCNyZkO9k3zGotJPSPNrIdDAXF0v8t+sarby+4ukWJx5MxwXk3Z+DbW
 XL/QthI5RESkQtvRGDsplP75OTDxIPTCcq1psxAsP0+X+m/sEhOMkDslFn9UFiskpdf+jNLdcXc
 UtqS/3EO9vmrcoIr6WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..0efcda80ac94 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2864,9 +2864,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


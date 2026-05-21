Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0043CF967
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368821; cv=none; b=Yhj+ms2bYK/XOlhWLXxVhDZGmXP4x6YOP5cEhW/85UKhIotFwPRI6anTp+dF6HPFXyeZ/B1jYAVmc5XHcwtLXg7ubrq57rHCnzLZ3ZvWFvs0P2NqqZgiUsUWGuo0M7A/8EtTSHlmFYNw+P0nxm/ho2po0b+/IOJuYP8UC5DSZTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368821; c=relaxed/simple;
	bh=A1erdMljftPzXLhP761c4LquhX2IG3TsIQ4FnVrpWLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y5/n7n/ZAKQXmqIZdUICw0fB4dZhKNcdAsIBwKemBPiBi4Q0hcexuMjLQ2cUwI86btCKHN+ZWfCT7uDioZYEW6HOkju6+HVaXLAJM46xtLJwTFMI9nfv0BfYOfo7wqQ6muRQAMypXAFK7OKiKPOBj4RP8QwysMkhumr4Nedbk+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5wK71sA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9dy+FUO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5wK71sA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9dy+FUO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99wiu2491870
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WqpQ5DH7AnGW9TfLUP84bM
	GaHd/GMC9yfpeTxEpheNI=; b=K5wK71sA+6xFkk1IRqcbXLekj2W7W+PdA1N2g9
	dhTUocLGMw21nwoH6Mj48kbJCUJqatEIOOj94wRyuBmNWimIBvsciPVowgRarBpv
	VJzwwWRjbh7RetwobUcmlv7HusQFf8U3XMNpQ5127pvFsqDS+KqDIsh7JcyMLqZS
	TciRm3fSTJ6Ux9ZKUJorEnKkze6bIxjpyf5w/qW2NGpjaWrAqFKntb45F4Ia3xyf
	KoZgWP4PJYZxt1QWk5R6vFugzINGgANkohpCXDVQQyB7BFfPqL22boinvvl4Mndd
	mQDTj58WqIBFJ0FOgS8zFFtp9PBeD7zDNSIG96hAbURDHDUw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j538c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:06:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c4772950so3046805a12.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368818; x=1779973618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqpQ5DH7AnGW9TfLUP84bMGaHd/GMC9yfpeTxEpheNI=;
        b=B9dy+FUOsTfUZREs+euQmXdVcdxywXoD/+2nIgFzIljGXKhy/yhSHu+OhvdSB7x0j0
         jOPlBvMMR5BP+fM2CCCBZhR/YP9O0fExWsOIArBA1N1MhArXll7k9Tomfnigk1oWQd9q
         d0APegxagflHCYNmEkig/0lD0gUrzww5xDBwXwSVfR8uY1DSDTtwc7ijlKuxlxlhlNXT
         yQ5Sau+YSrCx4/05E+qJ3yaYLbCmffOmJLMxqVyxGfbJPds4z4WCwIszM8UdG/DdiFGR
         0QEdRR521yliPEJJrWG2rLcOoqLM2yAhi9LIQaUsdJhANdH2FzU4zt/imUH6w7ZfWhEb
         AB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368818; x=1779973618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqpQ5DH7AnGW9TfLUP84bMGaHd/GMC9yfpeTxEpheNI=;
        b=h5AjVDH+EmmliOkXPE6dFY/70zQTCSJQLqH+X28DCWVjngEND8ZCpH0YnP5SYPzv/w
         VlsEQPyQaOtolIzo2/dta6gLXn4BXz8BkJ1YY6MMlW6PqrqeD5y+e2TW70qjycCpvtvN
         XsKTED2TSPZcxtmAps+/zrLdsQPgXso/ZB4/m2GWv6s4ezrSpc0tCn136QAilfzb5IV/
         V5Jw1qD6SqCpbjmeVcJnD+YtiFooIf6Eh24i/QcrIsPgePPux92bqQQuPdxP+H9EtYNk
         o3etUdtnE6ZJwj8NrsGY5jBXOZQ2SVhFOpIa+FR8b5hE4NH2UBqaVUr4bjtTC/6QgYf6
         IJzA==
X-Forwarded-Encrypted: i=1; AFNElJ9uYDR7Is8pHHore423jVASE3T1LrvxRVe0qSkXdJGU9LZEScOgbV/t6q2V4+3Ny8or3PPc+ky6zmux@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaDZcp6dtry9QvZi4ZNp+S5khI0Kj5ObdodS3T57bgGdvnAum
	nJAx/09ZQIRw9BKADpnS9F94mQ3KK/4DGmW0qNQf9XNNo/9XH6Mbz9YkyMWWxJpTlBBqWc/CdhO
	Sv9JZf/s2TPjEbO0/QlHH9nu30E2RyenwG9hAJBwEFQVG0e/nLKqTRbHK2V0teE9Y
X-Gm-Gg: Acq92OGrg7z/OSFr0oTcdddgr0Xy7fiKEkplQw8tCPFTBtYHK4YrEprRXdPIF6Pu6sH
	cQ1hZ7fwvKoQedYmQfQZyHsvXkvDqi94Jfr64dGhZiLeogL/H3VI33tPG40X8fNNm50p30rkQ1z
	hjxUsuH2wty+VkggG4Vn+/zh2MaDAr3j3V7aQ+l7PoRECMcA7P2ercuTUEVo56K6UvDJVeqkZ8t
	40yh7Wmvi8tKEBw5/KYS/cU89Xw0Z3QmepDjertNUcE7U1tCN3S9brxEwtj5O61Ic8BgcGxUP1l
	dZssrjsbonAtCj+5eRHPmLCqHs0G0gZXpm646uP1DFBzQ0LtCzyEeDZqqSPpq/EhPuPFl+Gxv9y
	E+7gjcuj6w88N6Pvk+Ka5qfjaylgzsu4quFGnJFoFyHkzQAriV7JETZGS3O9PqXliERY=
X-Received: by 2002:a05:6a20:9153:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3b307c39a73mr2869408637.15.1779368817771;
        Thu, 21 May 2026 06:06:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:9153:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3b307c39a73mr2869359637.15.1779368817141;
        Thu, 21 May 2026 06:06:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:06:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 00/18] arm64: dts: qcom: Fix PCIe wake GPIO polarity
Date: Thu, 21 May 2026 18:36:33 +0530
Message-Id: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkDD2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3fLE7FRdw5S0pJTUlOQUQ3NjJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tADuf+ehoAAAA
X-Change-ID: 20260514-wake-1dfbdedcd173
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=4245;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=A1erdMljftPzXLhP761c4LquhX2IG3TsIQ4FnVrpWLA=;
 b=UrI+qSHz8vT1QW0OUcxoE57oAXfp6aIeoN58p+91V9UxF1IP1b/3XzCjSKsNgLJp8Y+QxkkJO
 hMj/CvgTlQRBNoOBJiK3MY0wMsY9gLcP070eH44gD5aExq1aH5QAgrG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0f0372 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=f8wifmFjKP8xEeO4lJ4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: anSnrbbshkpmjvWbbdryDzB5-YTi927R
X-Proofpoint-ORIG-GUID: anSnrbbshkpmjvWbbdryDzB5-YTi927R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX283o2Jg1LaG2
 JBt6Yql18gbyvWlzRWfGdyribWbMZliDe8LnZXwoKx7PuCD97Q8u7eO6BGqXduYiaLA7xAETbp9
 U/A0w/mmzvxoFMGX8RBKzxHzbSSPAR0G/eRy9qm59ycfT4poL6h66xWuozTzgCixV/f3/Es8dFY
 jnD9V5YTJzUqI02ZQbW4AIVUj4bNpX30DCmVpEl2oXjn8eOgr3EVHv/0074VkhhdYBGim+OVeyL
 ogZ7r+l9upoLAaUR6CkOPMmK3ikZozoQ0RkyJrI34m18UP3Sq91ZBe1z5zukwpQz6v5V3k/D0iz
 wkS2Yy30HnEyD1ScufLlKU8CSR8rSW+8BNXEY6TlvSghZ3ZiJhBoTPkb+Gl1hQ0T9hwkqtTDPoC
 WV0sIvdfqiCBUMELM0JKq5s5nZAHSbQ/W6lkPXv/2fKg8TCcJ+2UnB0xWl6QiiJxOEnacIA4bEN
 Vx/+sRTTXyoP0Du6Qfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131

PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.

No Fixes tag is added as no functional issue has been observed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Krishna Chaitanya Chundru (18):
      ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: msm8996: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8650: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi           | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts                      | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts                | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                          | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts               | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi                   | 2 +-
 34 files changed, 51 insertions(+), 51 deletions(-)
---
base-commit: e1914add2799225a87502051415fc5c32aeb02ae
change-id: 20260514-wake-1dfbdedcd173

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


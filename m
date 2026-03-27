Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2564237267B
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601610; cv=none; b=jFQDqcqwQ2cI2SNpBqA1hCf3oOeOmOidwPFCmgYCvHmdL8AcvFSpkA9s7/8Qy/v2C1ssMYTlzf0fOm7CAB/X9x2yblRmWp8gJyVMqiaqWx8IUVElE5GLs8fEEkwx8A6uAvtXScf6tTlba6vX8r/Ndz/NiNbb9if3+mI6/sKCKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601610; c=relaxed/simple;
	bh=AdR6PAQkd/glAbRWzZqZs5ZV5zwjk6NoX4PBwfEC2PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jCZCpLl8ONxJ+aUE2XN87kzPDJSpfdtkx/4opi/x67KTeyx0Bg9STCkXhifh4WgQSLZJb8e7di9MFksEh2T0nE3xAd6ZluNYhhufJlPz/Axi6cJVrYyErEr9H5HX3lJ1Dp1dzsH5MEuDrAuPrR8aWelZsXsYp9T/d3QbcNDWiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRSlMbwg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8R4StIN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRSlMbwg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8R4StIN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3IX1860244
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3
	LJrHuND8=; b=LRSlMbwgkLMJhskPryMuFDC+66xpWnkO8JbfQ1ooPQ95Asb02VW
	5z/coajHd20W9/nqS1QMf8f2zJe8k6PMpZDyiQiqFKwSjxI51kUV2bGN0FwXjAmO
	dpRafkVEI66aXJvTgrIX2JBtUd7H1auwnjsxpzP1S8r1eVWuJHbue1YkAu/4qU8Q
	fDPkx0xl0yuA7ZYXc9zlkp6DCIr2ZZ8bOu5KwHeWSsazp8W91oC6apYHm0G9ZkKW
	pzxZrHSHHcFrd1QhTFEGUPY3aSpr0718W9B8YCSr7zbfc9cnqZgx4sNy6Y8sa9EU
	m584RISoX+jht7YCtrNGvLhxdAoITnt5FjQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2863-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:53:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so2959338b3a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774601608; x=1775206408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3LJrHuND8=;
        b=d8R4StIN78YqhxxQXR4wZ8HMhlSmfux1kQr2qhymFhHFvxqBaMLg9aWm3fhxSODkAQ
         occUyRg12gp2EkmrW1P9bl5GuakKWRornhIa5050A0/PLLzK8PplH8iMDWpKINl5OUpZ
         8hmgrcY+Of0Na+5ixUQpxukmUGj/PjT81r0ORZZ9Q3qp729hc2bjFXGg6lG8WiIwJLgY
         BXTFyjdU0OYKnf96dyfEFhLcUuyOqMrX8JdA7dggS75PXCaonkiiYdL0KPkMBekhSO3r
         fGBDydklQgWquijE40AJNZYKzxBYZbGfGmzCd1baiAKq3/jHAUstW/yDw1rIeInVyuZE
         50Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601608; x=1775206408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3LJrHuND8=;
        b=eBCK1M6na805E+N7GASxfhwXOnEfxMe8tavHeKcJw24TcwRh/sHWL7np39qD9SrCGK
         mWohUvgpN7GcPa7i9VBHP4CsGq1jL+ivc5RZoU5rEr1+oIehQ2j0K2IfEn44/Mw3+mQl
         zSL2Gz4MaajJ57nSurKMixqDFBZFVsvyuZwoUIhctXuQLx/VJJ4wOfY5Nv5FxkpE4D75
         dJhyCl3zkFuRIXVmubQNRlZ5Tokx5dZi79HTH10u1PrO5/cOFuTWRPDjoMbW5VdUpJsZ
         10V/VJWmazl9LCJnpJdCMffazjvZFZMTTbvCtoGAIo1iJhIvSDB7hNO3xx5da2MG89g8
         HP+A==
X-Forwarded-Encrypted: i=1; AJvYcCXyA3fp100KDTGVzs0l3ZjzpfGQs06F54P6tmNmNvdtEn+Tvyc5fIyZ4bZGz+NbC/aeRdXo1Obol0mW@vger.kernel.org
X-Gm-Message-State: AOJu0YwRox1r8e+cdIFraLrLGqS2MLlvLCb1iz6T2cEMxQdqwnkusCF7
	qCVBohhFlQP5+aqDSdN2YvT5MkL8fcEJeV9cSYH6Vb0Dh1Lu1yNokKdVNY7ESoeB1LXX3MEY2iP
	0eyIWJp6fJ+jtWnNGCEG4aO34kdzejvouG29je+QaJ776u8HKdOvvdUm8iCU0K8kw
X-Gm-Gg: ATEYQzx2qD65fP7rybQ0dXtGPIHeXy93DqIp75VzdN4SGrzxd1FNOmthpBVrnuq9OYl
	eGttlvpVht8olTt9Y7EiCvYc71tc5kW2r4ay3FG7wrRVGYc1uWJ5AJvWXzfHT58SVoBPNwWFwuw
	SeNQonOS/ExToDl2agfwwhqwnXLXw3PxyzW88l04SDkewb8TFukXdYUV8B/QSVcy5ek9koteIws
	y86tmA5TRu6gJyey99DMPyXo39ymWO3UNBKNpm3E3c3xWkMlvzLzGJYNxv6YT6y/ocuDXi8oxR3
	9CRlFDtcYywbZLxHLeViyyZSbEGRftHfyZ4fmJpMiFnLo9FIovY1Zz31l+EHw/TydqNUVeL3a7v
	jnZtViJeNOwqU846u3635zne3jsbIDhqFPpFg6KuTGVmA
X-Received: by 2002:a05:6a00:99e:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-82c969c042fmr1498111b3a.23.1774601607679;
        Fri, 27 Mar 2026 01:53:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:99e:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-82c969c042fmr1498091b3a.23.1774601607203;
        Fri, 27 Mar 2026 01:53:27 -0700 (PDT)
Received: from cse-cd04-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c2714sm4862885b3a.48.2026.03.27.01.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:53:26 -0700 (PDT)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes
Date: Fri, 27 Mar 2026 16:53:17 +0800
Message-ID: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c64588 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8rlZebuS5uYMG-XfLoEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Aq9lTDdgp4ynJmtrTn6c5rIMipDdRdrG
X-Proofpoint-GUID: Aq9lTDdgp4ynJmtrTn6c5rIMipDdRdrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NSBTYWx0ZWRfX4lgLEWE8TCHL
 B9Unhf6iOpZBvbfSi93X79RfQ2suurr8386M1y3RKDPtOzCI4VLuXPqA+DBsBffQAPNvVCQUTDm
 B8Ou7t0F/aSkArsRhQsxVtNvk4n88iuLWvR/f23WpYbPGW9IC7Nc4CB62vUn7r3fiiv8McnyTIq
 V8RW7PqJZ31SWMyFpEATahYNcuX7KBtdfsXbdGk7X4wHMjs6SPhWLTWuEHzEpbZrkwM1eGAzeuF
 BA6Mcy01TZbAqqhf45te6MV/nQl5XC4PLxsREUPlPJFOQKR0N+GPei168dC1ulqsxlmu8+kSBZG
 yeuhXqC3E4ahqhHgagESXv6+1i25LELT2M7JW43MqpAHwUqgaIRqJ4uzbZsExorVrQ8Lclc6U4l
 mIbmwJqkDuswFnW1byPzLgJvA5GJvd7XsSzYw94Vm0CQ2AZ8vObYaKL96rDnKLxgKoHPCvPIjLA
 ubKWE558eVGEaZoaXlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270065

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 1a9e930c0496..c26eaf187b17 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -458,14 +458,20 @@ &pcie6a_phy {
 };
 
 &qupv3_0 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_1 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_2 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
-- 
2.34.1


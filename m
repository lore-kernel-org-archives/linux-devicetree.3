Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C30318B96
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127185; cv=none; b=aLPX3WHxWTP9OF/yJ8tN6nDmOXh9iSqqrDTa8RKyT+Zgyh69vcPs5qHpQlCoGW3W+DeCsGluWEchMpbkA2TNoq/+DxmRhOJpXrzIgzFVaue9R3IrLJFZ1mkyXl220SPCVWWDysYQpsympXegDsBZq9RGpKXl7H+Zo7BECoLS6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127185; c=relaxed/simple;
	bh=fJF+CQ34GAc96FQ9I5iJV5TGKNk9YFLboer/co68qD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J+tmd2d2y1i8NS/cNCXB3QY5dWi2s+09xQo4hyriRB06dURspHRRaGymprALYtIoABFzcmSAml4liGUKmDKjQv0aATW5HuwK9m7LDWpJpFSZxF4TO8657dfi8kj42trWAdcnNc/18UKegDW1j451pSbVMHOQsY1/x7F1INes+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWCqppI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwOfD4Go; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWCqppI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwOfD4Go"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326tVHH548321
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 10:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l4iRJumm4Lhs7az5pTlL2cgissYVmIQLzEM
	V5QdhHj8=; b=eWCqppI/7uU8Lairm0RTEiWtb7ITgdA4H4G0L5DFypEUDih52sj
	6hcESnnkqHpKyQRnclqe1LmGTTaxxzidpodN0JCWTWbEJLDpPn86z4v3Hd/5NwoV
	dBplbhsc7d1MUsIAiHJKTP1Kv0XECg4v96hphNfMSfKTGU205VD795Ikz5/q1Oa2
	pRfHE5e0ZJHIixri7M84IZ0xSa96v6MUW4kkyY+G6Qc7evyhUIZiQU9MUVk9qiK8
	ZU5aBsjfdCV8Bamfv8aGoPv7iW6f7J0zoZISe4AGEMe0ISZyib9QIUL3xTprAlse
	mXtosAUxJ5sXjC/2batmmjL4db9vnZzzu9w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvmba9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 10:53:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso718903a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775127182; x=1775731982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4iRJumm4Lhs7az5pTlL2cgissYVmIQLzEMV5QdhHj8=;
        b=CwOfD4GoTQPE/dcfeqAShcpmujK6bpoBjoh9A2S74R4Jt0P3xzZO8vECjr4rfz5m/h
         mtigHgNxJfDZaXGyl0+9iD4KlJPnQCpkV2COvQi6hWWegazvkKum4HpXh0QM4nHzR5k+
         7/i10m5sqhxRe+sK9pFXZNJk1NGoOczhsPz/qk0b8yPiPCKb3W+H01BU5fTcjMwwEwjY
         weqwTPwL7/HnngKcYZnbwb8SlmnSR+eqtNhnAFYacuFs/xjpWKiGL/IAJYve10l6Yc8/
         eB6+aRQ38Myh9e6cD2GrdhxbgMPzhgU9pkKQGiZl8//dQliyyeJkUin51LjR+SudYfQJ
         EMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775127182; x=1775731982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4iRJumm4Lhs7az5pTlL2cgissYVmIQLzEMV5QdhHj8=;
        b=SUqQl97qN4Yak/1dFOckQ6vPS2NC87Vj7uqGUTAsbOgZZvk/b7zcA94bhSxfz/slaN
         lR/pOId8ogXnvnfeCYwzs0CLdg/bG7V+xETEahNtzFy/YsTQA6qWCnz8SeWHGSsxGVu/
         bcOdmuFQG00HGyWp7DW2+BQFuRNuCwnOQrOv6s7Cfo1JjEKDSVFwA1LsWG6d0osHWL7m
         6I8T/oDQuo+X0l8/Ur67eQmaL0RK2t4gWmq3cy2GtsoaewE0/u0jMXCFOGpFfA47oqeF
         lqzsca0d2hGIX8UgDGJ0Ujbg4Lk9KYOZx6m144y8DBUEwjoFzj5mIbYq3LZVmPPRUVzY
         8soA==
X-Forwarded-Encrypted: i=1; AJvYcCVivE0975Uafile++Ibjnu5enUF8XnSnzia2qIA9s19wPd8LxUw2h9w+O6L07MalxztdiJLwqou1jfL@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAaKQLaCD+OZMa/WjeB/2Jr3FTzThBDpR5iPqNbKeQI8Gy33a
	h3QiWFZVWhK/NupqL5gFlvtjty5QammBr6lxcRUDq8uvTgKV2PXYYJVnP7Sq3s96BydY7s6ZxHe
	QHgaJuZ02ZnOBHEFTi76QLFEH3FVh8DR6HAhuiXDZhQr+FfzIi/hDeDlASz5UAXf/
X-Gm-Gg: AeBDiesa4rFeVbAa5xHojhpnnr8rog9EtelsMdU8y5dV2biDu56EacTMwap8ViYmUT9
	ZDdBaMq2EM8tXoKjSm/n/KZigoQ24OMydWFgwqECXPj7C9eqJnqKLTOxjyHaFb5XVZ++FQNWyab
	gAzeJVEtwzWIpl3TiZQ7uM2VqI7aoaIRQfdUR9BjVLQ5zeKKbqbVa9rIbSIPKWUdBzfN1olEEvy
	efclvDNB1lCn8cPIf0wjznUZDm2+E/i/wPZcRSiOUbzNx9lMHpnAnrg/eDYYn0V4QdsufYcX2sf
	lHuK5JCzNsf4z0MrJZniC5bCpj7u3KImZy6+x156sBfaHavbOWJEE2ACtDK5AOUAe4n/IdnO9yz
	tzWVLLbXN/WfRurWptQxtPK95LboNV4OxJTdke9pEzZFLc0U1b5wu2Sk=
X-Received: by 2002:a17:90a:dfc3:b0:35c:1695:24a0 with SMTP id 98e67ed59e1d1-35dd410bc07mr2599632a91.30.1775127181685;
        Thu, 02 Apr 2026 03:53:01 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:35c:1695:24a0 with SMTP id 98e67ed59e1d1-35dd410bc07mr2599620a91.30.1775127181212;
        Thu, 02 Apr 2026 03:53:01 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd368f538sm3464203a91.14.2026.04.02.03.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:53:00 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
Date: Thu,  2 Apr 2026 16:22:53 +0530
Message-Id: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5NyBTYWx0ZWRfX0O6+brRgfnFJ
 C2jTyjR2UCiS/k3UozNf5ulgxpxC55NCbgs6z+2Yf2yxxGS8qbRnZDB3VoAwW5PYpqs5at7XLaC
 svcK9qEDQSSWYd/E3Srkd3bfa+qE+l7I6M8MESGqQRPlAV9/d/Nk9S7+0tp5uBcxYZyT0V2PiJn
 P40H4JHKlBelt8GUbBeUO3OePKHDZ6vi4v3f7YcTitVetWgNeOkXZErKP+TMnJLHU55rgkhQx6y
 Sbyy7fG3vCCK1VEZMvwOoP182/g6hBj5EK6cKkxtcvRIwjNxSoV5qSwskTyHXsNwQw4pmb7DUOh
 J3whHyq0p6oBPL7oxxnoMcAyEVlK+5blh7jPK38+nnx2h65rKBe2eXRcPrXSXeHRYJnGQDHkKhG
 GxFZVhEYdclDYKccfODkyZohXKwd7kZOHGunog+lOlszCpygficWWmwKwJJ5q7ngw+pO7NmNu90
 3YC6ZSXa5F4X1qRjkkA==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce4a8e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HURNEOczjUzzROzEHuAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: YbyJtAb0L9n6uXHW5KMlRlZVix7yHbtO
X-Proofpoint-GUID: YbyJtAb0L9n6uXHW5KMlRlZVix7yHbtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020097

Few CAN controllers, part of RTSS sub-system on LeMans, route
their RX signal through a I2C GPIO expander at address 0x3b.
RTSS subsystem is an MCU like sub-system on LeMans with independent
booting capability through OSPI interface and supports peripherals like
RGMII, CAN-FD, UART, I2C, SPI etc.

Describe this hardware wiring by configuring the expander GPIO 4 pin as
hog with output-high, asserting the selected line during boot.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a1ef4eba2a20..b8371bdf9933 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -615,6 +615,13 @@ expander3: gpio@3b {
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander3_int>;
 		pinctrl-names = "default";
+
+		rtss-can-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "rtss-can-sel";
+		};
 	};
 
 	eeprom@50 {
-- 
2.34.1


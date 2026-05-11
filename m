Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE643901F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518503; cv=none; b=jpWG9/XfK4vqHG4KeWOtIxiVEa16ah/nzUgHESq37IW68zv8opVChniylf0CTUNophLOZ6WDOSFJfoGUKf63xY1A7iockFQ5F0H0QcXU0YQRRimVAVofnCLxFm60qTD1mZv71MleoE6wAv/cGEA8CacJegQP2h7hdF0IbzqTZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518503; c=relaxed/simple;
	bh=uh3s5gi6hL6a768ZD2wOBXJYx4l7D3gq/KsvPb3OYiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HVn/OCCjAbjjfF8yCfQSn1uPNYS/hcKl2uC1ggrd/WpA/l5KTvPEzOj8gC5so9KHYpJUeDR8OKAlzNuq99fhQDEpeuIUOXFIf0KOCtnc2iqFpEwqcCcb5LdRWUG5Yh18XOq7Wth3wgf+hnEL672CwmtkzBcBeFR6mspxQvJ3Lec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lu587usg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tc7YOGzb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lu587usg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tc7YOGzb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BFOPsu2039741
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C5jkw2NHRGGqZBVPBFhBV1
	DCbU2W6r6vP8UTxbpFB38=; b=Lu587usgzVcKF4bfdWqFzC+fXTkwovf7E1CtVe
	xFYhKyMoCN4jDp/YjFYb/41MsWx2GKOyd65+YxFkb+f+0Vj4utq0s4GLQGZjYzZb
	yThBq88ZJOWzMYBb3LsEiJWALnLbM+WB+XlfonuFgarXqiMQhfdYbrf79jqzEgzL
	6Wa9q03wHbL7FdpiQdZs/9zhxj7WHrge2Mn42qIj8dX1TTm7MhZXUpEefVhqt52j
	k8WCr+yV6NyouY7kJA2dSomacx3a+I5HLO1jOGBwLmB+XeeVFFFVR/9Q/Xd61I0N
	iTRrFN/yn2MAzlL3qx13ghsH3EDL0dEVYZJ1Bsi0IumAP9kA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22sng5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:55:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso1971163b3a.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778518501; x=1779123301; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5jkw2NHRGGqZBVPBFhBV1DCbU2W6r6vP8UTxbpFB38=;
        b=Tc7YOGzbMlxrjWFpGf6zoZbTjiAKWySPrQ2INdTNKTlC1hcjMAJ/d8lYEAYJNeNDWX
         liXG6jnYVyvYGFqueEIys+GKwYuFGhVMrhka5Q2j3OZAwhTqUfgNliwBJfTQ63zrhDZM
         NikTWmHcFgCWek40L9JNLAEgOwmeVaIJd4rN2QwQuuKt5qCbpqIFY864o1qNAl9cheJl
         w0IeWcD6XmLgdBTh9ok6cGWCbcI6Sh2kOyvNew4AdVtKyNZX0D0cfG+nYHEY5KkJc17+
         2AjUtNDq4jbO+T8BDLhZobR2LCM+zjAvG6jAKLaNifqzZwoDOnm0r7/J9MSZwuqi5ffu
         6rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518501; x=1779123301;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5jkw2NHRGGqZBVPBFhBV1DCbU2W6r6vP8UTxbpFB38=;
        b=hS3jCWpWPKR4Sx+hVDtwiHAhbx+C5fwolxWI9IlV6FEVvJ90ddNeyKtBEhtAEdQYxu
         YKzGwK0EXiZnz69TI0LgTLGOTotJ0Z4exSQMEwHRrz8lKRPFOUs+e4XmJAsJBw77hVkN
         RHCBk+W/SzWUF9prFwwia19r4FDRxNcb9dsKa9POpcF39jmv1CwY7A1JXHYqzjVnOEm+
         64ii7Tk8rspaubb2S++zRvhPvvOP8qnrEaQUIqM0BLOo7TkoKlz+NiTfW/D4TQqWrRnb
         BTC3Bet4DtPJqGItj+Y2WxYLIZEJ0m8cSaNp9/IKKNtdANEZSGQCvmUr0oBLdShXeFD1
         X1VQ==
X-Forwarded-Encrypted: i=1; AFNElJ9s50GJEXm9bBVqNfhDmMr9Sv6Ub+2RWPraJtK6hDlh3mEENrF7uuTpHH+gcnCz0ODA+jdmqJu9eRTw@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuM9Khz7ftmNToERWpxGvNLdwjjlaWGO/9Q1UQT5Pcrv/s++f
	5tK6UemBtnv8C1DbdcHfC/CBcx1+ibTuId8iWzzQScq1yWaz7imF9Bg5R1iQUewXXkC/Uh8zmdl
	Tk2yYyoGq2nj3LqIQmvcnxTpcTwdd0OWntF/Afrb5Yrwf/D3A+MhWisKpMB0pHbe/
X-Gm-Gg: Acq92OFVOBmpE+JmTmo8vaBhMj5TLwM+0xlnfo0aMfe7LHIJ7UAQCIEoKyGwDSGEV5n
	tkkv0OBgvi77Xy8pex4TIPFFRO9CnMSWAl+p7SVVfboL/0iFK8FPwIkznt0Ev1kA2etSTObMBwj
	i1kDb4PyXeMfe/960Kg8cQgC7C2MBsCx49I85M/+bCQSJfQTQMA51kh0yUmIk8yEaHWTvd3jiXo
	mS6ow9npnyAtwify7U6BRNW7RP222DRZKLOo3VRJpg4ybuwhEBggmMQ+V3e6YDdRiTAScAzKYqv
	9cozvOnpP86/WuKcvohcqqicHcIGwVscV4LcsMbf42Rtk/TNhYDlFFbtpWlUhej55agcsbtg0qN
	1y3b8D7meSrKb8N5VWpEKJBsuWZJBl4XHCEMnnVJbSp4Z+1DJQG+EoawTxUXnYPIEY2qHNuPSPE
	e0WLrs40frLaoGyMbAP5sjKhMU5/+9TlaWDzMkoCR9utdttRB86YQy5h9g
X-Received: by 2002:a05:6a20:7f8d:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3aa5ac62b2bmr25835285637.44.1778518500628;
        Mon, 11 May 2026 09:55:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f8d:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3aa5ac62b2bmr25835256637.44.1778518500139;
        Mon, 11 May 2026 09:55:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267735e3fsm9303977a12.31.2026.05.11.09.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:54:59 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 22:24:54 +0530
Subject: [PATCH] arm64: dts: qcom: ipq9650: add watchdog node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_wdt-v1-1-1948934c1e12@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN4JAmoC/12O244CIRBEf2XC85I0IAjzK8ZMpqFRNjrogLqJ8
 d8XL9k1PlZSp05dWaE5UWF9d2UznVNJeWpBfHXMb8dpQzyFlpkEaUALwdPh6IyG4RIq9yFaEiN
 qLTVrxGGmmH4ea6v1M5cTfpOv94lXY6bjqWnqs/Zv6buHQyn4c2DOdah5KFva7bjQDuQy6IX1v
 j8r9n7xBX8cHDBNIU0bDiY6gyZYiA2VdxTHQtzn/T7VviNngxReLAFBhEBRGRNBKsToo0ElNLg
 4WsXWt9sv0NvCmzMBAAA=
X-Change-ID: 20260511-ipq9650_wdt-cdf8e1ab5525
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778518496; l=1508;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=uh3s5gi6hL6a768ZD2wOBXJYx4l7D3gq/KsvPb3OYiU=;
 b=QOXMVdJ+ceZINY6r753jUSc6bnssih6W1O2W3siSgopjXMUtQ+3aT1I6vyv68vWgTbP6LqCK0
 q7AKk9O4HKSCMn/dX1pBCkd8eV3aLYzqbsstpjMHxSiBhZy8+gL+aDL
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a0209e5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PhBjxDy3iwG22oAsXekA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: YndQeAIkdrYGUl6MruvUM2PQ3mmdJ2eI
X-Proofpoint-ORIG-GUID: YndQeAIkdrYGUl6MruvUM2PQ3mmdJ2eI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE4MCBTYWx0ZWRfX+taA/+ndBpC+
 A76Bfo2lGCS0c8gmLz6oBhpV3WI8RAqxctzjU+abSsoWYUoNlb9WNxSeNjlkfqXAt7Bwvi1AmnK
 N1LYKB2by0nNdVt7s4rECv7gbIcNyLyorWGHgJbnamhSyYGgnHiG/XC2V3CLEGTws6yXA4J1cAh
 sL5YfqrF6DS70QZxHwe0Lp0Ud9Tlzzsu6trs+f7aHrhozeaz6dmCfSuOZI4XE4PvEhRWLq2F9YA
 P9SwR/WOlZxIugfBSRUZY5rAKHoZatm+3lEZwET7iPDaaVGbz+qzGM75UP75qlmq8qc20mMib8I
 qT4TDoTr4m+Oo9jtx3+EiQiaSqTIs5Z7Z05A++lnIUKBTGIppKAcEUzzlyM0WfVRg7XRh+1KDFV
 Ya8sVnwXRgNW2e8xdFeJ+EI5NYvt7dcY4jOzLboCikXlTfGUDNJE5EI9TZloIKxGtgiCb/+llVB
 yc5L43ZrzxiysJkrg3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110180

Add the watchdog device node for IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index a1bea8e648cd..3d3b317c6a3c 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -300,6 +300,13 @@ ppi_cluster1: interrupt-partition-1 {
 			};
 		};
 
+		watchdog@f410000 {
+			compatible = "qcom,apss-wdt-ipq9650", "qcom,kpss-wdt";
+			reg = <0x0 0x0f410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING 0>;
+			clocks = <&sleep_clk>;
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x0f420000 0x0 0x1000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_wdt-cdf8e1ab5525
prerequisite-change-id: 20260330-ipq9650_boot_to_shell-159027d548cc:v3
prerequisite-patch-id: 16dd91c965e8c4e4c9da7c077f5f6e5f56624149
prerequisite-patch-id: c74b31333eccd4eba783b927b7eb0bdae27ec576
prerequisite-patch-id: 940367fceba083009275adfbf26cec848e676915
prerequisite-patch-id: dc555fc4ca7a7ff0f0f4d2047c77d1e65924e8e3
prerequisite-change-id: 20260511-ipq9650_wdt_binding-06f96b6d80fc:v2
prerequisite-patch-id: 36d6f8457f5458a5d6d2c0b59b455c8e9e238611

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


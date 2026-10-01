Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE852F277
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867507; cv=none; b=u2ZkJ+CqQF5raDMrxM3H2DibCDSpPAQEugD7Jq8ThfOY+yE1gWix/H6F2JPqIGdEKC3ObviK3qhNJyYcu3Z3r7WPHYb/qnIVHstiPllwOV4Ul/VOtQ/P53oSIdlKvyYDVpU8+5rivWBhQV2jIW01EmxIxNJ51AcJfzWY8/ZOGiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867507; c=relaxed/simple;
	bh=HTfux28qeRiM9UR4Si4CXxbE7s1EAWFs5z2fgAcyXq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBdfrTJulVHb6E/Rhp3gnnX1Mp3qAcRKag+p98nMpvHx4Ru4YGRIrcYdIZTzw7QBItbQGrL1BHL7gghIQDlPk9rCF4t0t1lENFgO0i9RuOJy1RaWSqk9RMjagR3chL0LxsflMzcxgE8GKXcSLjiAbHkFN8XBXuzbTKnl8yH9dPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYrzUzqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7fr6Me8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYrzUzqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7fr6Me8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjIb32825586
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lGZqpBatDhAwoairRyA5X+HxlguV3XafztM288Ex7w=; b=QYrzUzqHn5K9jBij
	asARavBR362YViEVo+4CfgFwMnngXxeAayBY5HQtcJkiV0m/X433XkIsiJeDdqhp
	RIIP+1ZRk+dv1j88MzKfNTDAfWBMVWFfRT0dp0einDWU63CAsRT8YsJjnfj+BC2v
	gjXeAJzRF/6nnn1Xp6pi+1vrN1Fyj5KnR6OT71XFyTsXPOaQfOUwuMfcx8ghcMpx
	1F4D2XLSbGA0pO2W1Sjs3jXTjRiVXEtpwNxF5lvonjNaVTUKH8XtOucfYY950riV
	dMcgyxAHsN1tAde9TbN4AArkMQVVjf8tIQorOkSrLNuEoheD4m2k4jpQPDsnqngW
	xZ7p8A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft7jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:11:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so13011180eec.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867503; x=1791472303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lGZqpBatDhAwoairRyA5X+HxlguV3XafztM288Ex7w=;
        b=B7fr6Me8C70UiXrSbGiUx5lIBcMqLZEtsZkb885MFVXyvTmpH0+1IjiPan+wGhbi9Y
         gvb4NGEoNlWDKWYnYSiyaAgYcxBLOI3YbtyQ/WOtDviMOLl0xT84ZKO222X8dZX4bE5L
         YHdWakbeosMrdnXxZG19nUbvUM0SvztPXN4LTc2XeFl92i2qCeBDWMAj+4l70zLfiwcu
         Lx4iFBW1pMx8DvMHXJEk5WPYVM4dFxgOMp4oLMjwOnRpjNgun/EjP16PiQQXFrpHdUVs
         uDk7htg3Snch5zWU5qcRYY9Eij3GDRfc3TPHW9959BPCyFrICvKDiTUJzCeRRRzvWwp4
         vO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867503; x=1791472303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lGZqpBatDhAwoairRyA5X+HxlguV3XafztM288Ex7w=;
        b=ygyDM2/tsBn2fwzf9CLSU+QwRueemaqdc+iQy7pe8k4/Pa3CiaoJn0VG+JrqRm/p+L
         k0+suGq2WcJ6cz2SsfYyGqfonOkgflghs+RuidtEMGz0cWDTmROlwbssZ9fW8z6nC6SI
         UsACts/vevD73Mnioh5XH2UYhM7rGNieI4JVAQGCFV8mJQ21YRyHyvhaMnfigngYdBmm
         6XHeFoNYTDg/cXxs6nBV3tXGuSicW1itCX8b6/yKImCCrDcNzLfWJrT+yS0vxPQZR5MO
         xrIyg24IdxNBo6gnewVXjA4lk4dsCd5DyN0QV1tIbThVSVNXCLlQJ0jodWRidsCFQDQk
         sI7Q==
X-Gm-Message-State: AFuF++lL2alyI5+Qp6ZBPLNQSZYfBGYAsR17a5Thjg1JdAFwPmjK/PLl
	4g5TtTIJC8RNzLUhLMIj80l9PJ/NF84VmqCn0oa/XeMW5QppYgPTtcb7dOJLV012wCbrCruUyPc
	uVJKD53Sb+W8Qk578/EmfjnzGZplBR22OByI0RY4h+POF1D9/dHECTrfrn/2OdnQP
X-Gm-Gg: AYBFou1Zn9pQWkO8vlAGt/wDzrpqCMiGqM8Jm5eaP+tmtiBZU13if57FslixUoHVKaP
	AgHq5rsxU4UqoQE32NWWLQfYlLjaBI8Cq/lSsyvI3o23qh30gjSCnn2qub4MBnl80ffeo+Tv9h/
	JLCXmESLf4wbCrJEYvB0cUzwsbT/aRH3fY32Q3YCGTjbT5h0b7DnTlcqbfjrgAF5RyJxaZdwF0c
	dTO3Hwdco7xqcvWT74D2d54/orG8jYe/PNQH83LsbsskHJqGnYx71QFGirxijXiLg1m8ujU1AS6
	JcXAJnRYfk7Lc9eQ+mrNmef1ecRIH8OkLk3MnqrQ/fT3rz29qQ4xnYkghEBIr2AwqWUY7mrPf45
	EU/0LzO7TZFqQqGs3stRS3on8qPmAr77LIwo9ndIWrQO745suXKQiWNbY/EoOF0X2xooEjxGP8+
	QeX24bi8+oH4ja+8XGBF7D0q7CHjsIkWm31A==
X-Received: by 2002:a05:7022:370e:b0:14b:f56d:be2a with SMTP id a92af1059eb24-14d330b0eb1mr4226465c88.28.1790867503234;
        Thu, 01 Oct 2026 08:11:43 -0700 (PDT)
X-Received: by 2002:a05:7022:370e:b0:14b:f56d:be2a with SMTP id a92af1059eb24-14d330b0eb1mr4226443c88.28.1790867502436;
        Thu, 01 Oct 2026 08:11:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:41 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:14 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: ipq9574: add support to get watchdog
 bootstatus from IMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-4-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX08Vk18HjN1jH
 DJYq8K4qBSrYT8owGe9t2PYKiKmqxgJNM58ql4PXv5DfiOixx9ZekGQB8TT50czEjIUq0mmfcfR
 4r+vzTNKIS/4rdo6yjsnhI3wLPl8WqE=
X-Proofpoint-GUID: aVjrvnOXc7HV8OkvIrZ4g9jFEVk1KQz8
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe7830 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: aVjrvnOXc7HV8OkvIrZ4g9jFEVk1KQz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX1kTD/lR5L/bQ
 h1Ber8ifQJzoAdNJk6T/v0jjFHNJ6ipep/VY0c5wxshLlt6MfAZVrHjmdpvSUjFDT5tvHmRsx25
 50LFihHKB9tIRU8AWFm0zkqiPNoFUE1QFeh4v1H3aLhNG9/j56gsXoxTIjSqhznHgAuL6Xm6ZRg
 ReA6BNlzXBAFPUp2UGZwHZ1sYGlj5zBKjlyznGaJ4IOBWXLwRHbNXx/npv6ZuoBR+ooh8X2pU/X
 BK2WGOhpuow93+moynVgIEWeqC1kDa5PXmGaSEcbL73SRjL/QrooqbPpAfsVpgJ5+5T8BmCy5Ef
 4TvbrJwQQ2I1YyNlQgZb6zD9rFgQxVRd31qSPmjzCws85CfkKCDgBpgVI9oAhsDE5KRwnZ+P4Z9
 iua9UdnCZir7rqDiRLqTR85Awln/fomTMEenaeCkabJ72eb95iCsMUNmWI9jXCYk8hCajK3bpXg
 3rduqVrKZysg62q1UmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index f7cc6f274ca9..2156911876cc 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -760,8 +760,16 @@ usb_0_qmpphy: phy@7d000 {
 		sram@8600000 {
 			compatible = "qcom,ipq9574-imem", "mmio-sram";
 			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb3: usb@8af8800 {
@@ -854,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1


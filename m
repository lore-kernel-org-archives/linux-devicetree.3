Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C33A0B2E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705937; cv=none; b=NL9z1KDmIlJfSRjfha7xtHIQqW7N7l+1eXqOT/tyiOOmeDyUoVCt9PPAp5tes0WaxWZn8nn/uv+E2UYBJUvo9yjtuPMv+2tEYtE7+RlBomtMWUuSjgRVuaLQuiuUGYjuBbGir8SuNJpDVM9PxbL5ckQP3RNnopjdlAJP6P5wj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705937; c=relaxed/simple;
	bh=jYa8noxjSneEwKKI80YQTf17d+/soCGjTRTQKVVhOvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D2lBHaEzEAInNBEtPnX7Sb6zUD/q5+NE+hlizRFy9/dW6hMg5LnDKjFRdZR/bb6fQ/Ka/PDs2UradnmAqIGtR5wg8wiDatRGb8vvEYkz4Vw3dCkaiHShjgzqshbJGW79oyiFInxg0wGPuVdxDmvSdomK8NhyEGuqykO2LM+SmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deRkc+AV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UG+Ss+WK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deRkc+AV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UG+Ss+WK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCCfx51532095
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qP9CDOYQkD+
	vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=; b=deRkc+AV19InyKecLcv4OcuxQEu
	QbsCXLmCquqq01+uCexXJwwYt/HqYsaBJBViXCWWCfs0HKco3gzt2bZO6GfjKTIx
	WFMztMP8rWjZRGhHXECW2QBEFT0kXVOYXQLN8VJPbI/gjOEEvHCfksxqJqmvD6Wb
	cxTDsTIujEgbnNdifGW+7QJPJPdIdyaqBysNTKPaycq+rR5UJreR/Prmiv1dp1Jd
	2aP/fCpfvjMHTHzFy1eQ+P41yM5eCcKQJ3gWxGbclkXaalcZNABuTZz+3X930slr
	ZAYOli5Xzb+3uhvyMETkzoI2VkPk+CtXTNVKgMsxY1FjA+4RGfA/d4IsZJg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus2grc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:25:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f543bae3cso1748657b3a.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776705935; x=1777310735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP9CDOYQkD+vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=;
        b=UG+Ss+WKO5fI/eov+Mhj/1WD0/eNW9AO5hqdJwnawnHJsW+wyRN3cdE5G8HANWt7QU
         MqGH7yjl5KV+MnXPQIsgyiISl4ZbiL7IbzOmcW7F3Pllz2iJKA17CjXmmV9jyvKaqwrj
         q/LFx5P7nyQ1hF39xHHvbZK16v+CKCaSVcK0ipK28N+GIRc/+nbySPLF/XiZdIp2skXd
         qtp9Nz8QQyo3gdp2bDcG2ShtrIG6olnzre8X/++eWsx/0MlmMFy5AXWRLtdZbig1mMW/
         sOLQktvsMn5bJvceHJ7T9i2Wv0+rhLDybqifp1u76Sul/9PiBg9dP5OS9xFI2gz49yyK
         bOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776705935; x=1777310735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qP9CDOYQkD+vF2e9GMfCjC7F4Q0LIbeSmlR0MgdLJK4=;
        b=SDI1hbAbLcH1XGdjsB7bqDjU5YmyYyVxrey8lFInYJq/sOI5fqRTE4PUumUwk+55Vq
         31pZqSuL8h44W4puFkZtTon46jEPaCuHVydLusVJ8AngkB4ZEbhUpX6AaeCtbM2N0nvQ
         uXWcS0ifO5jQ2olsbhn8w/7hYJXjX0NWdwdoWVsbiTXPCzlug6UwLbuQD8xxGJ0nZHxh
         WgA8Za63CRQmxlvBU84QKJ+gUgZ3uIjNCKLNZp86x8pphrKfFAHXXk1bDf161giWM34Y
         SbNifP8XBkzEwErA+cijRpswDH/YEhNbdIOfFelBwBebzNwn4kBSGeCI5aEG0r3v5cgC
         8Ehg==
X-Forwarded-Encrypted: i=1; AFNElJ+PYPKS6HFipwGmCbgdhZ+1Np+fuMkLK+NLZ1K+FYeoPCe4uBXqyruODobTT+h+nU+zfCWQBHfszqM3@vger.kernel.org
X-Gm-Message-State: AOJu0YzjLnkM6BXWoB5bkPb1c5i3yOuh3dQjSIj0aHVeskVYQSyigQAb
	3UTZay7kKXGHcvWYr9SluhhyG4TXMN8pZcmv4jqRfviyehiv2wQGwzsQBQ51HXkEge0Gxxy1WVJ
	P8mVZt/aHs8aoMAraAZrdBbvkQZC9dLBfkuEZhSMm4JX/XvzhNcKXKZm+7Mk2j+0W
X-Gm-Gg: AeBDiesJWggKXnUgY0j3mNYUbNiJtFfbibY3s2FjroSTYZQ6E/Zk2smmD4v3IiMZK+D
	f3R2jMq7Dkzmuyq7ARq63l8fAUk+g3qi80oONb/GPFBrO+CVBT4kC5kntzLhNKALvf7HiUbj3aZ
	1g1OhAFYb8mTIMtRJVWGlbNMY/IqS1mvAXCWhbDvXbkbjzJ+hfVa0SRJAJ33zW/ZG8+x+tAZXiR
	Vojj8iY5pYxzmzm/QZXSE4ej/nOZ3IN93DnBsbbGsiBb7+BEIsEnkXUZMurcuZ2VoOfDpEnKMtA
	2LqJmDiG2Iy5bE3K3KZy6Q+4p+lqVUtv1SAUTgAM7s5P4pexe59kp2aQkFkyAgRiXqTb5k2EzhF
	bcVThQZZT+AATsW0Z60/d1icldnmhwVvqH8nVCJrEfvmcNtRYaVl3xkS4ALiCxb0=
X-Received: by 2002:a05:6a00:be8:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-82f9a889558mr6565396b3a.33.1776705934276;
        Mon, 20 Apr 2026 10:25:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:be8:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-82f9a889558mr6565362b3a.33.1776705933634;
        Mon, 20 Apr 2026 10:25:33 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f94204ac8sm10217353b3a.0.2026.04.20.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:25:33 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 11/13] arm64: dts: qcom: sm8750: Add Display CRM device
Date: Mon, 20 Apr 2026 22:54:14 +0530
Message-Id: <20260420172414.4123379-1-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfX2Pu3CeibzIku
 S6h9Ok4B/lym4BrPZfoBryIYYNYZ+43R6pU1oZqY68+5m8wLyPERMgfHz9rQdLbPZ99Dt9pflqW
 5DZEjcZRknL8odtF8XsvPNboPAEHjnzEdQ1FXQonKV6s0+bGUsdF3lr4mmg2xKCGlfZ8pTnuLv4
 CGbUJD6SQdiLq4iEoGy2/r2POjLu3ao1r42B64aM2aY/P2i4k5VVZ+ANssfqSHcAgV+b1Un3Bam
 egJ/dlM9WU+mvPIszhowPJB48qZo6+25r9GhAlwS+gXCxFL6+/n6cNqhFnlTj1lhhJ9lfK0JNOY
 RqkMaNGF3o2Y5LNf4B6Ssu0gsvanickhR644pZn2n8mFN8BnpQ1JqDBZlEp/KCyjEJjCfPi/0GP
 Jn7sljAQmf+dBAJZCVQldY0zq8N6JygeX8bL6E0Vn+kxJqo6UV6kryPkWXXqpw1aKiUxiLyEN1K
 rS46dYxtWfCEvthNjFQ==
X-Proofpoint-GUID: Q25LEEs_Pyve5yAIXlK3cayWYzsDMwJU
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e6618f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LxRhXBDcLp6q28ypcw4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Q25LEEs_Pyve5yAIXlK3cayWYzsDMwJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

CESTA Resource Manager (CRM) device provides DRVs for global and local
resource voting. Add CRM device to vote for resources needed for display
subsytem.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..5d2c59f37015 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3436,6 +3436,22 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		disp_crm: crm@af21000 {
+			compatible = "qcom,sm8750-disp-crm";
+			label = "disp_crm";
+			reg = <0x0 0x0af21000 0x0 0x6000>,
+			      <0x0 0x0af29f00 0x0 0x100>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
+			qcom,sw-drv-ids = <0 1 2 3 4 5>;
+		};
+
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
-- 
2.34.1


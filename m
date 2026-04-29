Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025C38F25E
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444866; cv=none; b=DMUtBezlGNxfUiZ7gFApFlYYhaKRGqnMMtG8PsePszcimH7WJXZxRM1vzZ6m1AaIjOiYZriGOYqvMoxsv8YGA4ibmei0xrNAyIAHmcuQI83YnuJTQ4WrphYK72x8z4TFTwSCvN8roX/IBId1JQ7d2pBIpp5MIcGO9tmxNCOebiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444866; c=relaxed/simple;
	bh=hHpdZED3kG+CzgYU7SmExHEA4bKiC68AArVVEK+g8Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQZWkHtXt10nVgTwpI6z5pkK0NTR8xsUFelHB56VKLOg+GbzZkjrm5u3VZ8kJJCL5dIZ0gafAY/VObS7HpZhjNl7vMrW8OgluOr8rG2OGdBFjOyPsdNGWmuDrrgiTY9fV2R9Fo7lY0OQS1iOT4eGSaDqBc0OmLgHRDhmMerqIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP6mufPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/xjwA7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP6mufPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/xjwA7P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3eJox2984780
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVR1RjalhCJcUGKq5aZ/F84nDfEFINUYp7Owm0hTn60=; b=aP6mufPuT/XzheV6
	PsFKSsXiXiIT63dqLnKivVEZcbMS3APMZ6phWGZ1HHbPS1Ia2L1yK6AR/3uAauMx
	6NCCfTrVy48D+8G2Q08v/QinzuUSOPxX1DixouVPde69OSd7Q9DTqPpG2j/rivt4
	6/OyjgPdAI6EyeqBv5PMMupDkwyn8FdE7FS+S3JMSK6DNxBBCGLJUv6JZkcQVqWs
	FbI76dCJXSFbJFegp0DNgDKHGt3ajk/2VXyEVeRCWzvwvP/VMtZtYl8seS+/pYEv
	h+jGhPKirSmsghqn742jkzj6gagOJfScU73lYH4bEbiP7TWFsI/iuRoFm4WPCGhN
	UFrnhg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1tf8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso18594394a12.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444864; x=1778049664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVR1RjalhCJcUGKq5aZ/F84nDfEFINUYp7Owm0hTn60=;
        b=d/xjwA7PAOzOiihxvXFdEo8EeRwSNKoEyD9hXjsBo19aJW3uiYt4mcEt3xtA8XeUbm
         K6XiVXuwIupguJ/XO4F6UOzn+CzPAM8aJYAyVM4DNwjCgSvZSL/2oLMMO5Hu2XmZvTOV
         ooUgMsEjGGyeeFBH2rTvQOO/c/0MRRkDM89sAqUf/bJii2KA2PCIhthnJT9ndjQb+Px5
         QxLWIKe6Jsd/dZJxRXbAKaCvZjvTQeVtgt1Oa+LjaHz9OzEE9F4hXu9ivcfos/nMPsDO
         mXW7YgBxU6++EaAOgyMgbDwu3+yq3qOF6QJcwQH9xo2S/kFmKtWJ2lDL7Vj3izW6MBRU
         8dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444864; x=1778049664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVR1RjalhCJcUGKq5aZ/F84nDfEFINUYp7Owm0hTn60=;
        b=AupqXxFFpdJ0RTeuqdyGy26Gf2NyaSvlNrM2XTx/yyOxTSUWuRwvPBWtXEbaywado5
         HsBK3oNvyeTRr6VvFNUUntRiCWtg3ltp1YXBP4n/tgnuqRvxPiNA1JGHi5+eoAIKKePW
         HDHnBD0Z2c7P87gQupZFZmZjRAlOZgmxqMSkThqrOBxcEtdo6JUQ+4E4UKU+alDCT0qy
         cQPh21VBf79gvkCX1pRW2+b6cYsYwV2E4TG5ZxcqTQEEVkBO76VMJMfBGQm7n5EqGv0A
         INGETUZBebRyQwWNoV6bH/DOJUcSgB91Me/awSjf2YMiPZLLYR+ZbU5mDWIysR8KjZf+
         pp2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9cQPfZKEWn5i89RhpxtVZ9u+IUDx3UDAFCyfGPgBJRub0uqwwcDiwfaoGgQBhcNto+K7YM+m5/2Y8s@vger.kernel.org
X-Gm-Message-State: AOJu0YyCtUzE+4D/X/F/Rx8MQSVEYfqtQ0EewfcoNJ0FoXI+XU27xOzV
	WiGEvW4ZMrRmoOmQ9mMSeHB03i82sPjF2rFctqoEIHEkD8P+F+TM7u7ATEcf10XdS18Jye41dlG
	lALBGSB/FwGaHRomtwu/OBegkekNbrycsAK2dqaQO0fqiEQVgo0myZkM2jkI5vhkU
X-Gm-Gg: AeBDievHsnuBNIXS6IfYNlDeWs2cF8hmlA2Q01zz31VdE1fgQdr+mA6fSpMJYS040QH
	PGTcru8R7Ls47ulegmqfsOwtV4Tut1oLZrYXY7SVuzSks3zk3m8ED77N7kX1ZpXVq295W5w6O75
	xaZPDx9/qgcCHZSTtQbez/xyw9lzFEFXuJqa8Eg55Lu5iAzumsv6q8Tx6V162fmAeqpBH3igIYZ
	IljUNPOp4QaRBMryEmHWiJIImnkzWz8ihJ3as77A5d8OKCBA37SvHgE/x61ye5UvFyu8EMTBcjb
	k++RRZfbOGESLgPLgYoTUv6DiFwq6xtRFUn/xFnwm4lrmvmjCflCPQF7Wq07aimekPOGb2z/meZ
	YTpyPQc2xsIiB19Nsg7VZbDSUtDcwBg0dyB/PhUiKkYkFbXiQFAvznqrmLLc=
X-Received: by 2002:a05:6a00:3686:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-834dd913b2emr6517294b3a.0.1777444863956;
        Tue, 28 Apr 2026 23:41:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-834dd913b2emr6517264b3a.0.1777444863475;
        Tue, 28 Apr 2026 23:41:03 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:41:03 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:10:40 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: kodiak: allow mode-switch events
 to reach the QMP Combo PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak_v2-v2-1-c3a703cc30eb@oss.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=654;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Zr1RSWzQ8TOIe2WIC5gCEH/PYD4EGtkkCpy/OpDeGHE=;
 b=+PV8Q50bTwQwudj/B2J83617iFOg1niRj1iHnDb3YOFWw3L8AjUo331nGV0PxD/G0mQ0mRfkZ
 wDz7peewoRnABIJim+55oZbonnZW1U5WiIQN5bnLdLcQ2v0u+tJ4EBA
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: NYGzF01ELH2qbvYD5yGKo4I0j1iEeQn3
X-Proofpoint-ORIG-GUID: NYGzF01ELH2qbvYD5yGKo4I0j1iEeQn3
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1a800 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6t0rsOXGyWROS5meZBEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX7ySwOhE3V9p0
 uUQ/tbIsAMakYoGXHxR1f0xvNChLNUezjWrxrpHMUkK4+pvcylJF3XdiDZrtU6zRPHzG5HQiIhl
 TiV+geLBfF5mCIcECnOH7m0TJvERi2DMqh4v0K9xr0KTxbrrCjVWwkbMwXG2sMOhudT6HVA4Oea
 PIS2J5sYeJ/b6EvZJVXZsKwdXcBTY5Wool26EjLaEa7PUGpIXNxaN3wfefXMUleD8L1kO0G048O
 yWHDm2fWuSqIluH4WBOWuEbsQr66sD62G5KuLdOdtg2X3DXHgDteW89Sq8AyJQl89K1rAoD2QPq
 zXxTCOSDcYBFROFGvrKzp9f4GbZ2VBVdhT7yZe52pJsWY+L6R10G5rYISn6Wuby21oZPr3KJzj5
 mRVFxmZhIcLK8W1sMS5GDaIVt0CryLKrTC/PXeTQy+tb5OAW0dbx+fYZAT2n9BAryi1R1XqsAIx
 TxpjF0EA0Li8AwtYj4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064

From: Mahadevan P <mahap@qti.qualcomm.com>

Allow mode-switch events to reach the QMP Combo PHY to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..96ac3656ab5a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4320,6 +4320,7 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			ports {

-- 
2.34.1


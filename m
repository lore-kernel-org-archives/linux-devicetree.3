Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A138AC9C
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766698; cv=none; b=kY1hY59BeQl73x722w8NJLXXdF10ClKlPqu0bbREb4NBUDXeUWGngPEB6paW6YrGpKHVPHHIeCKKifwXmbuqxi7435sQf6ZNAlzpiJUYGJsikaNdpfY3W2wWG/3tlgv2IkzrGVpCle1PZZS3etuXP2l6LPWIL5ANU61W+HMxLNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766698; c=relaxed/simple;
	bh=Qyws7gbwoJ7c3ZhvwwCtWaiedRgo9Ev2LjruL6ANdV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GvsOzl05xoYB/5TFDGf7RGCVtLTuGbok71NipNPX+27reLt4OnRNhWd2zUzw0ZPQJWsLuSY4UFN3Mxt4xgMqF30Qerkai8xZKYiy6DRQi+eOKhYNzlyVJiEnoFnli2mjU8yzfCPCeOVkJ7/WYOy0DG289w9Pb3ZvAsa6qMEJCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wwn4S987; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSUisT1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wwn4S987";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSUisT1q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2p7Wm3063427
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ir8G/BMDgVsCfnEzJpykKt
	cmZKiqz9uMWhBpl8ib1m4=; b=Wwn4S987VEmJJVblObJdboOhJIlTiyrMDTvA7z
	gKiBZYbzDALOWGFxwTT+Ld5mhyTHJTX16bq5eTR+BTRY8EZbTbgbR2arjn/+NpIi
	r7VKwsXjBpNNTC4rAG8NOVGZDuuJXs6Bmj1oO4bqf7+EYuu8lw40+sh3Sn4TDBAs
	/xvJtiLNBZ88K7Q0PaO8zpPB39QBhqkSiPe/xG1jJcQU4lCyxrIAGZCSmH6tLh/h
	v0zZuHZ4c81CblFleDMvmxiz6Dtt25iRnur2TDJIxCqkAjcvwMvifzIqFA2p/bZJ
	49GY4Q3o88+UGCpg+AlWwo+gOP0ZKbZ71bL3o8YTVhbxlcbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gka7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:38:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beb9002a00so31209575ad.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 20:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779766695; x=1780371495; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ir8G/BMDgVsCfnEzJpykKtcmZKiqz9uMWhBpl8ib1m4=;
        b=PSUisT1q2w3dN5oub7uUNREfpicHE1VDW3BKaFB8paE7ue4KJgTbJsI9M83vb0M8iI
         GerBWCUz+wITJIZCDeQBcOAw02Kx6gWaVferlbJkGz/KaNQhHwYkB57Qs7tpOLrsJm6W
         S9bD2wbIIGOAl4TN9BHiFhcoNBmunXDinERpp6o+n+OSTMDgd4dqPc5fuy1SsQm+uzsd
         W3adVUlW15XlIA4Cu93UNkWx3YJf2bpMou00iFj4MzDTDXGXl7DNiRl0w+VjzzzYkMAm
         YoUoVs5zadGRXliJuDkBDxzaJKKIFDGN4B504l+6EFwo18JL2y3P6Jf2E+8PI4gHwOgX
         SB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779766695; x=1780371495;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir8G/BMDgVsCfnEzJpykKtcmZKiqz9uMWhBpl8ib1m4=;
        b=eJFvhbJzm12HgbvArM/ptqnrxw15oSW3wDOO05QQDtw0jnLaM5S1VTBW/ML5jd2Mgt
         CUvWJZRWwKvbEY7yDMOylKvO6VdxQWlQtwj0zuuBQ8/3ss/5iTiZGuK18zmTahBAqJ97
         e0X44SifIVwY4u7SBcCJhGNrLIF0XgE/gQwCesZKi68loey+TyVcvh9xFqZep+nMnH+z
         yNRd4UzgEnTMSaZFYpZBN6/cZ6VZIcE2c83XKsJqEqRC0eeHC/TgT8oeGhEWP7G/Y6H5
         QMV3zUmymtcpygPlpW65avZERWkS72qfRTZCQBZXwSL48QvV0iBsarchfp6DPteXgIWD
         5q/w==
X-Forwarded-Encrypted: i=1; AFNElJ+9sE1/+UazraCKN0dR9g2xeURpGTry3BD2xyivWmptFu0M0hkA59tg8mN5ATmNnfyMGdRTqQ8qy5tT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ZwHKr4xfkGCB+QepR9o/7d2bLH81qibm3Gpn2EYSDGloKTt8
	ccrxyXB/cLBNhrpIsXBlgSQuyDs5yJ2EbaCIQEGwp7wJCcahxxGyJeFyG7pYsMc/PZNNyHZVwO3
	cEWgz2eGE1epcmJdj3zxdTDSJR8vaPC11lyCfJYqpohyqDYTGDGxdwROZx3W2jcUP
X-Gm-Gg: Acq92OHaRg74aT9AL+osGU4q1C/V06lfyiU8GfLy1CuhoIbbdKKq7gC0Y3ZB4i6YpEM
	G9L72SpIh6twD99sRR1qbKtrndaNirDV9doO2TAr10HHMD4kIFGXwbBzD69NKfZcCtvBCr3cCTh
	6S4f9z/gI0jKAppEL8jfia1KVPgEeRT2QmLdHKHUIAxYP1h5wKIzizh/jfHTnE/V5YHsEP81tQw
	ZQVi8VyTvrvOPxKI5iasPadXhMqfXq2Zsc2cAkRe8T3e+AXOFjuWQN6Z3AIYGLwnu5AvdBiNm+i
	Bk6dl/zhn7OriPrpg3M95O4sh2v2g2IgY3FLMmiQf355iDlaz194lMZF1FRFYVD98ZpMuXjRfz5
	S6z6+EntiGczYRtzIMpdJfmxa+SH1t+lNMsxL3+zIcf/JujyexGwm8S6buQTgIyqzaNjehai/J2
	nTd+cXo+YVW+XfAs21
X-Received: by 2002:a17:902:d4c4:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2beb0711965mr167998175ad.18.1779766695231;
        Mon, 25 May 2026 20:38:15 -0700 (PDT)
X-Received: by 2002:a17:902:d4c4:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2beb0711965mr167997855ad.18.1779766694773;
        Mon, 25 May 2026 20:38:14 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202902a6sm8792005a12.3.2026.05.25.20.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:38:14 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Tue, 26 May 2026 11:38:03 +0800
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Maili
 Platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJoVFWoC/yXMQQ5AMBBA0avIrDWhiUpcRSwYgxFaWkTSuLuq5
 Vv878GRZXJQJR4sXezY6IA8TQCnVo8kuA8GmUmVFbkUa8tLZ26xo1kjWJRYIJIiVcoBQrhZGvi
 O07r57c5uJjy+EzzPCy8Z/3t2AAAA
X-Change-ID: 20260512-mailbox-qcom-maili-7c5cce6e672f
To: Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779766691; l=1073;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=Qyws7gbwoJ7c3ZhvwwCtWaiedRgo9Ev2LjruL6ANdV0=;
 b=uNUcVVF5U69zQSUijGcutz8aePs1JyE4N/S8vgaT2gXz2QRG6XDjh2xj2Nu8kGaI+gIKQjoa8
 dOtAeJy4+6QBD4nA69RlWIWj2MNCP50pX1iW1xLlHqE+8C8HtsdWlkL
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-ORIG-GUID: c_lFwRK05OzxunlB3mB5krqBvHUd6LxM
X-Proofpoint-GUID: c_lFwRK05OzxunlB3mB5krqBvHUd6LxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAyOSBTYWx0ZWRfXz+QZLP/VMSQx
 YSd6y+xObgoOETOM3CPWRHVrsUycoHQ24DQw62DUTdg5Chw4xJMYdcmIcDhrGJTe0KtcuyqQZYp
 TYEZ9wVm+3cZoo2TeFSGKnd93qSlyIbn8cYR20axm/CPxIiUNimGbrortg/DTmWayndxyPc1A9A
 bHeFrfHn08imsVh37KTvhX7a/AATcwXjuVMQjSU0F7zXUDo6JitThLAy9p0WHeYuoE0olKME6B5
 CDvloE+JAKDP+jjp6QrJdQKi1P59upJoqeE35DM3ctibUMeBKG3BSUSNI8341Czh+KsapUeoc7N
 WbolptyTz3PXN672nuX7mJhsnCWZF//kFjxNJTlHwxylDNfSEpxrvk2AhZTVUXIYyDNmHb83NQO
 jgbYPNvY5vQLc9ELrWi/kuO17Wrecfs4Odh7oQKT0f+dBEavY0QkN1UjOSSls5DlDf4CHHm99gR
 uC49L1mGFO4K5muRE8w==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a1515a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hWsel0ni0XcR0EahnUEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260029

Document the Inter-Processor Communication Controller on the Qualcomm
Maili Platform, which will be used to route interrupts across various
subsystems found on the SoC.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f5c584cf2146..4b69a281971a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-ipcc
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
+          - qcom,maili-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-mailbox-qcom-maili-7c5cce6e672f

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


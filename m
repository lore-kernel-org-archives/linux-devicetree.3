Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50024E4C3
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142870; cv=none; b=VAcZXp1/zRgmZTWfSb2ySNPaOzWlWrrOZW+pf6Q5N687Ak0kz4HJ2eSaM31FbXCTlt0jnu3Ngb6TcZ9y3bwhQCU7M0wKcMDUgoC6Fx0XEUuYyN6J8tjfbqpBaJ10/8eNVsUtdqJmhBR5fc7XDV/YPMCyiZDeMsLIMYQAStAHnA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142870; c=relaxed/simple;
	bh=k/iLL6i9cSC1voO1ylu5486m6OrCS5p/BDSfTTakIQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbgjYyTpJrnUFFasZ1SvX9Pwz2w+Bbp16d2EbQpHISpcayeqiMc7Ow0wFVHxlR14vjI6QwJ+hjx0A+niMJUhJRw67MU9yGaHUvawne0VH7RjO5q5No6S6o6Wgu5J1/3OBi4nL+golY3nTAsDH8Xp9rFtqSs/MvVpOtdcBcdrnYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DycRsYL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZAQh0/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DycRsYL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZAQh0/O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBDDQ3157450
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6HQxjbDqFuXOrhbP1pIiGDugFED9NzDju7QMGKMoO8=; b=DycRsYL0sKiuQLhu
	tExU6NTVmWTFp2rblL0HvuAkuRhN7bxsYbVNWev+xqHIm/u0ubNkW4AL8ZTaxAbp
	61Xuft3Bmlpy3VbWXnG/J4qjA3CuAGqYUo1+5JPtuuIPEIVNW0/W2LpzFDyD1ezc
	wk6LhneHicE4nRwjcmBU0WmwAuJx2mI5MVkBbeHCPlOp9ot7DYCTzRxNMxYPafd2
	GyKrffOpG93XHzA7qBrCR9eVMm9chpzcfltOFvBpTpTT+7No98dh5nSpEs88r1Re
	MKFof1RkX97UUHQ9XSoEkRQc/2WUIKJM3IfC1kgjsNhi9BRPtqnxmrjXWNWeTqZT
	U0fomw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b920m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:01:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b465bf993cso13018685ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142866; x=1776747666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6HQxjbDqFuXOrhbP1pIiGDugFED9NzDju7QMGKMoO8=;
        b=cZAQh0/OJ/PbQtv5F3KtB6Dn3Q2ptLUbEjsuawqtIcQUo2UP/5M7sFH8FIPHN2BMaf
         Nw3KKGHity2EXyxbLKLfClD0glL8eSVJcpMMptP/quAlf0rYOvgBdARm/DNOtN3PLTuP
         2fVQvPB8SI51L2LdAOqreMLlbRlgJs33V0Uzxrbr+4+QXJZHf6XFDQLAWbOPzqKyFRIl
         29MqnRfb54k3PEng3m9oNfyb7XduiwFKsVfJL3vFrHaLzUgcCLUuseHWQMZjsxHdcPe7
         /XRPBkq3aEWfy0Vb8RIPH5wdPJmSGGNXZx8TCSPDjnekJ0ZudeKF+4jreRLDmNwgKbLe
         haJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142866; x=1776747666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6HQxjbDqFuXOrhbP1pIiGDugFED9NzDju7QMGKMoO8=;
        b=GDC3ECgN+7Ht6xM22JvTdvkYGQzsQDBZ9U8tJzLOmdAhv5OuWN3lkXmN+J/I7s9oBu
         l2NKivFWHRo+O4VZhjsmUIoQRfEaJpqBILU3w3Iz6kVHj3XS6cw8nJ5AlJFF0V5GUfCt
         VEsh2vAKi1zsfNoEpyj+1BSsJcx1unAAXDPKzSGPwrZ7MHzM14xdEAbzXXgh8XfPGYcE
         xNoPp7dK49m4DqyhOCzEuHTksSweUSEGenLxqaPrIePPxvsc8d0Hp7TA9WBJxF2gpWaR
         ryM7XIdYTF9okHAaJ6rWayeNATlGKI5+nf9QrxoCQ66zVzrjwT/Rxjvff0jg3ZSX55bc
         bAFA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZCnZehG05nXJkkKk1/UhfMdMX2Q/LWTfnSOAp9zoVAAUCwMESNvvxLpTKxHDyTdCTBiNnQ5NLert0@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVx7VYLb0brPwJhHAxI22ScO8yK5mOpFn0iBoDHYHESRWcgMq
	chQtzBiKrRQbqGYbGuoVhyyAwTlj/SfnAZdtVBGobFpuZnba53oHeu9lQAwSdH0C4QCbmaoSSi/
	X0nurHQymqRXCaW4z9Km1HOYS0ciTTG3FHMTq+OrXauS1eDrK0/dm4qToovzshd41pS6jsaxG
X-Gm-Gg: AeBDievodVRrYNuUEKdQbta54HvhenV1+LMQ01D0c5urhgNoWm+yoJaUiEYu+Ae8r2B
	AZpZ4XPrRD6URKct4vjCb5blaEqkPeltMTRJHJDKc+f3C1IKT7IrZYeEk1ykWu+632z7uETjlcm
	p90+mGnVzrGtCC/gz/KN61hPQ+xoW3wcdrmh6RkpALRtOP/r5OQgiHWV/V0twg4C/dsKRparJaR
	rpSCC7pixUDoghMyqEL99jZ5ti6Z7s3amrP6V74m6+W4+M2VjKq4ves9raPEJqaZ2UTtz3r2+iv
	hOLm3UVIS9lyArCKqUltlZjeEOq4/MXgOIZ9yF2GHgdBWk5symjnKF5ckNJi5j1wO+d4vx8MiFX
	r8yjvapJNf1vkktj5mQ9AnbIkZVqKgEc+trdVixudEZDVMKHzziXo8Ws=
X-Received: by 2002:a17:903:acb:b0:2b2:4eec:980b with SMTP id d9443c01a7336-2b2d5940ec9mr167893255ad.7.1776142866281;
        Mon, 13 Apr 2026 22:01:06 -0700 (PDT)
X-Received: by 2002:a17:903:acb:b0:2b2:4eec:980b with SMTP id d9443c01a7336-2b2d5940ec9mr167892785ad.7.1776142865748;
        Mon, 13 Apr 2026 22:01:05 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:01:05 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:02 +0530
Subject: [PATCH 06/11] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=1298;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=k/iLL6i9cSC1voO1ylu5486m6OrCS5p/BDSfTTakIQI=;
 b=IDdYjVDuPd+/LIcDpu0hs7fw68aCaSf03QnL4XqN5BY6zxcLwqtD/gxA7DiQ6KxUkJXTgnuW0
 jr1xLST8M7hCVpscA3WPXDA5mCtM9B4AJB0TyCukzzaeACVFzkD3gOX
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX2FltBsd738Yn
 50MKdofVIVrWW7vEUFdJj8UcwvCYeVi6QFSfx+10ePbm8Fy3G1T0dxpr9LhmRB7kj/1UTo29h14
 SpGMfkv5O1zDW1MGt3Td6VJULipO7xnuY3ohz8RwGLk92FCXQLc4CsGk2JpfeUtYfiToTJbQqZm
 /25EeRsJSZ5udyqSuohLSqXil84T9gDE0FbIuWWn46Iq/0PTTmv47nT1nfdLAuETwHofTq7lUuC
 AZGmBLrFMbmO57TwkvEYk8D+oRCZF9Z17gYxqGNyE+oClp7NqKJqC89m2pkNfRmZXAvabHe3+pc
 RMSNigxGy5UJXu+vmxozLpjvc5ysc7rcp1urjYmMnlUXJ7+wTHAQGG1M7QQdJqjgayPVeVlpY/W
 2+4FCy6bNtKn/+FX/xz8aNiZqA7/D7sTgKuUwAca2dZH8D/tNckdymxrH1FUK8P1h2TV6HnS3kK
 lTjWwLqHcQePsvoRmHw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69ddca13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PNRqqCm2f_5UG1uvsMzAkbS6-rbyzfO5
X-Proofpoint-GUID: PNRqqCm2f_5UG1uvsMzAkbS6-rbyzfO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..bfd1e762c38e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


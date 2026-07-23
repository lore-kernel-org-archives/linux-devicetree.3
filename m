Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD703546ED
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773842; cv=none; b=Upc8T+mVwnZe0kenJBw5Ev/zmMgXoNNJuk2y/skWuar1r0XUYdTHsHmXnWZjETyQ9NMFQdHy/rYnhtOe5EdScHp+ihRzryuvCJnBRSCBfQ/czjXhtftwwJWbt5cNpa1VwYnKho2G3zrxkt51YBmOVD2wK964uoylV7/FNhC2IzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773842; c=relaxed/simple;
	bh=hNJNcXrNH9t/WVgtwP4qKBm+72KdIBYy832AI6C7B9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DqQPkkuZjG5xU4J4A8THYPV/Kd9yu+nZOqhVv8VvvxxjLkvobmq6/BNInpGV1ECgg5EAqtk0dcFSwUoNi+XA5NUGmxU6t2NSw+/1dgdctvVrDJgQcIxOJpluuIrFY4n6+r2u8JogH2/KaRdJFEgYMqqURigzTk3GPKWI0k+IJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOMWGSUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcfkHMJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOMWGSUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcfkHMJW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WmNQ2140988
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=; b=JOMWGSUFiOR1AoHc
	jqDK/P5BgAmRf4CTUXacXxHt2o1/4czG2SNLEAm+4Ve82GUzzVPE09ukH+bVUfWQ
	pC/6fhncGEOMUqekwxXzDV6tGz59BZ3oNfqRC/BfeDuvwem2rRQvqqkfrdlcgbeJ
	qZcIkDZwNC/1/MBXs4bQ3LKWqVq0ez0kfFl5JZXbJe6MLqKu6qZ10CCK4FR7Ym76
	+YsL4SaSwNcwFA9cIQnwZY21BPtsb6X6VkjORIl5Zm/OfO9wxK6zlE1+4hNmtwdQ
	qpKrKNVnJwJnA/T4MTcz6beqZ80hn9o+O3UEZxWqy5SgxRBdFro2xGzU9NhXczyq
	WEdNXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju22bx66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso4378125ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773832; x=1785378632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=;
        b=jcfkHMJWOpxqgfqHg9vIWXMs4dSohqzrgvnhdVBvqCiCOp4fYnuD04ptjj09oOTzH+
         apRXj60h2p2cWMv712HRoUxnd+MFSjCQu1F7S3WNjmKoFQnVnsB6B2XD1GSm4Ju9GO7l
         J/N4OjgnrcQ12arrsprpp3JuEQv7jQZb0nZCgzFLycla6ibzXFH0aAIVKUhM3XOi46JP
         FqfBqG6fFMyJjrfg3PGYvqeDkncstEIj7FFLp+lFV/YMG8FbYUNNIjRoM2VYK47+PJEE
         rYD34xPSyti8R8KpAhVqFZIxoJMn1xE4Cvm1xWJN0SRwdmW/GUpKrA0OvYrTB+8fVQZx
         D1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773832; x=1785378632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=;
        b=pFDMI0AJ+m35g05b0yzBReScVOcmOfVTP4LE0Vk7V+5bsX1o49SkMAMijtKr5/7V0+
         8jNwJ35X61/FOylfgBdFxvCo4RyPV0RDwicCcqwN36inz/CAygQJCDI6gIzz3VF3QeD6
         Gl5pMcadbYcky2mdEbcNHUMrPxPa8VkhqwdnhVpoE1Si132XepEhnNG6Kl1mFMBmgbwR
         qT8VR8FjOgcC63LDk2y6FulVrewzz/eMcTTl2UNU11uA9Fg9BnbuNHVCeQHkreK4g51r
         Mz0Tu81x7LthYtY7I79cspVYOQZEKAZqCazQLBsnWRaY0new2eRTWMp33/kj2FRm8Iha
         O9NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8cbVDmKIw5WgP2IU3ptpHAM1SOl2LJxMPIB3NZmUSZU2UsHr0Mluzd8M8dqn80GmSI2fDUkqoI8w9@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLd/r2kFiMIj6NgZEnIMp0XX2X/7XxI7WpRtlACxA7SNia6ZF
	iDm6bT0kRwjaE+Zqmgu2fHUe6LvFxsl+es4/ApDSqClLhtgIHKrZ76qcHMExBlzLGUFuVCMmI5I
	7qtap4HzO9vkVIEkM3B65r82s86K5t/LFsc5869c8R8u35VcNsF0N+sbyr6l4rgSg
X-Gm-Gg: AR+sD10g7R2TBHn2/xoCgFLtA/tvgIpxJFLQ49ANNxw0NmIbYMYqpJeZ91KWOO9vc0n
	f3xUtiG5W+Bguw/4BLZotYdd9FVOKafgvJqDQnoCAuBkRlQ0bdJZNJY4Y69/XBiyokPoOoqoAAc
	pboLI2dJKrOaWxAuzfx1XtgzYp/KRJX82ucDLhcZO2igcKJesmQHnCtCFxmQiwboPNQKdJ29XE5
	i5posOxrGuy7FfWy70dah5DX1P31/QpqSUuGo5iUYTpDSZXcUVkTEix4SuBcG0hTfv5DrrBD7Z7
	uPKEjxf0qYVXXGbCC9rGGVhM/HEUYaS9nQB4T6l8iM3be6xgZ5YfyPZ/eYtHveylBxaz7be3sTA
	fRAXLZqW4ELKYWLaPwlpvrD7KAbnUxgJVA2SnxfgU7NjdMzg=
X-Received: by 2002:a17:903:2444:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2cfa6c7206emr15351645ad.36.1784773831838;
        Wed, 22 Jul 2026 19:30:31 -0700 (PDT)
X-Received: by 2002:a17:903:2444:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2cfa6c7206emr15351325ad.36.1784773831387;
        Wed, 22 Jul 2026 19:30:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm13463980eec.0.2026.07.22.19.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:30 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:30:21 -0700
Subject: [PATCH v6 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-glymur_linkmode_0722-v6-4-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
In-Reply-To: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784773825; l=909;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=hNJNcXrNH9t/WVgtwP4qKBm+72KdIBYy832AI6C7B9Y=;
 b=S3uk7KDA0ZwRV+Te1UbFB0bnvHhyN9EvfnL21SzCM961skWCXtS/2yN5a432Owq9i1TXkFNJD
 DF47c9qtfydAlx3gTJahZRdEyORC3Z2ZO/tTyOkK67Bj1Zqzj5TQtCl
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a617cc8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A-Hq22lvr9pePbC5bZQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Zu0p5RUYJuNFWp3QDVcv6k8jN9jR7Y44
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX7s9e7VZBN7Q5
 qh2JOPG09QXO/5CjmWD7Qbv1cJSU5riHaqv4UijPzDEQTV8MjL7tgszeXJ4NtnzTC1YI538FJov
 rG9G2i/fdjkSNsBpiytIQ+B0MIBgWsk=
X-Proofpoint-ORIG-GUID: Zu0p5RUYJuNFWp3QDVcv6k8jN9jR7Y44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX40lXsMm6/YNc
 FUm89d/kDSQHwRI91ZNb3BrekTZgb8JIxb6N8unhMDJpxJISsxKKLGVR2eiyJn9zKU3pWAMQvd6
 aDYeu4sysLEGJsF8hxlRGri/QCEVPvMxyoFb2Q8qWHfSn+BEuFZ4CrRM+y3TRjCcPkVh1MRttRy
 QdUYDWNwY9CaCfzqDHO/rVWeABAn+2Wf5IcdBdMkerwNUDvnSqPBfI10Mp65+HNIpYw6LT0CD+R
 AwQ2Mv+D/6JxolkRGJ60E6IiOXd9i2BblYu05LEqVjlop1ZTc2rxp6x757MzYBTKX2WUsLUjxrQ
 oE6Q+PJ9KRX9Xc+XRZAO0EOLxFC2rCFGQ968TCfxzBwOxu4nE5bhsrTvVIaBKMcSyPMustESRnd
 NrbXKdAGFpcovw5poJrkxhnj+gnYT086xmISc/kV+iLfdWlLqANKUXa9sUBENBJHhPCKfphcrti
 hA/LE+UTTRLStujwARg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..0aae613a33ad 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,11 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1


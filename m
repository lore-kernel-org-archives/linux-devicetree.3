Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E1D2EEE89
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713204; cv=none; b=krmkUPCN04hNZ+JgeRyXK3Rh2oFccB7TRbVdW5/XfWCfol/bL8grArCc72p2hUV2arUxFQArOYMW0jPnySfBZN/+CWMRCLukQTQJFR33BEDn0/a0Ha5DP7+KMWbJ9PjruWFnFZ4++4bc8cS2fvv7EIOMCdowMr1MJcPoLvuXMkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713204; c=relaxed/simple;
	bh=emcqKjjA8YxvBvQ2yvAyxulwp8CUcuixa8oCnAus4Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrUYbdDZDMaaJqIv8PwlMv0PpLbYUXEqliibuit6G6CWOFgnGEFuuy+LkynVtJYntVyxawLfW25xvjTLQawiMLdUc9H34z5m8k93FhjWh2AaTZO1ZO8DRJLKBLSrfZ964FT7MbeRRIKfvItPmDjH5oRZQtoIlIP8ZQS/V+jn0QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+XVerus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbMegRfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+XVerus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbMegRfM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q06fDl3469594
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poT/h+sB0f7nJwmC2wll9lgofjFV0r2P1FQJn/NzcAA=; b=f+XVerusmTIaVlOK
	vBEoqODI0zkFprH+eDIU5HCNf5SnQOgiAlcDqQ4sZz2zkel2FwgPWqORtCAh2Qx6
	YAwpOyGaFiNAoilIM2I5lZxRmqPtfn3hvWT4pBDyPVJhH1i0kh89S0cu6bl1zQUz
	1KJprbGp1mBDXMKASqPu7mJMkqOifgvOOisUdXl3bVnsyjM7vQZKR5wQseKWaNYU
	H90FlnEuaM7rr0oj90AUnnfv09lhCu5c4ZzMg8iSdmcycLh0RszORg0yyRhwegni
	BHzokS7kIZBtQQTAKu0xdYFQ/YQBgXlIULWKSG69zJ9uZFJAYVHYwFV0uCHi7rw2
	quxMcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bkuay1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so987571a12.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713197; x=1788317997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poT/h+sB0f7nJwmC2wll9lgofjFV0r2P1FQJn/NzcAA=;
        b=DbMegRfMf0px6RWFzQnpocIaEO0t92nZmcLHpuocl9t2dg8FeEMgXP/8pbeDuZewl/
         s1WI/x0b4l9s9ImE3lDgbroP05wsApkAc0jcCFQn6Zx/4Bs4rTeE6X5tmN1OhY9khNUA
         sEXFXKxj1XyxL5zHNaNH5fZMcPR28TS4gUfJoDmxNKeJvuEvPj8Cz+i6Md3QTSpIUKVA
         RtZtl5YoR34NNIHg5uu8RN1NwbZ+M5RYiHZI/r8PYxen+aawTWIJgVwxGPuZ3D28an0m
         BGtKNGF1ikFcD1keP/eGlF2Fq08Z8kaMzgLWUchxbjbN4QRQheJN1NyzK4YkKANK+rsb
         dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713197; x=1788317997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poT/h+sB0f7nJwmC2wll9lgofjFV0r2P1FQJn/NzcAA=;
        b=rU4Z5oyViJEAQxAnMIXfu/FPhpES9+GxLmjr/L//cesEK7N87QTlqFhOxRT27iLb7l
         MyPURtx4UjrZPuTJBllQXSFJIHoavhRJOOz7liGjCuHxkjo1ggcfkNFdQ+rj2GgJNZ5T
         W8h1WnuJi4YT9jRBeausC6PceJLoKrIi4VNSRtl27ny4yCIpz/vFtqnjOrUwpiWT2ynP
         d3/tDmgXmk00XZpB0Tauv6rV/YrBcxZ07LkKTTJbuSoveVHMQFvSA12JnoF7wJgdi7Pt
         Wx7zvgwGsPCUFSA28EYHrDn/IO4PRJAMpWMatchvkHJIdcSvPwbO/KKPdwCngiSWpDYq
         11VA==
X-Forwarded-Encrypted: i=1; AHgh+RrI8ShG7Aq+hoJw8kgBHYkw+QHD2DRiEi8AfLEXGU9HVtrBgv3kpGN98g+nFVHiRZc3e3yG7hLtXpz5@vger.kernel.org
X-Gm-Message-State: AFuF++kkKnCbcfP8foZ5DSK4bd8dfOy8nRWD61JoscczIS0aDNCMNeEW
	AwEFXiO9fUv/N2nYWrwPWykUC49/k6CYrPXtUp3Ar7jId7YlDsAwA4kLA/xUkeBY7tE8iC2GVk8
	JF4BHT6AUO5Yfmk2BxR+OieQ+9uSGeVZtZOHeX7xCgLoxGoZrjMmKdu7cTWKzJ0r3
X-Gm-Gg: AR+sD12rcSDLXcZY6ALh89sMUccTiTcWFZnmJSoU2B1Mvy6S+H2SFsLKlR46ckl1hYV
	Fwx6S866YrQiuLjHQ1lCSmxgsXeBCj4eLqrxDd5u7n+8FzKOQroeYg3CmpMXY9WXPwWiATAFW1H
	qdnIVFMvtkgNan8+CaMMCtxyP0gNZu4YXrdqcQQ913zxsM8UCSGNvs6VB71ej+zLgyubz/mwrue
	GSrTVmpa0ry0B2qigBhepySz1+LUHDo2neC7LelG92lssic5KXZICCh3WPUDdFJk5AJBtmrpi20
	ZKlytIT1grCOqWmRh3BW7jtwRc/ARXLG9mIzN4Ukn2TUAP5K2M2Bkr6jlHxt/Jept0leOseho18
	0a/wRIwsgjkUgVQSaDlyv3uauGOp/+kOI4kd2q4qOYp+U+u0=
X-Received: by 2002:a05:6a20:a110:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cf7674c005mr4995084637.7.1787713197372;
        Tue, 25 Aug 2026 19:59:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:a110:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cf7674c005mr4995042637.7.1787713196950;
        Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:24 -0700
Subject: [PATCH v10 5/5] arm64: defconfig: Enable QMP PCIe Multi-PHY driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-5-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=720;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=emcqKjjA8YxvBvQ2yvAyxulwp8CUcuixa8oCnAus4Mw=;
 b=/E/5MDBf/jPAlWuaAkTIKYYWKy32h58F5KHxUpJ1lzRwwF7IPTfb+nnJGsBLeJSNUhVAsyC61
 9OV0pCAZ+CnAlrh8BQkiiYPmt/oPjirg0ZSABziTPFBvxICv1erxXwC
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: ofcGdxWXdS-9ZHAIWo_6opFnbZf1CISt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfXwfqDAzbf1vGW
 esa/4FIiajTns/EuBgI8VVWGUNCoThBuaeI2dgyevEetdZxz0bFDp/veGwZwrAJFrrcTFLzkmD7
 InK/Q5y9IHZfmHYlJirNNGqahGI/0XA=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8e56ae cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VM4cYrm8JDUZXJ7KupMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ofcGdxWXdS-9ZHAIWo_6opFnbZf1CISt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX16/INw3ZHn9S
 yknPxcxlUUw+7i7eg5AlwSKaHj74njdJ7zcK+LSZEoIHOcHakZHuUpWjmsOETSHozXy4reQJsmf
 R25NTCW1hKMf1lrpYmOITPqGKG7HZgPuny6Pssbi/xt5Pga6eq9f5b03goGUnZrpgyHN/lXkJa9
 2aecTeqxOMC7GOk3LU/Jac+o8u1c7Ab9AgwndcROICvuqP9tuFEihwkPVaT+rN23DyloRb/oTNg
 kHKUJvtx68TU93I6zrwPMvyxcU5l5zcI/pqlVj0U/tPccFW46sBZMpZa9qRjUf7iRgMSnsYEbsy
 3wfWwo328x5csjQApBz7hyYQ27eGCm+UHgJV/A0SO8lCtnUDoNVP0IRZy+2uF9mWThBb1Xfdusd
 QMt73mF1QyT0OQNQ8l6TRG/uSuX5AOHi3Kc/bg5bP88xNe1wL0pYJJhFy4teXP0Nb7QsMFLn64q
 Aa45eMq5/QszaY8VJyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260022

Enable CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY as a module to support the
shared PCIe3 PHY used by PCIe3a and PCIe3b on the Qualcomm Glymur
SoC.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..3f3e68de35f2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1778,6 +1778,7 @@ CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
+CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m

-- 
2.34.1


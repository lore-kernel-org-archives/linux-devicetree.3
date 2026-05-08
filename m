Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E437833CE86
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218474; cv=none; b=cR3yux0KzmpaTKsITbzgiu/evX/JsR9RR6Dx3ZVfMzTKOkz6bFSlZssaO2ImL5H/KFWcK+GvwCWFsVROxAnNcc+rK7gP1pol7lt/m3Jbxhgn2r2MfAT5CQCsK6S737KVL9bVVs0/MHAIky82iRVhxGxTfp3h80aF4yXgHpJEZ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218474; c=relaxed/simple;
	bh=P6UKMocR4t2966bw0ZQAEL6z9/tgVpl1rC/81XwUpSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqverMACqbJZPEd3DGSt/Uz8uuiAFTsZ1eBpg39XD+UYrqbAPcYQ4a+jm/co7Xgw52lO2VChNZFcGgDCnCN9GIDox21nbbTboKqTsaT0AOISnidDcqGqn+/f1FM5H7+k0tabxE3fN9l52uLzH3pI1mEH7thQ7MaVsv7Y0xWZcG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3+cDglE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lq6XsRei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3+cDglE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lq6XsRei"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484a21t1417593
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 05:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCE3dWBeUPsD5YNH+fQ7E0WRz+CC11CQijcVgeFRO9w=; b=P3+cDglE1cLPdPxC
	aILUJm0vSmlx/Q+QL2WxR14v1pDHcUyCfZTSkm1+UH1jGrK4WRla5D9cwxiGResk
	saDqgob8xs0P3ly6zPuPNxev1gPDDBpa/sF5IdL0/4/hesaEWWnHaQ6tKpI8F/8Y
	V1XFlacX9REXxh6SouWvGbKr6YUx2g6eppIS6/z0G3KURfDpFbJKBiaZsvSsTiLA
	GURsmOnRzrldFrgEK4HdHP2PaCFgyxOImsnENDsgG/ZTcjI9H+W4K3XCfkqu6+kA
	SpsAU4l1GGT+InM4HXfVLMQspbvMWkGj3jk+QQyseKbl34lwBJxFm0bDE+nO9LhO
	4GRgDA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhj0dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:34:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f525565b33so2182055eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218472; x=1778823272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCE3dWBeUPsD5YNH+fQ7E0WRz+CC11CQijcVgeFRO9w=;
        b=Lq6XsReiIzLZDtYK11EtLqzivTIdg6xXhY/Xsfb9wtvv4IGEHKOnkX8RVv9GIBNONr
         Gt7t01EU7df76yFT0DN5cc9vpV9z+OWq4yybDEq9NhwNBO9ghSlys9hXNLTY6DTZsDbX
         FEO4XwXCa+CUvjdissaSBtGBPfLHkCsUMLADfdgdfWM2DfUzB7s2h/KrQgmpuI2FO/Z1
         kNwdHH1Y9tvJObE7pKFl5oAfMVDmx04sB2B68TPuuaaYVAciPlbtLpkqT09Lp/U0ZIAD
         O4LjQ9L+NZ7hvJpJVdI6RV8RhO6UL1Z0YoMbefY3FtgKxQx9c6IQg0t64PYJiynk3U1F
         /j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218472; x=1778823272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCE3dWBeUPsD5YNH+fQ7E0WRz+CC11CQijcVgeFRO9w=;
        b=kVQQF7d+ZArg1Cx6rqLzfkn7GOPLOSyHxPTxxdAR2/EJfy6kH5y/QJpES9ODC+RH/6
         +XgXvinupFCKXPw0/69UsHr71J5YIHTQxfQdd8WiSISD6yQ0pyJ5pNOGiwH/J07bqNya
         6OqGUfPoEllfDlL/6HrTZWXPCgg5VkkwjH/lN6PNJGIrCzpz4xmxEHDQrpHq6i85yqxG
         oI62u3nWx/npUjL/4sAS0ZGZEzQ9yZgV+TqJKe/CH7CAYzhngrkOsgg6F99Bda3PFw53
         zvGC7TUmoLfvnV5Jt8pn0URCBpbDAynHHP3ewsLRlOqmwitQx2WtSaV/hmkErkfNhAn+
         pS7g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZY8DfjSIeJyhcfWno76cNaIbj9kiK3Rv6gUf5UNLniSxXh2uXOYKZDGJyoHuN5QT+sbONLFj0aUMT@vger.kernel.org
X-Gm-Message-State: AOJu0YxRzRPMh2QkadLjX0UpmHStuSzaRuQ8LioKpCB9loI7mCy1i/jC
	rIueL9Sy4v68uj3TKwOYEvlgfkPGooUElDgrelf39myV1o90PozAS/cP1uwBENhay1i8lqOEZyD
	hilpos3p9fYo0DhHxr4RCb0eDkCyw1r0sgzW+xo5JSQg4OE8g9oL3kjjBrcRGe6P0
X-Gm-Gg: Acq92OGtj6A61GcznA8GHYP4op3zFEhl2/gxLDvTbFEKDHnU+UDjcpCD2Sjlp8uu6mp
	PpMNWUhXqhq9Ln+DiefQwlBKEc9OSCMkQl53/qDoLkoxWZhLkzRSd4CigYAIkwWfdlkP/f41GEn
	yHZMY55Pt/r7TEMWdShLaktQGUwdj5PHxhEChEr62+r2LF8NvVL2Z4DrhBa5pMq6OWznzc5mX9M
	40vcWwp+rySDATmHs2Sb+GYQ6Lluti/ogzai93/6mKV8LIf2/xPEbM43YjJGiTeFrCf7Hd3U96t
	ynBtGpNiGPcRoV7W1NhAprggWme+JCZsXN2FWbDJmRWz3gWGjefVtNOz5J6cs03xiDyM9npn6zE
	zbmUZGICABVwapcIXW5J4yfixIUfZUUS0S+WrKpY53mVeBIryOQv2MEOzLI+T3IAqfNLfYs6pxA
	==
X-Received: by 2002:a05:7300:2322:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-2f55094d023mr4559526eec.27.1778218471650;
        Thu, 07 May 2026 22:34:31 -0700 (PDT)
X-Received: by 2002:a05:7300:2322:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-2f55094d023mr4559514eec.27.1778218471025;
        Thu, 07 May 2026 22:34:31 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:30 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:34:08 -0700
Subject: [PATCH 2/3] pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pm8010_gpio-v1-2-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=973;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=P6UKMocR4t2966bw0ZQAEL6z9/tgVpl1rC/81XwUpSw=;
 b=G3/fA+HD/IA51S19vxnOlH4vhhwKZO7RMqYQ9I/QJykTFRdFTxaVD84WgFv2geMd/TUmiPYOk
 CTYRhzf6WuCA1ATUirC/pO79b+nQA5aOwYOJh1mSl5NqxtS1FTxTU+G
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fd75e8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cw7ao898H97UX0_F1yYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XJ293U_PPAkiNMSAYyA_2932pOmZ_NTR
X-Proofpoint-ORIG-GUID: XJ293U_PPAkiNMSAYyA_2932pOmZ_NTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfX3Y7vo9Jf32rA
 fHyEPk+rbxZh7WVI/TdkaHxVpRc6rIe5G9EcTTiBivrFKnjbuDQD2i7x51oRu++TcebB0yeFAup
 wYLZPgRDGR0nQ4DDoHiPe37om0SX/0xMTvep1h7WmRLQrd9tZAq5EjB+QYhZClea1e0UqH5t9kM
 q7VzMZLcUwSJsy8FTEaUdf0VbnDDUNfLraR0mOj7IrwSyUOwcS/VcNLklMhEOXnF5uXjzRLuOOr
 QaWvXGQOQikoS6KlxrbHDPaZ3jSO29PTFzR02x3xpGutlk+/XOaSDD+3Rf8T5vA5FCrDy+arm6V
 w3nauACwOV1xubeiY2ggyrA3p0DhOEXqfdyIb8sVWdgnDpmcgcyWKmravAeEtqTALU52V6t6G1Y
 JXqs+ndV+9YsFnVOgcWRqn271WYj/QFYr/Ynuopsg24GL+lUsedJIqJOoe81HCEy+PVs0dHYL4O
 S5nYoMhjfVgk67bhnHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052

Add PM8010 GPIO support with its compatible string and match data.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d02d42513ebb..cdd61dae74cf 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1229,6 +1229,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm7550-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8010-gpio", .data = (void *) 2 },
 	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },

-- 
2.43.0


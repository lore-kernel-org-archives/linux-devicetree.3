Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F5B339362
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717764; cv=none; b=DS8mmyyLxCrNdNEitEJDXGR8lAZbC00wz5QTQi5hZLYxaqUqgaiRRN3gqaW4D0rTlfq1cZ1Op7Pn16jzYNZDbi2dFF8HY4kjbXrgdxRYYc3WLbK/Y40GAQ1XDiScJtMEks/1nkHMZwGUCzrcbhypmeXAz8unbD4PhXQTlpOOLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717764; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGh3U6uTWZlOD0JVKUOg1RTm7tY5WvdMCIKQtu4ty9pQkt1itdGKnhpkQwC1i24tkTiNSR/FaLLhrIQuJAV+ZVUfm1QJZiRaFKYrfZNYjp1rB1sM/3xuXo1ftIqyN4tzIiRLIM7m+quwR5BgrFb1PZQAnFc1Ku0TdcDdn2Ui9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEICjp4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8TsLDlq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEICjp4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8TsLDlq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9DkY0049574
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=EEICjp4XkYnjgv0H
	un5NyBCLr1P12n03QIiUdaNR3mmeWUGOCh+vEtk+WOLXcOJ/v9T6s3nRZcUBIeBZ
	79fe0e3sFf6BsfD7oLtDz81ZlJsp0iad1TSV36VZ6W1ajZ4VStXXqRG9/ctp6Ar+
	rJted6bVc5iwjoiBvmCAw81cxe6bmq5+szsOdYuAE4TYXuOcceW3NFZnIzwj9q0n
	d1FPqa47i7jGOxqwo0iaUm08ixEgAAHsbWRzYKDYwM85OQzgZ88ttP/nZ44XvIth
	VBhoWBib+yVmF5+T5Y/nTMHb4FcqwVsN8exc5c/bbywzwZ4sE9EI/4tnnKRgeHaD
	T3Tciw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228dek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso8344417a12.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717761; x=1785322561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=V8TsLDlq12HBQ02ZPRjoKQT4NCh/Sy6CLCWgduKbuhMHSHXxCN56g+cdVcXCReoPFt
         XQLDbD3x4KUjpNWTQPH0z6xLdk3PmsggGitPyNIVoUsPP97GtWjYduNPrH3q99mHvM7E
         NQOzgRQtiHnP4TtKclpCVKhzC7DDSxvduL48CJZYnPJJwCI2SfcI2kyOmHMXJRQkbjhz
         r+gjMJR/XuIfBUNmainY/lmBZr1mbzRqGLCMia2xX2Wug/uhs2xQYM6kSnSBZoD6jCMe
         RUEWI3LCkSk00r8ARZfK/WGPDJcOS5h65awd47vtj5puc18nlj1yuj8NHsunvjGri2Qz
         fVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717761; x=1785322561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=dhG7Fs9Q/bB7/3ILE73z1JLBJzPoHRkih9gJcda5hFhYUGPY4qjzBXZE145feDls+b
         orbQZG19T4syaa2iBoLMQuegPtAbwOSmfCMJlHPs7kI+tsQAQSLRQmkqBNymp0ABEJ1c
         U6uxBf+zRdnWtB+3TmJ68yUGaZaDpy4RPFhg2W7MeWPlcHIXbTZyb3tgv7mcAc/dfIs5
         hnd5Kld/asP5yePonJfk3g3PuxkAhOZ8DbEjJ8autysofRG11NF3NWrUXVhpLDo17KgU
         aN5+pNEgNmktxzP+ubwtPgB0xk+8taH7iqINiKXHfeoqwj0olIlvVUipTyIwCMgtEcPo
         Xqkw==
X-Forwarded-Encrypted: i=1; AHgh+RqIPwhuWrr9iFFyLtu1QQJoxKGXbQsGxYAURQE9MwmQ6oRrxJ6MF6i2sF/1UaS0cJBiQKjYxB79Jm6+@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNw9lTrkkgae7T/pHQ3SEGUdpdhz5qbrCJ1soWihL+qS+v4sC
	okjvUlJGzfsph3x1JLmlqu4lal1WFNr3gANLzSOrpi+KyqAdEzkutEJfKvruQMZOKgl2wy81O1S
	XdUoVGpXuTVOrlMQYLWBEi/KdqotRR3uDJwY8WWflJaYQby1UTuzo/rc2dOHmNOdh
X-Gm-Gg: AR+sD11NC2wztp6Ry5r18NmiInJQUtduSrPqjWG4zU3e7Bm/8jPDcaXNcw9yLRaeAzm
	VSgDJfz78Ii5wfRU2YfL1juB2P5qVZ2IFBL0y08JVccd8xmoPhOcger/unzDrOThaQaRICptpH3
	FCuNxI3o3OAI5ij27oyOvjm/lp+4I5om3YYc0E6YGb6UP80jchGLB0zabkzRI/yDptslnlUpZ6r
	bNAOmSpzOQUID56G8CuzoeGdeDMZQuooj4OSbev95sKlVvOIRctGEXKYoppB9mGS8b5hAP/i2o1
	/5IKnfJxIP0hU5sXwEH7bRas1g6DYVLWEUESguylY+Q/y3gLDDCkb+DBlubWMq3toOCTyBZs0k6
	Q96ZksWax9UOvQ99tVZCM00YL4QsmljNDsd7t3vB46LB8U9v5XzqXU5k/wIcZ+y0E
X-Received: by 2002:a05:6a21:3981:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c3ad963e16mr24826445637.35.1784717761398;
        Wed, 22 Jul 2026 03:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:3981:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c3ad963e16mr24826410637.35.1784717760971;
        Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:35 -0700
Subject: [PATCH v2 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-4-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=NFLWTbVTh4IHTBJoYgR12wz7y4DqfPucXMo1BJ8lU1UTevUy3Ci0Zrnzit7RmoIoXSjYpzSos
 HugaPr17I5dCkkUrk4ZMRvy1KObW4Xq+Fz+5ohUcAy+jIkFGAapQG0v
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60a1c2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _LHPIuw-eSQnDrz776W7DqPFBZwHjBeU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXw2Vcav29zEHA
 uEKdPD8QguA4t3e5KyuXJCtL2oGOCU0EVHxdpOu5MehJ0uNZh54YEQh8y24rH+TZBIfEWwXWKZR
 N42wYUjxMJOEriCIM2O56tUfDlIBVxk=
X-Proofpoint-ORIG-GUID: _LHPIuw-eSQnDrz776W7DqPFBZwHjBeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXw7ibtfnidcHV
 dIn9hqeq5/iDh2LDA6oqFNMrHX8YnWiVc/QNzwV2BLPon5mZ1csICpIZYP11fvcnER2bRL1nFPF
 lGFpKorsw+fjkwL9w3Zkmdr4Fmu2lEGwecsOmh9jbFxMkkAhQmwWS/fA/i2y+xBPNA/+FAFDBpy
 RaVbfjxPB0G+zXR1G+f2pqn0kSe7O6zxsse7JOcfPlO0V5dKO48AHogTyPEBkZHE3TqFyM/+9Hh
 U6axpbYGr7clXAtn54j48DosplLwhKLLuS4QrYHXcUSlAFdUGkAQY+C8kZFn282q7V81O652E1y
 pfh108ale+MMA9l6S3hp56N/6lCjMxpEBTV8xzW5DYN4AKala71moLzbjcZnPoeBLpmKB15Xc6l
 n6g/VC+KQLCN3Cj2gDnSP4tgV3J/uAVe52FQ9dvEPkIisJmZc2J3PlwIcdSOkcBsQIgdLpdk2xP
 KtId88xoGTk9oyihBgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C5386C13
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075157; cv=none; b=IPOauCVt76Smc/zi2JLH9GAn+3RzQ7P8BjxSGLJ65hUvUUpFyCHEiSkw+dTWkrJoABCqeinV4+rTjjyNuwVln5sjhqZrygzfIL62RfrX8ksmFADHiJ0uAvYJFNlWWzkVxcWy0jaQ/wrkb18ioJR9gddkGR4+sR9PRxvlDC430uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075157; c=relaxed/simple;
	bh=Pfha4C68zR+/bdEEvaPYiNDvDkuwpa6n1rETcsHa5Pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdSF5guZSMKEI2ike9Lh1ezkHKLpjHMQxXCAJl9zjTRd5+IRvhKK8pdFc1ff3CfHVvOXlDtGtedVBZDb9XWM9GSPPmB/elvhURzDJQP2/xCR2Zp/wMPHYmmtxlbE+9cGtazS1H6ZFthY+JyoJatLSWScdJH77/BV2538dSm9MfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFGWaWvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lk4SQSgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFGWaWvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lk4SQSgf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ej7R4061054
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc3+QlMM3uFkSoTosXVsY+aC1p4+Q9HAjtGMte4S82A=; b=kFGWaWvfOM8luwkW
	LwMloZnRF6P8XAEMiyQ2fW5IpfGrvx1NsI13sDzs+I+CdHCTINhY1GSEg0+/2lYc
	VRD23ALVbciCebM3aNtU/r31IuC5sppte/ilgPTvTxs8ZcQ+Hthoag0YlA6evG1/
	E693T0KwSWzFmIBZbKoJTrS5VT970slPASrV2UNrsBqauABCYX2wYtjHkOw/1pfK
	Qwq4RJ3HYpoBD63DhGGWTvzomT1oUI9ztywWBy5ShVX+eitrksd8n1MHYTmP43Yi
	IUVX+CkLh7vlhCItLIGafSdlcGsN812G/5FfcBEOlyI5bS1MxLzvHGrlgS0kQVqR
	0/0vbg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh17dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so8935584eec.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075152; x=1781679952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc3+QlMM3uFkSoTosXVsY+aC1p4+Q9HAjtGMte4S82A=;
        b=Lk4SQSgf/gzPxMNHR99EkTHA40vZU+4MFAE79eN/a95kTKJlNeQ+xOjpWkCtpQRNKA
         q3ySQiJ3v0TbbLcO5/bewb6nwOG+ayRUKSNd2pGzmuIb8a8oUC7K6dyhklfvNjmpi0gt
         6l9Yg824HLTVbzSKhT5H08gVe0ua9pHGWUxxLfHT7nFFcdxMhkLHBsZ9Sl8P1wCQ0wZW
         6UJwXdMFs5LnL3T+RHIGOVpMQ0gmdWb1AvHXUd4p5K/PAnA4Gu0x//3UB+bmjK/ObtfO
         6j6Ftf42ZUZHuC3dRNlcFQZWuz+LgpDU4gOR7Qf+QvUitKiaNm/aiGAASD13zoxAIzvc
         5U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075152; x=1781679952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xc3+QlMM3uFkSoTosXVsY+aC1p4+Q9HAjtGMte4S82A=;
        b=AEi4VoWhTJHIW5N5yKViWTrP8uYTp8EnScnWmQW9grZqnOcjPe1zycGzZ8emgBt8ET
         Czxjx81TiZXbLpkil23DJJzaXfIgLOq3OzboX58y/eS3n12+mWEfeLwRm6SgCYCw/Qfu
         vJPzhDRMQNIJiYJI3dcsynIndbH4/q8BtkLcozocwCAeq2fUz803DUurHQmG7hs2BAFx
         z68ejT3QbeiUd18sZEOrrAOiI1P/bd2TiBOuE4OjWuM/k9N/NlCgEpYCVHDzzzj5fK47
         SJIJM0Aq/SrQxvNtujLZFTexo8lUKQj+PpTy3kFMGnw/wIVZVi9/Pjx9ISW8/x5395wn
         nKew==
X-Forwarded-Encrypted: i=1; AFNElJ+PV+CnEDw+iCbWW48NFDPSaRAzhhEjDzUhTcoh+jK1F0UemkZ39cHLp+6yS6xCj2BOdOdpToXr9IyI@vger.kernel.org
X-Gm-Message-State: AOJu0YzCY7Aexihwn09X+gd16x6XfMs5H/UKlwleFfvRlFmdYZO7VsJ1
	UTdieoP8JnC3+lRV3rTQvNXmL6MSG4Op2McElvnhbaXFU027NA1uS6H6yVXuHaLFR2QOuHfhHsJ
	1LaTo4irp2BZvNdYVOxaRnFrW6AqNg1Fl+oB6+CQoZquagyh6kPFYQiba2LntNchF
X-Gm-Gg: Acq92OGPwoHsi1XHtJKCWu7Wv8Qwmdms3gBKAraBhx9N+08ttyae2mbjJYlI9QhHeeY
	GqjTAnuZ1hVqvGE+vA1Vel4sZ7aIawQ871FeoAmPm+RwbH6CFMp7NonCmDaqhhC/8chQkVzoFhG
	JBpMlqL+ybh5vWpMu7cGu/ETbFuoSzJYgDgbo0tYhDzXc1XMAgwyLWy2Zaw4R6BNTziE9cg06kQ
	CuaD7QQKSQha57FX5bs24JqdbrxMa4u5w42xGSmu6axWvP9s/hU89blGqU84slmf9PukqMoEDcD
	N+uV/MzyCYatKXCieQzOIcH7SwUNugkTNiAdvh3X9Bsf/LrNwH42KK8kE63oAN0xzPKY4DgO13A
	b77stlRXB91kBBNtxEJpMSIQMZ4ZCTiOFY1xvQerxch+9gz4IeRzc5U9I7PEOZTWS17a5ZxOcBb
	phjvpLFazK
X-Received: by 2002:a05:693c:2c94:b0:304:b14:ec53 with SMTP id 5a478bee46e88-3077b30eb24mr14278258eec.27.1781075151839;
        Wed, 10 Jun 2026 00:05:51 -0700 (PDT)
X-Received: by 2002:a05:693c:2c94:b0:304:b14:ec53 with SMTP id 5a478bee46e88-3077b30eb24mr14278224eec.27.1781075151246;
        Wed, 10 Jun 2026 00:05:51 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm22435926eec.30.2026.06.10.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:05:50 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 00:05:47 -0700
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075147; l=1044;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Pfha4C68zR+/bdEEvaPYiNDvDkuwpa6n1rETcsHa5Pg=;
 b=iuWdV9zzzVMAMsGBEbwooYpwVTpXyzeYsymsffVHBp7X5KaQH0m22iGoJTm1qb8iXuXHkNInq
 7UCcgvEj/8DD5Itbr5BTXQfMNg491avEnZEqfOWBB2S11Aswk814256
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NSBTYWx0ZWRfX0U2LI+V/MEWg
 LL7rBSLtiSR2rfLyYNv/2MCAebiVG9VAUl1JcsMBFWELzhPF/PTOqI4nCN7aWKSKyJi1ld47Epv
 ZtYriQRYRMDg0k5Xu51VxIeptVzminQ1PgWVRKTo2/2ds0VSddqW3v1319OpNOMyxtbZh3lXkOk
 HMAwmzTW+z3UCe+ghjk1vVnXY7PDpCnmi/aBstp5+23gFPMKXI3I3p991DFEe11uBhqGXoZ5UX2
 zYGjlvdfUrqfP34wRczOk6nEhdKI+bygk05ePtWL9zEobyigHXVv7of8v2N6/w12SLkQtsJa1ip
 Oxagq9zuEMZ91N7jaiyFb9rRrIdv3x+WPsqTcs3jxSqkfksZLC6ckYK9Twh5cXO8mQyyGoA4bwy
 AtwyE3FRg/1J1VDjwN8HQbBY1un/3TKdW9jcvxTG+CfIUgOEUzwglH2N19tagf8G6NZGBRFk10L
 i/LaDsxWz1rssU3I++w==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a290cd0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IexnuNYFraQ-YrH4PxgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: C6cSODq81qG9aWtQR40qphDhYcmICz0Z
X-Proofpoint-GUID: C6cSODq81qG9aWtQR40qphDhYcmICz0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100065

Add PMG1110 GPIO support with its compatible string and match data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d02d42513ebb..01f735ce65ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1261,6 +1261,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmg1110-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmh0101-gpio", .data = (void *)18 },
 	{ .compatible = "qcom,pmh0104-gpio", .data = (void *)8 },
 	{ .compatible = "qcom,pmh0110-gpio", .data = (void *)14 },

-- 
2.43.0


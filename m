Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797BE340A6A
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846225; cv=none; b=LQ20u32id7xGTdLMLM2Sb9oWPrfW7Ebyhoewxw0rou99D/gvEikT6Zipt6zLFdQ5G8L2Ie2NpLFa0x0JI1xASZFk926s5wca360LxSM2Rbojzz5tf1QAMTRL84ziPxPDHk8EFk3E2gn13JZ7AnKIaT6HiG2ceA7JdJRXMsTgc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846225; c=relaxed/simple;
	bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caeHwfu/0MHm8wOKVCVzS/OMyNkk2va0mXSPjGn9ZmXmUPmyvuEZrfl7GbClruCPGqhh65UtwXCcHg+HD+Gx8QG9kcl2eqP2yDd1kurJ8T4/11a5zNxm20KlBgIIMPhAOVJNYXxU1I7r5QEdYb+seKDtF6mh2R2oFXOC4sEald8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBgb0u9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejjPk3uj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBgb0u9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejjPk3uj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkiD42747572
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=; b=RBgb0u9Q3NWcNR1q
	fqduvcaEhgXaUT5tc5NwsCbXZfNsGyrursYZiJAapEhPgYQHLOpXuWQctT+WUpPA
	Zwq3c7OzDWnymEQGG3zVku22NqnGl+WTTCfrEIgwFV19uC8lVGz83SgOaYxEGAbc
	jcbVYNEkcoXhyrzroV9GMo4PnbWcBp5PN1aLrPpb2oGZQVEsuqqeoLB5NLD+MFOU
	l+VEzLKU/LeWzSqhHGplugqAh0qe+REfqAFx8LzCDpItFpcoOOII8bVmY6VS0yHt
	3X00bGyKVYey5XqpaEXWv87M9MqOfTiCanjDrkoBKY9mJg2DvXQoQQN3FWwXsqpY
	XjfZQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j910es0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c1f6c5559so87353eec.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846223; x=1783451023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=ejjPk3ujYn3nvUVAJhuKcEsxl537YJUzmDbgNKipovenGsFQmWlKfR/Dup+YX287IV
         VYnuUNHpB1O//i8+bYKT0e3MyO6VAKMoOLNo8PNHnUm5xbuWOjRIzBzaaMan/OsT9dzH
         IEPCqET8UTb339YXrgIIqxgjo3YpDe0mTRAXDqFfg4qJnPNV5cNUpx5pQwlt/wtK6Bk+
         VazPV/pFEGM/LivMTkfPsWh4viGRwHOFIMDe3wcR681ZXA3OHYzZ6JFCX37NOj7sHMPB
         3SmxPgBR4NiBGRWUWUrVTjcViNI0TZeofwebwIptxFdSZCUQdUz79WQuAB56QZM4mMKC
         sL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846223; x=1783451023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=h4xSB4Uo2UgjBv3GPWxMP8GWLzaq9Yk/zecKOHdoEZ8RbJN7kumsunm0EYRLxoRQH6
         4BL9B0BLa8VYt5aa3fRsaGQkU94FmBTTcma/aOkhWXr3+DP60w2LytpM/Olj1ew4HAnH
         pqIx0Jz8mOUQcmEzKMAx3DY3+sCLIslCjTNJriG6HBQX3BiI1GY7kol5BEgD821WPuiS
         YYahisAMHfN8XQvGKUWHe7T/O4ejEgOR9sNWI6mHJAH7c6ZNc5noYrbcSeaHCtQKXwlY
         dwYQqQg6/1RESfxQCQD6GKX0MQkzTUW9+wnomdvX7C6oxruCDBPR/QfBkteRxuIwFw3n
         AENQ==
X-Forwarded-Encrypted: i=1; AHgh+RpReGfnLa145PP7iFXiyKYtbpk48t7J1X3yP89mTc4LpwYCY5xXRIsfts4em8nEiMlXT1idpMNhUAwm@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmQtarsBW733iXGkyLMauntJyjNf2KPRgyznS+cwkUaSL9KIz
	SPGX0n1HqBq6U50MygTukavkEXg5z61dI1eZBleW/ti7oqvatOi3acgUMfJvIWzJi8LfNh/rcP0
	3/4K4YKtSt/NsnUnJSc9ZeBbuFAgK2l9vWKO9Epk0d7HrkJKfzoTkuKanDXS1dur4
X-Gm-Gg: AfdE7cmq3Bc3oPJcuH6Sbbay378Xo9dk/RIo+Y7t0slLgj+HpA8sdjRtZtcDWGn9GNX
	h56Yxp1Eap/G09ZQuJz39e9V6WObuVtPozFOw+unpohFLrG1VkrUyrJsX8TSmLh4dOoUwMfeMRp
	5AG4Ll7jfcqux/pfCJFWePIdXn7IAvL/4cXkFQZNNBBPyxJYBkHKrrSYPFO6qDP/oJQ3v3n+SET
	mjUsc0twvEtkU3yapkpXAQS2/UJgJkUwGrcSaISM7pPBKu0z/VPagpM1TkngyNjoqlNm/cC1U4D
	RIQQvimM0/nI4+npzs3X0kniSYWwPkXrZdJYa/tlN03a2rh/p2jj6ZaAqG0OrZAwkII7AVAMAZU
	k/+zCKd6i5MVg+fpDjOmj4Ra6klF/8EVFpmWbFXoVZwt4af0=
X-Received: by 2002:a05:7301:2f8f:b0:30b:dd58:e155 with SMTP id 5a478bee46e88-30ef096e8f5mr1218372eec.20.1782846223162;
        Tue, 30 Jun 2026 12:03:43 -0700 (PDT)
X-Received: by 2002:a05:7301:2f8f:b0:30b:dd58:e155 with SMTP id 5a478bee46e88-30ef096e8f5mr1218329eec.20.1782846222658;
        Tue, 30 Jun 2026 12:03:42 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:42 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:46 +0530
Subject: [PATCH 4/9] PCI: qcom: Add support for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-4-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=854;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
 b=P8iXgoZ0ZmeREPgz0BzlNdOW1PX47JuBxAE/yjvDHkAEX3OQpmUXJ5BbOV87TORQ23uz/0UyF
 zwsAIcJQLL2A6aVZRhqot74U2Lymzxtp+S/bx//KLuoZLN+ihrMtvYO
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-ORIG-GUID: R6GFo_8SqUh9KVXHe0XcBo_IPw7f-e5t
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44130f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sKgv3_SsqRtbfYgyWx4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: R6GFo_8SqUh9KVXHe0XcBo_IPw7f-e5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX4XRbxNJByieU
 LENwWyRN3HVYFz5cd7RMQltpX32csvBbULe6XPKgvTJsOdY+CGh6puH0fqFjKrOmLGZzhzmjCxG
 /L9yqQAVmaHRU8XIbcbqqSc6qClfpA4GknyhlLpHJK1m7oBE6okbjsv2lBDc8+2+SXcO07+NifL
 WbgCsfn3Z9b0scB6LlaRlvQm4jfeqQftV5J29gGPwcsX2Il3ISwbn7bAm+rK8Z41unL7jrcxur0
 +hMPy40iNBlRdCeu9NCzJX6r8xaBR6EzBR7cEqe9WdX0WEj3uM8709BHL9jF7eL2Nd9tzRHZuej
 i4YIUUGaSNy4LCxUId52hYDX1esxxTP+y4dtmJw2CFVrCXaKaUl+buVB0VPWscGGtI+OK8N4rPy
 buQMQ5lU+ZKKOzv/mLH0/Toxwlw18eWl0Q5pFllMmvxYNFCQ7BKaKf+doDO78is2GDgATnJ+N7F
 yRZIH+P4nq3P5sBLysQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX8X8TPI/gZF3A
 60YydxSKOGpwDEd+tPyxa1DlcAq/dlS8whj8DYX6tXufToo6FLMW3HvwN4BrVxaSj7k1GvS6ER4
 1wGhfhmgOOXCXarLd8WAIsF2lt9Om+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182

Add support for the single PCIe controller on Shikra platform
which is capable of Gen2x1 operation.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..19daadee65f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,shikra-pcie", .data = &cfg_1_9_0 },
 	{ }
 };
 

-- 
2.43.0


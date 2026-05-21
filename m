Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8232D9484
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372355; cv=none; b=S1beMddXLaidnYYsxjtyULK0jSZxfwF94s9QRFEodqiYwyyQ4zS0czfoN6F7DjkcLCuwbnZMPy6Cn3bDvMJTfGJ5Am2YJWM1rsSUphFnOhJAfg9IDvd5JTTlObv5zkT4vpcSFz0a0wB+THZopeSPFQW+M3KpLJ5gz/WAXJza7Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372355; c=relaxed/simple;
	bh=sRGh7S6MyKVrh0BInxsk81hA/AV0Bj4E4laY11Hu75c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/JcZisG+gea9jaRw7fF1X4tndLWypoimofeP43omA5xUMrbqme1bwJv8Vc0mB9bLEAnkTvSC6vJk6YBqjLFZOFxOt4LeIExR2//QXPYoCiEiXke3LCwHAX4e+33RD0d9IXYM54ON2mmqGTPHkK4CBrdYxoV/9mkNVOpW6nBe/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDh0IMi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZSUVm2F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDh0IMi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZSUVm2F"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXu7e818850
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCoeHjjloUdX9dKsGMDAd4b+0Fil4rvCP2G2OTCb8a8=; b=LDh0IMi4lk7LWaSo
	/weudAX4lJnOKHPz/8o0qR3qlioo6g4MJN7xrNQMo2lTs0RoZrlSHF+9vaQYA9Ko
	oauuPHl1WqIqKzghurBLZAMtcPis8wzXsf6rZfS6MvkSjwBYSRqbXiJcUuRU+t5p
	+QTkvNQ5IQ3EXntbPVkJiwe5G9fDIj+j1TyUo3rwan24Je0cYiuYe7emJ9dnv3YU
	/IRwqVWLEmuM4QVYUPOeu6Tv2aYU837len/zn6ZigrONb3RldLVoBxx82PyCUHn/
	5FeRhOL3JcSdQSvOVS5ZgsZ20VQ9H2bvgWsBQPWfR009FB9qXZ+nX+mUCJ6GsxHX
	VUVX6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkgsgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so58462295ad.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372353; x=1779977153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCoeHjjloUdX9dKsGMDAd4b+0Fil4rvCP2G2OTCb8a8=;
        b=GZSUVm2FAjRz2duWmon4lp+ZC14yqFcvl9cKgd6qsFNXeRODo1KHM908owmqt+8h+7
         6V5MUcG/2GTaZB1qeK9pyBzHyd65oEsjj2YRSNH7frSho/SW2AUHXnd5rd+VdR34G3AB
         UxuA/JFYC95o3wqncWaCJsIE6/QD9CvSrQD1a9nJeLwNPiOrr29NcKbPJZr58l5L8zXI
         iyN1JPxgYau3pPeiVwX6zcqCrFRhyud3Z7YOFFzq36yweLIDETYroZSv42x4mjUReYUo
         0rhDsH0by185m/+GWRVCd6Ucb0Dy8zmC4n5ZReLY+mcIBBiffVXm7f1JVImIWBxfJAaB
         8xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372353; x=1779977153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iCoeHjjloUdX9dKsGMDAd4b+0Fil4rvCP2G2OTCb8a8=;
        b=kSxxe7+Tp/qu/OQmI1MwcmofQ/w+DBzZj+E/skpY6GxKhtyXMc/6xvO7dmY6GsZM9w
         JaZcpUHyxTR42s3oMnpjir8BL9Ocea0qxRLsDvbWL1nFdJBWj1htlCJECyrMV71G4oMn
         a8ZkM4TBssa/bicYbC7qHuvD7GakQWiyXeu7qlrTwi7coIa+CawdUG7yEpHH0S1QFP/I
         63j5dzQUTAht5A5YdvtsJlylJPNnJ5v3MVYdf/IccilJzNVeCx5qz/d92Hvhd7uzpFVA
         i4e2FHztxuzUbW82fmBs7Pqr10sNRdvS6E+jeBrlYKUx8hbVKmWevtScyoiA9GHGrmuu
         /4Lw==
X-Forwarded-Encrypted: i=1; AFNElJ/UVToRfrbzWcjykv3lCaaBTsVaZjwYocD173rFSCyJnyy9eiKs7YIt32KarmpYf2hzIE2Ltdct2QCR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/itw8FDR+YtY3ZkB2QYhD+gg4fkHnlHNHUZmkGT3ZQYkmvJFo
	9MLqX6tPAONqEuKhx4wttGIqRTcp8g8kw5wx5gkzER3TFhWexc/DBWc4dDhnot3a/ugJJ8n04+x
	4pZoKUde1zcIMJIq+osGL6/zEWME8mpRFnvb6jGhvcLAH6zenNIVCgRcu2pBGmFzA
X-Gm-Gg: Acq92OFWWEoDrBAKpnjmfBRirhq9srwrVgQqqjqgUqjrSHuTxzd3Vz3PbnmEHfSSlo9
	LP95mWyYg3OC75NKzbXRVHfIHaIDUZ3FWHpUMT0JQvAR8uAKk8CFG3g4BOT2QlZu6eyba8qVaRT
	a90nL9RP5GYaJ1ZBz8lRK215jtKgrkHrmq3PjC1uRpi7wMhRj7yCMfzRNLBi2sGTR/lfQKM8QQI
	+cofRPf2BN+9VWU/MGOgRwvf5X1dBuwnk0+FPBZvV3gEFI7IoV5jIqfJgaRChw35zgjzWcAGfVD
	yS7vGPXZYT7VbUf2VutYPOTlhcI3nmPa3Bybivhnp2RpP5OTkayZFbNYzQnhJMvq6jYHefZZbsS
	nZEFzT4lK2SFovWH6TYV/EFyWIw+/bWRRbbEQkkhRy0fl49+AC5dMIFfG
X-Received: by 2002:a17:902:c94f:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bea2fd00b5mr31297435ad.1.1779372353202;
        Thu, 21 May 2026 07:05:53 -0700 (PDT)
X-Received: by 2002:a17:902:c94f:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bea2fd00b5mr31296625ad.1.1779372352669;
        Thu, 21 May 2026 07:05:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9287997sm13189765ad.24.2026.05.21.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:35:31 +0530
Subject: [PATCH 3/4] PCI: qcom: Add Support for Eliza
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-eliza-v1-3-97cdbe88389d@oss.qualcomm.com>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
In-Reply-To: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779372332; l=1041;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=sRGh7S6MyKVrh0BInxsk81hA/AV0Bj4E4laY11Hu75c=;
 b=oOQiaTe3ZLkTlXdBjVUDD7f9dAV3Tv1of9VZx8/bw9AkHjzEgDPHhutpwKZncdvD99BH+M7QO
 7rLOozMHs9ODH50YlvOuz0y+k6tF4w1cwb0nlnacdWf9kTJsLW5QfMR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MSBTYWx0ZWRfX5BvaD7oGiQzC
 sSyQeL7x84bE8VC19hoMIM9h63My9WR1/LvChrDLpTDcqCPK+NUrEWssRJzE3nJ7n6GTvChc4F+
 6vulBDw3vcQ2nfccK8mJMTX4prfBb+gM1BdMI8gp7SlhA1e2aosxujC0Tlfq6Nq6kOM+89Uen1D
 oxaiyt2wO3EwmqqmKcPhr4Se8T81M7iOvwPSHosX2c0KmPJPEPKPc4yB5PS3gRlHvhhXlp3OAKW
 BRLgRJS3T5OnlGRTOnEF+bTzzrOUpUk9kNejdgF1yG+8j6xfHev8TcVP2brl6NLhVg6xuuOzgRg
 5v9ydXkVB9fy72y+16PkNvkCoH3E4E3Nrd7WWdpv8SF77dSvvxwTMRuGTnllRIYRp92x3fqAykQ
 ddftIswX4e5+ET8EzPoJTgJrxzbU0r5pVODi9QNw02XmktMX/LVRqDv2mJZyKYrwBM0h7oLgt/d
 yHnXTdfa/2apdjb+DkQ==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f1141 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yYnYU6OjOVcDIML1DNdy7WWRoQGIUmv4
X-Proofpoint-ORIG-GUID: yYnYU6OjOVcDIML1DNdy7WWRoQGIUmv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210141

Add support for Eliza soc, which has two PCIe controllers capable
of 8GT/s X1 and 8GT/s X2, using the cfg_1_9_0 configuration.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..40f0a5f247eb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2123,6 +2123,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
+	{ .compatible = "qcom,pcie-eliza", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },
 	{ .compatible = "qcom,pcie-ipq5018", .data = &cfg_2_9_0 },
 	{ .compatible = "qcom,pcie-ipq6018", .data = &cfg_2_9_0 },

-- 
2.34.1


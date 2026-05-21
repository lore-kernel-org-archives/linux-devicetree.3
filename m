Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D2273D8D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372341; cv=none; b=rxMyd8HHET+TqirRKmt7AzOF8vqxrNZjTSosUBznopvjLVDQVSB7OUhLrn3RLLYQqXYEi+OVsdH38KkAev8Rlo0mgbzW9Ar9fvGH82LNGaSfFnFPGK3ohhkJtsHPDbJolMqbWmXGFJjplCPsb8gHTyZU933oGI6LYA6Jjwl6oNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372341; c=relaxed/simple;
	bh=O7C+WAshZBT5qe7BGQyWLbLRGLqNcCFqdNXx9ENZ2ug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VVfPVtJNIKyboGP+pjj0LFcY9rGQd/qgtdWcXsukiytUiyqCjmDrWQ3ChlXTW3SY5AO+y8ac1o8USzXqulvbjPLTRf07Q8LdmpfP3on+Xf8GXJRIEwAFoH7pXXy3bnr3yJ2Zs6deB6u7GOQ/K0u1W+ThNK5ng4e7cLkT4YTLYcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I31eoLTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqpjpQo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I31eoLTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqpjpQo2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMCh1731236
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3OTRDFg5JhaU43k+bSlIH/
	IJf6yxe4CHmbFjPGs2lIU=; b=I31eoLTlZxSwY4D7eKvF9DrRGuKU5fS9wyoXER
	sJ/5uko/s/wbnZ1PxNzVEqsM3rxLAj8yrUU9CL973njaVGN7Djqk+A/aym5y7YLC
	c1a58MtksLOzv1/NUABWuu3yx6q28MIDk1O3VckAqHr4/TpnHU73jbaU3Xeb048y
	DlOjXUTId2e7ZY7iTflLckcfhXM1mLrzUPVCsF1wXmlbJ0oeOjvpCvwD6V0eERi0
	mqDvxKW6HGYTF/Ml4sfF1/2e/4ltCofwNgYNb7ORZq8AjRKFO64hZ51epQ1mzZyb
	SqJYzciWuh40RoTt4Yb6YN8FO0ssS9sRQfDemLKcexGP0HvA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5r40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:05:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba86e35aa1so103633665ad.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372338; x=1779977138; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OTRDFg5JhaU43k+bSlIH/IJf6yxe4CHmbFjPGs2lIU=;
        b=XqpjpQo2m5qvzcc4Q/XDDgw2sP0OpNdg8MjMU/XTMzyLonAiCUVjQFGWszvuGEMALh
         8UKp1A5xkGXgD71QFYUTRqg7VJfSwsPfA5UGhIbjOI3EPNkmBoAZbhZyM6OueBd4vKxP
         DbfcHLXno1YblKi4uhO3OhfLZ+6rhaMSWj8LIrJ8ebcBV+xDyjeU0UK+AKVR5PveZbn+
         7fazC8bGxcOyxz3rWMaK+OcROoXm0AqUdmNSQxhbP8DYUHFnU1JGSI029BU/g6VUy1aZ
         0yQN04+dpLOhmqsqvJsxXmHrDZGYgRfi4oXGcG+C5OvpAi8KJlmwH8hqfHMxk1TU8gDL
         nX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372338; x=1779977138;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OTRDFg5JhaU43k+bSlIH/IJf6yxe4CHmbFjPGs2lIU=;
        b=Hg8l+gRx9CU6HrOv/5uSiZWny0eq/OBKBMo8iGqDehPqvAgmbPAhrQSF2dEmG3F/Ci
         tcpD4otqY5yuTv/yEBbHVH9CfCn3yNUXNjjzp+N1soeAQj1ycWEJP7CCGVnTBdKh+TWx
         Wwc7WsEIO4FWCAUFngXDcrCj/l9ZAKnLDh407za3IM++vWlTQiQVlpt3D6p6KfiTQCJJ
         9tYGy58LC32qRoxLnD3JljMNxj1LAjEkYyrrGI60PriYE2PnRqfDeOUSBuhOokLt9j4Z
         +MRSHfm+YcMrrA7C1NwLKr4GZH3aDMjqf21vXKryDEpMVLQH3AOrA54WWZ9Cp3mcM/of
         wPxw==
X-Forwarded-Encrypted: i=1; AFNElJ+425ZFnulNRG3F8rOi/OgXUvAsdRtOK3soi3Iaz4Sz6AKsAjqKhVLIoQHdcR2UOjTVvzDOuehT7Jwf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5Jzf+Qq2g5cfcmcoqmpoFVN1K69YAAQebC8ekvQ1tqmJoqva
	Iz0I69v+UeunvDaN0ts9Uj9Qq85U8MMQa26NAENu/oGCtP34KkDvIuQjXtVfv5p9A7HV+EFvlIy
	hJfk28r7KnQQBlYOnkbE6BkqVpYgNTTOywjKR4NuhOAX1XUhvHYtwubA40sfp0nmX
X-Gm-Gg: Acq92OGsOwt+1QK7y7Eful3p7T1Qy2LFOhBZxhWDLBQtJQkYg26gT9nWwuKSVtta5PK
	oAvBpTWcba8/frdh3bj1t6EPLmKkdXuWC9CxLvYNCjgbvz9VkeD2ZIEz7eoWIUc7XgUuUIrHf6g
	cvaDwyFI1K5Ria9gWEqzoeBWEXbGiDTQfGxAQwPm4dnSEkGr4/9vwEE6sgTeBX5Mera3Qratz63
	P99sbVtPXKGYlzWCqMvQcLzR09PVg8LtIVjQ+kJooGk9NKllJ1/oeNiMGN+M/sdMUXxpDDaFtgT
	HVmahVZkkEpAghdaNhO8i5WlObwj4/Y7RyKoGIEuG+ADf32yEAQYpgXdzlOGrjyjAlQyr9XhtOt
	pzh3KM46iK4fBkZvNOWHbSMQsthiiRiNijofhTAPYe4T5wNeXHnxlW9ie
X-Received: by 2002:a17:902:d551:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bea33abf63mr34891335ad.36.1779372338093;
        Thu, 21 May 2026 07:05:38 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bea33abf63mr34890605ad.36.1779372337563;
        Thu, 21 May 2026 07:05:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9287997sm13189765ad.24.2026.05.21.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/4] PCI: qcom: Add support for Eliza
Date: Thu, 21 May 2026 19:35:28 +0530
Message-Id: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgRD2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNz3dSczKpE3VRTY0NT08RUCwsjQyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQCRIcRQaQAAAA==
X-Change-ID: 20260427-eliza-e53155ae8821
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779372332; l=1529;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=O7C+WAshZBT5qe7BGQyWLbLRGLqNcCFqdNXx9ENZ2ug=;
 b=qL6upoywstmBHfEA/kiZY/0E1OCxGPxyH5TmL0lnTocWoJBsNk0QQEwjSWCA4ZdE4q5vbc/dw
 BP2qsvW2fqnD7WGsvOL+X0cDgwsAeSxb0W4TQitGgfNk2ublP7xS5hw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f1133 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KRKipztoQesxEaMeAmMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: xpRTYN04aPDxJcs0-XCbzZk_VSw6zgs_
X-Proofpoint-ORIG-GUID: xpRTYN04aPDxJcs0-XCbzZk_VSw6zgs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MCBTYWx0ZWRfX/OwaRSQkTWkU
 qT7f6B2XE1n/etfUcmT9HFsj0XgI1oUFZDNtHu8V9VpsfL+Al9/x3NvbtjjND/bcYAOK+49cDQw
 +WqZl0X1PERro/wYQgy7xyP5PwoEf3Z/lbGV5KW44BTq7Fbn7wsWhhJTlsM103I44C5ww83KyNq
 31kl+RGPTFI/DYf82SOqZHiNVNDMvSSd0XK6Orsw2uG4Oy6nVodemUvl4gsVVBw8mupoQRk9Re7
 LYlm1ia0FDvBxIgiiCvCZlN76VkNUyGilzOJT7abe/lRQFgFuex8LK9ctu+sYyzOFDswyV2GaR9
 vKB/28JM6vW/2nVU6BBe5P7zWNAzEQk4hrijG8+J0jXZhkxq537SbnR1Mpqwwqs/yF2aT15tRpj
 xg3Q3molKJpzDT9QTCDrhIesJrxArKiDVhD8V3BhJLr5P4UlcnNYu7vVEXS3Rf5pVW649ip2J4Z
 sknq4vK1w7NtjJQfxHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210140

This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2,
both using the cfg_1_9_0 configuration.

The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
Eliza-specific initialization tables, and reuses the existing SM8550
Gen3x2 configuration for the x2 PHY instance.

The series consists of:
- dt-bindings for the Eliza PCIe QMP PHY
- dt-bindings schema for the Eliza PCIe controller
- Driver entry in the Qcom PCIe controller for Eliza
- QMP PCIe PHY initialization tables and configuration for Eliza

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (4):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza PCIe phy
      dt-bindings: PCI: qcom: Document the Eliza PCIe Controller
      PCI: qcom: Add Support for Eliza
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Eliza

 .../devicetree/bindings/pci/qcom,pcie-eliza.yaml   | 165 +++++++++++++++++++++
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 139 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   1 +
 5 files changed, 312 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-eliza-e53155ae8821

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


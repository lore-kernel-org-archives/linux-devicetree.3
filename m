Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746D36BCD7
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419964; cv=none; b=qgAcc0nkDvBxVsBSgHJsGXgrVM32uxundEqGzMzdjzJfIvgslCCLx5O4QBiLy3oMj0VNSEJp7j+PqXO1+00VXT1CXeapIfiAEKW324+4ekNGdvzkuMjyHgG9gg3YUfhWhuOIwLtpCdXTh/r6ktm7Qt14PkdW+AV53v7O7UF+0BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419964; c=relaxed/simple;
	bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgGy1ah+aQRzTt53bAC/UBO67d0N0tkx5HrSEWOlTiPRfAoPaFpOEWLRNSuJC79tMclPmCfgbP7lwse7VlxiVimh0HmBtGDV4rr0u6eUyWOQDFUCm16z+UPHQL/iI+IaGv3XAAl+YY1hffyPiuuAtn4/01W0TKRP0myRNhPe8bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BR1gbFcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJRKs0ta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BR1gbFcC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJRKs0ta"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFeP3e2801847
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=; b=BR1gbFcCoONrG3B1
	D/iYK0DQp6U0IJmGuVVJGU91UTNYEQTQOl3szD+9kFJUT7jdt8L0bq2lpc/Ty3KM
	NNuoRvXJOhPqqD6nOONRbycKW/6yvymWWrdQ0SoTbblKwhwy5yoDoCOsNwHidhev
	JgvjRqQqVzCNq8iKkhIotPiTyt69h1t1HYyL2FHqnnj7M2vQEiDtSzCkYB4qV5Wv
	QlJXIJnkKSHRXhKGVZgKLdIegC55Ce8oii9kQacmNBE6ycsKGgR05/81Tn8dj5LX
	8G2ytMGxQPADlm1H5Im9UHW5jd6lagMNrwNCTjqgIkKUSYNDloEeI2cNTo76rLg3
	ZWhHXQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmm75c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139553dd8acso42928c88.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782419956; x=1783024756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=LJRKs0tadOXYXfdTlPcRKCpDmUsw59W74BEqnw5uBVJ+jru5acsAmmRGgSwgk6tc/5
         1enlo7TqgOKsm+ZAvQ8EfdVvTKvULgCfaZtVU96tStuTQrxLsu7g59ZoMw8NHeF/e801
         0xNRKB7OwCsWN9XY/8bUFmYowad3OWBjELWTxRNeI7CTV8lsHBMPOrPcpLSR4oKUNhfL
         EHCNbUSwAWmtkDf9j3vT10cHUCRo5s9n+nYdm4gefflP0PXbUbVrVHt9j772bfnN29hN
         Zr11NuunywSyXXUfX7B8i5Cgxy8WTMhcN8poX1QDtBeGqw8a2k4afRm1HbedJfvo0Vfj
         J5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419956; x=1783024756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=a5xCIQrwjWtZGpqjsRMu0yoD2BiZ3eWPCJHk+0yzlhxoFlnCcIVqv5ZT3/vfmcMU30
         fFJgAZ2iyKpoILJova+nHcnNv/I4w5ki5Q5oXybQs8bxofVIiDVstKBRNC3ix3OILwUU
         5wFG3lEGF3l+61DLTOACS+sxOYkDorqrjgsr5NGWsabHDZdWiJwuU8uyw/0Y/CImTP/o
         1TiPp/4TYYk8Bei+gQK4EL0+4p7275iKRdSXEScjxu2OFu1rTFe7E0RjRE7XI/qpoeAr
         sCxHIVjeYB+yR1H227jw+26W4NHLZYuYytqyjza9U0gJ/aWhhS+2QNpQs+tpCbNN+OUn
         mHmg==
X-Forwarded-Encrypted: i=1; AFNElJ/u5LiWgdr7m6DDWNz3WlsGbvRA7+tzqbh2ntB7aOOPf5OmaLMLqEMvVMh8zbkQR5PQ4372cCJYN+ZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vlt9Ucok9JLjU0VyZDImg5LbBxdCCoRFaDO799lKzHyjPp2d
	G37lcPz86Bae5Lh3Fz9Wme/wlT+fJDe+tViPgGo6uc0bLGaH4jt3h4WDYt5MAwFNwb/CPjYrjB3
	gdX5Q+oU+CYflhmk8i99EFqYQRquECUv0q2vklQQaBNC+4AXxDoKJAHN+VHY8iJsp
X-Gm-Gg: AfdE7ckXI/8LQl5wyGkTs6eekNDTzeMyskn81gsuobnGcdMuWLYRk1x4xQUBvuk72XM
	tQYond0+9qT5vhDjBWOeSSFJk5IP+Q3uX4vlCBgIBvnWwXE0fzZk9XYnJsdICv9Audo3UkqM5hX
	yPC84BwdhQ5n77E5QkeHO+FxGO9hAYoig7K9GP9hbXRb+EXy6pcQhsKRb8BmDWgBZvEfTA+OAMq
	0D+hyRppAJ2hCJSK3/hCirs/Mpalk7WabBKVxYXw86LRAQTPvXILT4HInHHsrXO+kBKW1viqZbj
	8BInz0NtCx6e7nEHrD8CaOlU2FYj3lQc82xKlcuHcDsRoe5T//npEcFUdCqnDYsHNfl6F/uYjFM
	ARYicj2SbeM2SgNE0oyEloDD3jJAFVDx/K3YKEzqESKFnmgyf
X-Received: by 2002:a05:7022:78c:b0:137:ef8d:a58 with SMTP id a92af1059eb24-139db9ed769mr3336988c88.3.1782419956281;
        Thu, 25 Jun 2026 13:39:16 -0700 (PDT)
X-Received: by 2002:a05:7022:78c:b0:137:ef8d:a58 with SMTP id a92af1059eb24-139db9ed769mr3336968c88.3.1782419955764;
        Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm10858623c88.0.2026.06.25.13.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 20:38:59 +0000
Subject: [PATCH v4 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-hawi-pcie-v4-2-1a578603cd86@oss.qualcomm.com>
References: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
In-Reply-To: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782419953; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
 b=A5Mue3yAIOcauVRSNX3v/Fjj30fGyHV4HsRl3sIcSaEdE3H5M6nJ4GPlLFS4AsOu4jserBaMh
 s+YYM1hLwR9A04rhKJdiJPPaxO7HaDATRAkSei2N8owi5gvOSlZaBTy
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d91f5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX5fMReBmy+IuZ
 R70Fs52A/AqzrsONYS2qJF5DMi/TcVIjwASrIwF4Yg/moTOZc3ul6jPEHM4mp8wt4yybp9zreBu
 2tRX2MvmvlpDIeIt8+wDKgryZEkRxSVyIyOWx0JVYeMYxJl6Qac1V/3cY8DjKfXXi5A9Z/Rr02U
 JynQ4kFR26TZwF96Uyw+GBsSKgTHN9L7mvOeWFQGsfjLGR8mCGjSFQldgLLLCIGv9T9H4xUpS3E
 hKPUc/l8SjIc1s3A+/PfVGhq+/u7jtXxJVnEmEBeG0ye2AWoaIGuLgkEfvFgOq1UvfLwC3j4T3Y
 zBdjJHwdbL7qU8h66C8geG+8MqziZamybKjzfkVhYhiKc3XQ3Fh1AQbhmPseNodvLGygZ6ZQKXr
 69CE2yLUJpXj9EiNipDs/BzPDXNXlkC34oUW4yFXKKlAnN1g3CnzjjNP2fabgld9GNGxUTFvzGY
 vnsyLSZbzNBr+q7F1IQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfXwucE9FjFra35
 fnlqqbwUuk+PPjYZy3DaFnBXLjuDTu08foVdl3Tyb4Wg6nQM51+Cngdmr3K7bWqC5oNRKxlDKUF
 wfWs0+STiXGAhrPnYeadcx/o/zZv+uk=
X-Proofpoint-GUID: VjakGNMJRatYZKeTGauuynVHngLctRQv
X-Proofpoint-ORIG-GUID: VjakGNMJRatYZKeTGauuynVHngLctRQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250178

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..89ae006fb6c3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2282,6 +2282,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1


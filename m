Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D63876C1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901972; cv=none; b=uD8cDa8lgIvKnJgZWVkSQ+Q4BQs9TsAADIHMpFRLNFvh3Ezl0ZSmpskQOLIHok4x72vI1Y/pkvmdUP+YCSGIO9bb7o1qZ0Px1qPSgskTw6NhOvYSHUGx6YBmuG33Mn1zfvi8Jjgm813DxKUb4UumyvmOZnduLRP78xXUZz27R1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901972; c=relaxed/simple;
	bh=h4yLRvqGyQTl6OR0GngMd/YRroUj4EhJo0XPHba7d0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syePOxyYOMgBCFwy2sUvs3RC/QmWX3n+TUG9Dv2lzjp1rEKmUAFH9ur+ZoZH2u1jxFvg/YefB9D7ye//7i3KYg7zDIOhOc+U0NSjw9R/I9/ARr3KwvWRTKCDfW0sk54jagdW7B4XtO9GkSEHIUIcm/0k5kDJb8XnaM+9XwpqqTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmWamVzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyCNY+aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmWamVzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyCNY+aK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QqPX2771090
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 06:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=; b=jmWamVzifzUA7OyK
	S4oIA1/vlZxiYhDV90onPQ0h2LcNIWYzMSNaUTfnLYHHGfFWxeK6agFN69na9bWR
	kjELk4NUA10ReeOKwXNAvaf7pqBHZEM2QNJM/f9LzxRY9I5CF5GbIvLFXd42RKej
	6gd39AaKkn3I5tIOT2eKqJfnHj/xb2tToLX0nN80Z3lNYSbMPJCLix+6b1d0LHSY
	4/ubfgizZJ/3gNqlgauLFrCDsylkF5nhyNem3lY18RbNv2kAEFpMsUbRIuNuqUN/
	sGK0DZWtA4lez1hsReBdarZ7cCmT8MQd8vRo0x1nu21BbyS7sPYaglofBwc0dy3M
	9P8+Hw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ea84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:59:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96388871d70so3902300241.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901969; x=1781506769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=EyCNY+aKKbySRJonIvXlu8jtYjmXkJ9XThF/KenosMtHWNri5CIYtFW5uP2UAijh0Z
         Hay1sLGcSrT9h+WkK9UT/w0DucGuFsdjrUYevC8U5aAJbp2hg9p0uHQaRJ6Sfese9k24
         psWyZZ81iUpEhbY3e9u72JosMU9Rfwk2h0tFPQGZopLMCIvcHbqtIfxzcT/1RM7TXBqj
         7aDBbZdl79rf7a3rNOZ8r6QELPklVcyV4F63W5FmJjwXwR2scFGlW9LiWMI5aAl/L7h0
         hDWZRvV7gb9e99K1ZupacYaBm8mhE7KhaNI3hbxtu3IZlGprYfeW9QWnBuvKg6YslaLW
         puuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901969; x=1781506769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=E6ou4FFemx1cAnNmmbGjuN9hEJ+mFx0c+Zs3lYzTC5S7ic2WQ2K3Lxef2dYI491ywA
         rZoThtTl5WE/7oeOMtvVMCDGBc3xBaPBgAiKDLVw3bOApZEJDYnS5Ja79cUFgz4DUi2G
         9KShvS9Q0uZBgKBiNxTuPjuxBPBRIFSgpzjJuNX4M1GJa9r35tyWzR4+VXj7Rgl/80G8
         rRsH3eUgIey4qnQfsfnP+DgZQfDJ1Y4SNS4nw35mxUrN825gofAQaSamn6nt/mkEOGRw
         S2xoOYnv3N2vOMVdCA2S5B0jZZ4bFxrROGrF1s/0N6QFc0GBzFxf38q2yBQKsjHDqraD
         NDCg==
X-Forwarded-Encrypted: i=1; AFNElJ87eFeWuOJQNYO7cMx0N07IT0hnwB7MiNL1eTPoZrSMTU9J1v6+YbwFOI0HG5yE2VyNCatcvZhB6Vae@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwQI8qLQBfOKNXmdhYMl3KxrMYN5Xmy+ZtILOL4Jkh6ydrqFg
	8a7XMUYYM0vj1QHKhlJ08qaKgvV1By3llS90yzeTkWdAj+RufOBq87jDbYp4WHM/VCBe8r3UOzQ
	Xrt7YyG/FAVxJp5RV3lc0wUNMjXYsHsg9jpvY9pNFDYEdSndNL4/pjDx+s3HihQja
X-Gm-Gg: Acq92OHrX2lUgP6hnq9lD+ptJqNmGRWPqC0hFHz4LHA9WeNWlliEb9kM6GRJpMA5IdV
	CHFyVSxh9wEmqCarIRP0+4zMhL8v0gXujk6a8gm7wpj0AKWbZAKKj2IopQCPE4c7Ly47JMMW2tn
	mG1EKKTChqQikY3FX9zjVjeSn4a3bi/vYvIutJWwmYuUVqdGhtUu+2F/1WihLmz9Ijkn4qDUSh4
	RIONgrBJeaRg8b5beShHKUkOcWHe9Bwy7i7Byykxwn1jWsVf/Fnq3ktjXUnq+aBGwdFiXduN63M
	PwCuEJO56af6LMfyi4QLZCOI8koWR+rkOpvVNIa7vw09wR4frBxMXmkfQNRMz/f2d1OMMX2oxCx
	zBZ4WA4F9seapikNR2e81bMTt/24fQM/8il2iNPGYnjsEy3s27ui8XxqFFqPgnYyoRelKD7ysHG
	GclQmtSFj19dKAoPVAPGlZIcsfARDY70Ruee968aLMUvoAYQ==
X-Received: by 2002:a05:6102:6b0a:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-6ff09f907c7mr7172131137.23.1780901969476;
        Sun, 07 Jun 2026 23:59:29 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-6ff09f907c7mr7172103137.23.1780901969023;
        Sun, 07 Jun 2026 23:59:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:19 +0300
Subject: [PATCH v2 1/7] PCI: qcom: fix parsing of PERST# in the legacy case
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-1-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h4yLRvqGyQTl6OR0GngMd/YRroUj4EhJo0XPHba7d0Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ZahpdkIc/m2AU14Tot6u730x8n+R6Ny+q0YatY9z5p0
 4SPgmydjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjIrDccDH1i8QtkmXQ2xZTW
 b1zltt7i/P81d0XO/4gTdw1jO/yv2Uo0IWb22yesSzpb/83cH7cxnOm6xv6KoCURiq+6AmQ36/S
 77q+1fONfHV9zeMKG647/DxsEB4evcv/7+0Bm789ttzXbM5a4zAzxP1eQtEfWS/Pm+m9TX2j2fW
 eOrzE/5/Tg50/m3sk7MiSy/0jcvuAY/ODdnxhT8e4ZPUeZVsgmyb+9/OiI/UuJ0CphjZwNM9zEZ
 0fVpL61rNm7/HSlRJJhZVvRffZ19dt/rN6ZMqnlg/Fjtb7jTzncP7ftlmlnnf7ZVdjd7PznrO/L
 fDzMej0lEl7+ycgTU/dn5OUIMZodpsfIOS9N1XB322FNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a266852 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_p6hzaB3oH8elZwPmwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX7NXWgl5wNWqy
 BFukrYx8z+BVcRNSpumvUUJPguI3pUKSSZOUFFZSEwVVJsFbzr8thm5aK9yEkyEK0ZXemCxasJI
 lV707Ici0FL2XZW3xZBSTkiiE//Q1EaVRSn+ww8dDUUup+pVnI3qMfjNz3hvZDyOUTFbbY4ADi1
 d30HWQv9bIuFiuNYgiwsmA9wGz84byLU4OdzPxhiFsckKxBcPGyFLp5+9pslsOVXRfr7W+zT2pa
 lC0aJxzGVhlhGcEvMXPsfhhHi5ktNJxi1ir8biHSJES9t7LudgczPIENVIEQacVrLUcAmr6CT2d
 SHytw6f398xGBCN84W1nG0Mf200ISLEpe0hNc0iRC4Qz50KJa91UwuQmobTOf/iAZ6rpG/NY84f
 5OuqK2FW8zkHOuAadl+2GezS8WVvk4dG2gRxe+7CMIXKJ/gX3xG0N6rhe6F0Ejmoii77tclbqVF
 2bSnUgISvc+HoHEj3Xg==
X-Proofpoint-GUID: znTBs5MtgqmzPCQfXeEGtbxcJNFe-ewJ
X-Proofpoint-ORIG-GUID: znTBs5MtgqmzPCQfXeEGtbxcJNFe-ewJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062

Commit deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT
configuration") fixed support for the "mixed" platforms which declare
PERST# pin the RC node and the PHY in the RP node, however it also broke
support for a majority of existing platforms, which declare both PERST#
and PHY in the RC node, because now PERST# is first acquired in
qcom_pcie_parse_ports(), which then returns -ENODEV (as there are no
PHYs in the RP nodes). Later qcom_pcie_parse_legacy_binding() tries to
acquire the PERST# GPIO again and fails with -EBUSY (as the GPIO has
already been requested).

Move parsing of RC's perst-gpios to qcom_pcie_probe(), making it obvious
that it's shared for both cases and skip parsing it in both functions.

Fixes: deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT configuration")
Closes: https://lore.kernel.org/r/gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 11fc60489892..7664c7c28c0e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1907,15 +1907,6 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	int ret = -ENODEV;
 
-	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
-		pcie->reset = devm_gpiod_get_optional(dev, "perst",
-						      GPIOD_OUT_HIGH);
-		if (IS_ERR(pcie->reset))
-			return PTR_ERR(pcie->reset);
-
-		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
-	}
-
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		if (!of_node_is_type(of_port, "pci"))
 			continue;
@@ -1942,7 +1933,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	struct qcom_pcie_perst *perst;
 	struct qcom_pcie_port *port;
-	struct gpio_desc *reset;
 	struct phy *phy;
 	int ret;
 
@@ -1950,10 +1940,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
-	if (IS_ERR(reset))
-		return PTR_ERR(reset);
-
 	ret = phy_init(phy);
 	if (ret)
 		return ret;
@@ -1970,7 +1956,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
 
-	perst->desc = reset;
+	perst->desc = pcie->reset;
 	INIT_LIST_HEAD(&port->perst);
 	INIT_LIST_HEAD(&perst->list);
 	list_add_tail(&perst->list, &port->perst);
@@ -2107,6 +2093,15 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
+		pcie->reset = devm_gpiod_get_optional(dev, "perst",
+						      GPIOD_OUT_HIGH);
+		if (IS_ERR(pcie->reset))
+			return PTR_ERR(pcie->reset);
+
+		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be updated!\n");
+	}
+
 	ret = qcom_pcie_parse_ports(pcie);
 	if (ret) {
 		if (ret != -ENODEV) {

-- 
2.47.3


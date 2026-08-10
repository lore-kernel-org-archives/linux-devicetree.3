Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFA3A7F70;
	Mon, 10 Aug 2026 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361287; cv=none; b=V5SSJi6eCLRaX7f78tbBUV3EvSwusSybh2XKRKWx0LjPfd12NvIu67pP4xVjHUbjA7jLpuzfsET/6Nd6E6v8P+XFvOkpiV9CtByoERfGUvLLyBnrXMwkKUnpCYElpupOS2aDB65hU/lKpjdzv5w0xSgJz3zviJ1aTQms2SdNGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361287; c=relaxed/simple;
	bh=zi+e/SCmR1CY7956urp2GxL7wdZ5/LUFvM5ZbKh1pTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXmXazCFGA8U6OSRU5MYXOIyUBVnCS7xTGnOy1TeuW0z703KKHKsgHUGDjIUdE38WKa1jjRFsmSb6r3x+DJQ02s+1zRywsh9Kri66u2z6sTMyV6aAw36Gg8WQ5nlAId5l2WKE1seuoEM8naaX9rcsciCq/XlnAm0abl4MBN+qu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRFNP0Nr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRFNP0Nr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9STIN1486614;
	Mon, 10 Aug 2026 11:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GLtADaCxoAc5C48lEHTGg/Hu0SoWPMGSgGP
	wtfvto1o=; b=BRFNP0NrGmFYQMvSps54CsmmIQiyEacUvXfkjrVqr7LlEDnZOle
	Olsnrktjg0ekWiWZh6M+18uvExC0vJwtVd7JEgYYXWpADbCERaah8Jsy8FRQ6v8A
	Gxc+XEYbEKXZ2NRQ3UVZ4rBo+w3lXErdEBePQUG3NXhfvs/2Ry3zLLQXL4iciHUE
	Dlr53pF0dLA7E1V9NtpcWxe6so4NquVWiFnWd/DFe4xWoOhhhvZxyKTYD0NuZWca
	1+tdLd+onDcCO4Wa15eNC3/chy7bY3+V8DdV2HQjDioCS+LguPoW4LGZo6c71ymC
	if83ev+12l1YV8uubU/SwC84XrzQ2RkOmZw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xt8yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:59 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ABRuUL004175;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fwwhj4wa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ABNMQQ031174;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 67ABRt0Y004166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 78C1248E1D; Mon, 10 Aug 2026 19:27:54 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] Add qref and refgen regulator support for QCS8300 and SA8775p PCIe PHYs
Date: Mon, 10 Aug 2026 19:27:31 +0800
Message-ID: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMCBTYWx0ZWRfXyJUVYUcIO01n
 CMvHAoTLWSlbpJ9XIa0qU/xlt/r5hCSykH8Khp+Btx3EElxsuP6mbDIWI9lY1pQ/H1bHnWePgry
 VJZlXocUz19c8VvEUuweM+guUrQYTQ8=
X-Proofpoint-ORIG-GUID: KdytFahG2h8pjEQYGZMrQLgobRe5hvpU
X-Proofpoint-GUID: KdytFahG2h8pjEQYGZMrQLgobRe5hvpU
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79b5bf cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=MXBiqbVMOIXyEl0c16YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMCBTYWx0ZWRfX1G0SQ2F310xC
 YHUVfOyAKxatOl1nwfKcgzRR6UukYa312xNKBLOnFKrEGwaQum48QptX/lQe8fEguoTXKMW2kkW
 CZ/IbK3MhTkGZqJ8ErDR0/WkHCsSVE2v9sGMVKd5G6j3fMg/36H05eOIBfxL+J+EjcHd3seyWA2
 k2gZOHzr5AGqWICauoO/RjP6AW3R7F1GqOtMibJyJYHuvSKwNdpaU3guttjedWdZftXF0Oe0yr3
 pw8Y4FwYfqd4v1ieLVPYLIt3Ohckce8BtCl49P+uCI8hG0UuCZYUh9t+Yk7QUWuLv/riqc+xNfN
 wUgnRDZHBagkRSL6p0zgqbzTzzxE4m0IPOQckwG8rkyfFW4SbQRoXAdTFke6VGPV6w4NEcQCGyz
 bOgLagSEWQwyBIIZXoI7kGTyWx5jDozKYnDCvij45Vt694uHkw5njOznlrWxjacTEV5EnKIXZp/
 W94T1Z6OKgdN8z3TUSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100100

This series adds qref and refgen regulator support for the PCIe QMP PHYs
on QCS8300 and SA8775p platforms.

The PCIe PHYs on these SoCs require dedicated qref and refgen voltage
supplies for stable operation. Without enabling these supplies, PCIe may
be unstable and the system can occasionally crash under certain scenarios.

The refgen supply in particular works around a hardware issue where both
QREF and the PCIe PHY are expected to depend on refgen2, but QREF actually
depends on refgen3. This series therefore votes for refgen3 manually via
the refgen supply.

Ziyue Zhang (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add vdda-refgen and
    refgen supply properties
  phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300
    and SA8775p PHY
  arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs
  arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs

 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |  4 +++
 .../boot/dts/qcom/lemans-ride-common.dtsi     |  4 +++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       |  4 +++
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  4 +++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  4 +++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  4 +++
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |  8 ++++++
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |  8 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 16 ++++++-----
 10 files changed, 77 insertions(+), 6 deletions(-)

-- 
2.43.0


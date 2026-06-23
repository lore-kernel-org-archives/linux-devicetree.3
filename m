Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782172D59E8
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219930; cv=none; b=d1TW0mtULaAalltJbSpnWNHB8lQq6yMLrnA6Uxq+YqoK+yDRqUV8C04UZNxCO4CT/KUvqRldWF6eK6FIYQmFPNEm1bsqEqWq8zv+3aJe3url8OL0j2pLGxAAazgRceV6ZCN0atnWMldPB9iCytl4HpRheObvimfjkRJoUNovEME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219930; c=relaxed/simple;
	bh=DaHhfiRLFVU/fu3bWCMMNv3jDUDFySbSeji8kiG1hxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H3nEczXdqSg2dv/BTRuT3gD7olHrrtyXyAD1M9ABjxirwwbV3kn+HHP6LH34OKMlwOtqIcFcx4yjjLjTRs/JY5ms6yT+mTOXv6X4KY5zSic2QxRqlznFOUi0FwNcKNYuzncORSe2C8ykk62B7PDuSmuIrUQqZ+wR0kSrbrKidCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0BKUTsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw+6XxOm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0BKUTsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw+6XxOm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6fkN3744630
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DBViIKy9a0R4hZeNWh4F6w
	nIWTV470k0mjBWwWHsFME=; b=K0BKUTsmpy28hk2Qzau1vQI7o8Mcuf/p3GgwSH
	pCfqpmgchKHQkZlwIgGwt45IAh5sbhYVQ6ZSlOq44JSLh+vr/6ALYilouqhmDAgA
	JKW0+M8YEvezh1mgNiQpndX7xRd5luG8XZF/brK7bEfHdPhJTSRQtOuMKUdlX34a
	MyelkYYklMu9E6ls8fc1pzPxRpzom3ScPJMOVDI3gJVpobP2rVRkEjuXvqPyhIiw
	08El/MBU0STh7GpSb/NnP1bf8HnC/rE/tlHAXP2ukv9kuEWFszoBYRUA6fDAGB9f
	4BP+jnShavyU8EuE/GESU6oWUHhoJRtSzYAI10SbJerwYKJw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3g6b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:28 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7efdbe57d56so104011457b3.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219928; x=1782824728; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBViIKy9a0R4hZeNWh4F6wnIWTV470k0mjBWwWHsFME=;
        b=iw+6XxOmP714adgwFQl9FGTSVIsVRhT7ttyUOmPJ1XMErUuxFFClnKpBXZHxJXM1OX
         lc5wIfsteUW+fJPrz4GqAWN+QMsqNg6zR/0H0xcKp78+hqETpJArLpGdKpRX+x+eQCha
         yZbXNm/9OoFrI7oH/eqf1fUZIivhS8GiIKS7L2voQ6j/ercmRCmSt3+9wbE+Tc8+Bigl
         ILUPWPkZIsQk7O9fj8Lx6KL90WBnSHip/SLN9ZQevThc80rRuwMpMF90FxoP2solNh5L
         wno5xEhe+JuABUmoU+nT60k8fdLZ22cKWRI/Z2Vik4uEXqon0GO8Uffd1HmS0MavoiII
         y02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219928; x=1782824728;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBViIKy9a0R4hZeNWh4F6wnIWTV470k0mjBWwWHsFME=;
        b=VxEbtbkKlcUnKY0z2nbHiQO5Q/upPo0P9U9QA2MIdOkmTDnRTI+2/dn5Zr81n6ZQqB
         LqiadBma6mSWwxdioU9rQ8o/ZI2JFaUwS/W0UZABNJsBrB+7nevVbQXpvsaZUnXEs/Qu
         DC6oXAfa2mZUBN0s/41GRrXBf6wYmNZFtIJ8iQUMTzfj6RxyIYmlQ8cP1Ntn52hiOwZv
         IC9J9lTvFQ0f50TsMOwXtH/UepBxgUmp8n0tCers4cz9nRW83ToocAk+uZYKIRNVse7f
         KHiFlMHkCBUmXwv43ITVkHR89KuESKQTV64ZJL/WFbHAG4wiR5CstT/xW9O2Bgk3zAhK
         G7Xg==
X-Forwarded-Encrypted: i=1; AHgh+RqRbV1OCi9SstZf3ZtpfDPGNKqaast9BK1BU/2gWdwnyPt7Xyorr+km3dD7mkyXeC3nKEmf4M8RaY2w@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkHm1l0Y4oW4J/vI0UPkkseXu7vJbBzApLjnUf/ZEbQ+ZTG4v
	xDV9z5sgcCIb5yVpnTkP49MA+yiEZSzjNRZfydLnJNLqZea//AlwQlPECY+zeKQDZRoGYWPOHrr
	bUWkdxXzxkMwXif0Amkc1mtfyFqf6GhTyG2j4TRqAr2943lWh1QRc2aNaEvLgnyoz
X-Gm-Gg: AfdE7clYL/QXhLGPytY+lM9e6zcSkJEYeaZudFooYQJsVpRFnxJdf+patFrzO0dKEzl
	pBvwpwEhLJDt/zNZIxje904de8oJDBqZ4GQZ/akJi6dGRxy0llYucYoA9M7NhEdmSJcp+CLeg4A
	M8W5LJ9AQ8Y81gcWVScAqazm8x0jAWNAAmRo+Txz2//jVD+sbNbF+RL41TiZqMNiHJG//zT2Ve0
	Q0FkK2AaJPyWMN+dm0//SkdMPkHP2uQz3SPIYNWqNd4xTBrFjks/XM4Fojcpd0pGbCNUVqF8CJ8
	HUDifMwvql5w8QPDBQ5nboHTl7QHN90nymQgipPb3cgfwJezvPImR3NAO5tRHo2aJfrc8ro2KnV
	VIWv8eFbQILhsgCnnZPZHqnEahhbOjwwjd1fUT1TWBB1WKToCoKy7VV1mjQ==
X-Received: by 2002:a05:690c:e34e:b0:7f8:7e11:d0d8 with SMTP id 00721157ae682-806deb9d6fdmr22653967b3.51.1782219927758;
        Tue, 23 Jun 2026 06:05:27 -0700 (PDT)
X-Received: by 2002:a05:690c:e34e:b0:7f8:7e11:d0d8 with SMTP id 00721157ae682-806deb9d6fdmr22652837b3.51.1782219926718;
        Tue, 23 Jun 2026 06:05:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Tue, 23 Jun 2026 06:05:16 -0700
Message-Id: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyEOmoC/yXMQQqAIBCF4avIrBPMKKGrRETaVNPCRCsK6e5ZL
 b8H748Q0BMGqFkEjwcFWm2CzBiYubcTchqSQQpZiUrm3M1X53Gc0PJBK1XkCo0oe0gHl3Y6v1j
 T/g67XtBsbwHu+wGcgJW3bgAAAA==
X-Change-ID: 20260621-phy_refgen-db77317ec05a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1309;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=DaHhfiRLFVU/fu3bWCMMNv3jDUDFySbSeji8kiG1hxU=;
 b=fBnBIKVwLJ4q/a5apyIBbKs9IPH6R5TzQIeU0p15+x/XMDSzdvtCIcQSBH+0VbqkRhjeTEEQW
 MEJZrkvkjllBI6uSI75fcV8mWkVS+7uXcDXKyBrneft3NQ0+homLm+p
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfXw8MKawTaQvOW
 jBuNQ+q+ZEbMZ9xd5LcUhyXsgVV8RoHxaQMxYGcv98jbcKylchvlN1P7BEXVjBJoNDEzeRDim00
 gppY5IYKval2YvqidpIribgYGsw1uy8=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3a8498 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w8xSe1B2Uj80E1ISm04A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: lYJEaonJ9UQSvawAkhP2wwgGtMnXgemD
X-Proofpoint-GUID: lYJEaonJ9UQSvawAkhP2wwgGtMnXgemD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfXxfriPzdwLoOh
 dkflxlq9UMUZF4rl9gdvMbXHJvLjVA489y+chq3HV7nPrIgQWLZpgw9Kf8WtzHwViXOkAKXUA6/
 lilCN182JK29lNAz1LOdGWRXpHG3nvyQaGYLJNQY/VIzAbdhltPUQkk5Sg0ap5ED+VC2GFY1EIT
 xXITIoLj7fc6gfbBLP9skEvQKvVM27SigjIIOJpNH6p9TkMbq0TnxUJFlwEacZrkM1R5MkT45kc
 hzVCJtS+9xL9hM5R9khlaNz/Ld5A+b4mEV9sgpxzjnQYrXxZ3YH45z/sHA3D1+nOQICBhrbVo/4
 Z5GX85TCsUlpzvZgDdi/rJr8NMP0J3HThzITr8g4pvPNmRspYey5F4YXrrqRgnXu4HeClrZ3D/i
 xIiWt2ClouvIX+umgzMRxVM3k7bFh4FGPfsPLNeuPfbvrKsnQfRUSu+rl/MxC4aVKaKeWoqte4c
 OWCu6+rKyNoVTk9r6gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230107

The PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

can be extended in the future.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: glymur-crd: Add refgen supplies for PCIe PHY on Glymur

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  8 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260621-phy_refgen-db77317ec05a

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


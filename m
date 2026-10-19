Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780574CA792
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405678; cv=none; b=Gsn0SnP886IYEye5JP0oQo+ndcLnr3JOao3n+KuCCi0nRWGVKPfw/khxp5CiRpwBVJYsWiKJxyKcdWgIHvAXfK1yS5p3lRBcNbO2C0ernKdSjJPPXPvnee0ZIWtUE5rIObjLxop4xQRjnNfPNe56hr/chQ0BdKRF3oSwhKHyHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405678; c=relaxed/simple;
	bh=pztw+wbmd8BAbSF+vV7kN1W1rEZLakCRs75ARmv5RVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aRMKVAFq2tGeZVBySx3Ql0h0n8m+vgskXOrolMvdggfMWXEcvzj5uH5KjXupOUtySnuvkw23oRi0lf0J39dEeYLwcGMd8KNaSBePUM0gEarH+MNDjPb62MNq1c81qqvQaSWhGKRFYfsgN/5TAZP/ODLZRMVvb/uowMXKAc6tJDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ig0SEfDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HarA94s6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ig0SEfDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HarA94s6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OxYq1168075
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u5N2c5B+B4pIb+IOGWjZBR
	afdvBFwqjooyQXJ0RsHFY=; b=Ig0SEfDacqXEV7sb4JTZOPyQ+x8LWyU7umNexJ
	5p4Wem+br+5V/8xZCIV6+7bOzHDeMU8wqYYNP3NsQCwg9B+cmxPyV/qo9+0O/W6W
	gxnVBS1yueelQ55WZi74fKelFZcuPTB7SOj3e32HhqBd8QX2mHqWedYtF20Ze7sJ
	VzDJRsayQLE5mFNfVBZIBniEYWmsA+Y+XLN66B/+um4JFP/1hkw7ZKOPDEdYAaiN
	Om3j/vpd0Bcuel/Ur6mzsu8IYazcIcl3H+IDbfo307MKRnK2T3tXSPKRKUBu5J3f
	v9BPxrG3g4q0GeSHhe2qjE95dQq/6Z85SMTAQm9tHcSLHFiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8kkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1908058a91.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405675; x=1793010475; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u5N2c5B+B4pIb+IOGWjZBRafdvBFwqjooyQXJ0RsHFY=;
        b=HarA94s65qOlVpmCGmL6XBKkr4IVpkcPiMvXz3+hezIEnIDi/BfVKI3e+WKc64gXmf
         Kbl4do4zrRArtYsBvkR/3m7rdT0UrvKxY0DciuYHxneAmku00UZK3FttgrOLG+hyPWD7
         UESlcUTUpu29nszXdaAvjX5GmLEInwLIsIICdPXdxVDOLZmQY6nUS4Fx6AmPXEi/BmYp
         gY4KBKelP+/8hSXgUctv32oxXusSZa/pLnYDiHY77q7naMgW5k0G8yQmcUxO9oAFWeQC
         kNo7L8r0kiV+dN/92bRFZ8Opl0D1pJ3yPdyROyzXQ/YpdwmVSB7PxTKVeaDkM1lNu+aO
         BOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405675; x=1793010475;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u5N2c5B+B4pIb+IOGWjZBRafdvBFwqjooyQXJ0RsHFY=;
        b=jyugIIA+zSjeVWKdiovXK46S+xHUrXLbRaY5qffwNxV6OeK/w1TaTOyzU1qqJvXWmZ
         nVVeuHafMu6i1wKIjc2MfaX2cQWSAHeIyizqXvAbJhmxp8AViK37cYYsBsm1DDtOiUe+
         zRrRtJH7RTwpxSTEYkqBiGgi5+Oky/iqlsYO3WIivAOi98DGvlBo07OLIrxd/u1p1njM
         OvxDxWAEwMVAltPZtkNhx3psS61ZdJpbc/U4B9knjYIFi67bAO/Aj3DqP3YaD8T2EuIS
         zledI1jRNFo1jthU3hhOpISZZ2dAOrlmLPgnxTYfJBgatYqALGT8wC2f5Uk6T+nabhJv
         gEgA==
X-Forwarded-Encrypted: i=1; AKwUvBwMN6ZjhN0EG1dmx7ETDdWzM6zLQFR0yo4tJIPbD0XZjIXE7FDPPrMQVdjY3Xyu58/2wRkC/vXX3d06@vger.kernel.org
X-Gm-Message-State: AFq9FYLKdR1B9USVfPW9DEte3GegzpgFxPRJrv9wTlpjZ1Cecn/MTo23
	3Rz1ZRAWGfkI8QJ0Vx4Bwq1f3YvxM+OflcCO8zN3uBNvH2rQ9ylpCXC2EWPAIq0XM9GKX7SHnZ6
	weOo9qM0xzA4C5O/MNdMfea58MI7FRM0bHvqj32ZkEK64A3rjnumSFAA7coDLChzM
X-Gm-Gg: AYBFou2+Te1dzDIMTL+qq78Jsy5MZayh92FsmxkSQfqQpmCGJ0R+8LoTC0+z+SfLTw8
	5L8LItkXXYUV2SCWWeErRlXFi3VJG5je/YUsmpfePzQpXdG+9Sq3Mckv0bHB2Rv8FSYEztQ+HP7
	9tRlNKSTOZd8eBmxV6atS2z13rAAfRKOmQ2gLCL94Bsth9emeCWO6pJkVb5WFMt5fZ5DW/bRXaX
	uokTjyNTgrwChp6Yx3DjXGAC8qZLzv0/W/8REh9N6qaUkcvz0FudspqvWRAQ4sPM8rFH5xeuBV8
	7HGTaVrsj8CnAiS1pyouRtvfGLEV3A76KzZHnrYWh0y4wPJakQM0H2U3iLwJt5J/iRfr0FiYS6r
	NRHNdglAiGZlDn9SX8cgRoHi1snI/dIj1Q/n1dQ==
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr54103515ad.16.1792405675233;
        Mon, 19 Oct 2026 03:27:55 -0700 (PDT)
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr54103405ad.16.1792405674775;
        Mon, 19 Oct 2026 03:27:54 -0700 (PDT)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d7ef1sm36359785ad.3.2026.10.19.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:54 -0700 (PDT)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH 0/3] Add support for LeMans Draco EVK board
Date: Mon, 19 Oct 2026 15:57:31 +0530
Message-Id: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTw1WoC/42OwQ6CMBBEf8X07BJaCKIn/8Nw2JZFaqDVrhCN4
 d9tJR68ednk7c7OzEswBUssDpuXCDRbtt5FkNuNMD26M4FtIwuVq0rmsoCBRnQMbUDjobMOB1i
 FDDpYd56uIPVO76qu1ooKEY2ugTr7+IScmpV50hcy9+ScFBqZ4js606fVT0a6JU1v+e7D89N0l
 snrW6r6p9QsIYd9XRaqxK6tC3X0zNltwsH4ccziEM2yLG9nbzxoEQEAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405669; l=2043;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=pztw+wbmd8BAbSF+vV7kN1W1rEZLakCRs75ARmv5RVQ=;
 b=FjESd+AfN+LE5R6X/DUI3Zz009jZyXb36hRotVAgGNcfPTleQ3d1c5J6R6eDitD3690CoH4b7
 SSGeKxEeWozDDTask1CxtvbRT6+O+5mQINIUPhThdL/K3VetfCaJj1k
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX/NksTdlOqsOr
 FtGmt1FYSl18f+2oJsApZblhnJiAoRq+Or4H5zjXWkHcC5ft026KdzQE8gfDUqx74c8IdaP4lBl
 CY+OytJjg8RSUWkcx+ZMM9rtlSmjHwo=
X-Proofpoint-ORIG-GUID: tzaqH2-iI-N6RJff3IdX9WlLbIPgVTl-
X-Proofpoint-GUID: tzaqH2-iI-N6RJff3IdX9WlLbIPgVTl-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX+sqSpS2C3IHg
 LT8QgCA0ovBe8cP0cqTi+clVhLm5XZ3Ri+yG90CEWpb3TAvVGyaLvWNFou4Fca5nDFlCVWWjefe
 ovOlG4QjQDnmGf0VCr55n+FIoVm7Mf6klsySzZhQqMdkUiFh64NgJseelgVQRjhvhk16ZXqAvBp
 E6XK9n3dBr4M5U9dzGFZYgs+QJVsIupaL09SKNnEJbGALAs1akmAxlyLjsCZMICNQ3sU6BT+bXJ
 5CHktmosj54NZOzNQCGpHFxd4NDVN3N5upKNOGR3/9bYE0WK/VDVaOvzNYWBMUWzUonygLjMaEc
 7JnMhfyRhCDxzAiHLLGH2eAzpJlsIuZ+N0V0gp/3pJ8+kJrL6+2/OMEV4aB1IGBclTEbD0/W2WI
 h0JwyjOJDZkYI4ruPmCEMBC2vFn6LSY6ABqtyX0GAk9jpwrVgsLm8S0WgC9SCGcOydrtQ14gnop
 Ig5+m+7BgvaLKNeOXhQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5f0ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FK4VXM-tmRh7d4tgyhoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

This series adds device tree support for the LeMans Draco EVK,
an SA8775P/QCS9100-based evaluation kit consisting of a System on
Module (SoM) paired with the Draco carrier board.

The LeMans Draco SoM is a compact compute module integrating the
SA8775P/QCS9100 SoC, three PMM8654AU PMICs, UFS storage, USB 0/1/2,
GPU (Adreno 663), and essential connectivity for automotive and
industrial use cases. It is designed to be paired with carrier boards
to support different application scenarios.

The Draco carrier board provides board-specific peripherals:
- Native DisplayPort output (DP0-DP3)
- I2C GPIO expanders (TCA6416/PCA9534) and EEPROM-based MAC address
  storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi | 401 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      | 543 +++++++++++++++++++++
 4 files changed, 950 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>


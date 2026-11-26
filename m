Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689280;
	b=I1W6XS4QDrQF9Rm3CrQvMTqSZGRrRxBW4R9EEWjWxKjvmBdbYkirrijpuWuhOT4GY+J6
	 4Mis3OvtBcSEb+5YCqUj5XTgfZjnfjxJOap6hzLDEMt5ELRyC//IRRpFl0PqMZQ2C1LHy
	 aJFsaPrCK7ADaUJ4Ohvr8zEnWR2TIzOoH4F//v2tQ5geob6ca7mfmI+tgcBvLSYRtQGcT
	 WNHd5qaFGiA+8eEOS7acZDc5eDP+XCz/g1NhE31crCujqoPMGOy05cWOMV9+KQuMGZwj9
	 YM8sOlrhiuUehfMf5JFLh5xKTeycC2hX51VWIY/JF45dx+AsL8jziAqzsAW0jxNrfEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JYhq87ZXqNsEjS7JMY1mlF+52qvOkmnvtH+mBS178dg=;
	b=5ZQhW1un8ijBlXkZe0z/ImFeStK+BW8RSgTFQTDRMtAEDTUdob+1dec0m7t+8A0FegcH
	 D0SSYUqaimkBj9Ui4hPPMg+kzdpYks6I3LOyTk9ofjn31w0V6ucjTnr8Fv3nbq1lHYRVh
	 Chux0rKQIJ/4RlaXZyS8cZUYVuXTJyzdx8Sa8DEjM91g9rYCRfA8Gc60oJivQ45lWLkQf
	 zMl0Fli/RPL6a0+7nLRGEfB0KfDOht3uu7QKt/BX0pFdCT0wySoErW6aHZn+lM7On2suR
	 yw13S3Oykqv0o02jc5Cgie8G3QfECKAzzZhUr6byulaOIlm3MX7YGybDx9PRA62EfJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7LuGVMh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699D606A31C;
	Thu, 26 Nov 2026 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9699D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7LuGVMh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXPLO1370021;
	Thu, 26 Nov 2026 10:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYhq87ZXqNsEjS7JMY1mlF
	+52qvOkmnvtH+mBS178dg=; b=T7LuGVMhIja7bB9kbIhnZWMOIOZySRUhcNxzdU
	tsNR+OCYtlGKsqM/AJ/ajPdEyzMCMHf/vY1wNqi4n55CuvOyqqwJ4geD48URm712
	JdELwiSBbnbIaNoJdIMgX2ucVD1G397OUWNPWsEuQ0ukUJ65cfgKpO+oFxm583Bj
	iWA2J167LcxVX7Z2Cs4KkQuiAkvEwlWxfP0k2kKfxPwLKotRnDgWjhSFuKbv2E4L
	I63S1EyC6esErKwaVCKJgcdkKxHoT7RRnT+xl0BJub/NT6MVR4PSxLBkeq7mb6t0
	XKpDCSuY87f7VkvIEbrsBZERKnS2Oin5VVpG/u2+LYoBGUHg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2p1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 10:34:33 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAYViO4021435;
	Thu, 26 Nov 2026 10:34:31 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 6AQAYUSA4021426;
	Thu, 26 Nov 2026 10:34:31 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: add Monaco Draco EVK board
 support
Date: Thu, 26 Nov 2026 16:04:19 +0530
Message-Id: <20261126-monaco-draco-v3-0-0b603afa1328@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwLCGsC/23MQQ6CMBCF4auYWVvSmQJFV97DuEA6SBOh2mqjI
 dzdQlyocfOSf5L5RgjsLQfYrkbwHG2wbkih1itouno4sbAmNZCkElEWondD3Thh/LxkNBWtNNU
 GDaSXi+fWPhZuf0jd2XBz/rnoEefrG0L9DUUUUnBOBkutMK/MzoWQXe/1uXF9n6WB2Yv0YZD6M
 SgZilkdSemixfKPMU3TC8zw5xnzAAAA
X-Change-ID: 20261105-monaco-draco-2d725f0d891d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Dipa Mantre <dipa.mantre@oss.qualcomm.com>,
        Sravani Tella <tella@hu-tella-hyd.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX9mgLcpr6dOUX
 GexobRx620Sqm/hCIiPuKKVavIacX8Kj3O84pa0FlwltNst7qWiGj1ZWt+vbcxPbTqFaYf84zxl
 sTx5J/DwME6mky9uQzavGc3OwziQsRCYfXZ3rzXm3uoEOOuZhHN4hM9JNKJAJtT2S3RFQQHO8EQ
 djJypbTnpG3OQW8QjOet46VfVcqaXrZTgtsNVS81azy+Dl1pehxTRCaUF4cIGs/MfDcns0om30l
 J5vaNYJTeV6FqRbLvJ5wDP/zxLPVRsICy4X8Cf8yi2cXcBdGG0oY1nJY/pzwyzBcL+3MYQ/Wo0r
 EYuJ0fR1y5f/cdcObRm3VAVh3MZ+gQmA0Aw16p0yhXOfUYQPl/R1desONbgAtPALM4MDWYSuf5R
 TU0XAaeRvY9XvKplwwCN5gDRFy469EDmoPNohlFDDRDO6f6fkOwcnska3Qw4ASlJo4JQv+UBLZc
 D+I0gWIfjdmOv4A9MKA==
X-Proofpoint-GUID: W_gmXCY3inFysZUnXuKaBLre-Fg-0ElM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX9T7TzkKF3/1j
 89eCRW6vZRTO3J60JvI/8l22Z+4QyNadEG4ja/i0oRvd7DidvMbH3+huQHtsa4gMC+7u5GMN0Nc
 PjJ9NMs+OzqOeFvxGoxCEW9JDIqiljk=
X-Proofpoint-ORIG-GUID: W_gmXCY3inFysZUnXuKaBLre-Fg-0ElM
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080b3a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OfGTQUpXpFICen9CABoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

This series adds device tree support for the Monaco Draco EVK, an
evaluation kit based on the QCS8300 SoC targeting automotive and
industrial use cases. The platform consists of a System on Module
(SoM) paired with the Draco carrier board.

The Monaco Draco AC SoM integrates the QCS8300 SoC, two PMM8654AU
PMICs, eMMC and UFS storage, USB0/USB1, the Adreno 623 GPU, USB
and UART interfaces.

The Draco carrier board builds on the SoM and adds:
 - DWMAC gigabit Ethernet (2500base-x to HSGMII PHY), MAC from EEPROM
 - AMC6821 fan controller on i2c13
 - I2C GPIO expanders (4x kts1622 on i2c14, 2x tca9538 on i2c15)
 - Native DisplayPort output (DP0) to an on-board DP connector
 - Dual PCIe (pcie0/pcie1) via an on-board TC9563 PCIe switch
 - ST33HTPM TPM over SPI10
 - M.2 E-key slot connectivity
 - Audio Playback and Capture over max98091, Audio Capture over
   va_macro codec DMA.

This series is functionally dependent on the driver and binding changes
posted here:
https://lore.kernel.org/all/20261123073459.2361169-1-karthik.s@oss.qualcomm.com/

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
Changes in v3:
- Sort all DT nodes and subnodes, with appropriate spacing and blank lines.
- Link to v2: https://lore.kernel.org/r/20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com

Changes in v2:
- Move PCIe reset and wake gpios to port node (Sashiko-bot)
- Add compatible = "pciclass,0604" for switch dsp to create a platform device and invoke it's
  power-on sequence.
- Add Audio Playback and Capture over max98091, Audio Capture over va_macro codec DMA
- Link to v1: https://lore.kernel.org/r/20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com

---
Faruque Ansari (3):
      dt-bindings: arm: qcom: add Monaco Draco EVK board
      arm64: dts: qcom: add Monaco Draco AC SoM
      arm64: dts: qcom: add Monaco Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml   |   5 +
 arch/arm64/boot/dts/qcom/Makefile                 |   5 +
 arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi | 320 +++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts     | 764 ++++++++++++++++++++++
 4 files changed, 1094 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261105-monaco-draco-2d725f0d891d

Best regards,
-- 
Faruque Ansari <faruque.ansari@oss.qualcomm.com>


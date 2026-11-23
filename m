Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430735;
	b=uVpwGHemT3N3EFOlszbO4vaF82j5J8ZziU8QN7FUOUitg1mWFI7sQK+N/TbDCq0gKGgR
	 aVUgCH4/8riaFYxArOKNey7iatm6//c0b2UPNPkNkXpwoxAjOp2MHU5U8X6xHl/JPZxSW
	 UWLlaI/OwBFH0k4berBbhVhixuuFjb2/agoFFeYptdV47n/iKu4FY5z8A+RkNXLhE9/2B
	 4p9awnfLnZHYXVmMpuFpropy41WFYeMYGUKlz30u/M8o6Y8s+KhfGGqjIKLXXyi4XXEaI
	 UAC8caCNgtC3FYQ4hFRwfegqkYJ2X4gMk3hH98CWL5n0Ag90kBXZQAyOPZbYl/cGf1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430735;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oUpEqwY/+w5AwAJClspe+tJn46saqMfolD/UMh3zsRY=;
	b=QaC3HaxCp12j91f/1bBkGLiZ3ZZscvNQS80l9W6lT3OoIcdLYo7MgJ/3QZxwbPdL/Wmw
	 mOXg6BVSQs0k1a6K0KihvXSBQRSO7XtAWqr8hTVBJyKkEbmKqhGA19jterNXczdR4g6eq
	 RrwUpG+I3d/jmsGKWJ012MDmC2ivg0F/W/LyTeH9vZ3pZ3AMbn028Sn7J9xP9WCMxsBqo
	 cXiDz1zXNoPK89v51OObBaS79FffRuBbWK2/uvk/XY0pWPauc2MB1e6HkNEu9ZZSXF4g9
	 EMczF+3AgLA0CeE8IEetnvGNd6io4nbfDBECAbkB2WY6Y1n6MBoZoDk83OYtmvkdIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMtLGDOI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DBD606A321;
	Mon, 23 Nov 2026 10:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DBD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMtLGDOI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FtFF2785551;
	Mon, 23 Nov 2026 10:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oUpEqwY/+w5AwAJClspe+t
	Jn46saqMfolD/UMh3zsRY=; b=IMtLGDOIlE+gk42jBTAwvho5GFCE7q3AnXMErW
	ejSXNUBvFzhyAF1Bq8/56TQlemFzbNWmovmG1yMuB4QjdJduealsCkSEBZKXU0/Y
	5elXCOeHZcr26BNHk1R+6fnZdjpe5O5YudNcj4e26LASGLgMJK8ZxZwPR35KJARf
	WJ8ryeEAKpFrM/n+ImpeskJY7ZS9aWAECBn+vt0LeSRRhzJ9/jDFkTtFgZaCi2bs
	8ppBq5hdav+ibrRCASU81un3UfKoIEiv92tw0QmcfKMOLLEMOPUvIORhGvxAx+kz
	xOyJoyQ8Dtr9+g/ej3H+PZwL3UT7LinK0XKnef5FuDys1L0g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd10qq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:45:24 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANAjMnT321126;
	Mon, 23 Nov 2026 10:45:22 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6ANAjLpQ321114;
	Mon, 23 Nov 2026 10:45:22 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: add Monaco Draco EVK board
 support
Date: Mon, 23 Nov 2026 16:15:11 +0530
Message-Id: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADgZBGsC/1WMwQ7CIBAFf6XZszQstqV68j9MD4SllkRKBSWah
 n+XNl68TDIvebNCNMGaCOdqhWCSjdbPRcShAj2p+WaYpeIguOgQecucn5X2jMJGQVK0I6f+hAT
 lsgQz2veeuw7FJxufPnz2esJt/YVQ/ocSMs5MIwg7ecSmp4uPsX681F175+oCGHLOX3dnw7OvA
 AAA
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
X-Proofpoint-ORIG-GUID: 5RhR1bbrhI1XzPxx2sx6E7x8mfbVk0NY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX15VvimgE2yIj
 5YP8yghQSdIt9utXAon+3mrsppq763/1rh+mGh05Prclg2wXL+opyKz821HgFbiyyMVIcLZr+hf
 bZeK5uhcN8NAQPrVqJxyqImCTYnoC+s/Cv4UyNqTUv6MG/a+k7Cp8pHEvQL8PjN5dEdsROuhPTE
 3+jhVmp5XVeG2q3WxahkhMom8duBhiEWsLGkOgG1resjil1WIH0/06qtbe+hjyNIasACbENHiAj
 vH6yKonYzppaBZBzyFN0M8/SzCEr4GayH6hn/l4c6X4YrQSOG0RHOSmxqHinCLC1hqv/pAPntB5
 MLAUdCUvTB438WEQuW7jUQs7PiuuwkBk66Kwl6pQfFBzj8Td095iSZSr3QcRYir8QG8r9/XrEQZ
 rDsvhCnNb+ZuTW7D2u3xYOmJo8dwJsgXXhMwwwPT8Y3FMA/daFef1dc/s3Py2GeFelILaY3Pd6v
 SwQZAk2psAlNnVrDEoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXxRJT4JbGSInl
 hasrEBOLcwuFhwG9PyouLnZVFDjNciUEO1EhdJ9fs/xChERi3H1nYwlhOoGJ14JG4b9xbBE7GKH
 f1GTt+Mt0or4vAmx8h64iDe/b063+0s=
X-Proofpoint-GUID: 5RhR1bbrhI1XzPxx2sx6E7x8mfbVk0NY
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b041944 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OfGTQUpXpFICen9CABoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

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
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts     | 755 ++++++++++++++++++++++
 4 files changed, 1085 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261105-monaco-draco-2d725f0d891d

Best regards,
-- 
Faruque Ansari <faruque.ansari@oss.qualcomm.com>


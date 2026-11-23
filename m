Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431218;
	b=p9BGCRWMFxNbxVbG5fCtwXBZ1d5tLhgS/chKkXw79Ym/3nqt769TEIYjgPNf2ItAMwxH
	 IbSXf1230duHAAO6n4rRLNYmyoCTyG9VOh44oYTDSc3+RXPsg1cj737MqZi/RYdHCCiaD
	 lUpprXj5KXXdvuckLwphoCjxVS7a9RwuOTIMMiQzhFFK93pOhdT6SnwMnUKrJMl+gNfio
	 T9sJLhnYOhfX4LD5vv+mHJ14WS0GNOVs5YOTXjZ3IJ5M05hVi54qVSkIkHFXw6Zo1o0Wq
	 0stX4qqLX8vmUiYiZ8s9M976Vl7QcMILTnrvbGtgJ13S3Wa0LZqTiAbWv7VPEFoQ6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
	b=zhiLyBmHASoe93bRRKoqDefEfC1LwOSAS/TF7/dlyK/I7GBwsqvhzLOeZ84+w7zZzLko
	 S8ZwKfBtCvtAUMRsZ9aVDAD74eMwJenIMpG7VjeIqDGPp5eVW1F63VL6Zl5LNrzEfxq9v
	 NNErGuvE7gvbO41I9Rqs1TnXK2JoI2eLIVfxdw4eOcUcdnvN4jxdgBNsQyfs3DpGheysK
	 xyeVnlA+8ZDo4yG/ZeEYNg5LKYrma2K5ooCUNVxU3Q/3UmG+UOmjGIU54tyKmjYS11Ksu
	 i8DLM68vxjEIC+arRXVbL6WYGawn7PK5HYv0qhJBkwHQrMgiM1B6dX5KWjduCzC26aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HX3HwfBC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0NRInf+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22B606A332
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B22B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HX3HwfBC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0NRInf+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuGW1395904
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bNh+CyyEc4DwqBf8wMJAEG
	ceVFKZ9FL5VhwVvApn47g=; b=HX3HwfBCWdXddtSwB4vmaRfMN8yczlk5b1UupW
	RdZJC7p3jzLKWOdaFpDy8J4KzHGAfX+9dN94BPJ036lS7WA65NjVSB6oCOVplQuS
	VVWxOU28L5Env2+ooo/tK2NQVqQIbEATQtacmCNhP1JytBHmAbM/bErZRjHUCeIw
	pYXU+bh97mXVDWGAVTmSB5KRtkyxFUnaM5WcER/Da2pulRCo24a2D3gg27vXu2P9
	E+ZGv7zWJh9wwsbLGZlhlpHNYW/HingX8FXsMAJgvlfXu/2Y3yZDP55j3S/GpTMP
	f3qHp43Bbk5d9YKEXOu3Twyj1mGBPi3ftb7w+aD1CV3sGjcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx189r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:53:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3970735a12.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431216; x=1796036016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
        b=b0NRInf+k+rov2pCqiSbuliuxvZN5qe/RO0VdbSD9tdUFIgLNJkyCg/BiAl8FNedHP
         MqiL7EG6Y1CkQ4mGPTiXbvjB1OJ7F9cCmrHHvrNM/ZYRAdU4oK5p2uZR0N4LxVzYqDnD
         NKmNpzHPXb/6iZpG2CW7yu3i5Vcbzc1sWHdPJ/WmnfBlAetFtctSIMToK2NOr4MJc8eq
         xgRbWAsqvks/enCbtOw+bFMpSOp/VFwev0IElOTDlYSXttddiWr2QvUuH7SRT5FXfpKu
         1YcvhYbUno4/x9Ij5i+FITZlM+9N1DAhd19jPmwJuIpUFx2h1ls8Pp1g076qX3jhH/Mb
         4dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431216; x=1796036016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
        b=Z7+FJb59RVnLgMRpVkQsepslm8OVuIq5qDO9CF64m5GyQ3XW4fr62lkqKa35xMKtS+
         RQW+NrBiHo5DmmZOZjE4tQ4ODB0hPywTPjY5s+71KF5lz4spAiyN3en9bB0UFhQLWyUL
         uHQdK9FVZRXqEFcxsSkmL9uIt7w7O+FHgmCUB7KUKSuzseIeay/gHT0ev4zma6aOb/D3
         f2Ybye9knF7F2vBBXJwWCbmzH39zIydlxJYkI4TrioSa2bSsUeWgt9dYtyK+e97uIMSI
         RqT237ilR7T5vIUfEkZ5NDNc371Rb+AGaJ41zUw8GYAd4m4mxEaJnNhKb7kfv1L2mj/8
         az9A==
X-Forwarded-Encrypted: i=1; AL+hErFOhB6vgrfFaJJd3asfm02YKkLoKOQiYg/bCu4dbDViZy0fiUhvAV5BD0ddD8kcX1/gXBdwUPscGxX7@vger.kernel.org
X-Gm-Message-State: APuU4Z9F2/tapCDW9ei/3KgakW6MO1ElkOSCDGBYlKhyHXK4a00lgbzI
	lZOEk+2jDyVlgeNss9WX7b9jnkEbpCr4WrqO0aQmVxqWFd/rFClbsuM3AcqqH/zC1WuJQ+/nRjz
	t0Imn9GFerZTRxckXbCZEIFzGiXIJ+/DBKOcrPDrgyhKGIZ0xF1q3blcOe5GdsmGY
X-Gm-Gg: AZFdTZfURmxVO7KGKTE9hsZe6dxpnToUqlm9vKO3uIVc69hXVViK5+YYaWoeWWff18c
	MkNBbn6mZDkVldk1SXN0hK3nqs8rXpw3Nv2gHBZVBJZpPRA9f7GwdkuHcWb3ywpCv9hB36Wwsza
	i5VKYv8jTsExqkZaH3Sowcfa5BcxXly9LyjjFLyWe+YqwQtG5hJWQm6nbKfRqhM+iZ5d5XUU6N2
	Jez7WhWntxDy/m4QOTfAlf1LHbU0p1G+kvxNOuCJdYIoyAvr5GKAZa98Rhh6rqc+csU+oWTPkYv
	hZACAeKyiOv3h2+NCEN+mIrFDsg8Gym0F7mkQzxk2RjEqixVh8wnbBiziVDc6B8qo5jik47waqH
	iSQkC0SxQrycbKkpFUKLAeYp42oIFMdDfjbXPlDTQRqO+fDO+IukXrDqnINGJObtyD+84nCqAjN
	hb2e/0Abxwx6s=
X-Received: by 2002:a05:6a20:7351:b0:3eb:a4ae:3aa9 with SMTP id adf61e73a8af0-4014db5890emr12796899637.63.1795431215978;
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
X-Received: by 2002:a05:6a20:7351:b0:3eb:a4ae:3aa9 with SMTP id adf61e73a8af0-4014db5890emr12796862637.63.1795431215504;
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board support
Date: Mon, 23 Nov 2026 16:23:09 +0530
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABYbBGsC/42RwW7DIBBEfyXiXCxY7NjOqf9R9QB4iWlsSMC2W
 kX590Lcqq2USr4gDQxvhuVKIgaLkRx2VxJwsdF6l0T5tCO6l+6I1HZJE2Cw54wLOuAoXaRdkNp
 TY50c6GqMVAXrjvOZclWrem8aBShIAp0DGvt+D3l5XXWc1RvqKZOzQ8mI6bp0us9bfzLyWfb0N
 k4+fNybLjyzvku1W0otnDLaaamwLQ1ndfnsYywusxy0H8ciLSR3W+CHzLc9d4FEFhIb3XHdtgL
 +IYvf5G2dRe6sWGM4GKa76gH5tg404GVOnzetU/5KAcFqqAAKEFXTpExOTzJMvT0V8RHq9glav
 eC3DwIAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=3830;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=Dx9co28BgHh+ZbRepP+Xi3Pa2bEV5oGrB1qLTdgcJbU=;
 b=4zyKjN5Pm0j88C6+45ST9/N/UP/MG+/PJBJwPyESKzaRhVvZPWR2YeOUtk+X/MWhfcNyDDiY4
 DDpJnBPQg2zChKMMKOSBz3q1NibLJe9gOKuu9y4L/DFwQ1L3JpJm2bN
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b041b30 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=aa3sxGzdGyLt4iHDoZcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: dlq7DO78VPgrAqtIHYKppjiMgLIs8d8o
X-Proofpoint-GUID: dlq7DO78VPgrAqtIHYKppjiMgLIs8d8o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX+sex4G5i/xB8
 LCbrXq9r3F17BH2kOHmfuzVrb/osmgZKgMnIKpmO/+/zYNh18yGoRSZ+k3IvddJJqxQpaQRQv01
 9KrN1UVer8F4XL1E6vG3CMOrOYWHt2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX00G6wK22zdLH
 C6NbxlfUNAKtNjBnioGENPV9NFLBhHG4K3zlRhErmHbp7wL6jvh8IWNa3x+V3RL4w3dXJBFcnFZ
 VRzU3umofYUegCXKJ0XMynkiFqHzYRM96LKELd/MpPt6vm30rJA9jSDtQmfhM2nmJQheEVJRr/I
 tKLVaG5G+koO7C08QjGwxCLWkyOVTJEMDMJzs7g/4FhZaoKo2+K+0ZEy2KKD+AdsYNxfqwzpsKR
 UVMHqb0Jz+lg0nOExTImwgKk0lquy15mQvtkD0e3NSTHdm85W+DJVE4+TIN4xNAen6jv5Hw6HKR
 O7mLyh/rHgY4Q7C6AD495xk2vtPb7dBhtvx1fb2ILHL07isSLxyuVaF4p04PWNZlZAnz7iwFdAI
 IK5jXtwEnplZxwZF7QFXoeIr8XqGgxCmSYqr7AEEkSjA3SQcvLYLDZ4mUigAbvW/8F3EBYJM7Jm
 4ct2zFQPeQS5hnfZoQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4
- PCIe0 to NTN3 switch and PCIe1 to x4 slot or M.2 M-key (dip switch)
- M.2 E-key slot with 3.3V supply and PCIe/UART for Wi-Fi/BT module
- Audio playback and capture via max98091 codec (Tertiary MI2S) and
  VA macro for DMIC capture

This series is functionally dependent on the ASoC driver and binding
changes for audio support posted here:

https://lore.kernel.org/all/20261123072522.2358819-1-karthik.s@oss.qualcomm.com/

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Changes in v4:
- Add audio playback and capture support via max98091 codec (Tertiary
  MI2S) and VA macro for DMIC capture. [Karthik S]
- Add #include <dt-bindings/sound/qcom,q6afe.h> to lemans-draco-som.dtsi
  for Q6 AFE DAI ID constants shared across carrier boards.
- Link to v3: https://patch.msgid.link/20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com

Changes in v3:
  - Add PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
    or M.2 M-key depending on dip switch) with pinctrl states and IOMMU
    mappings. [Sushrut Shree Trivedi]
  - Add M.2 E-key connectivity slot with always-on 3.3V supply and
    PCIe/UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2.
    [Wei Deng]
  - Move MDSS DP PHY supply assignments to lemans-draco-som.dtsi.

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

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

Change-Id: I1ef390e8d1538ad58c74b8247dc6b405267b3d19

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 990 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 422 ++++++++++
 4 files changed, 1424 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>


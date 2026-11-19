Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072249;
	b=sk5s4bDTVwvrMpVvFPn25Ea4tkiAy5LYYraAQMX2pSgIHZ8xxX64VMDkRyewRM4HUJV+
	 g/UtwJ3rxMNTUCbhjWcPbRU4TqU+LykzAYl84zarAoysQ35F2ssbuQmi7kGvWF09tkDLk
	 dvuvKCuo2SGnv9f+4sdaYx7E4ZT4bwvWxwON6Uh7OHY5/rZjuDDZ+gkTTDPLnTS982OMo
	 pL6MjxAdnYntbhupAR4PstkAj3YI4MKwxCeYy1ZKRlIcmDu5dyomzQ1rt4ltKyQ8WNVRi
	 4Isku0iRlZQ2YNcWap1LjrAuMFwQn4WGXtz5oIrXsqXMaJQHFvCfwf5cC5Qg7RZfspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Acsw0qyovGUap8db+iIcnylVzRzfPacwYuj8IYgEo9w=;
	b=ShwroK44j5Ua2VoPC5l8HZyoiB+Jcp2FMHNAFRLFeFQJ3KLLnY2yzQmCTp+mvW72O9Ce
	 T2sspLK6p89aPnCOZKv0WvQWE5zBul99vRGdDZgRoi16i3NcqSn1q6rL8cRHY1gMN9pgE
	 gbEkpcRnCkMt/Qf2XRmiURr6X6lUcuRGzUAW8Ib0xXpKspH3e6a40qX8GsL6lsnTzo4Z4
	 IR5fqmBcxMhNnndtHbA8UfuKnEERbJ6B8iX+gk0qyTX7ElDQF1BWhAGdyaETCBfkH6Ybj
	 JPAGS7On2KjylcNDD49jJpIvh6aYeO718zwiYz5Mkal19668mP2aMna58LArodUKUaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E9mB/rqu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfPGlhM4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1DC606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E9mB/rqu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfPGlhM4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6uSWF1559521
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Acsw0qyovGUap8db+iIcny
	lVzRzfPacwYuj8IYgEo9w=; b=E9mB/rquOXn8j8xVJ+TcPynUmboMfJ2ZKgchaS
	LCT26JKww6apw4CQpKusocBppfr8E12OtbyQO2NYkrk5KW0uSaZe2Nt6Pedjj0BK
	W89gjGZ67BPgaNbq18kWbG/DGB3+wrWZLNs4a1Pbt0SmrJHjhrvr9zGpEVoW21hR
	MEi2q+suE48r4/yiWtgvtnxlU1yKfOOsFyRwmIamqp+q1DbOmj/AmCwahdIEjirU
	+tPn42fPGnpdf9BijAp4TLciA274ClA4jJcTy7RdPla9x6MPTp6P4lXDxqVysXJJ
	p1q0Ou5wJgd5LYyy5imzX+80wZlbp8DfupUD3OHWjwpbvnXQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux85hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:10:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so1531016a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072246; x=1795677046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Acsw0qyovGUap8db+iIcnylVzRzfPacwYuj8IYgEo9w=;
        b=GfPGlhM4H7JryDdYtVqnIVldhq05FRd34sUMKjWEnPoRX7IDqeyjH5EfVVIjEQ4ymd
         hcRJKf3w8mc3WicqK81DvvezFLy4cQCzjMlIPaPLdpaOwiSNlixxKMz4CMNGZA2CEsD7
         Jb0CD2GNRkNH9bqB5zPOsdCrzGFA3KGmxoC5wD2PfAvsYrx9QDshK7ABJox+tPGXDMuM
         OT+QwujLsoCXWmc6YRphhMtw2dRPiKnzzc4d2mU3RldiknTNQOWRtVtY/vGt/fwBn1md
         dFnkogP1JAg0VrjNUseTGg7wmhlTwPAQ4ovJtxKurKljnXPGUZdKF6GQ6/PQHZm5CNk1
         wo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072246; x=1795677046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Acsw0qyovGUap8db+iIcnylVzRzfPacwYuj8IYgEo9w=;
        b=pv3RSB5WWZ5NpcKSLxIDGlakvJ+dY3tBqj7PAiJUY9ntiG0mO88PNCMHE61qRe0JO3
         bh4KXNQvaItXnFPbLavtAj8R4GGDzrFn73ETFwrzflgZM6I5GLA879vPwz1DX0IZrKRF
         RwmF7/8XtCENuTSZ2eLX700GI0V0ziejknxRy9ULCfkaNm/c+mt09wQcMDguqfkj4H5a
         J5GUFGAEmrLKvMpTbg/iMJ0nQrqiIxexh1XqEG7z6d51LrVTL+yQSMzL1EaIZa4JkP7J
         kTQCySkv0q1QzvsWa6STGOC56wod/32R+elnLlNW1Mo1787kx14StImbDu1TNc5kSzXb
         gQzg==
X-Forwarded-Encrypted: i=1; AL+hErHq2HmKvNAg723iZayQCXnmkESHbuKrnHJBq8462HDh+JMesdw45vqHa1BjKlHdrTKkT+VtPCbJrjLU@vger.kernel.org
X-Gm-Message-State: APuU4Z/fiFEtZGRVUwfT7MjyGKOtq2s01TL4/iyAP0DKkRyUmjDpO7I+
	QUKwwn3rI9BhcXI19/aHCod1NUdTk2GGv6owKEJRt6UmHLQ7evVsOSaCZD/zz0VDBjoHkfRZ8Kq
	eE/vze2sHWy3rGOPfw7vCd+xllETHpR93p3+xSvNpPuON7+VQPqJHtAtR5eYX3yLE
X-Gm-Gg: AZFdTZfCUWRYgUVSjgI2hak2vZQNGmN+S2JbraeYRN9GE9VYXeEHrNuFOSQqEpHejq7
	dJpxQW3Fs1U8BFT+7U4IFa7zw0d70R0kNnjDmxEqqsYpMFu/vg58SaBbUsZemjLDcAWKwHbGKV3
	V5QhT3pbKAmuSyEDy0kEavrGEwgL9PhiIcxRtv45rlne+7FOURPyMNG3Fvn4uDJ59thB8JwZj1r
	sI6/AwrJPZ/bqW9uU1Sj3Z+p54dBiw8ZbhJvNFzz3ykr6q0m8HgRuY+566Yvh79fv4o//2cr5/y
	cLu6DJCnGDqhk1y52S2XcgFTYZ/R/GE8SQt1g1c9A/T+togH4oNwb49/kuv5dUNH+GdDhea9tTI
	J7N7S1FAirmd4cUde7HIUB/3yDV5GXi8pppQnYax4nKK5ZwXZHnQSRex46Kwe/Wq40q6VMSbkKN
	Yn8Vu1Oe74EQ==
X-Received: by 2002:a17:90b:1a86:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b3d07cd6f0mr5089118a91.63.1795072246165;
        Wed, 18 Nov 2026 23:10:46 -0800 (PST)
X-Received: by 2002:a17:90b:1a86:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b3d07cd6f0mr5089104a91.63.1795072245709;
        Wed, 18 Nov 2026 23:10:45 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:45 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board support
Date: Thu, 19 Nov 2026 12:40:11 +0530
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANSg/moC/42PwW7CMAyGXwXlPKMmqSjdifeYdnBSl2ZqE4hpB
 Kr67ktAE0LagYul3/79+fcimKIjFp+bRURKjl3wWeiPjbAD+iOB67IWqlI7WUkNI03oGbqINkD
 vPI7wMDKY6PxxPoE0jWl2/d4o0iKDTpF6d70f+fp+aJ7ND9lLIReHQaa8jt4OpfVyo8yKZ3B8C
 fF2T5pkYf2Fat8JlSRU0Fk01Na9rJr6EJi35xlHG6Zpm4so2ZJ6kuV77yaVyRppbztp21arf8j
 ruv4COouqSWsBAAA=
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
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=3088;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=CArQ8mp16A0sNgF7DdUS8Knm8k5ocqWb1J9WJ8aO0ns=;
 b=CJhVARD1CdrjbjCGIDCc0orj/rqP3rV5B85MDU6ajYo5Y0vX2wdXz+ooz+BIJ3yVr2i2W+D++
 2Iq/EPclbXvB9VqqRiHeHi0nuXIoZCRt0WmPdvRk/QQESFaja79yXkk
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: OCiXARERVztW4k7nJZhO-Gqx0qk9YUla
X-Proofpoint-GUID: OCiXARERVztW4k7nJZhO-Gqx0qk9YUla
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXxrgAlInv4A4k
 ZMUis7SCAFsTjTbKxa0QTYfKmpaxZQK9JlRmplgsgTZ2OLljbek66KySAt6sheF63vPSC24npWF
 U18Rw/zIJWH03Rtc9XieqqdpkriRAzo=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afea0f7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=aa3sxGzdGyLt4iHDoZcA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX37++Q4cHx8rr
 sgjwwEAH3FVB+zact0hLiNh1T7PNVAMAD5hXDzMbmQkT1H2mkpqvWG5PhFS6PzCOKsxDYEp79ik
 9CbpPhoq9aQAg8ajM89J02SKGHRVCRjNijoMQONU6vUOluqkWIsOQtCnqIBhl7+IRCj7Z3Kr1i5
 571KcbSP3lRgZdBiA8Sfgkpv4DzZMLh2KsKeffirBoPIYPzN5Kr2zt4GaQiMX7xiMkGl3JPGVBP
 miHJu2wuFV8ra3JZ0/FIhWuAk4WdJHDU+/Bgna2/rwJhYyh0Mj/op0YE0dJa1fEH5rEi+AT0cNH
 9QRScVFnZqLvWcKjbQ6wQx8mjiY5JVMlWrsRW/1D1elhON86Dugkv9v+TsDeulhZQw0umURndOF
 mCdFth8f75FExn4xDAyPHSjxA3+uYYj5ucohYloQwYRgTiq5NO/DuJHLclene6G1TsZfnoc1NCL
 HlSfWTREZ2m6YLK5ybg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028

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

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
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

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 778 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 421 +++++++++++++
 4 files changed, 1211 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>


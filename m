Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD33437479
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789791; cv=none; b=h5uyfbDI7zoawSSt6hm95D2nBChL/j5RN1l66x/ec9wfQtWo/gKTBUA1vQKEgIpg/OjPXRo4+3UYrF5XcbuIGdJ3bUVbhpikzvQSI3sTrW3gQZZjmj97qsFmQIU0kOc7liU3jnL8HZogCMXaPqbojGOcM75OsSKA2A9KKuJlWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789791; c=relaxed/simple;
	bh=SZoF1r1ZFl1IDeVvaRrJjXtsKrxqP0tcNRsGuKvOKXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BB0V1qn3vMFK/GoUL08gYPrx+YVHyedciD8Csk5T5QrHzIMdmUjkWS9U0AeT60bI7Ertx5c/b9msxmjQcK4cezi40Ow46wHBPoDj0UZBlMQuLYzWG0LY2zUlaZEhAZE6Bpa6wH5RPYcq/Eq8am1mMuR0islpN/FD6Gjf5zlS9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYhVNb/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OY2Jyh3x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYhVNb/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OY2Jyh3x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hOB474947
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8u+xOD3u5q1Zym1HS1bDVr
	21UHfxOOzFZfmACqvP9Oo=; b=kYhVNb/7TzATkb7Nu36Lj1wPU7Y+7pLLswo2Ph
	7i4KO2anxnJVfeXriDmOMElEfmyAQCV7KX5glpSROXOV0M42wzCLNQ/8O5TA+wkQ
	D4JlUqNBBJAS3hiMI8OfrDBVbTuA39iMcixa07WydD8W1ffYXWspzENrM14rP9pK
	KudmwV/rSMMQGiDc1QAD+ugQlDSygCJ/809v90IsPfcIZ5K6bnRJNR39AJK9DQE5
	vEyy2oS5pGPgbGYfHRFyKElkRe3rxeetY9WxFYnUL0wJby19Io4vW8lW5PerrRUv
	++isjssnz/VyoE6I+OA0/2cvsaWqeu38JEGauHmutACrxsNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9w5mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35b68bc1985so242024eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789789; x=1792394589; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8u+xOD3u5q1Zym1HS1bDVr21UHfxOOzFZfmACqvP9Oo=;
        b=OY2Jyh3xf7GMW+i0rw/xMKwjcdzJjhsT6yTc3VZlQzsKTH50c/WSmyrqgSFsVmdB09
         Zxh+QgNkiMKZtmXlNqMyHv8AEgdpfN4jGXAfq/RSdCxmsFrsedMGgbh60aDrwUTrp38H
         51wSkoL7Q2TMo0zVY+Nxd2Q7YtP6rx57C0UKxyEUYb8nrtk/I4fOWLhiGA9KCTy/H8Sb
         HBSCfSzIE51PbsBpJOLk0TshJJAKfHcuQKHyo+DN92J58qU3BZTPpoIFtaNxwPx7C3PU
         7DnWamxJT5wOtR8LmUYflZVHNjoDh2kyogs5Sq1azzUAQXmuQ2ROmwdwUx+qiWF/UjSp
         dzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789789; x=1792394589;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8u+xOD3u5q1Zym1HS1bDVr21UHfxOOzFZfmACqvP9Oo=;
        b=wbPBCgcijhUOQJfLPN7S/Cl5QXY/XQtqE2uqSwxgimEiayTGW0nhXMD3OAeMT/Qu3A
         wP0JdHdCwhE0xXHd5VbBAbNEAlAOfwNpPi4NqYKI6Eig0smuJln2cYYL+++uUd2cNGhG
         g/DgIXCDnMli3CRWIVeBC85Ncp+oZSQ7QPdEcy1w0HfHpNBr6vGJFLopeVFS7ZtMC3PO
         VOd4VUCp0K+BvRcR9KI2D2lYRZn8w8tVfi31hWzia61joijNni1kj8cb0COlN+E2mjH4
         gpyfe4MvqxpA/9gNv2g7zS0M0uzZ49Izzk2wqFDvtECv2qRByISdFQp4q+FfJZaYtgC0
         AKXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIKJo1cssL466dA/FLzROyYN2s8hqOOB1Kn7Vds+YE05YrxUY7yMBRnAenBdNjGpPaRmo9WyrMve/3@vger.kernel.org
X-Gm-Message-State: AFq9FYKJxrxSww/a++Ht9u0/t4x0ZSCHZO8uV97HWQs1U/8kkUqJA/yw
	dJ5MHfTuvbo5NM2WTxoqeHbqYGGguN1VgVou5FlnUEmIbaoc/64frtysEVLsfIRveXLZ/Y932ar
	G7uSAm3UaKPFImcGXeAZIXxpDegabrH4ZEPV6I4RXepg6guNXlEQRCMvMI5kVgQae
X-Gm-Gg: AYBFou3jvFbaDHiTttMME1MFuRETkXX5l8jeusKwzAm0MPVtaT8hXLkA+AkL6FJQA02
	8Z888hc6do5er5L3kNqXS1VujUkR9tk/X3NzZ+3M/cihmxEjPX/id5YUSKq2a3BgLJahSfhh1O9
	eIPLfWl4/3cJKJY6htpQ7M4VMPw+YzexDeZVVy6AC86yfVu2DJr7XHj+P38+R0b1dLxkPLPUoIo
	A4v+rhb5YyC6IivwjijRk24NGjAw2AWBdqXkDt4aXFGca1MdJ/vvrW7OUp6ChB0qjmoGT0DUMVT
	VaSmsj8kb0+RPU+YN4QHUPZxCazTCyRoVo3Gvf2nGmMjT6g+3C4rr6a0WYAB4WpeLZUKkZVeT1l
	kqHqVNXRCPYYFB/MJfLYl1eSqyRgGjfk0QaCowo+hrsXMAzbWwRi45QTg0qgfNmURe6Yojv7gaO
	6yoJhr7MbEk8KGm/Yjd62QnlhpdBlb
X-Received: by 2002:a05:701b:2084:10b0:156:cbe5:9467 with SMTP id a92af1059eb24-16a5e77e226mr13162811c88.21.1791789788639;
        Mon, 12 Oct 2026 00:23:08 -0700 (PDT)
X-Received: by 2002:a05:701b:2084:10b0:156:cbe5:9467 with SMTP id a92af1059eb24-16a5e77e226mr13162777c88.21.1791789787971;
        Mon, 12 Oct 2026 00:23:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v7 00/11] Enable mutliple peripherals in IPQ5210
Date: Mon, 12 Oct 2026 12:53:00 +0530
Message-Id: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSKzGoC/5WSTW7bMBBGr2JoXRrD/5ERBL1H0QVJjWIWsWyLi
 pog8N0zohPXQG2gXYjiEHqPQ356bwqNmUqzWb03I8255P3Ahf+2atI2DE8kcsd1o0A58OAEoOi
 mIgg1xKh88io2/PFhpD6/VtGPn+d6pOML+6bzYhNDIZH2u12eNquBXiexOCVAu/A7KiXU3Tarh
 7qZlUbklEQ+HK2SIGYpQETLTXR9JOPg+76U9fElPC/SNQ+Pt0VOWkBW4FoaJbXxQoo5jKHj51c
 Y1gO/38IQhn8UcssoDr93S0fcU0TvnW7RafU/gnF4Ogs8WosQMBrsbwsOYUrbimtLgDpGtEabo
 E2HzjhPVseWAknTe+yCVLZZItjmMu3HtxrtLGsGnyn6rxTrnfaJUDGcOtn91UA1zeqKlvZCqyU
 RcBAdEijr7tD6ilb6QvNMgDcUpZa9RnWHNte0udA8E86Sk0Fywj3coe0fur06N59BWDRkA/9R0
 dyj3YWumX3Rbrm1NhlK6ByHcIM+nU4fHARdjVwDAAA=
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc8add cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OAVUEJiqWiMpwp8HbvkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KNsdgQLBoVuLA3KwfO5eZwJsFQbnb0qw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX2hkqDBVKXZG+
 z0FfU+pZZyj1XsRhcMBc0oRGH0YmlOgaX/VbGOBlw83tCfdkoim1siG/+NYaHxlgWfmnfpdRs8B
 AyVkLubPqR9z5T5CPYnGOKEF1XvNMW0g7vhihHxFWiHxDEejLW+dR0RA/4J8tAaW6ET3CzsqRno
 m+1aaZ/hVgfkvXDbvKvGdgPIIMwlCamTw7HJfENxeWIu4uPDdFmq9/DBfuQ2zW8ycS2HbOFW5o6
 deD+tOS9CxiQTKyVGtSxmFiI66nk+WQc0YQF4XENz/XYM82lIVUCCf9Pyms/tQI+5RDUTe2I7uV
 hbLEBPNIXPrddaOIdKzkVwzXIhMb6EzNBpGbBxz8IdpDXyoinbrD72mdgQuIa2iFqstSo+yCsBU
 9Du2Hb7g2KPnKWjafgn/tsBHJq6SV3X0RDd2nOa0KAjOWW9kRk8aP+Kxu3woQZM+LnA+59myBwY
 ipve9jSxPlifwuiA5aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXwAheQwqt2cfz
 igEdCrr5Ah/IzUDVcQfxg90rFCMVUdNRS7oQIOpDE7UejKfmJqDivJ4IkLOKct4x6XbqBqIRxD5
 hzf8GcD8v4qP6V1gTWOzVdvBDoULumQ=
X-Proofpoint-ORIG-GUID: KNsdgQLBoVuLA3KwfO5eZwJsFQbnb0qw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

This set of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v7:
- In 'Add nodes for multiple peripherals' patch (it has R-B Konrad)
	* Reduce critical temperature by about five degrees per recent
	  calibration updates
	* Fix placement of 'efuse@a4000' node
- Move 'spi-{rx,tx}-bus-width = 4' to rdp504-common.dtsi instead of
  rdp504-nand.dts
- Change 'reg' details in spi@1a80000 from 32 to 64 bit
- Add #address-cells = <1>; and #size-cells = <0>; to spi0 & spi1 nodes
- Fix incorrect placement of rng@4c3000 node
- Link to v6: https://lore.kernel.org/r/20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com

Changes in v6:
- Didn't touch the existing patch as it has R-b
- Add DT changes to enable more devices. Not sure if these can be squashed
  into a single patch. Please let me know, will squash if that is
  preferrable. Following were added
	Random number generator
	SPI node definitions
	I2C definitions
	PWM block
	Download mode support
	ICE support for sdhci
	C3 CPU idle state
	Support for WPS button
- New compatibles used are documented in
	https://lore.kernel.org/linux-arm-msm/20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com/
	https://lore.kernel.org/linux-arm-msm/20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com/
- Link to v5: https://lore.kernel.org/r/20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com

Changes in v5:
- Pick one R-b Konrad
- Do not remove ipq5210-rdp504.dtb from arch/arm64/boot/dts/qcom/Makefile
  and add it in a subsequent patch. Instead, move the ipq5210-rdp504.dts
  nodes to ipq5210-rdp504.dtb-common.dtsi and include common dtsi in rdp504
  dts file and introduce rdp504-nand dts in the 3rd patch
- No code changes
- Link to v4: https://lore.kernel.org/r/20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com

Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (11):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file
      arm64: dts: qcom: ipq5210: Add support for WPS button
      arm64: dts: qcom: ipq5210: Add C3 CPU idle state
      arm64: dts: qcom: ipq5210: Add ICE support to SDHCI
      arm64: dts: qcom: ipq5210: Enable download mode support
      arm64: dts: qcom: ipq5210: Enable the PWM block
      arm64: dts: qcom: ipq5210: Add I2C nodes
      arm64: dts: qcom: ipq5210: Add SPI node definitions
      arm64: dts: qcom: ipq5210: Add random number generator node

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 269 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 729 ++++++++++++++++++++-
 5 files changed, 1008 insertions(+), 75 deletions(-)
---
base-commit: c74ef2fbf60ff7e7b956c023a881e87502c1852a
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com>
prerequisite-patch-id: 5d4c92815c73188205f1b05d0f42b02224e9f51e
prerequisite-message-id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
prerequisite-patch-id: 08aa18faecd4f3588cfd01f3330eadb1a76dcd13
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


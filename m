Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B138655C
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326162; cv=none; b=IUdl61EEw56WF+qmHSfh3wDIvLs3uZ1+R2DBA939vJTSoStDb5PUdr8BNuOojkDgZIxB6uCPkbYTqWqVWK8OaErMs7sAtsJ0/omJEP3S3USDGoPctlJrrMrY778hxfih5oRZZh8P479Y+cVx1eTK8MQXSnK9q16bEfyidlNxk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326162; c=relaxed/simple;
	bh=RdFm9GylrrXXv/eeKp9jybJhFAM8XC8WDco+aM6QZOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5LSaQVMnd1Ry+l8FX3qtnVzMUjb9JtyvXYEp8s/MWWCv+a/e5ltTo5CedtgjzsvBFxp6SxwyhXlXFjwNNWX2xeLjcjYifZBwBEc11fHnTdxfQqw3MSCGiZ2IdObD5JypHdO6HSKL/WPcaDaTRNppyND6Aty0HvlIYwkiEKop6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SA1MYBMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1MN/qs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SA1MYBMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1MN/qs4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RK0mep2383087
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+S
	vG6pXlRU=; b=SA1MYBMv2oQINiSXWPiyj75cCCqKhQtibSeZsvS5Yh3gVG3xW6j
	TAg9Zac7zhqAA4cRd0onzYu2aVGfmAeBRs923zWqGoplkjaH+e0hRXonriAXukX6
	BG0YrqB6wOWMwlxQmNLz+63fOuj27Ur38P2pKC38Xl3VycLJlR60jdjJhGRY2Odn
	jifunNy2ixO32nxPAEKBIyoY5O1wt8W147Y8QejXMjiNfmlff4e7OrcyICkdWJu7
	eYCnsPlE7rr7qcCh3PFKFFp8rD5fnt3j977VGGIfmK05dqND0NMmAfQpPgv1ZxhD
	ZvuDDw+kCla/O++ATbhaSsvMKHaGq0qJH7g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xsxks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12dd33dc337so1168849c88.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326158; x=1777930958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+SvG6pXlRU=;
        b=D1MN/qs41gNxHSWQfhEVaVdtFJCPtDmoqy5EuJ3ggqoyOG7n1R9/Q9wlpGw/Qorh2v
         deKddUgS4WjTyk1nMz1i2WYcF1Y0MeUKTNlRPWnXe6wN8LziygWPwcZuko+xdb3kMxea
         1XuGUBHGgsCJm/vkCsnbk1my8YfBUg4vKMgdckASofpz385IsU5IYU6LGUk6pBAAIJao
         8Oj3DgWvuZ2kfrW8TL1I41YqLopuI6k3ipZT0Puc9J+oSvOldafEQTkUB3n0OJE9UL/r
         4EaoWXrfZ1MoVVRz+4UVvU3Pz1KkRRfg0QZC8rfsmnWITLLPKUFmJA0Je0aZ74LuSccs
         dQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326158; x=1777930958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+SvG6pXlRU=;
        b=BGK6ZN6XtibMgUm1s8g+J+kNKUhF+VqdtVl1KenGcJ1t3cs2xndtuDiG2b/dOTMXW1
         a9ylL+teotum+BXCghfEPTO7flQrKlfsxy96n1Ez1xnMSfs1K616Cg/zB5C8kIZ8V6TJ
         6U+NIE4r9xf8hFmA+GitrjsDoeWF6+A9WWvU4nZ92iW621cOWJ7ySQ48Ljtr7l7XetIM
         q0Y4QhesCywD7TaltwZT5C7+G2YD1yKk7z4CYLdI47eDWBqj8PQyMvp1MEu7f0amKUla
         2GpqPgqH070wYChrlZCKP+/qgPPxUNaG67H9fU0J/7a0MFQWh/TzzoTZlMIiAitQ8SPy
         oAHw==
X-Forwarded-Encrypted: i=1; AFNElJ/k5VuxJRhCJ/Gn3Kml7p8Li7Z1SznEIS9Pf5to9VK3lhcEoxxOTMGpDlefkvMYQc5i+vcE8cXC8lnO@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDWWAtMCJBarUTADTjhPkLyhjDKOP6TXw2OSp+gfHg4bmaTz+
	Rhrp0bPm/7kRpnMZd3XohsqFiLSWIeCkLJPFXapR4JVqJwC4JQs2RnS7jhUUH6FgoHObfao/O6v
	Uq18Kc/grVGge2Y5if8B9jJGVHiU2hE88ejdjSic56Ez3Mr++EqNjcAtUWPsd7Pcr
X-Gm-Gg: AeBDietgfHdZjENl789/cjIa2N2H2uJE3ydrQ5pojhc0cc039d5OYWtRKxPoWfyGW+Q
	iJScA0TjzAFOOepNp6Jcj3a8cltif0ulGfhoHHzaPvrah5uoc+2qdTob5+ypzC5U2L1N8JyDTkp
	rIbVbI1WKNcXK5mKYUmm3S30mIdQh7nqkxrIJilYr29XPGFqtVfcqTzffUdynvhQgdsISdtxGpd
	ClrhcW9649Q+mYK02l1IuThwLcTCIpow72u4fcpKrZGns2MMJVmkFRoH0YoXkenqm2lfUPXZiIC
	g+ybKIn3hzrNGvckhwcjHxode9KqbRpqXY21lL/PDURCQgy8BHbVq0DwB66JSQN2vZACrdmYd7S
	Ax6QL9GFZc49r+msijS8gwsczfJNBcyVc8YrEiI1wyE6sOCPz6e/+9KXAm9vLMGFGOvCvmCdunO
	AKLK/f8R+Xdg==
X-Received: by 2002:a05:7022:b8c:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dddb46febmr179863c88.7.1777326158499;
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
X-Received: by 2002:a05:7022:b8c:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dddb46febmr179836c88.7.1777326157948;
        Mon, 27 Apr 2026 14:42:37 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:37 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] phy: qcom: Introduce USB support for Hawi
Date: Mon, 27 Apr 2026 14:42:13 -0700
Message-Id: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69efd84f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fySfh4wnc5TE2N7XS4QA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: tvfXseEJatKh-aQCaQstatlhHMh-EtBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfXzSaxAdwtnbPn
 5w9KlltCnFpC88hPG1CdKVQjAgOZSBgJK5XO9Tsq8IqfvXS0wxdR6K8VAvTarFpj9b4SNJaHPC1
 S05z+ETR0ciUMKA5Hp3UM1wT/vyoYWai0689plQN/sumC59qPY9wyNEfUfk3/Z+cuDhetAodE8f
 WLkNEEFUsimas6PmiNdhteqy+6KrH4uXFeKJOp/Ndyh1IazCodDXm84Ttk0+D8BRMmALaIKe/2o
 Jrx3nAsTWzUjKkLwsvd4/SBoli2Yx8CXJc+NHre+w88nJfMAoQ+ubMRYYr5zzEU/B0RCJkMgp0w
 54up1LP7NOXj+u4Uq0xiTYWZVzal9GgecDBJ1YF+xN/LOYcXlKdhb6TsG8dOgW04W4PHKuRtuph
 ZzA027H4QTbJLW4ga33eULsYbYIddvWZ7h1ErrwIZ375NhO64NxHb6I6Jmrp3VyfuFyq5WVGKYu
 1Os95R6iVRAPz98Ufbg==
X-Proofpoint-GUID: tvfXseEJatKh-aQCaQstatlhHMh-EtBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


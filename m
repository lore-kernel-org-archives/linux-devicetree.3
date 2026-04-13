Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923A7391E49
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061581; cv=none; b=PV/zud+wrO4/2S3OQupEycbGKLvwUCoBX7+U8gcjrpK1v7WGITx7oZwYplgTXrNZml9bPc7SgkIQdkSHOCPihA+MvaBR98B7+dhoS+dpsGlr7NsF2sNPe5pGGcbajwXiIs9qj4clfK5hfsYpn4PECsB9kQp920P7xNKS+pwPo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061581; c=relaxed/simple;
	bh=Bp5Zz9OAjaPM/NWNLYQwMkODCFblbcKCNjR4M7lIWIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RZa/IgO6aOnSKdIsBZnof0cR1ndIP2eiSzgk8SeGKFCEZzdpv1dFnw1T/4LzyvlitD4cF6D6QT3ajHA64SimoqNKbv1WL4JisbhguF1TImuWmWk+aBst/YRw0t999ukuYgvkOk1vbethwP9ywamX06GZCdV+OBfEf8eQsNARPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwrRp50v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grb1ZnzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwrRp50v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grb1ZnzA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CNvfgu677692
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AWGCmR8aJAExtEtpb9rmjD
	wl/rMkwNi772UTCaZg3p0=; b=NwrRp50v+ssZCi01RvcEQ8aWl7J+ZQ++xtbBzD
	I9j+zqMVB9WqMKG1hBvgnZyXOsKbsJygGJodgFTY+yL8ALYDBg8YlQ4ww6NqZl5e
	GzceiQvZzisabjbprH0F1R6G9QOxYk1/rY7veS89qGYSe3ltK+bSl6qGdkKYILPS
	ZQs3nbqv4/cFwp4VrlgU6L2f0r8fNsL7ylk9/HhH1tWcDIxYR8Wc6jubw7VYh4LU
	d5o2lWyL0VndwnVyJ7PIR8q8uRgYxHsCpH1O9XV46u2kpw9vRJLhje5101ItNmYG
	dUGOPeDgWZfcnlpDgOiHYLTl8sK99pYDZiHc6NRuNTZt/pSw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhv0vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d9da2559aeso812461eec.0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061579; x=1776666379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWGCmR8aJAExtEtpb9rmjDwl/rMkwNi772UTCaZg3p0=;
        b=grb1ZnzASTfX/i1UoyJiFEtSWNk5y+lDgm2Uemeq3bRds0Gl3HMskAHjJVvQOYNvIP
         BVQ/SZ25cZBV49iAah45hstMp2WPIIo5vyymJgTpbG/fijZnhuLNrkbZClCfAl3Jt6/I
         BmbVK/MOcpBaLRRIhEeKSH8k/AfiZP2ESY4G4QqBnpuRkYe8j/r0fwlWC4ZhT0fta29s
         3Oqvvf/AfUVi27jrAKpa3wUXBHMXpGLYXF/wUfYHvxXj40o6EC7qD8s9VuQZ+p1phXfF
         9eQ1lF/jXI8qeUtQcrXQjpbNofmWxp0hW+ima5BCo2RC+zS6P8vl1ZZmm0OtEDpsUE0j
         o0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061579; x=1776666379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWGCmR8aJAExtEtpb9rmjDwl/rMkwNi772UTCaZg3p0=;
        b=jJxITLNuwa0Fl6cUUzFmRgB6oertnIhyxp4zp+SOqRWD0Ik9Iq1Du3EE/72G3DYid+
         0odt+JZS5bYwjcckbWpPFo61hH/ZMkwZMPlnj3VMprxoHCB8apVNUAHuGNq4eibWGiEA
         H/d4zDIWjXtSr0Dtos21En2DdcxhLUMGwUdZ2gc1Ev5QMcvCJKitO4nU3xM3awVgzLeU
         2cIkNQlKReNQJwERabD9VXYTXweNT3jL0SF9DAHAr+nPie3b1i4XErjlRwJx2PoE6d7q
         rnYTdFMJZHKbrJyHu8EzyS+Y9HuvKshKqTSkohxkX0efQdzbpMiaeFSockeWq39jcvJ6
         cPNA==
X-Forwarded-Encrypted: i=1; AFNElJ+ew5y+y/pyLcdZtwjwvSqPomtUNyjVN8bg0zfM9Dpck3G1pr3FicMwg4ISox0Ssr1yXbxuoICN7cPm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Or0ymeQUAG7dNure0Qt2BmMOoFeWp43aUlBt6rqNxqVZH8P9
	9T2c1ssoX8ttGmtPs2Hh1ISCgeGCK/X2vTnmRuhm9tvtjKxnW5ndYeRfCPVlvcbEatRXhd6MgpK
	u8Spo4EBPyW2ZXIJu0HPvgmPA8TI90xMJnbniXIbDLUAIsqVrZbO/0daT+0HmIj6l
X-Gm-Gg: AeBDietZInHOUqT7Pg2yo5c6QdCe7EF/JFvC+TteoRadDb2ZM+l9ey3HolQG/UcIpaS
	aodpRHauv/rOc6JGPDmPisLJdZG9cqmdqnxG3PYJpfvvKM6O86ekpsgfrE6Rg82jLC22bEOpnTO
	no5mnjBrWV2EM4kUfhdMVYT90qKEj5alUemJtSjUP78PlrvfEHOnVWHmyQfwLKfHRrJgWBGxLSc
	LTUgj2XU7AHkQ3o3aEGWfSkXz0X5JGJMAZnMLBjqXVG9dmjqemxZROrXrLrsmkNjSq2Zq8S4/0c
	VhMhJ+7kNrPR6l8k3hwwWCqoaQsf5Yt9yqEYaBb5e0h7fAjDURWZuFbetmHXByw4kM/ri/SSB4j
	d336MtPeQy+Q4rE+xQc5r++B5MZ8EimpYbDIbar28O23MbTVLzBh3XP7kSZaxd9pUrSFY
X-Received: by 2002:a05:7300:8607:b0:2d4:afb3:7aeb with SMTP id 5a478bee46e88-2d58a19749amr5883484eec.27.1776061579125;
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
X-Received: by 2002:a05:7300:8607:b0:2d4:afb3:7aeb with SMTP id 5a478bee46e88-2d58a19749amr5883476eec.27.1776061578573;
        Sun, 12 Apr 2026 23:26:18 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:18 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane
 bifurcation support for Glymur
Date: Sun, 12 Apr 2026 23:25:55 -0700
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSM3GkC/x2MWwqAIBAArxL7nVBu76tESORmC2WhFEZ096TPG
 Zh5wJNj8tAlDzi62PNuI2CawLSM1pBgHRlkJqusyKUw672dThmyZWjUsdwqahS11ohTW6Iea4j
 x4Wjm8I/74X0/2QFFm2gAAAA=
X-Change-ID: 20260412-glymur_gen5x8_phy_0413-7dd33c953da7
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=3157;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Bp5Zz9OAjaPM/NWNLYQwMkODCFblbcKCNjR4M7lIWIw=;
 b=GrDMInn2G/ze720Ld5pMb115eVq4lhJxVmCJqWG/qScsXUB7uOYNRTdpM3yFhWzwONT9Ui7hU
 VHWIWSHkAn8AjzrJjH1sbMUBwcpjFGi0ZHkDTXhFEZ5AOF+PUGjTStq
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfX1+6ryXXZreUZ
 mLA9zGCI0/ox/wkywAIdRTTPAvlaUYz9ymr5shEDV5v/pAJmOvEucl1SWSZf/JRsfCFBiTBN9KH
 AYmBS+/o6X8qNAstI1mdRZXpPQsgwkak+YCu775L8f8Pe8sp/XDGzdFUvQuwqJExyVnfrYUw3/f
 KX9t4041lwACpYz9MWKJer2MH5iPumnPPZRA32Ruf+B3nCueis195LDQ15t9HYJXh+rUvij/Kp5
 /WOqXQIsxyLfGeOkepvIQDGmWf3t1xmTG3NabWwQ9Es5FAg4nvlyhLZUdQiNoQNZcA6pgPWTbCf
 pIcUOK+0JH/nrf62bZe6M+u4PsKiSeoIQ+yKFAhm+HbnclHANlU/nror+wHKFh5Yxnc0rraYMAH
 Geb14wCjhWv8LSKU4rdprC76Rl6tGIeujzovgNIst1JAZeEEiUEqJ5dya3Iima1pBVyin/IFBO5
 zby5XbEYNPyyi5Z10oA==
X-Proofpoint-ORIG-GUID: vddzsoGV-QqJ7Sbw15HE0osjxU5Fr0nM
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dc8c8b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eou8XWEe3vdVWCyqOSsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vddzsoGV-QqJ7Sbw15HE0osjxU5Fr0nM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060

This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
Gen5 interface.

To support 8-lanes mode, this patch series add multiple power domain and
multi nocsr reset infrastructure as the hardware programming guide
specifies a strict initialization sequence for bifurcation mode that
requires coordinated multi-PHY resource management:

1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (phy_b_aux)
4. Poll for PHY ready status

Changes Overview:

Patch 1: Updates dt-bindings to add qcom,glymur-qmp-gen5x8-pcie-phy
compatible string with proper validation rules for the unique clock
sequence and multiple power domains/resets required for bifurcation mode.

Patch 2: Extends the QMP PCIe driver to support multiple power domains
using devm_pm_domain_attach_list() and enables runtime PM for proper power
domain control during phy_power_on/phy_power_off operations.

Patch 3: Adds infrastructure for handling multiple nocsr resets by
introducing num_nocsr_resets and nocsr_reset_list fields to qmp_phy_cfg,
allowing the driver to manage arrays of nocsr resets using
reset_control_bulk APIs.

Patch 4: Implements the complete Gen5 8-lane configuration for Glymur by
adding the glymur_qmp_gen5x8_pciephy_cfg with proper reset lists, clock
configuration.

Patch 5: Add PCIe3a device tree node and required system resources in
glymur.dtsi. PCIe3a slot is not present on Glymur CRD, so there is no
changes to glymur-crd.dts.

Changes in v3:
- Add description of each power-domain.
- Add 64bit prefetchable memory range required by some EPs eg. AI100 ultra.
- Move PCIe3a after PCIe3b and move PCIe3a PHY before PCIe3b PHY.
- Link to v2: https://lore.kernel.org/all/20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com/

Changes in v2:
- Remove pd_list from qmp_pcie struct as it is not used in phy driver.
- align clk-names on "
- Link to v1: https://lore.kernel.org/all/20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add support for glymur Gen5 x8 bifurcation mode
      phy: qcom: qmp-pcie: Add multiple power-domains support
      phy: qcom: qmp-pcie: Support multiple nocsr resets
      phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for Glymur
      arch: arm64: dts: qcom: Add support for PCIe3a

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  53 +++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 316 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 ++++++++-
 3 files changed, 478 insertions(+), 20 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-glymur_gen5x8_phy_0413-7dd33c953da7

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


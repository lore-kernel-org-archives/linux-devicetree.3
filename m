Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58744ADD82
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203038; cv=none; b=tI70D9YIQanMIhdcC+25Xiqi7ogvGhXY1cEplwBIXRoGgIWAFVPYMU29ZI4wE6hrSxR24tlkWMSlI0QfukOolwn6ftxHGeeZGUL5rXncHdyCP+4TNnciQmogpgQM3b6iAkqWdwhrARtyqIKgY8RQXIyJjW9vGXdGse80ZxnmPJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203038; c=relaxed/simple;
	bh=zOSsQzKp9Ek2NG4SPxgCoFd3tA9TdR//8RVoOu+YbLw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KXg5kOb470BrUKmQ0aVgBkomMSIl4Z50jnK190EuOB4QORT+VvaJB77Bt7MhjM6DXdnTOQc9/U304x7PLWJRcYTQpw/jpD2QOmM+ldfgW8In666qbbUHB4Iorsd60jiIW1SOQWR6LpsBqYCHFyVJ5+5swYKThcYypwzEmSYufWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Am+kO7Mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYmMebS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am+kO7Mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYmMebS8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIUDl61406205
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E804jMacXtWtCDDLwtWj/k
	LWRm+8LbGO5xfXQFEkchA=; b=Am+kO7MvE2JznTUpiQv9SuQvbh0OX/Ic8+aNSd
	t1MErlnFU5i100juIcjkAXCarM8B5S2gmabQZt68Bz/+nAwpBCPvfZ1YpK3+Q77p
	Ew8ipyemW8UzvkMr4Zk2TMq+gCgziEX1lu/BX13+/TN2zxDxXSSN0B0kdv2le1Tm
	PD2I1xFfrqdubBZwQNnfXlpLH1i1O9PJHRiBdH61/uJjxUAWCAyte+Xm+CBh48J2
	BPNEQRq+5iHPnkUDfrEA2YYhNdqzcutOBfvwS+7JYrYNpdfS0WNW7aPIR7m0O4VC
	2Coe4tXA0ylM4rXC4zuEniYmZBn+suwAkS86dOLGGAY61mrA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgcde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8581f7723aso58277a12.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203035; x=1781807835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
        b=WYmMebS8kthS2nqn6VtXvUdgNAj34OVPgyUcwmi1G4ktszS0LEqMc8aoe1nx+zKyfK
         g0BqTdCbIfvbs6LtamxHfxIZG73SLj/5pr2230XGH1+yj9Z6H4lgyRdCXDRAjphAKgBP
         gVGnovDUGO8TfuTw81KFfDZQ7e9XC00O1ImgljvxBAXY62h4G65y4w16uGhACG/ucook
         hyoNx76Xij3fco8+kGSRe3yFNufJ3oYsWOxxRHOoUbBxpQX5h+HKcPQWxcdgv9xO++/f
         ZsOg948wBA9LlMeNRkw1Cab32IwnqOlImyLlJP+dk8kC/kA7wTwu6A+97U09TOF5XAgY
         IMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203035; x=1781807835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
        b=HzQqEEPYOviqDOme+0sTs7w7uTYfA4UQ5Wbv/OEf3fiXOVCtYczNkC4ME8qwNz1DYn
         ylmFJdOfAusB3lESnlW4rzLHQEbCLfGDKY/pWcqdo4JxLFyg78BnYCAZtyZHzO/O4E+c
         W10Xd9mnI9aEwSpm697A28DJMTHY7rKvH56Ox2XxNw92jNflGmq6Cza/NK+qXtGwDo0/
         gBy21UQJAU7ItUStDWcrQFZNg6IS9zIWUJ22TvXqXMqIT0xMLEedTBEazmdabuazHSUy
         YsQ5wWYBjjupDbefHkJvR1Revm/v3iwopmMuht78lzllvy9BVx56cM+fQMNlOAB2jG2R
         nsiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wYZS9XeZKZRqLl2ADEdJFVzOHFRLxHIDyxDYO15PcdsI/Btvc0YDKNs2B6Pzlqf9bfs44lnCIZLoX@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcy1gniemqhY5QZTiMdWkRxha7gxYb2XMTGJsWkX2fyP2ti4g
	cXxhyNWgByepshaOPeYgKi6lhg7QpsVC0qP0rV/l9HfgpyY7FZ5uqXiREC/vv9oArjw6VOENfoE
	HFgMjKcasg82UaEMBljpDOx8KINlgqYaYMSk1I2rVOqxuExtdUgBgsE8SdE+aIvl7
X-Gm-Gg: Acq92OGQAxY0sNFXxVkkUJzX9WVpDK2By/EPYy3bmOGnZknRqzsT/R9iWxGW0tVm+8e
	hfoZD2KhaA6XlWpqbh/IUtlo4HSge5rsLbIs4G7WKm9AdQH4rbm0nh8Uj9JQZF6elcv9tc+44FN
	H7KT8fV7ejiSj9uSkqgayIEZX8oZmHeezHf9gRTQoHoJ9ppZLoOVgJZ/H/N+ptI2eEfTVCzW1GS
	ckC8nAKhcGZsnDmS6kTkXwlaZ/Q+dVJsJ+7GLXl6+8SqU0OTbiEQyrr4zHR1SRaxsI246EYo3Ub
	Ly8YRBe+Rsz5CpGDSxjcxorjD9vpxMVoNVsyU8H+K2OBjz4HHPtWoCYK0Qar1OjYye0KNj0GTkD
	+wIhiknjmv/9sJG50FHI1bu8Gw89SfL+G3Jvw2Lmk7HCP1eE9a3U=
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-843370762e7mr4554945b3a.23.1781203034623;
        Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-843370762e7mr4554891b3a.23.1781203034021;
        Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:13 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
Date: Fri, 12 Jun 2026 00:06:56 +0530
Message-Id: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgAK2oC/x3MwQpAQBCA4VfRnG0ZsslVeQBXSYthJ7U0Kyntu
 9scv8P/v+BJmDzUyQtCN3s+XASmCczWuI0UL9GQZ7nONKLylncxI12WxNGlEA1OBVZLOWmI1Sm
 08vMfe+jaBoYQPj4Pg6ZmAAAA
X-Change-ID: 20260611-shikra_ethernet-11a1b318d5b6
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3357;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=zOSsQzKp9Ek2NG4SPxgCoFd3tA9TdR//8RVoOu+YbLw=;
 b=mC8YQ0sxi4GApKV3k18i5RVzeURK1818Zj96NEZXl6n//I2UQPAi66L+X+JKeTpokQCenfv4t
 981HGHRwgSGBYozy7hJolcaURX9DLt3h145D3F7ol68bmeUpGxMO+pe
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 8b75tyLalB9DIIRTjIrV9hVfDtdJtZHD
X-Proofpoint-ORIG-GUID: 8b75tyLalB9DIIRTjIrV9hVfDtdJtZHD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXyzWBWPR5M3nb
 mavqPCPbumK0DP9UH1AuhuqCstvoi8OrsFE4ITnTJBS6mGdbwIOouBlZjNm3JLPYGQ0UDMk4rLL
 Ft/UAuem7cHh3bk9iTvwytLu/h+jEYI=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b005b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nYSQqZ2dnBPUVzQNBmkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX/gsbQ1cBDkMv
 vKMcqZt9CPOlS1ulMdNuaxX8S55HBbpSDqWoyrJ0XcA409wC4sWbn6toFEuRnWeIHKf8AnFfJ+f
 w3djSDyxygUWHSI6FYQpjuAdyx9gBjvmr/IuvUxatrF8rlPuJVPA9RzLp+PFU0Sin2QgsoKnUP7
 backlyyEcdsMWoEpFBxksLI8Z980ev3xwUe5Qg+z9PdaRdd3kSde3UsaVT0LrSj4vgLbLkIhUxz
 8xOXvHCZljS2BOkgtraLBZOYfFUhZG/gokwSgShRItpV2FtNimDUU1/U8cBavMgkVVUUNyYohxe
 ySGtppptEYIAznH8bljaHF8Xz5BIwXl7HEjbpmrY1T2+qKY9e2kcoJ0V9AZbHspl50PDdQtu54P
 inQ8DiJd5lK5ZM9dxe2KG4/fyuKgtTzK+qKYWCF40Oc00YlojwaME3FYK9rWmxWNksG9b2vnTZR
 PACCJFkcaN9xaI+QhFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185

(Sending this out as an RFC because we have a couple of fixes for RGMII
handling in dwmac-qcom-ethqos, as well as a new framework to manage
clocks required by the System NOC. If this gets into a decent shape,
then this series will be split between patches for DT and net-next.)

Hi,

This series adds Gigabit Ethernet support for the Qualcomm Shikra SoC,
which integrates two EMAC controllers based on the Synopsys GMAC IP,
similar to previous Qualcomm platforms.

Before introducing the new compatible, two generic fixes are applied to
the driver that benefit all platforms:

  - ethqos_rgmii_macro_init() is converted to void; the return value was
    never checked and the speed validation was redundant.

  - RGMII_ID mode ("rgmii-id") was incorrectly falling through to the
    standard DLL bring-up path, which may add MAC-internal delays. The
    fix powers down the DLL, sets DDR bypass mode, and programs the
    IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. The clock
    rate doubling in ethqos_set_clk_tx_rate() is also corrected for
    bypass mode.

Shikra-specific additions:

  - On Shikra, access to the System NOC from the EMAC is gated by three
    dedicated clocks. The axi and axi-noc clocks are sourced from a
    dedicated RCG (emac0_axi_clk_srcg) per EMAC instance. The
    pcie-tile-axi-noc clock (gcc_pcie_tile_axi_sys_noc_clk) gates an
    arbiter internal to the NOC shared by both EMAC instances and must
    be enabled for any EMAC-to-DDR traffic to complete. Generic
    infrastructure is introduced (ethqos_noc_clk_cfg) so future
    platforms can declare their own sets.

  - The qcom,shikra-ethqos compatible is registered.

  - DTS for the SoC and three EVK boards (CQM, CQS, IQS) is included.
    The CQM and CQS boards expose one EMAC; the IQS board exposes both.

Dependencies:
  This series is based on linux-next and depends on the core Shikra SoC
  framework (DT, clock, regulator) being merged.

Tested on the Shikra CQM-EVK, CQS-EVK, and IQS-EVK with rgmii-id mode
at 1G/100M/10M speeds.

---
Mohd Ayaan Anwar (9):
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support
      arm64: dts: qcom: shikra: Add ethernet nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable ethernet0
      arm64: dts: qcom: shikra-cqs-evk: Enable ethernet0
      arm64: dts: qcom: shikra-iqs-evk: Enable both ethernet ports

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  31 ++-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 235 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  78 +++++++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 167 ++++++++++++++-
 6 files changed, 730 insertions(+), 19 deletions(-)
---
base-commit: 999ed3289ceea2b2808f396b4bd2f9a43dcba033
change-id: 20260611-shikra_ethernet-11a1b318d5b6

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710B265CA8
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711701; cv=none; b=mp5XHl6a1wMW0KujNEi3H0VgLc7zAEObpyXMo05iYH0MGlkHwyERlAJZR4Z539iYlNmsGyxGx4rw1jCyZHaG4gYdP645HDLQBJo+Sg9FOyZHnxm3Zy5oq8eE7oDymiF1dCtLe9IaRijqziL3ShpugZIWYPDNFLVVaI8SsoeQDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711701; c=relaxed/simple;
	bh=nQK+fNXpvD1gc5nxlLKAWk+hsxjUf2iWPCDRjm0d7eU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OLmzzNg7MJijDnnfflSxgECOQUaypwG0NpmtoeKc4Z4XESXZbYVou4KFXfjqEBHCfqr1CnVS+cjKtIUOIWbtylPUZKrpzMn/YJ8fBToU6hRCucp990I5zqXAfpwSa3GVKlShon+04240mkybWcaWcWqAcs72brCaqloDXT1nX3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkyMLF2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHCG+rzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkyMLF2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHCG+rzk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbJdW1494753
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QMubJjWXLeBnBeNK5I+N8J
	HX3YgxYL6bnjWu5dJbGTQ=; b=TkyMLF2PbbzpbaDBqaIJpUsmfPwTCp9lT0tUMI
	RBl2OpcE2zsDh9XVg64NP6KFi55dFIlzV5VrA1FAYBRTS5eTUlJSlPN9C85NJUEQ
	saVVj5qyVQqwxJSktZTSRnvsGF8qvchQ7OI594rfECwEONR59GOu2sigs9E0Uo8I
	KFmuUkivY8TW8+xwHkW5kvr9phNymHtdf+WOmX3oRmLjl/F/Zu+d/C114X3NPXB3
	UX43MCr6O+Pg+hkheBNZ5Us1m0jGbLr48pX+U2xLRepeNst91Q4zOTJnI7ra74Uz
	Dd1vYOwrwmW9MkIP1Gv37t5zHhIeyhrTkAgOn6CdjKzD/yPQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20gn8qrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84859a64079so1380815b3a.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711695; x=1787316495; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QMubJjWXLeBnBeNK5I+N8JHX3YgxYL6bnjWu5dJbGTQ=;
        b=dHCG+rzk63qiAlcb+Tm7Us4UDnWmJRSYYaPbGa+YigZ0SXoK7I78UuVDXVXo8sqaHx
         tyZxghIDBURqIPfUrL0GBz7vUk28l9gtpdFQTj1AzE9Rbq1shTnOmsU0d7MvbPc1Ss6l
         g9p61HwnbxHhqnL6X/DQtQqu9EngjHoOvyKplX+oNDMKWl8bliARoRCE+HiQgVqi49uT
         HmoXGNmnTnj8oiIo0Ara6CLMY4Ze1mbZ3Qak5yO0y1xBCLBCBLjs/ZCyIKcAX/wzew7t
         zJanXG9ucCc7l1ZCeeYAp7ch6lddWV/CNnVahZGaH4mIodGgYXhAIdatGnnCcQ379vzH
         zY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711695; x=1787316495;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMubJjWXLeBnBeNK5I+N8JHX3YgxYL6bnjWu5dJbGTQ=;
        b=UaUeYxGXmj7lyvub9ofZQMWzVLZyNiP8Kwnp3oCJjv8UEUJ3O/mesoYGCFUho3SK1E
         mqjl1c0Y7oLkAdT0XCs9LIB95bBtJ0DfocJbg7fV8YJtu31ihExyfHaXYITu9WPhtCl1
         kN3C6MV/xxyaWJx7jSW27EUFYhLjIRxWAjYeTQ4XkB4J8MKunZgq4XX6zPEHqjXzjxrB
         B8x2aSTmwGM1HeI9tbSaYghpTQ5S09BpzndI+V4jY2FNsFsDps4GNzVCuPw/nXYNGP+x
         OdbQMxH4ml1+jRPrzARN39jn1AJV3IRON65gWKSvcXJBoCfFIMjhNOCvhWPnJWe4FJzp
         cG3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhHtxv5M2RaVuIALxSFGY9hSmnq9hdGKWm/JER48X1t4ET0eyF0KIWRW2Ld2/Os6aEP+US1SvsfH1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzKw/uGZFNJOkNA93UzIUpmdJFjAtqXtE4QekIersB9q2fmi7XZ
	gKbZdtSrIyM5Uo5RK8CyH2jGpHrNQD/xsOhxN4Ts/i0+8j3m+xXFiw7I1EVINosSEWrJeIgeuNx
	XAjuM5ag4AI+o7xzQ7hrMIhutigYZk3JmF+vCdfJfy2cRSHyL5R5cDWZwwwk13A7c
X-Gm-Gg: AR+sD138QfQzDXKxN6hUX9ABzIoRdJYQX/33FJxM6ehyiAvmWhOZYMC1F+dpDmt1osJ
	G1Cp/bh1hc2Onfc9LP39SS2zNW9QKIbuBiAQp8PNlWVDDR0Mlroz+cxmaav5rr/pqVJXGwaeXop
	uNRLRq/tD/IYhBD1MHhvDubI5UxviyYFCNqG8Cd1+TrtwMTC5eapEAL3hHHWPmbUPh3jrBurTjd
	exuk8HQN+/qcMLowOxJw2pS5diqKuRShGA54lZGG1nPsavuGeU2iCxUw+csl0gCHjX3+wfNpwaE
	dLJe2co9+zZKVbCGH6rjI+JL3vnv8xO2qqIAM3qEoRnGJXGtvHdsVl6eNjX9YKJqDOAwTW6edaJ
	PaXy9JyXXRxXdi3vu+j68U0iSs1uoQqVP6WtGsbXS5AM=
X-Received: by 2002:a05:6a00:240d:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84fde20e899mr5547815b3a.20.1786711695144;
        Fri, 14 Aug 2026 05:48:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:240d:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84fde20e899mr5547738b3a.20.1786711694553;
        Fri, 14 Aug 2026 05:48:14 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:14 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v3 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL
 support
Date: Fri, 14 Aug 2026 05:48:10 -0700
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIsOf2oC/33N0Q6CIBQG4FdpXIcDStCueo/WHOIhaSoK6mrOd
 w/sohvXzdn+7T/fvyAPzoBHl8OCHMzGG9uFcDoekKpl9wBsqpARI4wTwc54ULYtTD+kjJJCtV3
 fNJhAmcuc07TSGoXP3oE2r0293b/ZT+UT1Bip2KiNH617b7Mzjb3/CzPFBMuszLjIK0ZTfbXeJ
 8Mkm1Buk3BQHJrZj8oI36dYoJQCQQMHioodal3XD/u0wk0aAQAA
X-Change-ID: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=5271;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=nQK+fNXpvD1gc5nxlLKAWk+hsxjUf2iWPCDRjm0d7eU=;
 b=DWL6ktBi8dY3ZN70IEDrqOyFpA1a1tgsjHHYkGOuLDIODgSZdO6gVuSYRpm4/LO9W5M0JFXZu
 dpvvFlzfBGoDWBMsxgXESNZ+6QyDM+DB0mi/sWAKM7TF2uxgsguGogg
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXxX5AfOH1xBxh
 BHw2e9IjYZ9K7HlQLMZ9jiyVbyx6+c1YrxNuq5K4ZLARFHbg04i4CXp6Md1JDW0xqkiwIhlf2XI
 JZdohs4jEB0mbRUhK4DZNHYv6Me619Zpq2SNuJnBHZQXCCdB0MBMO7jSHG/VShgDVa7P1iy4Dkq
 Wp2QQc0BaReLxCULLSU6MHLXBrCYZMsI0brnEaDc6FgEeiCmod+0ZXO74G6VX2XphgzkXswDBG9
 mmv6f2YHapr7f0Tshgv2ZO+x8P5JT0V0QYAt3ifCNJBsWFSRKppeVZbcYOP3r2Lv2Oz1AQXxs13
 xPb9SV/5sHxMkGfOQlX+sBrIqUupDkoMtfhvkyBPYnjf9RR635SlogZQfNBYeKOAlI5GATiQ1Ez
 F6fkukNxS6lzIKrlWfRjlWEiJh/fnM1HRHGlxK/VIRtWgYKhnCoeLMPfuPXLOyM63KB2w91yYCs
 1ZAeamV6a/C5931PJXw==
X-Authority-Analysis: v=2.4 cv=DdMnbPtW c=1 sm=1 tr=0 ts=6a7f0e90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_tJmgOXO7FCaeRF5PkUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX2yDK9ValzU1O
 IhKFvzQlRjoIlGTEVpV3iCy3UsZA6PW/8h7zMBx1oflZolvAmBmPO+RNaSQNYvOGjWuWDdy6Ahe
 f/Ubs+wpcS4X+TTCoYqdDj34h2QeyVE=
X-Proofpoint-GUID: UsK5r65LBSTd-Ua8Re8q1zqj-SdUfhCv
X-Proofpoint-ORIG-GUID: UsK5r65LBSTd-Ua8Re8q1zqj-SdUfhCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
which is currently supported by the driver. It accepts a 48 MHz reference
clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
The difference is in the output clocks.

This patch series adds support for IPQ5210 into the CMN PLL clock driver.
On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
to the networking hardware and GCC:

  - NSS (network subsystem): configurable rate via 6-bit divider
  - PPE (packet process engine): configurable rate via 6-bit divider
  - PON (passive optical network): configurable rate via 8-bit divider,
    plus a fixed 31.25 MHz UNIPHY mode
  - EPHY-RAW: 125 MHz or 312.5 MHz for the SoC-integrated Ethernet PHY
    (EPHY), which supports up to 2.5G link speed:
      125 MHz for 1G/100M/10M, 312.5 MHz for 2.5G
  - Gated fixed-rate outputs: PCS 31.25 MHz, ETH0/1/2 50 MHz,
    EPHY 50 MHz, ETH 25 MHz
  - Fixed-rate outputs: XO 24 MHz, sleep 32 kHz

The patch series is organised as follows:

   1/12  clk: convert fixed-rate registration to devm, remove remove callback
   2/12  dt-bindings + clock ID header for IPQ5210
   3/12  clk-regmap-divider support for CLK_DIVIDER_* flags
   4/12  Register a shared cmn_pll_div2 fixed-factor clock
   5/12  NSS configurable divider clock
   6/12  PPE configurable divider clock
   7/12  PON reference clock with enable/disable and divider
   8/12  EPHY-RAW 125/312.5 MHz select clock
   9/12  clk_fixed_gate gate clock type for gated fixed-rate outputs
  10/12  IPQ5210 output clock array and device match table entry
  11/12  DTS node in ipq5210.dtsi
  12/12  Update IPQ5210 xo_board to use fixed-factor-clock

Changes in v3:
  - Drop the new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag per review
    feedback; add a dedicated patch registering a shared cmn_pll_div2
    fixed-factor clock (this /2 stage exists on every supported SoC's
    CMN PLL block, so the clock is registered unconditionally (Only
    IPQ5210's output clocks currently parent on it). Reparent every
    IPQ5210 output clock except the plain fixed-rate xo-24mhz/
    sleep-32khz taps (NSS, PPE, PON, EPHY-RAW, and the gated fixed-rate
    clocks) onto it, using the existing CLK_DIVIDER_ONE_BASED flag for
    NSS/PPE. Same output rates throughout; more accurately models the
    hardware's real shared /2 stage.
  - Remove PON's now-redundant internal /2 math to match, and rename its
    pon_refclk-suffixed identifiers to pon_clk for consistency with the
    other per-clock-type helpers.
  - Reword the clk-regmap-divider flags patch to cite CLK_DIVIDER_ONE_BASED
    as the motivating flag.
  - Collect the Reviewed-by tag.
- Link to v2: https://patch.msgid.link/20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com

Changes in v2:
  - Introduce a new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag in the
    generic clk divider framework and re-register the NSS/PPE clocks
    as plain clk_regmap_div instances instead of hand-rolled ops.
  - Replace the composite clk_fixed_rate + clk_gate implementation for
    gated fixed clocks with a dedicated clk_fixed_gate type that reads/
    modifies the shared gate register through regmap.
  - Replace the rate/enable_bit/strcmp(name, ...) runtime inference in
    ipq_cmn_pll_register_clks() with an explicit enum cmn_pll_clk_type
    field, making each output clock's registration path self-describing
    instead of implicit in its rate/name/enable_bit fields.
  - Update the EPHY-RAW clock's determine_rate() to pick the nearest of
    the two supported rates (125 MHz / 312.5 MHz) using the same abs_diff()
- Link to v1: https://patch.msgid.link/20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com

---
Luo Jie (12):
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
      clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  27 +-
 drivers/clk/qcom/clk-regmap-divider.c              |  16 +-
 drivers/clk/qcom/clk-regmap-divider.h              |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 607 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 +
 7 files changed, 663 insertions(+), 41 deletions(-)
---
base-commit: 2697ef8943c9985c14708a6429e21812693857b2
change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>


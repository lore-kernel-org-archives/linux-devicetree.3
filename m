Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA83264F9
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905230; cv=none; b=gOOhrMyzdEQRz6Wyy9A6XJxLYz9hJJXyWIb+PAXiWi91Ixum5YlF10zF6HnM6vF2jc4/YnEmmXYNJoDvihX+HDU6MTGlWZ0dBdgaGKWxuzzHSYMFApGeTCumwqYjlGIGNSHO//TAEFio1JXayfyLz+ylHpO2Obau7j+Wal5jT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905230; c=relaxed/simple;
	bh=kko8v/PvUqupAnRZhYeFpLTutKewYs6xhN5RlNMfaVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gf6IlWEw0DVOr8b6l92+VS6Fuj/oy00WvfyE9wI391QEWvxu1hOceR6SPtWoPqDjnf5q1bQjxN69+XmGHXEBsah77vYo1Za2dZW6i6+hxXtVdhzMHoRHD1E0cWdcaEkPoHzCAzt9a6X/PUAcxyak2Mi3dh7ThYtzSPWql0dGvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebAPvFQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abasLHbD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebAPvFQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abasLHbD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbEGP2933604
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2+S4Qr4ecJ8vurqfXY55fa
	FolKA1DCWJklnTFRiEnTU=; b=ebAPvFQDU63FMpJ2ZmQDp0AtbK11UhBmXMOQGS
	Ch8GrLeNMFdfdDQZ3CABZQVF4NnxAmi3K3+UwrJkr2+2Q5J8dHDuuq3HmegFPs4w
	vTa+zq1joAN60jurBJy8AidLdMGc6uIiR3UzdZOxRn4pdhxQX24G+6fiLv4CK7ec
	zzYBZbFGyNxJDTPO5RAqrQ9qkvwhyH1HU/UB99549Kk+I/gq9ewGz3l+wX7MMTO0
	PUn3AE6PAIiBh1B0FY1BTLf6S3kZnS8Fb0Vh9a3iN91Smdc52XeXmw1FB4oPt0Sl
	TRZ9RLEKQVh3FSrG2rvbZofm067kpJVzFp0QFMctcz1JYKkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8fxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so9236925ad.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905227; x=1785510027; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2+S4Qr4ecJ8vurqfXY55faFolKA1DCWJklnTFRiEnTU=;
        b=abasLHbD473b6yEhK8FmIEoW4PaSWc+F2/Hr4g8qiXmH6/Kx/oJ6531/PPtuVyuD/Y
         RreMLRj6SPPgR3YBpAIcT/uNVGnDKiDjeteri6A2wX9IZLKhQTiPMgIAMaSSvUaW3rKS
         P6Zo8zOi3xslYrIUPFADizO6eBbft4xLlKxkB2/YWbUwDfI9/vTAMZzKpKgzU+/jM3R7
         3SD4psQnG0mui+d66T7nKuuo3PUblfaHXfagqrhxozwoK3RQeVZRzV4p5xuRZAo19Smb
         uz9+Svd7BRwKOVqAp7dnhhvcT7qFei9GX0JOi072+Tzypm2IyswRgfazGSas7rKWq063
         CLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905227; x=1785510027;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2+S4Qr4ecJ8vurqfXY55faFolKA1DCWJklnTFRiEnTU=;
        b=WoGlNkCsTkS7nOr1s2nSB0L7pPUupksU4bM4M9RLcYIRMIP1btqTlzH/JzwnlA5Hg7
         gEopPmAlNK2RuO9TxbKc4/S8/kMlC9dGxj/4hHkbDcAhF6zqL5t2hC5aCNE9xjg10GZu
         brvFitv+Xy8CIkI9UjpmrOgPMP+cciN7SnXJtyG1flM0p9e+XMe7wCefYRcP9yyixudW
         iwyLoc7VyKnh33n6CfZRt+1Xd6hqw4DNegTIurVPsqNYdK0drabQqvTycPwyRk92brzc
         /KYJd2dJDwvSKRfJxGMRIUF9Ct3E2weDZNxIm3qWhucq26eOcZDEWxOE0s6ddgfBtlgf
         wLRA==
X-Forwarded-Encrypted: i=1; AHgh+Roygi+XsllwrwdTk0vnlNhkZnPtVuQ4j2tFf1jOBUiF1HwcUGNFsInvH7hW1ZXrLOyLdnh8R0dHwnmL@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTNWM9v+L2PRN3fomqUaidsjrxRZ5SGayBzEAEHdIN3+rKvKQ
	VzQI/HufrQtI7V3y/N3n1Uz5MQLMDXL7CaGnHQsBBJlFUzbs7WxkVT2YgZry5z8/1B/UVmuwXeg
	2MkM3nIBff0WprcE2DyZWUwVWkOYLpSKodLiwxUzpfySC0wuLTCNI+1xW7QMAMCCqlbOxUklRmL
	/hWg==
X-Gm-Gg: AR+sD12UPDViQEu4UhZzpQG+x2+OES/pvJSbCrwfeyb1ELMWcU3RxIuw/kmXt86Q+oq
	ebIff/znD0ZsAl4U0cfS+eQSWmseXzQVI0iZetbKq0RLWOXm13y2kbfchFFkqcOjuRjjfAxonll
	w0vaXBtIsncrmAI6p0qgtS5OXcTsjQV6oCrqs4LSyHw13GlglF4k1cdVx34v5UQpJ0c3FyXVAuf
	AMGYzw37rDpNXqF3MGdjuJ0EWXwFRNy+h6UJUwl3niYTZlHz2JbOUOpwp7uYgVACswJy3GSpRcj
	vm+mBj5kOiHO63+hS7tkc6inrboWc35zX7vLrZEKphL1U8NcRWuRiOytPcljvZAx6erHH2v6NZt
	N2lfHgXbpMhSRSp61rOvuqQNe12hILVwbDF8ce2aMZWA=
X-Received: by 2002:a05:6a21:6494:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c44b18b831mr8831975637.46.1784905226188;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c44b18b831mr8831902637.46.1784905225536;
        Fri, 24 Jul 2026 08:00:25 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:25 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL support
Date: Fri, 24 Jul 2026 08:00:22 -0700
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd+Y2oC/yXM3Q5EMBBA4VeRudakbZYNryIi1HSNUP2xIhHvr
 rj8Ls45IKAnDFAmB3jcKNBiIkSagBpa80NGfTRILnP+lR/m1DI3ZF0mBW/UbOw0MY5d0Ra5yHq
 tIZbWo6b9uVb16/DvRlTrvYLzvAAiyhgsdwAAAA==
X-Change-ID: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=3193;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=kko8v/PvUqupAnRZhYeFpLTutKewYs6xhN5RlNMfaVQ=;
 b=dxK9tBKw+7oYznPTe8Kw6mLX/EuBJBqwe+twzB2ln6M4VYEjuGjS46cuwN+cRur9m+dwLgxAy
 BxM1uj178dRAAnFnxkYAnI1L8VfKsOGCiyD4pI/0/RfJ2+pn56k+Zpx
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a637e0c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zil3pad3FGakuW8kcwcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9VNi2NN/aIX5
 Z5HHV+zR6DJPXdrYqezugwU3SPHAWkvstZTtqDtSj36Z4EIz7z7YoNwnEIsSWL8vz1OZcf/cO+e
 vrMLIa02Pd0z64pG2FyEgBo+VnjYVWuc/AOQ+SMLSi7tXmrCGKONqFgVM/gw5EgmEaij5F0+ReK
 edeFnrWznhUs2fnJ8rO0PpzrkUBaCNuA2f34+j0i2DStJiq0bmmYRCujYFZnyyJsXYLX4QIOGHQ
 CxuplerMqJ4hX7Rs52cX7MGHwvOobdCHXY8MM7p3C+cOIR7LCZBIj0ZsuoW53gstV+GL/H7J8mE
 cHpqW6QaVlVjHYAePqQgZYmkPokaYSQ9M+wyNSEp7EI2az/GvhlGPKep4DEsvt3xzaXGYLprUlg
 j4PuGSnxKsYozAx7qT0G9Sgi5XTPGz/XrkaRmf4LckHhQemhO00sq4zo4tFYrz3cTMWMUhSMdpr
 V121exLckiXFnxBH3Iw==
X-Proofpoint-ORIG-GUID: YCwitqoUwoNxxVBwav9cbWcjV-yvnwkj
X-Proofpoint-GUID: YCwitqoUwoNxxVBwav9cbWcjV-yvnwkj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX77oJfWxppGHa
 cZco+0nphV8E1hUQwdKLAM0SNm69WPJwwhgbYNxcWIxESCOfiDrfRoXk76n4AW3lvyLIhi7A4YW
 3FpSLgIyaL4gyLaiFbswcotOEx/JRLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

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
   3/12  analog soft-reset helper (clk_cmn_pll_ana_soft_reset)
   4/12  NSS configurable divider clock
   5/12  PPE configurable divider clock
   6/12  PON reference clock with enable/disable and divider
   7/12  EPHY-RAW 125/312.5 MHz select clock
   8/12  clk: composite: export devm_clk_hw_register_composite_pdata
   9/12  CLK_PLL_GATE() composite gate infrastructure
  10/12  IPQ5210 output clock array and device match table entry
  11/12  DTS node in ipq5210.dtsi
  12/12  Update IPQ5210 xo_board to use fixed-factor-clock

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Luo Jie (12):
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: ipq-cmn-pll: Add analog soft-reset helper
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: composite: Export devm_clk_hw_register_composite_pdata
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  25 +
 drivers/clk/clk-composite.c                        |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 612 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 +
 6 files changed, 644 insertions(+), 47 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>


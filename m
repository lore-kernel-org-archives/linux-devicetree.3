Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40FB1DF75B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562780; cv=none; b=DiMTBPSWEcf+ldq6KQlud9ykYrPjD2LTiO09RxMMKTUjX6ODxS/xE3NCp54c2yeeeRoAefKgYRovd0jw45KZNiZp/BWy0ZZuARo36emkpj5RVPnny5eRr1Q5caTc3CIUOf29olRpkRijBUszzrE6ENR8Ne2oLdA2m3iqanqsfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562780; c=relaxed/simple;
	bh=XAAdVzRIgG1++KpC6o+mUhQKjjhsFsPBjnBt299X6wI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=spOnybmywitKtZGO9X4hzS29jApQbdyKFw8a7tCIascKCC2ZJvAZtW42vEalhlH4JsEkWgvi+FNF7CcGIJ2I8T6X6mDhb7J6lKaXzd2gKzrIdIFAxHSdnk7Qhn1Smc1ChezW+qZinuzXMmnTdT/y5NkyLvpnT37qkPcH2Tzfhxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WK6pPZ6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAxi0Cw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WK6pPZ6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAxi0Cw0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6nDO2186483
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSI/j7IvdCFik5UD++CGec
	gmmuHc0Slj/zGvA6DAlGU=; b=WK6pPZ6bcajgpPYcj04VqPxa0agUE1oBCXH3i1
	JUH0MDfUONYNYXbRuTp5vYl2BRBYJ+Vvk0nnLHDMwPTxuNmKxLsrCIY8W+ib4lyg
	pa2eLupCt8BK2KonMR9EKFqabN9eXaFK8IKwPomazv/go/Zta6UWJ7VTvdxmkNu+
	mzbwmlcoX/AiMZnghWYqejyDGXIopGmh1QffcapWvjeqLhqKjjCRYfAbo0E825Uc
	zl3xMk1nE8k+eThw9B5DNShr+OxOwMDetBGXeyCH/xnZw3bHNuC+JQKn4gGkmptc
	5HrPdB1SlWdORwfwWCgUYDWyRMiq3SbZYTYkgcVXb9s7oCIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29jue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:12:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so4925761a91.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778562776; x=1779167576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSI/j7IvdCFik5UD++CGecgmmuHc0Slj/zGvA6DAlGU=;
        b=UAxi0Cw01aQylCDHP70WGEk9Hqx3LjEM5O8w5oPFyVpWPtsFWNhKpOTc+1Oe6O5pY5
         EGZCRoD8XdUTmbJm5Z4AIco9cKQ0I1Y5QwYOagNA0bkf+pOQRE+MiuRZrcVuuxlFURuz
         d2kCZbQV8RiCv+rI/AxxxmOXonDsizp7xgrIx8zIho5FkFwAVRQgLcxd3nUWIAOKf/cG
         rC4D9L1nG3mCc4fFDBm+LZMcICteVUz5ahq41988W8KiCrK/sDtbGW5sK7p7UX8AqmQC
         WzwjvUHBSmSd9OG+HV+A/bIoEXNgBRzFWHdvr7eVKdaTHJ8l/+cfFcp2iNliXJANxIfe
         1Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562776; x=1779167576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSI/j7IvdCFik5UD++CGecgmmuHc0Slj/zGvA6DAlGU=;
        b=rWz2DkOrKUyTY60Jr8b7gTGEOZ1FFoypJrCUZdIt9sNxATYNAzZ14TLeKdrJkzQTVe
         3dj3GG8MDgA7s/D/6xnmOvfghR0CibyW4rBuolLPdL9yYxRaW+t0swFi8P67lsiDg03P
         r3Oi5/zAosd9fg5NwjjTVT4CU6mkxrCgPEaPiVDSm3agAaQwdgF9k2BOJRP5NO5HJu2y
         1x2Bu37xE0N0iyT1+MdTVyT/u+08cqhdu/JsNuM8c7xz68cajP5rM+v0dHYuhILMnG6J
         KRzXg64hxy2Pz8kEebSU7WQwwLaYwhqJGIKmLSQQ5Bol1fGong4TtGK7OYuUJGc0cV67
         OZtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vIpxlU6/jIux1NJSnqwyfXvt3IAlkz20u7b0nE1SYaETHu3kGvMRhEjLm23W7efEJYPtGqoMAuixp@vger.kernel.org
X-Gm-Message-State: AOJu0YxqNIVedVsDXGK3zQ1j434rRa9EIs2cjdnoygf9GvXAqa1K+/6U
	5UwGWjER930eUQ5cQRBOumSp0A0c61Fl/by7glyrsJ86HGFXDyjsE5XrOuM6POc+wgyXjFNmQOf
	p73WqjuyzRX2jVPhXm1CPdaBnJm8+eikRn5iPczpnGnH36ouO6tWNqAFIvkvXf0/8
X-Gm-Gg: Acq92OHwl+3kcIexhOZQI1GzuZTDCUoROxpnaHYizOEur3/BH0U3Uf+VJsF4+Ro7F+r
	KUsZt+vwigmT1zHFMXgVAjroq/6p/mY/9KBmMJmb2vvr2NRp4Pd/ySDeKLyupjYp6kTv2DVCYlZ
	JJLrvtkuGfzPbxoIX/Pgd3ZXX6mHDwujWpZZ/VaPFgF7DLOMzyL0/aL4nWYF15498F4Cdvu2lcL
	PD1BSVdEBsnv3Ehkaj4aRr13tv4cHs1dfGGXU7imJSmqmqFEg1JJWMOLe7fby36L7kRnRfkeY10
	0RTa+aJ2vdYn+wXEhX2ZbqKA6qe0WQV/9W3JjXZFRuWtJSwIlQwfQYepC0r1aoYvPVjP5NrTypA
	VoAPJAqB0QtLN761MLgr7gpVJVIyG9wCs5ah/5gpFNTIj+kCjPEhI9Q75L9s8+zs2ETdR5UWX3r
	jHyCptIjBaJ4OsH3X6kyDp7v1/8mTIdkKXxjM7zG43QTMUkQFesfyhnqhB
X-Received: by 2002:a17:90a:e7c3:b0:367:b9ed:6656 with SMTP id 98e67ed59e1d1-368b269e776mr1648344a91.13.1778562776434;
        Mon, 11 May 2026 22:12:56 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c3:b0:367:b9ed:6656 with SMTP id 98e67ed59e1d1-368b269e776mr1648320a91.13.1778562775914;
        Mon, 11 May 2026 22:12:55 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b06d6b33sm425701a91.10.2026.05.11.22.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:12:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Tue, 12 May 2026 10:42:46 +0530
Message-Id: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM62AmoC/3WOyw6CMBBFf4V0bU2fYF35H8YQWkapASptIRrDv
 1vUxI1sJrmTO+fMEwXwFgLaZ0/kYbLBuj4FscmQaar+AtjWKSNGWE44J9jeBpVLUmrnYhldGRp
 oW0ylIqyopdgZg9LtzcPZ3t/c4+mTw6ivYOIC+zY8DGMSxl+tsSE6/3h/M9Fl+xELKlfEE8UEa
 16AFoZXtKYHF8J2GKvWuK7bpoEW8MR/MEmKNRhPsJwVgmmhjFL/YPM8vwDXuo6iNQEAAA==
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778562771; l=2956;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=XAAdVzRIgG1++KpC6o+mUhQKjjhsFsPBjnBt299X6wI=;
 b=fTj0XyZnkBpYSSoL1vJXBeZtf/k3d2jspdBJthXb/1BXpIevuliiA/vaMQhvDK9b2cFNcifqZ
 HOr3XG7BvZRAXlVpZe0NPW/bR6+rgJH/BgqkPcNuo7sYFt06GgjVtRX
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: SXSVNQ8OyRHQWjEFBTO3bg-3ocUVfKG6
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02b6d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0NyBTYWx0ZWRfX84aJ1zvktUmQ
 HxzWxtF1bm5jwCeDhxy2rtZ9tFvFhitDNpU8gETwHndZVFJTMBV59pfGmmWo9z936L08d1wSGLU
 AfCA0HumGBo5eyk+QCtcvZEkNxz16OhTHJu+KvWomTh7K6S65BpM9cKqBgsvVSmlCc5l7m7xm/A
 y6KO2TQj406BovWy5toQw0M3vWGqsyQyom2sQCB1zMjT+Vgn4xwrE4cXQwVrpwI0hXeeQt30lMF
 J8BtywzwhbWtU14kHylgL6H3TV2GWznciUMFo6vgC3dySb3+shydMfx24Gm7rNc3KAAPotzPa6v
 1ioaDAr9S2YctYVoS6qAeXStVbAQ7OYSuTrUS4MqsRSaxKBkqOvtPZjwf8KU7ceRFOtWV4qow/1
 5MHm4ixnxybWGE08CNCPD58+299lSO4tlJuttDcRHoZd7/t8AT4kJKx2Q7P3Eq3bZSTKQJxDoi6
 3Ef6mzACfjgPaJ0+kAg==
X-Proofpoint-GUID: SXSVNQ8OyRHQWjEFBTO3bg-3ocUVfKG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120047

Qualcomm IPQ9650 is a networking SoC targeted at routers, gateways, and
access points. This change adds minimal support required to boot the
IPQ9650 RDP488 board.

Compared to earlier IPQ SoCs, IPQ9650 features a heterogeneous CPU
configuration with four Cortex-A55 cores and one Cortex-A78 core, a
2 MB shared L3 cache, SMMU support, IPCC, five PCIe Gen3 controllers,
an integrated CDSP for task offloading, enhanced PPE capabilities,
and DDR5 memory support.

More information can be found at the product page:
https://docs.qualcomm.com/doc/87-96766-1/87-96766-1_REV_AA_Qualcomm_Dragonwing_NPro_A8_Elite_Platform_Product_Brief.pdf

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Fixed the qcom,tcsr-mutex region size
- Link to v3: https://patch.msgid.link/20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com

Changes in v3:
- Added \n before the status property
- Rebased on next-20260507
- Dropped the REFGEN, PRIMESS clocks from the bindings and the GCC
  driver since the ownership of these clocks are in discussion. It will
  be added back if Linux needs to play with those clocks.
- Link to v2:
  https://lore.kernel.org/all/20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com/
Changes in v2:
- Collected the R-b tags
- Add the ARM64 dependency to the GCC driver and enable it by default to
  align with Krzysztof's effort to cleanup the defconfig
- Updated the GICv3 interrupt-cells to 4 and added the ppi-partitions
  and hooked up with the PMU instances.
- Made the labels to lower case and kept the \n before status property
- Dropped the defconfig patch
- Link to v1: https://patch.msgid.link/20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com

---
Kathiravan Thirumoorthy (4):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  377 +++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3445 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  172 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  215 ++
 10 files changed, 4373 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


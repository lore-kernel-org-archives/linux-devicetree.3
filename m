Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42A379960
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318522; cv=none; b=PJasm4KB+cudLCDxNPbbGD1z3g0+hE0v+gop72qMyj9TuhpfJoR2tKSIHJ98t6wmYDs4+Rm0i1UHmDFERWqxphW/1/jyu71i8UXSLsJhsrmSSJJuHv+v9qIYdH5kpFwKgM7Y124bE++9l5A9zWuPJ3LZaCg1bPeUoSEzellxMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318522; c=relaxed/simple;
	bh=g5uck4ePLhP8rhKdVSbHqEoxsC8JhzXfl/x6y/3Zwps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UosfGnDiy0zGdw5N7P+UGKdfWAIC4mSjfs88s/KiL9dPakVMgpDVMnsbaUtY/Cod+Hb0fkI8hF2j0P8eyYiwXjcYx7nhT/4c+N85GJ9HWbgUapX0dJ4DCw/mr+6TQnezkSDwDtVKJdxQZsKmKq7B7U+kx14PytQLXY0/PsEcyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVB+DWCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aavzqhRg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVB+DWCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aavzqhRg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519YBa73372774
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QJGO2L0zmRMh6m85RqpTW8
	TGikOJTOo2GaWPgXr5VfA=; b=fVB+DWCeNPJZTGxw385tujIHU1pODaMZWjOEsN
	uCisMOACKSV+zTO30lGgNOzzZFPxqWu7GlAOPCJsU8doRmRn7Rpjhs3xmn1TsDXE
	DfVQPLv6lhuU74kAiZET6qmXcHo5k/Kv0C9Cp5gIPwMp++YpA8NL/8suqWv+iqFd
	03CDneWVARx3mRy47qUh4t8Jui47rhCXLNYxXDLPmuLJUD7gy7D8vurZg2BHuYVg
	/0O5rTMvfWRWGO+YVMqC8p5LBbu9Hv5SYNWwPTvY/R8KaZ8OD0MxryeU/fQjPrU2
	9P4m/+dPsYjgpvHBCwkHjvJ1BhacXi4phn2SATyqsWzfbpZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh8t18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:55:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0d0516ad7so13242025ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318520; x=1780923320; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJGO2L0zmRMh6m85RqpTW8TGikOJTOo2GaWPgXr5VfA=;
        b=aavzqhRgbYCneGcTWPOnovQmSrNiyzdYoKITRlYQpVcUpYzMt6V+q8jbOqbyAruLLI
         5dOIFnRD1XVCabbw8Az9ZQV2ZTng3H0uUg+MM+UshUaJTNXI2Okbz+uu1qHyHHqR2zEg
         sS0bg58wM34Y802OA6SdaaGfYaU+GrldOPZA93Q2pmNvemjJnrKyk30PtFLA/9WlGA1n
         cZ2i0T4GGAL7G9sGV4PmW7TMeoV1IZEy9Bj7Kr4W5rueoVcfMfAuTUUzkamGWy40MHgt
         sOvq+FklBkGcfcBvMVvqI7FA7yJ3CMLr5yF8g9BWNdEco2Vd2H5GJalDKx82iyvJ8Cdn
         KcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318520; x=1780923320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJGO2L0zmRMh6m85RqpTW8TGikOJTOo2GaWPgXr5VfA=;
        b=gGXOJJ7PbKhdzp59fFaRGox30EGUHtOX5/xNb/4CL4k/bCXzqi+u3NopnFKko/HFvA
         EIvgt8Lml6SMshlr0zXtRCrFjUz8FTu8YFtP7VNdFrR4YZ4bLuZvz4LrKCspYU5TEsxu
         5UsF3EvPx34HJw3nV1wHn0nFzFtu9Fcb4YQOvbnnQ1Ldt2002eWDFZn/z99tAc9TKTm/
         DDptvNnbAUYZxrs2wFT5ZjMkPH1bWcR0juA172+1uQTpcc6AwE6kKbANVB8+a/9tGDFV
         3HcfbBSkTuOOBBFs0uI+Efw6/Hl3yUw+DqLa7WPeKDl/foS9VgEXfMItsFr4qGNkeEXE
         anRA==
X-Forwarded-Encrypted: i=1; AFNElJ88RKAWiyB+tAunnFGxY2CIrhcm0Oz0IeCpu0GZciydFjpsBighS1foiDO/QQNPxIcLJlzDPBBNAgYV@vger.kernel.org
X-Gm-Message-State: AOJu0YzXYDqf+II3OZpl9cAiFfpxiE98jFGSWEERD2LYvC+x6aA2fyKi
	JaZ/TYkqxII3UxnWzB07Gz8sv3oUF4zXfe0KVJtAB3seK+6viNxqNiymfO8MgRiPUIDZMjRkODv
	46U2S/2bvTkKJ7Mnupce/7UC8LzAp/cY8cjkRmozuugFi22w1nU1OlOUhYnRuW6Vw
X-Gm-Gg: Acq92OEMryWFqIGHo4dTSWdDfxgewII8NL9KXXG5MB0L0byAujtZfex6tPJ7Rd6I/mM
	aeoZ00nKDmLSzNR/bv1ur3eDQ+/NfcbfVOeAlySKHOYo+PA+HwVKwMJuwKCQrwPDxNOWhk+Y2Kp
	aDQquHCrnEDdYl+7yF32Ra2nvoBLCLnN6IhN+H+pelKK52oH3QG4eqpwAL797FKurGqeVcrk0Z8
	H6NuBxPSUfx/EeYlmycZtAxnlzE0ynfI0JPuGlHZ1AnOAbXEAe+L0fGRZAv/rhwGZL/m9AqDxl4
	pNG0gQdXfTOV5KqhEOrFQrx58TTGBC/8tRwRCC8f9AtIn7yOhDxXxwwqWavn5hdyrEMhRN/pynI
	eQnoknJ2ziXaDcAnj2q2CBufz9UkdWcZsmhJlKYeuJEBuvJ4=
X-Received: by 2002:a17:903:240e:b0:2ae:450c:951e with SMTP id d9443c01a7336-2bf367f27dcmr117385795ad.17.1780318519963;
        Mon, 01 Jun 2026 05:55:19 -0700 (PDT)
X-Received: by 2002:a17:903:240e:b0:2ae:450c:951e with SMTP id d9443c01a7336-2bf367f27dcmr117385075ad.17.1780318519366;
        Mon, 01 Jun 2026 05:55:19 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:18 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 00/10] arm64: dts: qcom: Extend Shikra device tree with
 peripheral and subsystem support
Date: Mon, 01 Jun 2026 18:25:02 +0530
Message-Id: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaBHWoC/22Qy2rDMBBFf8VoXQVZ0siSV/2PUoIeo0Q0sRPJM
 S0h/17l0TYUbwbuwDkz3DMpmBMW0jdnknFOJY1DDeKlIX5rhw3SFGomnHHFgAMt2/SRLQ0T3be
 UaR7QC82xi6Qih4wxfd50b+/3nPF4qtbpvvyT9s1d2bZPytBBMJ0EqaTqZ0mev/gFxA+QD3n0l
 AUrADwor0w/i2WG06ngUNYuDSENG2psZAxQOsGxn9tFiMvHoTUeSlnvBAXObUQZnY7woJwtSP2
 436epb3yL3nFhohUSFHBjBecAAkz0nXbKoDNBy45cu9mmMo3569Z8dV3LWS55rj3TCK01Wujgr
 H0dS1kdT3Z3vbuq4+ab+ZNDsH8OXh3KOdAtExBaseC4XC7f91a0BQ8CAAA=
X-Change-ID: 20260525-shikra-dt-m1-082dec382e7f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=4539;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=g5uck4ePLhP8rhKdVSbHqEoxsC8JhzXfl/x6y/3Zwps=;
 b=qyorxyaxaDgzSIE9IJ38aZXIpkmHxpbXPRD7mDYHavSQeLgedFu0psQOrQ8scMLscXkwBYUhR
 H6/qEPi8VmpChJseS4nnQtuyhufnP+OKpIrVOeAbmgwdLHcIgazFLVq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: XNp6uKvKa27Us1swUU3qdsqDdfi_JzqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX+sOfk77lNicR
 nJsTDfaLMyjV8tyntMmwiXsNmK7E4E477MoJCyFi1Hp0Ty5+6jzRMhe3xtabhO8qGarBvcoIUUI
 1WHVD34MEHDlODbtrFi6JCudkFpMPCvoOAOS+HKte7luNcV9/wq7Nj6GrU8wnG5B0jzFGU96xaA
 QSI/LQYcPeVgb3yoyYmejn8+EELWuseiAdbmfUNoNpJIUcEOVRFOyWuEgPIa7pgOWRdM0U1gXRW
 3HeRgX6cNX2rE9FtP96IHsoYXdx3UkLBhrM1b7kCU8Hs6NI8HHMafYNQPc78wDqv9uCwOjK3V2n
 202zyGuMbeJ9vaziNL6qmwKRKUFnxT8Sxj/gwFFjl9Yl6LkG45rHx8mQ8Gzvc5ueWVabM729zM6
 CtVzdSpYkWBNP4NtqMrb+FWiXZ+YGa6E547XhSXERdUiAxWnGZEvbsRAFxOaVC6klLt3afafdZV
 1ZyupMORjBGEddT7jCQ==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1d8138 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F_wByC5qsg8vutzaSOUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XNp6uKvKa27Us1swUU3qdsqDdfi_JzqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010129

Extend Shikra DT with peripheral and subsystem support across all SoM
variants (CQ2390M, CQ2390S, IQ2390S) and their EVK boards.

The series adds:

- QUPv3 serial engine configuration
- cpufreq-hw node for hardware-assisted CPU frequency scaling
- DDR bandwidth monitor (BWMONv5) nodes with OPP tables for dynamic
  DDR frequency scaling
- EPSS L3 interconnect provider node for L3 cache frequency scaling
- CPU OPP tables to drive DDR and L3 scaling per frequency domain
- SMP2P nodes for CDSP, modem and LMCU inter-processor signalling
- Remoteproc PAS nodes for CDSP, LPAICP and MPSS subsystems
- TSENS instance with 14 thermal sensors and thermal zone definitions
- Bluetooth (WCN3988) node with board-specific regulator supplies on
  all three EVK variants
- WiFi node in the SoC DTSI with board-specific power supply and
  calibration variant selection on all three EVK variants

This series depends on:
- https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
- https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
- https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
- https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Add missing interrupt affinity cell (0) to GPI DMA interrupts
- Link to v2: https://lore.kernel.org/r/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com

Changes in v2:
- Collected Reviewed-By tags from Dmitry and Konrad
- Squashed cpufreq_hw, EPSS and OPP tables into single commit (Dmitry)
- Removed labels from CPU OPP table entries (Dmitry)
- Squashed CQM, CQS and IQS remoteproc-enable patches into one commit (Dmitry)
- Added WCN3988 PMU support (Dmitry)
- Squashed Bluetooth and Wifi changes into one commit (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com

---
Bibek Kumar Patro (2):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Komal Bajaj (2):
      arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3 interconnect and OPP tables
      arm64: dts: qcom: shikra: Enable Bluetooth and WiFi on EVK boards

Sayantan Chakraborty (2):
      dt-bindings: interconnect: qcom-bwmon: Add Shikra cpu-bwmon compatible
      arm64: dts: qcom: shikra: Add DDR BWMON support

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Xueyao An (2):
      dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Shikra SoC
      arm64: dts: qcom: Add QUPv3 configuration for Shikra

 .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |    1 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   78 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   78 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   15 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   86 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1679 +++++++++++++++++++-
 7 files changed, 1918 insertions(+), 20 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-shikra-dt-m1-082dec382e7f
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260513-shikra-rproc-0da355c56c69:v3
prerequisite-patch-id: 39475cddaf673b2cbbae703165a782916f199885
prerequisite-patch-id: 6f7f265abfbdffdc0a1fdc5a7e08929e4eec5b7a
prerequisite-change-id: 20260512-tsens_binding-9af005e4b32e:v1
prerequisite-patch-id: 35141047f44b4845f9d94618bcf26ec58ab4a0b2
prerequisite-change-id: 20260524-shikra_epss_l3-522afe4fb8f5:v1
prerequisite-patch-id: 9e0a3b4d7b2033b39287b4382ba3c0c856a62e77
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


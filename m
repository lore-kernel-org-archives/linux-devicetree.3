Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D124D2F2607
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186520; cv=none; b=Yt899RoFwJirQJ46nw7qsoD+V3k/tPbmipPO1iDMx9PJKTSCpjcNEMUqyBdDST8b4TqAzsfnvIK02Mana5majUCPV+K2ZEFAZBrxuWEh+MWESb8KvzRrWY27YJgIgy08jEtLg4G3MdEimLpbualywTJNByWSQVrw587P7tfjgLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186520; c=relaxed/simple;
	bh=HftimpV8MSkXZw1i0z7r0ar6Azye4jTekmqYKLHE7XQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ooFvlFHaZuu9MknGkqwdkIBKhTQHEhrwRg04WhRNsYZVZ5gvruSWaY5PNX/Upf9EmZrb4QylsJpI4Fx3wIEYRKupUAPZGXj0IkYlh64uIgY+pv5ybmzniUaJZs2qeBa4952H++kVUg5hHr0NyLY+UCkTKikXTX9GlgVoXQPDH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMLH64p5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVjWxKRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMLH64p5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVjWxKRD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBHItY3505463
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OKtABV8zSeNV8l0VrQP3Vp
	vYQwHyasK44FDm5fHDl78=; b=DMLH64p5ty49AWbM5ZJct4/2+14vR0iCSZCmhP
	2984iuLvBai7ZayAGRCI0e7LdGzO9npyHciZb5FaceMlS0oDRI4t6SRRmP+URunW
	SWPR/bMfGvRXMmOvB1ubSD/puZOzytdScBVuZWZk3i/ND/an8fr14F/m8C5Jcggb
	fRhddbsRheNWmegJgiSfrgNWGBWbSx8Nf7JHgZ1vb2BPTv2sJgWlEhP/P21O5wrD
	zYMKiJkDG4K6OwLVMShMXZbSGqHUHVRelB1kKrN4tLP6gQCCUTKgosRflCtNr/HB
	9+GEOFHpF4l9KiNAwnSYiWwsazlBU/2Ii9JG2y5/VCp6hvXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870ksrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b258636d16so56751655ad.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186517; x=1776791317; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKtABV8zSeNV8l0VrQP3VpvYQwHyasK44FDm5fHDl78=;
        b=NVjWxKRDlC0Ub9V/TJZ3mkTJVz/Lm/VpCDPRWnyrlYpT0fmLNOugxX3H3OcH46aEgW
         4ts8FdNGElmQAP/5nXRp10vS3IOT5ldzyyqbCC0kC1z1BYedp8PY3b2G8mGEMoZBXcV1
         gk7jf4I1AUuBnAZ5B33YHiotJnCp9VZcc5FvCdMNVlEopORTi71zTPj6iR6XgR/afB6F
         gVRbu1AiGlRuQuFCHF+0N2V6WeWJjzQ1yQEpOLJ32omEQx/TZtPQusDI4Gt5ty241n3F
         vn+uNRwJ0SMivQhbZ74sOr321/O0+RFogwu+qYmBZJ7MlILLC5kX3d+lcAR43h/QLc19
         pcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186517; x=1776791317;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKtABV8zSeNV8l0VrQP3VpvYQwHyasK44FDm5fHDl78=;
        b=bfMUgNz+Cd+Ij+ZPdGdLFwQXKg5O/6yVpsyOeD5M6G4F12ZtELFomC2n2hLZ2iJbMp
         RfBMcfIGygf3UnW8TccQvYBZ1aw9KLTNgV5QU466y82+5sLoJUPr1ueiiLE/d1PK4fTE
         23WxjVXeuyLdGAe51tfIW8RMCTSYMTehxHhMhFtCh6yew9cByp85QPXncYtknHHnCzOi
         MUi0L1qicOOR0PkYs/UTHJElxmVbuL7tGoV1OtcZa3+N9At1RWWyleaTUpREsILPoCfo
         F3wTortZX9Iw7wcMU7hf3lkkpGq46KsqYOkSO3/W6NqlADskpHGE7XMmPQTs5B6pDpnG
         KjQQ==
X-Forwarded-Encrypted: i=1; AFNElJ83zxUL5UQ6k3qwalsnveK5p00pSseF4EFi4Wr6nX1S1PKmba0DUaQNdXvdTHLB63Lls7ovUyOFZPHf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58b9IBCn0pdUjCoCoNwR6u2qeOfZANeRqNYaY7gKC84fGv78a
	4x9FTowrhQi8SpJ9YHg8YiWqajt32wzKu9u4mJ3J1Pk+OhvtsdgJfyPA0SedaeNWizzGajImMJ6
	UxTVEqZe/rUJyahJkWyI7+ygvrQ9bhnYVELAQqTdkjENpEhMV7nbPwxA8g6rg7b8a
X-Gm-Gg: AeBDiesgeWyY4FWJbhVGAwj+nt8zqvwO0UU8but1AixWR1K1CPXEVxUz841cKbdWGgb
	ubarL71PnTZpk4SisTakU0+ENdG5860516s4hzZdaCimZ6zuVPd5cv63vT+1n11c5CngkDKb02f
	vM2GoBA2QvL7E689Oz/wzt74tWJyhiYOJASEMK8kQCrgkWkf7JJ8Ol40fJv2uIDavKeFWovmoX2
	nQRxeK+SArd3eu2g5qXi+zlslIBYatHkSJpeLR6yAvNbvy0RajH4DQVTdRT7zx8wIuFlmZAwX+x
	EdIT71DihNGw+xI6ZRbNxNrema/VieziHfdKAtKOCJj9b/F6OqtaCWFLGT8JVn2MpQrEjiFz9Uv
	3inCR81MEv6C4siyd92DdZHP/+z2hF8c5q+rbjixIulhr2CIP+J8+ReLDWG0iG1JaN/fG
X-Received: by 2002:a17:903:3c65:b0:2b4:586d:2e5c with SMTP id d9443c01a7336-2b4586d3429mr102100285ad.2.1776186516344;
        Tue, 14 Apr 2026 10:08:36 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:2b4:586d:2e5c with SMTP id d9443c01a7336-2b4586d3429mr102099665ad.2.1776186515563;
        Tue, 14 Apr 2026 10:08:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:34 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
Date: Tue, 14 Apr 2026 22:38:18 +0530
Message-Id: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ03mkC/2WNwQ6CMBBEf4Xs2ZK2CEk9+R+GA7aLrBEKXSAaw
 r/b4tHLJC95M7MBYyBkuGQbBFyJyQ8R9CkD2zXDAwW5yKClrmShz4JHEoMPQhpbOYPSoSwh2mP
 Alt7H0q3+MS/3J9o51ZPREc8+fI6rVSXvf3VVQooCWyyNVVYpc/XM+bQ0L+v7Po8B9b7vX4Ru3
 yS3AAAA
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=3173;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=HftimpV8MSkXZw1i0z7r0ar6Azye4jTekmqYKLHE7XQ=;
 b=H0QMCEeH8WRkVBHkdtYsNm+fr5B4HUQpop+yoxhuQh8BG34ajKkkup8LvHDJaINwlPAp/V7VN
 UGhjan92SfdA0K0U0vix4wwVy+JW5b8EmIM32CiJ9JsBWcxowTNesoe
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfXxiBt1Vx54rf7
 EXTlddxgFmfkeQT+rA2paDHppKoc5IgeM0KPdk55bFm6UWykMRHnwEaawYu8RK+Y2180QgPZuR3
 uB1esHaMqTif4xHOS8W+z2OCTrNvD1ujk24S+asGmRBR80DkFVsGHO/x1gYsCZ/mtEhhYIon7Wd
 +EhQHBpbj9IIjAOhNzK6cfUPZdsQkM+axcjWuQY2HahvjU50BTjkrG7bIgn3DdYTmVrQrTsz9UA
 DchpjdO8spqeElmsN590KITBHN7S/tLprzBUWAck0SNvSAcD0tTbirR6X9AeW07m5NyWtrmzui6
 hcfXPDizvc+o0iCh6PUvg0r5+B0Boa5IvUjH17v/FYjRuTP56rsQIws1gYCmumqKMyJClBkoPRX
 N09PCpOpA5ESm2fxRJeWkr6TfhofVOPC5iRt0i4b22JmoYHdXPOWD6e/vwzDeE73/dWXqZwcTDV
 vPycKiwPLOBrnmy5WjA==
X-Proofpoint-ORIG-GUID: 95S5OZH-Nlin4m15tCDFJ80pfLbc1PCy
X-Proofpoint-GUID: 95S5OZH-Nlin4m15tCDFJ80pfLbc1PCy
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de7495 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=i1EFcCpGWxuPUXEeyfQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Moved allOf section to bottom of binding schema
- Added if:then constraint requiring minimum 2 interconnects for qcs615
- Fixed runtime PM error handling with complete goto-based cleanup
- Added proper error paths in suspend/resume functions
- Changed interconnect tags from raw 0 to QCOM_ICC_TAG_ACTIVE_ONLY
- Link to v1: https://patch.msgid.link/20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com

---
Viken Dadhaniya (7):
      dt-bindings: spi: qcom,spi-qcom-qspi: Add qcom,qcs615-qspi compatible
      spi: qcom-qspi: Fix incomplete error handling in runtime PM
      spi: qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 19 ++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 73 +++++++++++++++++---
 6 files changed, 184 insertions(+), 18 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


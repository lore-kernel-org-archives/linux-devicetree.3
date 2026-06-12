Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C836B059
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285271; cv=none; b=cZBw+OWYr9mf98n1fnvm62QrIE5IAdvKqQ6UWeGrwaughzPZAbpLBFasLhOociNL4EWVMD/SJv3F5m7WHsv0S/JU021lOVGI2NbzPhaXeXYvex8oiWit9CSnsq9O6IZEL5UHEP6Rk4L1rLDwRTWZKlf61DXe9jES3vqdN9nlwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285271; c=relaxed/simple;
	bh=IigjJZAFdWHStKnJ7CJ8gw0Pf0NlG9F/hHW8w4b4TNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WSKp3EKZqWZDwW/g7Zla+nIwWrTCjVcirRS75fShVOlXL0trzbOQUDnYF6QjqXzXDZzFdOwXZ9fZhF9izmecM/+tnYpbnvFChXnIpl0ffsOE2ADf/td4gMZmRAM8PsnnRrSxzqlW4k+sEnX7Xbv7kjAgJ0QobEq0tbvMNBB8ftM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bskGhUC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnVGlTGj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bskGhUC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnVGlTGj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSYGL4112932
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w3i56TI7mNwfwXG/PMPS15
	fVc859gVGWKF4I3GdodHQ=; b=bskGhUC5ZS1id+7t8VapWA0GdAhdFr3pIEWrB4
	90CuBTLBN34ESIvwq7B2yxkH1rpzGiLse4KMcUAUi22d67Yz6gMd+wydG8EVrMmZ
	IWplyXzLwEfnGi41GE8VYItzDCEPw5OqmhcudVMO+uJ3fhR3Qhoh6txTS9ViN6xi
	vQU2EmoMGIFXsUsw1wLolOX/Hvw/AbNR42y02PIBI2fBZootPjNNMwy/r+P7FiuB
	7IWe65r2DbY+Prlm6GRqThaVep6ZgaUX73WYwXC2Nq1DDj6t6U9iQ3HEnTR2HfKS
	vXs6lz7SZfJBVYFDSakydCf2F3yA/KmrRdOpedF8AhzuvmSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ccxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:27:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a99db8dfso12490205ad.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285269; x=1781890069; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3i56TI7mNwfwXG/PMPS15fVc859gVGWKF4I3GdodHQ=;
        b=hnVGlTGjgiH6T2h8A4umjsijhtl+Ncdvkih2r6Y60gOKGnwCMfc2WmeXKZsWOiKvqL
         Xdfpo6hCqg+PvuswLHtcYI7JRlxa3d2B76Mwi+3D3nPv8QHgCTSmTZIjRUFm5/ilShUf
         pfnkFHDxpHOC7YnSAVMuAiuyZ/X0aFDT9Kqa+D159O7TmlNnIXZ8pMN1ZuORL0eQlk5f
         6o6ou0EP+c5vauqPpLWmn+GO645I20q9GDeNTqHW/Zqn9h7DKOJW4m9UBAmEmhBJS0Lq
         tDnqLRU8A5/k0pPF1/6FsmhVFUiJdtWm4pg9AukNg/IFa5aRR1abRinnI0wwx1DfJcTc
         oivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285269; x=1781890069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3i56TI7mNwfwXG/PMPS15fVc859gVGWKF4I3GdodHQ=;
        b=c4JwG+Jj9MOZxE4qtXGPz4eokjkWEko+9COTIOEp1quFd+o2C8+3onf517uzFbJKQ1
         uXMlKJ4q6/oN+VsE+FC9TgF4AzOuqWMDwWFdSiur4AoKeF6Cbv0noEt3nGjD3Y67V5jH
         40TWbSaNRlvjpaoogMON+QfEv/mNx/6brQj8muKTKdCKEoSD53PoO3qwrlV2D5Sf2QKT
         BFDrYPB7/kt/iQeFiQGsGrrPyquI4PE9jaLp1IGiUxbz7vajRyTleIJwL3DxVM0t9SOl
         n5xqfCppIQ2A0kAwowa4MCu3800bZuC5HUoa8b2By8BD0/Bw0d4aw6oDwkom+FjcBoCG
         /tQA==
X-Forwarded-Encrypted: i=1; AFNElJ9v9G8zzFSc509oEWic5G5/AFAfSiGxpQtRnWOHe29yr/taxYB1b++woVNKwcKfYV4uxZM0mP3TC9lJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWFxIy2T61GAXPT9/Zs4TQSjJ7JvVew3wlMBvOZoNeyC4jSNTG
	IDqbAKVbnxHH51muXIheJna234JY2svRsCGWiHjKBHJWVt57WO74ibeK8UX21oLQEVAbenI2NV8
	dezwcQKc/NywNcDYB/yC0LBDdq+PBX8xu7LsIxitQkxm42Z+qsw2SH7v0eZaPMXOGNMwrwH0Z
X-Gm-Gg: Acq92OHMEH4lPs39HahiZDlDCQ5W9Mi3jt7U2DAC4mm5SqQjdSfnYYzIxTRUUYmZADe
	WsJhlp0EbvTKaqDlLUsPZ+nwwXwkpDBwA3nvCp4IiJdpmJHhEVyen3bqCrglKIY0Zuh64EyT8IO
	Fue1In2Vvk5kqol3EgEqGnRI0p7B9Ij7ue6DYOo5Op7rI49VsjLCiKBVQTnk/lguJQuQRJw5vnk
	J+gVUTsmnh2iDtfMJEvw1i8BD/bHwAGHNI/FkDAHAARjEoWTomryMEYu3/yRhODXhLwzy0r1E3+
	qDIe5eYsRu9h5Ruk9iZ+b+CvwpU8R+tme9sFTiVsVd9l6i8T7SzQCSVdl9AA2fsq8hO2C4eWYd5
	B3/9agkZhtUU8v/07kM2Q5LZB8liUDhcSgeoB
X-Received: by 2002:a17:902:e545:b0:2c0:b9a1:6493 with SMTP id d9443c01a7336-2c41178c6femr40192885ad.10.1781285268663;
        Fri, 12 Jun 2026 10:27:48 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2c0:b9a1:6493 with SMTP id d9443c01a7336-2c41178c6femr40192365ad.10.1781285268183;
        Fri, 12 Jun 2026 10:27:48 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:27:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v6 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
Date: Fri, 12 Jun 2026 22:57:36 +0530
Message-Id: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlBLGoC/43S22rjMBAG4FcJvq7K6GjJV32PpYTRKRGN7dRyT
 ZeSd185h1ZlG+iNYIz+zyONPpocphRy020+miksKadxKIV62DRuj8MukORL3TBgCiSlJO/Ty4T
 Ez8S30ptWSKGEasr+4xRiej9bf54v9RRe3wo5Xz5+id3m7Almbt7OOTId+7K6w0smDIwIPsbIL
 XSLXPk+5Ix1WoK+prc9poMd37c4+G1RtpcfZbJwQokyOuogo+XcPI05P76+4cGNff9YlqY+6K0
 tDre2Uh96YtPg07Aj2FprPItUedYt9KeohM8byq5OxigjWg/xF8nZ5ekzWu6AKm2CANNeoxZzI
 OsB0txtggNuKFO2jehE4Bi5DNY5xNapaKzSrbSoabOOZJ/yPE5/z9Mu1jqT62BZNdiFEiAtVYJ
 rzsF7+P/WVmxhNWBqgBXAAbUGohXcyDsArwD2rQNeAA0x+qCReyfuAKIG2hoQBbDSIY0Ilht2B
 5BfgPr2uBdZAAo8eKZQS/bDy3k+nU7/APrlR7VAAwAA
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=4578;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IigjJZAFdWHStKnJ7CJ8gw0Pf0NlG9F/hHW8w4b4TNk=;
 b=8paggs4TP07URFHVkDTNL+yxMhHR2xjlmOPiLSkEr627GHxsrQ/rlqrSFd7PSaCvuvuLxTh0t
 733e+YypTmXD+LroAuovCik68JnSfIQTeKYY+lPHWgCPqai44NzdZ61
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX12fqi7TCqhYt
 MOejoKxIbPjK78ZcnEYZEZOsAOH2snykBDOY9maxnX6jOt7fkk7Xh7G/7PMHb+3soFdIhieyIQ3
 cs755w5/rPcTM1UYBDqA7ditPMTEyApiwozIvC/9vMdFsOPPxyJ/Vq7SKTff+torCIRja+l4fB/
 xznQos2+N1m/KmIdc+52sBEnTx+fcACNZaK7+A1D6ZxcYBWlnt8vYHgTfxZxVaP6eIKnrtwSU7M
 KWXa9X3uWAps3a9QlorU3bs+xLzIroTFS8x59a8bjjNHw5ZBDEeHwwv3brrGKq27R8eGXBcXRsi
 N53VhBDBSbBtAVg8SGSok+i7qhUhNDPHTFBAdRHFx2nIitxEsBptLCbN9E0SZ0dkPwtr++isFh3
 qFfJs9AWch1bO+6yYRqVYMM+BmP8UEo79NvduPsRdiVFqnPKOgA8KXTh2Kf8bs0HVlLqg7QscH3
 D7Bf8hysACjl54c0rtg==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2c4195 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9a9G3XpPGFzrMXkSwxIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GI6XfQWK1sY868shB6Q1iDSrtvPf6KYE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX7etOOHV//GVl
 7XXQWCLKhgLe4gRNfRhSWQpZOUnlmx2G+oRrYfCsh/KDkNiRcu/sJdY9Nc3kjeYc6KZN3b1ojr0
 lD9eq0yADxNShCJNzI/1Lc6WNTQZi4A=
X-Proofpoint-GUID: GI6XfQWK1sY868shB6Q1iDSrtvPf6KYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120162

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQ2390M,
CQ2390S and IQ2390S SoM variants and their EVK boards.
The series adds:
- dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
- SoC base DTSI
- CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
- IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
- EVK DTS files enabling UART and eMMC on the carrier board

Note: USB support is intentionally dropped from this series. It will be
sent separately once the USB driver changes for Shikra are concluded.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Changes in v6:
- Collect Reviewed-by tags (Krzysztof, Dmitry)
- Fix ranges value and interconnects alignment in sdhc node in shikra.dtsi (Dmitry)
- Link to v5: https://lore.kernel.org/r/20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com

Changes in v5:
- Add qcom,rpmcc-qcm2290 fallback compatible to rpmcc node in shikra.dtsi
- Link to v4: https://lore.kernel.org/r/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com

Changes in v4:
- Updated commit message for 1/5 and 3/5 (Krzysztof, Konrad)
- Incorporated Konrad's comment
- Collected Reviewed-By tags
- Link to v3: https://lore.kernel.org/r/20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com

Changes in v3:
- Drop USB nodes from this series; will be sent separately pending
  conclusion of USB driver changes for Shikra
- Fix memory base (0xa0000000 -> 0x80000000) (sashiko-bot)
- Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
- Fix INTC GIC_PPI number from 8 to GIC_PPI 9 (sashiko-bot)
- Rename SoM variant CQ7790M to CQ2390M (Konrad)
- Add PMIC DTSI includes to CQ2390M and IQ2390S SoM
- Link to v2: https://lore.kernel.org/r/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com

Changes in v2:
- Update SoM/EVK combination bindings (Krzysztof)
- Add per-CPU-type PMU nodes with PPI partitions for the heterogeneous
  cluster (Cortex-A55 + Cortex-A78C) (Konrad)
- Use full product names CQ2390M/CQ2390S in commit messages (Krzysztof)
- Update RPM interconnect tags and power-domain to RPMPD for sdhc (sashiko-bot)
- Update to use MPM for ss_phy_irq instead of direct GIC for usb (sashiko-bot)
- Add IQ2390S SoM (PM8150 PMIC) and IQS EVK board support
- Link to v1: https://lore.kernel.org/r/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  18 +
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 156 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts     |  40 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi    | 170 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 842 ++++++++++++++++++++++++
 9 files changed, 1324 insertions(+)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-message-id: 20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 2526e0507d3b5c065eafd75a657d7f903af8488f
prerequisite-patch-id: c3b7e18cd60d1f779b88ace2fae1227d3d37d83e
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


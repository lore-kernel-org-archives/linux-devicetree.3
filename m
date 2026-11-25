Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590772;
	b=PKwxec0s8MhKnaeBWlyDtjacvhySpx3mEF8+0ANtz2Hvk1qRKmiIXtQVoRdSiLD5TzE6
	 V08p1Edn2cPNkvW2mtMwlG2q/+j6+vO664HCmDe3UCby0Ee/AL0kmlSgdoV93bZghi0L0
	 ZA1p90P7xNuf9xFuQMKwW2UxuetwbNUOlt4D/ClTMHJEaQOU85OQTvfJ4PFkUB9WgBVOe
	 MJt32sTX5a8B6LY/2V49KghmJi634rA9PGJqfZaXk6ewf2FAhwoMzmnxGrOgwI2QZWHC+
	 JjuJzSDyeB9t+xZziu6yIV1ataxKCKjNdKZlf05mjGblkZA0kopO3/roqJCFyU0DDCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z5C2/oBmzCiyvGxYovb18Y03UU1iBorGa9Wy+Y0wXaw=;
	b=OTQuMkHiECdjly4bFRhUPHG563rr4G8oXJSMIIEMF5Bmp0PxYl9lSZMqJkgzaCNJU/2D
	 I/XJWh7vgw4nEm0UP7LEsX/6CqlnXJa9iHzQV/b86oENFK4EbC0oKZhZtCw0S+mbUcbgg
	 gyjRmCp9ZBzBHeY6fENlmoW+raWz8w9hWk3AXvnQtq1gusods2cw5XkW9c4QjYXKBkKVN
	 jWCrC9hDLu8CR/CMg1aAqCY0zaWY+0tinwYGe+sSmTAbfZmIk7CKVXXnBrqQntzgQo4pL
	 UpPGInye1262C/pYhqa19at45fEzAbaQ+6W7oQUJzCrM1ocgpMLOMJS8fNWDTr/rYDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lqhabfYt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N0UxjlMh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81386606A688
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81386606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lqhabfYt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N0UxjlMh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ShS3534084
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z5C2/oBmzCiyvGxYovb18Y
	03UU1iBorGa9Wy+Y0wXaw=; b=lqhabfYtzs6gC4V6Ikhe6Fa2y1X2aISFHB1bqK
	es7vA1hq4DamK03GxYPf42F25Ey0YaCpWHfEuhNqFPUKWGBkH32RRPQZzgImr6z6
	4RDRi1quyszkl2Jiyy1qrusqcSQdTBE4EsrMcX1N7xN6/Q2BTTtDz0pyYedF63xi
	R8wvqmvtPV5ldfaOfb86JgfhpCzGZxQ7NX0DpirAgRWHvYNMFPt7GsvQtI5aAgDY
	jZ5fVN12GKZsoZlxXTMdU1k3mpYN/+P2vhDkPhR9Y6xTXPr15ky8RCjeYGVSqb3Y
	av2cgxlDy9oUnbQDdYcwqPH+MZYBTMJFjchnHDzSmt3Cs+SQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhbq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso5102282a12.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590769; x=1796195569; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z5C2/oBmzCiyvGxYovb18Y03UU1iBorGa9Wy+Y0wXaw=;
        b=N0UxjlMh6Bcz2q9hbuf7KmIpZ1Ii487fNFFzycHHdfhQRbtSYfm/+O3UnIE1VQlslo
         8EaudKewUFeMb6oymqLE8zEKMsYKHmER9tDCi4W4xkgTw6bMZ3g74J78DbfzA36Elyv7
         4ha+/vNsUNyXDiTqW8X3hpf6ne7W1aSG/2+e5IjhAL1/00cJY+wXHqFKzPnpr0cUE2PQ
         As2iOMJoMA6bRI6qDWuMp86NdTI2rC60ScUMRMVo04Q/mxPHnZ3GKCgrJ6c4g8hbZeyZ
         tK7WZOFkQcFkixu3M7OnPOuLzZcPOLQM/onadOYETth4UygqzzRApBgEKRW6yPi0EH1H
         n5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590769; x=1796195569;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5C2/oBmzCiyvGxYovb18Y03UU1iBorGa9Wy+Y0wXaw=;
        b=ffakMYt4VuagPtxjTFsEs03+QCirMgjaq6jt/tkfXc+9PxtwqnlqAyctXbbcshaEjX
         /Or6nx6icAHYai6j6IbGf/T6WQUZhmNQKvfhT9G3Cjdi1487sGGjzBesRVrLERU5Ruev
         UspXECCtbnh6kvGAttrAk3Mgntvuaz1/G8QzDY1JfL3OcgHP1Ymu37XqgbEtZoVFKt+y
         /NWsefddn3flP0CgyxS9wxX89ktyVsrBbdQ0xEwqtnYsmayt6D5rbDvdeD+2rTEBBOR7
         S/TLX0hshR3A78oEGH0+ugykaIWnooXL9dKuKCpnIEqGRCSO8KcmKzokVlr20EckWAaO
         UYmA==
X-Forwarded-Encrypted: i=1; AL+hErFbV2bVt1mBBGgWNUvC2IfG/PKLVojNtMvkQ3GRb5bJtCYXuxRhw+0EUsP+5qkYjTyKhZ6IRj/DGF16@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyGpsSQkhveRFOQd1ebv2x47LfqKiaEmYDQY0jSIvOq1GG+xp
	BdadZagXkyDZtWkth/WOS6NZFVwd5eozyPpt1muZjVWrGqsiZ3P3yDA6fNNeWp/O9GIW685Wy0u
	9N85/RLfF03LWK4XKYAK8nF82XGi2We96KAxJWPm8XeqUQI8ehlQeRN9O78Gf4FRF
X-Gm-Gg: AZFdTZcSWlljqAkOMWYtpVYQD5YnDSvWGGNfS/7qIbyJxPujj7VqpXmf9FCtKMu9m0T
	2v4fe7C/y6XDrDyHEuz3Ko/tQdBFxbqlW3xEX0emt6QHdfYpCC+Zag6qDfx/8ZnaMM9aogVB2A5
	JF6bJZH5HoQCFx2wf1UjJuetttprlvHm6g5GLkcwF9qCF1lH15b2f1AnbvgWbLm1C/Bgxc6DaQ0
	074+RV1/IvtArxW4mRjoc01LVNSZMlWz9VIcLh6Eq21EYm5fuXghYaXiumHZ2OzYCi1DmTTN8so
	DrAImdua+D1PBfBpq4iFwg+OrinhK4vJPdscE4h+YSK0DLzf1JgkwnpMwXfOFRRjzxbGj5sTdVJ
	Q3m/4XeOjHPucxvAm05C4ArZ85ClgnFybX9QicNUDOs+EY6N1R1wYw1sza7p7cVeQpzKySvw=
X-Received: by 2002:a05:6a21:1b81:b0:3eb:aa33:e586 with SMTP id adf61e73a8af0-4014bc550f5mr16722358637.32.1795590768587;
        Tue, 24 Nov 2026 23:12:48 -0800 (PST)
X-Received: by 2002:a05:6a21:1b81:b0:3eb:aa33:e586 with SMTP id adf61e73a8af0-4014bc550f5mr16722325637.32.1795590768086;
        Tue, 24 Nov 2026 23:12:48 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:12:47 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for Talos Lyra EVK board
Date: Wed, 25 Nov 2026 12:42:40 +0530
Message-Id: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGiKBmsC/22Pzw6CMAzGX8XsbA0MmODJ9zAetlFkCkxXWDSEd
 3dTDx5ImiZf//y+dmaEziCxw2ZmDr0hY4cg8u2G6VYOFwRTB814wkWaJHsYZWcJupeTgP4GngN
 yLMpSZnkjahb27g4b8/wwT+evpkldUY8RFCeUJATl5KDbWBrwOcLXgIvYbw2N1r0+R3keOT//l
 K/4h0ig1rrKUoFKFdXREu0ek+y07ftdSCye4bM/EF97xGcBJIqyqQu5R12tgZZleQOKvRGNNAE
 AAA==
X-Change-ID: 20261007-talos-lyra-evk-v2-e2e588a34f6d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX4v6tQ73OI7zs
 id1phe7XntHa8a3iJWvOY9i8JIJiedVxx1eF4ZIR10TZYfOhQpb+IrVI4NFHmFPg5OI+T6BTPYJ
 LrJkyJ6Hk/Pj8FYess/QU+QKUzjatrA=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b068a71 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=XRYUP8yNB-fVxFRa9e4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfXy0tPlE1vKr84
 PbXx5flvP0iltUrdii68SnZr41JakVfhaobV+5/HANfRJUipyBIcAyk9QfeXjaEPW5ZmmSY9tCh
 6VUW5KLx8xl3zyxACpcozCFPhXs1MACzZM/aFungeTy+hFP5cfKZWamlpOBvQkW/I4sSBmktKgx
 HPop/Zmn3vl1kbnue0VXi7pLzon5mIYr3QSiZJxjbZh16gRDDA3hsZfEFY1AB0VuUo06Webtr3W
 V6zWqX5Xvx842w66VZDaoV5e1LfZjtXUsDHlcU7rOFwHeBf6YT8qpWgF2j4EDIVFKsrd8ZUxb4u
 CIalvGtxJPRAmGVCmhvy+gZVGta98UQWsD6qSe1a9Da+bjs4LnGzfilOcGPohaauinx52dhUyoq
 IER1kLOeald8N0/31ptQYOdBXepVWCL4uEybOFUB8VfUKbAHL5UxNPmhFd9eQvLU9vu7/5Y9Qmb
 vwrmWhHLntj4Cnu9xaw==
X-Proofpoint-ORIG-GUID: M_ltLKLzVVOjLVylFcT23fgXC0Qq0k9l
X-Proofpoint-GUID: M_ltLKLzVVOjLVylFcT23fgXC0Qq0k9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

This series continues work originally posted by Avaneesh Kumar Dwivedi [1].

This series adds initial device tree support for the Talos Lyra EVK,
a QCS615-based System on Module (SoM) paired with a carrier board.

The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
PMICs, memory, and essential connectivity. It is designed to be paired with
multiple carrier boards to support different use cases.

Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
key differences are:
  - Adds Apache (Lite-on-Module) WLAN on SoC Card.
  - Removes SPI-attached CAN transceiver module.
  - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
    used for the SD card connector only.

Note: The following are not included in this series and will be posted
as follow-ups:
  - WLAN node
  - USB Type-C OTG role switching via CYPD6129 controller (OTG support,
    VBUS supply management). USB controllers are set to peripheral/host
    for initial bring-up only.

[1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com

Changes in v4:
- Fix sdhc_2 vqmmc-supply: use vreg_l2a (1.8V-2.96V) for UHS-I SD card
  voltage switching; vreg_s4a is fixed 1.8V and cannot switch
- Update vreg_l2a voltage range to 1.8V-2.96V to match UHS-I requirements
- Add QSPI SPI-NOR flash node to SoM DTSI
- Add EEPROM (atmel,24c256) with nvmem-layout on i2c5 to SoM DTSI
- Link to v3: https://patch.msgid.link/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com

Changes in v3:
- Remove inapplicable Tested-by from dt-bindings patch
- Fix DP HPD: use native pinctrl in mdss_dp0 instead of hpd-gpios in dp0-connector
- Fix model string: capitalize "Lyra"
- Squash EL2 overlay Makefile changes into board DTS patch
- Move USB PHY supply nodes to SoM DTSI (supplies are SoM PMIC-routed)
- Sort &node overrides alphabetically in board DTS (&tlmm before &usb_*)
- Reword dt-bindings commit message: clarify board/SoM relationship and explain absence of SoM-specific compatible
- Link to v2: https://patch.msgid.link/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com

Changes in v2:
  - Drop qcom,talos-lyra-evk-som compatible from the binding; group
    qcom,talos-lyra-evk under the existing talos-evk block instead
  - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
    vreg_s6a (smps6) from the SoM device tree
  - Update board compatible string to remove qcom,talos-lyra-evk-som
  - Add "talos:" subsystem prefix to patches 2 and 3 subjects
  - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
  - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)

Changes in v1:
  - dt-bindings for the Talos Lyra EVK board.
  - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
    QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
  - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
    SPI-attached TPM (ST33), and USB on the carrier board.

Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
Avaneesh Kumar Dwivedi (3):
      dt-bindings: arm: qcom: Add Talos Lyra EVK board
      arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
      arm64: dts: qcom: talos: Add Talos Lyra EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   5 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 311 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 111 ++++++++
 4 files changed, 428 insertions(+)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261007-talos-lyra-evk-v2-e2e588a34f6d

Best regards,
--  
Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>


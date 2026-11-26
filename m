Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681963;
	b=EzVCYEb78LRSOS961NiTv5H+bM5hdAK5ASIbfg2W5elG0i5TL5TmsAw7U8OitxKaWAcX
	 FtiyYateLOwlGMeabkCnapP+W0ZuYo2HOVvhkPhF+XoqBL9LQLK/KKfr/B+oIUCmnjiba
	 LebDL185fQRlBMdBN0pHiPKKi28KEiBHSV4Iu/8YiIGnChen8sbSr8TeVPyeNQCxqFVPZ
	 K7d3RNMVY46wcLXp6f5CdzwAwHMParvDqtmM2p2W++R7oP3E+QXmr1hnS5NReRRflvPdY
	 HFPRgZ4jn0KEcBJwpW2Pk+9VLB16MD5zCC3G/AiVHjBKVGZJGUcCFD21khQz0B106sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zMDAOPLwErHIf4U7b1SooUvMrnDEbRmUMyCrGLsE8/M=;
	b=JWTDGBiE1kstlBIMmZtwPD+JTLSRFFtyKKU+Cctb0emUKH558boJr1tRwNO85ZljmX9t
	 644y6zYFfjaXfEIEK4rWU07/kcGxgG3B0ACFFI9Epsklf5sdf/BBqghvi4XTPUX/m9NjB
	 TVCgMU7du5OToyxxkbCbehDAdoJJzS9PL/MjlPZ3XYRBK27gacaV5JDUfVPTeOiZM/5wB
	 VhT5FbUskUlicpWB5pJMt1VSwV+/YBdvBBXxpL7FL1VScPrRu44RBQGyFhPHThZ31y83R
	 +p3Bizbt8FbDxVJFti4mXDRzOHZ7pkcR64EDImJbKMCQlq45K1BBo5M9wuSIr0xeUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bn/qIQaV";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A94606A338;
	Thu, 26 Nov 2026 08:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A94606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bn/qIQaV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9Sh3548468;
	Thu, 26 Nov 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zMDAOPLwErHIf4U7b1SooU
	vMrnDEbRmUMyCrGLsE8/M=; b=bn/qIQaVfXKn/WKPvXNUALaUqPaxMI3OU+jb17
	V8F/CdxezDZlrQlmHO7DtfR8eDs+8n1Rwdyd1vRvhQJSxlyLC5n5spBWozJi31xc
	zLikRdLtgSw6nyN2XRJDDCAj64z6DbFLj+ahmi+B53FHFwTn+hk01hhxP3f5yWGs
	IrgkuND32jYq9uwUOT9Nar1JDmMc22FH+gH65oNm0gaSfrK4r+TMAzJJDqBYuTtm
	Jw5GXPwzvmefIvmp0fiRXzL4TwTqSO2Oi2Ot6ZzMk3+9auDG/1QI/h6GmbQ8H14v
	W5MVCc0bKIJWFESoWAOlaOjJAU/NeNuk29GasOolEfjqsTTA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau1hs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WOFT3850903;
	Thu, 26 Nov 2026 08:32:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ8WOpi3850881
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 16C366AF; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: lemans-draco-evk: Add display
 panel overlays
Date: Thu, 26 Nov 2026 14:02:15 +0530
Message-Id: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJDuB2sC/22Q227DIAyGXyXieq4C5ADVNO09pl0AcTq2HFqco
 FVV330k6cWk5gbpR/b32b4xwuCR2DG7sYDRkx+HFORLxtyXGU4IvkmZiVxUnPMcmmDcCBh/oPF
 07swVpGmE5VVVuAJZ6jsHbP3vyvz43DLN9hvdtIAeFQEvc5JNWxnrkcissmP2urmEhA57M9BD2
 frBdLANRWCDH07zGWIBaSbbOl66JldKvo9Eh8tsOjf2/SE9b4vxmZ8LDt2kk8hBrCFylUCFrpX
 VhdJVy/dB1hDC8uOnY9YUWIu6lDUvLVtW/fI0jeG6XjPydbPH4eTO4SJPSqEM164yaFT9pFyhU
 fwDiWoPJBJIl1KXrkSUu6D7/f4HNYpRlu0BAAA=
X-Change-ID: 20261110-draco-evk-display-3ad2b1664c4e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=4127;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=1QUyK0ws8ONaOzUAOb7zjJ1BSjJhUz1Qr1nwngx+QK0=;
 b=eT9xHkEnCJPyX4vUbjAOIQHLC7vstmA1fFXXDTbFM56JhKQ7nlb2Tc4vJ0m4mHu03fsPKVHNm
 0X0YcXOjjt0CTFate1tQcpA1ChuKtIjsXbPXMO5uDOO6XGD8M83ptH2
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX2FDJo/jW7ghP
 QL23dSFpkJm9KMz630GQJbJdZGsxkOPqY8+/oyd5ih9OIRS7jxxFW64GsAV0bHE1PsYK52H4RzP
 Eq+i+b8IMiTnx2VJYKTwPUah6sFVjKw=
X-Proofpoint-ORIG-GUID: iLeWB13QPE3LzH_HToYguKXMIVPfW8mr
X-Proofpoint-GUID: iLeWB13QPE3LzH_HToYguKXMIVPfW8mr
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07ee9b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XtEAIIO-7vcKqsFKLG8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXwgvOmw7/Sz6m
 g4mVR5KZYKS8yVSfh2uND6SSaab3jLrvqkQd/0DNuyxw0LM1XMArR3it/wIlH9NkEkZ6oJp7c+G
 gkfX+zFPszi/jb9arRD/CtPykuK1iMg1TWnTohMrBZSZzkWaeUK8X9jmzxJtRPHul490T6cjT9c
 XCmKnIDClRRA+Gk1L0j9wAomPkhLXZyQQ8QR2cKUsm42jtKbFj0OfvOW+rn+zje52IiMygQmn5e
 J43jAcpRNcAzbfmJ9jttJOTXLAF4FdpIkzgmIrFBRgjfKWo2Ne3EtVytiLshZD05MGzO+wE9uHl
 TE9q3NWPAKMow9RG8tYmAFmG9EXtj7l5y7BEa50y7pYywtmB3d4Fe1l0scObhOq++JlhGsTq+Fu
 YsWLmzK4iTPDDeNCC8b6BLIDyRXXs8xfzgjsttEbga+gv9RbsDa5+OLPW72B7nbpATlEiSG0fOg
 hDUDuOjakrWmSv6lbgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

The Qualcomm SA8775P/QCS9100 (LeMans) SoC card is mounted on the
Draco EVK carrier card. The DSI0 interface from the SoC card is
routed to either the 22-pin DSI connector on the carrier card named
JDISP1 DSI0 or to the DSI0_B2B connector, through a MUX which can
be selected by a hardware DIP switch. There are multiple daughter
cards designed that can be connected to this B2B connector.

The below B2B display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

The following overlay DTs are added for additional display
configurations:
  - lemans-draco-evk-dlc0697-dsi: DLC DLC0697 DSI panel with DLC
    daughter card
  - lemans-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector
  - lemans-draco-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector
  - lemans-draco-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel
    with LVDS daughter card

These overlays are applied on top of the lemans-draco-evk base DTB.

Changes in v3:
- Fix node sequence order in lemans-draco-evk.dts: sort i2c1 alias
  alphabetically, place HDMI connector and bridge regulator nodes in
  correct order, and move &mdss0_dsi0/out/phy nodes to their
  alphabetical position (after &mdss0_dp1_phy)
- Link to v2: https://lore.kernel.org/all/20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com/

Changes in v2:
- Add #address-cells = <1>; #size-cells = <0>; to &i2c4 fragment
  in the AUO G133HAN01 LVDS overlay to fix reg_format dtb-check
  failure (Krzysztof Kozlowski)
- Use full board name "Qualcomm Technologies, Inc. Lemans Draco EVK"
  and reference overlay by filename in defconfig commit message
  (Krzysztof Kozlowski)
- Expand DLC0697 commit message to describe power supplies
  (avdd/avee from vreg_bridge_3p3, vddi from vreg_s4a), GPIO
  backlight (expander2 GPIO2), reset GPIO (pmm8654au_1_gpios GPIO4),
  and TE pin (gpio84)
- Link to v1: https://lore.kernel.org/all/20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com/

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
Anand Tiwari (1):
      arm64: dts: qcom: lemans-draco-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (3):
      arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD HDMI bridge support
      arm64: dts: qcom: lemans-draco-evk: Add hdmi-dual-dsi overlay
      arm64: defconfig: Enable PCA9685 PWM controller

Vishnu Saini (3):
      arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697 DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  20 ++++
 .../dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso     |  81 +++++++++++++
 .../dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso   |  38 ++++++
 .../qcom/lemans-draco-evk-lvds-auo,g133han01.dtso  | 133 +++++++++++++++++++++
 .../lemans-draco-evk-raspberrypi-dsi-7inch.dtso    |  98 +++++++++++++++
 .../qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      | 120 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi     |   5 +
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 590 insertions(+)
---
base-commit: d4e72753715bc741a78c4f7e8cf4f182f14f96c0
change-id: 20261110-draco-evk-display-3ad2b1664c4e
prerequisite-message-id: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
prerequisite-patch-id: 9abb39ca0584a3ce35b860674c31456fd509ac2d
prerequisite-patch-id: ad7e63dd9462d71212a2a5c0e0b7a05253a21084
prerequisite-patch-id: 33617f32c25ccc12796dee76077808715eb6f3a0
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>


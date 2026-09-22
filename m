Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640FB551989
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089292; cv=none; b=m0HBI5DycZkKyVs8DMjXhsv7uOSdvWgZNYN+XpxkIzspBmJJ5uf653j9BQcSFQ2j4VYwvJtw/gOc3XteQpPOsOj0ofWPHVSdkd+NInBSLpdwT/vJMk7Oz5HKUsIP8aRGnRQ+9oxLE23WYZQZcZ7OyCJYIDCKMIH1CFfPmd8mEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089292; c=relaxed/simple;
	bh=FAjeZRneUS07YGI25/3Eh1Qgzc36kfOxzN6RMttVlqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LaWqfOMHid/rhBUFG2yt2L/wqhiTHkSU4Ip0OcaG9Q5Ce69P3OMl0EWd8hiCV/hriSM/kyX2PptbhwJuh/wUe18fsrKMub6Nj8DvZtawp6IvHjE/AmPa8Un4mgUH15jdtL3BIdkeUtEAEktGOxZr1fQa608CXm61I9MvgRyBkeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6vJ/OBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMGlGatc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6vJ/OBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMGlGatc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjHr8573084
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FoeWl1cPaBMy+RKb+Xq99Z
	3tlRXXvkelRP1fSd0n6ug=; b=H6vJ/OBKjfI4zxe+j7zdZaHg9hDfIttC8OMpi1
	7nHoHok/oVY6OqK5xyr8UTSCisOq7weY7b2kaZb5xk5KCpIjXApsVW7KOjsfPx7C
	/IX9pNPI4VQCjv8ibw/U9lIeksRwrN+lKo9eTliZJa4BZMe43jV+bt+nbecUJ/R8
	WXtppEwPGKjFfs9P1nfb5pqfbbg6uf9kYBEmo8fB+TgiluljFDTLwIGr4Dp0HSRR
	2cEreeJ/wwHlHyY7yvAgTbFkGzjCrgyFUKnrvTrVmber6JChh/eiiof6mBo/6e7r
	WNgCPW/nou7Esab1uNtxLiEkDeJQk6nJuo15mt1gnz76+3WQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjammp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980989f5030so3329683241.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089287; x=1790694087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FoeWl1cPaBMy+RKb+Xq99Z3tlRXXvkelRP1fSd0n6ug=;
        b=BMGlGatcbCfw41Qq+YvMiMDcAVC1Apo9F91yRfVA1K5+KruiVadtSoAvBP40fiDISg
         FyuCm1fsET662mj/GQ/ZEV6KMwsBvSnEiMJEMKJc/Ihpg0NpIAtPHReOeQmKdfgevQ2M
         ZAnvVGp+R64a0LOVRE0N9nF7S+EDRLC2QLATv2SJKk+844EBpyToNePwvtYIIjY3yz/l
         2qGCgK6qTc3omeFxKZXn98H+R8Jq9kZtlziQF8bKWwjA5xEptYtMGxZKNxNt8tAM5I0f
         IdFT0scyBmn1cakck69PKIGqggJ6w0QpjpOALI2R4IjMB2OYEbxBjF0h3VQTk2auLCeN
         AM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089287; x=1790694087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FoeWl1cPaBMy+RKb+Xq99Z3tlRXXvkelRP1fSd0n6ug=;
        b=MMFdKL9qd5GQhIswua9gKu4hTpYBtk01a471KOtn9QhJBKPeqGr+W/vubSQMECbrbS
         db/fSUGXqoBQuzTBUwxGaE/kQPcW6lgP/OifUQuinsLP+iLyAYHDXrVMXEneZFxu59UY
         k/oU9VAM1RpAQgwiXAYWxMX5iJlvBQBSbyvnKZvKJeCdn7M2s0sSemVQm4HLi+4/KB8A
         Ve3b9LgZSFFEti8G6Zkl9DWO4Tn2ioP1risZSl12XzFYb//Qp1rSARvDuwuNl0yXmRhO
         F5ZWzG4bnvoLM5bx/TOdCV+8loCLiE+j3SV2n7F9KWkweYLGtvsu2pW8ul2PTWXyGZmZ
         pzKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwed/wnk2UCitNiF3B81+IyO2uQqQg0AFiF+JVkkcJyLgRl0Dj+6c1vqOrptXGjKyZtbTfFGiNwXlCb@vger.kernel.org
X-Gm-Message-State: AFuF++mIIa/2/A3fOH6suGDuI0BLvaiuqKftfJgpLZgmcE9BZe0IDqd7
	5VXwqI3efThRnTC2MhGLInEe/XqnswAFZneVmlDu+GZOsWdMC5t8AcE60nPmb0u0fR3EKw7nhfZ
	r3VHn0UfmRS8SV4WpZ6DD5bC2VVSwoIRk5DmODqimVAjVRFqeotLl/FDSXmDfWgGJ
X-Gm-Gg: AYBFou1Un7DZd/1QJrWfrhsk9tReRV3EsY6saktgM4f4lXkGVIQK44xyyCbe9a6RuP3
	op5/DkwxbcT/ubRJJgxIbK/n2EzpiTkr978HNKnxXSNnuuu7iQSX0QM6NmmHmIdoNxBtBcIrswR
	n9fVEaj9p5Qc3w9Bvnq5xuYyvM1tpiYTcFUz6kgUy1iuN+zt8FupEu5pfFZXyTUqlJb0acPP65L
	onLYjK82sHsDj+nPHTfENZe/uKR9VX55wkTAoYkKRErkMemEYXux53Jp+GIXK0plDGEZYBIIqxB
	YxXOuEN1rJ3z26t1k2wAEWiv8usfKcOVGUpiesbeWkmbHVuXKSnebLFPIwLfaPNVQbm4NTEDbXn
	NAxObqYo0dx69o4MzJ0EjReYU4VM=
X-Received: by 2002:a05:6122:e189:b0:5c9:a60b:e5a8 with SMTP id 71dfb90a1353d-5c9b5977bb1mr9753302e0c.10.1790089284448;
        Tue, 22 Sep 2026 08:01:24 -0700 (PDT)
X-Received: by 2002:a05:6122:e189:b0:5c9:a60b:e5a8 with SMTP id 71dfb90a1353d-5c9b5977bb1mr9753238e0c.10.1790089283835;
        Tue, 22 Sep 2026 08:01:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: nord: Add USB support
Date: Tue, 22 Sep 2026 17:01:06 +0200
Message-Id: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKYsmoC/x3MPQqAMAxA4atIZgMaUNSriIM2qWap0vgH4t0tj
 t/w3gMmUcWgyx6IcqrpGhIoz8AtY5gFlZOBCqqLlkoMa2Q8bEK+HPJu6Mj7uqm4obKFlG1RvN7
 /sh/e9wNYsoczYgAAAA==
X-Change-ID: 20260921-nord-usb-dwc-dts-c2ff685d8219
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3150;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAjeZRneUS07YGI25/3Eh1Qgzc36kfOxzN6RMttVlqs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg4eZZ0G5vN7Wkdu1FJdOiY3SNlRsFADGJ4n
 VVvkFGxzuOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYOAAKCRAFnS7L/zaE
 wzY9D/9Jh5nK/C63c9ifJg8HwpmgzBuaWMkluwvFg73a/jl02wiEZ6wIOoaryeBX9N3M7dCdLie
 hFuKv12V1/fa5L8k4OPlisl2+1K2NNT8x6YNZS7acPzlF9l+bOtqKEMk0uo/fWNTbg3RC/xTOVY
 mogSLuj9DZWkmPa5zk10maUqO7U+JuLHbUf2QYbX/X2t8nr1GaSpcJNApBsCx2Heu/ZtyF5K+ko
 qZJHgjiuP2mvNelmsDJYoP0uRHyVZGrZwuEhS2pA6pKrP9ot6UEzJDExyi2nJsCRZc3bvCua6aw
 nMf0JSuM489NgnEoTf1vC/qdrMuE8EIuy7iylzefFrTU6i4VBCx9YtHynsriSbdidGR5+v1utmD
 erYRHggBWwgf0yk6RIiVyS2qOV5PbOs0YijLF0zXEXXUu9oXm4XG9Z7ziDlLxyb7WdP99d2qGoH
 dwiXf9M1+LhzRpzUbDQmf1jBi5jVjSBUtOr4upYCnEdTY0riKmCQfKb7DAOKxtJIAgmwkF0Sj3W
 AC+ZYsVSexzW0A9ZeqEqd7o/iy7yx/iaAup9U9PBc6poDJDMd2oGXM5uBwYhXSQyI3Z17Ujl9RN
 sFRUCv0fycwt+IBp4kV60CRgmhGX1hIKQloI+TcKTnoDUptUuqvXzJShcYIdi8MsozXbn4spDSF
 pNNv2wsijQbheAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: bnKHWU7o-dzFw1-r0GlY_Oh2Yj0iZ1pi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX0dxIoEZKE3Gu
 +TgsCm0ud5gl+tKayiB5X7XKWnV1AFBFfzGSm0jg/wB5toS8PfE6vgmDcIL9s/tpvhV5MH4/Lf6
 v85zrjS2j4nWbkPj/qUa0Avx9GJJdZfHMv938OgRT27qOgb44dXXfs58KKIy9WNVS/C0v04i2io
 HiFpJlqNw9sdQBeYdfFQdhou/2iARWF+nvLfer+Tz68e8Qds9Fg1dmcDuEyajYPBovLpVaCWO/m
 Z6yxkiY8PHg10YFCbHAX+iQhO2aLChZjl1tZsbn1SkU1lthRs5C/9UCBgfmQJbUxyTx4Ovpx9cu
 /XRja9q1IKR0qwLhWxe+flB8G0iImqYXZ2Pj0RLjLNf+Mi0NJeqkxLNQdTfmUTQ29YxhbF9aRVe
 872nuZNk8p+qBhpowU9v3DDKVxD/YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX59I1lESVgv3F
 Zt7dTcSNyOhi/GeistZRSzxHGaPRxn6L0DbET6l6aZjwTSkpUxIkKbLEZp5XnOTCc+iPl4elHgL
 skcdDj0juu74zB4KRu2m8NJ4Vxfz3pU=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab29848 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7rNyl4BNHWs_c8C4O1EA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: bnKHWU7o-dzFw1-r0GlY_Oh2Yj0iZ1pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220219

This series enables USB on the Qualcomm Nord platform which has three
USB controllers:

  usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
  usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
  usb_2 (0xa200000)  eUSB2 only, high-speed

The first patch is a fix for the i2c9/i2c10 pin functions, which is a
prerequisite because the eUSB2 repeaters and the Type-C controller all
sit on i2c9.

Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
kept as far as possible free of anything variant specific, so the
clocks, resets, power domains, interconnects and PHY references are
added separately in patch 3 for the "embedded" variant, alongside the
five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
lets the two pipe clock placeholders in negcc be filled in.

Patches 4 and 5 wire the ports up per board.

Nord RRD:

  usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
  usb_1  host, Genesys GL3590 HS/SS onboard hub pair
  usb_2  left disabled, not routed on this board

Nord Ride Embedded:

  usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
  usb_1  OTG, USB-C port 1 of the same FUSB15201
  usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
         fixed regulator

Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.

Dependencies:
- PMIC DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/
- QUSB2 PHY reset: https://lore.kernel.org/all/20260901035322.654-1-shengchao.guo@oss.qualcomm.com/
- USB PHY: https://lore.kernel.org/all/20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com/
- DWC3: https://lore.kernel.org/all/20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com/
- FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop pin control fix that was applied upstream
- "otg" mode is the default dr_mode so drop it from nodes
- move the usb-mode-switch to the SoC level .dtsi
- Add hs_phy_irq to DWC3 nodes
- Wire-up the USB2 type A connector
- Extend the list of quirks in DWC3 nodes
- Remove stray comments
- Link to v1: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: Add the USB controller nodes
      arm64: dts: qcom: nord-embedded: Add USB resources and PHYs

Shawn Guo (2):
      arm64: dts: qcom: nord-rrd: Enable USB ports
      arm64: dts: qcom: nord-ride-embedded: Enable USB ports

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 311 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 309 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           | 166 +++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 100 ++++++++
 4 files changed, 884 insertions(+), 2 deletions(-)
---
base-commit: 491d08c98db7ce0a90f229c7ad23638a3e071411
change-id: 20260921-nord-usb-dwc-dts-c2ff685d8219

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


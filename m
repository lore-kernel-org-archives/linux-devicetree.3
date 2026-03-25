Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE223CF042
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438872; cv=none; b=BdOWpO0PERmWFgHHfPkqm5+mCWqXJPfGv564Ujg4T5WyWa1Tb2E/ATSIz1meEXoPj8BPjaiwYAWml3Qt3LiqUDV81qafJP15PCLpgUWslnbOc9BL/7W60bolgZlDobvCULCSgkS0qb6LUmYVGjmQluYIUVHeLGAeccqdatJC8Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438872; c=relaxed/simple;
	bh=Bd5Zj77Afrbi93itSgzz6wEhq6AlpqoXaZTn89LMFxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MOM0avqJVhkkS2/Og+eSyq9a7rc6RMcJpkHR0wCGBsQpasJb2pCtURXPB02ln70SUQ5Zr2gqha4RFV9vr8nTS4CvHysoZ3YXzehNQYh5uNINQCZnwV6IA+39SEmyi0cyeHubCNrUr4ZkX1SRaCL45aeQIRb2XY65KoRI9BfQLgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD8AaTHP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcDGAyT/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XD8AaTHP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcDGAyT/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGGEr241550
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Rk0S0qJQ9ZApg15/6SWOG
	zu/ILkOd8bT0S2MPoJzU8=; b=XD8AaTHPe3xClz6y2T3KZKZbSAB8WaPpp/6jd1
	YzWjejsL6aubMfPkNR+MkH6jo3WMtjsf+RioPFOwtWnarbjwkXg/N5Xak9uiivMI
	6Odg9CoD4dVxR94xqVkQkh+vaVQM0uqnFpmVZS9KJ9w8KE0g8wXYLuV7q9Me+9fn
	lRRPbruNot1IX2MiwGmPBImQi7blvRqu6IDok+r3AIHKaADyIze9+AQO6Bk72DoX
	XXs2s/yAV+W5lYRrs3ZNdU+Dewj/FmXkeKaxIFCXH3kxIslQTvOjqYQCthtP7FzB
	94U6pMvm3C8Ys98HoMcx1pcoQOQ4c8/cppbIRHu3Q/LhN1dg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp0hr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:41:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b079b4a8c3so92756475ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438869; x=1775043669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rk0S0qJQ9ZApg15/6SWOGzu/ILkOd8bT0S2MPoJzU8=;
        b=WcDGAyT/AIBGPkz58g+w+j2D6NYSAxZSPhZCQj1HLUsKh9pCpdtmcXAhuEtu46Il5U
         B1CcDLZtpJE6zWHzBKzQiBR8xqawFExF5YMkfPLbloteMHyo97mZp4sw3LHHLehcxhxp
         X2OjcsXSH//SYTLOEDO87o15PVY7ToMUXFNgyUGakuZEJk1wWCWee+04fhaO29Blcnnk
         Dd0UOZQekOxZ5XApOk/0IVb63xGDeHevMI3XfaSIkGNVfjuUcJkKMahUa50CLA9vGDQB
         F/2ke/uU3r1E+nMXGkiafr+LU2BnSFn/Lt43NxargPerJp78gR+TrIKL1OBDMq35bsbV
         Omrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438869; x=1775043669;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Rk0S0qJQ9ZApg15/6SWOGzu/ILkOd8bT0S2MPoJzU8=;
        b=cCSQC5xegN/pBf3AWcYO35A2LaMu38bHGXov3vMQcFmmFozjr6AeuoHTi11TGz48sR
         3UAjv8UHVTuyokngO+gsNBri0+AEwVq9pKjBbSgQA5MqD3Daqdiy2NtLIqqP3iLZoWwz
         H3CDuLNrZrf4AbLZ1nJnM0GdxcW3WZ77hZu3qz1cnlhvQZFrqPUYftgrdXZXD9+RRieo
         WBOMHj1qpa/3OB2j8aKmlXOjz+BFCrZwTYc7GkM/gsDwa8Sq7c0cRVzAnH8uTaqMAv3Q
         K7L46O13JNQ/BaQwD3yBJZuF1Xloi16F074D2zV+FfFOE+Jr7C53G4X0XDs9UyKLvdwi
         +wcA==
X-Forwarded-Encrypted: i=1; AJvYcCXyyaORQecS8NOCDSF6Gy6gh73ssX3uFgrzSC3DlCeVUCS4iRr4gXGXgQ31gyOT0ttGSwaTfynPN1Pc@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwrxQg+EeQeT3qRcjq/knRp4PWVLUaBg4P67NmB+iaoo5QJyf
	y5VyUdgvXCTmNDIVWUo9doyzBUKoFmyg7WqxNTHAvtDlZVAAGRlS1JRNkEMbn9MTv3tDm7fkrlB
	JV8QROkaYD9geMx1/t3xf282S0wO3QunOS3fcj5b8uwbOLsauJXTNmN6D3FPElkIF
X-Gm-Gg: ATEYQzwR3uY/MyzVW+M/s9NeR1Z2JvlQKqgI71TUBEVv18JDfQuRlcDk2ziHax+xnUm
	vCQDRIoudoAKxRJJzCsg7cvcGptMN6rl/c8DHigqmntDz9GaTeMeMt6Ayk02oRQjW0vhWYdbZeo
	MIexQd+bYFzExwmEaU/+ydtkbK/URc/F+1b7mf5Q4FlEmOO1IxXxWDt4Y942b9Splf0Nf1yFMO2
	4nRBnlWUwv5FPxry4aLL+tW4LyJz26TcqAhehirRDSy/27zTuI/ZB9H+ByS47dfVbQLDH/blCar
	MDWL+nIWYkUJWXbYGFxcsF7asLCEeuLUaYkPqOAxaOfuGaQK3BTXO9ft1flxPqwx3jhuIVRGqNL
	fnXlm+NYyzWl9yklhuQGPFoQzWYUzP9e4aZINM/wH0SqqCaHDv16EAigRwrlA95a8hmd2Ni1tx8
	Gmk2FmLfZnhPl4ZDaL08QJNSMZUHPM7NV6eQ==
X-Received: by 2002:a17:903:3b84:b0:2b0:5bfc:8af4 with SMTP id d9443c01a7336-2b0b0a8b337mr38312255ad.34.1774438868522;
        Wed, 25 Mar 2026 04:41:08 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2b0:5bfc:8af4 with SMTP id d9443c01a7336-2b0b0a8b337mr38311855ad.34.1774438867917;
        Wed, 25 Mar 2026 04:41:07 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:07 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Add driver for EC found on Qualcomm reference
 devices
Date: Wed, 25 Mar 2026 17:09:50 +0530
Message-Id: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIbJw2kC/23NSw6CMBCA4auQrh1S+gJceQ/jommn0kSottpoC
 He3EBcu2EzyTzLfzCRh9JjIsZpJxOyTD1MJdaiIGfR0RfC2NGGUKcppD9pasNFnjOBCBDTAnRZ
 t55gStifl7h7R+fdmni+lB5+eIX62F1ms25/WcMhU7IhZAAWje0vRWcW0PoWU6sdL30wYx7oMs
 sJZ/mPtHiQLxDvbNE4y0Um1Ay3L8gWkdHrMBgEAAA==
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=3978;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=iUSkW9hF1tQARLQxRvW7sWeXseefe6gqwXUdgAco1n8=;
 b=uMNig+xsNAZnVO8SY8k2NiXFydzPtPOLYwXCQDRyxaWz6oZV2I4Db0BDOyDoMsALmnrHEjp1K
 w3V1e7NnTamCwlb/FJzqhPCP2aF0skA2qAkk25i7ng40mJQcjKIxeCN
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: iO6vB2ZXwGwD7fIA3HJJR5lEQ1ZDhxT8
X-Proofpoint-GUID: iO6vB2ZXwGwD7fIA3HJJR5lEQ1ZDhxT8
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3c9d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=N25LjsP2d8_K3VcmG5IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX8uee8rdugq3z
 OEspOK5FSU4UI2Y24pxjFRCKZnEaHqfko6Q7ZmmKeoefN4P4hRccfBg/da8Bp1BDLOSftyG+1mB
 ByQoYSGPOlfSkmGyAcWC/CUIabmbh39hFd4QKADFeg9LO5kXK7NijSdBExpokqmAheM8FujOFhV
 kQyK58D1at6XclheJaEKcH0JKl0V1niKCpumidCR6IahrARzIazmlnmDM4kvv84UMNGzuBv/G8L
 XyRtxFKGBLNoJ9K7LAnUDu/5xpdtEXxA8+tqchPDoxQWiFKMH+x6Vv5Xl9q9CWRLGqwIfPb4kHk
 qnPWX9JE8B6LKrU1ghVEN8c0tpyzRbNSnUdunpYhOrzYvriMeky/zFOrhx3deAO6gW5IE7mVkJl
 3o1FZ1N2sE3p3fEwp706CwHICF+g1jaModTemHd1b78BLvmRKOipvjzQdgO0aCNOWo89m/REFSh
 coGNsT0YGQUSUJZNYdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v6:
  - Add missing includes: <linux/bits.h>, <linux/device.h>
    and <linux/err.h>.
  - Change the thermistor_mask format specifier from %d to %x.
  - Change loop counter to unsigned int.
  - Replace snprintf() with scnprintf() for safer string handling.
  - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly.
  - Add missing braces.
  - Link to v5: https://lore.kernel.org/r/20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com

Changes in v5:
  - Fix subject line and commit description, drop redundant
    "bindings for".
  - Rename binding file: qcom,hamoa-ec.yaml → qcom,hamoa-crd-ec.yaml
    to match the compatible string.
  - Update $id URI to match the new filename.
  - Add <linux/interrupt.h> and <linux/slab.h> includes.
  - Switch to devm_thermal_of_cooling_device_register, remove manual
    unroll loop.
  - Ratelimit all IRQ handler log messages.
  - Promote unknown EC event log from dev_dbg to dev_notice.
  - Remove redundant error message after devm_request_threaded_irq.
  - Simplify qcom_ec_sci_evt_control, resume, and suspend using direct
    returns.
  - Add dev_warn + early return for zero fan count; driver stays loaded
    for PM notifications.
  - Fix thermistor presence bitmask documentation: 1 = present, 0 = absent.
  - Fix snprintf format specifier to %u to suppress -Wformat-truncation.
  - Remove unused cdev variable from qcom_ec_probe.
  - Fix typo: "exluding" → "excluding" in register map comments.
  - Fix capitalization: "ec" → "EC" in error messages.
  - Link to v4: https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com

Changes in v4:
  - Fix fan count calculation to use min() instead of max() to correctly
    cap fan_cnt at EC_MAX_FAN_CNT.
  - Remove unnecessary mutex lock/unlock.
  - Disable fan debug mode on ec module removal.
  - Fix issue reported by kernel test robot.
  - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
  - Add board-specific compatible strings as per review comments.
  - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

---
Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 drivers/platform/arm64/Kconfig                     |  12 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 451 +++++++++++++++++++++
 8 files changed, 582 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260309-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


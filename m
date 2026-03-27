Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE43AA51F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606106; cv=none; b=tO0crIdZ2m3+kFgYPKmdQVPisvydx082NPUfQ54y8bw9WGkaPLSjbh0lyrI1amP7+H/wydt/abaRUEhohmKS5i+rB75x8xTmFqnXSSajt7z57P0e1j3vWmnFdrRfmp1O9DU/1oZgVC5clFx1kl1okgUlNbI1IESO82z7HQScm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606106; c=relaxed/simple;
	bh=l81kvx2xsIpII1OMKkF5/DfCd9v1sFUxRUDjSEvps9k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bNP3Ufwyek7xTUDfe7lxbOgba25dVUrphhjObl7lM0mQtQD3TnDFjsDMx+yguhC6uupAWFSlUVZ4JjTKxUlfJW0533ZKdOc9739LCnSSi++Q/Zv5pnKwSRVlh+E7xEJbxigc15KQXHwWjBIujdYuxxIXIN7L+2zHiTQP/2x3RQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga+ZyA4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rd4UEZoQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga+ZyA4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rd4UEZoQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wupe2846248
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dpmas5DQJBR5WrqRAONUF/
	qr6DZXszwMrw4aWKqPa7s=; b=Ga+ZyA4g37stkqqP7h1wilfBezW1uoNYBap9fH
	m8+iklEsXAiZAVwyPFACojRfocPZYbIw9Ug+xXh3Ib6bm+/P80MfJ3Hi1PJWvCSC
	QA3l7AGXws7cOHgx/BQR45GiBEeM55mpXDK8WemEDr/bHcCh86XdVsBMhE6OTYhs
	8+4q407diDUJeUviEw/gGvJj8z8fFdEy3gs48o28xvJIV576oZYyPGH8rdhKhQ+s
	Ct+EjjugvNfKIMPxB3fkE3usfdULo6mQHHQhWWyvId5U8hnJzOVl8W5ab/ndKA1l
	b0scMIgsQ4mLXJm6fEQK8MEn3kHr+/ls1JJ+hPnK8Rvd8k7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmj6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso39021415ad.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606103; x=1775210903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpmas5DQJBR5WrqRAONUF/qr6DZXszwMrw4aWKqPa7s=;
        b=Rd4UEZoQ8xvjLaZPuhDNsPpcZH3IvNEQKsRZjoeqoq2xM4FJkcojyULoK4H6D6u3KZ
         iR39xtSXJQ50fwNanBW2ThYpCAySTVlvjTTSMQX2/xBaeSK3ivwNdUTKYokD4r/qk/vo
         WUTQpFJ/rleQjQtEIWEdytey+KEeZ8UPIaMlcMwq1/E1AnvBOXfPR2ZoK56rUK4RTLc7
         Rj1zqDsh3H8y1vf9eUG6Vkqd+5oeTDfCT3/gRZIu4ORH6b+Tu/8ouBo/SYPdQM1RasNt
         sWdaOyAMkk7+UeqBtlHQAkVXfLV3PMiJd729CTjF8+LNCRLUoC+aLKGHN3XhDByTLprT
         3IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606103; x=1775210903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpmas5DQJBR5WrqRAONUF/qr6DZXszwMrw4aWKqPa7s=;
        b=YE3DwE79jGmj1ZxKKfBJetwQBKIARyFITztcYjSeEerupmp6HdJmmMS0PWkDKjav6P
         PNu6k2IAGZmCINtpE1y+8WrodZKTiVR1HnFKkPVuXeeSHp9ryWQHNdaFmW2HxzX+4Ffl
         vFt1e/RQm1hR+EdWFBeVNQICxLVYbC2vj3nEtq3c7yfHtIQD1BM0W0PDA5Gd8jxx+7Kn
         Evgm7W81P0XuSq9m5iw6Iw1ZEU8W2EwLOtDoXlryRzkPasfDmKUHIm/Vlkx5oXisNdHL
         2T5MpxVermy1l4AwRebfI++uyPKYi8X0XrOJWRORO1gWUUoxOrhDOlM3VlnOz2iMskLA
         DXjg==
X-Forwarded-Encrypted: i=1; AJvYcCW3LM6NTwW4AIaWEp/Ud7tIKNsZ2cGydU3zds2LT5Okg60IDicWUuX27llgbWKyXL9ZwEVCoGHFae4Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxAssENC8JDTMtktqzBQBEixMVsaVQauvBZ78/d7Qi8p8c0OoG7
	auCSmoR2FBUQx58TXAMhAGRzgXm8CgDOmllzBXk35O3G8gSCVAu2P+D/ZrhPYDDpAbFcpHv28FL
	6MIEnFZQU4EHOmKu7oPtxh0Rp0k62kaaZv3coyLOkhROZqtk+wfY5ztwg5GMMkYzi
X-Gm-Gg: ATEYQzwLl7nUaD+fs7/FodHFiCX/vs3NU5d9K1WA4Ud3J+9vmJcVQpuLJpotczD4bB2
	tFnsCX6CKk8Mff3CLgatFOI8+zg8GM1xVx7AcpwW5fQ0YAdvmK4zUk50m+/vCF6iDOZX4jfurHv
	hhCENnEI/6dDrqOUhc2ySaCG9hDlNvwMzHQy9F+QjklrryF1VNKx1vYJNniEPAMkE9/GnAw/Z/R
	RVrJMHe8ZO5xTCu4NErEbCMJlHpfb8YMkfOhM7p+Mq2dps4MJCIrNrI1KoS2aeCNChY07q7Ze40
	/93BOZLS4zrfou4FWfYU4F2xPEp12Bp7yEJBnIp8AKkv3rjI/Fe8rEOrsxMBbY7fz5xu7I91Tqn
	IKKTulRtDlvrsHmIaa/Z8hM9xWnXtis21dAyJs9XWHIgDJpLicAPcJkMqx1lgOqvH0wNSkuVeof
	kjnv1y64ygB4XOmZrDvlZccHN6tnzIPsDNSQ==
X-Received: by 2002:a17:903:b88:b0:2ae:c862:3a2 with SMTP id d9443c01a7336-2b0cdc2cf09mr22436275ad.17.1774606103067;
        Fri, 27 Mar 2026 03:08:23 -0700 (PDT)
X-Received: by 2002:a17:903:b88:b0:2ae:c862:3a2 with SMTP id d9443c01a7336-2b0cdc2cf09mr22435945ad.17.1774606102566;
        Fri, 27 Mar 2026 03:08:22 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:22 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
Date: Fri, 27 Mar 2026 15:38:13 +0530
Message-Id: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA1XxmkC/3XNwQ7CIAyA4VcxnO3CGDDmyfcwHshalERFQYlm2
 bvLFg87zEuTv0m/DixR9JTYbjOwSNknH24l2u2G9Wd7OxF4LM0EF5o3vAOLCBh9pgguRKAeGmd
 la5zQEjtW7u6RnH/P5uFY+uzTM8TP/CLLafvT6gYylytilsChtx1ycqiFtfuQUvV42UsfrteqD
 DbBWS2xdg1SBWoM1rVTQhql/0B6AQm1BukCWUPGGOSd424FGsfxC83/sMxPAQAA
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=4156;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=kzrG5jScFuKEAjirOhtLYwQbujQjCArCRldnkXmV51g=;
 b=78p0DWHobQK49ecBcUd0KY5RKhbkSI0MRzAgL5Nv2eeMvtLS9CVWr+4tGIp3ZlWmxNat+Ny/l
 l4F8AzDaV+NBsHHdDmCbgPgujVQyvQMeJfAv3Pcxj9sPGnuU7DAYMRj
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX+kb8ns9y4/xh
 mGC6D6ggWmepiYIVk3BTW9Ru6H/bkSftVA59tJbPRTWvijpWhnScvAQAPDGHlkTPETfqFYh7oUl
 rAU6cDpYYfhBjdCdYMyaq+DuY+zya0yDTheCkZRVdr2Ss+8e/83QBTBZnRN9Yw9PWqqZTv9Z5Nn
 2acNBV9mrEc0K6r/5wM9RPqbg7qwUbGczFGPaL/o8jufn0BRQhKbxTQ2epWgQqp3cx3ab3GAjyi
 s5kmGBVCrORgdR27XlrkxbDdqKKW03/GWjdY9KjPa0lynSO2EQhbsLFp+YGe8MexPrSjQbc9zHn
 W/bv/9FPpwXV3PVvq840+5C5mYFuDmbRCQkHAs3Hnr6mfyFX6A8WnF5Y0pMHFxCdrktrkZtAjFC
 0roo1qWjvgu9gKXBkAcI60ODfonfZMJqqpsQ2nYFd4Xi8c9xLxn52dIJ1JZiIAU9jCKIWsjYIfd
 zfXXhmU/VFKewpkdUXw==
X-Proofpoint-GUID: FD3U-CyWOuRx0sUiHkJRcGqxZgHUD97u
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c65717 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=c7adFyaawyqDMnDWg5EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FD3U-CyWOuRx0sUiHkJRcGqxZgHUD97u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v7:
  - Fixed alphabetical ordering of MAINTAINERS entry.
  - Link to v6: https://lore.kernel.org/r/20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com

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


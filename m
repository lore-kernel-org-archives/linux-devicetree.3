Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2B33A9FC
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012995; cv=none; b=Hi+JZwt5KZKtWUhl7qQOV7DzZjWgnhDCa3boFTGU9omTzLWIdsUrn6IINMSdqWDm+dvaDKEQtDbqdYrZhWrSXb5kCD6GvrmNfBj9Yt1zztOhphhuxwV12IUbni7uFlU5jm1yYBe4D+H88GS13U3nn76oBp4bWRsauix3+X+5zsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012995; c=relaxed/simple;
	bh=SQVELIkS6Yw3HpdkUdHKEkrxPxte6hDRaNWPxNHtyYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V78ccbeBcVjoc87jAqORwpfLS3OQ6kQB6TbwYZGdRgV4U1rd1dqyltAhXGJtgd1YQ7knlX5PATq4iArPmFfbszvY/nGeob90kYzXWEIOnLYw4KtO4DxfCCsMCKDFkjI/RZXE7aNL7Bnks29GGicOuGkwMFcrJPFonNIhUmxOc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZweog86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpXqr4S9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZweog86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpXqr4S9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3DFU681394
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QYGE1+3lnFBhSDxCjuj8Jz
	Eg+wB7iM4pgaTuFcIUXHo=; b=mZweog86Hk5bnj+K6WHhKGjju5PousPJQZreQu
	1WOaaKiR27HFpXBA/qA27o5OBdg34shk/dxsvWYf+8dU6GrStEJKyrcf/VSlRjaI
	yBi9kxI0b67dWKL5sM+3xPp2g6JZHXjmQaf3xWEmXzNmv4v1t6wfRI/+v74oBWIE
	jfLJPdeYoqCp0NAhw0FH+w7JeXxcuxj80wMQFplIuxfoX0uE5bTLNPkf1WrJWzVm
	9kvKLbFadycssuGi5BaXJVEJgqDx5s2HuO5mC8zpK84UUMtg6oXmja/zlga17PWM
	glqw4U9aZ2XRIbpWmdHyfcXeky4UTSlCLtvwL3Q97Xw+3Ncw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwt71a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:23:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso2752692a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012989; x=1783617789; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYGE1+3lnFBhSDxCjuj8JzEg+wB7iM4pgaTuFcIUXHo=;
        b=LpXqr4S9OWWfM+IiXS1m5wVRll0oDiTTtrV/u5msN5na8JC56fpvXmnt4qEjgna2sg
         y1ocud4YAGqk/ZUNy0eaiMIcgAm/dFh5Vpd7Y+eY2yOidVmWt4E23PgavIgzi8apDveD
         9LbkD9eMqW+zpvm0qSYLy+DndtNmIAKLzEGpSYx3nASQiqgrXq+ty5IJNUQ6qRGCBh/b
         vuqDuF/oEFgGu2lHzcKZ2/E1BUSehHwNUYo7CUKDDgL4QuTp3SAL2ZF9XdSUTXww536r
         IRXsk5Q5LhJRYRCV+QBxKSXJYWbQSXbuYZpQ3qwHK7bIgqHmvStw60xakKrlsOyamic2
         nsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012989; x=1783617789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYGE1+3lnFBhSDxCjuj8JzEg+wB7iM4pgaTuFcIUXHo=;
        b=j03kCSg0YnUZz5LtyNH3S8C8C+vqtYhvGQukVUcj0qgwUvf+q9AehoUf/kFe+fiPfH
         kTj9KLXZM8nj09HP1MXDn6AjInS10eWh5+vHY1CD0VoMTsd3yxHnOlh3uWsoQQ5j33RU
         pz6WPZcGNeQAqOJ7GLAUa9pkEgOk+PT0Im+1H4aD/cUFJT5ey6SyXDLXbM6FE5nMbdhH
         L21W7qGlJdhwtpaMOKjLd7m7Ml6HOX9m7Dhqujzeq8oTtzZG8BkuNNpE/F7jqHHoilie
         bn4I4os+FfldVwfQdqCLLxXzK9Ry/+Di1z2qaDMhwQKkMC5ooKl6IWg9ehLWQWspYClL
         UIsg==
X-Forwarded-Encrypted: i=1; AFNElJ9LFvpeYAoh9O3NcVujlsrGMidkMsbzXkBGgPRQ3qM7aguqFrrz6glfq+Ry8K69x3tpwH7btgSuymgi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0x287JBwz4oQwfho+KZ2FnoKl0Gh2Zo7aHpgebMOLZ9yLSVUX
	2nI62z1d9LQYzdTkqTYaLeKSWmtfYDbfGldcsyVRio8iZDsn1mgAYQUytPVdYyRIZLeTNDlDVR7
	/s36aJRDB5Cohn8+R8vzEqrpaLlLljBkS/v6IUvNb/hbH1/0MqGhwXdVkVO+x5Czq
X-Gm-Gg: AfdE7cmSDrxS2PcducyBVG86XM/DmV1XhFminL1ED30Av9bjZl544D3aLDi5xwKm3oF
	N8G+ouUD5ehdKk/Ktq/ru4V5UqadzUPbHjBS7vNlN/18kMW7f2WtPo0ibP1oW9XzC07BLTDQ/mG
	sqXAPfRG3bEKKa/R1Z524dvdH7AAx5HMVEzUj6q+sTOd/c1V90dC9IJBbNXDx+Oy3Mkv7vW9V9A
	cz+5CC6bnkS55QcQ29AqFiq0LVptnI3uNkJqoV4l3KEZiTgcg6snqu6JFZ+31bL2/ID3jihuy8/
	2CxAggn3/QOazr2RnkipXTGxIgnWfbAkrD1f2fwkoKOHUQV1lctmHOaTELLB7IDeRs3ehrnzuvo
	xwri8SgMmTCEjD4DxDVF6wQZlBaa1gMe1EBUm6DbOaki3+A==
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr9157697637.19.1783012989474;
        Thu, 02 Jul 2026 10:23:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr9157650637.19.1783012988774;
        Thu, 02 Jul 2026 10:23:08 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:08 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add Qualcomm SPEL powercap driver
Date: Thu, 02 Jul 2026 22:52:53 +0530
Message-Id: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG2eRmoC/33OTQqDMBAF4KtI1o3kp2rsqvcoRawZa0CNJhpax
 Lt3tItuipuBN/C+mYV4cAY8uUQLcRCMN7bHIE8RqZqyfwI1GjMRTKQsY4KOle0KP0BbaGcCuGI
 e/OSg7GjOci2zSmkFimB/cFCb127f7pgb4yfr3vupwLftV014fqAGThnNEpmkmj+yOj9frffxO
 JctVroYB9nwIH5gKtgRKBAsJUCq8Fuu6j/guq4ffvyX8RoBAAA=
X-Change-ID: 20260702-qcom_spel_driver_upstream-909d37c8d8e8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=3809;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=SQVELIkS6Yw3HpdkUdHKEkrxPxte6hDRaNWPxNHtyYs=;
 b=PIjNMLYQ7O2dYZ56VLmjm9CtsrsqOXdg82ZMGQVPKWDEgjirbY9X/L69V1Px2Ssao2hxENwhx
 acrfzqMv9gqAS17eoyUjTF+RHPsUFummveZBRGc7Mos9hv4sqmYWGbo
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: JT8BuHNOvcEjlol8gH50dJEAz1F2tmpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfXwhH0VddgazJ0
 tmgvtTrUtGNQ7tGAZrq24zUxOrjdHqskWxFhbQJ9zHxGdE73TAJXVC41QiMtHTxjglto7hFIWPC
 lRnMSm9MPzQMq1nOCXjRMlWkHwMV2LOPjDk9V6EnEYapa1gk+4efbziiZ9h7x1AYjbcr53dzzes
 /bbVN3i4atdFW2qTI2lBvPKHjTtwR/Yju5uIpvLSMjH4A+6Ux6YJMkrn+7NBd+iQHDDYZs8wLjS
 ls3TXhaYJSVEbaxdvTIF5ZRCymD4iPiTVCjvPvHDTT1dlvE+xrd020N+MWYicNRt6N2L2TNiBUW
 PE0GlkStgGfJUi4A/eDSBB4lAHgDPzqXnqxCxuhm43vaHjMQbsqYkBPkdx8Ihab2V5Qnl4Q/li3
 4IjtXaew91Z0f+Kv+rzC8kxBXjvT0qsBguZmnRoykxNzDwwPFc6pD2iNGofRMpmPk+Cv+rwioAP
 Jg1cINVq1CwVCpRPcSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX3XzTKRU8wMO7
 mtvmeC9cPomjQ2pdwpcWIJ08K40m1LTuOmVtJABwxFe6T6pUimdSJ4z7xaBSESuVku9cYFJJVGy
 LEpTp1/WWCmT5OxVJLsjvsoR1gGYXwA=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a469e7e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1rr6DjYnXoqnmp2ReCQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: JT8BuHNOvcEjlol8gH50dJEAz1F2tmpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020183

This patch series introduces support for Qualcomm's SPEL (SoC Power
and Electrical Limits) hardware, which provides power monitoring and
limiting capabilities for various power domains in Qualcomm SoCs.

The SPEL hardware enables:
- Real-time energy consumption monitoring across multiple power domains
- Hardware-enforced power limits with configurable time windows
- Support for up to 4 power limits (PL1-PL4) per domain
- Hierarchical power domain organization (SYS -> SOC -> subsystems)

The driver integrates with the Linux powercap framework, exposing SPEL
capabilities through standard sysfs interfaces. This allows userspace
applications and thermal management daemons to monitor energy consumption
and configure power limits for optimal power/performance balance.

This series introduces a new power/limits directory for power limit
controller bindings. The power-limit-controller.yaml schema is added to
MAINTAINERS under "QUALCOMM SPEL POWERCAP DRIVER" in patch 2/X alongside
the SPEL device specific binding, as this is its primary use case.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v3:
- Created common power-limit-controller schema under power/limits and described
  power-limit-controller device common capabilities.(Krzysztof)
- Created SoC-specific qcom,glymur-spel.yaml file instead of generic one and updated
  description and commit.(Krzysztof)
- Used FIELD_MODIFY() macro at different places.(Konrad)
- Updated glymur specific domain info table.(Konrad)
- Updated all for-loops iterator declaration to C99 style.(Konrad)
- Fixed use-after-free bugs.(Sashiko)
- Corrected time_unit documention to reflect the logic.(Sashiko)
- Link to v2: https://lore.kernel.org/r/20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com

Changes in v2:
- Fixed DT issues: corrected unit-address mismatch and made compatible
  platform-specific.(Konrad/Krzysztof)
- Cleaned up bitfield handling: switched to GENMASK, FIELD_* macros.(Konrad)
- Converted hex values to lowercase and simplified array definitions.(Konrad)
- used devm_platform_ioremap_resource_byname().(Konrad)
- Refactored data structures: merged domain data into spel_domain_info
  and removed hardcoded limits using ARRAY_SIZE().(Daniel)
- Added bounds checks (TIME_WINDOW_MAX) and fixed time window RMW
  handling (preserving reserved bits + firmware notify).(Sashiko)
- Resolved use-after-free, replaced allocation strategy, and
  added proper cleanup in .release().(Sashiko)
- Updated time window calculation logic.
- Removed cyclic dependency, improved validation logic, and aligned
  naming consistency.(Daniel)
- Link to v1: https://lore.kernel.org/r/20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (4):
      dt-bindings: power: Add common power limit controller schema
      dt-bindings: power: limits: Describe Qualcomm SPEL hardware
      powercap: qcom: Add SPEL powercap driver
      arm64: dts: qcom: glymur: Enable SPEL powercap driver

 .../power/limits/power-limit-controller.yaml       |  34 +
 .../bindings/power/limits/qcom,glymur-spel.yaml    |  61 ++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
 drivers/powercap/Kconfig                           |  13 +
 drivers/powercap/Makefile                          |   1 +
 drivers/powercap/qcom_spel.c                       | 803 +++++++++++++++++++++
 7 files changed, 930 insertions(+)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260702-qcom_spel_driver_upstream-909d37c8d8e8

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>


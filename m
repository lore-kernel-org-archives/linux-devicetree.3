Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF742315E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600577; cv=none; b=lM1SsWXZ3iaa8XG+21h9TDxMKF558N64s/uhLBcVpLO57HzFNfSAx5cnW8n12HfvFX/sQuQU2m95jgX4Ne4Rb3BzEWDE6Fs3GSSlrjI1k3X4KM1wetRC3sS+aNBKw40OHqFmlO4ojoYxMVR1J9PSL9FymcI8UmKXcuY31qhEXJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600577; c=relaxed/simple;
	bh=Y5DA4qqP2fOD2E4DiZzr8zT+Ntda5O2gKHByvz8A65A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CaE8h2nGSL1l9ZVvE2KVSlOS//b06seJa6DjB3P346u7Wc2lk2WFfK0wXkRW7UpCq5RARTZZJRzHJteNvgMbFFLZgsU7OITUE26dDKtSIwcwAZwQ7qQm3z8g/KRSwsaa+zQJ3/yTog6twL1CvHO6t5zoTPrtJViieBqTBkd8Ogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXzdMA7e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGqDtTvF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXzdMA7e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGqDtTvF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BMtYu1524859
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OIs6Whg6om9vQwOIg1VwBV
	P3+0oYlhiCcNSXcbqDn/I=; b=ZXzdMA7eC8TtHCG0pUfB9TPwT7Yujv5FICNzNV
	j+IrwHpEjmFFwFzZba5I3gayYpU8IotaWtPlWJukmoc3bvBGNTHytAQPU8FG5NEk
	K//a0Zy1q2ojPuYg4pWBtA7kbUntyKradGli1obMku4HhXkBp8E9QNPlKdC5JPHm
	fyYjNLl3pRMQZlb3ccOgRCubaDq6ucnD7S8uS2nGSPjSLjQfnd/Vw86HfKEFteh8
	7ZYO4i34sEcawCqV84j5nlaw+qfs4jbTVZ6pM1v+9y5bnngrHEIPeShs5TW0j3tk
	Hm2tXBsY/VI2/tEdToXdyo/2bAybHKWLQJKE9BPtTWxzcLqg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u3v9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:36:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b719so1972803a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600574; x=1784205374; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OIs6Whg6om9vQwOIg1VwBVP3+0oYlhiCcNSXcbqDn/I=;
        b=gGqDtTvFFJjwZyshiStjkIBNcT3FceyCiGXru8tIccmnY39A+SmnBzldZRucj3wGK6
         TCYi1MZUymKox7bAnE15TJo0qJMX8kyf4SvsrgW7BsSlya9RyuRGOcYl8iPC0gg+HZF2
         BrQiizes1/JHMTTIGsM5/h8S8OBTK7CsC5bNY9O1YsRznpNKmBu1vAsvROmvk0OsU8yP
         ILKImtiXBg9mE2gegWp7rGYsHv6H8oHJ/hRwC9XEDyagT4390I6PP/I/WvlLUInRVrwT
         uGgVIZRq8w+Oy7HuJqqdcYUKWecc8VyhqgoGkL1NjGNCOlxm35p8zu8wAzphG8C6rbry
         xBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600574; x=1784205374;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OIs6Whg6om9vQwOIg1VwBVP3+0oYlhiCcNSXcbqDn/I=;
        b=cjEEeRs/0XlL3nEDjE0AGfGm/itjYTeoQCqFmzTiR9ZSM8DJuvmCvjl5WqJqH22tcE
         +24rWmxMGT9+ym7O6JoUd1exnVVcvCCk/h5/MUtdVCa0oS149zHEjGnc/S9pQk5mbtmS
         amgDsoATVGUgeRW3IjzCdpvO5Hc3VnHv5F1agJX2J2YBj7VsIioDZWDtJI0lnZWmY7EZ
         vFrbkI/mP+uqSUalKHKe1T9yqzIJa+Fi4hfQeUn4YDY+CwcV/GyqYffrpJdj1SLZhV6z
         8+TIi1VMYezjdZhQt6MlKIaRjGNQLU6mS5msiGvkG4ShgIHHuN+/BWttQo3gNQ0l3cSM
         e20Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqeuiz7jaSNkfffXVQ3DdDzUC+PYGYLqAa7HsJeQbt45Q1Vin0Pvopz5mVcmDfyM/l0JOI7+k64fXl4@vger.kernel.org
X-Gm-Message-State: AOJu0YwuEG6iRZYdoah35HkWcQ5T3xBcGf/MXZXH9RAmgG/nXwxEn+t8
	3ooPk8BHak1YWsbcqAzmHuKOFxRLkyTqLR1Oc3/05rDeniNfWhQtLbyqlYVrQ9a0UK9PnpzzRca
	odXcEql1l43uvi/7FpV92yEbMdWdBwarbSnQX9B0cDpUyGGfKyFu5MlwHCKODVmMM
X-Gm-Gg: AfdE7clC4xIOyTGrluAgB1MkK13yGFR6PR6xOFCvwaOu7+u6e77XLCBt2tgopv7U3Ic
	UR4DFXpqWwe+x7aISBMVB5CtIGnP11l8WxczvxgkvS8tk/KU5C9n0hSRSrUhFzQo4gJ6lBr5mO+
	6vC4RAzPxbQ4bYUZQYUImdU5IgonccOElR+CXIufEu6L4LoZ91sAFf+NHcrrMvRTN3CVkjzGef1
	PZ06I1n3/SGlwrTKKOxhTEZJ5+TkYU1oTmJzpnMeLeLOzndN0ODs3E/XwbIseiQceEkYfNfwoWO
	0UHEYp73CKtbM1QaH5LzmGdy3+ZnXxrGmpIp9vmBeT5rIoUZtFP2za5DZGFKF7dYQu8sy62jH6y
	4ZIzfTf2q1lMClsdFL/ESpE1IV6x8dJLlvBKiJRy6Wm9O8A==
X-Received: by 2002:a05:6a21:6e86:b0:3b5:a008:683c with SMTP id adf61e73a8af0-3c0bcb803c7mr8649611637.45.1783600574434;
        Thu, 09 Jul 2026 05:36:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e86:b0:3b5:a008:683c with SMTP id adf61e73a8af0-3c0bcb803c7mr8649571637.45.1783600573963;
        Thu, 09 Jul 2026 05:36:13 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:13 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
Date: Thu, 09 Jul 2026 18:05:46 +0530
Message-Id: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKVT2oC/x2MUQqAIBAFrxL7naCBRl0lIsRWW0gNJQmiu2f9D
 AzMezdkTIQZxuaGhIUyxVBFtA2YTQeHjNbq0PFO8Z4LVo5zoej9x6KX2qw7BcekVDioQQsrDNT
 1kdDS9T9P8/O80PEcXGkAAAA=
X-Change-ID: 20260701-vpu_iommu_iova_handling-556e969a1f1c
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=4743;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Y5DA4qqP2fOD2E4DiZzr8zT+Ntda5O2gKHByvz8A65A=;
 b=H6FNlkAWahIPpUBKk41TWD2ZS4CW7Q8nvkydVtYDADFKk2qsrBd5tgCLzOvkJVmHboDuTNOZ8
 WiiyLiBe78bDGuZgV5+t8UtRSHJxEVxAFAkeEFWTrbGD9/MLC4OK02B
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX1VEoGVZ5su+r
 LmWKRS6k+7k+DO/H9COOrNRqfD4uh8oJaa3ZM/VWTMZtYklhfZ85qgcConOI5Kuj3Bq6gCRqzwH
 Z3Hr+fPob2dah54bWqr7fA59RxndyN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXx34wEm6Fjf8H
 avpe3FxCU4e7OUjF8Hj7s2+InaACSYWqCy5HCo8nz4duVaqLFzA97oHZN0MptBf0/qCCRknnTiR
 tgN+7KFldfGqIs19hLQjh0kBWziMNvIMg9klEBi7kFYLSnIzgm6o4s9yuSVezvHk7TTPlHnpk7s
 PPqHnns7Sbs+l2NZtiJD6wkIJ6zi7255qhEv9YijJqV+xQHhgzV8Oice6yJWupaFsBGBn5gvzpn
 +ogvaGvXjkEhuZjtGNhOUjszh7R3fxU51g4un3BjNhOfVpDT+nzCkOagWviFPX3EIBriPKA4xlS
 k9VSFKFTXLQ/4w6xEyWKKHBzCOB5D1BQLhW16fTtUrACJGvmyoOPeQUHDLlo/rn4olQtXPBU4Un
 sVj8Fb06rG+GGS3NULvcdvKAEQC2dCltgFFylWz8uhvKuqiubJkdrA/RlKoIlXNn0DS8uyuztkr
 dhA2Envm1t/NlANL4JQ==
X-Proofpoint-GUID: -6nelpmnC_oKAJMM3MCG6hL9SJkQulVy
X-Proofpoint-ORIG-GUID: -6nelpmnC_oKAJMM3MCG6hL9SJkQulVy
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f95bf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VW462GhbP5AVb73S8BsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

VPU hardwares have a limitation where VPU streams are associated with
dedicated addressable address range, as illustrated below

    +-----------------------------------------------------------+
    | Stream A reserved region (600 MB)                         |
    | 0x00000000 - 0x25800000                                   |
    +-----------------------------------------------------------+
    | Stream B reserved region (3.5 GB)                         |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | Other reserved regions                                    |
    +-----------------------------------------------------------+

Mapping a stream outside its expected range can cause unintended 
behavior, including device crashes, as reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Daniel, who reported the crash issue, have also raised a patch to workaround
the issue. While the patch partially handles the limitation, it is inefficient
in a way that it keep iris hardwares away from using the 600MB address space
for all the different streams.

To address this limitation, the subset of stream/s are now represented as
sub nodes, so that they can be associated to the respective addressable
range.
In the past, this limitation was tried with iommu-map approach, with iris
driver dynamically creating the devices. The approach was later concluded
as an hack to avoid having sub nodes. It was discussed in detail in the
discussion https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

It was agreed by maintainers to proceed with sub node approach to address
the VPU hardware limitation.

Sending this series as an RFC as i am unsure on handling of address 
and size cells. While parsing the iommu-addresses, device parent should 
have the address and size cell, thereby added the same in parent node 
i.e iris in this case. Kernel mandates this, otherwise emits below. 
Keeping them in iris (parent device) meets the kernel ask.

[    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
[    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4

[    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
[    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Vikash Garodia (11):
      dt-bindings: media: qcom,sm8550-iris: Add vpu sub nodes
      media: iris: Add hooks to initialize and tear down context banks
      media: iris: Add helper to create a context bank device
      media: iris: Add helper to select relevant context bank device
      media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
      media: iris: Add hooks for pixel and non-pixel context banks
      arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub nodes
      arm64: dts: qcom: sm8550: Move Iris IOMMUs to child nodes
      arm64: dts: qcom: lemans: Move Iris IOMMUs to child nodes
      arm64: dts: qcom: monaco: Move Iris IOMMUs to child nodes
      arm64: dts: qcom: sm8650: Move Iris IOMMUs to child nodes

 .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 18 +++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 18 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 18 +++++-
 arch/arm64/boot/dts/qcom/qcs8550.dtsi              |  4 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 18 +++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 19 +++++-
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |  8 +--
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 16 ++---
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++
 .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 32 ++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  | 64 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  4 +-
 19 files changed, 346 insertions(+), 51 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260701-vpu_iommu_iova_handling-556e969a1f1c

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


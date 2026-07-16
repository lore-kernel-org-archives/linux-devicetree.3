Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A2414A08
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201482; cv=none; b=a1y9UbTgmJuUuubKzmduvy53GUK0Xr9LCLHPi794PrUrEE7jBiUv1EPy8IIgOv6lUZRR35nR+5PawJIWYBVoyXfZQDliXG0Nyf96wBmN0Wkem4NdzJV5T1bNwczRdBURJ6JBl2ira7OaYm102uL6O6DXV8cM1MNOA9NrvCrMal4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201482; c=relaxed/simple;
	bh=f+MRkQjIE8wIzgb2YmCWKxb0wl/AS2Te+B848FIImrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uJcHy2RVtviLRknZKLVeWjClowBB5GTVGhiVmmJeSKgO3kQ24zfynkcKikH8/Zi0SRcZUwBdl01CU4cRpLlraxyRVhRZFkgJk3kBhe21ywm9VmwE6SMRYNEJ2flNsB5bDq8x16ZkhEMOzD615NP4cFY9P9dVtSX3iMAY67Wds68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/bnXPlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QCEviPAW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/bnXPlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QCEviPAW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9ra5w2361708
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/csOB3IHDeDXkiTczOZcj6
	MDYX9BkplsXgPZmPpF1VQ=; b=Q/bnXPlM52BNyrKjh/pbgi7GiaeVviqx0TBEzT
	TUp1fDIg7ZfPRr/UAm4QUtfZxfScsES5BERKiEmRcR2AR+PqBtFFvYdH2HJ7gHGG
	mLVRUeY3FYNGfesL7WsvaaEZScbZYgkuBV6ERrlEoPXw2/XQhzUGC6Y4S5NyaIzn
	eQt7geZwHjTZ9fn01XCU5wbJ7o2uxGAgK1WXKuc7fZtmw8JD+HzYcpGPXXcuBR2/
	5UWN3A99EZR0todHXcUvq6fcFicc4Fj1HMDvcNlHgQHONaUg3/kLtIXgpXBsnVcE
	D1c/uFmesR6WwiIOrxgpTU84MHV8A7Cy1dACDQ2kdEMXyqXg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqkk9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:31:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso6906846a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784201479; x=1784806279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/csOB3IHDeDXkiTczOZcj6MDYX9BkplsXgPZmPpF1VQ=;
        b=QCEviPAWFEYi4UJS8B7nxl772PsLFLWDThJFh+7C0HNf6MoK5DxfyxTD6Fpm8w/CTj
         kohvsaOBcdQxbZG6bOwgd0kghnG77Dp5Hx+EEP1d14omzUVRsM3hOxhDBJDEI5qpyFRq
         LUaZYhXQTRW+9z2tBfQgfh/GjREh9w5qdvN3tKffmA+qSqDN+wSnbWV9wj3CgQ5Ap+hG
         0B9hFpQD/dtmNM35IRgGmSW34lic5dgZc13njAv9nI6Wl3GB5vZlEH5r/xhxswVUj9GW
         VmA7VMiGst5xd/j6qAqH0RqNivb7jr98uDHcLFs9fZqJC4X0ksOsYhUcO1KhaR5hlVpo
         VurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201479; x=1784806279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/csOB3IHDeDXkiTczOZcj6MDYX9BkplsXgPZmPpF1VQ=;
        b=XsoUrpdMnJDqLm75re9L9sRKpUETQivliTaY2nmRRke2QB0w0FP7DOne5zouWIiUYx
         FlTiLI0zFJfQ57g73HAc3Ne6TEDKpj5GmMZekxh9kV/pK+OljuWtYtNPxyUSWPM9+iNo
         xn+05aazIIkAX/7mMpmmgjrUWex82ALWdRPg8z26YPn+/zQ5iJN4Soki2vkhqqXwEPxT
         fXcN+Yh3EeiM6C//wadbcIM7QcfF3rRRD75FCMRXcqeyhoAQx7cH6JIh8hA3OvOuYcDJ
         Rvh+OdpTdvUIJcy7M7MmMa2pKO5tA2MyXvRemiFK+zLL5ChvtabpJREDYU/JNwMgp0+M
         6MKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyrTiSB00EQrnDagI3kkLpZWj1aosLjxuksdIMVyzQ1aJzOc9IfvvqdxDJ5ZzQOh0S7k+EPyVlT66/@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQaPfqRld3qNwTwZ96Cj2q82XHGiMs3vFgSBDYC80bK3QfErG
	bvFGPpf4Hu5L5RSNLRxFnJ8kndYRZVfwAFeZo89Mn0IEeI4cI3/d86Dm+XSsqWDYn3UofGEtrj+
	t+q6FBUxk5AZeADFS0mi9oEqGB7oRA0KNGnbf/yZG+CUYDo0tzV/E7Y1yQ29bXomC
X-Gm-Gg: AfdE7cnU8l3z3npToypppdZWIWzhhfkdZ2z0Rr6soZ1QOd01eNeKaD23G0+e4Z1v7bq
	O2yg+roRJ1PMaE5Ce0juGIe3pjHaWFC3QVmJyhGZxTcSGMt4xnd+rbMTvfXRv9my7A9NgVZT60F
	+JcV1lnbCshyHRPW1Z/unncyT+gn/rN9GUhjwEOrsHlpMTWh3CTkVe20i+tVXbBFyw615xoa9C0
	3rrdyGBeMV1UczX5ptLvkAEjZt+wZe+31M0o4qb2YQXBlaebc2YFe6f6Tp21mqghATNyGFz2/b1
	RsEuoAX4B8vP0rXm/Yh4QIKpsP7ege52LWI0mOcY3+5w/ptafCiuYjlwxmP9G9UbZz6/Hzn99wn
	f3s11/HnT7roaLa6vEluX/SedXw==
X-Received: by 2002:a17:90b:3905:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38e2a0b5d8amr7226925a91.43.1784201478807;
        Thu, 16 Jul 2026 04:31:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3905:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38e2a0b5d8amr7226837a91.43.1784201477875;
        Thu, 16 Jul 2026 04:31:17 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm9720262eec.31.2026.07.16.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:31:17 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v7 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Thu, 16 Jul 2026 17:01:08 +0530
Message-Id: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzAWGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3ZwSSzNDw2TdMnPdtDRzsySjFMOkNNM0JaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAK4l2WpuAAAA
X-Change-ID: 20260708-lt9611c-v7-ff76b2d1bf5f
To: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58c107 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=uFMGIqzs9byGSK33UbsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfX0VJjaKmnPbrE
 hEETPG1Bw/NPAPIHeu/oHhsPLCbgx7qJe+myGdKHMfZK5FDi6z46Mp/GSMDw5tcvos5xO/KbBcy
 fq+9F2Qz1mQzcOXw7h23s0vbX9HY6tA=
X-Proofpoint-ORIG-GUID: ZOFdDi4WWhU38k2bmXB9C_q2LJGCTQhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfX6HOLrZfa3WTl
 JdaQZgGhTuSHy/Bm9OO+RJLgSzUIlU9KSEUnI36P6M5PJGma6tdpVUp1JnyLEb876fnk4jtvR4m
 75dM38PE984PBcIEH+JGGjKdPX94E3i2MXjYpZZr/F7o62BEv3zRNvVyTcyt9KDfm9LrxVGUyCK
 YRZkeLSEsOvyaMYT5QSVU5yLXLza1hCtoL+ZB95HiQpVBEYQbV4UKFBetaQA55VGrHY0K0Stzci
 6u3vhcP7PDP6epbN7V3+84zWShqf/wb+gfVzNTLhYosri1DLbzaadB+lVIFhDpgsdoo1GzjTgtR
 MII1qj6GVwJTCkWv58sY4JYicVrRUOsCPze4OG05v113j0LGpMrmHW4k0yNWWx+8EYYUv4hbi2K
 pV7loiggQz8hfMEPe6j4cngILmo4w3pUzfevn8jLhEAVM9t6S5gfYkHK19pxaFJ8qblH+rXhGJz
 ypeldj7+Sw3jFmzc7Fg==
X-Proofpoint-GUID: ZOFdDi4WWhU38k2bmXB9C_q2LJGCTQhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160118

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

  Changes in v7:
  - Use i2c_get_match_data() for chip type initialization
  - Implement hdmi_write_hdmi_infoframe/hdmi_clear_hdmi_infoframe
  - Use drm_atomic_commit in bridge callbacks
  - Removing redundant lt9611c_reset() call and cleanup in probe error
    path
  - Populate bridge.vendor and bridge.product
  - implement hpd_enable callback
  - fix DT parsing and bridge refcount
  - Removed pre_enable and post_disable callbacks, it was affecting hpd
    as regulator was disabled
  - Changed reset gpio enablement and lt9611c_reset api.
  - Link to v6: https://lore.kernel.org/all/20260508134009.4582-1-syyang@lontium.com/

  Changes in v6:
  - dt-binding:
   1. sorted the compatible list alphabetically.                     [Dmitry]
  - Link to v5: https://lore.kernel.org/lkml/20260507024214.97708-1-syyang@lontium.com/

  Changes in v5:
  - drm/bridge:
   1. use #define FW_FILE "Lontium/lt9611c_fw.bin" to match linux-firmware    [Dmitry]
   2. add atomic state management
  - Link to v4: https://lore.kernel.org/lkml/20260506095100.78998-1-syyang@lontium.com/

  Changes in v4:
  - dt-binding:
   1. fix commit message                                                    [Krzysztof]
  - drm/bridge:
   1. use lt9611c_fw.bin                                                     [Dmitry]
   3. use enum lt9611_chip_type
   4. remove *fw from the lt9611c struct
   5. use read_poll_timeout and -ETIMEDOUT
   6. replace mutex_lock with guard(mutex) in some places
   7. switch to ARRAY_SIZE instead of specifying lengths directly
   8. use dev_err_probe
   9. add clear functions for AVI and audio infoframes
   10. add DRM_BRIDGE_OP_HDMI and remove .hpd_notify
   11. replace "GPL v2" with "GPL"
  - Link to v3: https://lore.kernel.org/lkml/20260420061644.1251070-1-syyang@lontium.com/

  Changes in v3:
  - dt-binding:
   1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
  - drm/bridge:
   1. Drop the licence text, only use SPDX header
   2. Sort the headers
   3. Use library functions for crc8
   4. Use paged writes as implemented for LT9611C(EX/UXD)
   5. Use HDMI audio helpers
   6. Replace devm_kzalloc with devm_drm_bridge_alloc
   7. Remove extra kthread
  - Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/

  Changes in v2:
   1. Forget modify code, operation error, Please disregard this submit.

  Changes in v1:
  - dt-binding:
   1. Submit the first version of the code.
  - drm/bridge:
   1. Submit the first version of the code.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
Sunyun Yang (2):
      dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
      drm/bridge: Add Lontium LT9609C(EX/UXD) MIPI DSI to HDMI driver

 .../bindings/display/bridge/lontium,lt9611.yaml    |    8 +-
 MAINTAINERS                                        |    7 +
 drivers/gpu/drm/bridge/Kconfig                     |   18 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1293 ++++++++++++++++++++
 5 files changed, 1325 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mdsor@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4824A35
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847234; cv=none; b=n8wnESRqzeYiYydovg8wnB8lyJLvraTehuTGYCwPzi/uYSmEBHTi6a+vE8qgoQWAHVvuULDXNLQUXyi9/HVXV0sebiPeBRXmxQE6ucbXUcrS4J/IzWha7Ws0xlnL/hV5U3OMPoMMHG5oElK1mB69MCBTkboiq6+kzwa6WprWUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847234; c=relaxed/simple;
	bh=IMdQuQrdVdyi1mS+lgP2ZHUIpdr7RmjtISxFlMN9qjk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ffhCk6W/UeyRS5Hq8WxTqQx7z843/AYlAoltR1FQ3hIbYf1uuQYk32xkiDLbA/jwoKgER1YMSH4glBfXtVKb/OAfRW8W93gdO5a8Ec5pCzmXj2OURLnOvX86vjM71ubVDrsu0bViEQrvqSIPkCjrzXU54bOn+0v4HnPJLy589aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZkaPIum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax4b9OVr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZkaPIum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax4b9OVr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXLDV3829947
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QgwILuoTnuZi4CibSzN4AE
	YxtmfoZ0O9WdoWHDZh/bw=; b=bZkaPIumObOSDicLnZy6lX/UopjP9h2tNh/gb5
	f5ydcTbwbvVp/F0ky0F6PpZaPuafbgRkT0Jcabi3/rGAgiQEZ1F5T+ENT32KL1WG
	EZrHnZbBqrZUfH4wxcHp8f8QsI0mc8u4OLmHWoXuDIPZ1pXMH415aFAfhQAjSXJv
	H1eDosmeLWA/CptvJDRxRqtasWeO3hbq9bkMiL13Fc80UphB5i9TFdQITcdX+rPF
	/qa8BEVnKrVPygqOfWi60lx+v1pLbrKzng8mMPgbJ0dF8VGaySFg7Rbf3QORX+r9
	fvgSpfTO86HyCrhwryTJ/N5yXv9d2382j76MW8IRLHBhl1uQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sc6s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:40:31 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a485034d01so6423821b6e.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785847231; x=1786452031; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QgwILuoTnuZi4CibSzN4AEYxtmfoZ0O9WdoWHDZh/bw=;
        b=Ax4b9OVrvhV26eCq0sSYpR53bmOAce1DKI3LG6QgvTR1lr8LLhPpAHjynsCaVGuzrB
         XbnuS64RPs36B6YH/mCDZvmQS0ikac0yHFBv2ilRrmnGu4AqC8YTZ0dygmsK2+maWFpm
         L3oockVvOaVElAvuAllEjArePnbOCCG9JR9o3/ATVR5TtC+wx7niz25lX9s//eT7JEqZ
         eK48j6TMfP0Jt7Q7vXt4LsSo20u3xIkcStMic4ibeTPjyannDLxEdl+JRucY2VeR3DNP
         rfVqp0/xC8d0fv3Ec1EB//Xp5NooXxkSYDqDaVsn5in/b3P5TB2+X2b4bNvTV53k4AWU
         WFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785847231; x=1786452031;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QgwILuoTnuZi4CibSzN4AEYxtmfoZ0O9WdoWHDZh/bw=;
        b=dXEklowOLWqWdzUHjT/lk0dQSQJCt1EziJgirisGT9IugIvUNQtNTPGfvmsnZTJELQ
         3UHOlTIDzOm7vcuwUT/4nVEsfrPdZ6VJAa8dwOEvDHRqwYjZW8RsQupHLSTGq6kK5koH
         0GVVk7LmKBBajzJfdags9eqZ8e/nbxql9TEPtWjT0A4YsB4efoNhx0CeeipmOyFAoqgO
         Y2wp0fWE3UZgsTTnrWcilDvgu6F6P9CzlPtWzCkFqRaMiyxOL25BIIOjlWCG77/ubfGB
         e8eRh2FLLI2jCFetgVQQv+hrpeXNoV2kmZE1r/HqyGeyirw6mWoh+TYdoo6n+vmCOFic
         bT/g==
X-Forwarded-Encrypted: i=1; AHgh+RqWzUIQFZhLR0FsEo8rqLN/+WHHK/i4M6iBOkUDrV2vCKP73wUns+o9FdQp36M5eV4fF9+aCRDdtKvG@vger.kernel.org
X-Gm-Message-State: AOJu0YzDOu9/t23GKbeFkUoTargE3n1jV5W1m8nelrWGUitqHt9vT/1B
	4YHC3L1RB6+JRGw7Ge7GH7E2baTP00EvqITnCQXDRkG8oZuYeiNcFbrlMF199eIP7nDQnf6dElH
	isWuWkKssJ8/RHeEc4OXq05Bzin9D26tNd6DXYDYT380E3oqcfKUlw9adJmpl9zFY
X-Gm-Gg: AR+sD12UwHHnDMEjZHvECP55n/P/JSx5KLMNVCMgYudckJ2uZELUifYOspQECsVC4uw
	ChPRpYMBVPcMc0qV6g+m1ZVxcS/Mo1dNPpga1+KF1BY26oBxNkgNFWkRpsoWKarRxWRGM1rNB0y
	AYqsMStdvd6W8svJZoVK98wUWbUebdmqXzHps171vUwhf4R06/ykg42Dpxr41MhOkgYN8g1Qxyc
	NKrkw/wo8PPJAZHcN7x5yPJVmR5IiEUiHn4PDW0C9+vbVvxnFlWVYs3HZddqVye053iZRYiEcwu
	UuPoH6uBw0Sh4i7ToPjHgXjcVCo6r4LqqFevhfoHMNudM0jZK23YOtjdoWM9wltjNRvr+iMTc/s
	LbNn8xlPYmQT609SGsphoyXaPSQ==
X-Received: by 2002:a05:6808:4fe8:b0:4a4:adaf:5570 with SMTP id 5614622812f47-4af5dfb3ddcmr22809559b6e.4.1785847231064;
        Tue, 04 Aug 2026 05:40:31 -0700 (PDT)
X-Received: by 2002:a05:6808:4fe8:b0:4a4:adaf:5570 with SMTP id 5614622812f47-4af5dfb3ddcmr22809518b6e.4.1785847230502;
        Tue, 04 Aug 2026 05:40:30 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58f7238bsm8204962b6e.18.2026.08.04.05.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:40:29 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v9 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Tue, 04 Aug 2026 18:10:13 +0530
Message-Id: <20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK3dcWoC/23OUQvCIBAH8K8SPudQl7r11PeIHtRpM7ZZukkx9
 t3T1cOC4Dj4w93vbgZBe6sDOO5m4HW0wbohhXq/A6oVw1VD26QMCCIMcVTBbqwZxgpGDo3hTJI
 GS0MNSAt3r419rtj58slhkjetxizkidaG0fnXei3yPPeFMdvCqRDklJYCH3hJjTq5EIrHJDrl+
 r5IDWQ/VhuB/LwWqyTIRhDMpBGm5H+EZVneuEHOov8AAAA=
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
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71ddbf cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=kbNwjhMloW2tGLXrOAkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: aNa62Kb0aJPvTHCxT-OqPe1ATmGTVrHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfXww5xcbhuCblv
 bENVB73VW8v3qHfOb3/oM5gQuq+FHElPg9gcGXvC6n/ZzP2aMeetB7oDq9QNDouXttkGZXEXLJh
 pOR39VZNgBzg+nPThYXN/HYv/Y6LLyy5TsxfEk8/R9inpEMBwKwPsA5ibDMBzZyYGxWhRrvQPPX
 MHG6nzldflkhsa/3vf7Xb4m1dhHnJhTt3NZXzDVqGIRR/oha4SMXve+lofA9Eo+dvYw1dw/6RCH
 3EH4xQIvldlJ7udjzU+LSnN2Pgeg51kHxX6m92DzIKMbCkl9dX8RUFjFN/3NmcJwjxwpj/KqllX
 8xyl2dLx95ceT85ZlSmBifLk5MQkp2aDJJSXCeTB76ptAzc1YiIVIhh9iS1bSuZET4XQi8m3Bbh
 sJvcgUaArL7ivWLHktQ74yP/bMTszkVuJtAZfZIllSH+8m6/Jx/UR73rRfYK/K1TqljxOOnRUim
 Ktv5ZoM+vcuAOxgyhJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfXw/7+v+CsSHX4
 UxLl6fSJBwmFVbvUPyvreMJA57Oj3hNpFx/eXZ3lHOVC8txQDYe5MeDCtGTSpAzY25P4EDL7NFQ
 bPHGDpltOh8YVHTz3PzmbKHap/tewAk=
X-Proofpoint-GUID: aNa62Kb0aJPvTHCxT-OqPe1ATmGTVrHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040100

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Changes in v9:
- Use regmap_bulk_write for 4-byte header write in read_write_flow
- Replace while(1) loop with read_poll_timeout in lt9611c_block_erase; read_flash_reg_status now returns unsigned int
- Fix unchecked regmap_read in lt9611c_upgrade_result; return -EIO on CRC mismatch
- Add struct lt9611c_chip_data with chip_type and max_tmds_rate; fix i2c_device_id table driver_data to use chip data pointers
- Use put_unaligned_be16() to replace manual high/low byte splits in lt9611c_video_setup
- Extract lt9611c_write_infoframe() and lt9611c_clear_infoframe() helpers; consolidate 6 infoframe functions into 2 helpers
- Remove lt9611c_hdmi_audio_startup and its bridge_funcs entry
- Remove hpd_enable callback from bridge_funcs
- Fix scoped_guard(mutex) deadlock in audio_prepare: release lock before calling drm_atomic_helper_connector_hdmi_update_audio_infoframe()
- Fix probe order: lt9611c_reset() before enable_irq()
- Fix remove(): remove disable_irq() (IRQ is devm_request_threaded_irq-managed)
- Fix bridge_suspend() unwind: on regulator_bulk_disable failure, de-assert reset and re-enable IRQ
- Move devm_drm_bridge_add to after both DSI attaches; remove cancel_work_sync from err_remove_bridge label
- Move request_firmware outside mcu_lock in lt9611c_firmware_upgrade; lock only wraps hardware access
- Re-read lt9611c->fw_version after successful firmware_store upgrade
- Rename ocm_lock to mcu_lock throughout
- Use goto err_put_dsi1 to eliminate duplicate DSI cleanup in probe error path
- Fix mcu_lock comment to correctly describe what it protects
- dt-binding: add if:then: block to disallow port@1 when compatible is lontium,lt9611c
- Rename sysfs ABI doc to sysfs-driver-lontium; rename sysfs attribute from lt9611c_firmware to firmware
- Kconfig: add I2C to depends on to satisfy REGMAP_I2C dependency
- Link to v8: https://lore.kernel.org/lkml/20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com/

  Changes in v8:
  - Refactor lt9611c_read_write_flow() to take a struct lt9611c_cmd parameter with an embedded struct lt9611c_cmd_hdr (func,
  type, seq, sep) and optional data payload, eliminating raw byte arrays at call sites
  - Add LT9611C_CMD_HDR_SIZE, LT9611C_EDID_BUF_SIZE constants to replace magic numbers
  - Use container_of_const() in bridge_to_lt9611c_const()
  - Remove obvious /*read only*/ comment
  - Use unsigned long cast instead of uintptr_t for chip type initialization
  - Replace memset + memcpy with memcpy + memset for CRC buffer preparation
  - Add ABI documentation for lt9611c_firmware sysfs attribute
  - Fix Kconfig help text to proper prose within line limits
  - Add disable_irq() before cancel_work_sync() in lt9611c_remove()
  - Add cancel_work_sync() in lt9611c_bridge_suspend()
  - Inline lt9611c_gpio_init() into probe
  - Use of_drm_get_bridge_by_endpoint() instead of drm_of_find_panel_or_bridge() + drm_bridge_get()
  - Return error if LT9611C (single DSI only) is configured with dual DSI in device tree
  - Move HPD status read_write_flow call from IRQ handler to lt9611c_hpd_work workqueue
  - Removed second lt9611_reset call from probe as not needed
  - Add struct lt9611c_rsp symmetric to struct lt9611c_cmd — both embed struct lt9611c_cmd_hdr
  - Link to v7: https://lore.kernel.org/lkml/20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com/

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
---
Sunyun Yang (2):
      dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
      drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

 Documentation/ABI/testing/sysfs-lontium-firmware   |   10 +
 .../bindings/display/bridge/lontium,lt9611.yaml    |   18 +-
 drivers/gpu/drm/bridge/Kconfig                     |   18 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1263 ++++++++++++++++++++
 5 files changed, 1308 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>


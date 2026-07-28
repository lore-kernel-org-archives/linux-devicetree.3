Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F793446A6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236975; cv=none; b=VxdybRj1mrZxbre7rO72zae+H9omznlclX04GH3JUoKoMcaOWNZTODZNlZ+kvwCUVTFLWGKDyX7zCsByyxKwNCAvRklEkVOmVwUeAb+TX6MCuWpA1tmzDz+zGN0y4PFOZvVOsHDt5f3V+HWFiKYfQxw5djraXzC9bpQnYZzn/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236975; c=relaxed/simple;
	bh=LqL6nxSKSNxt5xf241M8XcRfDVDuH+gmjSBM01PPXKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DUxAD2/Kszm5MkAh6wTON8n50ty0UEg1SXfJGY8ZJNocbcdCLESzbXPrhMR9qMqJoK/ewL00FLxiPeZmfccetXSnQxTsPoWWG7+eO6D6L7Wuxbp5yyKVQgdCrJgXgP9Z1T6lyIw5oeBWapZFa1qOFK+DPpNfbMNup8gfFxlnLNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ob8AeooM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gu6ypNS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ob8AeooM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gu6ypNS8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgRHt3673375
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tBo8wb/CRbbdQ8Ep2ufGkH
	07kOzi2UnxSVOeiMv3dFM=; b=ob8AeooM9e9rIey6uGx6NOjO0w7iHcK1jWrCSm
	94EF//pmxp96mYDbwQ0kf68sArNGB3KtxhAuCI1wtqKgT0rpkTeHYEeFMgk8SzUw
	jlIXDEDmAVSrgk4mperMbL/QFxVIOGJ6TAYRc0A4ySpQPsFfxyUJOCtItFGCc0E5
	D2uNVtN0KdJvw0cce8mQ1N3NIieBHRRLwVHC+dCJjzRXBc0lUlEEzJGSL9JshFp8
	lkE0H7VAliuMoPgelkU2l+c6i2bPe7kXZWh7hPCmRnx9jtkgQgnLb0rVU8aIgUvO
	my5KZ2U3OvNRWB26vxD92uIaYBawXm37oID3+S/9oS8Xz9yA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5ky2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:09:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso66797075ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236973; x=1785841773; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBo8wb/CRbbdQ8Ep2ufGkH07kOzi2UnxSVOeiMv3dFM=;
        b=gu6ypNS8D+BelWEpX9moyY0WhebIsbo/2KneVNwgEpTUwxmmyfocTkSvJeRo2AvRRC
         L3uFh/WfXdebM9lzxLxWBvGtvGZuIHUkp37+EPj8zR/5iLlHHQHYX8sSBVokB3buBb6b
         zhxovK5GhvR3ZVaSrAuK4QgB3LYtx2bHNw68l7uOKuD4HaLSx2/qdC3kGhj2JyQjGYAo
         WLFWQkMac0QcoqcbaegE0EPYGTOm5Hz9lhDOebrbUXp+VXXYW2rQ4le6tgcIiCbKUOGY
         NhQnazqtBulmLdIdjycyWuOkgByO2FGux6ymedaDA6Cv/WT7Lx8vvviTHZ/JiherIdT7
         DKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236973; x=1785841773;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tBo8wb/CRbbdQ8Ep2ufGkH07kOzi2UnxSVOeiMv3dFM=;
        b=avjZ4/i6EOxPELfOoaOHR5kmXdgXRebgz9FnyIbNLK7LxZRjtU8Raf4wcFjPbXypJ6
         G7r+gWMVZ+ejL2NMA//z9lMD+tJV5UEhuV+T9BxMB22gFtxvMK4bJGaN2Oj9UTerlYl3
         ywM2t8z9VE3IPjFQIVPljUSnto/rVh6LPTVf58BkOciz9skyFHdhq35NVxDwVR1IUVy+
         Zho+yv2zxiaXP5SyaqxskTAXkJCLWA1eR2rnsUPLI8bCVQiZS8rqNfEYLBnK543NSwBG
         dumqYnncR0yWb1XPpVlMLd2P43R2N4B+V4Lh2exUnXXrk76w15UJGWDR5F5LOdU6+pSP
         rBeA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1NMIj9KMnlCrjZey2WI7w+X3oegnLUSP6XLfXzVNtT3QaNqs2gocYvvvnNKHIrwA4zv/Tzc1sAKxN@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7yjFlXI4kxv38TL6dgHP4cZ48HZmtknnHA+Rjb3LSfr2U9ZV
	TK+D7ycx1GdSWmE2nGp9C75AOYS3MFPGmafCl7vr0ztZggOOWibV/5wxOgIgeQ4dpAVvAoJjExw
	+nc7Wk75Ys4AwhJ7nhbPL1+P4C7jJnUBJMX2wBxs0atrqKY8AWQYwCZLHXUrRlGWc
X-Gm-Gg: AR+sD12hYf177efF1Ira34dOb8JNr4RCXX7416LgeWbfnaZswl0gwb1OlGhSz89/vDS
	R7MaSt5QSa4X1nwWcUHWe/ycXCb2ch1V7dT5JiletzSvMNkNXzJy4A/u6b2FKk/5SDFh1YfTi2Q
	8glP/fasMeU9pWzgocDHGqva8FBm8X+TUmez+CHCvt3CeIAUieSyXEGwOTbC7JUY4pFpPIExOgO
	P99fXBw+RcjAWytRN2wCNYPjFLUEe0wSTz0iMcJHDNvFjEuEtHvEEN/e1nltR1pEDHS0lBNtyla
	vLMYwiTYhUdDZVPjbazr1Jdw1NwnZHd6mnJGcvJanw4/DiP63cZch5ReOR/+qhM9MF6euvWVNLO
	0jD7amYvVAke4Kti1L0s52drQ0Q==
X-Received: by 2002:a17:902:f64a:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d015a2e99cmr23508625ad.1.1785236972954;
        Tue, 28 Jul 2026 04:09:32 -0700 (PDT)
X-Received: by 2002:a17:902:f64a:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d015a2e99cmr23508085ad.1.1785236972475;
        Tue, 28 Jul 2026 04:09:32 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm50292145ad.39.2026.07.28.04.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:09:32 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v8 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Tue, 28 Jul 2026 16:39:17 +0530
Message-Id: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN2NaGoC/02NQQ6CMBBFr0JmbUkLtkVX3sOwKKWVGqDagUZDu
 LsFXZhMfvKS/98sgCY4g3DOFggmOnR+TFAdMtCdGm+GuDYxFLQQVNKK9NNJMKZJlMRaKZqiZY3
 lFtLgEYx1r112rb+Mc3M3etoMW6NzOPnw3r9FufV+Yib+xekokZyXih1lya2+eMT8Oate+2HIU
 0C9rusH6aFcsb0AAAA=
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX7rFfaZWEvXaj
 TrLKEFaa//rXmbeRLLlEn0Jdhfiv1c0Q9dXSFLPKTzUVnjQNMLJPyGfDeeZSM6vpkZIGr6I0lTw
 vF8wl7xFcH+MskIg9J/xQLIjKeK/ICw=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a688ded cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=6-6V_qJyiyBno9EwSaUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX+RWE8a2HcOAs
 68vvgGwx9gthvCtDjdTOBbMMfwqqGQfh3W1mLGTRLa43BbPO7sM68Vn+vLWhdf6/pVlucRsKxgN
 Eo9SPobHdF58oB33iGSvaqBFSsSt+maa3eilxXVC5loxMjLh5uAbyCZxeLu+ck1BTxPYtWJIfni
 vJpreNkzSIvOQp5XBkpEkUYcAW8KOopNr9Exycz/xVQe2QONRWlzsHAZtxnCIYJo2TrcQWyrUXh
 zXC5oLK4JGr5GDEsJp8Z9THxlBgPUsB63SXrABfUMhZXoxOdnkzN/P5ceCGVnNDz4tPF2PK1j77
 KQtjEX+kBegNjP2VZJbDnPPCMt1OiUP73xlA/nppxQzzhZdx2T47eztwQx7ik5i0NSGTwAAABiT
 f7EV6zH2lF8vjhRjYeyD9wh7z1YxdWNQJrD6kg/gZadoQHrSSRK6rDdnSjkC2m/nk2euf4YOkO8
 Az2LOiU6veX3yiCGYOw==
X-Proofpoint-ORIG-GUID: 4Gv8MmfWZjL7mMBOmzVuZ91mxiMZwRjx
X-Proofpoint-GUID: 4Gv8MmfWZjL7mMBOmzVuZ91mxiMZwRjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280098

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

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
Sunyun Yang (2):
      dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
      drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

 .../ABI/testing/sysfs-driver-lontium-lt9611c       |   11 +
 .../bindings/display/bridge/lontium,lt9611.yaml    |    8 +-
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1344 ++++++++++++++++++++
 5 files changed, 1379 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

